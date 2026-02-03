Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44344E87859
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHsIsI8mXDnDVi1XXYwUVIxlfImSFPCv8/kNtzZvJSc=; b=FlZxkybVjB6iwhn5J8n2ePqytB
	LJ9N4mevSq4MMKBrw5JGYp2jwtLCOsScseOpP93mbxrA04tdh1XbOfnHZGBHP+za9PpA/cnTvwohE
	6UAMu2oci3hN1y00Zylxy1TkjHmNsbzckpAwiRqPJ0QxcDamOaX/rI4XQ0u0UqjKcN1svL4qMO8/d
	tkfAVphLpLaPcW2XdhjbCyp1XiphEwjhzMK3vghnbWJQ1+/4AbyVqncoZ9jTd7mRH2JZsys1Jy7hC
	Peg6WnacHJBA5ARHm+n1nj99qgRckf12TtZO+JluuhaheLXMncj0KX3HQSwy+ZiGamwkrJTyIlz76
	ZuyWESEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLn-00000007AsT-0UZ1;
	Tue, 03 Feb 2026 18:42:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLk-00000007Aqp-26Dw;
	Tue, 03 Feb 2026 18:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144125;
	bh=SvtKIo2y+sKOp+YtC+da7+YPXlC5HgI2IYRFSePlh/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lQtVRfqTSj3NR+5/997m2rrQx1mAtIcsIapWSeFfxIZgO/6DYPk2d3IxaNqC7LmrQ
	 JkCW2r7XaRfRCVYPHiH1mnh0pOubaVsK7elLiwS1XxstVGLImcHtqR0FmdLRqavU+n
	 HWmRacfoaPTjdy0IMKn46k+IShKLhRfjz0qAmhHzUKxkHc/CHuTflUbfzJFjiWOtgd
	 VTV1cSIaOxkRPw2LIhsv5lo1L3iX+9qmobixEouGW4FRdFt1ZTCvPnCZhErETyJlIh
	 c49pm7FnMs6LZfU8AahlKtSPeDhObFJRiZM1nW5ii8hVPNpo5bQFaaG3obLP+jV0Ql
	 IDuyyUdoBy3cQ==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8841E17E14D8;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 4E17C480029; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:30 +0100
Subject: [PATCH 4/7] phy: rockchip: usbdp: Support single-lane DP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-4-16a6f92ed176@collabora.com>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
In-Reply-To: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5209;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=H3Fz2DEtOEQhk9K2oOowHJYENYfYQBLq7M6ENd/11/I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX0d7sAhQ7/ntTw8u0Ks3J/nCDsx3Ro+x
 kr0UweGRwFUjYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qaNe4P/1BiyrpHjbCQn4EJ8POqANqkRWZ5Q0oyUiuwsZ20Z/4RaW5fY8nIQNgKal/3nwd0RZ9
 juJkZj39g5JmWHI8v0U5LHZTCYqL4yBMYomnWrgynfYLsOER4g1g1Y+WzccJGEbl4Uy6LjmaZH0
 jKsox9VzGnBk3m3Am+1NfrKfyM1/LrNR4v+zZi/aNGHsaLK3P/8477BByXRzRn2Dt6yF7CH2pE7
 8jX6BUdeHNu+LrN0+Nr8lhsp3OJFBhHxyaQgh/uw5ywXNd0QWLikbj5DWMUaKOokcvYd6RJgr5q
 uQjCRharMVpmMubTQC2foXczHyxE//VZVA6RPXLMFF5bUDRw0eULNeQsR9zHdr+KXXP7UOwx+Db
 LEOizjKb0rbOBTf9/UWszUKpoEICXa+yxJ51dzeTzA610MdF4xzCv2x0nLgxiAe+StPGB3imxvJ
 XXsVGVBnKd5R++0Gt7JfjgjRX3Ymg1m9MSthF/NFjkwozVXhy7e8yf7VASu1/Lm+0H6MqFYnn65
 S3saqzdpV3nQhKzw7e8D5uT4trj387RCAOoNKB14ENiNvrf3y0KVMl//7UP1n6tJVnbmbuW6lzW
 jWVNygcb2WE0Ku4DAESb/5nVKXHPP+ilRcWl3qG5TiD9UgQQKfLY1bZamsA9SqEO+xoSWqFEkQk
 rYpTuW5gmFIL5GEn5Lko0ug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_104208_712599_86A8AC50 
X-CRM114-Status: GOOD (  13.16  )
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

From: Zhang Yubing <yubing.zhang@rock-chips.com>

Implement support for using just a single DisplayPort line.

Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 61 +++++++++++++------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5304e2d86d11..29cf3f3bcec4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -193,6 +193,7 @@ struct rk_udphy {
 	int id;
 
 	bool dp_in_use;
+	int dp_lanes;
 
 	/* PHY const config */
 	const struct rk_udphy_cfg *cfgs;
@@ -537,6 +538,13 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * <0 1>                  dpln0         dpln1       usbrx         usbtx
  * <2 3>                  usbrx         usbtx       dpln0         dpln1
  * ---------------------------------------------------------------------------
+ * if 1 lane for dp function, 2 lane for usb function, define rockchip,dp-lane-mux = <x>;
+ * sample as follow:
+ * ---------------------------------------------------------------------------
+ *                        B11-B10       A2-A3       A11-A10       B2-B3
+ * rockchip,dp-lane-mux   ln0(tx/rx)    ln1(tx)     ln2(tx/rx)    ln3(tx)
+ * <0>                    dpln0         \           usbrx         usbtx
+ * ---------------------------------------------------------------------------
  */
 
 static void rk_udphy_dplane_select(struct rk_udphy *udphy)
@@ -544,18 +552,18 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
 
-	switch (udphy->mode) {
-	case UDPHY_MODE_DP:
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
+	switch (udphy->dp_lanes) {
+	case 4:
 		value |= 3 << udphy->dp_lane_sel[3] * 2;
+		value |= 2 << udphy->dp_lane_sel[2] * 2;
 		fallthrough;
 
-	case UDPHY_MODE_DP_USB:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
+	case 2:
 		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		break;
+		fallthrough;
 
-	case UDPHY_MODE_USB:
+	case 1:
+		value |= 0 << udphy->dp_lane_sel[0] * 2;
 		break;
 
 	default:
@@ -568,28 +576,6 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static int rk_udphy_dplane_get(struct rk_udphy *udphy)
-{
-	int dp_lanes;
-
-	switch (udphy->mode) {
-	case UDPHY_MODE_DP:
-		dp_lanes = 4;
-		break;
-
-	case UDPHY_MODE_DP_USB:
-		dp_lanes = 2;
-		break;
-
-	case UDPHY_MODE_USB:
-	default:
-		dp_lanes = 0;
-		break;
-	}
-
-	return dp_lanes;
-}
-
 static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
@@ -659,6 +645,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 	}
 
 	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
+	udphy->dp_lanes = 2;
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -897,7 +884,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		return 0;
 	}
 
-	if (num_lanes != 2 && num_lanes != 4)
+	if (num_lanes != 1 && num_lanes != 2 && num_lanes != 4)
 		return dev_err_probe(udphy->dev, -EINVAL,
 				     "invalid number of lane mux\n");
 
@@ -923,7 +910,8 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	}
 
 	udphy->mode = UDPHY_MODE_DP;
-	if (num_lanes == 2) {
+	udphy->dp_lanes = num_lanes;
+	if (num_lanes == 1 || num_lanes == 2) {
 		udphy->mode |= UDPHY_MODE_USB;
 		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP);
 	}
@@ -1076,18 +1064,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret, dp_lanes;
+	int ret;
 
 	mutex_lock(&udphy->mutex);
 
-	dp_lanes = rk_udphy_dplane_get(udphy);
-	phy_set_bus_width(phy, dp_lanes);
+	phy_set_bus_width(phy, udphy->dp_lanes);
 
 	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, dp_lanes);
+	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
 
 	rk_udphy_dplane_select(udphy);
 
@@ -1367,6 +1354,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		mode = UDPHY_MODE_DP;
+		udphy->dp_lanes = 4;
 		break;
 
 	case TYPEC_DP_STATE_D:
@@ -1383,6 +1371,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
 		mode = UDPHY_MODE_DP_USB;
+		udphy->dp_lanes = 2;
 		break;
 	}
 
@@ -1531,7 +1520,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 		ret = PTR_ERR(udphy->phy_dp);
 		return dev_err_probe(dev, ret, "failed to create DP phy\n");
 	}
-	phy_set_bus_width(udphy->phy_dp, rk_udphy_dplane_get(udphy));
+	phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
 	udphy->phy_dp->attrs.max_link_rate = 8100;
 	phy_set_drvdata(udphy->phy_dp, udphy);
 

-- 
2.51.0


