Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949F2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=; b=TL1yy3KantkW//qfvAWn82eh0y
	qybopqgKh+ZZ8HFNa4vRW5Ral4pWmLXLPS3D46766balvCQvDGHEWz34MhxDms34DBhRFtsoOIcnG
	Q/K1DX0yBXf060daHHuObafRPVXM62GDQARthi9ijQsgPIzxqq4vhwRfxGXKiPjy0tErwEjteW8AG
	91VvjBxOGC8+B7Ie+bauwHoTNe0nMOwBBPYaL1EDiCVEOue8sdCa+PQ25A1FzUn31Bf/nYeIWHX8G
	GRJNmzGk4oSK43k5fGj/PCClrn0oiPUwlxDgYI7CeBy+F2/ujBgO1a52SfY426illDPeEG7+fxZJU
	1i8PEOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwLs-00000006fT5-2g39;
	Tue, 09 Sep 2025 11:17:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuS3-00000005sVd-2BME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e751508f21so371621f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409346; x=1758014146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=;
        b=TDECA13OA+a5QrA7w33jNKejlToyHKK0dY6W44CAzH9j6QGEj3LNGdEXvArOIAfHcE
         2NkPjJxDdpiUY5cjNWRmC4P4m2lPRGfPt1ZaFIC7HEK3o6K4a8H+jStI3kjYy6WVfTlx
         IqBcyFyQ0K7FW5VCxrfYIIjNMNIw7TVDyiJnMYISc1HNaR2SgwrheTA/vD2LMOUq1S7L
         yA748z/b7Yoo+y2dyK5fXdYmvmTqJr3nRsY9xtqhOZCVC1zSeC5PP+JDM7LOxPtiZpPh
         m50tef1ki7IETAUKEOywyXcFMZ3Ezw9CzHEn3TWP+AmpwWU9ERJTy18a6ZlDF5znfD/H
         xQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409346; x=1758014146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=;
        b=IsKMnQ9A0K2svI1WuiDeKUcKPAizLo2T+Oxz7uT4/L5bPP91RGmb0yUO0c5Qb9u+bk
         U1qGS2beXNdreOwUOKmQiY8Pxbl9Nu/MEYzajh2zkt2pP1/hVsLBG+ASLBXAN7aIOj2Z
         ewdT6uRnplZzX5imJYSx3K7Qn6hwv6FOP2mXynuFZRvVClT+vMEL40rA1eVSa08abs9A
         rL3gZpoSZvW5WqnNikSVZv87zjmC+854iG9tb5+76HFSpMoXSaDL3riOmyXqF+y+zBGG
         ONvb0TPDQWyDdNQx40WHk2uYtZ9pdojozj70lZJl1xEuTxUCJTOfNzfXF6q5yAHhEHpH
         ItYA==
X-Forwarded-Encrypted: i=1; AJvYcCXqCqMrW2Q3dLKChOcxuFbPsV3Hksuw4T1KGfeVy54Z3k3Sl++twLVvPwEQ9H459fFLorbzoXjHqBXGffmlLdwk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7dM4Oqc7thb/SVqGLCI93GwJIdEf7qYHhXWltPZ9173o1oogB
	WU1z47rD89jAAz4q/o3V/WRwymj7cGol0NwuBMuHNmBPEJt9s7q3TKtzNajIqHtzFSE=
X-Gm-Gg: ASbGncuav7IVGkEEGy8UUMbL0slJGzJEbJsZ14olcoU7Hvp1twXIfc23eAuKO1W4q4N
	cEGdXAUYTSiOu8piLokpgA+vUWygMpLkjHfvYAfv7cc+vdsg0VwRMsn5+XAs0g3ApzoH9MPxe7O
	J0LoVJX2PjYQMLELfEdTN7Qf7hXx26whoqEd4ElUUy9n+hSE3wVy+QmoBwkF0HusfmxnJN/qELy
	8DViszmZWwSEGvvOO+Ra/BOgc55fzsKvNdB22ELxQnVcpYa3M+qFA5CkW6IpMqSl08trL0r9xIU
	wA17fgaUAIn1dDdEwSkAnm84psqmCLQVmeoucwGQ9F8O5Ua4r9UunueOI92xUdHiTrIfKnKIf6P
	CmHmAaTBbVIPfkg6nsHlIHuRzOlK/
X-Google-Smtp-Source: AGHT+IGd8DWD9arGkUNKw4zJ2AP1gSmpXBaa6sBHZKQ/RTRSGAXz+ZKk9uFvPaqtbHsYLxTfFq0lRA==
X-Received: by 2002:a05:6000:178e:b0:3ce:a06e:f24e with SMTP id ffacd0b85a97d-3e64c87e0a1mr7050570f8f.52.1757409345752;
        Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:29 +0200
Subject: [PATCH 02/15] gpio: loongson1: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-2-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3630;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Wea5gLwd4IgFMNwzQvk4gQjcgC/QooQl4cu1eZu3y4s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2FKDJ33HmmJ4TKcUEs6Wb765qwJ9kORopw
 zGH1aPIi9SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 cotBEACZHjEmFye/YUWwEG1t9JNn7F/QEqvztKESvvpKpdb/j36lRUnsQOK4I6o/CYNKwADuv7s
 lJtwq4Aq3yb08HIvTrVcbalTGGCc8sVoeuhwj45v3RDkH4kzFvlk7x11cEf8jfdhgAc/4L51iqL
 I870Hq3jyRB1Hcx6bStvRB6GpYEwP6haihYpjfK1LAeW5/TG2WggxKlRRQIKNu76uQ3AH8imb/y
 KoMf6QAY+kOGIgAR/0H7X+IUYMNkNbgaTmFWqs1oIIRnoJ8UyCy9CvbgcGqiljfaUozPOa0oSsB
 fAFQyT83ymZOswP7v7fi7xnuPRMyXOYliGC7ezpF1jVIBqS0FNjienW1XJA4U2l/o3BhnWDS0vF
 cvIdcKk19kIZ4S/3gtalBPcjMImvQ+7p+L/JZo7tsnnQrQE5kQKRbXCysmcy/M702tnvS3Wh7QF
 opbm3qz+aJf8Hutpc/M0iDUsSrHBjc/sO9R7FDQOT1qRL7yX5NHIS5HpWEHxHfOTN+48ZReWpBq
 m2X9CLyXoO6+KEdbs/VrnoTNxsz4JBY6hdbCb8BwS2GPyDX92FyQOiOAK5Ab4JweDvoBsuCqUmK
 5mlxO3bM4EweAjJXKZyOhyPpbA5GqJudG82pFFHg5ZJVPRhrpAESFdJ8zebzlGQERDhxTwQiqm4
 pS73JMaWn3/C1Ng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021547_595397_C7156166 
X-CRM114-Status: GOOD (  18.43  )
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
 drivers/gpio/gpio-loongson1.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index 6ca3b969db4df231517d021a7b4b5e3ddcf626f7..bb0e101e920889522aa4bbc69e5d6d2c49586cee 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -5,10 +5,11 @@
  * Copyright (C) 2015-2023 Keguang Zhang <keguang.zhang@gmail.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
 
 /* Loongson 1 GPIO Register Definitions */
 #define GPIO_CFG		0x0
@@ -17,19 +18,18 @@
 #define GPIO_OUTPUT		0x30
 
 struct ls1x_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 };
 
 static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) | BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }
@@ -37,16 +37,16 @@ static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 static void ls1x_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) & ~BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int ls1x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ls1x_gpio_chip *ls1x_gc;
 	int ret;
@@ -59,29 +59,35 @@ static int ls1x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ls1x_gc->reg_base))
 		return PTR_ERR(ls1x_gc->reg_base);
 
-	ret = bgpio_init(&ls1x_gc->gc, dev, 4, ls1x_gc->reg_base + GPIO_DATA,
-			 ls1x_gc->reg_base + GPIO_OUTPUT, NULL,
-			 NULL, ls1x_gc->reg_base + GPIO_DIR, 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = ls1x_gc->reg_base + GPIO_DATA,
+		.set = ls1x_gc->reg_base + GPIO_OUTPUT,
+		.dirin = ls1x_gc->reg_base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&ls1x_gc->chip, &config);
 	if (ret)
 		goto err;
 
-	ls1x_gc->gc.owner = THIS_MODULE;
-	ls1x_gc->gc.request = ls1x_gpio_request;
-	ls1x_gc->gc.free = ls1x_gpio_free;
+	ls1x_gc->chip.gc.owner = THIS_MODULE;
+	ls1x_gc->chip.gc.request = ls1x_gpio_request;
+	ls1x_gc->chip.gc.free = ls1x_gpio_free;
 	/*
 	 * Clear ngpio to let gpiolib get the correct number
 	 * by reading ngpios property
 	 */
-	ls1x_gc->gc.ngpio = 0;
+	ls1x_gc->chip.gc.ngpio = 0;
 
-	ret = devm_gpiochip_add_data(dev, &ls1x_gc->gc, ls1x_gc);
+	ret = devm_gpiochip_add_data(dev, &ls1x_gc->chip.gc, ls1x_gc);
 	if (ret)
 		goto err;
 
 	platform_set_drvdata(pdev, ls1x_gc);
 
 	dev_info(dev, "GPIO controller registered with %d pins\n",
-		 ls1x_gc->gc.ngpio);
+		 ls1x_gc->chip.gc.ngpio);
 
 	return 0;
 err:

-- 
2.48.1


