Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D091C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2Fo91Yu0gtcKaken+IS0yw2bU2hYPeqOKEU4se3BYI=; b=l5jbUSmD/2y2Ly/lHjWxjbxBnJ
	IyxfGY4n9SYnZAnMjH55nHqjWxQ3pJyUrhKhCWLG3AogZAp6pRtJuUh1IUnJixS0eHwgxZh/mx2XV
	2r77Y/fgsIOQyYQrtHfgS69mIx2V0EhN+NSOt1cHbw/XM0lhb4LQTB/absoCG60Zbk2H4VEbRsO2A
	ucEXa6hw7q37pD4qNaA8qOflEFnAPieYBWuzjCzQfVl3hilN4kVj1wCE31t8BqmhfOA7DEHXrx6Rq
	1PCZHDzUl2uqJfNB534V6uXrJYwH4NU30LTJlouotrHTjZp6aR4ozEvhDVc7Qn+0Lplw5k7WRoeRD
	QLTp9CjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUHp-00000000eoS-3M3W;
	Sun, 06 Jul 2025 18:40:25 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU4a-00000000d0t-25VM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:26:45 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3EE9E20D0D;
	Sun,  6 Jul 2025 20:26:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmfshaQaDONC; Sun,  6 Jul 2025 20:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826401; bh=bjtJIjfPVA1dazouYBClK8TP5EhzRm7A0VApH2M0W8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L30N+vdI3ANTrR7nByu59YwV8jshN2raZXMQ5IIDJi1UwxXyutOniHGZpgdOyrELo
	 8+0INjjnu+VXVPpIKHjXVzuh7ZphDzeHXdZLTZx03b7B1L86gZd/2g7FNz6golVkv3
	 cgwH1O3pkb+vbM88NFusxLM9koyQ/4mEYx4RgE+D0/Vitp6vYUADfNbUTOhsiBfxOp
	 95/H08BQJGSHL6ABF0iBhPdrbhKGZx15TdJ+yGFbdLTvqocqxHjDcJwJUKd4ESbCZq
	 E8ux5qsVaR5hn0YtnzcSGQWI9982elldjeELp29s9wFGbrpM+ddQ0NAf9Bp8KTF/FN
	 Q7heXLhIJiWCA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:39 +0530
Subject: [PATCH v3 05/13] drm/bridge: samsung-dsim: allow configuring the
 MAIN_VSA offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-5-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=4240;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=bjtJIjfPVA1dazouYBClK8TP5EhzRm7A0VApH2M0W8E=;
 b=TjmdG/eOGkbo2pOMCnBxjC5jxuc7P2/cE+slWoPjFkMVtfJYptuBnDt55XEUmZQm99ZpmS/k2
 9E96HgVYhoNB0HfFAQJWyClc1nc2LFhZ4Iy1DCePH2fk9QlB+fMds17
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112644_804624_36095070 
X-CRM114-Status: GOOD (  15.30  )
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

The MAIN_VSA offset of DSIM_MSYNC is hardcoded to a 22-bit offset, but
Exynos7870's DSIM has it in a 16-bit offset as per the downstream kernel
sources.

In order to support both, move this offset value to the driver data
struct and define it for every driver compatible. Reference the value
from there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 13 ++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 199c7ace78bfeb01d3ef9a841fe9339c0fb9f478..89ece3e6f200c710e4c9204efd84c84b9260456b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -125,9 +125,9 @@
 #define DSIM_MAIN_HBP_MASK		((0xffff) << 0)
 
 /* DSIM_MSYNC */
-#define DSIM_MAIN_VSA(x)		((x) << 22)
+#define DSIM_MAIN_VSA(x, offset)	((x) << offset)
 #define DSIM_MAIN_HSA(x)		((x) << 0)
-#define DSIM_MAIN_VSA_MASK		((0x3ff) << 22)
+#define DSIM_MAIN_VSA_MASK(offset)	((0x3ff) << offset)
 #define DSIM_MAIN_HSA_MASK		((0xffff) << 0)
 
 /* DSIM_SDRESOL */
@@ -423,6 +423,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -449,6 +450,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -473,6 +475,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -497,6 +500,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -521,6 +525,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -549,6 +554,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
 	 */
 	.pll_p_offset = 14,
+	.main_vsa_offset = 22,
 	.reg_values = imx8mm_dsim_reg_values,
 	.pll_fin_min = 2,
 	.pll_fin_max = 30,
@@ -1041,6 +1047,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 {
 	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
+	unsigned int main_vsa_offset = dsi->driver_data->main_vsa_offset;
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
@@ -1067,7 +1074,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 		reg = DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
 		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
-		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
+		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start, main_vsa_offset)
 			| DSIM_MAIN_HSA(hsa);
 		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index b1e64c7f993189879d9549f147f7eebdf3b7ded4..7f6d353f34af14f156e864c624f6eb980296c32d 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -70,6 +70,7 @@ struct samsung_dsim_driver_data {
 	unsigned int lane_esc_clk_bit;
 	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
+	unsigned int main_vsa_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;
 	unsigned int pll_fin_max;

-- 
2.49.0


