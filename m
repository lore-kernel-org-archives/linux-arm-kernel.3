Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E6CC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RAoTdggxobD2oaFa5ZIipVOPvbxRenYgCW3U/I11VY=; b=UwqXmS8kjbaEoxfGwjmAd8R4ln
	K6ncz+rwT0WO9fXgSD/s4Xu76wqZ1txGYHoKyg08pbmxknTVinoGN1yHeupmBziQ2YK3xFKQw9wRe
	393ibNCIeBu/p3QLLaDzcIAG7fibvStoe+gQT1G+KQoC2SlsIWK5bNOG6khjXL71gWiRHmyd0BbAh
	qeNFhcO/9aVVVmdmYh2v44jM6/dmXEdOjMfm7xHdPYklVH5Gkg31jYW4hP1mNnk7WXJJT/aDUPNBF
	FzyMn1nCORgPlWPWHnyPHrCVBhQxtIyHQiq9lHGV02F6DFS+aWXrHG7bracwjMI0FpBM7gSHufipl
	Ur0g1rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3Zi-00000001o7f-1NA4;
	Wed, 26 Aug 2026 02:41:14 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3ZE-00000001o16-1LBI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 02:40:46 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-836d2861a39so7342487b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 19:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712043; x=1788316843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RAoTdggxobD2oaFa5ZIipVOPvbxRenYgCW3U/I11VY=;
        b=EWNDrelI9AZ04YRVpLc8gFftwM1CyRyBDU6Z4cWOVZRQ34FDmX9y+4k9TV5Spfm+0j
         YKA0+IWDeF7kLWmy95X8+g7zDpg+4TLb6gcD8y57rTNzfw0yIe4jn32LhQqu0W8P27Lj
         ih5Fir6yHkTw76gGyxEmnwnAb55WnnaEfapjDqeSODrz93+DaGUUWHAK1bA3GMuH6NQr
         Wqehk0TMrH21xIlMxIDg8b5DfboZ/EbRn2wF/o6MhuXqcAn9Rd08cWg3ZSRypThA33me
         1c74KMomVUGO3pNAMRnm0TjCI0six2/nDq9Ck4qtPQS+RJpP39ciymcuP0NbngcbLrvy
         IGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712043; x=1788316843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RAoTdggxobD2oaFa5ZIipVOPvbxRenYgCW3U/I11VY=;
        b=fXTxPKKNBu71qNO2m3wg+7041ZhiIf2ZPkHg1ZVllqlFH2VrNbKUnd7g+fU5ZIpAi7
         DeqfG1aeL5JRVJY3jKMOm3/rc6DIG+/KPCqEtvgTLn5pXkGMthEor2FrKM5ePFFaPj7U
         mh3IfVtWwGBWnj3S5jcWHwhxRu+TGML4uBdud1w16D+QuUK1XTbT0c30Dlw6Qf/x3Xbl
         iNOHqH3mSLldrLArxPHk+y8mrvYUU+8O4ZvPxrRpBXBDljn+3J+h26mQlg2bm8Kbb/M7
         V3GArkJSEWr7o37h30dfqVIIFu5jd4RshPjlE/E32OtBAB9Ru5XDeuhHmU/Zz5zd69Xx
         NxsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQpVGLv+NbU3qF3PDUnJbUNrcxRamB93Dli37JtPFyBHWqe5YVTSUqPg1Q2RipJaBbAeZlt+vL8fDAr6UHFnvW@lists.infradead.org
X-Gm-Message-State: AFuF++mqoJD+PLoRH9/fmrZ/Tp6CAGEGBEvuOVB9gNK/fkFIGV6Yjp8W
	Wdjrr9T2vJPDfuCjOtVHbEV9CGSImku6woHjDc24+OA+1VwpOfpaRwDn
X-Gm-Gg: AR+sD13kicGxQOhLrYvF98JTw9R+8t3cEKEowQqPcgJdRHVIN5pnAitIY/g0HqTDKZC
	rAebm0rX7Q+yEiRTovRptVGAfxcuPC1qdvtzoPIZN0ikDAIIpo6psgp4adJNJtWfFkRCjBS8GpY
	uEayCr8dz7wBqIXqEcOv2b/S5yQb7oTXQV4fgdBlo2QXhL4qIBIspDkwbyQ5z/gAEqS2wdefnm2
	6tz8qu7QvdY+7yn2XYukUuvwZjAqN6JFxUIIulvhElAFcr06IIDrNYPQRUVFI2Bkt88EtL1fH6U
	zNIUETD826CVraOc8bNyFV23fmIaAIbPlplBpvxOfZ1E0UCLWHDM0LHynFwhrcFM96GiPzshTzo
	//qMbztq/fZKWYazZk1anca1DRaEvhzn5TdPNwoJWcvc/82uV8R+j2ygkfkfncwZv+8H2QdUTxK
	hUkZ/UfhFlAqRBUVr+mKeqjAzGEYtcrWpJUULmXOOwWHkNsfAbCAwRxSSl/5zf8g==
X-Received: by 2002:a05:690c:6311:b0:816:b469:cd12 with SMTP id 00721157ae682-8573cad05f0mr16824987b3.8.1787712043065;
        Tue, 25 Aug 2026 19:40:43 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:42 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:29 +0000
Subject: [PATCH v5 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-3-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_194044_398698_F3EAC795 
X-CRM114-Status: GOOD (  16.50  )
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

The `sun6i-dma` driver previously assumed a fixed number of channels
per interrupt register. For example, `sun6i_kill_tasklet` was hardcoded
to disable interrupts only for registers 0 and 1. `DMA_MAX_CHANNELS` was
also not in used previously, and the old SoCs never has more than 16
channels.

The A733 has a different interrupt structure where the number of
channels per register may differ. Add `num_channels_per_reg` to `struct
sun6i_dma_config` to make the interrupt handling logic handware-agnostic
Update `sun6i_dma_interrupt`, `sun6i_dma_start_desc`, and
`sun6i_kill_tasklet` to use this value.

Additionally, set `DMA_MAX_CHANNELS` to 16 to ensure loops over
interrupts are correctly bounded, aligning with the hardware
specifications.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 1ffd870d9594..ffb63212bea7 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -32,14 +32,13 @@
 #define DMA_IRQ_PKG			BIT(1)
 #define DMA_IRQ_QUEUE			BIT(2)
 
-#define DMA_IRQ_CHAN_NR			8
 #define DMA_IRQ_CHAN_WIDTH		4
 
 
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
-#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
+#define DMA_MAX_CHANNELS	16
 
 /*
  * sun8i specific registers
@@ -58,6 +57,8 @@
 #define DMA_IRQ_EN_OFFSET_A31		0x00
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
 
+#define DMA_IRQ_CHAN_NR_A31		8
+
 /*
  * Channels specific registers
  */
@@ -154,6 +155,7 @@ struct sun6i_dma_config {
 	u32 irq_stride;
 	u32 irq_en_offset;
 	u32 irq_stat_offset;
+	u32 num_channels_per_reg;
 };
 
 /*
@@ -268,7 +270,7 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 {
 	int i;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, sdev->cfg->num_channels_per_reg); i++) {
 		dev_dbg(sdev->slave.dev, "Common register:\n"
 			"chan num %d\n"
 			"\tmask(%04x): 0x%08x\n"
@@ -489,8 +491,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -582,7 +584,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -592,7 +594,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1110,7 +1112,7 @@ static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 	int i;
 
 	/* Disable all interrupts from DMA */
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i++)
 		sun6i_write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
@@ -1138,7 +1140,8 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 #define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
 	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
 	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
-	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,	\
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A31,
 
 /*
  * For A31:

-- 
2.55.0


