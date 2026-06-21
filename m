Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE550CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 21:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoB3WtpCVismpnSqyX/NJ4l5EF9+u+wVTQ5wN075Edc=; b=2cS/NIDsHRz7DfLJgXWrzHcKWl
	XbVOhH90uiGjVFA5NBgxAZue4ykWPPbV8u/8YqUr5h3Njl+Y8qjgjGJQa2leJYqHhkoPgz98h3Yb4
	ZSYD/2u2UtAJU74B1QWnNtihOpayWv0kRSNIZ8XJ7OmnfJTO6hFaJi7mKwEUN3p7+8zZtXneTftR6
	en0xNv+eVRRDwqB1Fh/5MyLE+ND5FzsBFop/n4q15KHH4DE4pxudJNOGkY9iw+hDvBZ5RFOud2W5v
	YP6Ne7c9GlZe2TNJ7qCXXj/jj/1KWtSuYuvd0mDalrpl9nSVDiqhc7BQWz3QBtUHeER5GmR/LXIMY
	bg0YJMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPv9-00000004AvK-0GKH;
	Sun, 21 Jun 2026 21:41:39 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPv4-00000004ArS-26kq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 21:41:35 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-519f9f13b06so20765781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078093; x=1782682893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoB3WtpCVismpnSqyX/NJ4l5EF9+u+wVTQ5wN075Edc=;
        b=dTpqNfzl1J2ajo3a/SCQmhk2n3oK42af+hdxEwICrhzsLwlf/1pf2SwUc3c6qUcv/S
         FfvBFh4KmAABXboml+je+PYF0JdBT75THV471ezis1fU/7xRaW5fG6pjjSFZDap0Hei3
         +jM3Yv9OBoB0304AkzGm/Sj2scC7tqJBhRXtAdScBN5ahmcSKiqu7DaUxdEDD2pz1BJP
         MmXdpCHtW5rOzWwnrCQKhX0Yv7tJt1eO3uhYYGWu+M5a7KHwNJCJPjugd1Gv7zCbRFQ0
         FhV6mEjsfCUt28ZV9ytE8HGTcb4XKwIAsWyGiftOEm6uhN1hQUEABQJNHL98zmrs9+Wn
         Tehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078093; x=1782682893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WoB3WtpCVismpnSqyX/NJ4l5EF9+u+wVTQ5wN075Edc=;
        b=odyXdGRGxrIsgPAXv5F+gRjp6giqUAd8mgNH7ZETfj+NZt+mWykLY/i2GIKIZyk8Fv
         ijO5aO59dglLE40EEkyG2F/Ur3ysjW/N+Ug+O4gwIVgbJ1SyoDD00vPbW/ZEp9SyoSeF
         NMLkTAERSkdIRSi2L4LklC3ZMqejoCcoKvdY4f28jl9m6EKZsni2xQgdk1OwnIj/06MQ
         5892mXsG6zaKYk05etERDYiBRk5iV+LJh+OCtxP70/8+8UIo//CAtwW52e1yLcCeFOxv
         XynkFcglW26n+9cen0onR4Hfg4suaWoH1X62Vhh75RYrCtGbijFQwS8tv57ryB8RFWw7
         iVnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nWI6HA8rxwvlkgBXTRIq7S24R/JELIN4TUuIPyF6xYZZJVF0MGCnVaOp6NhS0DoGFv8T9SPxd02eANIHFHbL5@lists.infradead.org
X-Gm-Message-State: AOJu0YxoZKQW3HXBDjJJ+YEiyrs1AIEdCD9rgkieYg4/0U3MRJO1/PJG
	hG/o/6j8KB7FZ9w2aiumRgvxe5rKlQoHNFyVUCqK9WYeSjT6ShOqs8rj
X-Gm-Gg: AfdE7cnaWN+g/im4B6vSnc4rKND5pTffdIVDBwi9P/DLPiF2gYZtTGAF9wkYIcCJe/W
	Tx6ZvvSTiF23FeNuz12Xlv2LS7c696Lt4oBpOYbsDnda+NSpFQaYj2N3U7XH9A46StcxV1hIJwK
	gJQEtMjrNcChfl1X/Ws/ExvQMaXuSPXes2UxWpdvWwUGvoAZuD8itVDLy6OeflZFQTFMQUOI+o7
	Bx3OU1J7hCmTG3lQ9slPhGpcvZCCncm4tICz+N+1/6kyuOYLS965CXQfBK8vSafQSNMZPyhvAIH
	V+oTUqQvVdnBGNGrqDsthA7Yqp5dC3Ariyn4fBoQBEJ7FB1a7os8OphbGUbbyZi5i+8HSmIsU9R
	Czrxthn+YAkn5Lcqaii2qr9XWYDCnsoAqrRx6SeY3MVVmrMNVlfFPGtH9OZFRK9RuKLWQIuASkw
	RHPtkQxJJcy6JKbA==
X-Received: by 2002:ac8:5806:0:b0:517:a02f:171e with SMTP id d75a77b69052e-519f04913d6mr162441741cf.30.1782078093134;
        Sun, 21 Jun 2026 14:41:33 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:32 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:56 +0000
Subject: [PATCH v2 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-3-340f205891cc@gmail.com>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
In-Reply-To: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_144134_564079_20B3C78B 
X-CRM114-Status: GOOD (  18.75  )
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


