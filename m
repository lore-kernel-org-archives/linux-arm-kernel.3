Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19975E8B383
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VidmbdRAxY8YWAvytbBeKahLP8CTi6LTaqoyd+0OfWY=; b=FTI7lw9wg52WA2fz+wJNimBrCx
	9RBXJ84ygA9lZ7uPozvQJTMKJ1wu70+sbexkSNgsagbLcivEj+XN7V2F9c24qfw7BUv3aCe0IjXfH
	gvYecWT1uxXZzLUAYsgT27F1aytuWYlmPbMrlSd9WHSp4Z9PLc1Ii/9zSySabObQdKH+Y6f7IrCBa
	SEx1q62HjF9m9VTvJbym05A3diuHgUGKtJGOHIKPCOZp+9o8fZJXauNcFOLX6ypKCx8gGJUPWcZCF
	be/VMD1DgUunnexHjowysQJuVgehxhKvLOPQsFdHNuGIrja2Zk1YOovdkdM9gw1xnv8OAmcXBV3cZ
	j/g5X5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ5R-00000007aLD-066S;
	Tue, 03 Feb 2026 23:45:37 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ5O-00000007aJQ-0658
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:45:35 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1950BC052240;
	Tue,  3 Feb 2026 15:45:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1950BC052240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770162331;
	bh=icfOfRhE9JjEKzGLMpHUdbFb5adBQ0IZv99Cz6ZjB5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmwCRBTp9QH15zZYYrQEkyGKSPnH3VfF5+8iYwwQi7eN4Yncn6C3kuURvVr1f/8vc
	 j3EHNNBvBhZMfzbLGZLld8VVW4psHXxQsWWU/NYRUnrjvdvFifhm74QDGOsex5Pfli
	 IgdS93VvgeXN6BKtOVgRyWfVSnMyqF7MGpNNmJGs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EFE5217DFE;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v4 2/3] gpio: brcmstb: implement .irq_mask_ack
Date: Tue,  3 Feb 2026 15:45:28 -0800
Message-ID: <20260203234529.1081148-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_154534_216567_586EC6BF 
X-CRM114-Status: GOOD (  14.26  )
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

From: Doug Berger <opendmb@gmail.com>

The .irq_mask_ack operation is slightly more efficient than doing
.irq_mask and .irq_ack separately.

More importantly for this driver it bypasses the check of
irqd_irq_masked ensuring a previously masked but still active
interrupt gets remasked if unmasked at the hardware level. This
allows the driver to more efficiently unmask the wake capable
interrupts when quiescing without needing to enable the irqs
individually to clear the irqd_irq_masked state.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Doug Berger <opendmb@gmail.com>
Co-developed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 4c35ed664f65..fff8e4100295 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// Copyright (C) 2015-2017 Broadcom
+// Copyright (C) 2015-2017, 2026 Broadcom
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
@@ -95,15 +95,13 @@ static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 	return hwirq - bank->chip.gc.offset;
 }
 
-static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
-				   irq_hw_number_t hwirq, bool enable)
+static void __brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
+				     irq_hw_number_t hwirq, bool enable)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
 	u32 imask;
 
-	guard(gpio_generic_lock_irqsave)(&bank->chip);
-
 	imask = gpio_generic_read_reg(&bank->chip,
 				      priv->reg_base + GIO_MASK(bank->id));
 	if (enable)
@@ -114,6 +112,13 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 			       priv->reg_base + GIO_MASK(bank->id), imask);
 }
 
+static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
+		unsigned int hwirq, bool enable)
+{
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+	__brcmstb_gpio_set_imask(bank, hwirq, enable);
+}
+
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
@@ -135,6 +140,20 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	brcmstb_gpio_set_imask(bank, irqd_to_hwirq(d), false);
 }
 
+static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
+	struct brcmstb_gpio_priv *priv = bank->parent_priv;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
+
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+	__brcmstb_gpio_set_imask(bank, hwirq, false);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_STAT(bank->id), mask);
+}
+
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -471,6 +490,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.name = dev_name(dev);
 	priv->irq_chip.irq_disable = brcmstb_gpio_irq_mask;
 	priv->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
+	priv->irq_chip.irq_mask_ack = brcmstb_gpio_irq_mask_ack;
 	priv->irq_chip.irq_unmask = brcmstb_gpio_irq_unmask;
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
-- 
2.43.0


