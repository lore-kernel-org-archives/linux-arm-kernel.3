Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34957CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=; b=M57+ZyGlIxaJDZp6ZmC8F5LlUe
	9OaEY9JUISNIIcvI1B25eImWc+o6sWpjiYaV8GGB7O0ftUqX5LZBOCfXzbBfQ6vPhX2VFuI4rwUgH
	tdMl8DAAfvgEnPAnDQiP3dP1IXHImCewbNaNlyjtmwsm8Yt7e5ky8JDahA5hWytr1twH4Vj70Ig97
	rn/9DyPoHhwLkE2yWpa2nvlw9dWwgDtWYs1IhGWpviLxSGQOyy4uEqq2xNneo53PRAvd6T3b70Nxn
	1x3frrLvugQ+XzyfzVb+ehnlLwdgKj6L37JauYezNNxBh5WD0lM+tr5IkPIBtwKJabxnwVTW4m80j
	JJer0ZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWGO-00000008XlU-0oRQ;
	Mon, 11 Aug 2025 17:24:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU2N-000000087ku-3T99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:02:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-459ddf83023so27150845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924530; x=1755529330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
        b=ELj5M0LwWWT+RlSD5NwEckubfO+euxDByLWnhhYerkf1+97Jr6fRV0ILwavGKhhXqc
         7l9SuFZjtDbsK3b4k0hgQmFOGnugDHhc+iVfgjiSs8G+XKasD0yVxaSMpSlt9bZsYaTF
         XTpUg4cvZRo9M9SPZ85UHur6aspXJ+y0yNnmfVrqnkVHkXuh0sDI9lkD0gloNwzCEMMI
         PsbwCvi0uVj0DHlCVXN4MB3VuVR1wTumjsCQPxwRryQafKwTNacI0Xsd3+eXvW4ixwo0
         zjPXjFE7pF1WzWpSd1vPMHp7ddxQrLfmPynA4o3Fl6zxym3+s5z4QySX9/4/ofXT2tSF
         04cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924530; x=1755529330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
        b=dUyb1EujAFiXdrlekcYg/Age3uR4tZYtLsDGWbTr6hGS0k1m4yPE7yFMoGcfwwuBHC
         n6tih9PAwiUdRPtFQQeZ9zg3fqEKCW7FwHs8PyDxOBR/cJ75K/x7W8EmSh254kstqpWv
         vcshz0woeLKoiLwfmoUqYLjxNPZYLx6D/RyzM/P7nUs4KamWtFln+Fmo17aThMjIstwY
         c/9Y00Vi4pRJYQIiAUfO7XMivOVcbRHrEceWv2HSZXUrLi1sKVL43+/tj7wHuSGV81b1
         6EUL62/B8IY5OBVDU1mkTbe2X6rmGAZVwylWlOGupCBk6M5PA6OdVRcQ91aDnJsb42mc
         Rwwg==
X-Forwarded-Encrypted: i=1; AJvYcCWVxYaWuhXbhGVwcXGemxKiP5s5NUgqqA25S7jQoHKAGJBaXAc2CpVLcFou6yXhKjbWDbAEUugQp+fW7Fm/s1fe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6xc+HaixppzmKfgwRn55NsayX3XfAJtr9TE7nWX1sy9JsNMYB
	cUF7mUxGDm922SpZurgRg/UHxYofeohS/HPZCjnMhYJ8AqxeG/e4dGJ0UsetPwPOYmg=
X-Gm-Gg: ASbGnctAVVrtcIzbPGbdjq0VwlmCHB2poE2muRu9CSWzfbxS2JFlsEWqm/C0FXThyAq
	S45UiwM12GRWeLet8P4Ec76z2sDDMC+hKc9YW8jdkjirIfNGitsZtj+B7ZQ63z0hNgEwXW4zjfF
	GwNffYbKtLMHH4Cp8uv4tLkXLUlds6JPt0KVGpzIOaTOU4H4JKI0PCPKD0lujOCikpQEB5nF+ut
	rYDugtb9aPwCNr51qnMA2CesG3VMxPCBcr+aXwC9GYKW2zXoBfDQG+pgyj1YxuHG4SW9cYSw4dj
	YG7uPk24VmFwmumU1P4ogmDrfreUOfQ3fP09dX7T3aH88wB1V/0xS5cGItn2BpN/nAwmNs1VkPV
	+pIr8YsaxvGz9geG7
X-Google-Smtp-Source: AGHT+IGuRkJqXSehCHbSdsJW5I33/Fn2ULOWbTPFQOZm6vceKVH1dj+vd6G7mjfXDQfCQnwSEMY/9Q==
X-Received: by 2002:a05:600c:6286:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-459f5687c58mr137162945e9.30.1754924529892;
        Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:01 +0200
Subject: [PATCH 2/5] pinctrl: equilibrium: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-2-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8Yc3Q+1qQoLBEOdwvJ5ov1cATZZZnKh5I0syYOGIftg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXt7zodHeDBKguKwa7IUu7mcb1ZhND7UMYHE
 Y3heyY/C7KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ctoEEACcZAO8D6d3VypQQR63kLzYUCVUIk8a+J2FDJHx39O6IWus2qEipgONFpBz4wzudLzRqo5
 uTDCIgtDBb4+xJv641uKV8GWW3kJDVL/zaEWQ1Cf2Nf+yZvVNDEpUvV/VHI1d5FW0zgB7aatJkD
 kIfjKQcNA9wAf3mrbhjOWyi8dGvn5t3h1GxP+h1zpkki5kt4wDiJiXKnh++Ff4Ms9vMsQHUAVi6
 Fag9N8dquoInaui2BKJA/kw8qg7mJUwafO9F+/3tIV7qtJ95GeT2HIF/UXJkfF4TmmkN89PxnHc
 97wGuk/NY91jcfhI3KJj/hX34dOLANgeSYSH7c+Tpl03qrvmhQMA3LYu9Saa3UeO38Zj6Dx/3zg
 RazSoMS1zXdV+ejLnGNXLXtUtNXfk4H3DYEaDL7AlIHaaFLk1Lz1TZK0Wld7XemwDSyeif5/wY0
 6jl7HI/GWCSq/YKqrUqtnKVbK6TX8vHIEWYhS11f9U6maRkQTH2dYj8xa24n85cmVEtwKYsFv1R
 WO7dmB3Fh6fEzDpmTeE4q5VclBBN7g0ryWyWTw3Tqz/jegXUkYHK+3E9ygCq2v9KPTWGDjbsETw
 sFh/2j2L3ozuxpUBA9WEzEKEfGXqVs89vl0sjRB3eXyg2Do+3VVbsLLwztT5sfHuJ7xhq5Rh8kP
 4qhIiw2vIrQy7EQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_080211_874993_2ECA32C9 
X-CRM114-Status: GOOD (  16.36  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 26 ++++++++++++++++----------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..210044185679384d03278e200d8f7723324487cd 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Intel Corporation */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -179,7 +180,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *gc;
 
-	gc = &gctrl->chip;
+	gc = &gctrl->chip.gc;
 	gc->label = gctrl->name;
 	gc->fwnode = gctrl->fwnode;
 	gc->request = gpiochip_generic_request;
@@ -191,7 +192,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	girq = &gctrl->chip.irq;
+	girq = &gctrl->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
@@ -208,6 +209,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 
 static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = drvdata->dev;
 	struct eqbr_gpio_ctrl *gctrl;
 	struct device_node *np;
@@ -239,12 +241,16 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		ret = bgpio_init(&gctrl->chip, dev, gctrl->bank->nr_pins / 8,
-				 gctrl->membase + GPIO_IN,
-				 gctrl->membase + GPIO_OUTSET,
-				 gctrl->membase + GPIO_OUTCLR,
-				 gctrl->membase + GPIO_DIR,
-				 NULL, 0);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = gctrl->bank->nr_pins / 8,
+			.dat = gctrl->membase + GPIO_IN,
+			.set = gctrl->membase + GPIO_OUTSET,
+			.clr = gctrl->membase + GPIO_OUTCLR,
+			.dirout = gctrl->membase + GPIO_DIR,
+		};
+
+		ret = gpio_generic_chip_init(&gctrl->chip, &config);
 		if (ret) {
 			dev_err(dev, "unable to init generic GPIO\n");
 			return ret;
@@ -254,7 +260,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		if (ret)
 			return ret;
 
-		ret = devm_gpiochip_add_data(dev, &gctrl->chip, gctrl);
+		ret = devm_gpiochip_add_data(dev, &gctrl->chip.gc, gctrl);
 		if (ret)
 			return ret;
 	}
@@ -499,7 +505,7 @@ static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 					bank->pin_base, pin);
 				return -ENODEV;
 			}
-			gc = &gctrl->chip;
+			gc = &gctrl->chip.gc;
 			gc->direction_output(gc, offset, 0);
 			continue;
 		default:
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index b4d149bde39d8dd08a962bb05ccf026364dd9f68..b56124d7fe9132c875d2768b0af8b939f1a4fbf8 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -96,7 +96,7 @@ struct fwnode_handle;
  * @lock: spin lock to protect gpio register write.
  */
 struct eqbr_gpio_ctrl {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;

-- 
2.48.1


