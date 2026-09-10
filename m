Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF78C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05dd9VYQTJafQ4/I82ZtSnyvGkZDL23MpUqml2U2W4Q=; b=iGZyh7jf5UP0vhxzdnDDO2X9Sm
	GDLPwsZ2fFhF7abBLKvb4JFRBPtwOXUc84H8S81EKcsFPnSrSYpUunl+pmuJOCfK7ULsVtaqa5kPe
	4b0QRBU+oJnpTW53YS57tPDTmLpWzrCfEo00yc6/mnts+CscDwtXBT7ugTWpiwMNTgXJyKIqzm1My
	OHEG+RIh66AZCFo1lwt0h6uLHv5AL3xKmF9adzTEbOG2f7J/75Hu3Mhw+KGlzLews8lq31DouIZp+
	2GtoRZe1mY+xzh/w/SdxQwqruWRN7WtIU1Tzv1aCtEYBHr+YYyKRb7gx//uQEJMbwUSITnQRFWSPf
	C1W4mqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewM-0000000EUS4-0Nmf;
	Thu, 10 Sep 2026 13:35:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewH-0000000EULa-0oxq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=05dd9VYQTJafQ4/I82ZtSnyvGkZDL23MpUqml2U2W4Q=; b=e+umVcaYUGxkh57LDLlHtZg4/P
	OQZgLimAI7dwqQCmv/4alb1f7cVRIP9McM4peUs7QQepxpK+tKM2vocSnEdQK1JS3xud1hl3fzqkU
	kwgqF6cVMSWcsWDpnTnee0Mdau5bk2/Teo1qBeRULIsq+GOBe2CohpS5+oGstTQf3GjM1qVg1+Rkx
	TNtmF6JdeU7e1fBOwLbsxHGzodxJqm2C56tPjmIfOkavYAJMxp02CEGo4D9/pFH1iWz4wgRLyC0vI
	SSFEJWWjSZo2MXmuy8DGrmLWkU6KlGMEwhIKR0lyWuI42ajKpDy7potfeZQ90Sh8awiRhbm/f+7Li
	SQC8/RCA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ewE-00000002XfX-122O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E99522BE;
	Thu, 10 Sep 2026 06:35:33 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A39043F528;
	Thu, 10 Sep 2026 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047337; bh=NKEooR/BP+QmLw2QaESRChX1MftucmWGYzCzP1r3PIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JLTE3oihpM02KQmJ+UpQYOJZAlkNblbqM+ckWNTB+Cj+3Im3OthohBfPpDym52cQU
	 tmlemi/IEHD3aa7j68zk1VgVliaYDbf9fCjw2Pi09xoetF5KyN2FyMQesqcuaieW/0
	 5qPI0gqIozLZCV3qx5BVMKrcwQBlmo8S6SwMkEJY=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/7] pinctrl: sunxi: support A733 generation MMIO register layout
Date: Thu, 10 Sep 2026 15:35:15 +0200
Message-ID: <20260910133519.459011-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143538_690152_64BC2718 
X-CRM114-Status: GOOD (  18.53  )
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
index 5f08c75549b4d..35aa3a8ea1814 100644
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
@@ -1592,15 +1592,25 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
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
index 15aa6fe62dbbc..d09467ed437a3 100644
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
@@ -94,7 +100,9 @@
 #define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
+#define SUNXI_PINCTRL_NCAT3_REG_LAYOUT	BIT(11)
 
+#define PIO_NCAT3_POW_MOD_SEL_REG	0x040
 #define PIO_POW_MOD_SEL_REG		0x340
 #define PIO_11B_POW_MOD_SEL_REG		0x380
 #define PIO_POW_MOD_CTL_OFS		0x004
@@ -179,6 +187,8 @@ struct sunxi_pinctrl {
 	struct pinctrl_dev		*pctl_dev;
 	unsigned long			flags;
 	u32				bank_mem_size;
+	u32				bank_offset;
+	u32				drv_regs_offset;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
 	u32				pow_mod_sel_offset;
@@ -238,6 +248,10 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
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
2.47.3


