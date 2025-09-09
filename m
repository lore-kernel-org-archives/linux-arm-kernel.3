Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EDDCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzDGMJfmWh4iChkJ6qtmNZIGp6yJhGT0+TEuoPl0ljI=; b=fjfPDzfh4JWKLRAh0FiEqBwv1r
	9Bv8jgllVOhKU5QO85N7o9ZAGgmnacf5rKJLQFdfmpIlCEpE3772xGcZMYW9jXjBG5g/CILuGExQ3
	1Hwsze5fxmtQ6e23qT941Y4A3mtHF/Z2D65DZit9tlH848IQe07zffJIw6eBRa/msYa11hZWE8Vxm
	dIS4dnmfNhBjo1zuvj0FPVX0sBA2ObwPibtmqAY95eluJVo+5qxVOIgDI3Hd+qDm3SrleXJdE58dr
	A7ShZI/wiqgsJA+F2t4wqRcp6R+DcsJMlSJXILgWH8OqKc2UCPMDoux0uaKc441SzwoxnjKyvGZuT
	BIMSv73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Q4-00000008aZl-20ce;
	Tue, 09 Sep 2025 16:42:12 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSJ-00000005slv-2Z6q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so3492373f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409362; x=1758014162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzDGMJfmWh4iChkJ6qtmNZIGp6yJhGT0+TEuoPl0ljI=;
        b=sEudyoX1ozUy1UAvaGnFPzAtq7blfEMBC6rupmE9Q9gxAq1svEHtDKIrCc4syR79SC
         cwWzkPTYlGu+T5vMlxXoSlOkOOzNB7tf9CuxD//ZcCL5bGarwY7f43KODdHKt8sUhA1R
         tkKtOiEzK7SpFBXIwcGPFmBq69DNKdKV9etYMKeWYQsfsxYmihs24mKEiUKLS772/GWV
         JUMEQwnW/D+UPoKHbdg14GHZsZrTPnelWfd6fPUTpUywUnhsHz9JDdY/84aTzk8ASavI
         BtjEAWqaH1acBMkeO689qYbmnEoWhBjjhA4delKi5zGiuXdInMl5nSBv5OLQtuqpT3rA
         yU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409362; x=1758014162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzDGMJfmWh4iChkJ6qtmNZIGp6yJhGT0+TEuoPl0ljI=;
        b=GRC1K8JbgNbTBrLjuhww024wdWyyHm+zYjtb1BfRVcLBp/qA8BO5XDbib4JmFeR8ya
         1p4qoQU/tjNRpdEfj9SjCQZX470bouhj/HVr1oqcUK18LAanrnCaWiLSFaXwi05D3w4H
         LCZRKaeyfapiLqGbKxHffhughTrpq0RKMj8o8A1hJbuQFB1s3GN8AwryV44dYeidfzjC
         WtTpXteG4X5x4Dx8eVZ0XABv/mmNEGLkTJQL++UCMTJQUjGGPGjB5vKEDiFdbbVGS1bm
         5beACBYWNKRpYkoKZ8kg7xxGbhtjQ215QfGufVL4FjZk4ZH2As9S0nPepjj6G1cx2V02
         0PGw==
X-Forwarded-Encrypted: i=1; AJvYcCWzST1DKldI8lIDeFjYk3w6GVEtgMEvOdnOOQB85r064IzlrJmyiM6xpW9WFCJGboR5+7/jcTVtgWfNS2OcJG5U@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjcc/wkewO08igvF/zmc3kpt3srRb6dp/Jgoy6u/JqLiSZDU+
	IlOu1eDAqW8bYmMjp1apV4sS8rFUiQLVJ6mhIAi/KUysDaM54FG0f2bQ6NTAgcTJDY8=
X-Gm-Gg: ASbGncv1d8hinNQXsTp6KlK32OnMor7y4oZ+6CYEx9oBNvVJq5x/A8gb+t7s56b4OQk
	Lq879AlbOSGZlt8r7e31lsWNyieDX7DlTC35F6dW6xpOEP7XFCM5Sl2cUXdnYhdblrFl8tTj12h
	+uGXfP3He6Nj+G7idPZXCxyRgSdj24k7Vy+fRoykEbMloOY7DHByqsCphNHgxBt8D7dVMeOjtMV
	x/7X608LsSancdss9wYyT+JIGj/prn9zjVhJ9VG2QUohm05DhpZ53rpjMIR9S/b8yeMXMXjw+jk
	RK904WVF4mVoVMYKRfq9ARSDt5SUsXAYDVEqRAUVn5/2eiJ0Qgtr3nPAzIR7NSglghV8wPq8Wos
	UzZa6BDyE0e1w/lpsgKxBB+ko3kd3
X-Google-Smtp-Source: AGHT+IEXdV8NISTEczU1VIRow+5p3wj26/zBGlI6Z3gmRyg6ivq5S1t8D83LU8LnUsvQNLDOuZ4iCg==
X-Received: by 2002:a05:6000:1ac6:b0:3e2:da00:44af with SMTP id ffacd0b85a97d-3e64317f1b0mr9908320f8f.36.1757409362157;
        Tue, 09 Sep 2025 02:16:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:37 +0200
Subject: [PATCH 10/15] gpio: menz127: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-10-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3332;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Lx7WAwqP3xPk38b+MFE7x8Xw00e0BMog5eP3WfeiT9s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A533XVMdjGZ1Cis8dHGgNwfAnmr6Mx6nPBe
 og/XTnFC0uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOQAKCRARpy6gFHHX
 cvK3D/90zMG5N+5srxcF6cRvLhIl8gvluNWyjhGAirS1cpIR4x4XFqa1JRSvlICISA4EibUfKNJ
 PCqqwF+Ps0Sb0gxGvXIdzYawaenP1Ay9crGgWCG8dqA5Oh9GGEe1sAJ3fj+b7hBDr0bKiquZZZT
 qm8UPST9YGHy0qZh+xOow62KdkczRxAojMDQLZh5bNe/oCV04FO+Fi2fM8DdLa/t5tIjf7F2LgB
 x6h9uqy3ExyQRUSRz+yuRRbcf8RmRlNHgEWPxdT/3e82BmiIc1xpTXsQbELVgTrsgj3e7BS7LbL
 u1JuLGpx8VAQiDvKnl89BJUWTfjk1O22JRpUP1mWMrVgOcg7mB2OSrtIK/ddsW5l0rrC59Gmjk1
 qaeMlSXWkhqF29/nX3L9M9rKbGqUuZHBaVvBOvLRP4Xd9268YY19a70HNS76Wwt4rm2E0zsrkOH
 Cbic63a0LkP3gvP4WK+77qLsClCFZZwuKZGK4SYbDmK707BXh3JfQmdYoBi9czJtf53Man5JhgA
 niTsF3TUxsHuWNE13i0oWRxrsXAxGUlQk9nCxmJM7Edlm/ds70XygZ/W9iWscyAP2fou3Kx8RAc
 k0YZYHnRPLejEZmL7Zkig/YHgd750jS6if4fIrKfPjQVHCq8sRJM1mQwOksrvpikMmw2E9pyu3U
 8yS9x2NzZmFxfng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021603_694567_53461D70 
X-CRM114-Status: GOOD (  15.54  )
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
 drivers/gpio/gpio-menz127.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index ebe5da4933bce730c70f83c1c0f86fc4a4cc9906..27cdbc36a5fd468dfcf9e0029651c8d22e176f56 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -12,6 +12,7 @@
 #include <linux/mcb.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #define MEN_Z127_CTRL	0x00
 #define MEN_Z127_PSR	0x04
@@ -30,7 +31,7 @@
 					 (db <= MEN_Z127_DB_MAX_US))
 
 struct men_z127_gpio {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 	struct resource *mem;
 };
@@ -64,7 +65,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 		debounce /= 50;
 	}
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
 
 	db_en = readl(priv->reg_base + MEN_Z127_DBER);
 
@@ -79,8 +80,6 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 	writel(db_en, priv->reg_base + MEN_Z127_DBER);
 	writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
 
-	raw_spin_unlock(&gc->bgpio_lock);
-
 	return 0;
 }
 
@@ -91,7 +90,8 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	u32 od_en;
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
+
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
 	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
@@ -101,7 +101,6 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 		od_en &= ~BIT(offset);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
-	raw_spin_unlock(&gc->bgpio_lock);
 
 	return 0;
 }
@@ -137,6 +136,7 @@ static void men_z127_release_mem(void *data)
 static int men_z127_probe(struct mcb_device *mdev,
 			  const struct mcb_device_id *id)
 {
+	struct gpio_generic_chip_config config;
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev = &mdev->dev;
 	int ret;
@@ -163,18 +163,21 @@ static int men_z127_probe(struct mcb_device *mdev,
 
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
-	ret = bgpio_init(&men_z127_gpio->gc, &mdev->dev, 4,
-			 men_z127_gpio->reg_base + MEN_Z127_PSR,
-			 men_z127_gpio->reg_base + MEN_Z127_CTRL,
-			 NULL,
-			 men_z127_gpio->reg_base + MEN_Z127_GPIODR,
-			 NULL, 0);
+	config = (typeof(config)){
+		.dev = &mdev->dev,
+		.sz = 4,
+		.dat = men_z127_gpio->reg_base + MEN_Z127_PSR,
+		.set = men_z127_gpio->reg_base + MEN_Z127_CTRL,
+		.dirout = men_z127_gpio->reg_base + MEN_Z127_GPIODR,
+	};
+
+	ret = gpio_generic_chip_init(&men_z127_gpio->chip, &config);
 	if (ret)
 		return ret;
 
-	men_z127_gpio->gc.set_config = men_z127_set_config;
+	men_z127_gpio->chip.gc.set_config = men_z127_set_config;
 
-	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->gc, men_z127_gpio);
+	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->chip.gc, men_z127_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret,
 			"failed to register MEN 16Z127 GPIO controller");

-- 
2.48.1


