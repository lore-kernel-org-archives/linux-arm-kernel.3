Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAD7CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu3ld+/x/4fnowny6tKRb6y8649sFddF48H2SIfvkLE=; b=rRSsxP+QYlDK6vCStISjEKEnd/
	4jF1ezPOwBavLUw3uHUJiPjfW34VOo1s1A6Z9QCJ2Tx5ogOHeZG2ACi8usgkR9z5p1cSZTFlXOQLP
	tsumpqLvgT+xfcvihuBBY0LN42Hcu+m2hNYmXh73g3G2F4Vdoxwf0LKxIOSwJxLbWP7VPXRwO70Ag
	lggnw/UxwURYDV2Ig5n1EDPxzc3c0kxa36e28VcokTx76sDuwwuQWy4e1zuYjHmCt9KudGpSl7roU
	fNQfD0cLEGs+r586+Kslj1blzw0HeRotzcB2DfYNi9ntunEcgKciemxHvvCKtlRmX6v0rKJhA3g3/
	87Z8BQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFT-00000001z52-37Az;
	Fri, 19 Jun 2026 04:54:35 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFQ-00000001z38-1epI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:54:33 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-9159951f05aso198110685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844871; x=1782449671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu3ld+/x/4fnowny6tKRb6y8649sFddF48H2SIfvkLE=;
        b=U/+zggWLjU2Ucz5EItSQ5SvRpjroabBDDehUu8EEUqeKRfRd8wRpeAp/UwXLyio881
         expvTcn8uRyZ6/VubJvLaiwiRk9Obk3PezCD7EGswBRAnp2Gl27HnHlZNqlOECPhxVwl
         +AYjJd0k6I2fNDxCiG2AFsleKwttsi2GRAjB1G/S8lYstr14EYL3dX1QZRHciSC/ovcv
         gcfJ4k/cNdkC/T5lwoSuXnDhwziTPruOjatbyYBu1nlNPOZKR72CZyyvnnB5jFwv1ehJ
         34wqp1JMBKP+Ant+/Eak4ISXfk547u3jnqROA8gWry/4RaL3iAW7s8Nb0no3JWqht3t9
         rvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844871; x=1782449671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nu3ld+/x/4fnowny6tKRb6y8649sFddF48H2SIfvkLE=;
        b=nfXncIqsCvDwC86jkLd8seuiAdB1w24kPqlr3c52h98sssUvSc6kh00EoGrxCZ3+Ub
         iGQUEU84AVGaTt3vG+vKrvD1hL2cQQ/l7314d544StB5ZOzrUooL99NVQFvddDzgM+9a
         YegXuFYi2u3Tip8OE/PW2iZ2CKAd0Hu/C7Yu9wkqd511ngK/wakNbLPaeaqbAl9qhYwX
         SL1Elu+snq2rLh9dP6icjZF11Snkb3LOv7KTLF0OzDo9bOkafxPRDrpe5E0bgSXxmPFf
         rcRPKWIMWRKnD8NEIhDNCjuZVD4sgCQjQWTVfNcNg2HWoTzOI2/yn9BlljTuxbVRgsrj
         vgXw==
X-Forwarded-Encrypted: i=1; AFNElJ9hiZYmuha2hsuJQR+s9R2ptPSTxjVcEvbbVLKJutt/HOzaxUSUCdfWDSR8LGk6X06ZQ96xROQSs8ncKGC14UMp@lists.infradead.org
X-Gm-Message-State: AOJu0YyYznMbIwSIft42pV0a/cQiKbSyCh9BcPLyioUvaMA+onNG8UfF
	VY+xWHft3+jEhX/JYO4BDVCuY0Os/Q47cdZh5lxtEyCeOUY2k7EVJJu6
X-Gm-Gg: AfdE7cmfXJsBJ0/Z1Ofew+kImhDx2caeFP+SiLgGQ7yc0Aqof0v/aPLX8/j76eU/oqW
	qf9eAI+EP86mRzEodJo5Zk6di7VIh2CWaX2Qhr9fy5ciWEr88MgpkRG3gbQub+otF8CSgYPOToK
	lTFy6D1l7jpx8nXzLv/BKZb2pUHnBRPdbvq7nRz/5P24SJV+UcRN7MiF53A3/f+g/DPiI5SmJEQ
	xeB0rbq0s/4xFsyf/FhCS5P7+OMH4n1nessnunaSc1AapBteKNYuOj+KBGZ9RbQg7RM85UvjxXf
	XL9YjsChyDh+xbgnUt8QBnAK4U7Vk+rhLxEfjRvzucJMWMkYKQ2fWjBeOQ+cpTraQuYEPTsqGVX
	lrKc7p+DxEA7YsqninRscJml2Q0Jz8s71JSTp3+ZOwW2luWEXew6W5JOltVtidfAEs8KC5aOwfM
	chTXEt8j/lM7elMw==
X-Received: by 2002:a05:620a:4590:b0:915:a6ca:f12a with SMTP id af79cd13be357-920d480da3bmr150184285a.54.1781844870874;
        Thu, 18 Jun 2026 21:54:30 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:30 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:31 +0000
Subject: [PATCH 2/5] dmaengine: sun6i-dma: Add set_addr function pointer
 for variable address widths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-2-da4b649fc72a@gmail.com>
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
X-CRM114-CacheID: sfid-20260618_215432_483996_810954DA 
X-CRM114-Status: GOOD (  16.53  )
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

The A733 DMA controller supports higher address (up to 32G) compared to
previous generations. The existing `sun6i_dma_set_addr` function uses a
hardcoded logic for setting the high-address bits in the LLI parameters.

By moving `set_addr` into the `sun6i_dma_config` structure, we can
provide specialized implementations for different hardware. This allows
the A733 to use a version of `set_addr` that correctly handles its
specific `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` in the `set_addr`
register later in the series.

Changes:
- Added `set_addr` function pointer to `struct sun6i_dma_config`.
- Refactored `sun6i_dma_set_addr` and introduced
  `sun6i_dma_set_addr_a100` (keeping the logic for high address
  support).
- Updated all existing configuration structs to include the new
  `set_addr` pointer.
- Removed `has_high_addr` since the logic is replaced by
  `sun6i_dma_set_addr_a100`.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index d92e702320d9..059455425e19 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -112,6 +112,7 @@
 
 /* forward declaration */
 struct sun6i_dma_dev;
+struct sun6i_dma_lli;
 
 /*
  * Hardware channels / ports representation
@@ -138,6 +139,8 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*set_addr)(struct sun6i_dma_dev *sdev, struct sun6i_dma_lli *v_lli,
+		dma_addr_t src, dma_addr_t dst);
 	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
 	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num);
 	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val);
@@ -147,7 +150,6 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
 	bool has_mbus_clk;
 };
 
@@ -675,13 +677,20 @@ static int set_config(struct sun6i_dma_dev *sdev,
 static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+}
+
+static inline void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
 {
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
+				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -714,7 +723,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 
 	v_lli->len = len;
 	v_lli->para = NORMAL_WAIT;
-	sun6i_dma_set_addr(sdev, v_lli, src, dest);
+	sdev->cfg->set_addr(sdev, v_lli, src, dest);
 
 	burst = convert_burst(8);
 	width = convert_buswidth(DMA_SLAVE_BUSWIDTH_4_BYTES);
@@ -773,7 +782,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		v_lli->para = NORMAL_WAIT;
 
 		if (dir == DMA_MEM_TO_DEV) {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   sg_dma_address(sg),
 					   sconfig->dst_addr);
 			v_lli->cfg = lli_cfg;
@@ -787,7 +796,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 				sg_dma_len(sg), flags);
 
 		} else {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   sconfig->src_addr,
 					   sg_dma_address(sg));
 			v_lli->cfg = lli_cfg;
@@ -858,7 +867,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		v_lli->para = NORMAL_WAIT;
 
 		if (dir == DMA_MEM_TO_DEV) {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   buf_addr + period_len * i,
 					   sconfig->dst_addr);
 			v_lli->cfg = lli_cfg;
@@ -870,7 +879,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 				&sconfig->dst_addr, &buf_addr,
 				buf_len, flags);
 		} else {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   sconfig->src_addr,
 					   buf_addr + period_len * i);
 			v_lli->cfg = lli_cfg;
@@ -1148,6 +1157,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1176,6 +1186,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1199,6 +1210,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1229,6 +1241,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1255,6 +1268,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1281,6 +1295,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a100,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1296,7 +1311,6 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
 	.has_mbus_clk = true,
 };
 
@@ -1309,6 +1323,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1340,6 +1355,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,

-- 
2.54.0


