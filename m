Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67259C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 03:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5tR/xZjU5Pjmrm51dDg8L9m7GNYl37L5TgCsOvaI4k=; b=xsUzzhAKyntbcrFwjLjimFOMF5
	GjqW2ECOG+P61NyKs7dx13w88prd50Th4Huhp+g/Pr//pRT6CXIbZuLLQ6WSs5jZir6pFxiejiaZK
	64Yeyr9z6alh8JV8rcuv3E6gjuEjgI3P9k763uuIKCMgGisB/7KaA6raTxnE6EzYQ5f4dNTufA2bQ
	15qHTG4cdDHzczmufSucv1Y//uUqTm/chsof8cIFh50Tt7RC3ZFrUE2TBDKB+WPfAQQWwzRwxdm4U
	nucOY2bIbSrZsLWnI9j4KIHeaVk4yWt+i5hUkNRvPolrpTCo7vXb/exxDGFhVYRYqtRUxZc3fAZL+
	9mAfEVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGub-0000000Axvv-04db;
	Mon, 10 Aug 2026 03:42:53 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGuV-0000000Axt1-0xDt;
	Mon, 10 Aug 2026 03:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786333313;
	bh=C5tR/xZjU5Pjmrm51dDg8L9m7GNYl37L5TgCsOvaI4k=;
	h=From:To:Subject:Date:Message-Id;
	b=dRS99o+g8vD/obsNw4R7aYNWO/i+ydeI7v2OqDhYougwFRwkLmfTGTfuJdpC5rapJ
	 hIIzYHX9iMdgl3luZ0k+JYR1cnyRSi11Js+M4bwP7fvmmrBM1XjWzguLgRz9SdkJTo
	 NgX9evnZSfb0Ko9BPdqrf71fgMp3hSBUjiedVgas=
X-QQ-mid: esmtpgz11t1786333311t415aa3d0
X-QQ-Originating-IP: I7zcKriExk/3nyhItJweEb4li2giQHM0Lm/5oQJxjNQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 11:41:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18107200135916440458
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
Subject: [PATCH v3 1/3] drm/rockchip: dsi: Add maximum per lane bit rate calculation
Date: Mon, 10 Aug 2026 11:41:37 +0800
Message-Id: <20260810034139.148-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260810034139.148-1-kernel@airkyi.com>
References: <20260810034139.148-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N5QhsOwzP0INdtBiy8KQCyGjOjliEqi8EZ8vyRnROOE7KlwmIMaQsqYJ
	RHnQi9Rude2L87GLcE7Bg62oXpHsUWFmDSVepM0WJu85CYrbECwIvEvZIuiqC0PTwfrNoba
	5wOBvqFHhOMoSHo/qLDwcvarJBtO4KYM7H04HZAHldt3iIK61Mr4RM33la+1BTScyB1PL/b
	HrZOf6wc9jpM/f6EX5PFTl3RRAdFBZbDzrfrPGT+IFSI0V7MwdZuelDant5zfesfKEr08R+
	36S4BkyllifJvilxY7KBTygBXn2cGZQd3o2xEc2VZOypAo1Ov4kf2T2+yOHlWEXehs4L47B
	rvt79G0MpwLsqWzYxRlJBxKiJ/6R6eWWxdK5iOB/QwdtQcMDMP6Tz4/h2vF0hXdqXsXMl/C
	RpB/yckWAjoug43VjPcjecsq5h49xtXHOL1VibzmSL3+Ey/zGL41o0nsZKeWpJcl2coyrWb
	jSY2cP3ehju7QSkHJX1QF2xhl22iauslRvhNK9R1ctSLpToPEGYN1uQw+QcpCoIQzeThaln
	jr6Rj3bS4jMCeBESAFOtUB+u8/ydu21OV5DXkT1ABFndEr5uUvmmyfAZK/Wgd2YxBCWehjq
	G0bvHHgrDFzpV/V6CvVjn2vzkhgbY3qB/z4adlY8C1x8zkAWWUZm0UNYynTcSk4TJrVtcEm
	fQEMFsjqL+RNYG48SL4xPKB2dYzSjJU/AjzBTGULMzkluj7w4vsnNt+ogtOTTrAK6EtJ8rG
	LQGWpdlmJ+d5Uwjihs1WLt/I1XlhRI1i9yOvgXaR6hD1pOL+BxsnFZTkPr59zUXrQu6YeTw
	mFGZIxBwLcIKmb4iBqXMTgdKbJoscfBpJbKsua/0hU2xUNYnDLKaMtSPjhar/nlraOrgc+9
	Vw1WmSBz7UmqLHLd6sTf0XCu2lzIFvaYLNgLnHcU2OwHgeP9/ayPgo9fRR2UITMEPItJwY4
	z38ZYde4/gwnG8iA1udbFunGS4W5MFa7JSqI1LJqtmS2Mkpvr4SW2U4xgCXTsp7h75H9Z28
	sY9IPS/Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_204247_658083_9E672CB9 
X-CRM114-Status: GOOD (  12.39  )
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
Changes in v3:
- Rebase to Linux v7.2

Changes in v2:
- Fix the unit conversion for max_mbps.
- Split the lane rate calculation into a separate patch.

---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..1060abec9f29 100644
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


