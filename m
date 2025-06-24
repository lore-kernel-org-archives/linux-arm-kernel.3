Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=; b=Gkd8HbH9DtHDToSKqubSYF/pxl
	Sj43sjvq5nJHwnQ3iCqi/ZRliyADF1cgcwea18F1xT3PtugcFNkL9w4D059h1mI4FxIgsgRnrXvJ5
	lBiF2YTqBDyCroMx3xA9QtIb6d/vFg6PBFKTo8cyJ9rkpRxnN/ugLFKMM+G9kn2dYPj9Bf9r7oOaL
	518vRqf+GXtmfHag4k1ZDz0/TSrAYXGG9I1y9S0vXJmgwxvuPTgFjuPFXBsVgpAnGfu4WVHWrNCb1
	DR046szMb9s93ftQ67tfk2AttpqbdVzDWDF7XGaJ9xBguk8smI4MTDsValyI59eVeDmlgJW70y4tS
	Q3XfBa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4ED-00000005oz9-1arZ;
	Tue, 24 Jun 2025 14:02:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gl-00000005i8a-2f1r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so3010985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771670; x=1751376470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=;
        b=WRixMWKkIauYXj7hZ/EKDnO+p3T34iAcBstZk0ewDdTFDKM7+beaIJrPkIWgmVkaIj
         AuGxX80gdKRILe9mO8/8dmxji4lld0QRpMy4+rKC529m7qhfUDzDEjU0OKVhyRO1FYIW
         FIh8ZiRyNr2xMZ78GNtY0UHUfk2q60u2UfJRjmdxnKLm+bVS1MYlJhvEa7D+oas4HOjP
         91SjFi+gFQSnKnitFV8sbf7KjmXcL4gwS3yCtpq/Aj5CjUQYq4F3VULE1uoSCcmIQvyv
         C4kFzKgajJ1BLKwgIdGapPMc0qSCGMBfRyxiIVTAYouxQSs7P494xY6+ubeCq3flrShH
         qrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771670; x=1751376470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=;
        b=PSCFgRgtiTDKG/kc2+FAqzeKIMU2x+xF1zQ2WEq26Zw7yDOuI4e4AwOoX+DVzzjK84
         Kfyr5xv9Ue5JsMPlddd3/rXnUQhq8Hmj4OUOfE8feLmo1Uz1niRkLuTa6KCEXc9I9iQc
         DTn0gNyWj/fBnwvnsgF4FMYgUR182sUUjux4KWj0ijAS1kbUM8ORU7MmPT9tx+ZzTOIi
         6dVG7rWyj4//cxULCz6oLhjX4RWWIYZRIEd1DCNLqu7jOEMtUhoCcLznMkxJiCbgckIF
         P5SBzTWUzIxI5HZsLXfXV+0OEoMuBLIFT8s6PnOJrRr1smWQBp7y4KaUYWXRyRx60FNa
         4x9g==
X-Forwarded-Encrypted: i=1; AJvYcCVgmUfDb9SjwU4YrcSEL67jR6bmBlBpjEOzijIZBil73GQxAPVJaJnrHvXbAqDDiS50OeJOwuP1F5dQRXy+1xqJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzA1sj5ymgDpkk0d08Xajb0L0Ukcl4H3D0j1Gabiuxk5umQUIoJ
	TMtX3yP6ye2mxaaXqnnlCV20y8jZclvZ1TfPQzrJBoPTpazw2ulJonO2AdYK9D69cFk=
X-Gm-Gg: ASbGncskO3j6/IyBo6Kj0s/V0PZNy76JBCI/erMVGoorEqDJ/61JOZn1t5pxoeAtchf
	fGPZ11OhBm2PvBEVr0v9EtqkPqm+xiUxY6YaY4zOBNJ9RPPE73XlVCmS9MQRBvfwYl/0oVvgAaL
	M9RX6kdWcV85XcZlAO+bSAEJyFj4dHMyCXael1SW8eKHhGQszj3FmUjOg+WSkjYaVMO5wPDqe41
	8G62xxenKAG9F7XVNX2FygJAklnn1QkMNpojzOMO9S/HEEHfo2uKpz5l7rOIPgVfXsqmRTBPCQE
	OVjfqdth8qTbtuW8xf+dhFKIJTUMhAvLOFCP7wGilPmCzT+JzFKQodVV+xEq5Rp5jw==
X-Google-Smtp-Source: AGHT+IGmfcrcXv6qaFxA1auGYNl1GVJJJbUjwBsK+LmrzR1ie3pLAeiZE448ONV4ULqg3P1+gJfQqQ==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr149902315e9.27.1750771670024;
        Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:38 +0200
Subject: [PATCH 6/8] gpio: cadence: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-6-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ss3poqXhlzfLiQ3jDcCO7Ok2SGZU2TtFIGp++gjWDXE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfNhmKPg3fhAoCDk3zfW13JMYx7TnigjXcX2
 WYivj+S/buJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cukxEADOJBsGcGX2kQ6qOkTQJ1Ttww1F/PBoovmhmVco4RYgvPzBD3oT06ENe65hXmz24vD6Fy3
 yMJPZN1fuYn5UddaygrS5rHO3A+0DljhVkz7PwE1cTBIs8616DckVet8FtrDXIwJyVzu8x55zMv
 UfvHiGfccZqbMHhQxVAxz6nQkjOQd3/JDZEtTY/bsANtSfH3f0rSlcqp4jL+pdsaNeZLMJ5LOhW
 ePIwy8NAzS2tHbIXjK2jMC8jWDX5nZyxQIYwf3pIa7nn4A/JP4tRLXXtiCmN2+Vd3qychphUQTD
 vQOLstSPzVRsXFyoZRr657j/m2g1Kj7Ayc8xLo2zqLgRMskyq68sCoszsK1AS1GqnFHPx9RxjZ7
 ab4Sd9xtfeZ1sdjht1VOK74HY+NGAAoUtX3hJN7Q98rNxmlmkZ/cFySw8ninCz2d28q2Ra03X86
 3iHV2ABaAIN1fDLQbGqc6ISuTL+Zlj/jCwZFyV/iUcLBoc6NRc3sYGDcPWhSHvyKDXF2uXDX34q
 m029iuqJcZTJCalVj2hMMG1gtc8YmijWfxgFH0x4AG7Tr10207uV5yilsU7WJUd5y18geyXNaYX
 jVd2/+nZdV6JvAwWLPEJ0UIwIJmv7pD/TGTPTrNStpuUPVONPnptUrP2YXHv5vJlWmCMUPxzIsC
 OSOIGxyS07RCzWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062751_678873_874463EC 
X-CRM114-Status: GOOD (  18.89  )
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
 drivers/gpio/gpio-cadence.c | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e6ec341d55e9047b2fa8718799ba72d54624388e..8243eddcd5bbe537bab1bedc72c80ee88839f5d3 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -12,6 +12,8 @@
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -31,7 +33,7 @@
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
 struct cdns_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
@@ -40,7 +42,7 @@ static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
@@ -52,7 +54,7 @@ static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
@@ -86,7 +88,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -142,6 +144,7 @@ static const struct irq_chip cdns_gpio_irqchip = {
 
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct cdns_gpio_chip *cgpio;
 	int ret, irq;
 	u32 dir_prev;
@@ -168,32 +171,33 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * gpiochip_lock_as_irq:
 	 * tried to flag a GPIO set as output for IRQ
 	 * Generic GPIO driver stores the direction value internally,
-	 * so it needs to be changed before bgpio_init() is called.
+	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 	iowrite32(GENMASK(num_gpios - 1, 0),
 		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 
-	ret = bgpio_init(&cgpio->gc, &pdev->dev, 4,
-			 cgpio->regs + CDNS_GPIO_INPUT_VALUE,
-			 cgpio->regs + CDNS_GPIO_OUTPUT_VALUE,
-			 NULL,
-			 NULL,
-			 cgpio->regs + CDNS_GPIO_DIRECTION_MODE,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = cgpio->regs + CDNS_GPIO_INPUT_VALUE;
+	config.set = cgpio->regs + CDNS_GPIO_OUTPUT_VALUE;
+	config.dirin = cgpio->regs + CDNS_GPIO_DIRECTION_MODE;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	ret = gpio_generic_chip_init(&cgpio->gen_gc, &config);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register generic gpio, %d\n",
 			ret);
 		goto err_revert_dir;
 	}
 
-	cgpio->gc.label = dev_name(&pdev->dev);
-	cgpio->gc.ngpio = num_gpios;
-	cgpio->gc.parent = &pdev->dev;
-	cgpio->gc.base = -1;
-	cgpio->gc.owner = THIS_MODULE;
-	cgpio->gc.request = cdns_gpio_request;
-	cgpio->gc.free = cdns_gpio_free;
+	cgpio->gen_gc.gc.label = dev_name(&pdev->dev);
+	cgpio->gen_gc.gc.ngpio = num_gpios;
+	cgpio->gen_gc.gc.parent = &pdev->dev;
+	cgpio->gen_gc.gc.base = -1;
+	cgpio->gen_gc.gc.owner = THIS_MODULE;
+	cgpio->gen_gc.gc.request = cdns_gpio_request;
+	cgpio->gen_gc.gc.free = cdns_gpio_free;
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
@@ -210,7 +214,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		struct gpio_irq_chip *girq;
 
-		girq = &cgpio->gc.irq;
+		girq = &cgpio->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &cdns_gpio_irqchip);
 		girq->parent_handler = cdns_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -226,7 +230,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gen_gc.gc, cgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		goto err_revert_dir;

-- 
2.48.1


