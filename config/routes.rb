Rails.application.routes.draw do
  post 'users/social_auth'
  get 'users/social_auth_vk'
  get '/privacy_policy', to: redirect('/privacy_policy.html')
  resources :push_notification_subscriptions
  resources :events
  resources :costumes do
    resources :comments
    resources :photos, only: [:destroy]
  end
  resources :cosplayers, only: [:show, :edit, :update] do
    member do
      post 'subscribe'
      post 'unsubscribe'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "costumes#index"
end
