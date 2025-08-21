Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D5CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXCu7D5T8hh+B0ymd9c06gruq8RjR5wxl6fBKLMWkjc=; b=uAFOEP/9xAASQfEz1cwvNyfNWo
	MDH+E1GxAR48PCBCwuleCXnnBUmesYLTuPmoo+xQorCc9fFTRGrygn5rA/5ThXgOfFF+zjnvyEVR9
	6FtOqzLFYLeQK9PitJXBkeP3eAv4hw+4V7443vCsezbhU4hJVOji904m2T52dHvokuOSZ0op1LnIJ
	dD5Lb6ZCI+QTzVQHDqasqcej8dTgk1ugqvgs8FgflW1nc15U3RnsEYrUxlS2aX+E0iKG5A4yGsEHx
	BBwTTsH+8posFqLnojI+2rxWClcbSR0XBDJV6e1/qQkE1eZ3xytgg9qWQT2rLcCQ+84hHR1Cgjtkv
	qgalO45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7p-0000000Fdux-2MXA;
	Thu, 21 Aug 2025 03:38:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotRA-0000000FKX8-40TO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43E31F37;
	Wed, 20 Aug 2025 17:45:43 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D1543F63F;
	Wed, 20 Aug 2025 17:45:50 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 5/9] pinctrl: sunxi: support A733 generation MMIO register layout
Date: Thu, 21 Aug 2025 01:42:28 +0100
Message-ID: <20250821004232.8134-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174553_086097_F60C9920 
X-CRM114-Status: GOOD (  19.02  )
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

After Allwinner changed the layout of the pinctrl/GPIO IP MMIO register
frame only a few years back, the new SoC generation (starting with the
A733) changes the layout again: each port now uses 128 instead of 36 or 48
bytes, and the drive level registers move to make space for the new
set/clear data registers. Also the PortA registers start at offset 0x80
instead of 0x0 as before, to make room for non-bank specific registers,
like the pow_mod_sel registers, at the beginning of the MMIO frame. Finally
the IRQ registers move into each bank's region.

Add yet another quirk bit to mark this case, and set the existing register
offset values to match the new layout. This also requires to add new
members to struct sunxi_pinctrl, to accommodate the extra changes. The
actual runtime code changes are fortunately minor.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 14 ++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 14 ++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 540fa6c285cfc..ff7c5439a458e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -65,7 +65,7 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip;
  */
 static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
-	u32 offset = 0;
+	u32 offset = pctl->bank_offset;
 
 	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
@@ -102,7 +102,7 @@ static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 {
 	u32 offset = pin % PINS_PER_BANK * pctl->dlevel_field_width;
 
-	*reg   = sunxi_bank_offset(pctl, pin) + DLEVEL_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + pctl->drv_regs_offset +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(pctl->dlevel_field_width) - 1) << *shift;
@@ -1526,15 +1526,25 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
+		pctl->drv_regs_offset = DLEVEL_REGS_OFFSET;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
+	} else if (flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT) {
+		pctl->bank_mem_size = A733_BANK_MEM_SIZE;
+		pctl->bank_offset = A733_BANK_OFFSET;
+		pctl->drv_regs_offset = A733_DLEVEL_REGS_OFFSET;
+		pctl->pull_regs_offset = A733_PULL_REGS_OFFSET;
+		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
 	} else {
 		pctl->bank_mem_size = BANK_MEM_SIZE;
+		pctl->drv_regs_offset = DLEVEL_REGS_OFFSET;
 		pctl->pull_regs_offset = PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = DLEVEL_FIELD_WIDTH;
 	}
 	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
 		pctl->pow_mod_sel_offset = PIO_11B_POW_MOD_SEL_REG;
+	else if (flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
+		pctl->pow_mod_sel_offset = PIO_NCAT3_POW_MOD_SEL_REG;
 	else
 		pctl->pow_mod_sel_offset = PIO_POW_MOD_SEL_REG;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 252cf58387e33..2b9e93972a5d3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -53,6 +53,12 @@
 #define D1_DLEVEL_FIELD_WIDTH	4
 #define D1_PULL_REGS_OFFSET	0x24
 
+#define A733_BANK_MEM_SIZE	0x80
+#define A733_BANK_OFFSET	0x80
+#define A733_DLEVEL_REGS_OFFSET	0x20
+#define A733_PULL_REGS_OFFSET	0x30
+#define A733_IRQ_REGS_OFFSET	0x40
+
 #define PINS_PER_BANK		32
 
 #define IRQ_PER_BANK		32
@@ -92,7 +98,9 @@
 #define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
+#define SUNXI_PINCTRL_NCAT3_REG_LAYOUT	BIT(11)
 
+#define PIO_NCAT3_POW_MOD_SEL_REG	0x040
 #define PIO_POW_MOD_SEL_REG		0x340
 #define PIO_11B_POW_MOD_SEL_REG		0x380
 #define PIO_POW_MOD_CTL_OFS		0x004
@@ -177,6 +185,8 @@ struct sunxi_pinctrl {
 	struct pinctrl_dev		*pctl_dev;
 	unsigned long			flags;
 	u32				bank_mem_size;
+	u32				bank_offset;
+	u32				drv_regs_offset;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
 	u32				pow_mod_sel_offset;
@@ -236,6 +246,10 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
+		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		       A733_IRQ_REGS_OFFSET;
+
 	return IRQ_REGS_OFFSET +
 	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
 }
-- 
2.46.3


