Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B97CF65E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVeV5EaKyNbp2W8W3ifuFNt5NBp7ACCSHKhVp7KXfy4=; b=ver84P5kKCamv+5Ykk+LyWjx4O
	CuWm71Xbac7RCds9NRZYJdjHp0hLLuw28K1KDDFdJxLrmJrrTRbPLT1bzE5cmGEujOm2Egwv/HSo4
	QtOc4MtOQoFlLMyxzN1aQrmA6cyeL3pnrJEy23GDOZLEAsy7D0UjhEQuZefCC0YrSMArPVm0CAT3/
	uP36GiEEFgUgvg4RFuxByyRNe6CKn1iETbYgF46FbFq3YmG+vueXTLMGKQPVxWzNBm8cGDlyq/Ogm
	F3lLzuQkD/+eLqK58rIG9DI2foYOXad8XGc3VMxq74JQaRjyXE+eY7hcT0we2xvAJ8b7PZmr8D6UH
	LcN7huJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2f-0000000CRCX-3Aej;
	Mon, 26 Jan 2026 11:46:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2Z-0000000CR35-1IH2;
	Mon, 26 Jan 2026 11:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oVeV5EaKyNbp2W8W3ifuFNt5NBp7ACCSHKhVp7KXfy4=; b=XYI17ddarGl1cvOI7eKgbgBJTd
	CAzARr50MmPOk+AFzIBf2KWqFpOGAoYGu6M0vaPPaNe/ABNelJZZl7BnExuWbP1oQicEbXABXubpt
	nPkpwnEGNzaTm2m54sCtV25jkvkw8HVncX1gk286GkCXUWlEbbE7KPpo6aj958M7ceUsfwokX6i0S
	s+EtpeFFxVwH8Zk8g0DspkLHZOLNQ5qEoWReJX0iOaRgpY/FZdTfQUdHmPknrFTr1Ak9r96HASkIF
	NDsXmpvN3BD6JBKu9OmF7CAQJGWcLAijkr/wvDxFcXLyoooc/b0Y9x9a0UKErVZw9A8c3gvLhO21H
	GcJlyaFQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57382 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL2P-000000004fq-2GVm;
	Mon, 26 Jan 2026 11:45:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL2O-00000005ut0-0O8z;
	Mon, 26 Jan 2026 11:45:44 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 09/22] net: stmmac: rk: move speed GRF register
 offset to private data
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL2O-00000005ut0-0O8z@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034555_542277_DA5D9482 
X-CRM114-Status: GOOD (  17.26  )
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

Move the speed/clocking related GRF register offset into the driver
private data, convert rk_set_reg_speed() to use it and initialise this
member either from the corresponding member in struct rk_gmac_ops, or
the SoC specific initialisation function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 114 +++++++++++++-----
 1 file changed, 81 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 5bbdcc963430..cdeb77aee642 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -50,6 +50,8 @@ struct rk_gmac_ops {
 	u16 gmac_phy_intf_sel_mask;
 	u16 gmac_rmii_mode_mask;
 
+	u16 clock_grf_reg;
+
 	bool gmac_grf_reg_in_php;
 	bool php_grf_required;
 	bool regs_valid;
@@ -100,6 +102,8 @@ struct rk_priv_data {
 	u16 gmac_grf_reg;
 	u16 gmac_phy_intf_sel_mask;
 	u16 gmac_rmii_mode_mask;
+
+	u16 clock_grf_reg;
 };
 
 #define GMAC_CLK_DIV1_125M		0
@@ -139,10 +143,14 @@ static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
 	return regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
 }
 
+static int rk_write_clock_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
+{
+	return regmap_write(bsp_priv->grf, bsp_priv->clock_grf_reg, val);
+}
+
 static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 			    const struct rk_reg_speed_data *rsd,
-			    unsigned int reg, phy_interface_t interface,
-			    int speed)
+			    phy_interface_t interface, int speed)
 {
 	unsigned int val;
 
@@ -178,7 +186,7 @@ static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 		return -EINVAL;
 	}
 
-	regmap_write(bsp_priv->grf, reg, val);
+	rk_write_clock_grf_reg(bsp_priv, val);
 
 	return 0;
 
@@ -373,7 +381,7 @@ static int rk3128_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3128_reg_speed_data,
-				RK3128_GRF_MAC_CON1, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rk3128_ops = {
@@ -384,6 +392,8 @@ static const struct rk_gmac_ops rk3128_ops = {
 	.gmac_grf_reg = RK3128_GRF_MAC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(8, 6),
 	.gmac_rmii_mode_mask = BIT_U16(14),
+
+	.clock_grf_reg = RK3128_GRF_MAC_CON1,
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -440,7 +450,7 @@ static int rk3228_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3228_reg_speed_data,
-				RK3228_GRF_MAC_CON1, interface, speed);
+				interface, speed);
 }
 
 static void rk3228_integrated_phy_powerup(struct rk_priv_data *priv)
@@ -462,6 +472,7 @@ static const struct rk_gmac_ops rk3228_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 	.gmac_rmii_mode_mask = BIT_U16(10),
 
+	.clock_grf_reg = RK3228_GRF_MAC_CON1,
 };
 
 #define RK3288_GRF_SOC_CON1	0x0248
@@ -509,7 +520,7 @@ static int rk3288_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3288_reg_speed_data,
-				RK3288_GRF_SOC_CON1, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rk3288_ops = {
@@ -520,6 +531,8 @@ static const struct rk_gmac_ops rk3288_ops = {
 	.gmac_grf_reg = RK3288_GRF_SOC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(8, 6),
 	.gmac_rmii_mode_mask = BIT_U16(14),
+
+	.clock_grf_reg = RK3288_GRF_SOC_CON1,
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -543,7 +556,7 @@ static int rk3308_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3308_reg_speed_data,
-				RK3308_GRF_MAC_CON0, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rk3308_ops = {
@@ -552,6 +565,8 @@ static const struct rk_gmac_ops rk3308_ops = {
 
 	.gmac_grf_reg = RK3308_GRF_MAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(4, 2),
+
+	.clock_grf_reg = RK3308_GRF_MAC_CON0,
 };
 
 #define RK3328_GRF_MAC_CON0	0x0900
@@ -582,10 +597,12 @@ static int rk3328_init(struct rk_priv_data *bsp_priv)
 	switch (bsp_priv->id) {
 	case 0: /* gmac2io */
 		bsp_priv->gmac_grf_reg = RK3328_GRF_MAC_CON1;
+		bsp_priv->clock_grf_reg = RK3328_GRF_MAC_CON1;
 		return 0;
 
 	case 1: /* gmac2phy */
 		bsp_priv->gmac_grf_reg = RK3328_GRF_MAC_CON2;
+		bsp_priv->clock_grf_reg = RK3328_GRF_MAC_CON2;
 		return 0;
 
 	default:
@@ -620,11 +637,7 @@ static const struct rk_reg_speed_data rk3328_reg_speed_data = {
 static int rk3328_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
-	unsigned int reg;
-
-	reg = bsp_priv->id ? RK3328_GRF_MAC_CON2 : RK3328_GRF_MAC_CON1;
-
-	return rk_set_reg_speed(bsp_priv, &rk3328_reg_speed_data, reg,
+	return rk_set_reg_speed(bsp_priv, &rk3328_reg_speed_data,
 				interface, speed);
 }
 
@@ -700,7 +713,7 @@ static int rk3366_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3366_reg_speed_data,
-				RK3366_GRF_SOC_CON6, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rk3366_ops = {
@@ -711,6 +724,8 @@ static const struct rk_gmac_ops rk3366_ops = {
 	.gmac_grf_reg = RK3366_GRF_SOC_CON6,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
 	.gmac_rmii_mode_mask = BIT_U16(6),
+
+	.clock_grf_reg = RK3366_GRF_SOC_CON6,
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -758,7 +773,7 @@ static int rk3368_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3368_reg_speed_data,
-				RK3368_GRF_SOC_CON15, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rk3368_ops = {
@@ -769,6 +784,8 @@ static const struct rk_gmac_ops rk3368_ops = {
 	.gmac_grf_reg = RK3368_GRF_SOC_CON15,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
 	.gmac_rmii_mode_mask = BIT_U16(6),
+
+	.clock_grf_reg = RK3368_GRF_SOC_CON15,
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -816,7 +833,7 @@ static int rk3399_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rk3399_reg_speed_data,
-				RK3399_GRF_SOC_CON5, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rk3399_ops = {
@@ -827,6 +844,8 @@ static const struct rk_gmac_ops rk3399_ops = {
 	.gmac_grf_reg = RK3399_GRF_SOC_CON5,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
 	.gmac_rmii_mode_mask = BIT_U16(6),
+
+	.clock_grf_reg = RK3399_GRF_SOC_CON5,
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -843,6 +862,22 @@ static const struct rk_gmac_ops rk3399_ops = {
 #define RK3506_GMAC_CLK_RMII_GATE	GRF_BIT(2)
 #define RK3506_GMAC_CLK_RMII_NOGATE	GRF_CLR_BIT(2)
 
+static int rk3506_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->clock_grf_reg = RK3506_GRF_SOC_CON8;
+		return 0;
+
+	case 1:
+		bsp_priv->clock_grf_reg = RK3506_GRF_SOC_CON11;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static void rk3506_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 	unsigned int id = bsp_priv->id, offset;
@@ -859,11 +894,8 @@ static const struct rk_reg_speed_data rk3506_reg_speed_data = {
 static int rk3506_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
-	unsigned int id = bsp_priv->id, offset;
-
-	offset = (id == 1) ? RK3506_GRF_SOC_CON11 : RK3506_GRF_SOC_CON8;
 	return rk_set_reg_speed(bsp_priv, &rk3506_reg_speed_data,
-				offset, interface, speed);
+				interface, speed);
 }
 
 static void rk3506_set_clock_selection(struct rk_priv_data *bsp_priv,
@@ -881,6 +913,7 @@ static void rk3506_set_clock_selection(struct rk_priv_data *bsp_priv,
 }
 
 static const struct rk_gmac_ops rk3506_ops = {
+	.init = rk3506_init,
 	.set_to_rmii = rk3506_set_to_rmii,
 	.set_speed = rk3506_set_speed,
 	.set_clock_selection = rk3506_set_clock_selection,
@@ -925,6 +958,22 @@ static const struct rk_gmac_ops rk3506_ops = {
 #define RK3528_GMAC1_CLK_RMII_GATE	GRF_BIT(9)
 #define RK3528_GMAC1_CLK_RMII_NOGATE	GRF_CLR_BIT(9)
 
+static int rk3528_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->clock_grf_reg = RK3528_VO_GRF_GMAC_CON;
+		return 0;
+
+	case 1:
+		bsp_priv->clock_grf_reg = RK3528_VPU_GRF_GMAC_CON5;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static void rk3528_set_to_rgmii(struct rk_priv_data *bsp_priv,
 				int tx_delay, int rx_delay)
 {
@@ -967,17 +1016,13 @@ static int rk3528_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	const struct rk_reg_speed_data *rsd;
-	unsigned int reg;
 
-	if (bsp_priv->id == 1) {
+	if (bsp_priv->id == 1)
 		rsd = &rk3528_gmac1_reg_speed_data;
-		reg = RK3528_VPU_GRF_GMAC_CON5;
-	} else {
+	else
 		rsd = &rk3528_gmac0_reg_speed_data;
-		reg = RK3528_VO_GRF_GMAC_CON;
-	}
 
-	return rk_set_reg_speed(bsp_priv, rsd, reg, interface, speed);
+	return rk_set_reg_speed(bsp_priv, rsd, interface, speed);
 }
 
 static void rk3528_set_clock_selection(struct rk_priv_data *bsp_priv,
@@ -1009,6 +1054,7 @@ static void rk3528_integrated_phy_powerdown(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_gmac_ops rk3528_ops = {
+	.init = rk3528_init,
 	.set_to_rgmii = rk3528_set_to_rgmii,
 	.set_to_rmii = rk3528_set_to_rmii,
 	.set_speed = rk3528_set_speed,
@@ -1129,10 +1175,12 @@ static int rk3576_init(struct rk_priv_data *bsp_priv)
 	switch (bsp_priv->id) {
 	case 0:
 		bsp_priv->gmac_grf_reg = RK3576_GRF_GMAC_CON0;
+		bsp_priv->clock_grf_reg = RK3576_GRF_GMAC_CON0;
 		return 0;
 
 	case 1:
 		bsp_priv->gmac_grf_reg = RK3576_GRF_GMAC_CON1;
+		bsp_priv->clock_grf_reg = RK3576_GRF_GMAC_CON1;
 		return 0;
 
 	default:
@@ -1178,12 +1226,7 @@ static const struct rk_reg_speed_data rk3578_reg_speed_data = {
 static int rk3576_set_gmac_speed(struct rk_priv_data *bsp_priv,
 				 phy_interface_t interface, int speed)
 {
-	unsigned int offset_con;
-
-	offset_con = bsp_priv->id == 1 ? RK3576_GRF_GMAC_CON1 :
-					 RK3576_GRF_GMAC_CON0;
-
-	return rk_set_reg_speed(bsp_priv, &rk3578_reg_speed_data, offset_con,
+	return rk_set_reg_speed(bsp_priv, &rk3578_reg_speed_data,
 				interface, speed);
 }
 
@@ -1384,7 +1427,7 @@ static int rv1108_set_speed(struct rk_priv_data *bsp_priv,
 			    phy_interface_t interface, int speed)
 {
 	return rk_set_reg_speed(bsp_priv, &rv1108_reg_speed_data,
-				RV1108_GRF_GMAC_CON0, interface, speed);
+				interface, speed);
 }
 
 static const struct rk_gmac_ops rv1108_ops = {
@@ -1393,6 +1436,8 @@ static const struct rk_gmac_ops rv1108_ops = {
 
 	.gmac_grf_reg = RV1108_GRF_GMAC_CON0,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
+
+	.clock_grf_reg = RV1108_GRF_GMAC_CON0,
 };
 
 #define RV1126_GRF_GMAC_CON0		0X0070
@@ -1675,6 +1720,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	bsp_priv->gmac_phy_intf_sel_mask = ops->gmac_phy_intf_sel_mask;
 	bsp_priv->gmac_rmii_mode_mask = ops->gmac_rmii_mode_mask;
 
+	/* Set the default clock control register related parameters */
+	bsp_priv->clock_grf_reg = ops->clock_grf_reg;
+
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
 		if (ret) {
-- 
2.47.3


