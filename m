Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D39CCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lRqOyCFh9XcXfURwOeKl6jFWARUqPe5zgwIJ8H3pYg=; b=owG7kH6XDM7wfXy5nBoKfX8xI/
	BokCuzmfNRkpGLouretUWLSNulncmg3Z6eQfyEdrHl7u+de+A7dfBGFOpALLL2rf9tVUPNz6b+fVK
	N/uc7aq2YEAqSNrYojvpqxYlt2rZkI4J00CLVzyRVIDLTIz6dnjGsxZJsxgHHAzfHUsbYvfSlRhMT
	Y0R0+BfG4GXTSC8/Z89SnhBcHbP/VibL6vKcoVMBtAao90HGQx0409+gFsYtmSRaxZ5Z97sjn2oJJ
	EiD3jlM2MaORSiAO+3njCs5e8WbhEH6dlyqriJd6M3x4xDwr+T7MJbeupdZFbshmyWOVsb0pPSKWc
	LhhEBQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqTy-0000000BXPv-0MMY;
	Tue, 26 Aug 2025 10:00:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5L-0000000BR4X-13Pr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b627ea5f3so7820775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200922; x=1756805722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lRqOyCFh9XcXfURwOeKl6jFWARUqPe5zgwIJ8H3pYg=;
        b=PTzQwHu6SpZz83eUA+LDTYVbt7uhfd1j76g4/APdDfdmLVxq/sOmNGHrFPAV5YoOEx
         AIXPnnPE7XBJuVCHM28X+AtBOzfirsIyGgcYBQ8FvYs5TyAKbGHY+y41zmQtF1h+Y50g
         X/ahJryFC35AASDPbKEfEJ9dc6X+jOc9REEbZZ0CtuqRJV0guOgqeDqpqx2i14qocZrk
         g6rEKp/kIqmXzuGXPMweBfoYit+wXl9+iO8OFxYpHEkVSxHwwb7wORnESdH9UCc3olEP
         NYmOJiK/ghPEOrGdYUptsE6fupmef9ouNXCF0d5Ju/feb19ygrpDw2xGm2xGwbsQHpqs
         ozjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200922; x=1756805722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lRqOyCFh9XcXfURwOeKl6jFWARUqPe5zgwIJ8H3pYg=;
        b=jPwkNI8kCYdlPzZGRBa8etFob6L6LXI0U+5m5m3TJP2vtzCuiisDXPo07hf2B0Yu5Z
         pVH0O0RDz6p52CLmKXLAa76VN3AkFRIpz9X8rxP0m92AUgVFEXCeSni5J0Nd47J+2tYB
         UuwPPEeOX7uwK6fnZADuDuLSONzv1RTqLpteAI8CRsGrWxJKuFq0htVfZeb6awygwB4Y
         fpq+56Jmsicsewsoa6tDJqMhprlJ19UgIrsxr8oCPQysmXPHey1A0+DQS2+RtApOp1d2
         e6WKjOKFc0S5DRiP9bd3+qN/JCAWuueS3yfuClAdvPBT4psJJcto5aOZpRt8yVsslhqV
         aNmA==
X-Forwarded-Encrypted: i=1; AJvYcCVYkpPYXRTqjnLiPUCDY5mhF29rte9VMUxan66zEUCFAr/zBMFskVcYhhds8r1nIkQOd9VnqwGRF7I33ITimBJ2@lists.infradead.org
X-Gm-Message-State: AOJu0YzsfqIpkrsPKB6/JrH3T+G46oNA0fx9n5mmd9usTSJBbdI2Cx1w
	5fd4MxTyHXcpm7PwbQmVlcd3KRqB/LepF1Wyn5r2kpRYhqbh4H+Ct8d/B4C0j39u8RA=
X-Gm-Gg: ASbGncuSqmI5UzTyVW4LosE+YtLzsEOcVOYCW5sXM/cBqcImsYgQvG/U9xACRC8jjOB
	VWYpxRr1QBP61qfMB4siEeEDpZxDnlJQ6BYJbK7QbNVQBOCRQ8kDKEV3aWQegrOdHGlh9M279FX
	isK0nEpFWr2k47rn2hQEsGbMdEzBrsCExn7haj9nLeDpu6VzgkoT2vzz+CmFFroD9LU3xJI5KPJ
	DH2pooHBjHq/1++3q6Unco+ggYTEtFgsHv33G6WG/s0HnMdfU8n/udA8fTktex4G/pTEeceMuDU
	Sa/qWdOfkdLGGh9Qi6wvTKflgtYeVE9GpcjI5/zG/QqsO4RgEmBi0JrEFeTpUBRLw53u8NbzXnB
	hoV5Nji2o8+OOF/yvyr81xBvZFqc=
X-Google-Smtp-Source: AGHT+IHp75RpiQJVQEKUSXBjLmDArj0vUimB8rn/x/G9gcfjiu1pYST95FYW5BPTLyI/A4pTeZ1FxQ==
X-Received: by 2002:a05:600c:a46:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45b517ad840mr181139635e9.16.1756200921799;
        Tue, 26 Aug 2025 02:35:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:10 +0200
Subject: [PATCH 09/12] gpio: realtek-otto: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-9-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4690;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J7jwxRyvW9kXUpoOBwyWjbeaH/EDMDCA4owIhqbPBq8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/OhhNe0U5pJTYByzLv3ho1E9kgRU/h1J4YP
 5BUsTXb7cGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 cl6JEACSegRrM1NLbUUpgcmQKDFw1fmSphywCs9xXWP49K8Ek9QZSeh7ZyQ7uCSBGRJCIXcYDWE
 ynbuLs74G6uP8D8ykwPOPAREpPUfu6v3jYd0L/cRFNeqj0Ka/zEtcsVJRr6p5w9J1LTjEOF5N06
 vuBKxFL7RZxCp5OelGIZ6/T102b5ZsdSiiaRIXAUpyrZ1QbzJFSwMgJAyKDkUw3wl3xQf4akGa1
 isk/WN0030zXVtZnn8m48XcttAmP/vBBgbH2pJVU8Fm+Q4c8Tn+TWa5dlXw1ENsClOYbibpscKC
 gLFPhywMeCnCwIOzJllqmMhgjkjA5N2ujpmngo/oGh8Dj2Om1egwlTYlxcwQo5cIKMyHU4/0yTy
 a5+hh7Oj7oqeAYa8ZR5NdmSYzK6mQ+4/TOWu882QgHEgVXIu1npMPeis4upn5ZVUNFipDgkWDgy
 ifBrkoWzm9rIKlWRtNKY3Kjn4Iwf+/ZuhyPDtuky1G/RkFlm0R6yCkxHsNF1c4k87O1GIu86hm+
 SWZKPURRj1egCiGJwPW4fEkz5HajkAkBVdEm3L/6yB35SJToxxTMSrX+hXZLBPvI5O6MdnHCI0K
 uTeWvL/yXp2RroPXXl/gJVQp4g+TTgcSqX52xmAtlLjaTDV7fhAU2WeNHPp+TA+4q6m7EdKtmzm
 OzGGWV4j7S2gJIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023523_300474_5C21F39D 
X-CRM114-Status: GOOD (  19.00  )
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
 drivers/gpio/gpio-realtek-otto.c | 41 +++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index d6418f89d3f63d6029e127d4f774507c2ebbe0cb..ab711422254e9e8ff1a4e7c4016389e6d352f268 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/gpio/driver.h>
 #include <linux/cpumask.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/irq.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
@@ -41,7 +42,7 @@
 /**
  * realtek_gpio_ctrl - Realtek Otto GPIO driver data
  *
- * @gc: Associated gpio_chip instance
+ * @chip: Associated gpio_generic_chip instance
  * @base: Base address of the register block for a GPIO bank
  * @lock: Lock for accessing the IRQ registers and values
  * @intr_mask: Mask for interrupts lines
@@ -64,7 +65,7 @@
  * IMR on changes.
  */
 struct realtek_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	void __iomem *cpumask_base;
 	struct cpumask cpu_irq_maskable;
@@ -101,7 +102,7 @@ static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 
-	return container_of(gc, struct realtek_gpio_ctrl, gc);
+	return container_of(to_gpio_generic_chip(gc), struct realtek_gpio_ctrl, chip);
 }
 
 /*
@@ -194,7 +195,7 @@ static void realtek_gpio_irq_unmask(struct irq_data *data)
 	unsigned int line = irqd_to_hwirq(data);
 	unsigned long flags;
 
-	gpiochip_enable_irq(&ctrl->gc, line);
+	gpiochip_enable_irq(&ctrl->chip.gc, line);
 
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ctrl->intr_mask[line] = REALTEK_GPIO_IMR_LINE_MASK;
@@ -213,7 +214,7 @@ static void realtek_gpio_irq_mask(struct irq_data *data)
 	realtek_gpio_update_line_imr(ctrl, line);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 
-	gpiochip_disable_irq(&ctrl->gc, line);
+	gpiochip_disable_irq(&ctrl->chip.gc, line);
 }
 
 static int realtek_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
@@ -356,8 +357,9 @@ MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
 
 static int realtek_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
-	unsigned long bgpio_flags;
+	unsigned long gen_gc_flags;
 	unsigned int dev_flags;
 	struct gpio_irq_chip *girq;
 	struct realtek_gpio_ctrl *ctrl;
@@ -388,32 +390,37 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	raw_spin_lock_init(&ctrl->lock);
 
 	if (dev_flags & GPIO_PORTS_REVERSED) {
-		bgpio_flags = 0;
+		gen_gc_flags = 0;
 		ctrl->bank_read = realtek_gpio_bank_read;
 		ctrl->bank_write = realtek_gpio_bank_write;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
 	} else {
-		bgpio_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+		gen_gc_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 		ctrl->bank_read = realtek_gpio_bank_read_swapped;
 		ctrl->bank_write = realtek_gpio_bank_write_swapped;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
 	}
 
-	err = bgpio_init(&ctrl->gc, dev, 4,
-		ctrl->base + REALTEK_GPIO_REG_DATA, NULL, NULL,
-		ctrl->base + REALTEK_GPIO_REG_DIR, NULL,
-		bgpio_flags);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = ctrl->base + REALTEK_GPIO_REG_DATA,
+		.dirout = ctrl->base + REALTEK_GPIO_REG_DIR,
+		.flags = gen_gc_flags,
+	};
+
+	err = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (err) {
 		dev_err(dev, "unable to init generic GPIO");
 		return err;
 	}
 
-	ctrl->gc.ngpio = ngpios;
-	ctrl->gc.owner = THIS_MODULE;
+	ctrl->chip.gc.ngpio = ngpios;
+	ctrl->chip.gc.owner = THIS_MODULE;
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &realtek_gpio_irq_chip);
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
@@ -442,7 +449,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 			cpumask_set_cpu(cpu, &ctrl->cpu_irq_maskable);
 	}
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->chip.gc, ctrl);
 }
 
 static struct platform_driver realtek_gpio_driver = {

-- 
2.48.1


