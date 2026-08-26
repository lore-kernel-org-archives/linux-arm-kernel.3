Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C6C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37syxcZjr+SQHdWr5tam1HRyww9ToksagoIyI3QIPxo=; b=f4XH4XUOWJad0Tyy0tSkVAwFSO
	fYHdUM8ICNQICLA3xlS/8eRGYTQncTLrj0kSTJB0yhPvw7TemX5XPUYUaNhNxFoJN06PLHwjGboJA
	8N7lvlH4pyysVo/vX/8TiQrYHQV3peAY99t4FWre/rgBARjEZ9VjPD8MCJwOdQrHClgD3sCD+YjRy
	tFeRdTF5lO8vb3+nJ633sloDe9iHiTc9hFLgDEtMMkZoXrep59dvubT4bsiJaXzQ+J2Q66Ikwwuqy
	iePqqepzBi4OMMnMGQBNHlmNuniKDBS0YDR9PTyUbx3PPN0i5YqI/BoeOXsWhMJKm6jl8mtJNFb23
	roBp8wEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TF-00000001l16-43sn;
	Wed, 26 Aug 2026 01:30:29 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TB-00000001kzo-492x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 01:30:27 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-90c776f6c13so4367576d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707824; x=1788312624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37syxcZjr+SQHdWr5tam1HRyww9ToksagoIyI3QIPxo=;
        b=RqbBpdomcgJx1yYGoeNTmfogjOijXH0pG6ZcRw9JeRlV+E7LzUPvgMLtfpn2Cm8xYn
         4x9B88jtq3yCciqLlgpqY2axbv/gYSFRuJuKLpd+rF3FOGAwe47t/BhhtujHDYb97VV7
         SnwUFzog5TiiXh+4I3aTeVdPhUs9l/pQysXs1BqhJlUTBK0UnFW1Zrg29AE4WXlS18PC
         an2l6phib8YLQg2Xs33tqjIYnaU8azUZVH/0melxCHvBXCJKQO2bsCvRtn/euRlc5dbR
         Lu4xOTFk5Aaz725lsLnH3re4kNyhh6+Sg4JQKKmSLc84MKcJura9IsU55sWAWpspzpmS
         dtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707824; x=1788312624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37syxcZjr+SQHdWr5tam1HRyww9ToksagoIyI3QIPxo=;
        b=ftXZFRDe3PwuR56CKVP9Hz3cbhiT/r10nd5VtYLFuC8NgE+pfxgKwxTvOiyWTmfoiU
         78lV3rqFL5xG+vKUxF4Sk0uG//0AyFh/7IYAnVPH6JpR8pI+3kpAov/jxqpuGKzazZL7
         JabLcEp5ji1aD1MrofKXX+xNVukSHw9tDRnEDuGe1d8mZrJ8IFirSs+PxxJVIN55P2TE
         frOfrAJyLZkP+IiJqo9tgkO4Gwb3HLD2IuchS0uie7V0LD8jHD5GpzmmcnBHKmioRUnv
         +tmOBU/O3/d/P5/pNvboUgbRr2q/48MoK6pGOB2D26qqBXmfwDRSYKHcKHocx4AY47oH
         MLBg==
X-Forwarded-Encrypted: i=1; AHgh+RrVYCvKux854QpP3chFkwvFNnZcjrH+YdZHd9V7jWj5jUK7GVRc4GD6aAOf3zsU0uyU1Uht+NQr/TJbsrVGxeeq@lists.infradead.org
X-Gm-Message-State: AFuF++mxwRtNPT8kAA46kxOJtHoZ+8BRFiaH/QarMAnwH3vbxM3Vw+WO
	rGIcdrZ/ygploUjTndv0kZZt0cRJ9zMwyyKWvG1yi6nZnbpMTFSasgfx
X-Gm-Gg: AR+sD12EL7wR7Cpg2bR8D/S1qdIxF+/3T6G9Q0uV41JdBQVED1JrC1paY1vPhq6La0b
	vZJ9IoyM+xYslAwOH1t5J+hdeC4DrP2xzlETvEBId3W8VTOQgugE/hqDSVG6jQXL1NweTZHgZ8L
	kvE61uf9Jgqo8UlFDg6yfOiWSzK8MxZZu1xd1Kxp+y5zmaWCj54ojX+V2pKfZTxaj+VCyscH4yo
	JCHfZ9kgW54f5ZtscIMnjSknY8KRtr+2TQzvytZf3xSPJlB0GF/zkG4iem1IwtWEpkwiPzkxcPA
	19s+QscE3fSh8WX50YuLVyZaoI24nG9959BkpsrzJczfX6L9Nvjb9KNH70IU1KGKbKjnWJBh2gQ
	SjiLhVOZXscva/p0KQ5jy/ZtIR0oH/dx0u65ZlkWoCkp+gUIudZWiUZ+41Au2iTgVHQCYL/wwtS
	dYEI1M2h9rENqGzqpiNMm0fIm6Gmw1gNS75ebDGTY/SdU9gUjn80cLy6+b2LbgrA==
X-Received: by 2002:a05:620a:29cd:b0:934:b6ba:15d5 with SMTP id af79cd13be357-937805d1212mr268405485a.39.1787707824243;
        Tue, 25 Aug 2026 18:30:24 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:23 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:03 +0000
Subject: [PATCH v4 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-1-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_183026_063709_B7E8569E 
X-CRM114-Status: GOOD (  19.14  )
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

The `sun6i-dma` driver currently uses hardcoded logic for interrupt
handling (reading/writing interrupt enable and status registers) and
register dumping.

To support the Allwinner A733, which has a different register layout and
interrupt handling logic, add `irq_stride`, `irq_en_offset`, and
`irq_stat_offset` to `struct sun6i_dma_config`. Implement generic
`sun6i_read/write_irq_*` functions using these new configuration fields
to accommodate different hardware revisions.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 87 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 67 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..f305fbfb3545 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -27,7 +27,6 @@
 /*
  * Common registers
  */
-#define DMA_IRQ_EN(x)		((x) * 0x04)
 #define DMA_IRQ_HALF			BIT(0)
 #define DMA_IRQ_PKG			BIT(1)
 #define DMA_IRQ_QUEUE			BIT(2)
@@ -36,8 +35,6 @@
 #define DMA_IRQ_CHAN_WIDTH		4
 
 
-#define DMA_IRQ_STAT(x)		((x) * 0x04 + 0x10)
-
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
@@ -52,6 +49,14 @@
 #define SUNXI_H3_SECURE_REG		0x20
 #define SUNXI_H3_DMA_GATE		0x28
 #define SUNXI_H3_DMA_GATE_ENABLE	0x4
+
+/*
+ * Interrupts specific registers
+ */
+#define DMA_IRQ_STRIDE_A31		0x04
+#define DMA_IRQ_EN_OFFSET_A31		0x00
+#define DMA_IRQ_STAT_OFFSET_A31		0x10
+
 /*
  * Channels specific registers
  */
@@ -144,6 +149,9 @@ struct sun6i_dma_config {
 	u32 dst_addr_widths;
 	bool has_high_addr;
 	bool has_mbus_clk;
+	u32 irq_stride;
+	u32 irq_en_offset;
+	u32 irq_stat_offset;
 };
 
 /*
@@ -234,19 +242,43 @@ to_sun6i_desc(struct dma_async_tx_descriptor *tx)
 	return container_of(tx, struct sun6i_desc, vd.tx);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset);
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset);
+}
+
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset);
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset);
+}
+
 static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 {
-	dev_dbg(sdev->slave.dev, "Common register:\n"
-		"\tmask0(%04x): 0x%08x\n"
-		"\tmask1(%04x): 0x%08x\n"
-		"\tpend0(%04x): 0x%08x\n"
-		"\tpend1(%04x): 0x%08x\n"
-		"\tstats(%04x): 0x%08x\n",
-		DMA_IRQ_EN(0), readl(sdev->base + DMA_IRQ_EN(0)),
-		DMA_IRQ_EN(1), readl(sdev->base + DMA_IRQ_EN(1)),
-		DMA_IRQ_STAT(0), readl(sdev->base + DMA_IRQ_STAT(0)),
-		DMA_IRQ_STAT(1), readl(sdev->base + DMA_IRQ_STAT(1)),
-		DMA_STAT, readl(sdev->base + DMA_STAT));
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		dev_dbg(sdev->slave.dev, "Common register:\n"
+			"chan num %d\n"
+			"\tmask(%04x): 0x%08x\n"
+			"\tpend(%04x): 0x%08x\n"
+			"\tstats(%04x): 0x%08x\n",
+			i,
+			i * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset,
+			sun6i_read_irq_en(sdev, i),
+			i * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset,
+			sun6i_read_irq_stat(sdev, i),
+			DMA_STAT, readl(sdev->base + DMA_STAT));
+	}
 }
 
 static inline void sun6i_dma_dump_chan_regs(struct sun6i_dma_dev *sdev,
@@ -460,11 +492,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
-	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
+	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			(irq_offset * DMA_IRQ_CHAN_WIDTH));
 	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
-	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+	sun6i_write_irq_en(sdev, irq_reg, irq_val);
 
 	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
 	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
@@ -549,14 +581,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 status;
 
 	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
-		status = readl(sdev->base + DMA_IRQ_STAT(i));
+		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
 			str_high_low(i), status);
 
-		writel(status, sdev->base + DMA_IRQ_STAT(i));
+		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
 			pchan = sdev->pchans + j;
@@ -1072,9 +1104,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
 
 static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 {
+	int i;
+
 	/* Disable all interrupts from DMA */
-	writel(0, sdev->base + DMA_IRQ_EN(0));
-	writel(0, sdev->base + DMA_IRQ_EN(1));
+	for (i = 0; i < 2; i++)
+		sun6i_write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
 	atomic_inc(&sdev->tasklet_shutdown);
@@ -1098,6 +1132,11 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 	}
 }
 
+#define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
+	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
+	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
+
 /*
  * For A31:
  *
@@ -1129,6 +1168,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1152,6 +1192,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1170,6 +1211,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1197,6 +1239,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1218,6 +1261,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1241,6 +1285,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_high_addr = true,
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1263,6 +1308,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1286,6 +1332,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 static const struct of_device_id sun6i_dma_match[] = {

-- 
2.55.0


