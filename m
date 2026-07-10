Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7B3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVgmQSfiTNCAYyP7ye01EriVgYVavUafydfCp+fvLCM=; b=X710sySGTv7Z49gjpICSHFrXCw
	TFtSvO5EsPxh7c8dul73yrbCu3bJR0ABLBxo0I919vnQtnfKCa4XLuTl6sLUU/AixhqtQuJe+jluF
	4UL/2/tRFd3h7rLoUd0F1GDyl+/f1DYYwB0TiIglMq/J3VPGa2k075AUYDYM8Of4JmcKKgjDXnIYf
	8pgWYxig1WWsvA4lzk9tePFDCCBYTQ55ZM+bptWMS0msKTmjJgVvIY7yd6VeK11/2fUKT1oJ3eKZD
	vk6qsJRlgo4+kIO/5y5m/mpiDQHyrddYO2BHRY30K2yegxBMPJzG+XZPmysOpyW7+Lg5dpATKWUu7
	xb2SCuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENj-00000005KYZ-01jI;
	Fri, 10 Jul 2026 16:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMy-00000005JKv-069e;
	Fri, 10 Jul 2026 16:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eVgmQSfiTNCAYyP7ye01EriVgYVavUafydfCp+fvLCM=; b=ArM6GrTu4u/TDl6FSLEJrX8Dne
	qA8c9+aRqf3Sq1B7HInwSYsYkwa99xczVTt0FWr+u+Gn5OpHvhOS928zhDaceIUvj4ewCHN3ndIzx
	ajnyu1op5EHijm/SJRT9QgGHbcKAoIb0owII131x16Om9LiKnxgg53bLPSPlWKOYsg2bMrx8iBlE+
	0netblPMlE1bI74m0dJuQ0P4ypJMLh31OZlj5SGISl5m6IsFbMpliqpl+iugokYmu+yk88MYTg9aT
	72k01dmbF1y/YHbQ/5mFzW6qBqG1lowXyrkdoZxbnHnCONn6CnH3VyHl79NEcOeZnTA+uwWEgaVAc
	ot+7RqDg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiEMv-0000000AAaG-035m;
	Fri, 10 Jul 2026 16:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=WvI4CpW9M8TpkyLpkp+OrGOQyMjechaxNGHQNV0SpgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F9MZvkuHxyEfnDCHxsRcRvshLyZm8DRQFXizSJDI3ImhQYd8ougyXDu1kOg4xpFXK
	 ge0XMxceeVS/G7+EcEkXVoO2UCNb94NERZeV3WaAIyPeov1tG61RH9RuzadQFuVhPt
	 Anky55gBDR77NSYyJdDpIBSS89do4InhzzsI03FQI8YVQTdgPKWjraOL0gTkTPRMF9
	 xzcOEQjt9pwYtrMZu0sPVIwdvJKSWT/JuWWmcpAepRZdGDBvoY1686a2jmQ+lpVhEC
	 FfzPZk7+xuyU7L9vp0APHh3rolaZ/JCOlNwNyQMqLFIkuZ65PUQv2SyE/gf0xP1rjL
	 zti0/UP3jP23Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5D8517E102C;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0556B480066; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:58 +0200
Subject: [PATCH v12 20/36] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-20-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4580;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=WvI4CpW9M8TpkyLpkp+OrGOQyMjechaxNGHQNV0SpgY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdluNqulq/bvaALDhXbcxzZZ/cM0wFK36
 mHlw3TLvp2P0okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaTc8P/01ejvfWyBJdhYXY/2snGkNfEipfk3y2yeIN13H+S88Eykf7xGmLzB4kQ2nlVrym+69
 RTix6yUMhqw40ivPP49zbef6IU59DEtMBGQGSjf2PvC+ZlbCU5kGDC7Iq7eLy2kky103b0HEj3A
 FQ4o4l16IhMTo3oAaOLRFa3jj+RS18lDpq1NxXyCxqg7wIozN9Uhe6xHWNFB1oJW1QjMVk8mrCL
 UODHw6XBh0A9SJTNvz4upQ+a16pU34+ZNBw2XPh7FOri5wPM3yja6PWM2UFF1NFn9jnrs3B45Aa
 taRi6yoPCwowFsfykphj5LJ+2Zzvh6K/fVicVamxZFvqoW+Pk9uwuTvi/f1gsQNQeCTaL6wxeVL
 IEmnrW2PY2QDJWd6cv62RVQWNDtT32jfocIYNupTnU61mQcVb4srHYL+r1m8GFG2m22JeZIVTla
 DKY4GAAbM5oHWambHaSryU2aEUvw1kKJld6vsUb5ishS0spbIk0Wlh5sIWtRhx73/CXxAK8iXJ8
 64MlDVPSaZH7gQpt07644ax5k8VeSmvU5atSKuYT7tIKDGb06qofkR7SrZ9iiRFE10cQOmiaJfT
 ahqCE5oy66BqQjyGyOCkCyX2QZlzep11ZmWHwBZxkuvPmTxbwzu2VVHDfaIHArv3NqCPbWi7Uq/
 r1tQ+BRGFwUF6RRVtqtExzQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_174629_202666_9FD9E667 
X-CRM114-Status: GOOD (  13.35  )
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

Avoid describing the USB+DP lane_mux_sel logic twice by introducing
a helper function to reduce code duplication.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 81 +++++++++++++++----------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4b454798c4ed..4e54020d1755 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -582,6 +582,42 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	udphy->mode = mode;
 }
 
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	u8 mode;
+
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		mode = UDPHY_MODE_DP;
+		udphy->dp_lanes = 4;
+		break;
+
+	case TYPEC_DP_STATE_D:
+	default:
+		if (udphy->flip) {
+			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
+		} else {
+			udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		}
+		mode = UDPHY_MODE_DP_USB;
+		udphy->dp_lanes = 2;
+		break;
+	}
+
+	rk_udphy_mode_set(udphy, mode);
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -589,10 +625,6 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		udphy->dp_lane_sel[1] = 1;
 		udphy->dp_lane_sel[2] = 3;
 		udphy->dp_lane_sel[3] = 2;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
 		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
 		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
@@ -602,18 +634,14 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		udphy->dp_lane_sel[1] = 3;
 		udphy->dp_lane_sel[2] = 1;
 		udphy->dp_lane_sel[3] = 0;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
 		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
-	udphy->dp_lanes = 2;
+	/* default to USB3 + DP as 4 lane USB is not supported */
+	rk_udphy_set_typec_state(udphy, TYPEC_DP_STATE_D);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1269,7 +1297,6 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
-	u8 mode;
 
 	/*
 	 * Ignore mux events not involving DP AltMode, because
@@ -1281,38 +1308,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	mutex_lock(&udphy->mutex);
 
-	switch (state->mode) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
-		if (udphy->flip) {
-			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
-		} else {
-			udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		}
-		mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
-		break;
-	}
-
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_set_typec_state(udphy, state->mode);
 
 	mutex_unlock(&udphy->mutex);
+
 	return 0;
 }
 

-- 
2.53.0


