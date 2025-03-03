Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D1FC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Mna2g5kGAQGbITypIOAf332guWttEFjYKfE+wICzl8=; b=gMVq9J+q0b9vgZ6r+e1VVBLrmr
	vza42ovbpmvwy4rmxrW9sh2XidNsCfEfBSqZu1fWCvGXnp8q5LFCSJ6WY+FmEq2EqbaBhTk/oJobV
	Gkg+F3/rgQrgtc87IfJeFPlpE2/BKMdBE+w+EcQ49wqIgQzH7K+RINeXcR2cbwGBO7eob4mS1f0IY
	WlAHbWb++pmi6IB04f2jlgBzU4fPAmYj3L9S7iaBrKTeTpnpJ8PF/QZsSUn0opi2/6uw4QlpvgaGj
	lZj2fua79GlO9NhPOC5Kh2UczTWFrqB9wmRT9nVG4Ocrpd7+Pvn9POfg3wnbHBhaxxGHj/LpfAaHK
	wHIHSecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp664-00000000yC7-1tb7;
	Mon, 03 Mar 2025 13:44:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h9-00000000sdH-03cP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so39876845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007933; x=1741612733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Mna2g5kGAQGbITypIOAf332guWttEFjYKfE+wICzl8=;
        b=lpotWGhRxQ1skbKIhfnqg2zIZlMOa+diN0J6AlbFhCGhHodsAuu/lzfEMlJupPS5db
         QRUwQaww0uAezd/5uyc+psvNcS8RiMzP3FOtbrmJuRhwU0aTpsQZL6ojmJ5ee8QiesH9
         1Fs9H7A+uPmwbwv3aJ9eD0WPYy/RBdE4aGyEqk3zy02Q7ITjAgxCuapjYkBskn83fq2j
         DW+7O0TWgTraMoSKKC6RQXnh+1iVjmsRhiPnGIhkHovNOtIW/ZM/rdl9WlQaJ2LUjmQN
         ap9MnpTHMdd436DinjEAKco+g3wK60u1ocJYsI7Rtaq5l8VHMAKbmZNQa/4tNFJ+vSsG
         bhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007933; x=1741612733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Mna2g5kGAQGbITypIOAf332guWttEFjYKfE+wICzl8=;
        b=KX8pYmS7zy5H7lzw68pl90bkX/9OAiYAn8uHk9FL4UM/zC7pM0oejUgrCDFWSjoRb1
         kPirSlw574rxmcXl1CAiDesHFznFs9cBelwewdymzjjKQKEFlAc0SjeKLBiBKiRCM/Mp
         oMOt5C/9yoPxYEAMkAFGyEqTRMUv+ylf0w9MLqvZn0+4gJa1qQE2G0lxoTt70Qnv7jE1
         iOrC6KPabut0inXyjwSDD/jJpCujQWTyE+hjupjVbPeDWCb5eB+4DyIJoh/xOndcwdZM
         DhOTUBdqnsk2aBWOUQDNnpoZFCpiiwL3TwZ7vDM83pw4DfjV4DFKWspS1oXqfKBWkOsg
         riIg==
X-Forwarded-Encrypted: i=1; AJvYcCUW49beqrEPmck8Cc2ix5sB3CTCZzDTr2dpMz2L1btFyPowqQO2tGlKmu9b28VetejE5cXB8uizyg5Ep6CfwxIP@lists.infradead.org
X-Gm-Message-State: AOJu0YzCfKV6xJ1GSqoe7Z2qyeePtm4er43Z7x10eKHmu+0fA9koWaYs
	W+tfMPUP9UYg7Bs+12n467IglDF9hBbjyzOBDUJlZ0Ic6nOSoKbHVRMAEk01Ows=
X-Gm-Gg: ASbGnctU4lHb/ueo08XUslmrozQydPSLLUWE5hcI+9LdVUqGryqiPDooeh7SwLzmkFT
	DR3GO3lEigXojOi15wEFKIaD4Vk4HcuaDL6JdJSBh3MXrtdJJq9zWx3q7tPT3caJFC/rRWDrbtk
	SizSd1gCiHheg3aL0mJrHgiOAc47lbj2pq0bdGI7mQZptYBT04IISgK9Ftn90MxTSILz0KoB7N6
	wnVXBN1x/9LCouUrA/N/xjpW0vl0J1qQQ16fy5cTWgXZIj6EZm15A5OfO+Oybh3vSuyWf52F9ny
	3Nmi1IaJtSzicLGwV4vK3Tt/ZS469zVGa813HA==
X-Google-Smtp-Source: AGHT+IFY22PCA1a2+aN5bDi5iCcPupeWgrWRYBU3OAd6qR1uqfM8OPw60ciFVK/sAA1n6Y60dhPpwQ==
X-Received: by 2002:a05:600c:1392:b0:439:88bb:d002 with SMTP id 5b1f17b1804b1-43ba6727b57mr103602005e9.23.1741007933166;
        Mon, 03 Mar 2025 05:18:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:39 +0100
Subject: [PATCH 14/15] gpio: aspeed-sgpio: use lock guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-14-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5780;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0qXZl4P6oay9QYtQck71x8HYJPy63jgVqg/jPZp1JP8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawsJBgL9NLW7b7FCtj23bKQ2kGRMqw9cfP5j
 kWw5bq4/RWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsLAAKCRARpy6gFHHX
 cjEGD/9I/yPodJyzCvoLyTdAs9s5HAxWXV840R+OGBpnA+oBXEY0FEbNiwC/ZRm6SNhGJrpxwfM
 0Cw6Nxab1aIHNmI/IkLcksuG5r8U++V+RfblyWmsofiye6Cjmi2k1JY8NHPqGNfxGHSCi05c6hr
 +o0YH0h4Pkb/XCzt7Xrp9gQxm14ttMk9AnxYSEj8KT53aCRaiacOJeAueSocxP/0plWhJWnLBlE
 udhOpcnmP2QDd3bu2veRGB05Tb3mO8juN5L0ClWpZH7vfWmJ4tGxo6CLQ/BJCbctfAzExS6R+8Z
 wrisMCfrjV1zNfFfgvEC9iQXHEXeprwQA+LPKEdM8uUK7wsSIaNYRhgCH2zKOv3tfd84zaa04xA
 VHJ6Si4eURMZ5f5J26a+xy6d9LHe7hM6r4zG/yOurvpFt5+UdpPnB7K9tC0AtobOSf1nYMXu/Sx
 xSgB2mwmYmf3UgO0RE9yimPFnwaA4+Q6rMb2bSyqnKDIC9RbqCYCdO0fqjgz0zaWogldF2563Pc
 rqMkKNXgx38lLXc1hXAjdiEn5FsrcnratZRfM72ETy/jHE1TjvODlvn4UVeKvQg1+yYmrtuOnZ5
 D9tcdNqZ961mLhWwMoF//HwFYaND3V9NpBfENgdDRuf/cQg9XmRLHJDhqH0uqZ+Ah5XIdxt1iBe
 e56xOZfdkwuJ96Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051855_067249_33A289CC 
X-CRM114-Status: GOOD (  15.52  )
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

Reduce the code complexity by using automatic lock guards with the raw
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 76 +++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 34eb26298e32..5ce86de22563 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/hashtable.h>
@@ -170,17 +171,14 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_sgpio_bank *bank = to_bank(offset);
-	unsigned long flags;
 	enum aspeed_sgpio_reg reg;
 	int rc = 0;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
 	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return rc;
 }
 
@@ -214,13 +212,10 @@ static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	sgpio_set_value(gc, offset, val);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -231,15 +226,14 @@ static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	int rc;
 
 	/* No special action is required for setting the direction; we'll
 	 * error-out in sgpio_set_value if this isn't an output GPIO */
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+
 	rc = sgpio_set_value(gc, offset, val);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -269,7 +263,6 @@ static void aspeed_sgpio_irq_ack(struct irq_data *d)
 {
 	const struct aspeed_sgpio_bank *bank;
 	struct aspeed_sgpio *gpio;
-	unsigned long flags;
 	void __iomem *status_addr;
 	int offset;
 	u32 bit;
@@ -278,18 +271,15 @@ static void aspeed_sgpio_irq_ack(struct irq_data *d)
 
 	status_addr = bank_reg(gpio, bank, reg_irq_status);
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	iowrite32(bit, status_addr);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 {
 	const struct aspeed_sgpio_bank *bank;
 	struct aspeed_sgpio *gpio;
-	unsigned long flags;
 	u32 reg, bit;
 	void __iomem *addr;
 	int offset;
@@ -301,17 +291,15 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	if (set)
 		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
+		reg = ioread32(addr);
+		if (set)
+			reg |= bit;
+		else
+			reg &= ~bit;
 
-	reg = ioread32(addr);
-	if (set)
-		reg |= bit;
-	else
-		reg &= ~bit;
-
-	iowrite32(reg, addr);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+		iowrite32(reg, addr);
+	}
 
 	/* Masking the IRQ */
 	if (!set)
@@ -339,7 +327,6 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 	const struct aspeed_sgpio_bank *bank;
 	irq_flow_handler_t handler;
 	struct aspeed_sgpio *gpio;
-	unsigned long flags;
 	void __iomem *addr;
 	int offset;
 
@@ -366,24 +353,22 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
+		addr = bank_reg(gpio, bank, reg_irq_type0);
+		reg = ioread32(addr);
+		reg = (reg & ~bit) | type0;
+		iowrite32(reg, addr);
 
-	addr = bank_reg(gpio, bank, reg_irq_type0);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type0;
-	iowrite32(reg, addr);
+		addr = bank_reg(gpio, bank, reg_irq_type1);
+		reg = ioread32(addr);
+		reg = (reg & ~bit) | type1;
+		iowrite32(reg, addr);
 
-	addr = bank_reg(gpio, bank, reg_irq_type1);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type1;
-	iowrite32(reg, addr);
-
-	addr = bank_reg(gpio, bank, reg_irq_type2);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type2;
-	iowrite32(reg, addr);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+		addr = bank_reg(gpio, bank, reg_irq_type2);
+		reg = ioread32(addr);
+		reg = (reg & ~bit) | type2;
+		iowrite32(reg, addr);
+	}
 
 	irq_set_handler_locked(d, handler);
 
@@ -487,13 +472,12 @@ static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 					unsigned int offset, bool enable)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	void __iomem *reg;
 	u32 val;
 
 	reg = bank_reg(gpio, to_bank(offset), reg_tolerance);
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	val = readl(reg);
 
@@ -504,8 +488,6 @@ static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 
 	writel(val, reg);
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return 0;
 }
 

-- 
2.45.2


