Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B224AC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 03:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tjcfb+f86cOHtOEZc4HBUpLShAgDpNiqubUYkkfkks0=; b=Ry86QXiOnSzVOjRkAatv6yhvB8
	7HBaBB7yII7AQsPhOKjWqK9Ohf/l9MDqY5CjvC1UnkHeLL2a38YIuC8yhOvk5wtceWaJ5LZ+Za6jT
	4ijnvXfppSKM7mzNYSlT3NcxbPRSQHXtTY3O0P5RdrkBqlELD36oswu2yMnVHxfADL/OH8QtLYcW/
	8SafFrTWJePUMp2UGepESnbzZ6r1gmZuH2BVLe+sx1l/pC+4mNFcpK8UCgzCzRa+SfVrPwB+vBQ3z
	zjZCPVpbn7Oc2Isk4wM9OlcjMPF5gKafVqF58hg9elBSyD7SDOAJ6g84pQy6yGZafVdfvBH4AFgbm
	djuDA/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGue-0000000Axy5-1Psh;
	Mon, 10 Aug 2026 03:42:56 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGuV-0000000Axt2-3OEB;
	Mon, 10 Aug 2026 03:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786333317;
	bh=Tjcfb+f86cOHtOEZc4HBUpLShAgDpNiqubUYkkfkks0=;
	h=From:To:Subject:Date:Message-Id;
	b=EocpJI4SmfLi0GT+Bf/dX3SBhgb1RoFAOtWClEyxQBbSE6xIj6cr9zPbiopheVpzd
	 NqCEBwEHmZy05mxU8j+f5OVjOV60Z5qbYrN2JnnHNAQ18PNoBVwhm2xKuxBHVbOMeT
	 WJwdT2z5x91A8Zdtg7ALFSfIpkShZQxuNcvZi0qI=
X-QQ-mid: esmtpgz11t1786333315t19f8f1a4
X-QQ-Originating-IP: +SRDmXkr19VKCagxV68VCDgA4QPcOicuzyqjaAnEJRo=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 11:41:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15333600352943301617
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
Subject: [PATCH v3 2/3] drm/rockchip: dsi: Add dphy_get_timing support for multiple PHY types
Date: Mon, 10 Aug 2026 11:41:38 +0800
Message-Id: <20260810034139.148-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260810034139.148-1-kernel@airkyi.com>
References: <20260810034139.148-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M85nqffhIqrgV+Ucm0v2uiEgd7vqgE/8ihbN04HM7ev+GbCC2Io8Sd60
	PhjZP9/8o3R+LbAZP5EIO9AQkD7+xwHsw/V7+WKkSKX9DpCfSgs0R1JIJUgLMR4MdP6b7eb
	TCHRTKOkpKk6QCA5anqPEs4qifQBWwKst6nKKSMzfekxd4umFTP8SDgVr3trBQRuE5lNbxi
	safOtdyoSmcU0/TEZ8GoREINNVT/Pqr2dUpAyKSFfQpl+V7T/97727SalKbKKApe3FaiOK+
	+hTkZACogjd0J1IVtSPDjd+6k7qB8Q+eRyVKsx+Dr77ODqD3QLIjD3k/Rd5BR/OW7FDVqpT
	rAFul7VJOHK4AUcvjL46GisVPIchPatIgKfNY5DatpAoR0z+uLAUBWshjBtZAlN1yc1+RrD
	rvNDuOcMceXT1uxE9y3TcJIb10V8/KiYt8V/XsCRh1xviimzxBc5SV8Qjtqmkvp6nqWcikA
	dv6JzBrDv5v08a1thIv8kvHDqlQaE0IG79+bOz1bspXEmVx2GLR3o5zXmlgSkMog8/Oi9qO
	UNHfcybtxS+6/qbaVZwRFfOkf8ab5D0aCCDEyBXjYVsr1Ejt3CGWMKrceormuC+yObS7jfA
	1TXecs2gw4J5NSPzFJQHRhEqi+I8ckh8VLh5YXsY778KNcXJ7oBEw+pNGzmjyFTHQdY1PEP
	tlc3sBb28tFh50dlpNOtqViWGwiNY43YuZ4RAI94RDYB2TwifovoMc6VUb6PNA6odRd5pwM
	tliFOwqP8reeGHOzsrjgRPKnK7vWnJU0OCSBfYRjwEf90TOcfHEKBN/PNUfFb1Moo4H3oXt
	piYrExhwGplLyedWEOz8zaHnDGC5qsPLSJvGrnoV2qpfDUQNpidk0iqxYYcPcEJaz9l9Jwb
	sIX28IC8qj2bJfbDchNnQEptx+qlKHSKMjvts0aZ3I65b0EUqu4T9Pbvb09zDNl7zGKaBzL
	+8d6nW7c4gQjyxLAGaBqgCNrsSloS6lU01zczgfXMlAtdrTl+irLFUaZPsTShnx24WDv9iG
	YFdHuGWfh3qUp69g59Oy9AbEvYEQheTBDBpiLQeg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_204248_304741_BC889B8B 
X-CRM114-Status: GOOD (  15.83  )
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

Currently, there are generally two types of DPHY for Rockchip. One is
the DPHY used by RK3288/RK3399, whose timing is described by Table A-3
High-Speed Transition Times in the databook. The other is the DPHY used
by PX30 and its successors. If its timing is still described using
RK3288/RK3399, it may not perform correctly on some DSI panel.

Add dphy_get_timing for different D-PHY types to adapt to timing
differences. The configuration details are as follows:

- RK3288/RK3399: Select the corresponding entry from the timing table based
                 on the data rate.
- PX30 and later platforms: Use a fixed timing configuration.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
Changes in v3:
- Rebase to Linux v7.2

Changes in v2:
- Add more comment about timing config.
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 1060abec9f29..e64dfc327891 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -247,6 +247,7 @@ enum {
 	BIASEXTR_127_7,
 };
 
+struct dw_mipi_dsi_rockchip;
 struct rockchip_dw_dsi_chip_data {
 	u32 reg;
 
@@ -262,6 +263,9 @@ struct rockchip_dw_dsi_chip_data {
 	u32 lanecfg2_grf_reg;
 	u32 lanecfg2;
 
+	int (*dphy_get_timing)(struct dw_mipi_dsi_rockchip *dsi, unsigned int lane_mbps,
+			       struct dw_mipi_dsi_dphy_timing *timing);
+
 	int (*dphy_rx_init)(struct phy *phy);
 	int (*dphy_rx_power_on)(struct phy *phy);
 	int (*dphy_rx_power_off)(struct phy *phy);
@@ -721,8 +725,9 @@ static struct hstt hstt_table[] = {
 };
 
 static int
-dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
-			   struct dw_mipi_dsi_dphy_timing *timing)
+dw_mipi_dsi_phy_rk3288_get_timing(struct dw_mipi_dsi_rockchip *dsi,
+				  unsigned int lane_mbps,
+				  struct dw_mipi_dsi_dphy_timing *timing)
 {
 	int i;
 
@@ -738,6 +743,32 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 	return 0;
 }
 
+static const struct dw_mipi_dsi_dphy_timing dphy_timing_px30 = {
+	.clk_lp2hs = 0x40,
+	.clk_hs2lp = 0x40,
+	.data_lp2hs = 0x10,
+	.data_hs2lp = 0x14,
+};
+
+static int
+dw_mipi_dsi_phy_px30_get_timing(struct dw_mipi_dsi_rockchip *dsi,
+				unsigned int lane_mbps,
+				struct dw_mipi_dsi_dphy_timing *timing)
+{
+	*timing = dphy_timing_px30;
+
+	return 0;
+}
+
+static int
+dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
+			   struct dw_mipi_dsi_dphy_timing *timing)
+{
+	struct dw_mipi_dsi_rockchip *dsi = priv_data;
+
+	return dsi->cdata->dphy_get_timing(dsi, lane_mbps, timing);
+}
+
 static const struct dw_mipi_dsi_phy_ops dw_mipi_dsi_rockchip_phy_ops = {
 	.init = dw_mipi_dsi_phy_init,
 	.power_on = dw_mipi_dsi_phy_power_on,
@@ -1506,6 +1537,7 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
 
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1000000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
 	},
 	{ /* sentinel */ }
 };
@@ -1519,6 +1551,7 @@ static const struct rockchip_dw_dsi_chip_data rk3128_chip_data[] = {
 						RK3128_DSI_FORCETXSTOPMODE), 0),
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1000000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
 	},
 	{ /* sentinel */ }
 };
@@ -1532,6 +1565,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1500000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_rk3288_get_timing,
 	},
 	{
 		.reg = 0xff964000,
@@ -1541,6 +1575,7 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1500000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_rk3288_get_timing,
 	},
 	{ /* sentinel */ }
 };
@@ -1554,6 +1589,7 @@ static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
 						RK3368_DSI_FORCERXMODE), 0),
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1500000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
 	},
 	{ /* sentinel */ }
 };
@@ -1642,6 +1678,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1500000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_rk3288_get_timing,
 	},
 	{
 		.reg = 0xff968000,
@@ -1671,6 +1708,7 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 		.dphy_rx_init = rk3399_dphy_tx1rx1_init,
 		.dphy_rx_power_on = rk3399_dphy_tx1rx1_power_on,
 		.dphy_rx_power_off = rk3399_dphy_tx1rx1_power_off,
+		.dphy_get_timing = dw_mipi_dsi_phy_rk3288_get_timing,
 	},
 	{ /* sentinel */ }
 };
@@ -1698,6 +1736,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3568_DSI0_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1200000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
 	},
 	{
 		.reg = 0xfe070000,
@@ -1708,6 +1747,7 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RK3568_DSI1_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1200000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
 	},
 	{ /* sentinel */ }
 };
@@ -1721,6 +1761,7 @@ static const struct rockchip_dw_dsi_chip_data rv1126_chip_data[] = {
 			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCETXSTOPMODE, 0)),
 		.max_data_lanes = 4,
 		.max_bit_rate_per_lane = 1000000000UL,
+		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
 	},
 	{ /* sentinel */ }
 };
-- 
2.53.0


