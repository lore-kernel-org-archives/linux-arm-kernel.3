Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9982ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An6+hM66t3JeEzdqXYRIZViBfBwfWXQ86Ivlv8SMd0o=; b=yEJpbQCSY+rF/dB/dDwLuQ+VPx
	Obaf37PT5xiknPnCARxdv8vDZlb6gQQ3/2b7a0i9ItA7JnNbNB+NFiPfRNlDP55XRGXYf9xUJK3gp
	k1YMO9srGFNGhRxkVt8dN/RCwb8zCQeYr2HJeupGXi/4ftIA/E+u+kgyT3P/qjQZzh+NTKxL7pTxs
	ZLcppQR4aRmAZvQtPU3PTJFu5HEc5wJXDNSPmmK1Df0Kawv7eUkLbXIC1xrVkTwVdsIJ+xnh+z4yG
	oweSL5/elSy3HEARkhyMFWAdBal1sY6nV1K1enHhFXbsejTkTsCOuOJRuGMzLIYf1L1xfftIlJbip
	iV3BiyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1o-0000000CSnc-0b7D;
	Wed, 10 Sep 2025 07:14:04 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF16-0000000CRi1-1iTz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:30 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so3187183f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488397; x=1758093197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An6+hM66t3JeEzdqXYRIZViBfBwfWXQ86Ivlv8SMd0o=;
        b=pPipSc00AhC6OpaZ16lubHWrMWhhtyCQmrhPp4Iko3t9lwM3dFS9Xi8qb40cSGv26Q
         F7gb+/65mDQeev0q7A7u+7wsvu1/C9iIruv0pbxt3GsaHimAjZYgke8etJuvfXrLSRxo
         yp7GsgjtHROTe5iZN4XtYlWBU1CWYIZH6hq7BPCK9Edn9Bt2VjVmNooRjG3Nvp5P3VST
         MPA0noTDct28LT4+dx8KlMtPSZc6dxX5BW9yi9iiXlwNJUAXeBD3mA4lyYnITxopiDu/
         /IrghhKj3lmtq7D9EVB4WSGHI2oN6TpUkFC3b3F1XB5nnMpFyf2pXu+f6hzYbMgvB9pR
         IudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488397; x=1758093197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=An6+hM66t3JeEzdqXYRIZViBfBwfWXQ86Ivlv8SMd0o=;
        b=edJFVBSaxqiWp1V3YfJ1fD+4d0ecmdklMmgocaCH1GW5dlPU2WXP1YTDUz2ftUm0/S
         /VHtXWBERR4lXcZlEKKuHAyRZ7dQpGZh0CD9olmk6wzTbtnqE5HVI+L01BBFFzCZPuvU
         Jo4RQFZl8J2FK6VEIO1zDwy42aRQAcgSSOx/toURi7XR7L3UpXtQglsz9BCwbPldRsco
         8qw9k5MosF2AeY3F+Km4O1r0tbwof8I0dp/l1qNB4vLvcVjG5XdD5g41xr9aX9EAcDic
         K2hT84B5VRz+r+5mzxpZrpaMyKIS7dYwWBiUbbIEbu3cSkCFvfspc7Hgylkbg4iyctjA
         7zDA==
X-Forwarded-Encrypted: i=1; AJvYcCVkUBEnsIi5gy3mUmhIj/oFH210bLeOXUnV7ukVkYzNDPZYSf/mFJKj1Xg819xw8vnvxBdRGyCpi3Gnev9MQggL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnq61r8ewPOD3UVhknbZXzqu1dBqlqlUc0FS7aImlstxmq7PrG
	RhAQtzUXBGeUORs8W8RLBe5lllO5K3wjwwA2zOvWEuuD47UV9Lh/nC7bsH6djEaiuzQ=
X-Gm-Gg: ASbGncu9EE0dodIyvdmMYy3vzcgi1ZNoWAFhmWEsNS5D87cHPK6HeT1dHmWYDDOVHFV
	sVN6BLJr3199LXTtMA032TMPnle8DGHBBn1fR/Xg0lQObLMaYcS5tlyM3UQgDOb7M9AQzCQuGYF
	DvrFX21+SUTOeY0S3VQSBDx74y3JHkwA31Q2MJ67C0icRZyp8+q8QPvpBuzTSxpNi3NRQqgC02v
	d/Uds9shva0uhXsZa25epUBvut0zQZ5RUMwq3Hv/rnOhfR5ox9L22KZpUue+0NIaua63AyF6eop
	hiJU6QTZiKCOggLGZ8/kCsTslQAkeGWwTYn70GHtXw1PG4Yr3g9M1N0DB7XzoB9VHbEdOhtgysP
	rLhIZzBLjd9kA9lmz
X-Google-Smtp-Source: AGHT+IHy5XKSyXs/1DRcnMNeVAy+4d6fp/JMB1+I8xVYdcyACU25uMeyY9vbA5I7O3QW/9RpEY4Hkg==
X-Received: by 2002:a05:6000:1885:b0:3ca:83e2:6339 with SMTP id ffacd0b85a97d-3e643ff3728mr7633649f8f.49.1757488396985;
        Wed, 10 Sep 2025 00:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:47 +0200
Subject: [PATCH v2 11/15] gpio: sifive: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6438;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L9aoU0ZGQa8gL+sSeYrRjJ8TqRkxJOj7hf8fiLSe9SE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuKjz20PIfcAJYy/3UtT6a+XtkG6jfEExyI
 gswS7XTTeGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 cloaEADZ2SEEt7cXVpgjknBnw5IHqSuj6lTOrPKBK8Lr2EkodE/C/OaI6mRz5VdlRvFj6h44udf
 GLx3gv+Tnaqv5iqBiLjhkgBJesZ8qoqxJUc42erOqPSeCiUjmpwjCVVjPjEqYLHOvr0SQvhGOhu
 wY7l3m/pY5VkGxEcMbpQe7BBTH505Rn9/Joe1Vn6zPGPtnqWzh5KBK4hjq4vwuavMtC9QKnYdta
 QP8e8hCBnzYwcXBfWWliG25g3SDhflNooMMGYLGgn0lo1iM5OAMaIucc3NafxImhUk4tAfYdqZ7
 /aiVuU6QyVrkuEwBqbyz0ZhLrLJB+NWt5jaYQt5myVXRjuld4IqvoOZtipKTNQyHhGqcQeqgH2H
 DEMwhcsxlcev5f/gQP/9ysB37pCJ4jS+3HPTiVXKoazO9Iv0CTBHeReDOosklbvyMOYLzJwSqji
 RPZy+JVqJ4OOEr2F3Jy5lteGB4ga8cw8bDDD74HJwxrqHyaz2G0ydSXBwzPA5dT6wI898tKZ/O+
 HumCwDRTDXtGtCRzomWwhHVuQ/M+WhVviUjFmRFOJWVNrJql4a/NaiJWqjMEWweur8ZbuUmSb9/
 qL5w+/g1kUAkOdX6ILdODDMizAIapj4Zv7qjiHp9U+/VAC8uCT+nOLvu4BRVfJzrJJ1PQ2eqj2t
 BjL1Uly2BWAgKbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001320_703496_4BAEC3AE 
X-CRM114-Status: GOOD (  19.34  )
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
 drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..2ced87ffd3bbf219c11857391eb4ea808adc0527 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -32,7 +33,7 @@
 
 struct sifive_gpio {
 	void __iomem		*base;
-	struct gpio_chip	gc;
+	struct gpio_generic_chip gen_gc;
 	struct regmap		*regs;
 	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
@@ -41,10 +42,10 @@ struct sifive_gpio {
 
 static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
 {
-	unsigned long flags;
 	unsigned int trigger;
 
-	raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
+
 	trigger = (chip->irq_state & BIT(offset)) ? chip->trigger[offset] : 0;
 	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
 			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
@@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
 			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
 	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
 			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
-	raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
 }
 
 static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
@@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
 }
 
 static void sifive_gpio_irq_enable(struct irq_data *d)
-{
+	{
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	int offset = hwirq % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
-	unsigned long flags;
 
 	gpiochip_enable_irq(gc, hwirq);
 	irq_chip_enable_parent(d);
@@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 	/* Switch to input */
 	gc->direction_input(gc, offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	/* Clear any sticky pending interrupts */
-	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
+		/* Clear any sticky pending interrupts */
+		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	}
 
 	/* Enable interrupts */
 	assign_bit(offset, &chip->irq_state, 1);
@@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	/* Clear all pending interrupts */
-	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
+		/* Clear all pending interrupts */
+		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	}
 
 	irq_chip_eoi_parent(d);
 }
@@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regmap_config = {
 
 static int sifive_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
@@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	 */
 	parent = irq_get_irq_data(chip->irq_number[0])->domain;
 
-	ret = bgpio_init(&chip->gc, dev, 4,
-			 chip->base + SIFIVE_GPIO_INPUT_VAL,
-			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-			 NULL,
-			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
-			 chip->base + SIFIVE_GPIO_INPUT_EN,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = chip->base + SIFIVE_GPIO_INPUT_VAL,
+		.set = chip->base + SIFIVE_GPIO_OUTPUT_VAL,
+		.dirout = chip->base + SIFIVE_GPIO_OUTPUT_EN,
+		.dirin = chip->base + SIFIVE_GPIO_INPUT_EN,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
@@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
 	chip->irq_state = 0;
 
-	chip->gc.base = -1;
-	chip->gc.ngpio = ngpio;
-	chip->gc.label = dev_name(dev);
-	chip->gc.parent = dev;
-	chip->gc.owner = THIS_MODULE;
-	girq = &chip->gc.irq;
+	chip->gen_gc.gc.base = -1;
+	chip->gen_gc.gc.ngpio = ngpio;
+	chip->gen_gc.gc.label = dev_name(dev);
+	chip->gen_gc.gc.parent = dev;
+	chip->gen_gc.gc.owner = THIS_MODULE;
+	girq = &chip->gen_gc.gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	return gpiochip_add_data(&chip->gc, chip);
+	return gpiochip_add_data(&chip->gen_gc.gc, chip);
 }
 
 static const struct of_device_id sifive_gpio_match[] = {

-- 
2.48.1


