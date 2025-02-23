Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5570BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPDjoaWYpflvHKwJ/JR9mj3sUG6V4zvtxeviXhpie2k=; b=RWx1XaXKZhp5Ax4+nMx+tfcGgj
	mJu2+lfcIK0FEvHyeAMRqMaFLN5st7+EQdAcTS+MpYPc1vDt0GrWn89ua9cL5zEds2WzBzy0C9+Vo
	9DbQiPbE4tug8EtcKa8vb94/PX343Ecj/Zp9poI8gknq6N2Rona3ZYiS4BrJqJIq7EKwKD4YNHzTe
	K5i2r8gOx/Q+LOI63fOv2RB+/uTqVzpRm77BiwHp0mnhtPCdoma8eevPlDysZMMh1g1Yz2eHiBv1p
	S0zbf7uwsm/rXWhcuTFyLJrs9SdlxKXjaa8Mdc3h6Os6LlghBSGq8v3Gy6CLgxWaXV10zN3L/t8Y8
	I3P+fz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9wI-0000000AwpI-1XV4;
	Sun, 23 Feb 2025 11:14:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9kn-0000000AusL-0O2W;
	Sun, 23 Feb 2025 11:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740308551;
	bh=0dn21Kt3/3x2MUjvwMowS6nDRN6vgqToU9gCl2sx3Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TmbmcNdQzhl5jplBgNx4a8dNssqfY/l/mbYDtpkuYUPcO0SVkhS0GB+ttgN355ZGM
	 r5nceZR0gSbg3HGegxKLLfqkh1QKW9H1BAvnA4VBL371gqEwW5FcspRmdDLcVLHPJ5
	 ZwkW5vwWmxtEHidrM3P33Jf5bsZDPsAtF8BrxSYt/haBW7olBbrngPjgeuxYFJSBDO
	 Tz8vcuaLjZkejSKkXlevjmrOlaHTfZWL1Fn/DgzW8KkvoeLblIH+jAkPT/zATtBL6k
	 +E1Y74hQWXahkZmOKQZPoJ6VtoSXyoyP3hNmVTnUyzQBVLAMWXYmHoOr5ARyUJYkXl
	 zJV8v8IBzbH5g==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9D42617E087E;
	Sun, 23 Feb 2025 12:02:31 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 23 Feb 2025 13:02:14 +0200
Subject: [PATCH v3 7/8] phy: rockchip: samsung-hdptx: Cleanup internal rate
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-phy-sam-hdptx-bpc-v3-7-66a5c8e68327@collabora.com>
References: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
In-Reply-To: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
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
X-CRM114-CacheID: sfid-20250223_030233_277670_1FE71627 
X-CRM114-Status: GOOD (  12.36  )
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
make better use of the newly introduced ->tmds_char_rate driver data.

No functional changes intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 ++++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 792ed3d1459f84e735041f55cac15941f6f785ef..fdac60bb87510002626735e0e9f18ad5de9a6642 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1042,14 +1042,13 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	return rk_hdptx_post_enable_pll(hdptx);
 }
 
-static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
-					   unsigned int rate)
+static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
 {
 	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (rate > HDMI14_MAX_RATE / 100) {
+	if (hdptx->tmds_char_rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
 	} else {
@@ -1101,10 +1100,10 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 		     HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x0));
 }
 
-static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
-				     unsigned int rate)
+static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 {
 	enum phy_mode mode = phy_get_mode(hdptx->phy);
+	unsigned long rate;
 	u32 status;
 	int ret;
 
@@ -1121,8 +1120,9 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
 	if (mode == PHY_MODE_DP) {
 		rk_hdptx_dp_reset(hdptx);
 	} else {
+		rate = hdptx->tmds_char_rate ?: hdptx->rate;
 		if (rate) {
-			ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
+			ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
 			if (ret)
 				goto dec_usage;
 		}
@@ -1420,23 +1420,24 @@ static int rk_hdptx_dp_aux_init(struct rk_hdptx_phy *hdptx)
 static int rk_hdptx_phy_power_on(struct phy *phy)
 {
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
-	unsigned int rate = hdptx->tmds_char_rate / 100;
 	enum phy_mode mode = phy_get_mode(phy);
 	int ret, lane;
 
-	if (rate == 0) {
+	if (!hdptx->tmds_char_rate) {
 		/*
 		 * FIXME: Temporary workaround to setup TMDS char rate
 		 * from the RK HDMI bridge driver.
 		 * Will be removed as soon the switch to the HDMI PHY
 		 * configuration API has been completed on both ends.
 		 */
-		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+		hdptx->tmds_char_rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+		hdptx->tmds_char_rate *= 100;
 	}
 
-	dev_dbg(hdptx->dev, "%s rate=%u bpc=%u\n", __func__, rate, hdptx->bpc);
+	dev_dbg(hdptx->dev, "%s tmds_rate=%lu bpc=%u\n", __func__,
+		hdptx->tmds_char_rate, hdptx->bpc);
 
-	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
+	ret = rk_hdptx_phy_consumer_get(hdptx);
 	if (ret)
 		return ret;
 
@@ -1467,7 +1468,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
 			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
 
-		ret = rk_hdptx_ropll_tmds_mode_config(hdptx, rate);
+		ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
@@ -1811,7 +1812,7 @@ static int rk_hdptx_phy_clk_prepare(struct clk_hw *hw)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	return rk_hdptx_phy_consumer_get(hdptx, hdptx->rate / 100);
+	return rk_hdptx_phy_consumer_get(hdptx);
 }
 
 static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)

-- 
2.48.1


