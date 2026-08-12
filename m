Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E39DC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FA/V+nRcRTt6yyor6+0D24RflxpWaTmYt2XDxhPiO8=; b=TWi2905CXqxq8BF9P5+wOzsyZy
	AfYqAnA1G/E2T420ksXOUMBv0D4rzZfPZAd/gvu+DrWoCOBKZcsuW9IsXo+4R3Q1xJyfZkdAHhh7Q
	KfwQakGOd+YQRa/x6W1INDzkW8ZBAZJ9Hpo/a6Olhl3qBS+E75CNLMD4YN25FeIhMdS8cdrhd/CdW
	DQRc+rme0mQ86nhVRkSEHtUewQLbi/vlOWB0RdOC6/EBdoLHE+zh/uk92W86afRUcNu4y035jKNWS
	ocSbXzhHw3R5390Vo9cHCGp2HdTLzLUH7L9aZwzwMezZSJ2n6Yv/ciBNYM+1WGKMYyGXNhtbbfyn2
	F3+AsKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Qu-0000000FaC4-2bDf;
	Wed, 12 Aug 2026 07:31:29 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Qn-0000000Fa7C-4BNR;
	Wed, 12 Aug 2026 07:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786519813;
	bh=5FA/V+nRcRTt6yyor6+0D24RflxpWaTmYt2XDxhPiO8=;
	h=From:To:Subject:Date:Message-Id;
	b=vzllq6xDg+NMV4lWUKjuWrca3YfiNGVCRn2UJoE+Ovoknt4h3QuIW2Uf4MDBaf1PC
	 FKYkMopJLC39PI90sIGev0nBB/zvIEEv8sUsl+2pW/HvrFpg4qTxBhn5OYmf3rBrnU
	 R5KuyW6n3D233kQRJw1QeBgOL/cNf4pqwxj2S1xc=
X-QQ-mid: esmtpsz11t1786519811tabb45875
X-QQ-Originating-IP: doHS0+eOIqn259p0aMCNuWIZy4GIzTDdZIk89RHla3E=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 15:30:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13150229411053610803
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
Subject: [PATCH v4 1/3] drm/rockchip: dsi: Add maximum per lane bit rate calculation
Date: Wed, 12 Aug 2026 15:30:00 +0800
Message-Id: <20260812073002.328-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260812073002.328-1-kernel@airkyi.com>
References: <20260812073002.328-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OLsBWtCIHsg6jGi0pGfSzA9puLUzo4Gz1YuO2uVqJdUnCpDo1nDTmlNN
	KvDbh8EQg7jgbcD2A4FLjaMEHBqzjrlAB7bTFcEfGDc01IZ+r/CNAUVop4cb0N3jx0qzCt5
	APpXjVMHQrMRGnfa19rMeXG529kS3DEK4uDnhE3tQZOKGhXuXGjg+u7WuJevI+t+WfgD22e
	/gush6lDqtD/+r0VP/V5hgK6TVKoQlyu8RVL4VUm4Pu8GWi2ZbzzrxBynGSRc8TLwju8F4W
	c+l1+Hc/rG5qg/8Gy2umJXRKjInzurZyOP4nR0w+8Paw6qsPoJu6kLedSlw83lzW6Xy19bA
	uhWQqO8yAAnStpxZpbSgVOYmqnST2yBb2lcjwxJB9MFZDzHsFELiSOa0UEw4I53mjQqocvq
	yLhB5gPROXnJtChNxeydLmonzK+7p1LtxhWhZnVpN5kEWvd9v29aULvppfh4fKW9rGJH3yI
	cazNcfcp9NkAeU6q4fN+NirshI3QEimUU/6p8+aJTx84W5XBfmmptGCfWP81hZcR89RePCz
	XDsxhxnS22Y3mNsSMnH0INYIURlXpc0icwURcAhmVh6BqtLsOdohvfJPJuX7gOip06FVBM9
	CcEAL52iOsEd7O2/zKKNUiedEGllufvxOixIMx1Sef7l4mhNcexR462LW4ty2KByRb+EBDG
	R6Xjg2DdhTUwnPle9V0ekZJ714WEIXgR2D/befhyl2BT4kt/hXS239EzUybixq/8OapFhu7
	bjANyJApIrgDvZQVdVJZaCFbn2JTy0IErPEZHNVGknyFGPJ/8tSCUUg8m+DzfgviL6mZQwo
	qu0h1sZomN9Ox8OcUXu8gUV3WiEkxOYJqXaWbuwCneE660UHuSLbiSXTsxJ7J0aQJnwEV5W
	vaHN9vB9uCO5WtITnovgqm3gsdrO5sTVkUoPjvGAxZEs9Y0iYM+oYIPnKs5Ayy7sMLYMaHW
	ism9i5y9j3Ut4ytYuwZCghNcBG9miaIR23wdBAYD0YGQpR1BMvgYih9hKlJcz3CSYgvFf8U
	fiVUdy9g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_003122_325724_4920A29F 
X-CRM114-Status: GOOD (  12.68  )
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
(no changes since v4)

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


