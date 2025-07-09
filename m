Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D92C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt1tyd2V2XXog5654TpX5Ey9biqwEwVKUDOprHna+xg=; b=MYMy1jY/M1VmwkRc8+s8fqNLWl
	a3tEXszgLUmfDOSG8NjYtS0ez8DITjiuDKuIbdg1oubhqkQXSBbC8a2pDia6qyibxVRr/dtHyIPGQ
	FnYNvgbTK0b+JFHst3kEjhceJP4Pjk59B5QmUWgwrpNAqLeFRjo0vT54rahg6qQHisP51O/mcCOiB
	DVuELTghtdiOKhCg3N3K8yrjuovuJ7bjwurwHzuyChpsKlGYJVcmNqXWSJb4Lbe19SAtR0kmRUAQc
	R1NjvIc6j0AMx5NBUyNrOh4A7UCMHHe+SSJ7fe2C6h6iqTQTbVl6j15nSoc0LZwyxxCJWYRgD2ZT7
	Hkazxxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP1m-00000007mi2-21YW;
	Wed, 09 Jul 2025 07:15:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVf-00000007hAF-3lTh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-454ac069223so3144925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043346; x=1752648146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tt1tyd2V2XXog5654TpX5Ey9biqwEwVKUDOprHna+xg=;
        b=dOR0loZljoG6sjlH/WqBXSmuyRCC/KCPXHDvbM2iYdM26kOYK1UMlzEc7nh66IoGHa
         S6Oni4p7VKi6CFr6hS51VpdE+qWuuNtLbg2k7lmkLt/q5XTmrgo1hTpOG+Sw3cbWGOe3
         ezfpIM2ytwKP7MhhkbQ/JYXkHKWqv3jU9JGs1bOPs/KaOxrj1sYRZg+4+gvCHZvPJxGa
         FyJ3saOwWPTQMfQImFPnRsHpgBzq7PYr1/qimCf6RpHZOhfOlH9CQXtCxCqw0RK7GC7L
         TjUV4Jk9zMFJdmQa7vLYTuCAis3/udva5kxRZYmQh84JePlwfg7lbh37wEWsZlqxowHU
         ZuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043346; x=1752648146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt1tyd2V2XXog5654TpX5Ey9biqwEwVKUDOprHna+xg=;
        b=dRo/6mUJuXdHxlcQ+pF1KfWv7I/EFFHuW/i4s6KmAaZshBoZ1phRu8l8zmhmi8Piwd
         t6830HtJ+venm129iIYg0/AuT2tyamnXJxSODWKYFX3Ec8RZ0xcyZO9ySloQ5+j6e3/a
         cNvb1CEKJ53LJ2G97ycIHWz7nWJON63ehWy8GJdIJnd6dbtI6ZriSoNDrmdel1YJzd1d
         RXAzUtjepKu7JAfrE11uj+vi72Q7Yl+iUiR8CxnoxNTiJ9ykjcnb+LNVZApqAzeYSB7F
         mXVhbeVMjABJquB6rNcd1yiDEnONrj3jZ1DdmJ/q1XyyLYyfDbNI+ifq6CeM0b6+N7CC
         ymdA==
X-Forwarded-Encrypted: i=1; AJvYcCXEzXB73APTu7YnWLUWCLFXbtj1+NSytokk61z2jdkFibXOxlZDD1k/cIiR8P3/+VPueiXuywfENJqBs+jKRe+4@lists.infradead.org
X-Gm-Message-State: AOJu0YxOPi811T8UO4/7vh9qvTtYcSDmy94Eb+Szj2D6elSHYFGbYxZa
	ft/D2Lm8eBprAdjPlcfsMCRKenCGTzNfLX3qaYX+oi1G1l/vHO8CocxtEX52e0mzP+I=
X-Gm-Gg: ASbGncvL5QYrGGp/H8+Ap0DJuCPU6k8wnyg95wSGEQ+hc73FrmtucB5f0IRbYT2ei21
	PiXy3m6S/5oDx8oCpHN1VZLr2yFjQGiZ1/vlUTWIhWO0fHh9yb/IYGZYSq3OdJI0l+1INgrw53y
	H616V9cDhdoVCo6RiP73yxEvD0BIKs5aEjupK2fcnn0Szu6elYF8yXrBZ/ExvqM5M5/35xHP6wo
	fs7UHnVIJNf8f3PdYS0T2P80p+JDmWAEzZhJx6d54vfv4fIV958kjcxv6rmliWmh+jMcASkUnty
	sha+lQ1yYMCF8wQnAFWThursEPuHDYmMRxjRrKtngpsvIiwyJGgUZTdb
X-Google-Smtp-Source: AGHT+IHva0WhsywPttvRU08VnkKxXmjFcSCyLgh8W6d6O8qcvJcHST/EmQCRDTaYU3n47c8S3YTiAA==
X-Received: by 2002:a05:6000:4609:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3b5e4494f5bmr774417f8f.23.1752043346514;
        Tue, 08 Jul 2025 23:42:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:47 +0200
Subject: [PATCH 10/19] gpio: xilinx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-10-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4caU/UjNpZ2IdQFhAW2jpXfCzjS+1Tfp2bEeZ8+cvyg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CVnKQXMjtdHRDVguAejNFTXbTNXD8l/Kmb
 0yg+RrFm7GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 cj5REACwOuns0WEq0gVfyFbzUJNtcYG3dTU1bFvtejpjQepJyTQ1QVwtA7TBbJfH+O+XnX66gtB
 1OfiIS2FNuQ4AHfxV7LboTF5hI8KSovydzIXZg5qSF9IVe7OpRxSPxNGAUCqD7lTfF33Cd90Q+c
 n0qSysZ2b87Crn+IKtlo4DpvhLae7AJvMItX+RB2jkn+G83L+aT7js214EuUz+C1tpIdj6n1ekb
 UNuybnnWCYASJ4Ow7ISTsfNiGGUDC4Yei49l3VVhUOBKtzyE5zMv2GxaS9l8FwpCxL4rHX7HzbL
 4t1ImuQA1UndA2UraMnoztrqLX0djej2yBwzwo3wTM53dwpWXsj7Y9JgOaBq8ylLmEVbtelV5pD
 riyAIpKwyvYawqYtwrQTOcNf0oRvRHMhCmMEW1QfqbAQcCEn7XXBF78kjj0nOKdYaijS8rXoAaY
 h2exh0E957oSjVG8N8BKMESWJI2IN7mdfWBf+8f0zr5kBc1xSVSpD8i4WevQZUI3E2/zfiOQ3f/
 I+cojRdDGefvTRIfXENlElRktzK9hA8a0pqrYUXXpGfZ84t5gVthoflduWApAuOF9Z+7RQtr3XJ
 Db3DQhlSzuuHlw5Y4uKbvj6NPvmJE2td0L4cqQTIVWrx2MUS0zuONDQ38BA2/GaLU8D/aOapH9E
 HkWM8Bc5jI66Ulw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234227_952677_A5FEB38A 
X-CRM114-Status: GOOD (  13.81  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index c58a7e1349b4b226057c6d045f901c7fea5da449..aaaa741179805d54e1cd1425579eb52a3579d6e5 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -148,7 +148,7 @@ static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
  * This function writes the specified value in to the specified signal of the
  * GPIO device.
  */
-static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
@@ -162,6 +162,8 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_write_ch(chip, XGPIO_DATA_OFFSET, bit, chip->state);
 
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
 }
 
 /**
@@ -600,7 +602,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
 	chip->gc.get = xgpio_get;
-	chip->gc.set = xgpio_set;
+	chip->gc.set_rv = xgpio_set;
 	chip->gc.request = xgpio_request;
 	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;

-- 
2.48.1


