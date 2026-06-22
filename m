Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D886CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v94lnRVnvoTJ1Pc8aoKqSqEARqq8CGmwJLQaxJ+xYl4=; b=r8dGBbFjaRvMVhLZVcEeX/v+3O
	EhcR72si5vNTAU1AppBPON0hj+1vy/zVeRcbCSHUxVU8aiXXi2jn1iiyTJokBnugWAaD6GA8P/1C0
	tncQt4uMXgkWYamMTQYMSU6ce7jlzV1CqtXhHFDENaaZ5tkAm60Fub3REhNwsxTHdSkXZwUuOCpPh
	XHh/A1KcoHy2oAAVFmJ9KpV80iAW2RgFzeWOGyDHdm7ve8sGYf5dHyOR8hLKwLdYl4JhtiL3PPaiy
	eqOAIqNDg+MZ+ZrCJisG860pp/gCdblX16S+/8SFaRsNOyZdyRIJkntqZJDBzzeli4HhOt80DKAgZ
	Y6zIsAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcc-00000004H5u-2QVu;
	Mon, 22 Jun 2026 01:38:46 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcY-00000004H3a-0BdJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:38:43 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51a019e9ea9so22618101cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092321; x=1782697121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v94lnRVnvoTJ1Pc8aoKqSqEARqq8CGmwJLQaxJ+xYl4=;
        b=CLADW74XFruuRr9cn/wY45a95cyUmOpqvxMz6eauVPQIDUiOKYPBtDKOQBSft71vVS
         vCUzVFS1aT9gjm5+ZMq8yUQIOlZFSm9bt+NOelljT9F4mcQWz1MyO6VQgYdtokv+PhUe
         yxHYbcG75epG9boiTGQJ5XkK9Nmy9qhQqHjOuvVU6tUALR1jilRPL4MVRV8O9Ll7+p8F
         FvIB08LaSOHT9rM8eQ0JAaij0ByeKtuy3o9lXRRq9PnLN6998L4zD3gWuk7fFcErB1Bq
         YThXou2mZbXAzI1q3epEnynSPOqJFeJ1eP6ICbevQ5c0t71h28mcHhMxZusuyqRxd3nq
         SwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092321; x=1782697121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v94lnRVnvoTJ1Pc8aoKqSqEARqq8CGmwJLQaxJ+xYl4=;
        b=Ukz5zurDGWgntLRP6lQVl5L0k9qrck+7HrBaS7RLj1RULwz3Qw6Kj0DH4LIG0BI+SG
         Fk1FxnJJZcL/9x7EOvFwYl23A0nSdLyKE7YTCC1r09zUSTnikwWDzldlbVXv+vOYmbFu
         kmrEOsfgCTAhtbcLmOAQOfdp0tBIXknrVvWcG99+KBKzV7cTBAINDy0QLLNZVpEXieUz
         FAgvHjMqF1NM9x0jtMJFEynbJDAdd/BBwSKF0mj4pxrH5nmrCHYHexmp5kzntqxdwBkM
         gtH6iw9splqKYfSJesmY6OahjWUWXQzOm+JVct5d3ePX+y+Z4JLnn7dWQhORHcBMBu2W
         pOUA==
X-Forwarded-Encrypted: i=1; AFNElJ/qs35zz+hP4lHrtHdQDuEHLCkMGwFrql06v8n/akYutWUHL81VdxyikRR0iRR/DLQ+A6i+JYTxHQd747tPO5ZZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzfefOWs/J4drguw6rG0EJ3xgOD67JvmiTE3q4ZLBWP/nugP1dR
	Ntyq2TqAYgeD7Xosivr6hQPcMsRw7wg/OE2qJIU8X+mDjGNSCjJnjBsI
X-Gm-Gg: AfdE7cndHGdijrzRwE4n8k8AIabZ4Ftxv96FvO5HeYdcARfBCu+/Y/wpE2QNo+Z83no
	FR1wvZoqT8Vf3qd7gtG7t5b6efgzTRvQTElyCZkx5r+Ue/CN+6qJTKWqKuPY3rmvlhOf8mG344O
	0PSWMaVPIV4j5B1orYeJu1ZDTdpS1j86kWPojnPgGBkO/UzivDF1sqLPfHjXunTtZ0Uh4UbukkK
	RUrGjv7DM6K2UX5cBLNBfVMKiZkgP3EgJ6XlaqYPtgqpemtTBPk+oYnbnBdA296cUkM/Uj8y9xL
	BpbYD/y1D4Cmpo7Xd49R0/RpL9bg2DPlaDrF0hjCbROeG6teRGrey89tQ40xzvx2aJQiutODr4r
	dPkFx+Tc8VSqgFEw3TrCX1d3txmxWqcjXNYLRHp+QhY8XE9TuiYvcCSoujSP4R/CQ6Jd2SvuYaF
	s2CpQJ2OeHOWz6Jw==
X-Received: by 2002:a05:622a:410e:b0:516:e39a:8540 with SMTP id d75a77b69052e-51a06af48a7mr138785651cf.48.1782092320980;
        Sun, 21 Jun 2026 18:38:40 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:40 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:25 +0000
Subject: [PATCH v3 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-3-f697ef296cbc@gmail.com>
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
X-CRM114-CacheID: sfid-20260621_183842_134784_EA1F2DC7 
X-CRM114-Status: GOOD (  17.97  )
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

The previous implementation of `sun6i-dma` had some implicit assumptions
about the number of channels per interrupt register. Specifically,
functions like `sun6i_kill_tasklet` were hardcoded to only disable
interrupts for IRQ 0 and 1. `DMA_MAX_CHANNELS` is also not in used in
the past, and the old SoCs never has more than 16 channels.

The A733 has a different interrupt structure where the number of
channels per register may differ. This patch introduces
`num_channels_per_reg` to the `sun6i_dma_config`, similar to BSP, to
make the interrupt handling logic hardware-agnostic. It also sets
`DMA_MAX_CHANNELS` to 16 to align with the new BSP code and ensure loops
over interrupts are correctly bounded.

Changes:
- Change `DMA_MAX_CHANNELS` definition to 16.
- Added `num_channels_per_reg` to `struct sun6i_dma_config`.
- Replaced hardcoded IRQ register calculations with values from
  `sdev->cfg->num_channels_per_reg`.
- Updated `sun6i_kill_tasklet` to loop through all possible interrupt
  registers based on `DMA_MAX_CHANNELS` and the configuration.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9984b9033cbb..196a0d73b221 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -41,7 +41,7 @@
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
-#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
+#define DMA_MAX_CHANNELS	16
 
 /*
  * sun8i specific registers
@@ -151,6 +151,7 @@ struct sun6i_dma_config {
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
 	bool has_mbus_clk;
+	u32 num_channels_per_reg;
 };
 
 /*
@@ -482,8 +483,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -575,7 +576,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -585,7 +586,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sdev->cfg->write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1116,9 +1117,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
 
 static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 {
+	int i;
+
 	/* Disable all interrupts from DMA */
-	writel(0, sdev->base + DMA_IRQ_EN(0));
-	writel(0, sdev->base + DMA_IRQ_EN(1));
+	for (i = 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i++)
+		sdev->cfg->write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
 	atomic_inc(&sdev->tasklet_shutdown);
@@ -1181,6 +1184,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1206,6 +1210,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1226,6 +1231,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1255,6 +1261,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1278,6 +1285,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1301,6 +1309,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
@@ -1325,6 +1334,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
@@ -1351,6 +1361,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 

-- 
2.54.0


