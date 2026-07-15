Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F96C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9097m1/8Cd7swATAUXouQoSjo89AYWrjWVI5qB+z/6Q=; b=zegsyYEaRavkL4D1JvpaAv2BBf
	gcKNalQ6Vz3RWc1i9KJb02PVrhZlblo92/RCf17m4X2pYSNpeRMn0KO6HU9Y/Mzpyd2xMUNRFGtP8
	lyb82KxMsdwCaMkFQlBp8P//29ViyZ3lgXrjJf/onswQH17vuQGph5/oRjULouJ0YWbK8f+Fh/WJo
	zGG631HiQuYebv9ytrHshuj6PKwppS3D8JSI2FJKhnPmR6q4vrq2w1BSpL3TVAOk25nQD5JEulnLt
	XjfdckG853+AvoKuP4UjJ+s2DED3b7CFYOvL1tBfV949GMFeI8N7FHY4whNnjseVZCKNKKikRom3H
	xZ1TAopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Q5-0000000FSt4-3VK4;
	Wed, 15 Jul 2026 16:25:13 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Q2-0000000FSs1-0ShA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:25:11 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e9ed64d490so2114447a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784132709; x=1784737509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9097m1/8Cd7swATAUXouQoSjo89AYWrjWVI5qB+z/6Q=;
        b=MpegzEfOwIrzfQAKDbyLO4JFYF6zu52HlOkkwTIFqSs6rJATW3rEK9EVDhGr59kHWa
         KgJ3/L+DfB9+ksDS8NA0JYBuqEww/DLuvwKumOer+Ffz6S9kLZYNWAZQyDkD9zkkddQq
         MSH5sDgfkzl4oxKis7kFuZCLPhe+HRu7YW/Mk3c8SeyJdV3XzvrK0a3KyU4ao8Vadc0B
         Dq5f7w3CBx/Tc+r0qRk4TP3VukEtMkbnxTxosZObUl5T2m4hVu+WtF5azDFL9h/0gqnM
         hykL4EncfXLIqSvRkig+3jrK2l1agJQ5XvLuTZZeBWQnBJznXQbyWxPLyRvKVIFMWsuP
         567w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784132709; x=1784737509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9097m1/8Cd7swATAUXouQoSjo89AYWrjWVI5qB+z/6Q=;
        b=Ig/tsMoxChv3KmSfhGAHSPmO1SBsQVPQHpNELJNQNGHaFYA0Oykk92yykDMdWJO0JJ
         bLoFTmXwHLjbC5gNf8b2BTHuWCwvGzMMrWn1gkUMpQVBnc+k6tcdiKtWGiRh/+xoRRRY
         RGDHL4vY50CqQPJMSFQq0XLI85WW2nMKYZIXUoucQbN3yLcEsahp8waI6UxWRKX91+NQ
         vZ+1rwLguw65PlS7AFFrT+jFJh+hcIPS9EqLRdtPz+gEv0Jb1D1LoM29rSV8wocH/HpT
         FDNDR5wkLKVKm8VCSPH5ilzAC8tGbz6neYA3gzx9GbNHggYlWx5ZYp0FQAj2RnJhWBjq
         9Jdg==
X-Forwarded-Encrypted: i=1; AHgh+RqdaWRaG7hstENXolq+FHmnJ+oTrb6ujrDHLbBYmjPMBHXotxLM2EyXoQ4K0iSTI/jr2L6bvAgnwz2PB7qPdO3G@lists.infradead.org
X-Gm-Message-State: AOJu0YzAH8HiHVbUvKjG6JzVdma03wscRZnhRkL4wmcbjzomLbybTk6d
	4JmX0VV5e5uhj8z+3QhddWNBO7YE3ajTGfrpb9vaqShKmvS181sOa8coaHsfXqheYhg=
X-Gm-Gg: AfdE7clxmjPugXpR/3XIMAlU0eMKz0W+PT1pmXB3/BiAKURUEquvqXA7ca0RdjeOMOp
	jWukDTIq91zQwga9/X8jBtkZmlPzr7bvP+U0dgA5IJBd6bJS3OYxKREkm47oS+iIfk75ERMajH+
	bx4N55G908lcaeFqJDwcPB3uD8ZddPgrBOCS1Y4yuKvsUf3Bx6cm+igGUM6ZBMhW7DReL+5JkZN
	J19RanCMuSUyTYGPUou4Nh4yJAsI1xfCsdJFQNyDUDBpr3yBmtcFYcxhJYiAa7GZ6nR3/Kok45u
	/x+Rgt2niMB2Q9SSGjZXTV0wVx4zQ8USdvuXpBaMrht/SvbdPPT6+BdSjqBXG9DkIm8xRU2DDd4
	Mno/teyjsNwopw7xItL3+3JRlgBIWSNJCONRqXJkwTOr7yWQzdLjiIpRlboMbKAme0koha2e0dj
	AulkQAED8Wt/5hwUu63z7Gx/rVgrvpbrYIWwhx6ixyFA+nihFHaBIGbVCZT+ssRMxGELMCnmBVf
	pHCrAm5jyW9N0fSEWpMef64AS0d21xx9uvXMe6aw1kwaOjvvtxdp3T0g18oQo6GdfRD8RCZLN5i
	3LYyW5VJbg==
X-Received: by 2002:a05:6830:82be:b0:7e6:cec2:a4a5 with SMTP id 46e09a7af769-7ec59d2077bmr1767328a34.20.1784132708902;
        Wed, 15 Jul 2026 09:25:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf77ba4sm17606398a34.9.2026.07.15.09.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:25:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: add H616 MBUS DMA support
Date: Wed, 15 Jul 2026 10:24:40 -0600
Message-ID: <20260715162444.789303-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_092510_176857_96657046 
X-CRM114-Status: GOOD (  27.31  )
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

The H616 NAND controller uses a descriptor-based internal MBUS DMA
engine instead of the direct address and count registers used by the
A23/A33 controller. Since the driver does not support these descriptors,
it currently attempts to request an external rxtx DMA channel and falls
back to PIO when none is provided.

Add a single-descriptor backend to the existing ECC page DMA paths.
Allocate the descriptor coherently, constrain data mappings to the
controller's 32-bit address range, program the H6-style data block mask,
and request an interrupt for both command and DMA completion. Keep the
existing external DMA and legacy MBUS DMA paths unchanged, and fall back
to PIO if the descriptor cannot be allocated.

Hardware testing on an H616 board with 2 KiB-page SLC NAND
confirmed that the descriptor path improves sustained read throughput.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 110 ++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..8a136b9fa7cc 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -79,6 +79,10 @@
 #define NFC_REG_H6_MDMA_BUF_ADDR 0x0210
 #define NFC_REG_H6_MDMA_CNT	0x0214
 
+#define NFC_MDMA_DESC_LAST	BIT(2)
+#define NFC_MDMA_DESC_FIRST	BIT(3)
+#define NFC_MDMA_DESC_SIZE_MASK	GENMASK(15, 0)
+
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
@@ -267,12 +271,19 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+struct sunxi_nfc_mdma_desc {
+	__le32 config;
+	__le32 size;
+	__le32 buf;
+	__le32 next;
+};
+
 /*
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
  *
- * @has_mdma:		Use mbus dma mode, otherwise general dma
- *			through MBUS on A23/A33 needs extra configuration.
+ * @has_mdma:		Use A23/A33-style MBUS DMA registers
+ * @has_mdma_desc:	MBUS DMA uses H6-style descriptors
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
@@ -304,6 +315,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
+	bool has_mdma_desc;
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
@@ -346,6 +358,8 @@ struct sunxi_nfc_caps {
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
  * @dmac: the DMA channel attached to the NAND controller
+ * @mdma_desc: H6-style MBUS DMA descriptor
+ * @mdma_desc_dma: DMA address of @mdma_desc
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -362,6 +376,8 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	struct sunxi_nfc_mdma_desc *mdma_desc;
+	dma_addr_t mdma_desc_dma;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -370,6 +386,11 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static bool sunxi_nfc_uses_mdma(const struct sunxi_nfc *nfc)
+{
+	return nfc->caps->has_mdma || nfc->mdma_desc;
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -466,7 +487,9 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 {
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
+	dma_addr_t buf_dma;
 	dma_cookie_t dmat;
+	int len = chunksize * nchunks;
 	int ret;
 
 	if (ddir == DMA_FROM_DEVICE)
@@ -474,12 +497,21 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 	else
 		tdir = DMA_MEM_TO_DEV;
 
-	sg_init_one(sg, buf, nchunks * chunksize);
+	sg_init_one(sg, buf, len);
 	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
 	if (!ret)
 		return -ENOMEM;
 
-	if (!nfc->caps->has_mdma) {
+	buf_dma = sg_dma_address(sg);
+
+	if (nfc->mdma_desc &&
+	    (len > NFC_MDMA_DESC_SIZE_MASK || !IS_ALIGNED(len, 8) ||
+	     !IS_ALIGNED(buf_dma, 4) || upper_32_bits(buf_dma))) {
+		ret = -EINVAL;
+		goto err_unmap_buf;
+	}
+
+	if (!sunxi_nfc_uses_mdma(nfc)) {
 		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
 		if (!dmad) {
 			ret = -EINVAL;
@@ -489,14 +521,30 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 
 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
-	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
+	writel(nfc->mdma_desc ? GENMASK(nchunks - 1, 0) : nchunks,
+	       nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
 
-	if (nfc->caps->has_mdma) {
+	if (sunxi_nfc_uses_mdma(nfc))
 		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
 		       nfc->regs + NFC_REG_CTL);
-		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
-		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
+
+	if (nfc->mdma_desc) {
+		struct sunxi_nfc_mdma_desc *desc = nfc->mdma_desc;
+
+		desc->config = cpu_to_le32(NFC_MDMA_DESC_FIRST |
+					   NFC_MDMA_DESC_LAST);
+		desc->size = cpu_to_le32(len);
+		desc->buf = cpu_to_le32(lower_32_bits(buf_dma));
+		desc->next = cpu_to_le32(lower_32_bits(nfc->mdma_desc_dma));
+
+		writel(BIT(0), nfc->regs + NFC_REG_H6_MDMA_STA);
+		dma_wmb();
+		writel(lower_32_bits(nfc->mdma_desc_dma),
+		       nfc->regs + NFC_REG_H6_MDMA_DLBA_REG);
+	} else if (nfc->caps->has_mdma) {
+		writel(len, nfc->regs + NFC_REG_MDMA_CNT);
+		writel(buf_dma, nfc->regs + NFC_REG_MDMA_ADDR);
 	} else {
 		dmat = dmaengine_submit(dmad);
 
@@ -525,6 +573,14 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 	       nfc->regs + NFC_REG_CTL);
 }
 
+static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+{
+	if (nfc->mdma_desc)
+		sunxi_nfc_rst(nfc);
+	else if (!nfc->caps->has_mdma)
+		dmaengine_terminate_all(nfc->dmac);
+}
+
 static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
@@ -1202,7 +1258,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (sunxi_nfc_uses_mdma(nfc))
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1211,8 +1267,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1613,7 +1669,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (sunxi_nfc_uses_mdma(nfc))
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1623,8 +1679,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -2073,11 +2129,13 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->caps->has_mdma) {
+	if (nfc->dmac || sunxi_nfc_uses_mdma(nfc)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
 		nand->options |= NAND_USES_DMA;
+		if (nfc->mdma_desc)
+			nand->buf_align = 4;
 	} else {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
@@ -2426,6 +2484,27 @@ static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
 {
 	int ret;
 
+	if (nfc->caps->has_mdma_desc) {
+		ret = dma_set_mask_and_coherent(nfc->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_warn(nfc->dev,
+				 "failed to set MBUS DMA mask, using PIO: %d\n",
+				 ret);
+			return 0;
+		}
+
+		nfc->mdma_desc =
+			dmam_alloc_coherent(nfc->dev, sizeof(*nfc->mdma_desc),
+					    &nfc->mdma_desc_dma, GFP_KERNEL);
+		if (!nfc->mdma_desc) {
+			dev_warn(nfc->dev,
+				 "failed to allocate MBUS DMA descriptor, using PIO\n");
+			return 0;
+		}
+
+		return 0;
+	}
+
 	if (nfc->caps->has_mdma)
 		return 0;
 
@@ -2620,6 +2699,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
+	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
-- 
2.53.0


