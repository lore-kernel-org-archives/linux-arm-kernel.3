Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D801D12D5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zhhg/ezyd8KgeDnp563ASIuFEjWzfAuYLQqS6ukXWx8=; b=HIsUjxIfvD8eq9e0yPJnM9USBF
	PQ7SEOu0Ez/IL4wUME8vhq5HxAzG33oKFVOMQJjvpnvbFQAIfClM71+v4OkqwOGOay4np5C9X17Q3
	de1PofZH0BUSoeEANDfT5l19LefYhoOWqwPAQeQUVIgDsjqG6lLdOPCnvKLxgH1prDU1w/afpx92O
	HXXDmE9c/7TRcNDqH/byPiqhwZtjD7fCYbHfKdCdlfbYODAi+0JZSZux1Zk6QsHs/UaQ2PhfeQQ++
	om6Lt7rATrYjs2P+x1BVeWBTf/x0T2x4qhP9QVy77JGjLBcrsbBmd8uYCXNVfxYPeJLho5yDpMUA9
	8HRjIfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIu0-0000000Fzid-2CEt;
	Mon, 11 Nov 2024 01:07:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIkn-0000000FyYh-20Ar
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:58:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7EB413D5;
	Sun, 10 Nov 2024 16:58:34 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF8C3F66E;
	Sun, 10 Nov 2024 16:58:03 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] pinctrl: sunxi: support moved power configuration registers
Date: Mon, 11 Nov 2024 00:57:46 +0000
Message-ID: <20241111005750.13071-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111005750.13071-1-andre.przywara@arm.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_165805_625240_3C34B09A 
X-CRM114-Status: GOOD (  14.85  )
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

The Allwinner pincontroller IP features some registers to control the
withstand voltage of each pin group. So far those registers were always
located at the same offset, but the A523 SoC has moved them (probably to
accommodate all eleven pin banks).

Add a flag to note this feature, and use that to program the registers
either at offset 0x340 or 0x380. So far no pincontroller driver uses
this flag, but we need it for the upcoming A523 support.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 83a031ceb29f2..a1057122272bd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
-		reg = readl(pctl->membase + PIO_POW_MOD_CTL_REG);
+		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
 		reg &= ~BIT(bank);
-		writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
+		writel(reg | val, pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 		fallthrough;
@@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		val = uV <= 1800000 ? 1 : 0;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
-		reg = readl(pctl->membase + PIO_POW_MOD_SEL_REG);
+		reg = readl(pctl->membase + pctl->pow_mod_sel_offset +
+			    PIO_POW_MOD_SEL_OFS);
 		reg &= ~(1 << bank);
-		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
+		writel(reg | val << bank,
+		       pctl->membase + pctl->pow_mod_sel_offset +
+		       PIO_POW_MOD_SEL_OFS);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
 	default:
@@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		pctl->pull_regs_offset = PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = DLEVEL_FIELD_WIDTH;
 	}
+	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
+		pctl->pow_mod_sel_offset = PIO_11B_POW_MOD_SEL_REG;
+	else
+		pctl->pow_mod_sel_offset = PIO_POW_MOD_SEL_REG;
 
 	pctl->irq_array = devm_kcalloc(&pdev->dev,
 				       IRQ_PER_BANK * pctl->desc->irq_banks,
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 37a64624142b6..5b4b01fca3274 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -87,9 +87,11 @@
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
 #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
+#define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 
-#define PIO_POW_MOD_SEL_REG	0x340
-#define PIO_POW_MOD_CTL_REG	0x344
+#define PIO_POW_MOD_SEL_REG		0x340
+#define PIO_11B_POW_MOD_SEL_REG		0x380
+#define PIO_POW_MOD_SEL_OFS		0x004
 
 #define PIO_BANK_K_OFFSET		0x500
 
@@ -173,6 +175,7 @@ struct sunxi_pinctrl {
 	u32				bank_mem_size;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
+	u32				pow_mod_sel_offset;
 };
 
 #define SUNXI_PIN(_pin, ...)					\
-- 
2.46.2


