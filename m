Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1AFCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6XI455PiNr81zZH6BtcUTDH3erDPhGkBmwL0UjtiA8=; b=nfrl/Z80uWIiiJZJpt3tof7TUE
	cPyZhe/x7U5PaXaCJjvZMBhSH3HtfuK/HEq1AkqSAj5ilnYo5fKjHuJz+dYuX5Z6iwVV9Uo5QazBW
	g2B7O/36qxSesOdo8kjjW8iHOTbbUCxbfN9Yh2W0QbYSqkH+FWcfyHNG+1TLQjPiiaKwl1bvKpYaq
	dSWiXmxEpsuBITwyjuijBnjJEmY205PbKNzRG+kIaOp8+M0ll4BA3NBjDeyeax31hA9KRxP9dKNC4
	5J7U4qJpiGUfWgWmUzulyrfjB+4cYwUw5NMos9mRrhxOqzN1GtP/xIMTqLwPw9toeZNZSK/h8frrs
	zfG/Y5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0QB-000000088Oz-2joZ;
	Tue, 09 Sep 2025 15:38:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSD-00000005sgf-2mIc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45de287cc11so11612255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409356; x=1758014156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6XI455PiNr81zZH6BtcUTDH3erDPhGkBmwL0UjtiA8=;
        b=xKfMlEs4FHMLzLofSx0Tka2AEu+BluK/fjGG4ep4bQcQao4Hg0lwwbtwiGlg9mNujx
         ch8DymbPFw+TN1KYcb/THi4HeCSy+0UAFcvWQEm7vO4Z9UBXadpzu2CTKT/S7rEQVZIr
         NYCWl/LbSXOSK0svKU/yt10wUwrx/kaLGKNWG0Gm4ilh23dUJJLyWYYcnGfk7Qt7gjNi
         /LfzrifQZnLEzj68NvueSsyLTYukPYPsXI6srLn4IkJpOmR18cSJy3jdJuza89NLZBup
         7DBYY0nNQvPyEwATInQPjQYEz+t+vvsjXGSaFl7rpK2RYxLhRr1loczgrxlktkdCMU9G
         LrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409356; x=1758014156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6XI455PiNr81zZH6BtcUTDH3erDPhGkBmwL0UjtiA8=;
        b=V8WOEp2tZbpC7VxXfacxLNxFW0p3ui+X3ou0e/9PUoBT5MGvzYUPuXi+j2lha3V3CC
         RKRQs6tMcDGVMso/gI/kPuUyYnJ+pHfPgvww4mXXCWvPsH+Xd8E1ACknhbXoBRWZDlt1
         KzBYSyOWhxqHkud4ytMDDSdXRYah1j3coeMaIE5S5nJFIXUZraHtB/xoIl7ypxClJglD
         AmPkGqEO9o8q/EqQrLgckHP/iukxflZ9YZh7mOLXAehVHLJ2sUsCaVqB7Lq8NVkIS0f+
         saC+LGuLsTjBPi41C/J0TE7cYOHdGOU2mEnWJE3wnOiI1NWj1NM2WT6r2vshgiWmSYSy
         zPwg==
X-Forwarded-Encrypted: i=1; AJvYcCWkMfc+1HzFW7G6evXkCO9xCeyy1BDPAIjh2XPzncuFbHOgvblZxM1JBokE5MAbRB4o77wK09hPP6JxCtdTXI05@lists.infradead.org
X-Gm-Message-State: AOJu0YxQtUNitlMwJnXEopq4D5QiKhTnGyTNSw6OagBHlhbPcP/g0O9Q
	PddnAUK2E6qxlw1Fj7tIssYREWLwjSvpKg6JUkXVQG0Qv47qezlpRbHjinLwgwLq/nA=
X-Gm-Gg: ASbGncuVSZulYkGzOtK3ZTmBhqU6yrMW0bm8+ER89oUBjKlBbvSsGVg6Xj+km21BVXr
	lw5g9GWTmfcG2vZIur8l5LUY9sIoGq7pervROpaXNaxSyj3598Br8zMRoueGMaERD7YupJKDpwg
	1C97Eb45Rb1OFw2dhzD/maWrmMMbMe5WpMDnTJ+DzRM36CNQqNZ9scToRVM7p2rNl2GJgAUxLB1
	mqUssQ7VYn8flZpQc0pneeGau/9Cj1OmnIrO0JYmU7DX6iPWqpSTr0XgqtYtxFwEaBGpi8TzY0H
	i81NSa1cC5DxGqQewwdRtCwBC8TnJAPrIbDX8QjbHZKuJC4HRNvLVwPP9tTWWn8X7zRgaVwTfOX
	aQ5RjcHHl5XqFwgC0gA==
X-Google-Smtp-Source: AGHT+IGhdNQDTQ/G062FzoKjkwVDoXK1StiDr7oBbkv9KofrVmt1JYjUhLT/5CSNVFCfr9+qyLMbkg==
X-Received: by 2002:a05:6000:40dd:b0:3d8:8f86:7afc with SMTP id ffacd0b85a97d-3e62a10b2f3mr10508011f8f.21.1757409356188;
        Tue, 09 Sep 2025 02:15:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:34 +0200
Subject: [PATCH 07/15] gpio: brcmstb: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-7-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10410;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zh+dbaYfNDf7FOmStJJaYhI936mnW1RBjpO4BgoCwfY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4mNwDK6jTB0asDLFnuBHDFAYdY5VCwV9Zd
 0KgU+qodwqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 ciZGD/96sA5hvRG/EKxfHse55GCoj86m/FiF71CbJ3ZBRNaYYl/gIpIqfj/Jtyr6jzKJISpSdVP
 HEmDoVGMpsrsyBYTZV38rOLfkVWALRlNO0PHPiMCbSsbVjaUNjtn+9VSlrZeUgS/RQlA7BXOMOe
 gfldbXTsD1UcY6yMRw2PAQ3Ltbc3zhu0NXzhd35CEc3VY5TqlLt8dULxT8CbQMHWxqE2zFY0JGI
 zqMvOxJaMPE4MqBMiwO9aheYemrGCnO2W+t7fMsGJuu0mPtfJ/2j3IqibWCa4IIsEQty4dgpCf5
 UELR3jidqIAfxoY0JgsrbWn9Gt+/Wcltifr84Fisu/WBbUdr9GndT1ztvVs57Ozrd3sNOkiYZkp
 9HdjZHiqIlKxwErdmQWIAONG+oUhUCt0SiOT+M0zjqTjQKoAIT7pyOvxYutinQw4mG7T3wpsSPi
 2zSwUKU9kMY4KDz1MNuRKsWkNK9UZOC0TQFYvVwyQMiB3ldpzrNZyIS2sTBddrsHiATe1wPzV1p
 L2bqgPjv9dy8m+ZdBn7br20wSoMbMXFzZZzfTf5//yI3B+Foo05RP2GMYwQ5Z2vGkNLNKPei6wf
 /CYk5x0j3nXr8fUtL5Kw8fa66GX22SL3cz6tos9jwLPMXjg0RyccXN07KGbUw3JMDeiGzo7hGVu
 5jFwNdL/mMWh++g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021557_835795_C07D36CD 
X-CRM114-Status: GOOD (  25.40  )
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
index e29a9589b3ccbd17d10f6671088dca3e76537927..d03ff4ed9ef4c9d75f3e8c9c6fcb39bc577bcb79 100644
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
+		config = (typeof(config)){
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


