Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A5DCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoHSBIFEeLBOZNCXJbj9bZOS3XuoUnKsV8A51pLJiDI=; b=o1633+8ibB1fL5O6CCJOPngkeS
	c0PJS+G+ONDBfuTlSY/NTQbzneF7YMqzsRSF1JGJa0pwzCasFRCqKGHwDEUHn+ai1vxFVr90WbPQ1
	ebC5LJoPITjowKWbptd7RSmRMGGMCVebxYY9+ZF0ScHU/iae1FRdLtdON6TnowO7tRDl5GbwZ/xLA
	6TxG0kojQyr8YSZsVZW6AzKZ8R7MF8yCnxWnCTe3yDtUYKEhzsoohFFVys9v5DwYN6ediQOlofP5x
	zYaGbA3QaGoVPTi1LOBnumDUGpfu+UhQxe9HAsYI1BiiV8H/IO4My1tV90AvAuFlcyItg32beuTf9
	vInCy1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0q-0000000CRLR-2Qt5;
	Wed, 10 Sep 2025 07:13:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0i-0000000CR5t-3FcR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:12:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3df3be0e098so3507451f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488375; x=1758093175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoHSBIFEeLBOZNCXJbj9bZOS3XuoUnKsV8A51pLJiDI=;
        b=Aooexswv+qLHvPZ0jzFOmBSfzNJTeTNfTMkaaNElbKHhlC4caYWZMUTPAImQUk3Wg9
         0UzSWHniE4gD4Z5QcXKaiU3sdVyRzqYLDO23lYKb+MVaikNfOvU0WgdL4E8Xlx2B5rxs
         LQ/3zYATVltYtk1SUEu9dtkfLQp/VNUrF920xgBYRqtJ/YHSsqTH9MR3A2dZqSchQZbk
         /ohaxtdn7hCRGTyA+tGyq7+ctm/BZ9DStizErlja/cOlEgqPOdzoFH812x3cHL6Xe3J8
         KS7BmafP+Asnx5c8n2vh9zz3/wFBL+fbQjEJxlO2/jFRtNRk1T0NtCxP0YLkoW8LLOJb
         UPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488375; x=1758093175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoHSBIFEeLBOZNCXJbj9bZOS3XuoUnKsV8A51pLJiDI=;
        b=fFaotPiFH1j0YCHzOfYiCS+NA/VC6BhbvQ2/OIfuT5bzewqVocDRQVM+G2GOp4EFjC
         vovNgFTaZSnJW1Tg8GhuPVbNUGS0ZXWMwGgJMCIBnN5LtdNAOmxo6a6bb64J2rFVBBxg
         egq4Vkxmp+VdA7u7Y20hY4jxo58LgVMVcxsRKypcQhuqlfwkaAdfWiQ25/pANcie5B+K
         6Ccx5TTBSKO3Fg/NqJZ3OaSPiwmYOunPcfrQcFfIHBDb3AB/b99wjxrBpIfogNFrsRtd
         q3RaEwmMpteHs+Sd2A7RflG6JKCTckiyS0GHVl72kAeUx/mnuNc/tIHjsA4dbdTI+IHG
         h0LA==
X-Forwarded-Encrypted: i=1; AJvYcCWeXXkTJtQ+UEfcNU0iL53RHU+iUOeHnxHcszBe+I1+MA9TaKyGJIwAgGhluxuXudqhfY4uVfB4k904/c09aryh@lists.infradead.org
X-Gm-Message-State: AOJu0Yygt8JQ4Eb24WEzqQKBP09kCzar5rwQ3Fsf2TAX0Lzfyz67AwxH
	/6/ph3Xua3hson6KqoMQHO0cz8TTXMVi+YMYsWQKKpXkfFfQXkqmp2WKFDRUITFblUY=
X-Gm-Gg: ASbGncvUBGU0o3aA6CbR5wkiZmHIdQmZzNPAftWAqchVfZmMhz1vuJL/x6jiiyKqzg/
	52u2kdi363HuejrApx2+Cq+CJCqm8dz12JykSyXV7VTxXU/vlvL+Gtm5paCg6ZX63eE5hjCyJDn
	6Rg3RkB95ipZ26LZ0aZWn10N2iQYzCN2ZR4lyeumi4PMuu2kaPPiA0iLG15osBqw+eqLnp2TEyA
	EWlJN6dTUx7PQ9U+NJySRIBoiU1TjvuxbsQvnE2AjNGNLFHrayZJyw13HTuPphbxj/rjsRQp2/v
	YZM8Kaxfj7g7rTWSAxdWKV1BG9xYuBG9HRMgkmSUjx6iOqk2aXdpyxChwd4HssIZm7cIc5Q79VW
	WOcQVp7bIQAhzXTZe
X-Google-Smtp-Source: AGHT+IEUFZYCFWa4Vg9IIf0WX1fkQ0VP1XWAqmtS6KCEEWx+d3fiNITjlopSKB9UCn7bqfo0bZ5sfQ==
X-Received: by 2002:a5d:5f92:0:b0:3d7:2284:b20 with SMTP id ffacd0b85a97d-3e641e3cd77mr9427106f8f.3.1757488374606;
        Wed, 10 Sep 2025 00:12:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:38 +0200
Subject: [PATCH v2 02/15] gpio: loongson1: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-2-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mXA8fucd16pS17njrhUGHkfPQnMcfvAh6XNsIVsSGc8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsJEThgpWEjpX0O+Hvu/Jn+X8WfnAtkM8ym
 hBLXZzzm0yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 corBEACss3BKerKFj+T8CMoaXJs6TyHDVfUdhVGM+YwgfV7kTPxeV8QeAOT7ix92YcO0oM/4F0O
 yxukhzUS6glD/mXz3WflqteyWAMmQvZjdBmTh8v5vL8q3T3kuk14kpVt1HVJXeFPvyI0CRqR8pB
 JW1sCfn55p37EH2RUCQWCvSJif1bSLcj37Aj5OzlVGxguVdwUeoJACj9akJQZeBSZChVbOJkcT2
 OWoZAaSpMPk2RWDn562byHhJyjkBMAvNOwVKBhUM/4IybIFd9zO6d42sU+vtdpeIMAmYydpMw4L
 966wVymZBBsYs9PbSBpMknd12tgFofJWr4TPKZ7HkMgd9TfR7pXupS3nJCnrD0gCf2lOjqugAZJ
 oKfXt79UnW+Ug3F2+WUnonzgr7AaOqYaZNkE/GmQNLx5FJka/gZou4DY0rQwZX2wBY0S8nmCA7a
 k5FlFyIpXjD0l2y2cGvs+drE4Y2i4T4TZ+lQK6yOloyilXvRkNXGorO5NxT7i3HJeJhToiO8zTH
 gSL+JbkWVgX2gju3aQewWAKHLYgviIypMX9YfRiIhNJ9nt5hjUYYqpbpT0bqQY0JWZzH3+wU9An
 qOLgV0vAbYXEmd4n64W+SH5DuEogfw/DDROuqPMFNTs98RDyUb1YX71hzgmjFDIoHR8EF0VnTkA
 k8NfF/8e7ov3brw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001256_914068_FB772FF3 
X-CRM114-Status: GOOD (  18.64  )
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
index 6ca3b969db4df231517d021a7b4b5e3ddcf626f7..9750a7a175081781624a49a794926b3f1e45b4d2 100644
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
+	config = (struct gpio_generic_chip_config) {
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


