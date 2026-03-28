Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E43A10F3DE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y9szUTPyFJGe9h1cbvXwShba41ekHg8+OKaTuXyuXo=; b=SoREMouVlrJ62LFyRPQCHBD8kX
	NyjrP+Bn17HPpLpTw7UOqpMWLymc6IdtDIbuyt0LOtlcBJvIuqf8DsJDnosC2HKokU2ZwMLPhnRur
	RZKuGE1Cd7mRyS6W57/tX/BzldORANP8YtA5U+/y9eUgJxiyWLx7+pSw2DmM+4Gk2mOlzPF2hYN5Z
	YZ9+/nMs3kgfuL5P7U5+rJnRuVj2jsOAZYviEylpzN1eCf/BTGbAcJU4co14j5daSwY3TYlll4FCd
	Xo0slSRg7+eUSmFSlaTOt4yObPPOZjbRrGy1/8BEMlIVcfCPgKOe7xbeo+ZFyNjAoLqVPdetuuNNZ
	pKjFaJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U8H-00000008zly-2SHk;
	Sat, 28 Mar 2026 13:55:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U84-00000008zeg-1clp;
	Sat, 28 Mar 2026 13:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774706104;
	bh=LixLRwS/gYeAuzc200NVhm2SJwSbgTNPuw7cL+mtphg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nHzRdiNuPmHkzrndquE0w8Tw0T/8qnILze85S3fco1vL99HxN+B1vnuY2bWHZ1AU5
	 rogwJ0Da6NK/PtnJ1ra+YnQt4OgJGV3qY8UZVq3an1siiTUM6P5Y9X9KSMUJvtbS+b
	 7mKENR64rhW7F+d00D5gtnScIgiIRcuvk3LTMMuviFeK3RN88zFnadpKictTiypj5e
	 FfQJMeMV36py784hop/i383+lI11bE6uZuv7GzQ8Ye23ZF3pG2/W422wNh0WJMKQem
	 JqungLd1IqL7YVLfQ3gWbEoUZP8OEGE85cpAtVbEkbDqDPu5HJDcY6dl0rh6CPWjG2
	 NY6kpEE7kYcjA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35C6717E5F3E;
	Sat, 28 Mar 2026 14:55:04 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 28 Mar 2026 15:54:55 +0200
Subject: [PATCH 2/2] phy: rockchip: samsung-hdptx: Add support for FRL
 TxFFE level control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-hdptx-ffe-v1-2-53ebd5dea20a@collabora.com>
References: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
In-Reply-To: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_065508_587651_C8957B30 
X-CRM114-Status: GOOD (  14.54  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 74 +++++++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 3bde7fbb34b1..c4669853ad0e 100644
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
@@ -1730,6 +1780,13 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
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
@@ -2076,11 +2133,18 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->pll_config_dirty = true;
-
-			dev_dbg(hdptx->dev, "%s %s rate=%llu bpc=%u\n", __func__,
-				hdptx->hdmi_cfg.mode ? "FRL" : "TMDS",
-				hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
+			if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL &&
+			    opts->hdmi.frl.set_ffe_level) {
+				dev_dbg(hdptx->dev, "%s ffe_level=%u\n", __func__,
+					opts->hdmi.frl.ffe_level);
+				ret = rk_hdptx_frl_ffe_config(hdptx, opts->hdmi.frl.ffe_level);
+			} else {
+				hdptx->pll_config_dirty = true;
+
+				dev_dbg(hdptx->dev, "%s %s rate=%llu bpc=%u\n", __func__,
+					hdptx->hdmi_cfg.mode ? "FRL" : "TMDS",
+					hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
+			}
 		}
 
 		return ret;

-- 
2.52.0


