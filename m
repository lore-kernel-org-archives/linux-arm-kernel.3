Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7C4CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+DIEi97VRxowiBH9SZS+l4vGVYW+Y4BO4bSdhOraR0=; b=CNO2Fk4UM6CccktgFI89MBX/Fc
	/8H6Pwu61I8viAaFGMwuxIiXxWHUggZ2/d+a8Gq7MxpM7sQviGywu2bKHtcpf9u0pbcMteQyDyEbY
	alf+czrPlvSU5iq1RmD+/uKUVPnHVeUigf+qnLPi9rsnX02msQdVQIMe1eynRGY/XjvvUOCO6xLBB
	OOr9rbClesI8KMKfgQz6g0gmnso0JQnaxz5mKtVF8uQnLHbNj+LjkjlCOTMPwX0fSoOCJ50MmVvWF
	0res8rb8O+B+FwWqB8RU/pR/Bh4r3VmBE4uM/N+bzdFcPyCtfPhq5fDVU4FxuD+gB498JaYlVJLqw
	Dbx/0f0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjY0-00000005twt-2Pcr;
	Wed, 03 Sep 2025 09:12:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPr-00000005LkI-49tL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b84c9775cso24236365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886426; x=1757491226; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+DIEi97VRxowiBH9SZS+l4vGVYW+Y4BO4bSdhOraR0=;
        b=z16fI+Kyp4+kn9EQPnZt0Gf45cbdFv2pch5WR4u41nJ7+jMucg8WspaxeTS3mBvyus
         tjB/RlhOYLpVyvxbgVZNv2E71DQHRga/8lDhE+oNz/PITF7QV0fmKQuaT4JbhZno1lR5
         E9UYRyrmsOakz5DO9pcFDwPAI2y6gn/WLg2hmMUm9Sf/xA8YJwYabmd7IIRjJdqoNB62
         fXJpRutC+SFVpEeyb13nZWmK/tkixMBRzbAWQf5/nAsWfx/ak3LbpF8NbTn85jEQCvIb
         Hdgbx5pkDr3oiCerno8TgFP8K0S5cbh/X8u4ShsoVNaoaPlfaXGoRJIwDvstC79yNab3
         MNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886426; x=1757491226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+DIEi97VRxowiBH9SZS+l4vGVYW+Y4BO4bSdhOraR0=;
        b=SmlQWsSB0tM54Ze1fNMNMt7Va0GhrKURDRkR3o4sS9J7KazPZSsdWoNLKY9ef4wG+i
         ew12dHenvRN3D+ol9wyr42442qXThZzvjQnCfnH+Su2bwmLZAxtBTXZnurq0dMgvcCf/
         2VwBZwmAcXNHthMIWI2RaVnANJHJI3aYh1rFjSrNIcVaEPywWHIwG82PQmtRaj9enZ7h
         rkfIMVtaxnddoBmIOjhEUx/0Ic+VnwB6mVmTn0qp8uTKsS9LBgaPIFtUN0CW+pC9hQAO
         cx2PnIgxNdtwhAbHJ2Gj/PqKwlf6BvY8dV0GtfuxxyN1UiRo1tx3DY4EeNyS9pOQ3YaY
         9cGg==
X-Forwarded-Encrypted: i=1; AJvYcCXibcRtSkakLATCJmrXIgIc1Hyol7pV/iQIOr6KsRiZO59uiPb4gNTxRKrkA0dFR9x9NMwjmkDlNpWRquXPwSOS@lists.infradead.org
X-Gm-Message-State: AOJu0YycNjXmRFxITGBqRaMau4dEplRhWcXAXynbeWVELMp4W1fvZUjd
	MgESFkk0E1rn6HYVTHk/BS/4ybnxHeA51mXuG8q4TN8qJ2rcyF2fBNkLQ8Y5bbH0XZo=
X-Gm-Gg: ASbGncu32q3fLXMlc4/m+NytGjKmXfE0qyJrnsHo9DasMioKBFW+G1nffit/H5gLFe2
	ADZpxnzAF2N1xAUYSALZpqGiTpUtxaXYpvQsPfJ2dcQ8yYSusCxl7opqHd8tr7LSh0Jb0PwixoX
	u5hwo/JxQEV2UpyH1OopmCSt0jErHTzvsfNkBdU5UfTX0xeWjjZf/ubo9aqh4TSaNXQ7WiSPaux
	ZU2kbvrhbTpkQdRwLKjLRBcd//mCuS7WlZOIzOTeEfOSwuVg0L3PN6bxg8VHf1xx9PJZQo0ZnH5
	q1FdhTLXhUM2KvEOb4bskGlE2ZEL4G7i4qJSL/mU9GGwghblCPmBArKyd9tXcUBvY0gaj4vR4cw
	cCOcY1Fg1mjvyxSwDTYT82BBxx6Q=
X-Google-Smtp-Source: AGHT+IHKxGy6ueDBsEyQdQL/mk+XStM3UD+h7raXqFelNnqnwSJQLpRd1NJC05e3nunvconLiqQItQ==
X-Received: by 2002:a05:600c:1592:b0:45b:9a46:2655 with SMTP id 5b1f17b1804b1-45b9a4627b4mr23389375e9.13.1756886424911;
        Wed, 03 Sep 2025 01:00:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:08 +0200
Subject: [PATCH 04/12] gpio: blzp1600: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-4-ff346509f408@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5038;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=F68ayGcj6tukamf2TyWlBtvd60fsol9kVvTSarVzm3w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WRHkgVPwU1jO6DA6F5jZ9sztCHx1zF51/sn
 JLDQOuTfCeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 chBRD/9PYRGoH3ZtNfKbqvOXMxEhMI+o65yuL3AwbTwEpq4lypxB8b3XWDAwhJLBjQXZjGG47v7
 rVyij2wcwFSsh68pJoARwoVsFmW60fSwm8Pdv4pvkSCM3GsgB/JqBoQlH9dET6Z7CYlRYDTdlXd
 vUOtLGYjdIMR852oqlgIDjLOPlMqj9nkCstPsc0qf4HDUcUfeyrlYtsQweG8sJFZVHuj7T8okuJ
 P6fSl1aJhBU33TPwu/IdOoMQBbaHqDGisjim3gIpOvpIKw86F/3UeWsESd6+50jCNDl16kdS5PW
 IsJ/QaVFuY8/3agB8KeOH9rvcjNVL4FXVOQbW6jiSMF7OXBLEjnQnuLkJLm5WTe3ZDaEqXjhLo8
 aiRnVEs4dAUtPFCtAfDiDPOsOnLTHrNYF+2w8Ul++kmhlzOF2/mQpjkgRvuTbhXQzgE/y0GgqhX
 tAaK82tybg8qE+JSbpw1ckq9gOccyiN+MzhSk4rCfaI9opC9odeqzfjBlPRrJIpqUyn+WdDj8q4
 lUuqszf5aoD/s64KdSEJ5OYTnVEqkzdyFXCpkD55NJ0TnzPr0MoqvHTpeS/6II7egFMB7O+esSM
 XCkaVN65+5/e79zJXTElrA72n/lp5PMHxIK1sprqBrfOm1P9q1nr98SLLh38znf3J4MqiSJYtYI
 2ZuBKYegz9uas2w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010028_083990_988C507D 
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
 drivers/gpio/gpio-blzp1600.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index 055cb296ae54758cdc206d36aa1df7b8377d32ec..bfb35d59fa561c43889b186fdfb8d9184b750a53 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -6,6 +6,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -36,7 +37,7 @@
 
 struct blzp1600_gpio {
 	void __iomem *base;
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	int irq;
 };
 
@@ -76,7 +77,7 @@ static void blzp1600_gpio_irq_mask(struct irq_data *d)
 {
 	struct blzp1600_gpio *chip = get_blzp1600_gpio_from_irq_data(d);
 
-	guard(raw_spinlock_irqsave)(&chip->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
 	blzp1600_gpio_rmw(chip->base + GPIO_IM_REG, BIT(d->hwirq), 1);
 }
 
@@ -84,7 +85,7 @@ static void blzp1600_gpio_irq_unmask(struct irq_data *d)
 {
 	struct blzp1600_gpio *chip = get_blzp1600_gpio_from_irq_data(d);
 
-	guard(raw_spinlock_irqsave)(&chip->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
 	blzp1600_gpio_rmw(chip->base + GPIO_IM_REG, BIT(d->hwirq), 0);
 }
 
@@ -99,9 +100,9 @@ static void blzp1600_gpio_irq_enable(struct irq_data *d)
 {
 	struct blzp1600_gpio *chip = get_blzp1600_gpio_from_irq_data(d);
 
-	gpiochip_enable_irq(&chip->gc, irqd_to_hwirq(d));
+	gpiochip_enable_irq(&chip->gen_gc.gc, irqd_to_hwirq(d));
 
-	guard(raw_spinlock_irqsave)(&chip->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
 	blzp1600_gpio_rmw(chip->base + GPIO_DIR_REG, BIT(d->hwirq), 0);
 	blzp1600_gpio_rmw(chip->base + GPIO_IEN_REG, BIT(d->hwirq), 1);
 }
@@ -110,9 +111,9 @@ static void blzp1600_gpio_irq_disable(struct irq_data *d)
 {
 	struct blzp1600_gpio *chip = get_blzp1600_gpio_from_irq_data(d);
 
-	guard(raw_spinlock_irqsave)(&chip->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
 	blzp1600_gpio_rmw(chip->base + GPIO_IEN_REG, BIT(d->hwirq), 0);
-	gpiochip_disable_irq(&chip->gc, irqd_to_hwirq(d));
+	gpiochip_disable_irq(&chip->gen_gc.gc, irqd_to_hwirq(d));
 }
 
 static int blzp1600_gpio_irq_set_type(struct irq_data *d, u32 type)
@@ -121,7 +122,7 @@ static int blzp1600_gpio_irq_set_type(struct irq_data *d, u32 type)
 	u32 edge_level, single_both, fall_rise;
 	int mask = BIT(d->hwirq);
 
-	guard(raw_spinlock_irqsave)(&chip->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
 	edge_level = blzp1600_gpio_read(chip, GPIO_IS_REG);
 	single_both = blzp1600_gpio_read(chip, GPIO_IBE_REG);
 	fall_rise = blzp1600_gpio_read(chip, GPIO_IEV_REG);
@@ -186,8 +187,8 @@ static void blzp1600_gpio_irqhandler(struct irq_desc *desc)
 
 	chained_irq_enter(irqchip, desc);
 	irq_status = blzp1600_gpio_read(gpio, GPIO_RIS_REG);
-	for_each_set_bit(hwirq, &irq_status, gpio->gc.ngpio)
-		generic_handle_domain_irq(gpio->gc.irq.domain, hwirq);
+	for_each_set_bit(hwirq, &irq_status, gpio->gen_gc.gc.ngpio)
+		generic_handle_domain_irq(gpio->gen_gc.gc.irq.domain, hwirq);
 
 	chained_irq_exit(irqchip, desc);
 }
@@ -197,7 +198,7 @@ static int blzp1600_gpio_set_debounce(struct gpio_chip *gc, unsigned int offset,
 {
 	struct blzp1600_gpio *chip = gpiochip_get_data(gc);
 
-	guard(raw_spinlock_irqsave)(&chip->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
 	blzp1600_gpio_rmw(chip->base + GPIO_DB_REG, BIT(offset), debounce);
 
 	return 0;
@@ -216,6 +217,7 @@ static int blzp1600_gpio_set_config(struct gpio_chip *gc, unsigned int offset, u
 
 static int blzp1600_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct blzp1600_gpio *chip;
 	struct gpio_chip *gc;
 	int ret;
@@ -228,14 +230,21 @@ static int blzp1600_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	ret = bgpio_init(&chip->gc, &pdev->dev, 4, chip->base + GPIO_IDATA_REG,
-			 chip->base + GPIO_SET_REG, chip->base + GPIO_CLR_REG,
-			 chip->base + GPIO_DIR_REG, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = chip->base + GPIO_IDATA_REG,
+		.set = chip->base + GPIO_SET_REG,
+		.clr = chip->base + GPIO_CLR_REG,
+		.dirout = chip->base + GPIO_DIR_REG,
+	};
+
+	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register generic gpio\n");
 
 	/* configure the gpio chip */
-	gc = &chip->gc;
+	gc = &chip->gen_gc.gc;
 	gc->set_config = blzp1600_gpio_set_config;
 
 	if (device_property_present(&pdev->dev, "interrupt-controller")) {

-- 
2.48.1


