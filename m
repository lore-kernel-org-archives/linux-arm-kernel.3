Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A00C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nx5EKq4dyhumw2LnOic/xvfs1IGOiiLpCQZRqE/dz8I=; b=ndEB6I5FlcBnQI68UdwLaEgDFi
	qMA4GVm9bc6Y0llDHYqHb1hE/RKFQ5cecCb+iE+JPYSXd8SjQMe33eirdb6pPYfLEmCQvM8y+eYtH
	Swj4k/DpuOf4+58P5BdSkvvjPDa/HrDOMJ+TPh2Q+aEHdz4IbIxlB3qf1LtwVk3D9i2fcYpGsT8kK
	WDRG/oJfT5Z3zw2w9+MWNEHiYXWG2N6YxfOKKvD0aPrM7HFqNTC39ykBdoq6J2tsdentxfnduq6m+
	/SlNSb5hN/5qB6yr/5i17SImevPcwdvZfWqLj31Kdvj7K1u/87cQRZKYNr25IS3VYmrJ6FwDWL+zY
	Lv1s52Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vij9Z-00000006EZa-2LQV;
	Thu, 22 Jan 2026 01:06:29 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vij9W-00000006EYF-2lTT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 01:06:28 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D80C7C008DE2;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D80C7C008DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769043985;
	bh=HexbE4h+Gs6KykT03gyu0tt3owJKTbjX9Kje2L/OQiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sFSILUUstI5k7lriBf2QCHl67LS53vbe/58GskyRyAtxx10FwZ7dODCUNBjXb8oTv
	 Bg+qhFOc+HDU3LP+yvsDZgOHbSC150w2nGQi15V62EfFCc6Y1nRb2ovQmEZL76kW9m
	 YPgythBoocXN2rvmriuuZCE6Sqp9x2bCJAYvgVJM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B8AC119CDA;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
Date: Wed, 21 Jan 2026 17:05:15 -0800
Message-ID: <20260122010516.1200630-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_170626_720895_43CF1AFE 
X-CRM114-Status: GOOD (  14.56  )
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

The irq_mask_ack operation is slightly more efficient than doing
irq_mask and irq_ack separately.

More importantly for this driver it bypasses the check of
irqd_irq_masked ensuring a previously masked but still active
interrupt gets remasked if unmasked at the hardware level. This
allows the driver to more efficiently unmask the wake capable
interrupts when quiescing without needing to enable the irqs
individually to clear the irqd_irq_masked state.

Signed-off-by: Doug Berger <opendmb@gmail.com>
[florian: forward ported change after switch to guard()]
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 2352d099709c..5fb6612c2aa5 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// Copyright (C) 2015-2017 Broadcom
+// Copyright (C) 2015-2026 Broadcom
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
@@ -96,7 +96,7 @@ static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 }
 
 static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
-		unsigned int hwirq, bool enable)
+		unsigned int hwirq, bool enable, bool ack)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
@@ -110,8 +110,10 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 		imask |= mask;
 	else
 		imask &= ~mask;
-	gpio_generic_write_reg(&bank->chip,
-			       priv->reg_base + GIO_MASK(bank->id), imask);
+	if (ack)
+		gpio_generic_write_reg(&bank->chip,
+				       priv->reg_base + GIO_MASK(bank->id),
+				       imask);
 }
 
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -132,7 +134,15 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, false);
+	brcmstb_gpio_set_imask(bank, d->hwirq, false, false);
+}
+
+static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
+
+	brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
 }
 
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
@@ -140,7 +150,7 @@ static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, true);
+	brcmstb_gpio_set_imask(bank, d->hwirq, true, false);
 }
 
 static void brcmstb_gpio_irq_ack(struct irq_data *d)
@@ -471,6 +481,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.name = dev_name(dev);
 	priv->irq_chip.irq_disable = brcmstb_gpio_irq_mask;
 	priv->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
+	priv->irq_chip.irq_mask_ack = brcmstb_gpio_irq_mask_ack;
 	priv->irq_chip.irq_unmask = brcmstb_gpio_irq_unmask;
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
-- 
2.43.0


