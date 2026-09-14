Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF191C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLhZHimfeAemx102sKi3S3oU0Nrf9TQfYCxAQtyW+4U=; b=BGcNe2vekibs3YUi0pyQd+oT6y
	sgFyqKLDdpBMigLyA0lk795a5genEa9OsWhnXBL8izapCaj/85zTR3F7Eg+wO8Xxwnsfphugymzgd
	rhty1Z/RIbUGwVXOsQV9sS50rsLnyURPFDFMcrzC7pEdp2Cr8HRqBeEznoOySkyJN4lPDKrwY7Src
	yyXAkIcmXkNa9maVJCIl3TJbY6nFmniojYgn/FPv2LujnExGV9Et7RpOCs7pwOWHg8cD1BEnsHpp2
	cJW0BjIXnhuRCmsX5muC3FkJAa2hCbcAnsse6FWNgsgbt1wcck8B4nem5tfkXE2kmTX/cMrMI99+J
	/vCbWfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vaj-000000029Ox-1MXP;
	Mon, 14 Sep 2026 01:34:41 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vaf-000000029Nw-3txo;
	Mon, 14 Sep 2026 01:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1789349633;
	bh=bLhZHimfeAemx102sKi3S3oU0Nrf9TQfYCxAQtyW+4U=;
	h=From:To:Subject:Date:Message-Id;
	b=kDKdItZZzKPRq9w3NtMmR1/D0+JwwUafwgiHJhpIu6MxZNlTYRYscK0xoVDwfBuIU
	 jn5UMec3x4IJ6jvW77prHIC6Jy6hT47aITM00jogw9cG37BuboVOtiSiqtFrvNynkL
	 0O4WkQk6awgmiBPJ2baiLoosD17cuNMd/jbH5ZxQ=
X-QQ-mid: esmtpsz11t1789349631t83d0eebd
X-QQ-Originating-IP: UDkduqCMmPjnwTw37M0pn7cnoB9fgqMlUFCVtwTX2S4=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 09:33:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6289182345882749368
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v5 1/3] drm/rockchip: dsi: Add maximum per lane bit rate calculation
Date: Mon, 14 Sep 2026 09:33:29 +0800
Message-Id: <20260914013331.108-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260914013331.108-1-kernel@airkyi.com>
References: <20260914013331.108-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M3ziZXKDk+iOHFRGvweTdBwdFQUSbUWuTT0Y8fC3DVtF6xFLtZK7bMi3
	1DSXGmn7DXxyiBfjQ/BK7W47UNXyAjiHrsGzGF6PdgubhG16ii/+uFEYbIAj0R7edDHx/i1
	HX87i5WbgEVhWXgiWGkcXZhBTajDpO6V6u70w/RFygweMiJnN+S3g16nGXXnCOMSfHZNbnG
	EUq5tG12EbaIOJL/TuNayzC5JkS9Tuxn4KAWytdMboxQAOfwiVajp32lSuQ3KxYrDuPmUtf
	bdeaZUP+69qHiYadNt953vNGJkc+4iELiHwWVV1t40LMnnq1MIAPbvzW0rWbSdXLu1jkS2S
	uIDMQWhmU+1iakGQm5CuwubQeAfS7avG/FswsP6+qmr6RBd15ZikfeqfL6NR3c+KxU3bAlI
	M8it2GqN1jNKVLH3XMZEOaRzPAEFv8monWdTQG+B6yX5+gABCyKwrT2PnoOtEmIDlvykQmm
	3/CLYCBx2xqxWVKqsK/Y2CBWJER4P+7Znzb8cqOJU/zcYzULyGXsyOkdHjZxyU1feDnK4HO
	MzLDLJI+xqGVHVYqahjOk1igJOU0y0l83yyL/BAT5MOc00rIGIJKYue/KIFM5DdHroXN4WT
	yPRvzm+YjRPY40B3fvG28rt3TDaqmFHvisQWS5OjB9yE9ic3TSQ4Ck0sXQfg4rQ8KILGXe9
	0k+/oAZCHbCejszxDtSqE5nGTTQt5kXioztLoludUrJY7IQwFWQhwOauDGHRT5by2F0cXdz
	1bzzaXR9iT+e0pTcBDbP2qYsPVU3DC92GVtO7hACmA6WTCkthV6Z/1w3qZ4WHMx3+0E3UiO
	v3PuI0lxrguWApRZ9ftAcxtYX+IeMzPaHofBQIYsGEKWbT4jTZIBEhHnFFuC6ceS/X/z4R5
	ZG2xD8vEPsV92e8obsmsKjzFU2iz9DmmbKLbZ1CJ+H43p/eOmfUKXvQrHXUh1xriXjIQrIH
	ER2xS2VO+beCUnC21T7CtIv7rrAp0OchX35dAGqeyPMSBlge3hX6OH8gk6HdqRdmMZTscOg
	31AsZ++A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_183438_463291_C683BC47 
X-CRM114-Status: GOOD (  13.56  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Different chips have varying support for the maximum bit rate per lane.

Add calculation for the maximum per lane bit rate for various chip
platforms.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
Changes in v5:
- Change the upper bound check for target_mbps from < to <= (sashiko).

(no changes since v4)

Changes in v3:
- Rebase to Linux v7.2

Changes in v2:
- Fix the unit conversion for max_mbps.
- Split the lane rate calculation into a separate patch.
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..6a476c2c1303 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -268,6 +268,7 @@ struct rockchip_dw_dsi_chip_data {
 
 	unsigned int flags;
 	unsigned int max_data_lanes;
+	unsigned long max_bit_rate_per_lane;
 };
 
 struct dw_mipi_dsi_rockchip {
@@ -565,7 +566,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	int bpp;
 	unsigned long mpclk, tmp;
 	unsigned int target_mbps = 1000;
-	unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
+	unsigned int max_mbps;
 	unsigned long best_freq = 0;
 	unsigned long fvco_min, fvco_max, fin, fout;
 	unsigned int min_prediv, max_prediv;
@@ -573,6 +574,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	unsigned long _fbdiv, best_fbdiv;
 	unsigned long min_delta = ULONG_MAX;
 
+	max_mbps = dsi->cdata->max_bit_rate_per_lane / USEC_PER_SEC;
 	dsi->format = format;
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	if (bpp < 0) {
@@ -586,7 +588,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	if (mpclk) {
 		/* take 1 / 0.8, since mbps must big than bandwidth of RGB */
 		tmp = mpclk * (bpp / lanes) * 10 / 8;
-		if (tmp < max_mbps)
+		if (tmp <= max_mbps)
 			target_mbps = tmp;
 		else
 			DRM_DEV_ERROR(dsi->dev,
@@ -1503,6 +1505,7 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
 						PX30_DSI_FORCETXSTOPMODE), 0),
 
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1000000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1515,6 +1518,7 @@ static const struct rockchip_dw_dsi_chip_data rk3128_chip_data[] = {
 						RK3128_DSI_FORCERXMODE |
 						RK3128_DSI_FORCETXSTOPMODE), 0),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1000000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1527,6 +1531,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI0_LCDC_SEL, 1),
 
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{
 		.reg = 0xff964000,
@@ -1535,6 +1540,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI1_LCDC_SEL, 1),
 
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1547,6 +1553,7 @@ static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
 						RK3368_DSI_FORCETXSTOPMODE |
 						RK3368_DSI_FORCERXMODE), 0),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1634,6 +1641,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{
 		.reg = 0xff968000,
@@ -1658,6 +1666,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1500000000UL,
 
 		.dphy_rx_init = rk3399_dphy_tx1rx1_init,
 		.dphy_rx_power_on = rk3399_dphy_tx1rx1_power_on,
@@ -1674,6 +1683,7 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
 		.max_data_lanes = 2,
+		.max_bit_rate_per_lane = 1500000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1687,6 +1697,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3568_DSI0_TURNDISABLE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3568_DSI0_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1200000000UL,
 	},
 	{
 		.reg = 0xfe070000,
@@ -1696,6 +1707,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3568_DSI1_TURNDISABLE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3568_DSI1_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1200000000UL,
 	},
 	{ /* sentinel */ }
 };
@@ -1708,6 +1720,7 @@ static const struct rockchip_dw_dsi_chip_data rv1126_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCERXMODE, 0) |
 			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCETXSTOPMODE, 0)),
 		.max_data_lanes = 4,
+		.max_bit_rate_per_lane = 1000000000UL,
 	},
 	{ /* sentinel */ }
 };
-- 
2.53.0


