Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96672C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Emhzjtu7B9zgN3D4ptNVQqXP04jh6Q5dWXGv9oumbQ8=; b=2rRWOqf8FwedR9b28ALF+2m+2g
	Ta/OA0JsUjPgEvj7KYRDhHtYqwJ/QZMrH+BnY6XTi8+qg+g2+/MhLQmMDDmsh/IPLtCI6St2u6eyr
	Jvh4lAJtmCYJotSvF2TpQKQAlsKp+HueByTJBMc8Yw5ZkloKZhz8ScrLrw/+RvQu2bWxDmZR7pJW6
	sHgE1nI6r6cCdLtiVEiJ7WL+8h2giu6RmpmgMs33dtCrjEq5du0C2d7NIVzk09g2eQg4Tb8+fVXfK
	sKXGt3c0c8+F+eXgSbwgCU5AF1ojw+Spy8jJYLpvKGtXDv3kEV2k3DLxwi8nsCzwXgqbpZ9hR9SVi
	Nw0PhY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHrI-00000002srh-2HHr;
	Tue, 04 Mar 2025 02:18:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHKe-00000002o7N-1Aub;
	Tue, 04 Mar 2025 01:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741052666;
	bh=kvaCWKqN9whVxrhljrJzN6WwaA/utmHjHEFf17MONyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dz4J1iLyOWlQWBbmfgufRsZOM9pVw1QxR6PDh5Qqe3UHFjTOSec8B9DO/U4WkNAVI
	 P98uzadJscEc889CsgAlFwOUi0Wlw1l883mAPXAse+cufFc06DPgCG7CDqTlCL9u+a
	 Avtqxd64XEU7Nf1qNyboJU1rtUZ3MReFrTt4lsikhNC9eEZcqWKpI0q/hl9aoGhj3A
	 ezw+sl0xBA1HCHyT+vO9XeGVKl2PQbKF1OdoSiuniKrNrmVnHdkfpcRwfsGUmUMaTD
	 DjSBgbQm8DY5sqybWvQ+/TU3XF8QsREaQiKfg/3hItHfBs9o2EZAUwU2sRAv3/6Fj/
	 gff/AdAva7L/Q==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BC83A17E1067;
	Tue,  4 Mar 2025 02:44:26 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Mar 2025 03:44:10 +0200
Subject: [PATCH v4 11/12] phy: rockchip: samsung-hdptx: Optimize internal
 rate handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-phy-sam-hdptx-bpc-v4-11-8657847c13f7@collabora.com>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_174428_472391_0FB5B5DB 
X-CRM114-Status: GOOD (  16.84  )
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

Drop the rate parameter from a bunch of internal helpers and, instead,
make better use of the newly introduced ->hdmi_cfg.tmds_char_rate driver
data.

Additionally, rename the rather ambiguous ->rate member of struct
rk_hdptx_phy to ->hw_rate and ensure rk_hdptx_ropll_tmds_cmn_config()
updates it only after all the other operations have been successful.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 59 +++++++++++------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index c2ad1cb94614711bea13b7259a6b66dbd72d663d..54210eaec0c0923b3e8eb8e207632983982bcd2f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -401,9 +401,8 @@ struct rk_hdptx_phy {
 
 	/* clk provider */
 	struct clk_hw hw;
-	unsigned long rate;
+	unsigned long hw_rate;
 	bool restrict_rate_change;
-
 	atomic_t usage_count;
 
 	/* used for dp mode */
@@ -968,14 +967,15 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned int data_rate,
 	return true;
 }
 
-static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
-					  unsigned int rate)
+static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 {
+	unsigned int rate = hdptx->hdmi_cfg.tmds_char_rate / 100;
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
-	int i;
+	int ret, i;
 
-	hdptx->rate = rate * 100;
+	if (!rate)
+		return 0;
 
 	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
 		if (rate == ropll_tmds_cfg[i].bit_rate) {
@@ -987,7 +987,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 		if (rk_hdptx_phy_clk_pll_calc(rate, &rc)) {
 			cfg = &rc;
 		} else {
-			dev_err(hdptx->dev, "%s cannot find pll cfg\n", __func__);
+			dev_err(hdptx->dev, "%s cannot find pll cfg for rate=%u\n",
+				__func__, rate);
 			return -EINVAL;
 		}
 	}
@@ -1033,17 +1034,20 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
 			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
-	return rk_hdptx_post_enable_pll(hdptx);
+	ret = rk_hdptx_post_enable_pll(hdptx);
+	if (!ret)
+		hdptx->hw_rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return ret;
 }
 
-static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
-					   unsigned int rate)
+static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
 {
 	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (rate > HDMI14_MAX_RATE / 100) {
+	if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
 	} else {
@@ -1095,8 +1099,7 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 		     HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x0));
 }
 
-static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
-				     unsigned int rate)
+static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 {
 	enum phy_mode mode = phy_get_mode(hdptx->phy);
 	u32 status;
@@ -1115,11 +1118,9 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
 	if (mode == PHY_MODE_DP) {
 		rk_hdptx_dp_reset(hdptx);
 	} else {
-		if (rate) {
-			ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
-			if (ret)
-				goto dec_usage;
-		}
+		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx);
+		if (ret)
+			goto dec_usage;
 	}
 
 	return 0;
@@ -1415,7 +1416,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 {
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
 	enum phy_mode mode = phy_get_mode(phy);
-	unsigned int rate = 0;
 	int ret, lane;
 
 	if (mode != PHY_MODE_DP) {
@@ -1426,16 +1426,15 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 			 * Will be removed as soon the switch to the HDMI PHY
 			 * configuration API has been completed on both ends.
 			 */
-			rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
-			hdptx->hdmi_cfg.tmds_char_rate = rate * 100;
-		} else {
-			rate = hdptx->hdmi_cfg.tmds_char_rate / 100;
+			hdptx->hdmi_cfg.tmds_char_rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+			hdptx->hdmi_cfg.tmds_char_rate *= 100;
 		}
-		dev_dbg(hdptx->dev, "%s rate=%u bpc=%u\n",
-			__func__, rate, hdptx->hdmi_cfg.bpc);
+
+		dev_dbg(hdptx->dev, "%s tmds_rate=%llu bpc=%u\n", __func__,
+			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
 	}
 
-	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
+	ret = rk_hdptx_phy_consumer_get(hdptx);
 	if (ret)
 		return ret;
 
@@ -1466,7 +1465,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
 			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
 
-		ret = rk_hdptx_ropll_tmds_mode_config(hdptx, rate);
+		ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
@@ -1851,7 +1850,7 @@ static int rk_hdptx_phy_clk_prepare(struct clk_hw *hw)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	return rk_hdptx_phy_consumer_get(hdptx, hdptx->rate / 100);
+	return rk_hdptx_phy_consumer_get(hdptx);
 }
 
 static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)
@@ -1866,7 +1865,7 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	return hdptx->rate;
+	return hdptx->hw_rate;
 }
 
 static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -1918,7 +1917,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * while the latter being executed only once, i.e. when clock remains
 	 * in the prepared state during rate changes.
 	 */
-	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
+	return rk_hdptx_ropll_tmds_cmn_config(hdptx);
 }
 
 static const struct clk_ops hdptx_phy_clk_ops = {

-- 
2.48.1


