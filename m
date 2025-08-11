Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2165CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=; b=orDNz1S3I309i0+W3ZyT7FAZjm
	QEykfe370vaN/2GkhTG5hrNGxlBFgvRHiuGBlroLb4CWDK8m3WaMrqfY83XznnRtFH5bUIU5kQSOK
	QyEnzTernnIGAb2tcZtsMbQ1Y9/VCHBYuThtYKPdV66fFl6eLt5VsGRZ2gTMx12LJ7eb+TwimxdIj
	hMGMA3ZJyr0aI1mAlyLW2K9NqKnYxGqrVYUiaawVs7xvZqIT9ylJLMrsCJn77jLQaI93Bhnsvl+e9
	/ZCbNys+/MxRcJZklyrXcjwcPghguPaKhwqBKHqfjhFlifsOpylM28JKe1Rr15brkFKDwf9ruC5v4
	W7FXHA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWO8-00000008Yt2-2vGW;
	Mon, 11 Aug 2025 17:32:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU2S-000000087nb-4Akl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:02:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso28488145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924535; x=1755529335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
        b=lWsZ0+7p1fHnQE8tEKa1HExxu+8UuyJXWnsL82WU/+mMwz0BKrYz8WNT3jycB513dx
         3QY9SYqUiUenby2ApqNYUiNnvfxO+uYeBGi5Zesdxf0WDxJuagOzx4swPmokCplJPK0b
         45tqwz2rERm1D48BWPdqUN5apfeN7Q8xaTP+PCn/W2Wh2qq45jULHe4fkGAwA6tNKluV
         4FsrNsDZhM/GNs6HFV45qDDya2ZRjhmexROh5h05eUfz718jV7jbBnmku9wtgL/iZvbc
         TDYvDLBopOVx0A7limQ7hrQIQJ88np7qGBjgcR0K4bW+0gSS2Kcush7usW0Ffs6xC49M
         weNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924535; x=1755529335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
        b=ae5v4ZbUxcXJOS4dkHwGk4ZETMKHUZxv2S6Tlxdv9W5r0H1idQ2BaP60TEbeGAkqJK
         c/TwHzJmYEzW2eZGqdfefPqdYIznqbjiUIoRbkoNxqYBgO5THCrwZibxX2ogGivZQ1Wk
         xR/7HLKuz+rR30fQ6zDuW3qLQMRACcpFIzhxDtuNyzGoDJ8YZSPgjDwAk0Jw6saYUKVL
         R66qjMCDE2jJ2sUJiVb9c90ui9Qr7n934DiE8HfRB1xu6qF/6gY23vxe+m7mHdhsLs1+
         2tBWhcYIVwq9ShOKtoEkFsP6LU134VpswL4Am9hibkQbNCcV8cxx+KnS1lKCO3Xmblzd
         wxKw==
X-Forwarded-Encrypted: i=1; AJvYcCVIvDFgo1Wskg+RwRcct4t1kFgFXKB1fDkSATW7M1OXhF98GCPeoAu7HM0imtbICM+FldOsJ7Yzwb9yKStetScd@lists.infradead.org
X-Gm-Message-State: AOJu0YweiDITssFDy1WqXmtEiof0ucv2Se5HBt9PNDUTgPlgZoE8nLld
	86R579N1pfrhIs6gdaB+9YlSgwM1atfrg1FGpdyGc2EI00PJQcUcUmSvjcfwf6m4di4=
X-Gm-Gg: ASbGnctYqzdrXqZhIsnoY6i1GejwjwTEi3MgE8OaVHPylwqCm8mBlycsynOR3PFqYWM
	v2Tmd5nNBQkbOvW7gJMWtTKeCV1XOqUd+p90BCt5lDaP40tXGLnBd0+kTbkhAue+/pDB9Z6A2Ev
	7cqkoPu1xPNnEKGis25Fe/Z3AQ8URF3vLTVjdDv7+C81yZEe37EmGCag5IU0xACszJYNZUCzvBT
	WCq2KS4hmBSGusrv5L651mSIqgabzJu6zOB141FnQOcY3h6Iwm4nFZlIdJ6KFMGIgvn7ymGjlMr
	0e8cnZQOsCAgb/tIQf6R0+RLhprysVBbJhn9a54xncfYVkJ39oA5kLEPB2plzdkb/m+tBChKI5l
	ZYI41CEYcBI4+jxkI
X-Google-Smtp-Source: AGHT+IFiSDH4dTGzeIV+hH7h6pQJ8LcJq0Po1XDJ2GeMsEQEPO5rZY2CszDqq2FuZ2ThQvFn+PGHwg==
X-Received: by 2002:a05:600c:35c3:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-45a10b3a3edmr905615e9.0.1754924535221;
        Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:04 +0200
Subject: [PATCH 5/5] pinctrl: wpcm450: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-5-a84c5da2be20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuIHwRskLSRbzwrVaTM8WNQE9cJKBQppwXKNoQVeoEY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXtHEGmnbFBea5WN4RyVzy/ytLzLC9kh6vxq
 DDy5vP9Yv6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ch1FEACHNtA8UzYfZDTsRXPIaEfNVsIe/A7suWXcUxzJAJ4wCZsAylvzKkr4JN0hxegkQstolf7
 cqpnmT7yqQ1Qk6wcPN9hZ1SSYHmIrwvaf3mTmEloQV38NDiIm7IGi5WF2anqrWdsXNN3Fqw/Z03
 JdjyJUJ5kL/NyHTWt2wSuJS5hnvdvWygpCfSyzgVrSoOrLyFbcGlnT8I7BNO6P5D84sFm2wi7Jm
 mxORKa6aTz2hN16G9QVmbIatahVLcdG/fcDo/fqSdRfrFH54Sxws3Z1yVZiKcrsVWTD8E0xcIfi
 ah2zKGomVba+cXUDEYljd/xpKApsmMZRcMI7JjiZFjYoOXOGWQk/y66BEo7xGO5cm2Ek7E1c3vb
 cKltTFPFOiJa2IZQm5w2yvy6lA08elwimHnGHoWhZVIzJN/i3zKfcAYeYcM3+Wzv09D9vZIDGa4
 c2jq8H6LaAp67sWaKXv+xE4ZtQpaIDrhcTNQE3EvPDga8ATKWdhmZRx3sX9eaKFUiSdAskTrsxq
 Dr99n5NoKjTUCBXAsZpDkai4eXAliRMhl1omn+dBC7Yu2SOBy23wHHP91AJIGRlZt2CTyMq+9/z
 rvhkL4YUd2ZQIdIRTAOUqWRH/1+EHDZOjJGT66N8dJzDfMyUk55wkaiNTKtvBxo3NxRUbinLL7M
 rPWbiSQMV59HkEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_080217_055281_FE9D2771 
X-CRM114-Status: GOOD (  19.82  )
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
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 44 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279..4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -11,6 +11,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
@@ -47,7 +48,7 @@ struct wpcm450_pinctrl;
 struct wpcm450_bank;
 
 struct wpcm450_gpio {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	struct wpcm450_pinctrl	*pctrl;
 	const struct wpcm450_bank *bank;
 };
@@ -184,11 +185,12 @@ static void wpcm450_gpio_irq_unmask(struct irq_data *d)
 }
 
 /*
- * This is an implementation of the gpio_chip->get() function, for use in
- * wpcm450_gpio_fix_evpol. Unfortunately, we can't use the bgpio-provided
- * implementation there, because it would require taking gpio_chip->bgpio_lock,
- * which is a spin lock, but wpcm450_gpio_fix_evpol must work in contexts where
- * a raw spin lock is held.
+ * FIXME: This is an implementation of the gpio_chip->get() function, for use
+ * in wpcm450_gpio_fix_evpol(). It was implemented back when gpio-mmio used a
+ * regular spinlock internally, while wpcm450_gpio_fix_evpol() needed to work
+ * in contexts with a raw spinlock held. Since then, the gpio generic chip has
+ * been switched to using a raw spinlock so this should be converted to using
+ * the locking interfaces provided in linux/gpio/gneneric.h.
  */
 static int wpcm450_gpio_get(struct wpcm450_gpio *gpio, int offset)
 {
@@ -329,7 +331,7 @@ static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
 	for_each_set_bit(bit, &pending, 32) {
 		int offset = wpcm450_irq_bitnum_to_gpio(gpio, bit);
 
-		generic_handle_domain_irq(gpio->gc.irq.domain, offset);
+		generic_handle_domain_irq(gpio->chip.gc.irq.domain, offset);
 	}
 	chained_irq_exit(chip, desc);
 }
@@ -1012,7 +1014,7 @@ static int wpcm450_gpio_add_pin_ranges(struct gpio_chip *chip)
 	struct wpcm450_gpio *gpio = gpiochip_get_data(chip);
 	const struct wpcm450_bank *bank = gpio->bank;
 
-	return gpiochip_add_pin_range(&gpio->gc, dev_name(gpio->pctrl->dev),
+	return gpiochip_add_pin_range(&gpio->chip.gc, dev_name(gpio->pctrl->dev),
 				      0, bank->base, bank->length);
 }
 
@@ -1029,6 +1031,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 				     "Resource fail for GPIO controller\n");
 
 	for_each_gpiochip_node(dev, child) {
+		struct gpio_generic_chip_config config;
 		void __iomem *dat = NULL;
 		void __iomem *set = NULL;
 		void __iomem *dirout = NULL;
@@ -1060,17 +1063,26 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		} else {
 			flags = BGPIOF_NO_OUTPUT;
 		}
-		ret = bgpio_init(&gpio->gc, dev, 4,
-				 dat, set, NULL, dirout, NULL, flags);
+
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = dat,
+			.set = set,
+			.dirout = dirout,
+			.flags = flags,
+		};
+
+		ret = gpio_generic_chip_init(&gpio->chip, &config);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "GPIO initialization failed\n");
 
-		gpio->gc.ngpio = bank->length;
-		gpio->gc.set_config = wpcm450_gpio_set_config;
-		gpio->gc.fwnode = child;
-		gpio->gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
+		gpio->chip.gc.ngpio = bank->length;
+		gpio->chip.gc.set_config = wpcm450_gpio_set_config;
+		gpio->chip.gc.fwnode = child;
+		gpio->chip.gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
 
-		girq = &gpio->gc.irq;
+		girq = &gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
 		girq->parent_handler = wpcm450_gpio_irqhandler;
 		girq->parents = devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
@@ -1094,7 +1106,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			girq->num_parents++;
 		}
 
-		ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+		ret = devm_gpiochip_add_data(dev, &gpio->chip.gc, gpio);
 		if (ret)
 			return dev_err_probe(dev, ret, "Failed to add GPIO chip\n");
 	}

-- 
2.48.1


