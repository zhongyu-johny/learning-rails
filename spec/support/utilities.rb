include ApplicationHelper

def page_title(page)
  page.html.match(/<title>(.*)<\/title>/)[1].to_s
end

Rspec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector("div.alert.alert-error", text: message)
  end
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  cookies[:remember_token] = user.remember_token
end