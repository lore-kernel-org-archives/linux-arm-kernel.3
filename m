Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE5CCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEz91s+U8kIS8wA1frTzmRgwK/FAwzlSF2c6YYRvAI0=; b=0RFjhwxP6OlBaKoMkh6Lc3ZFlN
	xffU+Iu3AL+1SJCuM6aTXJB8EG5PKCO69oBitbIBuh64Otamqf1Kagrp8HoYyNEwj/3rUnvv6GSdE
	nR/z0zupuTdQ4UofjDcrAy4ij5uteNAiXNrPsJF+n3MAeAAoMppUIKqElNhvPvpiLXcSALY4IyRbD
	qqy/5JfsKMF0bfxHs5l78GxRtVgpZnpga60EghIkXcSz/uYDUfKGBbKjfZaBhUL94HTQc1o37vZGF
	NrQkGatpZGFDe4cQPalp6UQqGopbxw4Wy7NZeKJY6j0bqIPW85RZ0jk459bHKRyisL5P4iCnNCF1l
	I05qCndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjtS-00000005wuv-1D4T;
	Wed, 03 Sep 2025 09:35:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiQ0-00000005Lt8-0ykI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b84c9775cso24237695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886435; x=1757491235; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEz91s+U8kIS8wA1frTzmRgwK/FAwzlSF2c6YYRvAI0=;
        b=J/ZqLKDVhK2YzxQoWVKuw1QIKQ+KcjqmLsLrLtm0Q4jkOND5OjwJyGX+rU+bUcPmrP
         Ljmy0XZmqZEkPdBc4c73zFsd+YnsutG7j8za7K1usjmmYZYEXXn70sR78zty79Q4gHh1
         iIkUKDHQnb/FSSzfwzQ8/ykCu3RaRsxRJ9L0/tsSbrDF4d0eA31NyCvx4PN/1iPVcu4g
         NIaIxS8dQPtXVeHn6eUE8MMieoZVRmhr5WPwDHlOTtbmNeTcq1g/8Scvl4lyHCkSHNVg
         QqDC+qAZ3umKTi2RRVe6M4ayESG6UGRZlZLlqElq9GSJe+KhRf50le8XQSUia2N2uINB
         FyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886435; x=1757491235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEz91s+U8kIS8wA1frTzmRgwK/FAwzlSF2c6YYRvAI0=;
        b=pjxWhH4e+tFcJta2WqDip7cUctAvu5YGougRlkK3ZKZhWf12Yq64FZbuNoSSNSX5JX
         7eOePAU4bEq1EM5jomG+1eyv9lFoLrfZgyxQ8FnIPl65ySt8J8dtPQP383Ae6FsFRxjc
         t2JSkBRWxlUI9pfmGnp1DawQf2K/OxeJo2/A6J3AazVSA5N55//1C8gkuD69YWFvph9Z
         Sercccg7IaVlLnluYB3EgUx7NT8tsq2tOUBOWVq0IEr4We4CRc9LNv1DTvyK6DMnSw5c
         zE1t2FyDlWprE4Y1X9bAX2ZU/ClpHLCvYOE9weZpiJ+g4DymlhOvpby/dr0Jt+5ldp5z
         k/+g==
X-Forwarded-Encrypted: i=1; AJvYcCUxBrmdaXGwwEvL4qFrJeEVfdh6DKCD4kVuiBNlCy/aVwrQY0q3lGGqQ8BKbLZ08vriwhpMjElJVg+v4cd5Bobi@lists.infradead.org
X-Gm-Message-State: AOJu0YzNqsdpbZlXQnEJ2kGbtPBsMK2+fRV4z2TQdxTYwiX6yqAw13Ef
	ugxZASpkVIWw63OfcueJj7293HCP2cv+q9tc/1exYD8eNihNzEUyzIT9+dXlnP23XhE=
X-Gm-Gg: ASbGncueSXl8PjDh7w2DfKDk3wtQZnenbCFtwokk9vzff3sFnzqdS7H08i7uBmBwWVl
	eQvjZbbXnZx7RhTN5qCCp5eoYd7UUidcUZPsWpss3V3yVkN8+d8r/u1k6yCYI6JRqOg/B3jnCyt
	XitLnHbX555SVuIjykNwOj9WL2CPcNrdRGOOBZTY0XoLKH65in3wOdu+kwK0IbZRYrkPaDbqBPz
	TXsxiG92P3KrEf0IMMNpdFqkvebJY6+ImrDdsM6JbGpymfi6qikg7qkOWoADX2kxtNtJ8xdhfk1
	tzQoQBH18/pCaeo2n3PFU/dDZKqzXAeQv0FSpCwBlRlz5wmL0rrDYDNYh8Jpjs/UvHWBxOVJR0/
	vGkvg20aUtq1D66mG0/XMhqizfWJaOONMpHH2Xg==
X-Google-Smtp-Source: AGHT+IGAicRvdxORUansUebrlNsnmPBHg8r2ZlNut5wVP6y9Hg0Cr6n03HvKwPS0g2NuizyNw95FtQ==
X-Received: by 2002:a05:600c:c8f:b0:45b:7ce0:fb98 with SMTP id 5b1f17b1804b1-45b85528677mr124022205e9.5.1756886434508;
        Wed, 03 Sep 2025 01:00:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:16 +0200
Subject: [PATCH 12/12] gpio: mlxbf3: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-12-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7400;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hreJZv0kQOpgsrXN7wXnSdTeNguQrIV3lN+FwAv5MqE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WT2EPw3eqpxhBtsDB4pgWSrqiehVVLjbIrV
 DhdGgmFt1qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kwAKCRARpy6gFHHX
 ciLxD/9R8A7ngJXfHhBrONYbDrf3Hoj7lOUBXZBkWMAngCDlXZS7YvxLp+xIvuAKlB8fWw3kPnD
 v7Ac2NUlGPjM4xeXp2zaAYCWGwLUC41NEywxjZ2/6rGN0UUnMqrYly/Zrlr8lXCBhTqyVx5lJwA
 GDn8uY42SkEvkurNVhy6kLR2Hf5um0eav1hKPFIwcvYgfVkYwaEMKgyDBlOW6UaWBZoeJ72SUD8
 RUBwroocq6322Hq/E8kosbZ0agHR7+CHcQY9Elx2tbLXUNhij7lRjM2cFj6sDZrFXqU1iw77ehz
 L6xumXUAhAhZa3yBOuyzOTi1o1oqVreoQ4l05EPDLLcIe5+YAvB6nBUMJCo8FKteDOM5SsEjlbF
 D20+uHchK62MPzFb/9ZN1hULtTUn/J8u3vdrXDaF7hYoOyNEMCS8LLXDvDQhR4htup9pF4wY+Aj
 Qu71MwrqHFlQwLM+fQARgQSgJi+INGI+L0Q5isYK6eg7z7tVR9LncptxfTgBWkQUz+W9Pf5IO9W
 dH0DyaSWhZs9msSY19u6M8Yc2N6XvBqERFuixL4dHtMY9DyjaPnD4PIvbiERwDy6fmMXE6C8IVu
 lJy9MaE78FdFcFTbTYfC+sk4TwIsnuwyfDeqgGLOGgcXX/OO4mrxiX/I/RSfASw3HbiTwzg4XvY
 JUVmHWRQS2y6hIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010036_300214_937C72B5 
X-CRM114-Status: GOOD (  19.30  )
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
 drivers/gpio/gpio-mlxbf3.c | 101 +++++++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index ed29b07d16c19030675994b51a0613b022af131b..c812011bdbe65a9ee793ae1a5bfc656b523ab8ed 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -42,7 +43,7 @@
 #define MLXBF_GPIO_CLR_ALL_INTS           GENMASK(31, 0)
 
 struct mlxbf3_gpio_context {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 
 	/* YU GPIO block address */
 	void __iomem *gpio_set_io;
@@ -58,18 +59,17 @@ static void mlxbf3_gpio_irq_enable(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
 	irq_hw_number_t offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
 	gpiochip_enable_irq(gc, offset);
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&gs->chip);
+
 	writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
 
 	val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
 	val |= BIT(offset);
 	writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
 }
 
 static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
@@ -77,16 +77,15 @@ static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
 	irq_hw_number_t offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
-	val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
-	val &= ~BIT(offset);
-	writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
+	scoped_guard(gpio_generic_lock_irqsave, &gs->chip) {
+		val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
+		val &= ~BIT(offset);
+		writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
 
-	writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+		writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
+	}
 
 	gpiochip_disable_irq(gc, offset);
 }
@@ -94,7 +93,7 @@ static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
 static irqreturn_t mlxbf3_gpio_irq_handler(int irq, void *ptr)
 {
 	struct mlxbf3_gpio_context *gs = ptr;
-	struct gpio_chip *gc = &gs->gc;
+	struct gpio_chip *gc = &gs->chip.gc;
 	unsigned long pending;
 	u32 level;
 
@@ -113,37 +112,33 @@ mlxbf3_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
 	irq_hw_number_t offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
-
-	switch (type & IRQ_TYPE_SENSE_MASK) {
-	case IRQ_TYPE_EDGE_BOTH:
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		break;
-	case IRQ_TYPE_EDGE_RISING:
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		break;
-	case IRQ_TYPE_EDGE_FALLING:
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		break;
-	default:
-		raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
-		return -EINVAL;
+	scoped_guard(gpio_generic_lock_irqsave, &gs->chip) {
+		switch (type & IRQ_TYPE_SENSE_MASK) {
+		case IRQ_TYPE_EDGE_BOTH:
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			break;
+		case IRQ_TYPE_EDGE_RISING:
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			break;
+		case IRQ_TYPE_EDGE_FALLING:
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
 
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
-
 	irq_set_handler_locked(irqd, handle_edge_irq);
 
 	return 0;
@@ -186,6 +181,7 @@ static int mlxbf3_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 static int mlxbf3_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct mlxbf3_gpio_context *gs;
 	struct gpio_irq_chip *girq;
@@ -211,16 +207,23 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gs->gpio_clr_io = devm_platform_ioremap_resource(pdev, 3);
 	if (IS_ERR(gs->gpio_clr_io))
 		return PTR_ERR(gs->gpio_clr_io);
-	gc = &gs->gc;
+	gc = &gs->chip.gc;
 
-	ret = bgpio_init(gc, dev, 4,
-			gs->gpio_io + MLXBF_GPIO_READ_DATA_IN,
-			gs->gpio_set_io + MLXBF_GPIO_FW_DATA_OUT_SET,
-			gs->gpio_clr_io + MLXBF_GPIO_FW_DATA_OUT_CLEAR,
-			gs->gpio_set_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_SET,
-			gs->gpio_clr_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_CLEAR, 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = gs->gpio_io + MLXBF_GPIO_READ_DATA_IN,
+		.set = gs->gpio_set_io + MLXBF_GPIO_FW_DATA_OUT_SET,
+		.clr = gs->gpio_clr_io + MLXBF_GPIO_FW_DATA_OUT_CLEAR,
+		.dirout = gs->gpio_set_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_SET,
+		.dirin = gs->gpio_clr_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_CLEAR,
+	};
+
+	ret = gpio_generic_chip_init(&gs->chip, &config);
 	if (ret)
-		return dev_err_probe(dev, ret, "%s: bgpio_init() failed", __func__);
+		return dev_err_probe(dev, ret,
+				     "%s: failed to initialize the generic GPIO chip",
+				     __func__);
 
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
@@ -229,7 +232,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
-		girq = &gs->gc.irq;
+		girq = &gs->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
 		girq->default_type = IRQ_TYPE_NONE;
 		/* This will let us handle the parent IRQ in the driver */
@@ -250,7 +253,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gs);
 
-	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	ret = devm_gpiochip_add_data(dev, gc, gs);
 	if (ret)
 		dev_err_probe(dev, ret, "Failed adding memory mapped gpiochip\n");
 

-- 
2.48.1


