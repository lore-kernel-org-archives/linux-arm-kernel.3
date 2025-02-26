Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FDDC19F2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7ifKTWBPEUJSDsZT1NjVMCuNv9V6y/kChVpAVSziP8=; b=PSo9Pg44Bc4NrXuz2Sgo8ugE72
	L2O+YsoLilI1LRsFIM5t4tzHWTiaCR015OtdlExHnLiWVw4IgvUKeKEhozPXrx8M+Q1TYSsNY8nyE
	FYu7ZgORO7J8CKXbj8T8dQb5F59J0Zdab3yReBbtxAZlc+p7Sofw7nyKeyO03orLABw24o7EPrr18
	QfOlOnG6lNs3aLNKyOkX0tZF8zmb7RMrefiIX4eHuuyWtMWa3fW99VrXGBUeyxx+t6kMBM+HVurih
	YYW0TclbgftQ30z3yQztH/B6vddKDJVBaoIrRrphoMAVGXFfE1+/0b9XoUG2mHYd7tI96zc4mYSvw
	Leg4QO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnG33-00000003ZQw-33z8;
	Wed, 26 Feb 2025 11:57:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEo4-00000003KM6-18le;
	Wed, 26 Feb 2025 10:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E7ifKTWBPEUJSDsZT1NjVMCuNv9V6y/kChVpAVSziP8=; b=YmCHgBkXcyIQq0R7/LVHvZEusr
	jYVFYtAc/6h0bX6+iTi3lTNkc0qKrwDaef5YWfKx7i+G1CMYtk4hrjkxv+COn71mNG11dNsRjemyw
	L4248+CIMZTQkQwpCT0T25pDFFsWMfNwvvP6PmrOYwF6A7XBwzsXJF1z/E1/Dw1tUvGJ9GMeI7e6t
	PLELB6avtN3OdQk2GsaGegKBFRKz8/oUEdz/+aROG58YxiSr1hjK9b5drHSIzjuc3nxdnOArzxquj
	nH55witQqQaw4wNYOj3+sQuW+tpRDNinq7fjgNVmpa45AFqbl96MhpMwLDHHWV70gnbASHeHv3iVj
	eCvSuqdg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnEo3-0006aJ-0c; Wed, 26 Feb 2025 11:38:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com,
	christophe.jaillet@wanadoo.fr,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/2] phy: rockchip: usbdp: move type-orientation-switch further down
Date: Wed, 26 Feb 2025 11:38:09 +0100
Message-ID: <20250226103810.3746018-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226103810.3746018-1-heiko@sntech.de>
References: <20250226103810.3746018-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_023824_446740_BCD1CDE3 
X-CRM114-Status: GOOD (  17.04  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Move the typec-orientation-switch functionality further down, next to
the typec-mux code. Not only brings this the typec-related functionality
closer together, but also the following change needs access to other
driver functions, that are below the current position.

No functional change.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 166 +++++++++++-----------
 1 file changed, 83 insertions(+), 83 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5b1e8a3806ed..960cad5b01a9 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -616,89 +616,6 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
-static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
-{
-	if (udphy->flip) {
-		udphy->dp_lane_sel[0] = 0;
-		udphy->dp_lane_sel[1] = 1;
-		udphy->dp_lane_sel[2] = 3;
-		udphy->dp_lane_sel[3] = 2;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
-		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
-		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
-		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
-		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
-	} else {
-		udphy->dp_lane_sel[0] = 2;
-		udphy->dp_lane_sel[1] = 3;
-		udphy->dp_lane_sel[2] = 1;
-		udphy->dp_lane_sel[3] = 0;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
-		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
-		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
-		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
-	}
-
-	udphy->mode = UDPHY_MODE_DP_USB;
-}
-
-static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
-				 enum typec_orientation orien)
-{
-	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
-
-	mutex_lock(&udphy->mutex);
-
-	if (orien == TYPEC_ORIENTATION_NONE) {
-		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
-		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
-		/* unattached */
-		rk_udphy_usb_bvalid_enable(udphy, false);
-		goto unlock_ret;
-	}
-
-	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
-	rk_udphy_set_typec_default_mapping(udphy);
-	rk_udphy_usb_bvalid_enable(udphy, true);
-
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
-	return 0;
-}
-
-static void rk_udphy_orien_switch_unregister(void *data)
-{
-	struct rk_udphy *udphy = data;
-
-	typec_switch_unregister(udphy->sw);
-}
-
-static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
-{
-	struct typec_switch_desc sw_desc = { };
-
-	sw_desc.drvdata = udphy;
-	sw_desc.fwnode = dev_fwnode(udphy->dev);
-	sw_desc.set = rk_udphy_orien_sw_set;
-
-	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
-	if (IS_ERR(udphy->sw)) {
-		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
-			PTR_ERR(udphy->sw));
-		return PTR_ERR(udphy->sw);
-	}
-
-	return devm_add_action_or_reset(udphy->dev,
-					rk_udphy_orien_switch_unregister, udphy);
-}
-
 static int rk_udphy_refclk_set(struct rk_udphy *udphy)
 {
 	unsigned long rate;
@@ -1323,6 +1240,89 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
+{
+	if (udphy->flip) {
+		udphy->dp_lane_sel[0] = 0;
+		udphy->dp_lane_sel[1] = 1;
+		udphy->dp_lane_sel[2] = 3;
+		udphy->dp_lane_sel[3] = 2;
+		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
+		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
+		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
+		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
+		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
+		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
+	} else {
+		udphy->dp_lane_sel[0] = 2;
+		udphy->dp_lane_sel[1] = 3;
+		udphy->dp_lane_sel[2] = 1;
+		udphy->dp_lane_sel[3] = 0;
+		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
+		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
+		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
+		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
+		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
+		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
+	}
+
+	udphy->mode = UDPHY_MODE_DP_USB;
+}
+
+static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
+				 enum typec_orientation orien)
+{
+	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&udphy->mutex);
+
+	if (orien == TYPEC_ORIENTATION_NONE) {
+		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
+		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
+		/* unattached */
+		rk_udphy_usb_bvalid_enable(udphy, false);
+		goto unlock_ret;
+	}
+
+	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
+	rk_udphy_set_typec_default_mapping(udphy);
+	rk_udphy_usb_bvalid_enable(udphy, true);
+
+unlock_ret:
+	mutex_unlock(&udphy->mutex);
+	return 0;
+}
+
+static void rk_udphy_orien_switch_unregister(void *data)
+{
+	struct rk_udphy *udphy = data;
+
+	typec_switch_unregister(udphy->sw);
+}
+
+static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
+{
+	struct typec_switch_desc sw_desc = { };
+
+	sw_desc.drvdata = udphy;
+	sw_desc.fwnode = dev_fwnode(udphy->dev);
+	sw_desc.set = rk_udphy_orien_sw_set;
+
+	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
+	if (IS_ERR(udphy->sw)) {
+		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
+			PTR_ERR(udphy->sw));
+		return PTR_ERR(udphy->sw);
+	}
+
+	return devm_add_action_or_reset(udphy->dev,
+					rk_udphy_orien_switch_unregister, udphy);
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
-- 
2.47.2


