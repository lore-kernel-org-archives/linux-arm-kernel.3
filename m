Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB9C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oorCmDuTuOwOAKRI6FKp5odqautTQUZvocOog8AXXgo=; b=KL2ygwIYZGlw77W6PujoimKbR8
	gYKMp8UxWROl4p7SaqwmWrMTlShUs8CB9k9qJl2Ou7pJbzS0ADqAJWeFG4N26dC+sMY0LdmZVxguM
	TvzST8jXhy4CvtnxaQputsZamR6dBt3CZH7RuWzmP9IrZ2bc7DkVXeimDWnSwqUK+n0mhcPCcbSJH
	wn0D+NuzP04tZYFveprGLU3P0rv1Nq5Maytmtxj9BcSeBd5JPJMDKFJECHkN8kwT4viwmF9N00ED1
	GQaMt62Q9rBcYvXsmlA4xZbocv9tYHYJsKYrH8+dii+CBCJyzMPf3iY/3qPSSKEh+b2x9hQ4sXLzT
	HFNZlqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubt-0000000DGtJ-1kQi;
	Tue, 01 Sep 2026 19:57:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubq-0000000DGnb-2dpX;
	Tue, 01 Sep 2026 19:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292645;
	bh=5+//jJMis2DTE/0hiz65W/T5XYb9Lv/1gpdVa6A5mio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GFvon9g7x4fUT1VdcNt3Q86mI6IjNsKMXP9weCH+QkYRnbOfgR9P/udvfiMcn5iG7
	 vIMq3SXs6B9rOHW2gVUHmbEEOwOaE13lMhsemKCjfhXlsDCIMRlm6pAODM0fel4l/b
	 Z7etHCzlPiAWpiCZko5cGLSNz/KNIuFxC3MMZ9U25qflATwbHueNh7YbL+JCW8FAc/
	 XLHR7QKJbTrxKwVoCNo7iPvtLrm9VhOIuZ04BFdJK4g8gUg6TGlTVvws9TrVMBRSbn
	 +4o60HMDJRgUPhZD4QQWUMtVBMvX2P1KaOsS91J3q8o7QiFE4xzxSNy5AgPZyGGpXq
	 V9XzkX+/b45cQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D14917E0CAB;
	Tue, 01 Sep 2026 21:57:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 22:55:15 +0300
Subject: [PATCH v2 3/3] phy: rockchip: samsung-hdptx: Add support for FRL
 TxFFE level control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-hdptx-ffe-v2-3-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125730_845918_D942A9F3 
X-CRM114-Status: GOOD (  15.32  )
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

During HDMI 2.1 FRL link training, the source may need to incrementally
raise the TxFFE level in response to persistent link failures reported
by the sink during LTS3.  The phy_configure_opts_hdmi struct now carries
ffe_level and set_ffe_level fields to convey such an update
independently of a full rate reconfiguration.

Wire up the optional TxFFE control in the Samsung HDPTX PHY driver.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 72 +++++++++++++++++++++--
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index b03042ec9a84..6879eecc5a9f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -333,6 +333,7 @@
 #define FRL_3G3L_RATE			900000000
 #define FRL_6G3L_RATE			1800000000
 #define FRL_8G4L_RATE			3200000000
+#define FRL_FFE_MAX_LEVEL		3
 
 enum dp_link_rate {
 	DP_BW_RBR,
@@ -466,6 +467,16 @@ static const struct ropll_config rk_hdptx_tmds_ropll_cfg[] = {
 	{  25175000ULL,   84,    84,    1,    1,   15,  1,  168,    1,  16,  4,   1,    1, },
 };
 
+static const struct ffe_config {
+	u8 pre_shoot;
+	u8 de_emphasis;
+} rk_hdptx_frl_ffe_cfg[FRL_FFE_MAX_LEVEL + 1] = {
+	{ 0x3, 0x4 },
+	{ 0x3, 0x6 },
+	{ 0x3, 0x8 },
+	{ 0x3, 0x9 },
+};
+
 static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0009), 0x0c),
 	REG_SEQ0(CMN_REG(000a), 0x83),
@@ -1321,6 +1332,45 @@ static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 	return rk_hdptx_post_enable_lane(hdptx);
 }
 
+static int rk_hdptx_frl_ffe_config(struct rk_hdptx_phy *hdptx, u8 ffe_level)
+{
+	u8 val;
+
+	if (ffe_level > FRL_FFE_MAX_LEVEL)
+		return -EINVAL;
+
+	val = rk_hdptx_frl_ffe_cfg[ffe_level].pre_shoot;
+
+	regmap_update_bits(hdptx->regmap, LANE_REG(0305),
+			   LN_TX_DRV_PRE_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_PRE_LVL_CTRL_MASK, val));
+	regmap_update_bits(hdptx->regmap, LANE_REG(0405),
+			   LN_TX_DRV_PRE_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_PRE_LVL_CTRL_MASK, val));
+	regmap_update_bits(hdptx->regmap, LANE_REG(0505),
+			   LN_TX_DRV_PRE_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_PRE_LVL_CTRL_MASK, val));
+	regmap_update_bits(hdptx->regmap, LANE_REG(0605),
+			   LN_TX_DRV_PRE_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_PRE_LVL_CTRL_MASK, val));
+
+	val = rk_hdptx_frl_ffe_cfg[ffe_level].de_emphasis;
+
+	regmap_update_bits(hdptx->regmap, LANE_REG(0304),
+			   LN_TX_DRV_POST_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_POST_LVL_CTRL_MASK, val));
+	regmap_update_bits(hdptx->regmap, LANE_REG(0404),
+			   LN_TX_DRV_POST_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_POST_LVL_CTRL_MASK, val));
+	regmap_update_bits(hdptx->regmap, LANE_REG(0504),
+			   LN_TX_DRV_POST_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_POST_LVL_CTRL_MASK, val));
+	regmap_update_bits(hdptx->regmap, LANE_REG(0604),
+			   LN_TX_DRV_POST_LVL_CTRL_MASK,
+			   FIELD_PREP(LN_TX_DRV_POST_LVL_CTRL_MASK, val));
+	return 0;
+}
+
 static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 {
 	reset_control_assert(hdptx->rsts[RST_LANE].rstc);
@@ -1735,6 +1785,13 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 		unsigned long long frl_rate = 100000000ULL * hdmi_in->frl.lanes *
 					      hdmi_in->frl.rate_per_lane;
 
+		if (hdmi_in->frl.set_ffe_level) {
+			if (hdmi_in->frl.ffe_level > FRL_FFE_MAX_LEVEL)
+				return -EINVAL;
+
+			return 0;
+		}
+
 		switch (hdmi_in->frl.rate_per_lane) {
 		case 3:
 		case 6:
@@ -2081,11 +2138,18 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->pll_config_dirty = true;
+			if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL &&
+			    opts->hdmi.frl.set_ffe_level) {
+				dev_dbg(hdptx->dev, "%s ffe_level=%u\n", __func__,
+					opts->hdmi.frl.ffe_level);
+				ret = rk_hdptx_frl_ffe_config(hdptx, opts->hdmi.frl.ffe_level);
+			} else {
+				hdptx->pll_config_dirty = true;
 
-			dev_dbg(hdptx->dev, "%s %s rate=%llu bpc=%u\n", __func__,
-				hdptx->hdmi_cfg.mode ? "FRL" : "TMDS",
-				hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
+				dev_dbg(hdptx->dev, "%s %s rate=%llu bpc=%u\n", __func__,
+					hdptx->hdmi_cfg.mode ? "FRL" : "TMDS",
+					hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
+			}
 		}
 
 		return ret;

-- 
2.55.0


