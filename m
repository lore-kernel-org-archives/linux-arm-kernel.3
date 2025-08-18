Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D1FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATb/bUC7EPq9Hrd5zOEHNqw+dOLlz8aLp2Mw844qobk=; b=pQolZTTKufcCs4pvp7N1Rp2PjE
	tAWUrfdgjC6mxs8+mZfxGX2cdNS5bQ4BuAsrjRugWL6zWj1GES15MCpoOnLZbSnpgGAlofBMoWoz8
	H1pjwoBw90ZKQlBUVeW+MP6zzyf0pb9xBdj41sK1Eqay/2mXmx/pD/zEKKhypRLNRccCLmam2Qdp8
	fqZtATio2KpDWwkDJspILyX1PxZFDJ8QsonLLKJHEwGKa0JgE5L4H96dtWh3ix9yStQrr7pBpm6/G
	ae2Czv+1MNT52lN3ffhh2w4WgSNdDMCwuPK0AvznYpoeD1ufcJn9/TwnwIkV6FQuc0VUifSebM+6s
	ayOh0EiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6Kh-00000008c25-21r0;
	Mon, 18 Aug 2025 20:19:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo54t-00000008R5v-0mgU;
	Mon, 18 Aug 2025 18:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755543569;
	bh=3v4x3zxxSv/DMh8sZ3aghZ0klTzJuuVsEo2Khohp9D8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lw9kLHgcWsNc+l2SIreCI/el7tPlc3CODmRC0QqGAxDUdjSQkgQt/Ny60jQWz5Azy
	 lhDmBejf+aRlFQx9ZoZbaZ0tPUHQPAHm5tKKpTQbmmK5fHCTEPcVwm92v3yWrCgQJS
	 j52gwmyCYc6xOdhD8bZuCeYkO+e1gp3ZBf5AKUFwsYSM+wK5yjguBsGA+HwaeyXRAU
	 qlzl1Jc6BIf1j4Hnm3PsT7HOL5v1BhTvPRUBm4p09RM6QYv5VqMWaeVbMnBm1Aqk8Q
	 hS9nK9VM1vdfx1o714710cV66X5ALFFy3JGsakz4NjsUJInWlr3AZe9ZefVuel09wM
	 f/GrfupIAuloA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id B671D17E04C0;
	Mon, 18 Aug 2025 20:59:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 18 Aug 2025 21:59:12 +0300
Subject: [PATCH v3 12/14] phy: rockchip: samsung-hdptx: Switch to driver
 specific HDMI config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-phy-hdptx-frl-v3-12-c79997d8bb2b@collabora.com>
References: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
In-Reply-To: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115931_520110_C694078B 
X-CRM114-Status: GOOD (  18.70  )
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

In preparation to support the FRL operation mode which gets configured
via the lanes and rate per lane tuple, switch to a driver specific
struct for configuring the link rate and bpc.

This simplifies and optimizes the implementation by allowing implicit
switches between TMDS and FRL rates, without requiring additional checks
of the active PHY mode followed by recalculations of the link rate when
operating in FRL mode.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 44 +++++++++++++----------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 4195387108d8786c2b7cabb6d2f3c07315fefd88..a44614bc73e9461d4d38663776f547f595169c3b 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -387,6 +387,11 @@ struct rk_hdptx_phy_cfg {
 	unsigned int phy_ids[MAX_HDPTX_PHY_NUM];
 };
 
+struct rk_hdptx_hdmi_cfg {
+	unsigned long long rate;
+	unsigned int bpc;
+};
+
 struct rk_hdptx_phy {
 	struct device *dev;
 	struct regmap *regmap;
@@ -394,7 +399,7 @@ struct rk_hdptx_phy {
 
 	int phy_id;
 	struct phy *phy;
-	struct phy_configure_opts_hdmi hdmi_cfg;
+	struct rk_hdptx_hdmi_cfg hdmi_cfg;
 	struct clk_bulk_data *clks;
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];
@@ -965,19 +970,19 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	struct ropll_config rc = {0};
 	int i;
 
-	if (!hdptx->hdmi_cfg.tmds_char_rate)
+	if (!hdptx->hdmi_cfg.rate)
 		return 0;
 
 	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
-		if (hdptx->hdmi_cfg.tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
+		if (hdptx->hdmi_cfg.rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
 			cfg = &rk_hdptx_tmds_ropll_cfg[i];
 			break;
 		}
 
 	if (!cfg) {
-		if (!rk_hdptx_phy_clk_pll_calc(hdptx->hdmi_cfg.tmds_char_rate, &rc)) {
+		if (!rk_hdptx_phy_clk_pll_calc(hdptx->hdmi_cfg.rate, &rc)) {
 			dev_err(hdptx->dev, "%s cannot find pll cfg for rate=%llu\n",
-				__func__, hdptx->hdmi_cfg.tmds_char_rate);
+				__func__, hdptx->hdmi_cfg.rate);
 			return -EINVAL;
 		}
 
@@ -985,7 +990,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	}
 
 	dev_dbg(hdptx->dev, "%s rate=%llu mdiv=%u sdiv=%u sdm_en=%u k_sign=%u k=%u lc=%u\n",
-		__func__, hdptx->hdmi_cfg.tmds_char_rate, cfg->pms_mdiv, cfg->pms_sdiv + 1,
+		__func__, hdptx->hdmi_cfg.rate, cfg->pms_mdiv, cfg->pms_sdiv + 1,
 		cfg->sdm_en, cfg->sdm_num_sign, cfg->sdm_num, cfg->sdm_deno);
 
 	rk_hdptx_pre_power_up(hdptx);
@@ -1034,7 +1039,7 @@ static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
+	if (hdptx->hdmi_cfg.rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_highbr_seq);
 	} else {
@@ -1405,19 +1410,19 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 	int ret, lane;
 
 	if (mode != PHY_MODE_DP) {
-		if (!hdptx->hdmi_cfg.tmds_char_rate) {
+		if (!hdptx->hdmi_cfg.rate) {
 			/*
 			 * FIXME: Temporary workaround to setup TMDS char rate
 			 * from the RK DW HDMI QP bridge driver.
 			 * Will be removed as soon the switch to the HDMI PHY
 			 * configuration API has been completed on both ends.
 			 */
-			hdptx->hdmi_cfg.tmds_char_rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
-			hdptx->hdmi_cfg.tmds_char_rate *= 100;
+			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+			hdptx->hdmi_cfg.rate *= 100;
 		}
 
 		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
+			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 	}
 
 	ret = rk_hdptx_phy_consumer_get(hdptx);
@@ -1764,12 +1769,13 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->hdmi_cfg = opts->hdmi;
+			hdptx->hdmi_cfg.rate = opts->hdmi.tmds_char_rate;
+			hdptx->hdmi_cfg.bpc = opts->hdmi.bpc;
 			hdptx->restrict_rate_change = true;
 		}
 
 		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
+			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		return ret;
 	}
 
@@ -1949,7 +1955,7 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.rate) {
 		struct phy_configure_opts_hdmi hdmi = {
 			.tmds_char_rate = rate,
 		};
@@ -1958,7 +1964,7 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (ret)
 			return ret;
 
-		hdptx->hdmi_cfg = hdmi;
+		hdptx->hdmi_cfg.rate = rate;
 	}
 
 	/*
@@ -1966,7 +1972,7 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8, hdptx->hdmi_cfg.bpc);
+	return DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.rate * 8, hdptx->hdmi_cfg.bpc);
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1976,10 +1982,10 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long long tmds_rate = DIV_ROUND_CLOSEST_ULL(rate * hdptx->hdmi_cfg.bpc, 8);
 
 	/* Revert any unlikely TMDS char rate change since round_rate() */
-	if (hdptx->hdmi_cfg.tmds_char_rate != tmds_rate) {
+	if (hdptx->hdmi_cfg.rate != tmds_rate) {
 		dev_warn(hdptx->dev, "Reverting unexpected rate change from %llu to %llu\n",
-			 tmds_rate, hdptx->hdmi_cfg.tmds_char_rate);
-		hdptx->hdmi_cfg.tmds_char_rate = tmds_rate;
+			 tmds_rate, hdptx->hdmi_cfg.rate);
+		hdptx->hdmi_cfg.rate = tmds_rate;
 	}
 
 	/*

-- 
2.50.1


