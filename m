Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7DCC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw0FamSdrQ4+gU7nLkKB9teMb+2bVQ2eAEEuj7UtQLA=; b=SszbFP7Gcg0FAgb9W8nfgjPTxf
	7Tz/Q1kFzPZKzHI67OBeVp8ipXXi4uJhSjn2G1pVbUgRFqzDD2Ae95sTxdnt71vvA5sBLHNRUS/ki
	pH3z730zezJ/TvwrbQ3uRlug3eJMkw9S88+OZYkmXnwcXQh2QZVOKoUeO5BrnbnVzl2BcQhVXr9+9
	w47eNc+5RqREckCK37jgBed3DOCi5Yc1UcqQLs+cKBmnZLkWihVuiF6fgrftL7GKPfpsCI5Q4+kZR
	VVXXey41FCZ3h8AZxqrpFLQxTxBLSI0VntV0uwJ4fB8ZxVS2Y4ZQESN7ohzxQiPQ/Ks04MPJw+Jos
	UaIRfDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEsL-00000006VTt-1UXO;
	Tue, 08 Jul 2025 20:25:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE84-00000006MBD-1ykP;
	Tue, 08 Jul 2025 19:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752003442;
	bh=i9TlU6zQOP4Mil63hhLUEMQd6pKZa3hVhEBVYeINY4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F1TatavHPDVKgOuXaNeCylKwVZTW6t/I3IWiZRFDA33Iu6qrq52mWEHpTIDMMk874
	 /dNw0Dtw6VIsVt3G+w11BDg0F4+6jT1kbAbfXgRuVZr5Oc9uT3rxZv4muS/AlJ/g5l
	 gyy2JNKndkcMBqrqwgZ5uIv7nxJymoQSOt8APbHUGVu4NsJQSWXENB5WImuguihVbN
	 LlJKRRtpcm20F1aduPIs25LXPZy9DsueDIEUXQP/CgbKX2oMGLbM8QSX14YNYiYb4E
	 Hw4ygbDS3R2AP3dK+oxRHS/UWaS2CKB4R2Fs4mkjgTjEaIomevPgbacp6xVolccooq
	 stYyddaP37KaA==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9903B17E097F;
	Tue,  8 Jul 2025 21:37:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 08 Jul 2025 22:35:47 +0300
Subject: [PATCH 06/12] phy: rockchip: samsung-hdptx: Consistently use
 [rk_]hdptx_[tmds_] prefixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-phy-hdptx-frl-v1-6-cfe096e224f4@collabora.com>
References: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
In-Reply-To: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123724_864045_11A7E58F 
X-CRM114-Status: GOOD (  15.93  )
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
index 9d21a26bce460b7b4da0db9692f78a9fd1068abf..21b8ed427baf338300a0bce813037a54121e9ed9 100644
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
@@ -971,7 +971,7 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned long long rate,
 	return true;
 }
 
-static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
+static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
@@ -980,9 +980,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
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
 
@@ -1002,8 +1002,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 
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
 
@@ -1919,7 +1919,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * while the latter being executed only once, i.e. when clock remains
 	 * in the prepared state during rate changes.
 	 */
-	return rk_hdptx_ropll_tmds_cmn_config(hdptx);
+	return rk_hdptx_tmds_ropll_cmn_config(hdptx);
 }
 
 static const struct clk_ops hdptx_phy_clk_ops = {

-- 
2.50.0


