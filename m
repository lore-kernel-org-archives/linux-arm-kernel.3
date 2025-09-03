Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE137CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYwmni1hXWO/pBUFWlI/OZdneLuAnbaQ5tKKR7h+3l8=; b=2w03JPPn2QrbfUQu7qxMXKjUs0
	DmFruHg+cqueR4zdlD0VCqta2oBC2PyiQukcidGNFmOnCY64KDkmP3ghHHsDS+kakjEV0WObZynMh
	y7E+47YBn9l5WzZm6ctPmPxgNrkaZrpqw2wLirqLQHQmLgr/fIdKkETRMXsHZkaS0mC0d+rY0mjBi
	ClXKUmZTZ8ytyU4WH+EMiybgaAZDsDE3wszeI8oTPzZiRylaxtD1836Gt4L5+jSw6KNFzyodWZf9t
	fxIJ3bHJV59yjBtjsxNqLPnpgkCXgXCdcrOosiZoaT+FIdNXw0MPwdco1qS+pSt7WkiQVv+rWeudO
	beTRj5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjVK-00000005tPi-2uJr;
	Wed, 03 Sep 2025 09:10:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPp-00000005Lix-1qPs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3db9641b725so1070550f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886424; x=1757491224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYwmni1hXWO/pBUFWlI/OZdneLuAnbaQ5tKKR7h+3l8=;
        b=zTRmKOl3/qgl/uylN6VIvg6C/K67sVh6JTo8YsedX56X/zu67sbI2xFvo5aCooCiwb
         e2I0o/dkndZMJQw5z7JolXWPWmqIvYjKR0r1QYpP3uVLwi1Xpk7JPEp98mre7OiIeFKm
         euZD2Iq1/EpryZTeuo8Yfs7SuRHmw/V6BV37llQhXOG+fOZdv21kJ1FXtJ+gCA65b494
         V8onaBZiAVM+GpKD+H13arpn4QmyBfLiU0jSU46ygKUvwZVy9KHyyABJmHmWUUE5Rvas
         5Kzg91XDfWMvmOzvMoEIrq7zQDo30Yz9Ijf7ORPVl/Kdl33hwZvnoRgoR6TWp1W+VphK
         StpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886424; x=1757491224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYwmni1hXWO/pBUFWlI/OZdneLuAnbaQ5tKKR7h+3l8=;
        b=LkpVh1qJ0iW92hjj3rffzlCSoi15j+gGKeZatKdPGJaGaWKtehsQgcTKhin0akqEt6
         qpU+G/G1OxfgL1b5mcO33d/FeI7H3grKrNRSYkTje9yu0XM1JOjwmYoaX8jfcASelIHZ
         REBKfctxdPlyuMgHxK76BHV8PUI8hPyJukBzqYGa+OsjNUl3xinerL8w2e0hu+vqTCKT
         cRjjzkzjmXp/YSImM8bTCuDCX/VUJLVeeFhKrfVzGYV7tIIjLgZ2gDBAxyEDVEo4mhLe
         zqDeie7NOCnjeyb9RX9W6MGBndtuP9OGzXIEBX3yuaihQnhmgISBzSGiZ6oQtBXxm7YF
         BDSw==
X-Forwarded-Encrypted: i=1; AJvYcCVFpqlv7FBuS05deR8lzsMMjdAPW/PbxH3BIYcoGShXpfWTgMbkdw1A+8uYYzgK1hB8csW+ZcUtDC8QgfO0itUg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+oa8tfvOhZVcuMpAqrqOl456ABKZGowyEksgaX0Yl3tLlx2Ng
	c42s08WfPlisuJ+RClzyQZIc5BNEagrs3WL/hgMoxOAVsiVfZD1I+zK1cRf7dSJvUqE=
X-Gm-Gg: ASbGncu3GP/mykHOhZNd+P34wEwUj4BVhUbmr2fAMT3MfYlgLIjciG5L3hdjk0xSHwF
	tdDB24R78WXL4Mgpde4SwpjL0oAu8wcyKkW1X32WzeYb04kl0CYtFAkDCn1SagMZUJQIjURr/SB
	r5udfPHdeuGyrHGjMeq19gEBM8nsGLp/K7a4SbuyVlSYiUFyO5IAlIw7CPbpjQ96tnae1IZN5Vq
	p87Nb1yb0WPOi2B0dAIqyEaN7m5MzU79hiKInDl6TuCMxu/KWLoEhgatbC+tqgZkjC9sh6ZMR+g
	KxgTcV0BcLcwrUJcC/uBTXbqUyh+jebLe4Unb4CyJClntD2uffbEG4/hNsqciz6Ak51ouZ17M8Y
	eSacqmHuZVdfMkBB9
X-Google-Smtp-Source: AGHT+IFmkjrHAAYGj6IwtUK0RPtQQhaSyqEXfmZGy9M5k0aw4twRLthEEYHwEar7N6lyyToFTgs2NA==
X-Received: by 2002:a05:6000:2089:b0:3c9:79fe:f4f5 with SMTP id ffacd0b85a97d-3d1dc5a233dmr7864793f8f.8.1756886423609;
        Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:07 +0200
Subject: [PATCH 03/12] gpio: idt3243x: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-3-ff346509f408@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4965;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=e/qGrO8l+ENSlw7HsMx562UJMTgOPKWKnabZxYTV0tI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WR0q/PabxdIvdLuE5NvJ2Vf33JlqQQHM24o
 lmAyWJXZSiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 csuFD/4l6q+pYGbMLExGUqxOdQN4Qaa2wc88p4+eTqITDl6QmdBk7jg8eDU1raZaO50yTBq8nyX
 WMMpOG0CVqAwUjYw+jrfXEVBkMbnNl2HTlxp/R1SVyUyJrXtLhtwjYf2BLh18hhNKNLf+uw9nJk
 zReeTu5hD90OVTk9qoq7ZFEn61vZeEcT1qjGkM+t/JHkvh5HC4WtmC9uH7FP2PwcyreqTDTvs44
 2n+qz0lTIlHsek8dAsKIk8g/XHCXKz0k8UXTupshUiJO6x0GU9iP4VfPZeMb/QEzC3sV+TzgHxY
 cw5OvDsNufNtrHMGf5piBrg+fHvyGhlJUjyNYYweDw/20ty4XMQ7fQRpspSJ8KHjIyd5YgnUnX/
 H5r5q+z8I+EnYalW22flHyOlYK4BHdhuf3+h+jHylT6Lx2qIdDnQDjvhTuhsIUhczCfARTwdJtk
 31ylCCp8KxYth7VXtiYI3vC+Z6EHnFb8oTiaQXDSjwhum9GM/0XNpLa5lIy8FdIZe3R6KcBZzFh
 V/OeNbJ3UvbAiuVPnUkk1KAppgZ/6A9Z/KvgHLSDj4GHzGqkbPrczDKUtOoiKmg6zdK8JqjmeJk
 9dCSx+hYa2qw+joESxnZ1cep1QqyS00e/ligPrj1e8elBK2CIEcir+oHv3CtSd+blUDgw432spk
 apu8x7vO5jXT02g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010025_485300_3F26386E 
X-CRM114-Status: GOOD (  19.21  )
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
 drivers/gpio/gpio-idt3243x.c | 45 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 535f255144556ecb71c5e3f8756f9f4a8bd9ca3d..232a621ba086ef66b2d2f0d471388c77ac5caa5b 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -18,7 +19,7 @@
 #define IDT_GPIO_ISTAT		0x0C
 
 struct idt_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *pic;
 	void __iomem *gpio;
 	u32 mask_cache;
@@ -50,14 +51,13 @@ static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	unsigned int sense = flow_type & IRQ_TYPE_SENSE_MASK;
-	unsigned long flags;
 	u32 ilevel;
 
 	/* hardware only supports level triggered */
 	if (sense == IRQ_TYPE_NONE || (sense & IRQ_TYPE_EDGE_BOTH))
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
 	if (sense & IRQ_TYPE_LEVEL_HIGH)
@@ -68,7 +68,6 @@ static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	writel(ilevel, ctrl->gpio + IDT_GPIO_ILEVEL);
 	irq_set_handler_locked(d, handle_level_irq);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 	return 0;
 }
 
@@ -84,14 +83,11 @@ static void idt_gpio_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-
-	ctrl->mask_cache |= BIT(d->hwirq);
-	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
-
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip) {
+		ctrl->mask_cache |= BIT(d->hwirq);
+		writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+	}
 
 	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
@@ -100,15 +96,13 @@ static void idt_gpio_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
-	unsigned long flags;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	ctrl->mask_cache &= ~BIT(d->hwirq);
 	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
-
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
@@ -134,6 +128,7 @@ static const struct irq_chip idt_gpio_irqchip = {
 
 static int idt_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct idt_gpio_ctrl *ctrl;
@@ -150,18 +145,24 @@ static int idt_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->gpio))
 		return PTR_ERR(ctrl->gpio);
 
-	ctrl->gc.parent = dev;
+	ctrl->chip.gc.parent = dev;
 
-	ret = bgpio_init(&ctrl->gc, &pdev->dev, 4, ctrl->gpio + IDT_GPIO_DATA,
-			 NULL, NULL, ctrl->gpio + IDT_GPIO_DIR, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = ctrl->gpio + IDT_GPIO_DATA,
+		.dirout = ctrl->gpio + IDT_GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
 	ret = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (!ret)
-		ctrl->gc.ngpio = ngpios;
+		ctrl->chip.gc.ngpio = ngpios;
 
 	if (device_property_read_bool(dev, "interrupt-controller")) {
 		ctrl->pic = devm_platform_ioremap_resource_byname(pdev, "pic");
@@ -172,7 +173,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 		if (parent_irq < 0)
 			return parent_irq;
 
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &idt_gpio_irqchip);
 		girq->init_hw = idt_gpio_irq_init_hw;
 		girq->parent_handler = idt_gpio_dispatch;
@@ -188,7 +189,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_bad_irq;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(&pdev->dev, &ctrl->chip.gc, ctrl);
 }
 
 static const struct of_device_id idt_gpio_of_match[] = {

-- 
2.48.1


