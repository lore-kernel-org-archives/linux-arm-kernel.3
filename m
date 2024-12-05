Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F0FE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkI5O3ubHZD4YWFd5qoT/xNEJnq3uZfak8JZi6NeDDw=; b=bWwV/bKAUWreligc7RouFYTtna
	xNjQgTMRKEEn2ED+FD24eisTlNNb5tOyBLat55mEMAPxTdbXclbrQFExiTbZ9VwFF+u5i75/RRemE
	B+rD3Kj2fOzRlN8UK0l490ZTN8frwts4wNH4/2cpo0azFKWD0qYBTuNtxcYb2CnqO/sFWOkXrm1rW
	UUTXWS56ta9Y/GfmDg+JdncO7BYdZSgC5niA44vS7QiNyXqGxQJFTiI4BL3GkmgNfs424yIs/mfSU
	6V7Pw8Rnix0/qmC92190Va/pbMuLOQaDShsDOnNsVsEwTpJ84M+exVYKacy1ldyO84kZT/G1HM1QY
	NQQIt7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAPH-0000000Fo7h-2t8H;
	Thu, 05 Dec 2024 11:52:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAIf-0000000Flyu-1IYG;
	Thu, 05 Dec 2024 11:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733399139;
	bh=9A2uZPozE+U8RsE49XL0Ew/0XRym8KLDc7ZvD0O5uY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SL7V9/Xh36O5/x4p45u2HwjaHNu3HJCpUcW8MejqySmPQ7s5MGNLyhFuzTBu0mb9+
	 j+D0C+8h9QQba8y0n6kLtOAoe3ZNcHo4vmY2rKR0L3XOS97ThO7Ovw/iUbehxiGE4U
	 /l346tEzNJOPjDKG69hog8azNxA2IRGIt/7ptcgoXCxhcyTR0lwcutiW/ZBAdfZzVg
	 DB3hTphbIXFeFbbC0fm7WQ0fHXdzbhTOla8phR8plEkxNtw1GLM4ToVsSlrd9zvaN3
	 +TAInaAPy8/PxQyDSVzQaK/uI0pW2kAL9YRt0NcdPGgqt24xpQNTFdQyS91WFKwhmy
	 EMtWm3NL5ibTw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9768D17E3639;
	Thu,  5 Dec 2024 12:45:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 03/15] drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
Date: Thu,  5 Dec 2024 12:45:05 +0100
Message-ID: <20241205114518.53527-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034541_689304_167A467E 
X-CRM114-Status: GOOD (  19.35  )
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

Reviewed-by: CK Hu <ck.hu@mediatek.com>
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


