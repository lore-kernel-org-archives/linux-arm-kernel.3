Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F1ACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCvXR+xtHN8zNeI9HyrNbgQst6B5lB1aewkYCgwCIvc=; b=XIJ9b9VlBch7o/o37GAQ6dm2bl
	HtuhF/0D1uGAiVhC1iTCGxNR0hx7WC5JPtH3ssgZLUAWp7/cw0UqECCflKQadHnaHMCrI0/ojUk8U
	a5LybaIP/tKZLYzF8ClF2HGlukhIoh30d5kheBosklDvSnDWSiEN4kaOE4LwAfDC0xzYNxJ912+d+
	MxG0chjpYO5TC7f2murNncCRA6PmXvxJXZTn01/zcqcIZuywQyCXTgtT/s4DPHkbvsv+7g1HXUHC5
	n19Kgr+YFpnluwCz+iEmlEpTUsb9E+pcLsZICiAL8jgYIwbQS8KP4DKMBPYRxcDxNG7oIMqw2m6EF
	Neh/mLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPV-0000000EjX9-31YC;
	Thu, 06 Nov 2025 02:07:37 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPT-0000000EjGy-0gqc;
	Thu, 06 Nov 2025 02:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762394827;
	bh=jCvXR+xtHN8zNeI9HyrNbgQst6B5lB1aewkYCgwCIvc=;
	h=From:To:Subject:Date:Message-Id;
	b=aT6HNn7Ar4rrBQwhjXx0ZCBET91eMNEjO8q4eQPbqrjD3GlpfgDrgwaeJerqVG5kn
	 2VpG64pSlgxE5tc3RCR5081kCQvtRcEy0W89l6PKjsAP8mmr7gaOaZ1xc5qMqNWZR0
	 pDA1+bC5I/8csPo0PI/P2WFtOXOxYfVCNvgyAInI=
X-QQ-mid: esmtpgz15t1762394826t5cc258c4
X-QQ-Originating-IP: SeeXlzF1dnwv3Vr5Y8FlyYCG69HSWnlfwjiW2HttmNM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 10:07:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10135614962610030786
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hongming Zou <hongming.zou@rock-chips.com>
Subject: [PATCH 6/9] phy: rockchip: inno-dsidphy: Add support for rk3506
Date: Thu,  6 Nov 2025 10:06:29 +0800
Message-Id: <20251106020632.92-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NsKw77UaNFtDdX5qudBkf8iJyIWz6OVV8/QTysgzrECpPkS1KjAEl6P4
	/MCOfW/JI1n1fhndzaEDAR6fMxWIOst+HRGFFdjjl5OSIKwTA35GdbfAPs6kTb6wE51c+MH
	UoW4K4gbv8SL7CoXYqQWeUTAvCoa91x+7D9/eW3fEEHYi63+WWRDee2FcHuMYOOKz92mlaB
	tf5i7NFzCfT6Ei4GJyqom4vkszQvPdMTlL4LevMSFRL51D3yVSyhuxCm2N+nQiFDDRXIEI1
	s3IRmlmH4l4E6pbPQbKp/lNpYtDoaC17V7n/ge/7jVaPYLH7M87BhpGBLxkF3xdfi/JI4OU
	OVhZ/s1PdR0qqdsLmvUiAJ/riEahV/zdgi5n1BZfT8GXDbqvVF3BgSBij2K/BtETlmRzfag
	ranxeRV0wu/v4E8RyTWcktkBtrb3+UxTxV/TYISiLgWlRvhnrmhONIVxgOL/sJMXF/QQKQo
	lm95ePRW3NQ0xO9GnVsQerO0IeBFpycfIACossIXuOarehN/9ttlKiTaajCTR41jcHSDrhd
	tDHKK9T3MbTRVCjv8CPsv1/WlVnq8SZIgRES0srWMIBo14ZoU6cayyliAH21ixajHj2YmKm
	uLaBOuUFKMaupymOIdkYfP4AgWwj8hanhONec/rp+I07Wl5Nx8F5zqXDm3aa/ldCtseDHPm
	Hx553mL9J+KRmFSy7InXfs91OQRH7dep3AKcTWNa43Ybh4Fhz4+2MRgZDgvs0C0/MaVsCHw
	icurMSNFOVHTu6i4TC8ZAeFP/D+1CahpSwwoyPoQj1AMB2OoslDuFbvPvECL92KXEdFYf9s
	4rv11V4A9hdcloOx+KZ/h6BRNwvqoHvYLsz8g0NiCBcoNCYyD5BNOaEwTi7ypvhCryFCOGQ
	pT6vj01N0ZLXBQljVQIe56w/jvcof2y9azaxOR4nR7XuuxHYqhfQ3p5pM8aENCBAFOloKgw
	h0Z5xH31Xl+gVW0hiUdtpavVazfuU+lDq9bfgkekY3FEKF8nnDklOK5go+AzLi5SwTfBpgo
	wCvBWLskLcq3hh5Ycfsza0k6CcMCOKU4pR5nfJUQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_180735_643678_6D678E1E 
X-CRM114-Status: GOOD (  15.60  )
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

For MIPI mode, the inno-dsidphy found on RK3506 supports up to 2 lanes
and a maximum data rate of 1.5GHz.

Signed-off-by: Hongming Zou <hongming.zou@rock-chips.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 91 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index d5b1a4e2f7d3..30d5e5ddff4a 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -99,10 +99,30 @@
 #define VOD_MID_RANGE				0x3
 #define VOD_BIG_RANGE				0x7
 #define VOD_MAX_RANGE				0xf
+/* Analog Register Part: reg18 */
+#define LANE0_PRE_EMPHASIS_ENABLE_MASK		BIT(6)
+#define LANE0_PRE_EMPHASIS_ENABLE		BIT(6)
+#define LANE0_PRE_EMPHASIS_DISABLE		0
+#define LANE1_PRE_EMPHASIS_ENABLE_MASK		BIT(5)
+#define LANE1_PRE_EMPHASIS_ENABLE		BIT(5)
+#define LANE1_PRE_EMPHASIS_DISABLE		0
+/* Analog Register Part: reg19 */
+#define PRE_EMPHASIS_RANGE_SET_MASK		GENMASK(7, 6)
+#define PRE_EMPHASIS_RANGE_SET(x)		UPDATE(x, 7, 6)
 /* Analog Register Part: reg1E */
 #define PLL_MODE_SEL_MASK			GENMASK(6, 5)
 #define PLL_MODE_SEL_LVDS_MODE			0
 #define PLL_MODE_SEL_MIPI_MODE			BIT(5)
+/* Analog Register Part: reg20 */
+#define LANE0_PRE_EMPHASIS_RANGE_SET_MASK	GENMASK(7, 6)
+#define LANE0_PRE_EMPHASIS_RANGE_SET(x)		UPDATE(x, 7, 6)
+/* Analog Register Part: reg21 */
+#define LANE1_PRE_EMPHASIS_RANGE_SET_MASK	GENMASK(7, 6)
+#define LANE1_PRE_EMPHASIS_RANGE_SET(x)		UPDATE(x, 7, 6)
+#define PRE_EMPHASIS_MIN_RANGE			0x0
+#define PRE_EMPHASIS_MID_RANGE			0x1
+#define PRE_EMPHASIS_MAX_RANGE			0x2
+#define PRE_EMPHASIS_RESERVED_RANGE		0x3
 /* Digital Register Part: reg00 */
 #define REG_DIG_RSTN_MASK			BIT(0)
 #define REG_DIG_RSTN_NORMAL			BIT(0)
@@ -193,6 +213,7 @@
 
 enum phy_max_rate {
 	MAX_1GHZ,
+	MAX_1_5GHZ,
 	MAX_2_5GHZ,
 };
 
@@ -200,6 +221,7 @@ struct inno_video_phy_plat_data {
 	const struct inno_mipi_dphy_timing *inno_mipi_dphy_timing_table;
 	const unsigned int num_timings;
 	enum phy_max_rate max_rate;
+	unsigned int max_lanes;
 };
 
 struct inno_dsidphy {
@@ -258,6 +280,24 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
 	{1000000000, 0x0, 0x09, 0x20, 0x09, 0x27},
 };
 
+static const
+struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
+	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
+	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
+	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
+	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
+	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
+	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
+	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
+	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
+	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
+	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
+	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
+	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
+	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
+	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
+};
+
 static const
 struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_2_5ghz[] = {
 	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
@@ -372,6 +412,7 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 	u32 hs_exit, clk_post, clk_pre, wakeup, lpx, ta_go, ta_sure, ta_wait;
 	u32 hs_prepare, hs_trail, hs_zero, clk_lane_hs_zero, data_lane_hs_zero;
 	unsigned int i;
+	u32 val;
 
 	timings = inno->pdata->inno_mipi_dphy_timing_table;
 
@@ -393,6 +434,23 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x0b,
 				CLOCK_LANE_VOD_RANGE_SET_MASK,
 				CLOCK_LANE_VOD_RANGE_SET(VOD_MAX_RANGE));
+	} else if (inno->pdata->max_rate == MAX_1_5GHZ) {
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x18,
+				LANE0_PRE_EMPHASIS_ENABLE_MASK, LANE0_PRE_EMPHASIS_ENABLE);
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x18,
+				LANE1_PRE_EMPHASIS_ENABLE_MASK, LANE1_PRE_EMPHASIS_ENABLE);
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x19,
+				PRE_EMPHASIS_RANGE_SET_MASK,
+				PRE_EMPHASIS_RANGE_SET(PRE_EMPHASIS_MID_RANGE));
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x1a,
+				LANE0_PRE_EMPHASIS_RANGE_SET_MASK,
+				LANE0_PRE_EMPHASIS_RANGE_SET(PRE_EMPHASIS_MID_RANGE));
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x1b,
+				LANE1_PRE_EMPHASIS_RANGE_SET_MASK,
+				LANE1_PRE_EMPHASIS_RANGE_SET(PRE_EMPHASIS_MID_RANGE));
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x0b,
+				CLOCK_LANE_VOD_RANGE_SET_MASK,
+				CLOCK_LANE_VOD_RANGE_SET(VOD_MAX_RANGE));
 	}
 	/* Enable PLL and LDO */
 	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x01,
@@ -518,10 +576,25 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 				T_TA_WAIT_CNT(ta_wait));
 	}
 
-	/* Enable all lanes on analog part */
+	/* Enable lanes on analog part */
+	switch (inno->pdata->max_lanes) {
+	case 1:
+		val =  LANE_EN_0;
+		break;
+	case 2:
+		val =  LANE_EN_0 | LANE_EN_1;
+		break;
+	case 3:
+		val = LANE_EN_0 | LANE_EN_1 | LANE_EN_2;
+		break;
+	case 4:
+	default:
+		val = LANE_EN_0 | LANE_EN_1 | LANE_EN_2 | LANE_EN_3;
+		break;
+	}
+
 	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x00,
-			LANE_EN_MASK, LANE_EN_CK | LANE_EN_3 | LANE_EN_2 |
-			LANE_EN_1 | LANE_EN_0);
+			LANE_EN_MASK, LANE_EN_CK | val);
 }
 
 static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
@@ -680,12 +753,21 @@ static const struct inno_video_phy_plat_data max_1ghz_video_phy_plat_data = {
 	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_1ghz,
 	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_1ghz),
 	.max_rate = MAX_1GHZ,
+	.max_lanes = 4,
+};
+
+static const struct inno_video_phy_plat_data max_1_5ghz_video_phy_plat_data = {
+	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_1_5ghz,
+	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_1_5ghz),
+	.max_rate = MAX_1_5GHZ,
+	.max_lanes = 2,
 };
 
 static const struct inno_video_phy_plat_data max_2_5ghz_video_phy_plat_data = {
 	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_2_5ghz,
 	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_2_5ghz),
 	.max_rate = MAX_2_5GHZ,
+	.max_lanes = 4,
 };
 
 static int inno_dsidphy_probe(struct platform_device *pdev)
@@ -767,6 +849,9 @@ static const struct of_device_id inno_dsidphy_of_match[] = {
 	}, {
 		.compatible = "rockchip,rk3368-dsi-dphy",
 		.data = &max_1ghz_video_phy_plat_data,
+	}, {
+		.compatible = "rockchip,rk3506-dsi-dphy",
+		.data = &max_1_5ghz_video_phy_plat_data,
 	}, {
 		.compatible = "rockchip,rk3568-dsi-dphy",
 		.data = &max_2_5ghz_video_phy_plat_data,
-- 
2.51.1


