Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60154CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOQx0t/yoBTjIlmpwlhy2Xp5tYNVpfWuWDWWOowITKk=; b=GnWuJ2pTRFdpnr1kFpggn69/yp
	nLPjYOWl+qEfdUus3NHL6Su+G1HJxys6Cwvw2EFpx8GKWANg9gUtLdwHCPBHfSNWhsRkTJnXARvJg
	7FdaOM07C2QaJRFt24ZORUiK7CZrJyCwc76zFAAjVebOgeR4uMhvfwfTruK6ItbSRrgtbLVyc6BUx
	6JaUPcvQISBPetcVtBSj6MJrGUV6O5Qi6tnRwFoqcZf+kqFweBP5+vLvSEuvZ9TLMrU/hbWWDhD4r
	k6M9Z1dlQ05ssqNLZak8x6E05c5Qkx6uwLPWVMqm6eg4sJ7fSoe4ePBNPk4fDKXFv4abIvkqAxpeX
	qrFpUeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcb-00000004H4z-15zs;
	Mon, 22 Jun 2026 01:38:45 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcV-00000004H2s-1LQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:38:40 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-517dc520840so41767891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092318; x=1782697118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOQx0t/yoBTjIlmpwlhy2Xp5tYNVpfWuWDWWOowITKk=;
        b=ZjvrDZ6VwUV4HpUu848AjEHEE6/DrE5tyeXHyVBYHIYW2FXQ7dl3bls4Ps1vM/WXEf
         lAcQHxmIdU9Mh/gk7hWEGxoM07bxie+DOR28WjYEocetZ7imN/7yV2r30aHESE6zoxng
         QVwiz+kL+n5AH24Z/SipCfLzcVTpVKgneX8lDZQ8+OxGHNc5yL47b2A8dVcK/I51tNJq
         K99I/YGk1LwO+egOOXOb0wC36E8moiFREMWRU47aCoKJkwtf6QGW8ZRI2pnLODalIzMP
         8j+EnhnRnd7iWrazrs0NjRaGHTZ11TrpVHRo/QxBcMe05hcmAP44vTXXRV/wAXkJEKOY
         Y8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092318; x=1782697118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sOQx0t/yoBTjIlmpwlhy2Xp5tYNVpfWuWDWWOowITKk=;
        b=NCwCSupQOLxWMIacm4Us7tAq49TFsf8vkQ+DcqaAGoeNL6wIN/hA5YCv2/W1gikqen
         CJBtnBqnLgN8fzDgwuZc/qe277YR/WbtDZYeJTNyp5wO41Fz55yIBIgkmO0QSiNhuGMi
         +ZrAQVEZXV+wkhmoO+ru1rCNpwq32lRF064eRdzZ7jf31sNPFEDKtPoFHBOx34XXD6dE
         LXvcLOJn2CH/IccieySSMwljHJ73HYP2Txv/kak9UGaxMd7kDmZpgdIbtk/2PoUAMJci
         HllPV3g01EXu6RT5FT2atPnRO0Ctghkyktrw1ZjAeTtBnpNtFxImjmrRw33aA6dF0f7E
         U3qg==
X-Forwarded-Encrypted: i=1; AFNElJ9x/PznsowJAuXkqaiJEkzosdxo+NY4+EG66cBpx+CYC4uKyRU+L5QD0ULUEJ+owmAuLA+KNBIcVzOIwvryTYfU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7LZP28EEPKlCdfyerS3/iTf6tIZ19PNFGfH5epap5na3Hc9ZR
	hYvkx9HQWM2a3tEAYMSPwMH8F5VI/mFp2Je2iNlpbbt3nERtsHhJqwmg
X-Gm-Gg: AfdE7cnAQYczALhJmahCWx/kOazuvKFU1r8WsXrqkkHWzKN1f7gztpEdldeGVW0K/KD
	k2/RZs7WSy3cpWJGSUD5XYYfhr8KbjDyNyyz2sdQ7aL0yzXT9uxHxUZD3IcGw63tabf2FRlvspR
	Usolavcr9B4GnMXU3V2MyZSkmL5QdZNhwyeTfWpcMbkgMWNoAM+9JO2SYJSq64BUK2oHv4ZK1bV
	JSVfLQyMl+g81S6uyubrT7RP85Rwsl/dKEK79D5RpuWxtCdbBjrwYHBH6nT2+t/bthTaC0D7cu+
	/epIAmfzEqwEsfLybgjGDIwYO7qaFo7oM987n7INAZY/QMdy8l+ojaR6M0yADud2OiXGxIPerJq
	U2y18uTkvYE5vPkLdDdV5IJcoafPYiH3RyB9VHiYnN+ROPTn86GRlaY2K0wvojqGeWBWJSFTr+8
	pjLsFVHyRwpI1jog==
X-Received: by 2002:a05:622a:14d0:b0:517:6665:2a9a with SMTP id d75a77b69052e-519e4e0acdemr186803381cf.50.1782092317978;
        Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:23 +0000
Subject: [PATCH v3 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-1-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_183839_384122_A7D58D0D 
X-CRM114-Status: GOOD (  17.64  )
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

Refactor to support the Allwinner A733 DMA controller. Currently, the
`sun6i-dma` driver has several functions related to interrupt handling
(reading/writing interrupt enable and status registers) and register
dumping that are hardcoded.

To support the A733, which has different register layouts and interrupt
handling logic, these functions are being moved into the
`sun6i_dma_config` structure as function pointers. This allows the
driver to use a polymorphic approach where the specific implementation
is determined by the hardware configuration assigned during device
probing.

Changes:
- Added function pointers to `struct sun6i_dma_config` for:
    - `dump_com_regs`
    - `read_irq_en`
    - `write_irq_en`
    - `read_irq_stat`
    - `write_irq_stat`
- Implemented generic `sun6i_read/write_irq_*` functions for existing
  hardware.
- Added a macro and updated existing `sun6i_dma_config` instances (A31,
  A23, H3, A64, A100, H6, V3S) to use these new function pointers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..ef3052c4ab36 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -138,6 +138,11 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
+	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg);
+	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val);
+	u32 (*read_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg);
+	void (*write_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -347,6 +352,26 @@ static void sun6i_set_mode_h6(u32 *p_cfg, s8 src_mode, s8 dst_mode)
 		  DMA_CHAN_CFG_DST_MODE_H6(dst_mode);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+}
+
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -460,16 +485,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
-	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
+	irq_val = sdev->cfg->read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			(irq_offset * DMA_IRQ_CHAN_WIDTH));
 	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
-	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+	sdev->cfg->write_irq_en(sdev, irq_reg, irq_val);
 
 	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
 	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
 
-	sun6i_dma_dump_com_regs(sdev);
+	sdev->cfg->dump_com_regs(sdev);
 	sun6i_dma_dump_chan_regs(sdev, pchan);
 
 	return 0;
@@ -549,14 +574,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 status;
 
 	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
-		status = readl(sdev->base + DMA_IRQ_STAT(i));
+		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
 			str_high_low(i), status);
 
-		writel(status, sdev->base + DMA_IRQ_STAT(i));
+		sdev->cfg->write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
 			pchan = sdev->pchans + j;
@@ -1101,6 +1126,13 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 	}
 }
 
+#define SUN6I_DMA_IRQ_A31_COMMON_OPS	\
+	.dump_com_regs    = sun6i_dma_dump_com_regs,	\
+	.read_irq_en      = sun6i_read_irq_en,	\
+	.write_irq_en     = sun6i_write_irq_en,	\
+	.read_irq_stat    = sun6i_read_irq_stat,	\
+	.write_irq_stat   = sun6i_write_irq_stat,
+
 /*
  * For A31:
  *
@@ -1132,6 +1164,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1155,6 +1188,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1173,6 +1207,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1200,6 +1235,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1221,6 +1257,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1244,6 +1281,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_high_addr = true,
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1266,6 +1304,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1289,6 +1328,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 static const struct of_device_id sun6i_dma_match[] = {

-- 
2.54.0


