Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCFECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnCK+4GcmtUWl9DLQFGW+1eBeOCL1T5Ocq961UWj+Gc=; b=Ra58fdZK5f3nlCxI9JyMMLCPG/
	+UAB/G7wD8YZ74nMuebBzXvJ6Og9SflvFkrn0pTueCbPtZufM+5ISvR2Je04dGxDz0AR9mu4kaKN0
	acswljmIJZd9N2hcdqOWm1NnrZdRpcCp6iDOa1lWrQpliH+rqpTasDuIdwskutUUvKhbWJM/w8pEq
	R4qWHmeKxZCEBs60GYSxBJYL2tHPiOg0pfRKhxwmnj+zfwOwlkbZifRNRsO1OVoh81r4CZIl/dlo6
	bNE/hxMY59k2Sy1sTpu7cMpHBdL1lPPRV3L8hN/hUcBTQ5lXisgBdWuHvrf12SSeD9EmZPvqoNZHn
	sV2do8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjg2-00000005usj-3yiU;
	Wed, 03 Sep 2025 09:21:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPu-00000005Lmd-04Pj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45cb5492350so3371595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886429; x=1757491229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnCK+4GcmtUWl9DLQFGW+1eBeOCL1T5Ocq961UWj+Gc=;
        b=lxP0SUJBdXG7uFK6Go4d2X7qouF6kPOh+P1eVUdpkIYxeeksGMmyNx5Wtl6TI1ghY/
         viRVB4fk3OF79K4XRkiQLAQz+OtdrPh1YIoPNIJWl+WVsKhbfyrkMRPqrd7XKFkS25mc
         CcqglXwqXs8/mEZdWp+QmXm+uWhRm75EeakxbXHRLx1D/kMs9lKN8EmVV6XltArd++iE
         mvR4uM48elKQzNDQ4J6hQYYQDuY57XobwHxiP1us+ENO3rg1qOApiCvtgAPpDeA3gnwI
         r7z54nV5DLgAUJJzKMs4vQghl8u6ncmw96xztdIElnzoBIMNmYLQV7ioFVFJeg+pcPiO
         oQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886429; x=1757491229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnCK+4GcmtUWl9DLQFGW+1eBeOCL1T5Ocq961UWj+Gc=;
        b=AlAK5ZiPs7qZ17LysfR5AV3MczbXJut7dqwg0MhhIalKbVesSFLlyznm6di92Walw2
         e+zZwfgGt+TL2x1KNOzroGRdVrk+Xm8VIH5NRXPA8CAJzxOi7vWJ1h7R1SnbBxEJBDF+
         m5UxgpP2n7o99QTAR4EflSDD/aA7kI1/aRaUzttY09ceQ1P8iUmD1NHh28A5+ccYk71+
         Px/fVSHn7bHLJGO77NYXcHNlHkFIKY/Y/T7uoVUHZGZsPNfUeci0avBLUHWrimh02SoH
         ax9aWCr8TQMUKJA9WpRn4nVXLqNvrA3axnIPEkhFHaHGpT5fFoGTG11NTKp8T/oORj9j
         b3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWa7fGW04RxXzcUNAQKSTiWGjNLQRNp8Qz7HtLXAX+yOPMxi2710e2WNf1tSsvj5WT/wyQLVKl5wp99ytf53/nw@lists.infradead.org
X-Gm-Message-State: AOJu0YwumrGCZ7sQXf8JeQo52v/9HRjaIISEy3zLWHrkOQTk0ScB/ugF
	9jeMU17qDwYvYwZO/JRCZ5ER1NIkDgbBFep9djYdZn/73NNnjrDOPw6CdHrtk3WraT4=
X-Gm-Gg: ASbGnctS/9ZS0CAFRvmH41NmqFZhXDjjkBjRmfFXkH337emX94GZovuAxQ8adwImDPh
	beOFLVU0qsm17J06KDGe0Gk3xaMe5TmBv3lVeHR/Hdk3oDGqoQ1+2rdyFdIGJyYO7vcDU8HJTVC
	XfAi52CfbKrHFMLjq00kvkSV1gPYcPxbLOfffM9+mmpwsZPmJDmeXbRe92Qn51gGsFj6ro1WLpj
	eItK+n5fQdIqlWVTGAqt3Z3T3GkwAx3b+eScC3MHosGqCE2aFbm+4e1WOn7tMMoAMtiemLhyuP6
	GRNEZ3Z6escFAAcw9ZAT1lQb56sbLK16QiTnVCmO0rQIq2ybrZcATeqQ491uKXBO4TubpWTXHsP
	OmyihiPRugbh25B8Jea0UeBWlw7E=
X-Google-Smtp-Source: AGHT+IE8VpkQ9cPsjhCBKghShX0Bl86iztiD15845yI63ssB39+OiqSQqOV8L5+iSxUO0uLkiZ8Vkw==
X-Received: by 2002:a05:600c:3b1f:b0:458:b7d1:99f9 with SMTP id 5b1f17b1804b1-45b87bf22ecmr114918845e9.11.1756886428337;
        Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:11 +0200
Subject: [PATCH 07/12] gpio: tb10x: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-7-ff346509f408@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5920;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LEfQoq/BGGaE4EFy3J9Er3X0SX0E/ULNzxMEYdtgsLk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSJxSeZd8tGawqeqLKQYFSa+dWYjIv4dw6W
 zAqDihhEeeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 cibjD/91jPhdREz7ITpTc4Bx2jp/TVrMaWDc8rjbdLj7Db9CBR3YfOU1BkXTOMjss1kF+cxJRxY
 /rBQwdz1nHMtjBCIEYK0fpZCSXAe3HEUf4Xgf4WN6eHtD7xlySRfp7FtAEaoAVXEKzYpgvCbPec
 iMVPgcTDQfOGnDTaCEC7qcn/qHUsAw9AjEN9RP9YYVh3iQNoSAzlG3sGyp27iSqXkCnBmQq/ZZA
 +Jh0XUm7PUqunAil9Ychwag0TE03hvSGdgICXuVf+hYqLAtqexOyd8jwdwX1va8w7PeeQFHqR5m
 1UxnycC034tJ1FgNc/rOxazX9X5xDsstiMRaEEFc7psWaxrG5kXknRGZLSkyMGsqPKN3wjjpqOA
 bSUhpEaMmfRdZKi3b+h7rZTxY4OJYJNewoKdw2GU6iWoZBZUBl9xrPTSw6MSxFywyuo6Iel8+iq
 Uofkcg6elIP0YuIbDScyRC8YzH6OCd1iIEDgcf2ev7OcaskvPLlgTEvZ04IPWI0ERmXxS+DayXW
 S6vByR80LiXFoLpXiGHJbH85u6Qe5kFdcxkBVnc63nXNaK55jp0QYFUO+XHl24G6yBolOJxXQHJ
 cSOB+qQf6pdOVXorwlrQUXtyVv9Nf1sfnWntJ4WZYyPHlv+45cJawr2kKMMcPH5tgu/gKmjKOOT
 VZqUiuxejp6XHIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010030_102854_9A03CF15 
X-CRM114-Status: GOOD (  21.78  )
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
 drivers/gpio/gpio-tb10x.c | 60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 356d0a82e25f29f60c43801cee6c6803ea7a22c2..f20b6654b865555579bb356a336308e23b0e5af6 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -20,7 +21,6 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 
 #define TB10X_GPIO_DIR_IN	(0x00000000)
 #define TB10X_GPIO_DIR_OUT	(0x00000001)
@@ -36,13 +36,13 @@
  * @base: register base address
  * @domain: IRQ domain of GPIO generated interrupts managed by this controller
  * @irq: Interrupt line of parent interrupt controller
- * @gc: gpio_chip structure associated to this GPIO controller
+ * @chip: Generic GPIO chip structure associated with this GPIO controller
  */
 struct tb10x_gpio {
 	void __iomem *base;
 	struct irq_domain *domain;
 	int irq;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 };
 
 static inline u32 tb10x_reg_read(struct tb10x_gpio *gpio, unsigned int offs)
@@ -60,16 +60,13 @@ static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
 				u32 mask, u32 val)
 {
 	u32 r;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&gpio->chip);
 
 	r = tb10x_reg_read(gpio, offs);
 	r = (r & ~mask) | (val & mask);
 
 	tb10x_reg_write(gpio, offs, r);
-
-	raw_spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
 }
 
 static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -107,6 +104,7 @@ static irqreturn_t tb10x_gpio_irq_cascade(int irq, void *data)
 
 static int tb10x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct tb10x_gpio *tb10x_gpio;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -127,9 +125,9 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(tb10x_gpio->base))
 		return PTR_ERR(tb10x_gpio->base);
 
-	tb10x_gpio->gc.label =
+	tb10x_gpio->chip.gc.label =
 		devm_kasprintf(dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
-	if (!tb10x_gpio->gc.label)
+	if (!tb10x_gpio->chip.gc.label)
 		return -ENOMEM;
 
 	/*
@@ -137,29 +135,30 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	 * the lines, no special set or clear registers and a data direction register
 	 * wher 1 means "output".
 	 */
-	ret = bgpio_init(&tb10x_gpio->gc, dev, 4,
-			 tb10x_gpio->base + OFFSET_TO_REG_DATA,
-			 NULL,
-			 NULL,
-			 tb10x_gpio->base + OFFSET_TO_REG_DDR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = tb10x_gpio->base + OFFSET_TO_REG_DATA,
+		.dirout = tb10x_gpio->base + OFFSET_TO_REG_DDR,
+	};
+
+	ret = gpio_generic_chip_init(&tb10x_gpio->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
-	tb10x_gpio->gc.base = -1;
-	tb10x_gpio->gc.parent = dev;
-	tb10x_gpio->gc.owner = THIS_MODULE;
+	tb10x_gpio->chip.gc.base = -1;
+	tb10x_gpio->chip.gc.parent = dev;
+	tb10x_gpio->chip.gc.owner = THIS_MODULE;
 	/*
-	 * ngpio is set by bgpio_init() but we override it, this .request()
-	 * callback also overrides the one set up by generic GPIO.
+	 * ngpio is set by gpio_generic_chip_init() but we override it, this
+	 * .request() callback also overrides the one set up by generic GPIO.
 	 */
-	tb10x_gpio->gc.ngpio = ngpio;
-	tb10x_gpio->gc.request = gpiochip_generic_request;
-	tb10x_gpio->gc.free = gpiochip_generic_free;
+	tb10x_gpio->chip.gc.ngpio = ngpio;
+	tb10x_gpio->chip.gc.request = gpiochip_generic_request;
+	tb10x_gpio->chip.gc.free = gpiochip_generic_free;
 
-	ret = devm_gpiochip_add_data(dev, &tb10x_gpio->gc, tb10x_gpio);
+	ret = devm_gpiochip_add_data(dev, &tb10x_gpio->chip.gc, tb10x_gpio);
 	if (ret < 0) {
 		dev_err(dev, "Could not add gpiochip.\n");
 		return ret;
@@ -174,7 +173,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret < 0)
 			return ret;
 
-		tb10x_gpio->gc.to_irq	= tb10x_gpio_to_irq;
+		tb10x_gpio->chip.gc.to_irq = tb10x_gpio_to_irq;
 		tb10x_gpio->irq		= ret;
 
 		ret = devm_request_irq(dev, ret, tb10x_gpio_irq_cascade,
@@ -183,14 +182,15 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret != 0)
 			return ret;
 
-		tb10x_gpio->domain = irq_domain_create_linear(dev_fwnode(dev), tb10x_gpio->gc.ngpio,
+		tb10x_gpio->domain = irq_domain_create_linear(dev_fwnode(dev),
+							      tb10x_gpio->chip.gc.ngpio,
 							      &irq_generic_chip_ops, NULL);
 		if (!tb10x_gpio->domain) {
 			return -ENOMEM;
 		}
 
 		ret = irq_alloc_domain_generic_chips(tb10x_gpio->domain,
-				tb10x_gpio->gc.ngpio, 1, tb10x_gpio->gc.label,
+				tb10x_gpio->chip.gc.ngpio, 1, tb10x_gpio->chip.gc.label,
 				handle_edge_irq, IRQ_NOREQUEST, IRQ_NOPROBE,
 				IRQ_GC_INIT_MASK_CACHE);
 		if (ret)
@@ -218,9 +218,9 @@ static void tb10x_gpio_remove(struct platform_device *pdev)
 {
 	struct tb10x_gpio *tb10x_gpio = platform_get_drvdata(pdev);
 
-	if (tb10x_gpio->gc.to_irq) {
+	if (tb10x_gpio->chip.gc.to_irq) {
 		irq_remove_generic_chip(tb10x_gpio->domain->gc->gc[0],
-					BIT(tb10x_gpio->gc.ngpio) - 1, 0, 0);
+					BIT(tb10x_gpio->chip.gc.ngpio) - 1, 0, 0);
 		kfree(tb10x_gpio->domain->gc);
 		irq_domain_remove(tb10x_gpio->domain);
 	}

-- 
2.48.1


