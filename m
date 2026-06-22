Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0648ACDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHR5kuQsyq6fpq2WOE14eJR4+WEhY8nAl0AowHXE7RE=; b=fSSqbsmgY/M+hbub4HY/+raMm2
	5Gk8S0/wyZ6xFhxwOlKqxDonIO0gWQycTOrnfeIcHUja6yvp+o8ay8iEkEpmAsXlfN/Wz64ISQIRf
	j2WH/M9YF3h6xSGnQcw0Kpe8pRfuTzgKipP6HvscvzHYgL7eDqvt5F0UiG4gf8GiZYkoQWhP6ooKF
	oyeeD1GbhKcyudGB8odLYhTOmB50NgqoiLpnvm/bTbKNzIBBSHrwGThCbSVj/jmNYS5ARXwYYy+OS
	WKGH4OAd14enfzn8KAV5bCasqfOdcDn+jifAmPJ5ieymbl+E45PQtw8yQ3zFkOX3lUIzdN05yRUt0
	qau0XCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcb-00000004H5I-1wHD;
	Mon, 22 Jun 2026 01:38:45 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcW-00000004H3C-3sZa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:38:42 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5176ca6bab1so45601521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092319; x=1782697119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHR5kuQsyq6fpq2WOE14eJR4+WEhY8nAl0AowHXE7RE=;
        b=LPI33lXLfavSNnWdRzTkhOpfqzqSmrXhX7wzB9AqbaUS9XxzHGBX3KIgRrMG7hlshI
         55U529/+5kSazZetX+3yTe8IhLyJeWOMKQcfgAL5EVziKownORZzpSV+OLgvZPq+FA1Y
         BseVlB0icEtPR7Mf9IsWRWlU3z39nSagMZ3/hrS+CeR9kuU+u0D5m4qVem9+NaCAWMwC
         9tXgMhsiKscryMCa8h4bLVj6S8HxgIAya4nvVRFTc2YD7UIZATwx6nJhBj9RyydO4YpS
         /IsqCX5rFyWRRObAtytMmyGIwdBlSsr1a2X76ATn/of5YBNzTEi7LLicRx31MPjQlhCc
         MGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092319; x=1782697119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MHR5kuQsyq6fpq2WOE14eJR4+WEhY8nAl0AowHXE7RE=;
        b=EpVPIb/Ly2awrCRNxvPBMhs+StPc5UwAlxbtRu0Q/zfqhZxsA41g7y3pcAlkHGtEgI
         Mdv3MPfLAqAWh96Kz4ZDOlzxKeDzTOHpi4Sq1pi+nstOp6NM5YeVvwobuI+ieXuUx0Aq
         0i5mcLxWsk5nV5aAHfGewyyNdLZlAkOW00kfD36v0SbCxOfmA4n6+rsjMep0xD3vKby0
         TVOShcFUBWBdR+x6Lr8Cz51WAYYumh+xgu+Uym9l663JtqwibmSZF5zIaSUQr6hqkf2F
         p9oGPJh50/yMHDsd7O7YDrelz/Gr5PwVOR/D5AvGYpPTFBCTfd5GP8TCbs4Q7tm3OpCx
         Zing==
X-Forwarded-Encrypted: i=1; AFNElJ99JUVs3s+KlhzU4uUBjk6Ya2rXzgl5YY2MrAJFW6aXfFT4KWBA59RVM40Tq/9B7f+0oeiSPeGttOSq1ht0wZES@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ4MXE/0imJsOHMlOwhvvsL0BN251Nk6ITczUTq5YLbIk8HrwB
	6IQ9A+YDy0SpyhMTKG2it2u5VFJYsuidqXZjfD98a7wgfLPtv1l4OgJO
X-Gm-Gg: AfdE7cluuqwn/0r3eX8ozVpFLfRj2rTJ2Uh/WZrDVyU0P2qXOS7J3/vrIdmAxP7VLCN
	MnmErmnYRqyYkn5ufQoqVlGF1Y8UaITpv807zljZN8QtZKfktxbRnIgVKMv8D30bgW44vuG+HbR
	1rFD0xuB1SvxdLrEwf5FNeaIXIX1XVH/Zy8ADT/VDx8Lx0wG1ovrFNdMAKaabObTz89Wigw4Jaq
	r1qpbGO4V7+BYWR7tgZsfzolosgWUZ7QyjfWOvc1TaYLRTDzrseK7TFKW/5HfdpJ2hPAuUAsdTg
	iCMv+76ULUDbVz6DbYRu29aAPNhsuvpMQ1hSYIASW7jVaGvq0VKIxHDXsEyyANurtbia0rlzsai
	HXaJSoQBArQPGNsau2x8j/9ZliUmOP8A1YlDqJMA068F3V3za1WC06uiSNiibklCnCTdkoUNGs/
	9oa24o+2+fiN+CmQ==
X-Received: by 2002:a05:622a:420b:b0:519:defb:2442 with SMTP id d75a77b69052e-519e67b8c0dmr151787251cf.17.1782092319544;
        Sun, 21 Jun 2026 18:38:39 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:39 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:24 +0000
Subject: [PATCH v3 2/5] dmaengine: sun6i-dma: Add set_addr function pointer
 for variable address widths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-2-f697ef296cbc@gmail.com>
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
X-CRM114-CacheID: sfid-20260621_183841_012344_AFCD6680 
X-CRM114-Status: GOOD (  15.06  )
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
  `sun6i_dma_set_addr_a31/a100` (keeping the logic for previous
  generations).
- Updated all existing configuration structs to include the new
  `set_addr` pointer.
- Removed `has_high_addr` since the logic is replaced by
  `sun6i_dma_set_addr_a100`.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ef3052c4ab36..9984b9033cbb 100644
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
 	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg);
 	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val);
@@ -147,7 +150,6 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
 	bool has_mbus_clk;
 };
 
@@ -673,16 +675,30 @@ static int set_config(struct sun6i_dma_dev *sdev,
 	return 0;
 }
 
-static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
+static void sun6i_dma_set_addr_a31(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+}
+
+static void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
 {
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
+				DST_HIGH_ADDR(upper_32_bits(dst));
+}
+
+static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	sdev->cfg->set_addr(sdev, v_lli, src, dst);
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -1156,6 +1172,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1180,6 +1197,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1199,6 +1217,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1225,6 +1244,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1247,6 +1267,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1269,6 +1290,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a100,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1279,7 +1301,6 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
@@ -1293,6 +1314,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1320,6 +1342,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |

-- 
2.54.0


