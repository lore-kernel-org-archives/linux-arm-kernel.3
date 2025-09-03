Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E21CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy9bOxpl6g6PPjJ5R4Np9HUxwqq9YKw639nLydH6DxY=; b=YMgIbF6LIaCJ83c0wPKjbdz1Yy
	L1u++VCs0XVCz/xepBa2InMi6f8bCTYgoeF+4FjNHmCgwv1z4XTE/b5reRRh8JPdiGsaC7khE1EF2
	7et3ZDqEViB15ilmvQIcnrWhZDbqdf3JRAJYWAriwNUhWqc8k5P71Hoo0D8AfD61OcxkbXfgh2iyG
	20qcjVkOuF87Mx+NnfaYcVBqqo5DVxVKSCczHWkHsIUt5vGraPzgt2aLlxKS+qwqDXzLkGDiDtHs5
	5B4PdtlIoc1HIIcoXeVcLgd76ku24I9dCBnuK659/Aij9jepTI0ro+6RkY9dMM6OmXW3ZwSn8CQvx
	iHDhYDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjSd-00000005sNo-3rYe;
	Wed, 03 Sep 2025 09:07:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPo-00000005Li3-0Yu9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso21773845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886422; x=1757491222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy9bOxpl6g6PPjJ5R4Np9HUxwqq9YKw639nLydH6DxY=;
        b=Ba5gkNzUTTmBTH83nAV3YsGGAQw1gr3g6TiF4Dc1Sz7134jUSUbdaD5ocs0X2t6UoY
         dFEY4iGwhvVCWD8WhTBhRM4fueHrPXuWTEkylIh2H9q56aAQKhXk2SZRGF3EKh1izPUE
         2U/dhsty3WzqMYeHTAI9J2LNO2RdyQ0sDfAW2JxOXiVW5iGjuCrJApRMqaQBcNlBHa6I
         78DkaKM2936dMDQgXcywYYr1ycMJ2dnCCMoQ+jyC6t/8vx9gctf3L7SRdqRu9LCKm6Fx
         3KK+fo9f3pTEcGASpPct6Ovud/Xe1ZeXVgkoXRWggtRzKuV6EQUrP5K5KKwNpkv6TgC5
         LC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886422; x=1757491222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hy9bOxpl6g6PPjJ5R4Np9HUxwqq9YKw639nLydH6DxY=;
        b=PSDJdYeb8OwdEjlkP249hVvDRbg2wbv0FBE20MzU+nivfHO5HiHF6aplYdk9AfBQtS
         BR7EFYO25qoWxmnkVpGprWrdcKa5r7P51Urfz9S3WLZWAv4FjeN3ppI1ePihWzztkmfr
         NtXj3p1B2bSfd21184K0Af+1hiOKm29bD++2L02Swq8vIM/goNypRvQvDdR7hmmgH05o
         uY75CjZhkxxBcw4+BWv/YiRLwxb7/aMMMgDKm1ZnSyUapNXgwKQAIS/hImUn8hEafmr2
         rfvjGKAFeVAZwFa61MNbX1s96SpHkirvgeBjmF/693RIgWgfLhQs2NZ6SdnOKI16yqxu
         n0LA==
X-Forwarded-Encrypted: i=1; AJvYcCXVnFX3B6C1Kl8N997WmpRo5MtOQazm8/xvPH55721Nzpe4dvtrew54r1oxRe1a9Nel4OKq1gSHe/eO1Y7m7/dz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0sAuxYhQBqur9ElfUhiHMDdmOpy2IynLwPUgf5pZCZXlco4Lk
	SdHEbdjVUE7MJ+CBa3/Lnffn6uMcoz05YX2u89Z5xv2Ht34DHy+6pZ6imzDpjpNeCwM=
X-Gm-Gg: ASbGncvJjnijypcVDoGvBdgq9UW1jV5dHWzePxhuqrilbvoJ7nLKPdoJ4/dLb1Hwpa6
	urd4SbPYGCs0VVWZMtsYm09N9teel3IQWZA6yjo861pydqgKFcfByDnYDNmYn+YsuZjtUj8BFC/
	gVfRHJNoksmtEkpc5gxYKrHq6zItkg8XoqOtuXIkubI+l4zEj1/lxeQmKnKhDZh2Pc/fDokBNHx
	1fF57e8sDZap6FvEKMHEg/462o9ZpAmZBMxJkCO/4xVp/2HEGezk5vb7jjwoGdxQfo1fDnMkECw
	hdba7TP5RMtGB+qxzltWgbpNd5H99FLzoOU9kfnAU2OZo3YQpq6x+eBVihcyUmxLY0qFHq91cFt
	xjxsC3mLIK4QliXtJ
X-Google-Smtp-Source: AGHT+IGSXDsLMnkVmHi32J3FYtafMyOV7z+ZI7nxOCmRVk/mvXulpXNJ6fL60j3cVKcySc0WsxfOuQ==
X-Received: by 2002:a05:600c:4f0a:b0:45b:868e:7f80 with SMTP id 5b1f17b1804b1-45b868e8512mr119518565e9.8.1756886422507;
        Wed, 03 Sep 2025 01:00:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:06 +0200
Subject: [PATCH 02/12] gpio: ixp4xx: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-2-ff346509f408@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5144;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=52EZXtNYov0BPLgttyxaJIp6rvW0YbePoZxCVvveYbw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WQe9Je1QrsE3U9X8Asr57GXatF/xD2gPO3D
 13D3NWIwNuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kAAKCRARpy6gFHHX
 cuxuD/9pktxCxNM7u1Czg04I8wRpvbWv2USp2CvXmd6W6wJ6bWt+JGRLYmYMta05xJnv2s68Ha5
 kgDzRGqsja0QynNa2DPQQh4oLhfoJMrefmnEmj0e/9T6MfJ7o+XgwYmV6nZLcHohdMf9NGgkIv1
 34TFqylt2rt/uSavy2mGDjgKyFDoi1eetiSCKDilF1mFPJ6KPrVrC5zFToU9JbcZu6XKeiuz5fC
 PgpHhwh/ZHA0a+/kk34wNf4h0NebQRFE1sW04hHee8M2XBux8+TLmWnT0jdKjyRT/TULiGRbORv
 Msc7SDUCFWsAxsX1caajyKP5EXEeLjh+NDFOUw8SaCvNgtHQcUZVQrjBZUFf+195OppF1+GPjh+
 YUO2qJZmmDIj5zzppuRJKMqp8xjWi2H5tRIU2aoILn0jU8thEvSMpOWOcg0tilgLW/UQsc6rLjV
 xD7mhj5Eu1yKRsvavLw1KOEekyEqClE9VIl8rNhIa6grKNsP9//6laoJajvOR4ghk+4rs8wwi9f
 1AovvWbfIWFvkUoF8+9bAztsacjXM9HUijDLGpSmbOY8DmHQiQrg1QOJUpoe4WtjWgdgE4klpWl
 Pi+eflQ0Jsmz9B7e7g6w6PFso92KVLVg6CRmixZhPtAXMvLGLeqWClIvA0l5BrotMIx7ehI9snN
 T3yYx0Gxa+8tokw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010024_182269_DACC067A 
X-CRM114-Status: GOOD (  20.08  )
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
 drivers/gpio/gpio-ixp4xx.c | 70 ++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 28a8a6a8f05feec4188467693591e36dbf04ccdc..0cf10d0ba16ef7f45ac114c34468bc263442ccca 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -53,14 +54,14 @@
 
 /**
  * struct ixp4xx_gpio - IXP4 GPIO state container
+ * @chip: generic GPIO chip for this instance
  * @dev: containing device for this instance
- * @gc: gpiochip for this instance
  * @base: remapped I/O-memory base
  * @irq_edge: Each bit represents an IRQ: 1: edge-triggered,
  * 0: level triggered
  */
 struct ixp4xx_gpio {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 	void __iomem *base;
 	unsigned long long irq_edge;
@@ -100,7 +101,6 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ixp4xx_gpio *g = gpiochip_get_data(gc);
 	int line = d->hwirq;
-	unsigned long flags;
 	u32 int_style;
 	u32 int_reg;
 	u32 val;
@@ -144,26 +144,24 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		int_reg = IXP4XX_REG_GPIT1;
 	}
 
-	raw_spin_lock_irqsave(&g->gc.bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &g->chip) {
+		/* Clear the style for the appropriate pin */
+		val = __raw_readl(g->base + int_reg);
+		val &= ~(IXP4XX_GPIO_STYLE_MASK << (line * IXP4XX_GPIO_STYLE_SIZE));
+		__raw_writel(val, g->base + int_reg);
 
-	/* Clear the style for the appropriate pin */
-	val = __raw_readl(g->base + int_reg);
-	val &= ~(IXP4XX_GPIO_STYLE_MASK << (line * IXP4XX_GPIO_STYLE_SIZE));
-	__raw_writel(val, g->base + int_reg);
+		__raw_writel(BIT(line), g->base + IXP4XX_REG_GPIS);
 
-	__raw_writel(BIT(line), g->base + IXP4XX_REG_GPIS);
+		/* Set the new style */
+		val = __raw_readl(g->base + int_reg);
+		val |= (int_style << (line * IXP4XX_GPIO_STYLE_SIZE));
+		__raw_writel(val, g->base + int_reg);
 
-	/* Set the new style */
-	val = __raw_readl(g->base + int_reg);
-	val |= (int_style << (line * IXP4XX_GPIO_STYLE_SIZE));
-	__raw_writel(val, g->base + int_reg);
-
-	/* Force-configure this line as an input */
-	val = __raw_readl(g->base + IXP4XX_REG_GPOE);
-	val |= BIT(d->hwirq);
-	__raw_writel(val, g->base + IXP4XX_REG_GPOE);
-
-	raw_spin_unlock_irqrestore(&g->gc.bgpio_lock, flags);
+		/* Force-configure this line as an input */
+		val = __raw_readl(g->base + IXP4XX_REG_GPOE);
+		val |= BIT(d->hwirq);
+		__raw_writel(val, g->base + IXP4XX_REG_GPOE);
+	}
 
 	/* This parent only accept level high (asserted) */
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
@@ -206,6 +204,7 @@ static int ixp4xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 
 static int ixp4xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	unsigned long flags;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -295,30 +294,33 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	flags = 0;
 #endif
 
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = g->base + IXP4XX_REG_GPIN,
+		.set = g->base + IXP4XX_REG_GPOUT,
+		.dirin = g->base + IXP4XX_REG_GPOE,
+		.flags = flags,
+	};
+
 	/* Populate and register gpio chip */
-	ret = bgpio_init(&g->gc, dev, 4,
-			 g->base + IXP4XX_REG_GPIN,
-			 g->base + IXP4XX_REG_GPOUT,
-			 NULL,
-			 NULL,
-			 g->base + IXP4XX_REG_GPOE,
-			 flags);
+	ret = gpio_generic_chip_init(&g->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
-	g->gc.ngpio = 16;
-	g->gc.label = "IXP4XX_GPIO_CHIP";
+	g->chip.gc.ngpio = 16;
+	g->chip.gc.label = "IXP4XX_GPIO_CHIP";
 	/*
 	 * TODO: when we have migrated to device tree and all GPIOs
 	 * are fetched using phandles, set this to -1 to get rid of
 	 * the fixed gpiochip base.
 	 */
-	g->gc.base = 0;
-	g->gc.parent = &pdev->dev;
-	g->gc.owner = THIS_MODULE;
+	g->chip.gc.base = 0;
+	g->chip.gc.parent = &pdev->dev;
+	g->chip.gc.owner = THIS_MODULE;
 
-	girq = &g->gc.irq;
+	girq = &g->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &ixp4xx_gpio_irqchip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -326,7 +328,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	ret = devm_gpiochip_add_data(dev, &g->gc, g);
+	ret = devm_gpiochip_add_data(dev, &g->chip.gc, g);
 	if (ret) {
 		dev_err(dev, "failed to add SoC gpiochip\n");
 		return ret;

-- 
2.48.1


