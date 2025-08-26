Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F89BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lATIPSy5e6EtCT9cnYgcUD2Ds0mi2iLMFvh/wI5iKp0=; b=s/9FMVsPJdgNNbODUmbs9Qwr/q
	BWxEsoIR06HP1yMa1dzp3mnDsqSYfAnoGcSstkpxiErUsxCkJU5nzAJdy+DlKESMtSZCSCWNkXQ7j
	VR/k8EL0wVCcafP5zyOIGNmk6uUN+Oh2N7peonL66TghTkLH+53VQI98my+u5PMB+q5+fnudXjdc1
	wA1HdVY8G97C91Shl9bchwh80jJHYuHCOxDm2vWK/8NKMdZ2txI/claT7w6ZG9cG+KsaGPLrrBrbB
	OU5yveyE5FbchxqTQm/Q0kzzRMWgkRqTp2Yr6a8uf2/rr4wTR3IiTHmxgev2YfNfWjTU2wM9tX0w4
	dOCV0iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqhd-0000000BbA6-1kQ8;
	Tue, 26 Aug 2025 10:14:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5C-0000000BQxg-1zAl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3cb9268511bso173503f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200913; x=1756805713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lATIPSy5e6EtCT9cnYgcUD2Ds0mi2iLMFvh/wI5iKp0=;
        b=n1DjtQY9gBRZTGSM6MX9/O9uQA5+6kYWp9NuSd/2G65xm14onVA38eF+EEG3AJbZGE
         PJZFAvg4arBfhc78P7u6qTQd8TSEw1yB9BuNV/bN8Zqv6qZPN7EPEop11TycjjFldGfy
         FMdwoF7uYaKGTOwQ2+OgtCSMahOVfR5LMr+vDTRDKuQWJABBuiN7d/75aOYgjnBnW9ph
         C3CY8BSUNJnOi2LCks9PdypoarNTMojLaa2WapRdHrMOIdLNFfW86I7jOvHyWPbdvHFT
         7a8Pa90QkfnZL6ALQXqKXzvJGPftHW1mU0L6YYOsq7DP0LbyyF3DRsTQ7+c1rk7vtXKv
         P6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200913; x=1756805713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lATIPSy5e6EtCT9cnYgcUD2Ds0mi2iLMFvh/wI5iKp0=;
        b=tW0arPJEVYK7gcUo3mtLfKhGAJOlLGxluXRduoY1CfGBgoEhUfD2Eo1WMaaSaC8eMi
         pgfmnW+dqPuldBJ7vQRWKQ27nRffqp4ULrUDtu2k362KRgZpH+IUl53L8ovSNdsw8lVP
         pLzOm7K+8SvXcZK84UOWiHpZuEE8PiV8OEduOsl9hao7QeXQCYFm2Hjo3+gKcb7sNrm/
         Pr3sU7wGpupIr7DmQMxCWrNf3yo1EyrI6gV+mG//+ZltN7IrC/WiQL4EqMqNrJeXDXBL
         4ZdSAaHIbCe50Dopqb5nCmTtMjvXc+WQ6QDK4S6sfuLWL6Cr/sdYkCuUfHdjbj92kBEl
         iZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPbqy9JcNKNPpx1eXkBrjzDNMmZ7MdTGhuB9vMriz6vQbLa50Y88Oj3lbrtt7OVRwt9yoL6z2HrNJ0UtM/t90V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3cfChQ2QSnhh9R7aiW759hInFJRTSWzvyNDo1QHbOzBliN9f/
	P8TGL7MSp6LwMPUOpyb7QMqnNYuDNqDbSzvzgfbO6hjKu1UBJAL+2mLRgvYeZfUNbLM=
X-Gm-Gg: ASbGncuFf9xbYEfPkzRvvtiGzGF/LgVxShxA0fHbCNlCtBlRHe2Qj9UtKSykCDwZ0pn
	cvkJgv/A2/AzmDpozsjL6w5wT+UE06LFiMCQz4J4ur6tD9omJ7D3TelOyAF7Iv+l5bk2HQqSbTd
	uh9g4OV8Q0QNe+PSqMZbP9uNFQo1u6EAY6pLJsNGB9guTxxvnwvvQd9kh8DiWbJxJ5UixAeobX2
	hkrBQ9fnbWGq51TlFKmPxso26A4Q4HwXj4a9cjswm4mF0f7TxIzZ9LOzgbN0Ul+VWfsiIFpAh9K
	WjQJe5zQe0aRLPFd1FvW/MWmqU4wXk03SM/Kyn5KN2GzIaQgmDq1G3OBKRw5uJv+kp7ScZ6TUCc
	BsrWvUB2p4MwQyCoVOBNwHF5LyK85IutYOL677w==
X-Google-Smtp-Source: AGHT+IG4AZWGUoJwLuc2ootBVti7BUMsrtAyRnTnepKJgcUpTo6Dd5cIJq7uF1V4qZbMDI/zddDMAA==
X-Received: by 2002:a5d:5f50:0:b0:3c8:7303:8fa1 with SMTP id ffacd0b85a97d-3c87303915fmr5611467f8f.32.1756200912864;
        Tue, 26 Aug 2025 02:35:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:02 +0200
Subject: [PATCH 01/12] gpio: xgene-sb: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-1-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9jFh2D6ttrCYJYtJTOU/wJErxn3PlPPm9jnKQyT1lBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/M/YFESIOoQ5SAnEVMCLG3mCi3FKtS5BecE
 Qi6HSZxDFWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cjKHEACkTe3hmggUqlQY+tCcGrk7zCxmF559kPKX0+oo9gCa6z7tc5vKsTIU/1ownJEORH/T9mt
 GueVzDiLUBD4kPeXUyeqMWEnmCCl5jYH0SnUdjp6VSifD915KGXTUybakeQW80q1LQGa339ZMGg
 wnTPR7gowN9vKdEqGjNFWFR+6i7dCComPP+GBX82+IaWhSBOCEnYReWLPx9HtwUGVahmAb4eNjH
 ilvp6kzIToZETYcW/JcUU80rLgpJLdVVWQdFDOpg9ePgYAubD4f1cWNgicweX+00tUoGK0FJDvW
 AqxRkdLJRCdsdu80o70yks5XZnXgijc8H7JuuLclA3OuKrKjkicmdHM9DX//gLZpHZrueo46eIK
 J4FsFxhx7hoe/iZkWCHnoXYWJ2EwGToeFoxUzOqApHWjkOt/ONKPnkybTNn8IbGKSJbthG+MAK+
 +YFKujGW+bW28V+fUWkt4CDAh5qTE2iTMv2JioiYmrA0SuqYcX/IePGW+jAdpJIT1elVOELvnmU
 TQYdoMBNaxwacnDr4kW4pFdYSkbNCTWQ6Ql08eIejPWc6ULocXQzg+YwyqBfgb9aDD2CBD99M3Q
 laSEjjOylEmwpCLUe2+Orh8PuzbE8T5/vRyzXSiBI0Y/TDyY0FWqlSeqIdYdiCs7oiONEOhnhmM
 K9HtaDPmq2JRATQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023514_544588_24526FC4 
X-CRM114-Status: GOOD (  18.53  )
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
 drivers/gpio/gpio-xgene-sb.c | 53 +++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index b51b1fa726bb5ac6fce21f93e98035b5f684ee88..c559a89aadf7a77bd9cce7e5a7d4a2b241307812 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -21,6 +21,7 @@
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib-acpi.h"
 
@@ -40,7 +41,7 @@
 
 /**
  * struct xgene_gpio_sb - GPIO-Standby private data structure.
- * @gc:				memory-mapped GPIO controllers.
+ * @chip:			Generic GPIO chip data
  * @regs:			GPIO register base offset
  * @irq_domain:			GPIO interrupt domain
  * @irq_start:			GPIO pin that start support interrupt
@@ -48,7 +49,7 @@
  * @parent_irq_base:		Start parent HWIRQ
  */
 struct xgene_gpio_sb {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	void __iomem		*regs;
 	struct irq_domain	*irq_domain;
 	u16			irq_start;
@@ -91,9 +92,9 @@ static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)
 		break;
 	}
 
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_SEL_LO,
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_SEL_LO,
 			gpio * 2, 1);
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_INT_LVL,
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_INT_LVL,
 			d->hwirq, lvl_type);
 
 	/* Propagate IRQ type setting to parent */
@@ -109,14 +110,14 @@ static void xgene_gpio_sb_irq_mask(struct irq_data *d)
 
 	irq_chip_mask_parent(d);
 
-	gpiochip_disable_irq(&priv->gc, d->hwirq);
+	gpiochip_disable_irq(&priv->chip.gc, d->hwirq);
 }
 
 static void xgene_gpio_sb_irq_unmask(struct irq_data *d)
 {
 	struct xgene_gpio_sb *priv = irq_data_get_irq_chip_data(d);
 
-	gpiochip_enable_irq(&priv->gc, d->hwirq);
+	gpiochip_enable_irq(&priv->chip.gc, d->hwirq);
 
 	irq_chip_unmask_parent(d);
 }
@@ -155,15 +156,15 @@ static int xgene_gpio_sb_domain_activate(struct irq_domain *d,
 	u32 gpio = HWIRQ_TO_GPIO(priv, irq_data->hwirq);
 	int ret;
 
-	ret = gpiochip_lock_as_irq(&priv->gc, gpio);
+	ret = gpiochip_lock_as_irq(&priv->chip.gc, gpio);
 	if (ret) {
-		dev_err(priv->gc.parent,
+		dev_err(priv->chip.gc.parent,
 		"Unable to configure XGene GPIO standby pin %d as IRQ\n",
 				gpio);
 		return ret;
 	}
 
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_SEL_LO,
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_SEL_LO,
 			gpio * 2, 1);
 	return 0;
 }
@@ -174,8 +175,8 @@ static void xgene_gpio_sb_domain_deactivate(struct irq_domain *d,
 	struct xgene_gpio_sb *priv = d->host_data;
 	u32 gpio = HWIRQ_TO_GPIO(priv, irq_data->hwirq);
 
-	gpiochip_unlock_as_irq(&priv->gc, gpio);
-	xgene_gpio_set_bit(&priv->gc, priv->regs + MPA_GPIO_SEL_LO,
+	gpiochip_unlock_as_irq(&priv->chip.gc, gpio);
+	xgene_gpio_set_bit(&priv->chip.gc, priv->regs + MPA_GPIO_SEL_LO,
 			gpio * 2, 0);
 }
 
@@ -237,6 +238,7 @@ static const struct irq_domain_ops xgene_gpio_sb_domain_ops = {
 
 static int xgene_gpio_sb_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct xgene_gpio_sb *priv;
 	int ret;
 	void __iomem *regs;
@@ -263,14 +265,19 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = bgpio_init(&priv->gc, &pdev->dev, 4,
-			regs + MPA_GPIO_IN_ADDR,
-			regs + MPA_GPIO_OUT_ADDR, NULL,
-			regs + MPA_GPIO_OE_ADDR, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = regs + MPA_GPIO_IN_ADDR,
+		.set = regs + MPA_GPIO_OUT_ADDR,
+		.dirout = regs + MPA_GPIO_OE_ADDR,
+	};
+
+	ret = gpio_generic_chip_init(&priv->chip, &config);
         if (ret)
                 return ret;
 
-	priv->gc.to_irq = xgene_gpio_sb_to_irq;
+	priv->chip.gc.to_irq = xgene_gpio_sb_to_irq;
 
 	/* Retrieve start irq pin, use default if property not found */
 	priv->irq_start = XGENE_DFLT_IRQ_START_PIN;
@@ -283,12 +290,12 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 		priv->nirq = val32;
 
 	/* Retrieve number gpio, use default if property not found */
-	priv->gc.ngpio = XGENE_DFLT_MAX_NGPIO;
+	priv->chip.gc.ngpio = XGENE_DFLT_MAX_NGPIO;
 	if (!device_property_read_u32(&pdev->dev, "apm,nr-gpios", &val32))
-		priv->gc.ngpio = val32;
+		priv->chip.gc.ngpio = val32;
 
 	dev_info(&pdev->dev, "Support %d gpios, %d irqs start from pin %d\n",
-			priv->gc.ngpio, priv->nirq, priv->irq_start);
+			priv->chip.gc.ngpio, priv->nirq, priv->irq_start);
 
 	platform_set_drvdata(pdev, priv);
 
@@ -298,9 +305,9 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 	if (!priv->irq_domain)
 		return -ENODEV;
 
-	priv->gc.irq.domain = priv->irq_domain;
+	priv->chip.gc.irq.domain = priv->irq_domain;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	ret = devm_gpiochip_add_data(&pdev->dev, &priv->chip.gc, priv);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to register X-Gene GPIO Standby driver\n");
@@ -311,7 +318,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "X-Gene GPIO Standby driver registered\n");
 
 	/* Register interrupt handlers for GPIO signaled ACPI Events */
-	acpi_gpiochip_request_interrupts(&priv->gc);
+	acpi_gpiochip_request_interrupts(&priv->chip.gc);
 
 	return ret;
 }
@@ -320,7 +327,7 @@ static void xgene_gpio_sb_remove(struct platform_device *pdev)
 {
 	struct xgene_gpio_sb *priv = platform_get_drvdata(pdev);
 
-	acpi_gpiochip_free_interrupts(&priv->gc);
+	acpi_gpiochip_free_interrupts(&priv->chip.gc);
 
 	irq_domain_remove(priv->irq_domain);
 }

-- 
2.48.1


