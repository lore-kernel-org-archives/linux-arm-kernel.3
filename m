Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B886BCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q55XUG3Ko0ecxcUOCYiIDN/X4N3ed40r7B6RThXSSPU=; b=O1dIB5J8sR5IBEWkwgx/xkgV5l
	PCQaup3XFEW3mop54kbzwIQ2dy0cCEghEUiiWa+q+0kFZwf2zAQeYE22U1FoGzPLKZ21yjr1Wkxu3
	E0GVm0uVvc+ZoxiAKxsUCSMib2P2YUDndrL1ueN4s1165GgK9XJtN+NOSiel1M2Qyy93aWxzmIdem
	Ne+FwZ1h0qP+pYNoRCNxbKpEljsbNMdJuCmGQ5wnc8Ndly49KeY54zp4oBCSDPXulwGOWMCIbvliA
	tMhj6HR0piXYToxADbqFcPCQ1ZWBzTLUXx5AOoeJ3XX2MwOGee1Bc8qA2EjRXoFM0zgi1bqcNyNwx
	d8CrZaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFT-00000001z5G-3pUe;
	Fri, 19 Jun 2026 04:54:35 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFR-00000001z3V-2nRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:54:34 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-9157b949fc7so188962685a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844872; x=1782449672; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q55XUG3Ko0ecxcUOCYiIDN/X4N3ed40r7B6RThXSSPU=;
        b=hg0Y/1cDj3eb3WAn1ik3EJKFy84i09dLoztt1dKigoy+O+wgJV0ulzTjIV2DM5gbrV
         zuInQMixGa/p5ThfNgYXTvdc54nhWsEcFq/EGI8S2BjDI94AHbFJkKpo1H84tMiRK8NO
         LyV538z2T4zFCEWU+LuxpeIzI/6cs0VyfF7N7BnjOf4Fvm864gUJTRtX1gW0lSGxz2hG
         yV8s6fdPIYO+e5hevYr8IubGcwKPoFI7M5U+VXRxZP7PUgAycRHZadRmXVgEckIT54dz
         WCIm8DXmrzq64hjssyDBkL1VqZCMN4yoaPk0Nkvk1UPdu2GbBMqrB3Khbvqru/WJZYor
         hR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844872; x=1782449672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q55XUG3Ko0ecxcUOCYiIDN/X4N3ed40r7B6RThXSSPU=;
        b=d4JIqU82HJWeajJP0JnmZVfuPu8AgB+aAgfRIG3jCGDIHaWT1yUluk9kQwbqKs5Hfn
         VLYTQkVL3GAJ1Xo78xefJrltszO1+Y9WgGmOrK/uwTTPRg3+ry9He3pGpp7cnTkas7M5
         UnEUbfUzH+UaK5fXiNH09KXdCpoFpVTR33h5knx0C06/qmAmy4jQDaf7f1oyFRy3bjjZ
         NJoPsa/zGDZo/zFGCCaV3qsX6LtOcA/LQ/EsiRWa/2MHU+eI2Pey2w4DI8KfRY2RD9wz
         DIWFJsXyDpOSkEQRqGyc50OzOF+6BXiQuhzJ0xE5dJlzuzaJUa/Df2iAYL0JsISfxaBI
         OOzg==
X-Forwarded-Encrypted: i=1; AFNElJ9gbui1n3R6KLramqcy9/rBO/1735wrdcr1XYTk5U8bLS1uSMt9eh7gb+GbLHW03NM3ZDZoE9rf/jJXYfGel83s@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm/EdvVf3PFGMR3MWI4PflwOE6sFdzv4XrGAN/kZuHQwYrjN4f
	gyL3rZQKsATXm+lClJLJJW7VutqyR9byiLCAiVKLs3SL+nchNx7RnG9n
X-Gm-Gg: AfdE7cnPwo42Y6JE0uBXvic0PJKPBDjkgC8xD85gxKvSq1k9mIBwQNaWIqqigteIBTm
	u0acAmckNHSZAzyn8yBp50BqWJlpxrD/fRVIodJQ2BIUMQwnII8FbGvzzhNZbNVTVq620yAWNW1
	9Y+2bfmS3u8dwh3vUaxOwnW+m8r9ZBtusXkhMciRbQYX+VO8j4PQmoimpogbvVvmPWi7+m5mL00
	Q3QxQrOR0c/ydRNk8nWnp++ifBauNfS4CJg5HvK+uj4lXp/E3xSnBSn4yyrk2liMEfgoA0IhRln
	xSuQv7NFYE7dXRB+AajoxAYUIMexmLujnChZzxXS+MUGMU2R8gONV8twh3cuTxpwKQzAJIRy5mz
	pW31YMvJD1J1Mwd4lvgA69hqVzjCMpF2BZpzjpTJL4N+U9ClNN5dRoGVaia3efYJei2PW0kwhYB
	avsv7bEt4QDagXUA==
X-Received: by 2002:a05:620a:298c:b0:915:afa5:754 with SMTP id af79cd13be357-9208e982356mr322872985a.2.1781844872251;
        Thu, 18 Jun 2026 21:54:32 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:31 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:32 +0000
Subject: [PATCH 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-3-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_215433_735738_966BCD62 
X-CRM114-Status: GOOD (  19.55  )
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
index 059455425e19..fb1c1a28744b 100644
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
@@ -481,8 +482,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -574,7 +575,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -584,7 +585,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sdev->cfg->write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1108,9 +1109,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
 
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
@@ -1171,6 +1174,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 };
 
 /*
@@ -1200,6 +1204,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1224,6 +1229,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 };
 
 /*
@@ -1257,6 +1263,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 };
 
 /*
@@ -1284,6 +1291,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 };
 
 /*
@@ -1311,6 +1319,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	.has_mbus_clk = true,
 };
 
@@ -1339,6 +1348,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	.has_mbus_clk = true,
 };
 
@@ -1369,6 +1379,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 };
 
 static const struct of_device_id sun6i_dma_match[] = {

-- 
2.54.0


