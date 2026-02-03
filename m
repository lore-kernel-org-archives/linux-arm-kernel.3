Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A345BE8B37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBqk7GT/aageNrCmB3vwCGfHpCzIBG1wMz1FAE3zYkw=; b=JBJ5LeQoGC5x4Yvm1iwLkN2bzm
	ttRr/pvoTsWSHTNF/bfaMjbGU3A1AD+Yg61tktUSPYbRAjjWUvL7bvMV4K/HUXDxAXIkHCpNRcasW
	ct6RBIbwkbkkddwjHeT23tHTLnB9+7ssnPNwVMOqkfNYnwW5QVxmgqx0xezuWo/fJzNyr25VNiXRM
	pO3ZqLUwKd2hbh+S4FbkHdA5etAKmY4AOlULVI8KlfCK3mfWo66TjQNTpzZ2m6u4VQghAsp+AxOv4
	XdsG+83uMM9B89gxmfQLHtoK82mTZ9cW6nfhQ/vktRhbk9SLu2xAoAHf375Tp77o5Pcjk1cxKnzPg
	gOWpiFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ5W-00000007aNS-0EhP;
	Tue, 03 Feb 2026 23:45:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ5O-00000007aJY-13oH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:45:37 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id EB7ADC08E92E;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com EB7ADC08E92E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770162331;
	bh=ml9v1vB2/T5uCoE4/zhdD80uAV/ygIDmxoi79Luua2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQouYBO2njo6WhRO2sa8ITNwvSTFa6bI79uHVRUNpLVkgYNbrVwB6UHLBnKjOXFFW
	 sAxrUCDykPyEWegyLiuS81IE8u4LdbrfNwPSE96ybJ81XJvtEQAKLE27RZD2GVFdYt
	 Nt6L/W421Juhs+Hp2BZczOcbL+wJNOq12fiarQX8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id CE1E417DFF;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v4 1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
Date: Tue,  3 Feb 2026 15:45:27 -0800
Message-ID: <20260203234529.1081148-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_154534_348454_6072FF8A 
X-CRM114-Status: GOOD (  13.29  )
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

Consistently use irqd_to_hwirq(d) which is the recommended helper to
fetch the hardware IRQ number from an irq_data structure. While at it,
update the brcmstb_gpio_set_imask() function signature to use the proper
type for the "hwirq" argument rather than "unsigned int".

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 2352d099709c..4c35ed664f65 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -96,7 +96,7 @@ static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 }
 
 static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
-		unsigned int hwirq, bool enable)
+				   irq_hw_number_t hwirq, bool enable)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
@@ -132,7 +132,7 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, false);
+	brcmstb_gpio_set_imask(bank, irqd_to_hwirq(d), false);
 }
 
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
@@ -140,7 +140,7 @@ static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, true);
+	brcmstb_gpio_set_imask(bank, irqd_to_hwirq(d), true);
 }
 
 static void brcmstb_gpio_irq_ack(struct irq_data *d)
@@ -148,7 +148,7 @@ static void brcmstb_gpio_irq_ack(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(irqd_to_hwirq(d), bank));
 
 	gpio_generic_write_reg(&bank->chip,
 			       priv->reg_base + GIO_STAT(bank->id), mask);
@@ -159,7 +159,7 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(irqd_to_hwirq(d), bank));
 	u32 edge_insensitive, iedge_insensitive;
 	u32 edge_config, iedge_config;
 	u32 level, ilevel;
@@ -236,7 +236,7 @@ static int brcmstb_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(irqd_to_hwirq(d), bank));
 
 	/*
 	 * Do not do anything specific for now, suspend/resume callbacks will
-- 
2.43.0


