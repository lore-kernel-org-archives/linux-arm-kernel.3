Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F99ECA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rGpDiARdJ97sRRIOM9WpOOhGP8zEpHFZtvnFb4QG6w=; b=RB3zAo4QvRTF+LpI2yapD6Js+J
	E0Lyxva4Xkv4tSs90bYIJA0XcscON0rnx2U/EoeTmsH3L3c4kQJPX14l6HouBbz9CFpDE81PbgMvK
	meGEWwjcKxxH0jQBoyxP/4biu9qFYcC81EZtcJLQZTbY1AI9H7oHRZPl5RDGF8a1PRpzgC5t7DGrs
	FghoJS/2DgO/J85Odh5+BCMeb/5nalUmqrDTFyZoyo02IKIe2x1t3lfy/j7F1M1p0VX39YOmKHcKS
	jp+4C1gmkfMkoruLMjpqcjYNjPeeMndh4YB3RZhOeeXnNWv9W0Y0kqkTxRRgTLUieIxW3R0+oOE85
	2H06JirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrBF-00000005eb7-2Req;
	Wed, 30 Sep 2026 10:04:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrBD-00000005eYt-0MsR;
	Wed, 30 Sep 2026 10:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=9CSAr1ri7ku73RbjC6OWWoIc2mjdyi7bLxo0LfGt3e0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RJywvmBt5lqO0Isf1OGOahGS/0Z3i57ix26q3Lx8nAGlpQ79ismwVrMyCxIMqp0rD
	 cVZk+rQZry77u7RI06wha8wRbS0mlzHoyfubDIvCdzsvPcDst+S3sLYutYKh0apk8p
	 0Oscmj6RinHz9zI1pvOxAqkIBmXVmFmr1oV7tCphw7u+Ya9+E08Z/C/J0ji0r1qt9d
	 8gZATcd2ru+U/wKVP+s1RDzmRmFwPQJhqUvAaihu6mj73CF9iGwmVClgc7mPdSk+Od
	 uG93VOAxVKYAHHlfvKzuXGuqKRL7LjK2op9D877+DxvQ2CpJqg9OaEy/9WTkbslRQg
	 4ZSnzqdJvBbuQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62B1417E0D84;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12FBF480031; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:33 +0200
Subject: [PATCH v16 4/7] phy: rockchip: usbdp: Rename mode to hw_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-4-bc144f80afc4@collabora.com>
References: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
In-Reply-To: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7112;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9CSAr1ri7ku73RbjC6OWWoIc2mjdyi7bLxo0LfGt3e0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r5Gp8zkl0fhXjbodsqQ0lf/kdFe+D47v
 l9JSIZZnCzYrYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qaEaMQAIdilNBZCYQhw7es9mpoX+MEugdKzppLP6Y7l1NprXcYdr9NdjAxwL4FKEZGPYfVrwR
 1AuPHEJ4chmFd4DABTVl836HuUSOuYXuroMB5rTLw1Q8nizS1dFNLQB1C/DpBd1evc9iSPD1et+
 yCi+5bvzD4Que7789qkaCBhSMnPSEfDo3QXgXYv6zUoUIoBJN7nEL0zF5IRjkA808OkRBBWvv/E
 0CQOOGgVi6SnemrtR9dvdGzf7dKu80P3o4F5XdEIyEZ5a63exHXuonF6TrYklvQL0nYSiKd5GA9
 UJEZyMjoVDSR1PRX3Voz3jgosRYQBtdoiMfs8gP77mwtwjQ8Ox5KfT83UwA/8eCw4yjjWb0Y22u
 2xsAj4B5Vx+5Ppa4pIKyufcwNaOKViwKqPyiU0a67m+b3uWR8XfYMEOjWDkcb/Wh1NKanLrJ5Xe
 wY/biLnff/+9vTIzz7wvnZSCNvJg//TTN8rbtPe4Xp2rbODjQVpbRunEYYTYlOBx/8mHZRonaho
 DJ+UMNdS832PjBr30jUdQwZ7fSGnBdRuBYaaK5qjAXB2laQDZmpU1/PU78UtmEcdRpqZnmElbpH
 aAP9TMeUMhSxiPumJMTLBfwBNfhUG+jqW7NJTuayCmmqmTjONmbDp1jQqG8dsz72Cv01VRCwUbw
 vN4CXV8Gz63+xo/GKGccuTw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_030451_307004_89AB7FFE 
X-CRM114-Status: GOOD (  17.94  )
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

Rename mode field to hw_mode to make clear that this is the modes
currently supported by the hardware, but not necessarily requested
by software. I.e. it is only set by either the USB-C state machine
or device-tree if the PHY is used in a fixed routing setup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 144d83997a79..b06d94db42ea 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -173,7 +173,7 @@ struct rk_udphy {
 	/* PHY status management */
 	bool flip;
 	bool phy_needs_reinit;
-	u8 mode;
+	u8 hw_mode; /* modes currently supported by hardware */
 	u8 status;
 
 	/* utilized for USB */
@@ -578,18 +578,18 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
 {
-	if (udphy->mode == mode)
+	if (udphy->hw_mode == hw_mode)
 		return;
 
 	udphy->phy_needs_reinit = true;
-	udphy->mode = mode;
+	udphy->hw_mode = hw_mode;
 }
 
 static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
 {
-	u8 mode;
+	u8 hw_mode;
 
 	switch (state) {
 	case TYPEC_DP_STATE_C:
@@ -598,7 +598,7 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
+		hw_mode = UDPHY_MODE_DP;
 		udphy->dp_lanes = 4;
 		break;
 
@@ -615,12 +615,12 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		mode = UDPHY_MODE_DP_USB;
+		hw_mode = UDPHY_MODE_DP_USB;
 		udphy->dp_lanes = 2;
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_mode_set(udphy, hw_mode);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
@@ -743,7 +743,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 	int ret;
 
 	/* LCPLL check */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = regmap_read_poll_timeout(udphy->pma_regmap, CMN_ANA_LCPLL_DONE_OFFSET,
 					       val, (val & CMN_ANA_LCPLL_AFC_DONE) &&
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
@@ -778,15 +778,15 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	int ret;
 
 	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
-		str_on_off(udphy->mode & UDPHY_MODE_USB),
-		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_USB),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_DP),
 		udphy->dp_lanes, str_yes_no(udphy->flip));
 
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
 	/* enable rx lfps for usb */
-	if (udphy->mode & UDPHY_MODE_USB)
+	if (udphy->hw_mode & UDPHY_MODE_USB)
 		rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.rx_lfps, true);
 
 	/* Step 1: power on pma and deassert apb rstn */
@@ -823,13 +823,13 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "init");
 		if (ret)
 			goto assert_resets;
 	}
 
-	if (udphy->mode & UDPHY_MODE_DP) {
+	if (udphy->hw_mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
 				   CMN_DP_INIT_RSTN,
 				   FIELD_PREP(CMN_DP_INIT_RSTN, 0x1));
@@ -838,7 +838,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	udelay(1);
 
 	/*  Step 5: deassert cmn/lane rstn */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "cmn");
 		if (ret)
 			goto assert_resets;
@@ -897,7 +897,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	num_lanes = device_property_count_u32(udphy->dev, "rockchip,dp-lane-mux");
 	if (num_lanes < 0) {
 		dev_dbg(udphy->dev, "no dp-lane-mux, following dp alt mode\n");
-		udphy->mode = UDPHY_MODE_USB;
+		udphy->hw_mode = UDPHY_MODE_USB;
 		return 0;
 	}
 
@@ -926,10 +926,10 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		}
 	}
 
-	udphy->mode = UDPHY_MODE_DP;
+	udphy->hw_mode = UDPHY_MODE_DP;
 	udphy->dp_lanes = num_lanes;
 	if (num_lanes == 1 || num_lanes == 2) {
-		udphy->mode |= UDPHY_MODE_USB;
+		udphy->hw_mode |= UDPHY_MODE_USB;
 		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP) ||
 			      (udphy->lane_mux_sel[1] == PHY_LANE_MUX_DP);
 	}
@@ -988,7 +988,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
 
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return 0;
 	}
@@ -1005,7 +1005,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1022,7 +1022,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1036,7 +1036,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 {
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return;
 	}
@@ -1295,7 +1295,7 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
@@ -1310,7 +1310,7 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

-- 
2.53.0


