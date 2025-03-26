

(defun my/tangle-config-org-on-startup ()
  "Automatically tangle ~/.emacs.d/config.org into ~/.emacs.d/config.el at startup."
  (when (file-exists-p "~/.emacs.d/config.org")
    (require 'org)  ;; Ensure Org is loaded
    (require 'ob-tangle)  ;; Ensure Babel tangling is available
    (let ((org-file (expand-file-name "config.org" user-emacs-directory))
          (el-file (expand-file-name "config.el" user-emacs-directory)))
      (org-babel-tangle-file org-file)  ;; Tangle to the paths defined in config.org
      (message "Tangling completed: %s → %s" org-file el-file))))

;; Run tangle on startup
(add-hook 'emacs-startup-hook #'my/tangle-config-org-on-startup)

;; Load config from org file
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "b6269b0356ed8d9ed55b0dcea10b4e13227b89fd2af4452eee19ac88297b0f99" "65057902bcd51d84e0e28036f4759295e08f57b1ba94b9ae10a8d5ffde5f154f" default))
 '(org-agenda-files '("~/orgfiles/todo.org"))
 '(package-selected-packages
   '(spacemacs-theme treemacs smooth-scrolling magit yaml-mode swiper use-package rust-mode monokai-theme monokai-pro-theme monokai-alt-theme lsp-ui gnu-elpa-keyring-update flycheck counsel company))
 '(warning-suppress-types '((transient))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-highlight ((t (:background "salmon" :foreground "white smoke")))))
