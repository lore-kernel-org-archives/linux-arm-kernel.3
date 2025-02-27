Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EE4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDqN0tuF7ZXZ8eOaXq93koTcMFYkwocymdNIetrIR7Q=; b=FzsC6+s01wBQ5uHBlvXSfo19tK
	5Lj+cvBvdLWUN2BueORsThxCwHTo9kzTyyfcVp7fNZMXYljO6kFGxyaCOBTU4lAiXj9r7mSfe8ODF
	p1oPXJCraJA15yfGndIrigjJTXeKmPt1TYiVniAU1XurjHza/DCvC4KS44qEqJ35KsMMkI+K77+G4
	JUouA7dYte0iuXk8NsmHZuCZmuBcy2I4WdZAsLGiyB0CPhPoCx9ZX9QPzRSiLYhu0HJdXvhvsEFoO
	zQogztfJhTphYZF++4XDrNbo86QZcGG+P0V0Fln2eisE50L/k4U50o4PNrDkD2GEzxbg+TNogDR7r
	n385UiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnFd-00000009APl-3wsv;
	Thu, 27 Feb 2025 23:25:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn85-000000098kp-1TLw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:17:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27910153B;
	Thu, 27 Feb 2025 15:17:36 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C2ED3F673;
	Thu, 27 Feb 2025 15:17:19 -0800 (PST)
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
Subject: [PATCH v3 4/8] pinctrl: sunxi: support moved power configuration registers
Date: Thu, 27 Feb 2025 23:14:43 +0000
Message-ID: <20250227231447.20161-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250227231447.20161-1-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_151721_509584_D7400728 
X-CRM114-Status: GOOD (  14.96  )
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
index 83a031ceb29f2..fc12e6f807e4d 100644
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
+			    PIO_POW_MOD_CTL_OFS);
 		reg &= ~(1 << bank);
-		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
+		writel(reg | val << bank,
+		       pctl->membase + pctl->pow_mod_sel_offset +
+		       PIO_POW_MOD_CTL_OFS);
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
index 6cf721876d89d..742fc795c7664 100644
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
+#define PIO_POW_MOD_CTL_OFS		0x004
 
 #define PIO_BANK_K_OFFSET		0x500
 
@@ -173,6 +175,7 @@ struct sunxi_pinctrl {
 	u32				bank_mem_size;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
+	u32				pow_mod_sel_offset;
 };
 
 #define SUNXI_PIN(_pin, ...)					\
-- 
2.46.3


