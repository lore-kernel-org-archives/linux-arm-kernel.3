Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D22C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjzfQFTuoaxBx2vdKx3P+Ofq9hBkEZxFgmFPPZ/Im7c=; b=gtXXa/stdqyR4KeV5Pqm+gVtDu
	eKjTo2aNi15w6eH0q9EjK5GonwWFTXQM7KpFIqGNEhT2biPSRnWKpnkdBoU3OwWllbXAKWrSeQG7g
	1Sz7m8EabdMZ27nExnHi/x5Hb1VS1H1OZLJh2Sfu29oxJMVUlcLY939ugDQoWVeYI1abFQjTDn2Dh
	d9/ji2uAofgWl7aT1e1cBoa75FjkL8WFL1RE3fRtWdbvBrROslTj4QbDolJGF81ies4YWlrqha5l6
	JAcKKgvIsUM7JyhNxyjRgfOA/dAVkWpondImCBSEG9X7wKlI7RRLNAnMzC6xTeUlTvUUjmDm9HUxL
	BksBti2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VAu-00000007DwR-41SP;
	Tue, 15 Sep 2026 15:34:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9Z-00000007BG7-46uu;
	Tue, 15 Sep 2026 15:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789486379;
	bh=ibLM0sQWJ4JJvDZVAClJTuJ6JxCFAEq3qYfAC+QhbXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RN6Qx3vgCkPirUvfvyUET56wg89eMMWExsfqbiJXlzdLt7BXacXPXBqEzwiSYfq0k
	 wvju9EMW6QatEs1S5ti29X33lsE3HxmDkukhTx2yUPBjC2MyfK7gZ60a1X5t+h1OK6
	 VKV3m8hYSEj/WTc9WNSNYHs9vvI61/pUkWwJKZK928H1fIo1d5i0CdrAbKyaLXS2Y1
	 q5LBh7pkpOG26AtajMcYf62pGSE+pV9URiMzRIOswn1r306l+UcDixGtAp3ZRrVVn+
	 LEcwSdfkwySN4lB+XIwchQcM9tAHn0zs31hFVM8P4Kll7I4m657JIuXPgzJa6TzWXP
	 ZIV/JpAaDe64g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE3CF17E0A32;
	Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6BB89480030; Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:32:50 +0200
Subject: [PATCH v15 3/6] phy: rockchip: usbdp: Rename mode to hw_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-3-9ad90a456953@collabora.com>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7035;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ibLM0sQWJ4JJvDZVAClJTuJ6JxCFAEq3qYfAC+QhbXM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpZSu6hPArnk1m4AY+8WVAZMauHE8tIFi8n
 lKopatbyo7oi4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWUrAAoJENju1/PI
 O/qarFMQAIX1j3MIYrjZxhR9ITmcIOyq3MjPvRT92kBTgEfykpTQtFYbzrmVYlaEEx9kUW2riEs
 AbqaogDvr5YenRR9eR3ycZynaN70udzwmR0r8tyjREJhzWwkeEIE//hkflzPTQ4JZiVdZfLsrUs
 xx9BlmF5YPXH3sBXjdFGs5QSaKR1a20i36yFeh4TVHqNhc/DYJQzFXMMGPGDXIt7J09ORMAXGMa
 LFHUFS/gbt3ZOAB8/p7DKrCHIAFYGNQVXsteUmctmnbw8E5JiUcFVkUDx8DY9ft6x8S5f5zfAcI
 8wawcP4lmH5DkDbVhkILKuu0Dg46Azd9oo/nhiaXDlZAIeuCTyaQ8T8KuRx/JhmPz9ot3de+y/R
 1TBNp/LbdJ1/YtNSd0NmslLpmgcKbx028nwH/AZYA3EKE/CdP0oCz2brcmNMUv0H4qDpdp8+gGL
 AylUHVjVed9Sus5u+dc5o6PIY/1KWIft++CcipjH6TfcW/HL+lEQPNe23gbeOJyhfVLbMtJv4Fn
 idWuh904yKVVRKL9WGgbwhZQWymFIYQIAeveS0p1eER7ohIkKeu7kI+VzfY68SFwDzO5RXy6zpt
 5gAxO2MiNbHN25hq/Nr1W7ZY/AEoR8Xd0fQa3iqzryJZSLnb2EFGnJb2YC+i1ymstR+HGPjjc4+
 i/Hllm1CoyRjDUzI/sqgohA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083302_272245_E88A4126 
X-CRM114-Status: GOOD (  17.80  )
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


