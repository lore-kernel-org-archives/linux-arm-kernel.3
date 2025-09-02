Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF7CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z94dFNHyKcfdRxp6aWzWQc5tqta8/vk7LRsltG3+fdc=; b=qNYudmqlFkcnnc02cU21PvemU8
	edPw75KDk3GLw4fA9Z3zGjKBdhINUb1Lzi9m/njl/+Wsb73DXgFG2J034LCy95oiD9Gz4A9ty0hhM
	73SYXbSPJYSFkMmP2vUscE4+hqJEZVb7Y1TN5UsY8S8bhdzEiFJA+jkBnNWHllGgcqmP4YBa3pbcU
	eKFFUO/rubElG9/8L545iynxaCfXNcoUaHN1r3Z9ljXVQHgzzjdal9EfYgCH2OoQwPkdmfGgXcwdQ
	x0+STEXEcvAC0C2q62WRiW3eJwH2ZcpmlSKgihUfzxxFz6XcdjFmafjp6Cu+lg28efRv8Y0vDn77P
	LFGOlgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbco-00000002qYG-2f7x;
	Wed, 03 Sep 2025 00:45:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utXs9-00000001xkl-1PTK;
	Tue, 02 Sep 2025 20:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756845895;
	bh=9mYaVXcwwINgcYcqs1+OhrQSIKF/3ISm00ijWDB2Ag8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f0IwJ8PhFoNTjLU0ikOAjocJJrE5hYo78JDB9MYC5lHonD8zBPh0l0LFcmqALDVfk
	 +mqVFFg4a8RjAgzUB3L80io77GxSGfH8pvKbGKk84EkNwGASwdCs7YoUv7x8WIeLqa
	 m4MXoiVx8Jz0rqx0kW2hdrAcMErggxPRopjqMsQuoXPNrW5q839NcFihohPnBN1xV0
	 ZuiK8WZSi3B/rd1PtuJu67MO3F+mymhUgRbsGbpk13ko3mtMSNtA4oeRdlJVwk6LuZ
	 3kOTLndFFp2zz6gwSDkW4uefsPY/ZBeverwCGWGDwB/jtdMNsNOSUvwv7z2rwAdIe0
	 ChkDMFNd+qHEQ==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id B0F9017E137B;
	Tue,  2 Sep 2025 22:44:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Sep 2025 23:44:39 +0300
Subject: [PATCH v4 04/11] phy: rockchip: samsung-hdptx: Consistently use
 [rk_]hdptx_[tmds_] prefixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-phy-hdptx-frl-v4-4-7d69176373ce@collabora.com>
References: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
In-Reply-To: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_134457_535052_787C8599 
X-CRM114-Status: GOOD (  16.23  )
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

Fix the naming inconsistencies for some of the functions and global
variables:

* Add the missing 'rk_hdptx_' prefix to ropll_tmds_cfg variable
* Replace '_ropll_tmds_' with '_tmds_ropll_' globally
* Replace 'hdtpx' with 'hdptx' globally

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 62 +++++++++++------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index a729e15de9e097a54c02ea965c5cc85534338302..44fda739705abc86428fa6fb41c545aceafbb28f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -32,17 +32,17 @@
 #define HDPTX_O_PHY_RDY			BIT(1)
 #define HDPTX_O_SB_RDY			BIT(0)
 
-#define HDTPX_REG(_n, _min, _max)				\
+#define HDPTX_REG(_n, _min, _max)				\
 	(							\
 		BUILD_BUG_ON_ZERO((0x##_n) < (0x##_min)) +	\
 		BUILD_BUG_ON_ZERO((0x##_n) > (0x##_max)) +	\
 		((0x##_n) * 4)					\
 	)
 
-#define CMN_REG(n)			HDTPX_REG(n, 0000, 00a7)
-#define SB_REG(n)			HDTPX_REG(n, 0100, 0129)
-#define LNTOP_REG(n)			HDTPX_REG(n, 0200, 0229)
-#define LANE_REG(n)			HDTPX_REG(n, 0300, 062d)
+#define CMN_REG(n)			HDPTX_REG(n, 0000, 00a7)
+#define SB_REG(n)			HDPTX_REG(n, 0100, 0129)
+#define LNTOP_REG(n)			HDPTX_REG(n, 0200, 0229)
+#define LANE_REG(n)			HDPTX_REG(n, 0300, 062d)
 
 /* CMN_REG(0008) */
 #define OVRD_LCPLL_EN_MASK		BIT(7)
@@ -411,7 +411,7 @@ struct rk_hdptx_phy {
 	unsigned int lanes;
 };
 
-static const struct ropll_config ropll_tmds_cfg[] = {
+static const struct ropll_config rk_hdptx_tmds_ropll_cfg[] = {
 	{ 594000000ULL, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 371250000ULL, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
@@ -456,7 +456,7 @@ static const struct ropll_config ropll_tmds_cfg[] = {
 	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 };
 
-static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
+static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0009), 0x0c),
 	REG_SEQ0(CMN_REG(000a), 0x83),
 	REG_SEQ0(CMN_REG(000b), 0x06),
@@ -546,7 +546,7 @@ static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(009b), 0x10),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0008), 0x00),
 	REG_SEQ0(CMN_REG(0011), 0x01),
 	REG_SEQ0(CMN_REG(0017), 0x20),
@@ -588,14 +588,14 @@ static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(009b), 0x00),
 };
 
-static const struct reg_sequence rk_hdtpx_common_sb_init_seq[] = {
+static const struct reg_sequence rk_hdptx_common_sb_init_seq[] = {
 	REG_SEQ0(SB_REG(0114), 0x00),
 	REG_SEQ0(SB_REG(0115), 0x00),
 	REG_SEQ0(SB_REG(0116), 0x00),
 	REG_SEQ0(SB_REG(0117), 0x00),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_lntop_highbr_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_lntop_highbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0201), 0x00),
 	REG_SEQ0(LNTOP_REG(0202), 0x00),
 	REG_SEQ0(LNTOP_REG(0203), 0x0f),
@@ -603,7 +603,7 @@ static const struct reg_sequence rk_hdtpx_tmds_lntop_highbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0205), 0xff),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_lntop_lowbr_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_lntop_lowbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0201), 0x07),
 	REG_SEQ0(LNTOP_REG(0202), 0xc1),
 	REG_SEQ0(LNTOP_REG(0203), 0xf0),
@@ -611,7 +611,7 @@ static const struct reg_sequence rk_hdtpx_tmds_lntop_lowbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0205), 0x1f),
 };
 
-static const struct reg_sequence rk_hdtpx_common_lane_init_seq[] = {
+static const struct reg_sequence rk_hdptx_common_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0303), 0x0c),
 	REG_SEQ0(LANE_REG(0307), 0x20),
 	REG_SEQ0(LANE_REG(030a), 0x17),
@@ -666,7 +666,7 @@ static const struct reg_sequence rk_hdtpx_common_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0620), 0xa0),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_lane_init_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0312), 0x00),
 	REG_SEQ0(LANE_REG(0412), 0x00),
 	REG_SEQ0(LANE_REG(0512), 0x00),
@@ -970,7 +970,7 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned long long rate,
 	return true;
 }
 
-static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
+static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
@@ -979,9 +979,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 	if (!hdptx->hdmi_cfg.tmds_char_rate)
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (hdptx->hdmi_cfg.tmds_char_rate == ropll_tmds_cfg[i].rate) {
-			cfg = &ropll_tmds_cfg[i];
+	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
+		if (hdptx->hdmi_cfg.tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
+			cfg = &rk_hdptx_tmds_ropll_cfg[i];
 			break;
 		}
 
@@ -1001,8 +1001,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 
 	rk_hdptx_pre_power_up(hdptx);
 
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_cmn_init_seq);
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_cmn_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_cmn_init_seq);
 
 	regmap_write(hdptx->regmap, CMN_REG(0051), cfg->pms_mdiv);
 	regmap_write(hdptx->regmap, CMN_REG(0055), cfg->pms_mdiv_afc);
@@ -1044,25 +1044,25 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 	return ret;
 }
 
-static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
+static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 {
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_sb_init_seq);
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
 	if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
-		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
+		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_highbr_seq);
 	} else {
 		/* For 1/10 bitrate clk */
-		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_lowbr_seq);
+		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_lowbr_seq);
 	}
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0206), 0x07);
 	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
 
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_lane_init_seq);
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lane_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_lane_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lane_init_seq);
 
 	return rk_hdptx_post_enable_lane(hdptx);
 }
@@ -1121,7 +1121,7 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 	if (mode == PHY_MODE_DP) {
 		rk_hdptx_dp_reset(hdptx);
 	} else {
-		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx);
+		ret = rk_hdptx_tmds_ropll_cmn_config(hdptx);
 		if (ret)
 			goto dec_usage;
 	}
@@ -1468,7 +1468,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
 			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
 
-		ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
+		ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
@@ -1491,11 +1491,11 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (hdmi->tmds_char_rate == ropll_tmds_cfg[i].rate)
+	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
+		if (hdmi->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
 			break;
 
-	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
+	if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
 	    !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
 		return -EINVAL;
 
@@ -1920,7 +1920,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * while the latter being executed only once, i.e. when clock remains
 	 * in the prepared state during rate changes.
 	 */
-	return rk_hdptx_ropll_tmds_cmn_config(hdptx);
+	return rk_hdptx_tmds_ropll_cmn_config(hdptx);
 }
 
 static const struct clk_ops hdptx_phy_clk_ops = {

-- 
2.51.0


