Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65510CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VwQnMFFQUbJBhEJZKQm6c3MliGwPjiIRbJeY0+XPvc=; b=RCYTtZLVN0fPuyKHxmS7F3Q5u8
	DNVE72++P7fuiZkH+kcaajQlYBGpo21BEEZ72jPEAQDZQF2lgR2C2W9apOiaR3332zsiFMyrgcoEK
	CllHoFKyCvNmGOmdcSV3WQZf+K2xwMgDzy2Mr2IrEbxDDEyQWn1WdrkWL313ZOUKrEvOoo6nlzVN/
	ZB517FfuKZRAhtoPijJFJnWfcXHSjy6jije5HevfznoW+InodjRzI4COlPpJ3j1kB11UAIJ7l5WRq
	Xti+4sKBbNDiP8kuTKAlAkyJIvrJkbp2hZuL8zzDuSfvi4YSbDonH8CZFJJvAvIDhR7iKkFR/1Hcp
	yvRj9FYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwfd-00000006nC8-1N5l;
	Tue, 09 Sep 2025 11:37:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSL-00000005soB-38kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3dcce361897so3554514f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409364; x=1758014164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VwQnMFFQUbJBhEJZKQm6c3MliGwPjiIRbJeY0+XPvc=;
        b=l9poCYknsi4rfdhC5xX8iFgFF1H/CoVWOIj5n8NtAS1dbp8E3+GE+nO2n4t7ra3Agf
         Ep1Riz0qU5sgPAzvMGDr0AcaKoax6+7OisDEiNnhavBbidultfsozy7WHBDfk536KkJF
         l7s9Bv/anT3+UBva4Oc0BxNSWKFRVYLoKlSlKJQtyOAGUBP50vWgSDmQTB62jziPApsF
         H9K1WSkIz84NwURLXJcsltY3a4syx36ilu4T0D7KmmyCLzH9DOoTlpUfR7+o0qisUQOK
         l+87w6mq0dmRq5EPgT/jyP+2AqbZgCbXloGKzxpBExzRjdqymVXMBoy/i/zxZYuI2up0
         myxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409364; x=1758014164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VwQnMFFQUbJBhEJZKQm6c3MliGwPjiIRbJeY0+XPvc=;
        b=K5ronRvXogfxSWLsjcRSV2biMgZBSxPS5lyvvho8nOdxZdqdw7TbPmDWangxoS/PAe
         vkArSzlaYk48kQMAC2exz2ZuoBIUstjD0Gxq+06FsGupa+ikIFKC7ZZV+Nhj4KTca1ru
         qdO8khWHFN7hRLBdQUQ116n4u3tepsa26pzr0IS11EDhedsc7foy1vlO0BlnjYaNcuae
         YQbHlnEIjkfchaIoiSWncf/cboyCtgaZfbZ4xvpfjLv7X3YIs4GrpC25JO3CxSoqB4U2
         yqanG2EzysYQp0FYhpqSP1VW4lPMjr/H2J8CO9NtNlgeX4r8P0a4CpJXaRR+/gAQhQ4a
         jCDA==
X-Forwarded-Encrypted: i=1; AJvYcCXMy6KI6B70lfsc7+dO8RHv1Pft78WCQFK9l0T2CaSlpmzv1r+vG7Clg6pBNLMp+/wecmReyTDzDWy6NHmULLrs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdm+S2foVAWehZUEvGiRA09p31TRPxegI5XRnxd3tITnufBjFA
	VTN4essml/OZZN8MlcBvErUEgaP1MlwH6FLrEptSsnkhgXBpX0K7S1Tfzp94561/YFw=
X-Gm-Gg: ASbGnctsYM4iqj/9t1H0FXHSRq72LvcoZgmyOqQC8REhUh5aYCQWzJl1TAkg/x3LhFl
	H1caAbFQiZ8/nGhR9FnvUcr1WxvjP177IJv/Iyd5gY08t8MFRLJh+Zb4dN6TOT2kqCzpzM1XktL
	oTe14otX2LJaY521CwNbojZAGb54ry95k8lGuesoFTRRonvmTzJlbGHHCIcVjUVHm5OpMsEEyBe
	CDTmwDwufIdgwM2E3DxQfNGeNYt3chw7BaIXBcy94HMrGdNjhsFwdMlOy4zCDGnxLubv8CNLokJ
	oq/nNPWu49jqNcXSxvei4R8Rao41BU3t9dy0KwKe6yMer+iwQh7bzP0QmBc4JlfaMIpQoW/L0x5
	Lt98xCN8NvTjQ/LXi1Q==
X-Google-Smtp-Source: AGHT+IGSoxbk5sH0hMOySaw2VZsrge4cwThUG4Xe74T/OfiVTIcnZT3WjcEd/0+Yql9jfkf8sxO4lQ==
X-Received: by 2002:a05:6000:2c02:b0:3e7:4835:8eab with SMTP id ffacd0b85a97d-3e7483594c6mr5567609f8f.6.1757409364085;
        Tue, 09 Sep 2025 02:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:38 +0200
Subject: [PATCH 11/15] gpio: sifive: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-11-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6420;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/rxFAj2OADgDUL6LIIa7xxiLekFYD7JnAKzsE5ctpDE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6EyJpcO128tCwjMCd1RkR25TZMB81unx5s
 eXDdbnNcyuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cgGED/9FeSGkmGNg2EwnlMYXHTeuncfNpcU+URNlNHzV5moJDeqP5Jcdq2gkGu4eZWS4s/RSYS+
 uzqOnYP4B/+yZWqNCJV6koa4fyCCMPUSnl8vNFE0+sn7b0TQwQEjFotjBrmcuFefH043O0+OgVH
 5O4/TrWmKig8t9Q91Fd891R2HPyfnf/VHC0uokZBlyP+MNveQUnXtyWXSJzH/VCr2rXM9KhKS1/
 8BLs5SCXZHRd3wHL8ARw+0y4hR4dDvAzBLhHG0bdGOhqAGlN+UGUQ5AAgL6itzzMSnu8fmun8m8
 SVroKjYq1jSMIpPWw83EIXGo15EK1Ct998onKm5hm0CQ7Cl6QhNtglDmZfLBuYWUQPu58AE7AT6
 agpeRAQESZNCyNy+QkyHlvbSL4XLwI6w2OWbWfSXkpnw9SHXOOAiw+fTp3sDaATrBHaA8xpEdUu
 O/l/wlMR/MDlNGtdzm1K21bnIon9aUwX3UkOeoKqEJVknuwWqppp0+2XM5RVcGwOb5MISLvMcWx
 uM3DMZ2cx/rVKPrz5Ikl/DA2+cpR3VjxNI6jQ047QI4fabGO+AGuJiHm8PMHgbXO98+9Ql/KGCC
 9oXUgUeXq3i0nrkvQthDI7BdNsf+od/Dhx2KKNpxAOVBqjsqFPFdsIY3pcUBKn8hisdX5u/sztw
 adjL6kx7DcdyUQw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021605_805515_43AD825E 
X-CRM114-Status: GOOD (  19.14  )
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
index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..07ee5c0b4f8023978c76873f25119d5dc21d996c 100644
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
+	config = (typeof(config)){
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


