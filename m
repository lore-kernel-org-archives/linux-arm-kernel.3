Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24FECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k4JCnwaSt+iTFW+qywHJOCeAgFyoADFfw6FtQJV+UY=; b=Q14PyKgPI/0rqWp58iHmwDdrTW
	sQCYsTF42FUp4T62fcmZWVB9oI5JcbxIVKpuny1WuaLD1KFohV/qdRc8EAZ9pdp/2Wer1wiF0B2Bf
	LXvmOCi59ZPAqwV1NM2FjCkQixnEsRxSc1ijhhGQftJgQKvnw91UE+OG95CAZp5gCJjCS20NAMQl3
	7g60ZTBKiDYVKaXpZvE3PbehltIlYzVHld7GPD0M9x1nmNxlizr8Fn/U1c+KWMzkzbC+vUiRQl228
	paEdvMA7Grhhow7rwqRI/JuMydrh3uHGNbJ3Yt+goavPd4qrpJEnS5k0ePrIPRB1wx5oTttEEj6CN
	vCWp6csQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1T-0000000CSFw-2iWy;
	Wed, 10 Sep 2025 07:13:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0t-0000000CROt-3Hj9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso39733235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488386; x=1758093186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2k4JCnwaSt+iTFW+qywHJOCeAgFyoADFfw6FtQJV+UY=;
        b=VQav79VL4WYSEQFyVRaGbqhB7qJB8ZmRR7MeHuYYhLtEA1XHclgavMbovMlDLxQLB5
         5E6o0v9xR2ovyOjh8A67P6lbmcA7lJf4UKzoYS5lVCpgzA4AzHpVSdOnj6M4v5cG/7/M
         R3DYKEtqpkqBtVqFgBaQPOoztNP4aGoeDcam32h1yTVjupV/hl81WQaFWF2zSLZ1y6go
         XxkBjPcMrIc5eKSeUR8tWYfSTB3RIhJDoMuezUWf6BP9T+9unx2EZDK9USKtranaftpr
         F+DqR215JQv9bhd4KqDydodFh/0p89LXj2gp1n/GfsPu3711zF12GU8cOxxjXw16WWOQ
         HV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488386; x=1758093186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2k4JCnwaSt+iTFW+qywHJOCeAgFyoADFfw6FtQJV+UY=;
        b=lNKq0KJJ1UQF2FYJakfmphQffuOyV6vcQUkpyyAqmEPi17A+2ZqJM7Ebz6erLRGxsg
         N+9MDbtJlDGSKvYhqr6jDn+MdexrjgWfrCqOtZzlXIYg9hq+tQAWBO/4piUp4/OUeBWf
         7fG+ngqG7RFf/RpRdmpb9B8gwjkJzE8wD/a9zk+44qC4ELK7+k4XqldGFJqqATU1qjel
         Mg6KPgKe7IKiZPEmSlmf9VhwJRPhAMfdtnNMl2d+KjcWZcSK7p44q98EWIpDXlvIt/lF
         oI0phDqlpUhBxilWLjdgKkA2ds6fPE80/gxNamJsq6WHliIaegU39e+o56z0QdIlN9ER
         TMOg==
X-Forwarded-Encrypted: i=1; AJvYcCWcPh2WrAW1Ra8u93iNAHj9pcam1rob6f3ysH4Mr8qoWmizjQxODAlCU9WhFuyH8GWp7ZKZdvNXXPUEnyOYXrFW@lists.infradead.org
X-Gm-Message-State: AOJu0YwHHo7ByR12qBhWT8FeTfhtkrtubwmzvFOBjldr8X8Fea59x2LC
	Adafr+rLuqgSuGOPY5kaByZS/0d8NQZrL7lyOC/zsq7hUd8gd3Zxy6towciUSHw6n5s=
X-Gm-Gg: ASbGncteUdwVbYDwgrYJ5lOek+QvvHL3TgFBi4sONvYA7yYnKCNM6OwOHfu/D8wqeFc
	ttlCIWwNe6URuMaakpS8xY6+5dlGk7mmBYZRvdnYiziMZpx/TTbNdw2UXifeBmRBEXoS9Plb8U9
	9lqIFMeeF14ZptCtKz7u6R/+CJ9DLJXEc3oeidBoohCXl1dbBLS4zmiqwAgMv09qxbLJo9xHw0d
	tqAZbsDnsUaViZq6xzi+WVw8S/h5yZWjlDpz3hiQ7Ev7deG4Z63dG5svVBvfWCmb1AusVKyQEhG
	COXQ4/2NOUiQCPDt3Vg2utj7L/vslMHHqTACScpxLJRuviR5t9BYztmbfAD2nyyRdD7o+Vxsa8q
	s+G1MhzCtgPy/zZpn
X-Google-Smtp-Source: AGHT+IGl4lKRYX0Wd5XK1TG333TWQmyNWvAAzHgwmFGQ1EEDkxDqoyf0OF3YeDn/9FyiSKnGVp71RA==
X-Received: by 2002:a05:600c:3b1d:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-45ddde92816mr136016115e9.10.1757488385770;
        Wed, 10 Sep 2025 00:13:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:43 +0200
Subject: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10428;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FdYd9hZ9gf9p26w3kBwfi4mBvHieKCqby9vg2TDUnIg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtChYRJJaE+0voQCXzymF+Nl4src/pRSXg5
 CUOS9YjvISJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cu7HD/9mxnIICFvpG6MMF9u5qDOaXah2rrhErtU7I+cJbwks+18HoGdUHcuA/ylVyf2s8of2d8u
 3GAg8aZQtC59kQBRhDRffTor5B2gqBV9QpUgi4a4DobDxnV3IPXrkVam28g5a1B810F57td70Ou
 42P3W7O2YPF6NhORFEE1WQ63RgPhtMj6HFXzlpe41szS2jlT8PchOEAKSWeBJBDo6a7M+imekrl
 an85GLRF6FF2UyCLMc/79JirR08LQhAMekykBx6mpcheSmGdQVQI/Nc0P1eMxIm/Vb7T+3Sop9L
 0Q1rJlK32WZP1vxGdGk1CqgWsloftyaRkgOE6bu9JyrhYnVdM0lQWUAo3EPTWiP39RXiTvtc8Tc
 F1dgQY+2dmdypsYu58HGsHtkdEnrjHaPXvJxWG0ohCWIJ7T7uHCBkZvO8xdySF5Zd6zn2X3xj31
 Ro5xSAIoOrgU4aYm42lkIhq0/3vyOPUy27H0bZ0K/Dd1+zg8Gj6dr0kbzlRZuNy8+rHCeXHLDHF
 nbGSLQJtZmmz6FwA8ngVUFZ7V2T+J8qZMMS8n0OY4DO1Fr/lH1c5c/HjsG8mhmRD9eIlH7Igu69
 EZqD17OkYrsoIKlYtxJG0LTvcsAPxZbKtfoAL/tuUx8+RqQN7aSlIBgzcT2fx2BYu1FM5DBz4hC
 mcO/5mOwAW0TmLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001308_011490_EA5747EB 
X-CRM114-Status: GOOD (  25.41  )
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
 drivers/gpio/gpio-brcmstb.c | 112 ++++++++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 52 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e29a9589b3ccbd17d10f6671088dca3e76537927..be3ff916e134a674d3e1d334a7d431b7ad767a33 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/irqdomain.h>
@@ -37,7 +38,7 @@ enum gio_reg_index {
 struct brcmstb_gpio_bank {
 	struct list_head node;
 	int id;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct brcmstb_gpio_priv *parent_priv;
 	u32 width;
 	u32 wake_active;
@@ -72,19 +73,18 @@ __brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
 {
 	void __iomem *reg_base = bank->parent_priv->reg_base;
 
-	return bank->gc.read_reg(reg_base + GIO_STAT(bank->id)) &
-	       bank->gc.read_reg(reg_base + GIO_MASK(bank->id));
+	return gpio_generic_read_reg(&bank->chip, reg_base + GIO_STAT(bank->id)) &
+	       gpio_generic_read_reg(&bank->chip, reg_base + GIO_MASK(bank->id));
 }
 
 static unsigned long
 brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
 {
 	unsigned long status;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+
 	status = __brcmstb_gpio_get_active_irqs(bank);
-	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
 
 	return status;
 }
@@ -92,26 +92,26 @@ brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
 static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 					struct brcmstb_gpio_bank *bank)
 {
-	return hwirq - bank->gc.offset;
+	return hwirq - bank->chip.gc.offset;
 }
 
 static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 		unsigned int hwirq, bool enable)
 {
-	struct gpio_chip *gc = &bank->gc;
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
 	u32 imask;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+
+	imask = gpio_generic_read_reg(&bank->chip,
+				      priv->reg_base + GIO_MASK(bank->id));
 	if (enable)
 		imask |= mask;
 	else
 		imask &= ~mask;
-	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_MASK(bank->id), imask);
 }
 
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -150,7 +150,8 @@ static void brcmstb_gpio_irq_ack(struct irq_data *d)
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
 
-	gc->write_reg(priv->reg_base + GIO_STAT(bank->id), mask);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_STAT(bank->id), mask);
 }
 
 static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -162,7 +163,6 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 edge_insensitive, iedge_insensitive;
 	u32 edge_config, iedge_config;
 	u32 level, ilevel;
-	unsigned long flags;
 
 	switch (type) {
 	case IRQ_TYPE_LEVEL_LOW:
@@ -194,23 +194,25 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
 
-	iedge_config = bank->gc.read_reg(priv->reg_base +
-			GIO_EC(bank->id)) & ~mask;
-	iedge_insensitive = bank->gc.read_reg(priv->reg_base +
-			GIO_EI(bank->id)) & ~mask;
-	ilevel = bank->gc.read_reg(priv->reg_base +
-			GIO_LEVEL(bank->id)) & ~mask;
+	iedge_config = gpio_generic_read_reg(&bank->chip,
+				priv->reg_base + GIO_EC(bank->id)) & ~mask;
+	iedge_insensitive = gpio_generic_read_reg(&bank->chip,
+				priv->reg_base + GIO_EI(bank->id)) & ~mask;
+	ilevel = gpio_generic_read_reg(&bank->chip,
+				priv->reg_base + GIO_LEVEL(bank->id)) & ~mask;
 
-	bank->gc.write_reg(priv->reg_base + GIO_EC(bank->id),
-			iedge_config | edge_config);
-	bank->gc.write_reg(priv->reg_base + GIO_EI(bank->id),
-			iedge_insensitive | edge_insensitive);
-	bank->gc.write_reg(priv->reg_base + GIO_LEVEL(bank->id),
-			ilevel | level);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_EC(bank->id),
+			       iedge_config | edge_config);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_EI(bank->id),
+			       iedge_insensitive | edge_insensitive);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_LEVEL(bank->id),
+			       ilevel | level);
 
-	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
 	return 0;
 }
 
@@ -263,7 +265,7 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	struct irq_domain *domain = priv->irq_domain;
-	int hwbase = bank->gc.offset;
+	int hwbase = bank->chip.gc.offset;
 	unsigned long status;
 
 	while ((status = brcmstb_gpio_get_active_irqs(bank))) {
@@ -303,7 +305,7 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_to_bank(
 
 	/* banks are in descending order */
 	list_for_each_entry_reverse(bank, &priv->bank_list, node) {
-		i += bank->gc.ngpio;
+		i += bank->chip.gc.ngpio;
 		if (hwirq < i)
 			return bank;
 	}
@@ -332,7 +334,7 @@ static int brcmstb_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 
 	dev_dbg(&pdev->dev, "Mapping irq %d for gpio line %d (bank %d)\n",
 		irq, (int)hwirq, bank->id);
-	ret = irq_set_chip_data(irq, &bank->gc);
+	ret = irq_set_chip_data(irq, &bank->chip.gc);
 	if (ret < 0)
 		return ret;
 	irq_set_lockdep_class(irq, &brcmstb_gpio_irq_lock_class,
@@ -394,7 +396,7 @@ static void brcmstb_gpio_remove(struct platform_device *pdev)
 	 * more important to actually perform all of the steps.
 	 */
 	list_for_each_entry(bank, &priv->bank_list, node)
-		gpiochip_remove(&bank->gc);
+		gpiochip_remove(&bank->chip.gc);
 }
 
 static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
@@ -412,7 +414,7 @@ static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
 	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
 		return -EINVAL;
 
-	offset = gpiospec->args[0] - bank->gc.offset;
+	offset = gpiospec->args[0] - bank->chip.gc.offset;
 	if (offset >= gc->ngpio || offset < 0)
 		return -EINVAL;
 
@@ -493,19 +495,17 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
 				   struct brcmstb_gpio_bank *bank)
 {
-	struct gpio_chip *gc = &bank->gc;
 	unsigned int i;
 
 	for (i = 0; i < GIO_REG_STAT; i++)
-		bank->saved_regs[i] = gc->read_reg(priv->reg_base +
-						   GIO_BANK_OFF(bank->id, i));
+		bank->saved_regs[i] = gpio_generic_read_reg(&bank->chip,
+					priv->reg_base + GIO_BANK_OFF(bank->id, i));
 }
 
 static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 {
 	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
 	struct brcmstb_gpio_bank *bank;
-	struct gpio_chip *gc;
 	u32 imask;
 
 	/* disable non-wake interrupt */
@@ -513,8 +513,6 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 		disable_irq(priv->parent_irq);
 
 	list_for_each_entry(bank, &priv->bank_list, node) {
-		gc = &bank->gc;
-
 		if (save)
 			brcmstb_gpio_bank_save(priv, bank);
 
@@ -523,8 +521,9 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 			imask = bank->wake_active;
 		else
 			imask = 0;
-		gc->write_reg(priv->reg_base + GIO_MASK(bank->id),
-			       imask);
+		gpio_generic_write_reg(&bank->chip,
+				       priv->reg_base + GIO_MASK(bank->id),
+				       imask);
 	}
 }
 
@@ -538,12 +537,12 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 				      struct brcmstb_gpio_bank *bank)
 {
-	struct gpio_chip *gc = &bank->gc;
 	unsigned int i;
 
 	for (i = 0; i < GIO_REG_STAT; i++)
-		gc->write_reg(priv->reg_base + GIO_BANK_OFF(bank->id, i),
-			      bank->saved_regs[i]);
+		gpio_generic_write_reg(&bank->chip,
+				       priv->reg_base + GIO_BANK_OFF(bank->id, i),
+				       bank->saved_regs[i]);
 }
 
 static int brcmstb_gpio_suspend(struct device *dev)
@@ -585,6 +584,7 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
 
 static int brcmstb_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *reg_base;
@@ -665,17 +665,24 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 			bank->width = bank_width;
 		}
 
+		gc = &bank->chip.gc;
+
 		/*
 		 * Regs are 4 bytes wide, have data reg, no set/clear regs,
 		 * and direction bits have 0 = output and 1 = input
 		 */
-		gc = &bank->gc;
-		err = bgpio_init(gc, dev, 4,
-				reg_base + GIO_DATA(bank->id),
-				NULL, NULL, NULL,
-				reg_base + GIO_IODIR(bank->id), flags);
+
+		config = (struct gpio_generic_chip_config) {
+			.dev = dev,
+			.sz = 4,
+			.dat = reg_base + GIO_DATA(bank->id),
+			.dirin = reg_base + GIO_IODIR(bank->id),
+			.flags = flags,
+		};
+
+		err = gpio_generic_chip_init(&bank->chip, &config);
 		if (err) {
-			dev_err(dev, "bgpio_init() failed\n");
+			dev_err(dev, "failed to initialize generic GPIO chip\n");
 			goto fail;
 		}
 
@@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		 * be retained from S5 cold boot
 		 */
 		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
-		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
+		gpio_generic_write_reg(&bank->chip,
+				       reg_base + GIO_MASK(bank->id), 0);
 
 		err = gpiochip_add_data(gc, bank);
 		if (err) {

-- 
2.48.1


