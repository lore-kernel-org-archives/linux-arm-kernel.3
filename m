Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13754D63933
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6HfXXXOROm/hEy0Xhy+wI7Vf+sXA6HYu9MaXpx4V80=; b=DIhUXRUYdpuucxSKt94ayBfABe
	1UI0eqVCObhEE7WMDjGo4gJwlsx3+hBFvDtSTa+l73QZbD3Xgj9zzG14o/GNMvkBWrbFvFF5G/HJd
	gB7b1RLKlmNYBQaQvG1yLiUPB/hcu6stUeMMHtpbxDDaAqGQq7osJHM21yOnF732fqB2NAFWDs88B
	XpRT9UOsOM+5IBksQJjOOFeytt6aucuxV47t70qn3g2qLY0exlR4z6PI6IUJNWjvaOD+SJZ8cSG0W
	h6YxscOvZC5/4AyphPGMmb8kA97+x9w144ALaU8I5Z4EQ6f85YVm8BLlsAtEW1ipdSAOJX1djmkOz
	aRqBrQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk8F-0000000FKyT-14i0;
	Wed, 20 Nov 2024 12:48:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk4a-0000000FJqa-1stL;
	Wed, 20 Nov 2024 12:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106683;
	bh=4vi1Rl2y2neIuiqvTyTTvdJYAsmgBE/iMkn/e3MbSik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfJzF4QaPN86rvEaFO7uCyBnqtyMlc82lqhLPMTtfRQWxJIOSQQ9k264X7pnkAOU6
	 bGRglFHFQDwUfhkEgUXTXe5/pbftdGNMpdGTc34lWYcBq9JPsKoxkbCxfyZJvjqh40
	 MzSYXxjRs971Hl1Ttc/NokvkxqFXBoghyBgkdifjTGOMf77WMu/w7HcaNR1mfMMe5N
	 V8ONxfn9ATUe7buMKoIPsn/JrUe0tFu0Gz/rmhTyLJxbmv3g4Fbxi3a4GWjLOoqpDo
	 8qsuXI3b7v9Ufd/HPvFkLLMT5Q9RH09c4RX9pb/DdOPe5weXldkXuwpvHaap+6CYa7
	 fwWXuRYgOcpcQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E90717E367E;
	Wed, 20 Nov 2024 13:44:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/6] drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
Date: Wed, 20 Nov 2024 13:44:17 +0100
Message-ID: <20241120124420.133914-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044444_639295_29E46B6D 
X-CRM114-Status: GOOD (  19.69  )
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

Setting the TVD PLL clock requires to multiply the target pixel
clock by a specific constant factor to achieve the target PLL
frequency, and this is done to reduce jitter to acceptable levels.

On all MediaTek SoCs, the factor is not retrieved by any real kind
of calculation but rather by checking if the target pixel clock
is less than a specified frequency, hence assigning a function
pointer for just a bunch of if branches does enlarge the code
size for little reason.

Remove all SoC-specific functions, add a structure `mtk_dpi_factor`
that holds a clock frequency and corresponding PLL factor, and
declare the constraints for each SoC in form of an array of said
structure.
Instead of function pointers, this structure (and its size) is then
assigned to each SoC's platform data.

The "calculation" is then performed with a new static function
mtk_dpi_calculate_factor(dpi, mode_clk) that iterates through all
of the entries of the aforementioned array and returns the right
factor.

If no factor is found, the lowest possible factor is returned,
mimicking the same flow as all of the old per-SoC calculation
functions.

This commit brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 103 +++++++++++++++--------------
 1 file changed, 52 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index c7143184e5de..9f59ee679ce1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -117,9 +117,15 @@ struct mtk_dpi_yc_limit {
 	u16 c_bottom;
 };
 
+struct mtk_dpi_factor {
+	u32 clock;
+	u8 factor;
+};
+
 /**
  * struct mtk_dpi_conf - Configuration of mediatek dpi.
- * @cal_factor: Callback function to calculate factor value.
+ * @dpi_factor: SoC-specific pixel clock PLL factor values.
+ * @num_dpi_factor: Number of pixel clock PLL factor values.
  * @reg_h_fre_con: Register address of frequency control.
  * @max_clock_khz: Max clock frequency supported for this SoCs in khz units.
  * @edge_sel_en: Enable of edge selection.
@@ -140,7 +146,8 @@ struct mtk_dpi_yc_limit {
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  */
 struct mtk_dpi_conf {
-	unsigned int (*cal_factor)(int clock);
+	const struct mtk_dpi_factor *dpi_factor;
+	const u8 num_dpi_factor;
 	u32 reg_h_fre_con;
 	u32 max_clock_khz;
 	bool edge_sel_en;
@@ -515,6 +522,20 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	return ret;
 }
 
+static unsigned int mtk_dpi_calculate_factor(struct mtk_dpi *dpi, int mode_clk)
+{
+	const struct mtk_dpi_factor *dpi_factor = dpi->conf->dpi_factor;
+	int i;
+
+	for (i = 0; i < dpi->conf->num_dpi_factor; i++) {
+		if (mode_clk <= dpi_factor[i].clock)
+			return dpi_factor[i].factor;
+	}
+
+	/* If no match try the lowest possible factor */
+	return dpi_factor[dpi->conf->num_dpi_factor - 1].factor;
+}
+
 static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 				    struct drm_display_mode *mode)
 {
@@ -529,7 +550,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	unsigned int factor;
 
 	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
-	factor = dpi->conf->cal_factor(mode->clock);
+	factor = mtk_dpi_calculate_factor(dpi, mode_clk);
 	drm_display_mode_to_videomode(mode, &vm);
 	pll_rate = vm.pixelclock * factor;
 
@@ -964,48 +985,6 @@ static const struct component_ops mtk_dpi_component_ops = {
 	.unbind = mtk_dpi_unbind,
 };
 
-static unsigned int mt8173_calculate_factor(int clock)
-{
-	if (clock <= 27000)
-		return 3 << 4;
-	else if (clock <= 84000)
-		return 3 << 3;
-	else if (clock <= 167000)
-		return 3 << 2;
-	else
-		return 3 << 1;
-}
-
-static unsigned int mt2701_calculate_factor(int clock)
-{
-	if (clock <= 64000)
-		return 4;
-	else if (clock <= 128000)
-		return 2;
-	else
-		return 1;
-}
-
-static unsigned int mt8183_calculate_factor(int clock)
-{
-	if (clock <= 27000)
-		return 8;
-	else if (clock <= 167000)
-		return 4;
-	else
-		return 2;
-}
-
-static unsigned int mt8195_dpintf_calculate_factor(int clock)
-{
-	if (clock < 70000)
-		return 4;
-	else if (clock < 200000)
-		return 2;
-	else
-		return 1;
-}
-
 static const u32 mt8173_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 };
@@ -1020,8 +999,25 @@ static const u32 mt8195_output_fmts[] = {
 	MEDIA_BUS_FMT_YUYV8_1X16,
 };
 
+static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
+	{ 64000, 4 }, { 128000, 2 }, { U32_MAX, 1 }
+};
+
+static const struct mtk_dpi_factor dpi_factor_mt8173[] = {
+	{ 27000, 48 }, { 84000, 24 }, { 167000, 12 }, { U32_MAX, 6 }
+};
+
+static const struct mtk_dpi_factor dpi_factor_mt8183[] = {
+	{ 27000, 8 }, { 167000, 4 }, { U32_MAX, 2 }
+};
+
+static const struct mtk_dpi_factor dpi_factor_mt8195_dp_intf[] = {
+	{ 70000 - 1, 4 }, { 200000 - 1, 2 }, { U32_MAX, 1 }
+};
+
 static const struct mtk_dpi_conf mt8173_conf = {
-	.cal_factor = mt8173_calculate_factor,
+	.dpi_factor = dpi_factor_mt8173,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8173),
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
@@ -1038,7 +1034,8 @@ static const struct mtk_dpi_conf mt8173_conf = {
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
-	.cal_factor = mt2701_calculate_factor,
+	.dpi_factor = dpi_factor_mt2701,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt2701),
 	.reg_h_fre_con = 0xb0,
 	.edge_sel_en = true,
 	.max_clock_khz = 150000,
@@ -1056,7 +1053,8 @@ static const struct mtk_dpi_conf mt2701_conf = {
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
-	.cal_factor = mt8183_calculate_factor,
+	.dpi_factor = dpi_factor_mt8183,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
@@ -1073,7 +1071,8 @@ static const struct mtk_dpi_conf mt8183_conf = {
 };
 
 static const struct mtk_dpi_conf mt8186_conf = {
-	.cal_factor = mt8183_calculate_factor,
+	.dpi_factor = dpi_factor_mt8183,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 150000,
 	.output_fmts = mt8183_output_fmts,
@@ -1091,7 +1090,8 @@ static const struct mtk_dpi_conf mt8186_conf = {
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
-	.cal_factor = mt8183_calculate_factor,
+	.dpi_factor = dpi_factor_mt8183,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 150000,
 	.output_fmts = mt8183_output_fmts,
@@ -1108,7 +1108,8 @@ static const struct mtk_dpi_conf mt8192_conf = {
 };
 
 static const struct mtk_dpi_conf mt8195_dpintf_conf = {
-	.cal_factor = mt8195_dpintf_calculate_factor,
+	.dpi_factor = dpi_factor_mt8195_dp_intf,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
 	.max_clock_khz = 600000,
 	.output_fmts = mt8195_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
-- 
2.47.0


