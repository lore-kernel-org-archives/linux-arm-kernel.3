Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA811C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUKWm2kS+c4by5diK/YXNvGZ0jSMIfi93E2UnQplowM=; b=HY7jrWGydI3u0MjgtSF035cs6H
	jBPowPnIpBt/lXWOzI5a8g8iMw9tRPWuDaNswhP4r/y/4o2YqPe0ZipuYAElk2Zo2nOY5J8fBL/xL
	89hZS6kcCIG+eBFFORwb/GfHiIgt0cAMqIkdeYWPefxt2bi9OJqfKpqC2aUmdJ470YXsmLYrhW99y
	mdbntmReT3l/y0FrmSA87uePXV2bg6nywfFPahNijdykNrXAoTTgJ/3Ow8N6Vs/m/OxA6J9ju8MWd
	ZL3WltoUuQSloXtaSazAbiYTt6xXvaxrFjcKwX0DiMWG3QHRY01buv8qKRrQEBCl6oG84ZxvuuF0f
	UmE4Gm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFYB-00000006beU-3g6S;
	Tue, 08 Jul 2025 21:08:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE8I-00000006MG7-2Bmc;
	Tue, 08 Jul 2025 19:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752003457;
	bh=5dQ0pMExHH9Kjg4AVLoBbYdvBCDQ1/JHCihaKBltBb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LFiLadoq64Rz6aYjArqW0oWTXmLocN72v0RZ1QXbunm/QFUdFqoLlFSNpEhVinx3n
	 KixD8na1alhHioEjy5qgrih/Kqa67Jgk1AmtSa/jUbTU/ufflBfOWVUieL6uOfmpj/
	 j0z+JAquSpCb610JnRibgb7xj7UpciCdTO/OMt+rbSnHrD9tF9FNL5Q5tcpOMvWYLx
	 vPNyf4iG61yyeYl5H+YuerZxDDg2ujbw6HAURBUdfOieXmZtowojbQMJ8WUyWERM9H
	 SbvznXbuhc8+/LM/C6x/8Js2rEz2VgD6abn0ScZmfrpRiHeLDQs0or3bQvqA3K4u91
	 i6XmkdNrDhH+g==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0411817E097F;
	Tue,  8 Jul 2025 21:37:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 08 Jul 2025 22:35:52 +0300
Subject: [PATCH 11/12] phy: rockchip: samsung-hdptx: Extend
 rk_hdptx_phy_verify_hdmi_config() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-phy-hdptx-frl-v1-11-cfe096e224f4@collabora.com>
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
X-CRM114-CacheID: sfid-20250708_123738_716462_9AE2885C 
X-CRM114-Status: GOOD (  13.78  )
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

In order to facilitate introduction of HDMI 2.1 FRL support and to avoid
recomputing the link rate after verifying the HDMI configuration given
as input, extend rk_hdptx_phy_verify_hdmi_config() by providing an
optional output parameter to store the validated configuration.

For improved code readability, also rename the existing hdmi input
parameter.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 35 ++++++++++++-----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 325d2596395123b88e4720cb503bee4436292e85..daccaf134c0ee36972f8f7c0eebf3dac86faeff1 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1477,25 +1477,24 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
 }
 
 static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
-					   struct phy_configure_opts_hdmi *hdmi)
+					   struct phy_configure_opts_hdmi *hdmi_in,
+					   struct rk_hdptx_hdmi_cfg *hdmi_out)
 {
 	int i;
 
-	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
+	if (!hdmi_in->tmds_char_rate || hdmi_in->tmds_char_rate > HDMI20_MAX_RATE)
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
-		if (hdmi->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
+		if (hdmi_in->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
 			break;
 
 	if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
-	    !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
+	    !rk_hdptx_phy_clk_pll_calc(hdmi_in->tmds_char_rate, NULL))
 		return -EINVAL;
 
-	if (!hdmi->bpc)
-		hdmi->bpc = 8;
-
-	switch (hdmi->bpc) {
+	switch (hdmi_in->bpc) {
+	case 0:
 	case 8:
 	case 10:
 	case 12:
@@ -1505,6 +1504,11 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 		return -EINVAL;
 	}
 
+	if (hdmi_out) {
+		hdmi_out->rate = hdmi_in->tmds_char_rate;
+		hdmi_out->bpc = hdmi_in->bpc ?: 8;
+	}
+
 	return 0;
 }
 
@@ -1770,17 +1774,15 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 	int ret;
 
 	if (mode != PHY_MODE_DP) {
-		ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi);
+		ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi, &hdptx->hdmi_cfg);
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->hdmi_cfg.rate = opts->hdmi.tmds_char_rate;
-			hdptx->hdmi_cfg.bpc = opts->hdmi.bpc;
 			hdptx->restrict_rate_change = true;
+			dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+				hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		}
 
-		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		return ret;
 	}
 
@@ -1824,7 +1826,7 @@ static int rk_hdptx_phy_validate(struct phy *phy, enum phy_mode mode,
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
 
 	if (mode != PHY_MODE_DP)
-		return rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi);
+		return rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi, NULL);
 
 	return rk_hdptx_phy_verify_dp_config(hdptx, &opts->dp);
 }
@@ -1966,12 +1968,11 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 		struct phy_configure_opts_hdmi hdmi = {
 			.tmds_char_rate = rate,
 		};
-		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
+
+		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi, &hdptx->hdmi_cfg);
 
 		if (ret)
 			return ret;
-
-		hdptx->hdmi_cfg.rate = rate;
 	}
 
 	/*

-- 
2.50.0


