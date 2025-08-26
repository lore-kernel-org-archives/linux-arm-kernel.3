Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D952CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+V5B7XB9887xO03EbqFKbVpG5jSuIJ2MmOG0uv0TFc=; b=szlOTNELLbiVoW/dU5A4LH/jJS
	1mnC2GWW/5GlOAlUzjaxTAkf8LT0omXJHwDTV/LcF5gNlj15Jap2g3urNQ6wQnidUjSIS5GwtVUPI
	Z0WqR2rGZzJnfD8mzztBms7xRT9fATe+2g+qMT4R7Q53K/lSaNHtjYLAwGMcILygN5iWqcaiPQ1hQ
	mW7W727EaM7oGgV0IdUhgckSJ6cUN9SyQYVSI2VLhaTkcYfYsrJY1DW852WmdOjZSHxbln6cnBJlB
	J55tHKTqVC6tycSCtf1V2fGIC0urBy1wZCYSRH+2g+Oo0yR2IKe86QRaAETWJPeXsJpFsJ4ESrSqP
	Wh1MTNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqpq-0000000BcMt-06g8;
	Tue, 26 Aug 2025 10:23:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5G-0000000BR0p-2ScE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso42122275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200917; x=1756805717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+V5B7XB9887xO03EbqFKbVpG5jSuIJ2MmOG0uv0TFc=;
        b=rwKXt31Gh0mMxZieFfnG/OLcnoTaDRZlxYP95mgj+hkjp2Dhu5hQdSlmj872AprQwZ
         AfkcArSVoZMiV391UbOEDS58cU3zi22pkhsB9vzQixQZ3mijhqMDssMi/AusJ+qENVtS
         hefYTLM7nWs5yANiXx9mm7HEThleN2/WlSEJhXRowQqV8kUDsvusJmZEmsXaJstBBMUQ
         4RcJptxUcA5TMrERMINSA5nszRhANuZqioX5ZyRn97CInCniNIxE61siLhSdZ/lAZ//Z
         lniO9NXgAl+hyAmfPzSKM3RWkdfDNUctdtleXwzqPhW9fbnhCxw23l2OzA2C8dOKSPUP
         RPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200917; x=1756805717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+V5B7XB9887xO03EbqFKbVpG5jSuIJ2MmOG0uv0TFc=;
        b=wOHhsuqzlL75sVCngxRfuwzTvmESUmNMI2XCeAdXacymOlGbVi4NuVeprsK2zIt4ZC
         kIgXPkrUQ/LWSo8VY4dvKSJyYJlggHL8JiwN1zGIpK1v2YnFzyx5deYiJmceC6Mx+08x
         Y6VXErrua4jRAoOyOxL8aqPvQs3gctRLW1+tnrYNqGTkkD7C+CmndwC9B//DDGnGn+gv
         FHiXyKJlb4FfV7lE1kbs5Qu55HCYNbr5xaH8FE2ONMSu5duHGrusLts2heQEip28SHpJ
         SOoYzPqf24jJ4RQAwkrEXCwMKHRgEBBMi1UJIyK3Yb/xRHI3gYbPFUiqcrfbJXmisStl
         rz1g==
X-Forwarded-Encrypted: i=1; AJvYcCWv/lqHgELC2uvFt0SUteJ8x6PpJJfYNQ05axvMmzQdrRD42GqPMr9rMLHhajAxbdv6bI9q+jkX0+lwk7ewS4Vy@lists.infradead.org
X-Gm-Message-State: AOJu0YwNsmUzIWNe+n/zdN0KutuJyNCSBIheCb/2X51sYNMSJNzLD7W9
	2QO4raLKTChx+FEoEi0q8xKK0fH4YOhAQMQY3EjFcHhK1laaXNPczuHpJFzhJ4Lv/OA=
X-Gm-Gg: ASbGncvkymgHgeE4EOyHTL9bneA52+fEF/5vWzGqh0dPTrGeGcPCxtKmrLEWVG2EyT1
	s2ZIxtnA7xviPtpD7I9wN76j/O06p9FVyllTZEbWe+x9eFTGyc2kEugG6Uk8b8Ft1eRg14tNwQy
	cqLUqvEhVGh04XqZJ3OhDoGz2l0yQM+hcPJKqVkHSVeCbnXs+icg2wVbsFPU9xxaHkN/wsfr9o/
	nJCT3pkvYT30sN9T0FJ0VR490VwsuobDud5x75iKl8aq7qWuINEoPnbOa2f/kxCgxoWYiFctaou
	+1GrfvxwP62vx61Cqc4P+2c+yTT8DyrIJNnqzR6dI6I63lLcWM+oCRM8Rr7xuJF6n2woZwniGn5
	OMDX7zgyYgGDel7HxH+wSCx9s1OU=
X-Google-Smtp-Source: AGHT+IHawXaxyFpf6V20RPHRnA+Xj73e0PfiG/R5jrKQvR81AApxbVTHOOBF7tFDUDjFuayPDkE5cw==
X-Received: by 2002:a05:6000:3108:b0:3ca:369b:33d3 with SMTP id ffacd0b85a97d-3ca369b3ceemr3556549f8f.27.1756200916965;
        Tue, 26 Aug 2025 02:35:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:06 +0200
Subject: [PATCH 05/12] gpio: mlxbf2: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-5-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o6NiRH2Sb5UemPomQKryCPorv+nEqcjLIoLpXSv4HOc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Nqodd1N+bOkIlcvHrbyQ0/M4d+qaEq6Yw7
 kgahFBuqomJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zQAKCRARpy6gFHHX
 csYsEAC7h1axxMoe3p7VM5YbZhug9fHOecamOK1a+oG5F2eFvqIM16/fY3G8I2jqzQBkLa69AMs
 +hpQpXgxboiHPthJFjZX6rI8C3MYuLYd3n07zImwXiKNZFsB68zV6Xj9aCeMqh5jAJYP8RNAHxh
 iX9ihsVYQ100oHtB8sHjTwZsTH7+45e9u6S4rxbZa0wHVbg4pbaj0L9qso59JBtHxWZEJRcjnYC
 UwjvYwcK+UBYYqs4nClLuvEQYMAyXeZ600449wIScb2iNruDIe3P95j/0GN7GlJQkfnU+OS7RN+
 BReVSpf7kgu+9tSY/y+Hs9YJZ2CbFl46vKzefKKb+VpWuwNAnM+xvcb9wZod95oUjR0GzGEC++X
 wpUcrw1LVxoTgfD+OxdEu1iw/f6E7uKesP86JSCce5oREpdfVg87qAglafGpx6A6BQbrBUVuMWL
 UwxaIDzJtfcjllD/8V0Xb7kcIe13/3D1a72/pPhlxTUMQ1zb2OHZpfsyQpSbrFkfzsrm0JsjuHl
 yzaxDx3ixKHjQlkDEjTNyALFuDzmmESpAuUkEmG5E9eOmsimRZ//8e0p+RqmP0JV7w3amjgEnxj
 lIjC8SRXv+mR4X0VIYGaFB9Ult2Myk6vPLwWlDWgGGQq3wPFnaZgJqJAi0Zp8B4foMOESZXOUEh
 ezPwqOdl6Bs8Kzg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023518_639128_03F0ACFE 
X-CRM114-Status: GOOD (  19.99  )
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
 drivers/gpio/gpio-mlxbf2.c | 59 +++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index bc4bba8b567c2605a77d4f9d4d7d916e8b096569..f99f66cd189ca71c9d188dff0a0b42ef2223abb3 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -6,8 +6,10 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -65,7 +67,7 @@ struct mlxbf2_gpio_context_save_regs {
 
 /* BlueField-2 gpio block context structure. */
 struct mlxbf2_gpio_context {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 
 	/* YU GPIO blocks address */
 	void __iomem *gpio_io;
@@ -132,7 +134,7 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
 	u32 arm_gpio_lock_val;
 
 	mutex_lock(yu_arm_gpio_lock_param.lock);
-	raw_spin_lock(&gs->gc.bgpio_lock);
+	gpio_generic_chip_lock(&gs->chip);
 
 	arm_gpio_lock_val = readl(yu_arm_gpio_lock_param.io);
 
@@ -140,7 +142,7 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
 	 * When lock active bit[31] is set, ModeX is write enabled
 	 */
 	if (YU_LOCK_ACTIVE_BIT(arm_gpio_lock_val)) {
-		raw_spin_unlock(&gs->gc.bgpio_lock);
+		gpio_generic_chip_unlock(&gs->chip);
 		mutex_unlock(yu_arm_gpio_lock_param.lock);
 		return -EINVAL;
 	}
@@ -154,11 +156,11 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
  * Release the YU arm_gpio_lock after changing the direction mode.
  */
 static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_context *gs)
-	__releases(&gs->gc.bgpio_lock)
+	__releases(&gs->chip.gc.bgpio_lock)
 	__releases(yu_arm_gpio_lock_param.lock)
 {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
-	raw_spin_unlock(&gs->gc.bgpio_lock);
+	gpio_generic_chip_unlock(&gs->chip);
 	mutex_unlock(yu_arm_gpio_lock_param.lock);
 }
 
@@ -235,11 +237,10 @@ static void mlxbf2_gpio_irq_enable(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(irqd));
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&gs->chip);
 	val = readl(gs->gpio_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
 	val |= BIT(offset);
 	writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
@@ -247,7 +248,6 @@ static void mlxbf2_gpio_irq_enable(struct irq_data *irqd)
 	val = readl(gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
 	val |= BIT(offset);
 	writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
 }
 
 static void mlxbf2_gpio_irq_disable(struct irq_data *irqd)
@@ -255,21 +255,21 @@ static void mlxbf2_gpio_irq_disable(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
-	val = readl(gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
-	val &= ~BIT(offset);
-	writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &gs->chip) {
+		val = readl(gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
+		val &= ~BIT(offset);
+		writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
+	}
+
 	gpiochip_disable_irq(gc, irqd_to_hwirq(irqd));
 }
 
 static irqreturn_t mlxbf2_gpio_irq_handler(int irq, void *ptr)
 {
 	struct mlxbf2_gpio_context *gs = ptr;
-	struct gpio_chip *gc = &gs->gc;
+	struct gpio_chip *gc = &gs->chip.gc;
 	unsigned long pending;
 	u32 level;
 
@@ -288,7 +288,6 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	bool fall = false;
 	bool rise = false;
 	u32 val;
@@ -308,7 +307,8 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&gs->chip);
+
 	if (fall) {
 		val = readl(gs->gpio_io + YU_GPIO_CAUSE_FALL_EN);
 		val |= BIT(offset);
@@ -320,7 +320,6 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 		val |= BIT(offset);
 		writel(val, gs->gpio_io + YU_GPIO_CAUSE_RISE_EN);
 	}
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
 
 	return 0;
 }
@@ -347,6 +346,7 @@ static const struct irq_chip mlxbf2_gpio_irq_chip = {
 static int
 mlxbf2_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct mlxbf2_gpio_context *gs;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
@@ -375,18 +375,19 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	if (device_property_read_u32(dev, "npins", &npins))
 		npins = MLXBF2_GPIO_MAX_PINS_PER_BLOCK;
 
-	gc = &gs->gc;
+	gc = &gs->chip.gc;
 
-	ret = bgpio_init(gc, dev, 4,
-			gs->gpio_io + YU_GPIO_DATAIN,
-			gs->gpio_io + YU_GPIO_DATASET,
-			gs->gpio_io + YU_GPIO_DATACLEAR,
-			NULL,
-			NULL,
-			0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = gs->gpio_io + YU_GPIO_DATAIN,
+		.set = gs->gpio_io + YU_GPIO_DATASET,
+		.clr = gs->gpio_io + YU_GPIO_DATACLEAR,
+	};
 
+	ret = gpio_generic_chip_init(&gs->chip, &config);
 	if (ret)
-		return dev_err_probe(dev, ret, "bgpio_init failed\n");
+		return dev_err_probe(dev, ret, "failed to initialize the generic GPIO chip\n");
 
 	gc->direction_input = mlxbf2_gpio_direction_input;
 	gc->direction_output = mlxbf2_gpio_direction_output;
@@ -395,7 +396,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
-		girq = &gs->gc.irq;
+		girq = &gs->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
 		girq->handler = handle_simple_irq;
 		girq->default_type = IRQ_TYPE_NONE;
@@ -416,7 +417,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gs);
 
-	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	ret = devm_gpiochip_add_data(dev, &gs->chip.gc, gs);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed adding memory mapped gpiochip\n");
 

-- 
2.48.1


