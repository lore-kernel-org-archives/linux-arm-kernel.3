Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E3BD72376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pAMmV06WpTBpCMnulw6ANqIkvdXlb2C/XPgyVldDps=; b=fetWzSuJfTzW7Pp6jLgBErIW7n
	ryLNhVpaO2j2tuIa9YPag1KAe9a2BY4RJxpLqmeb96CcZiRuQ7oKqekdwlrNAcOHmLZCpZXimwDPJ
	sDk67MRiCVWPmwxVkgKTRcHumn5R+pJXdc60sIqOtGxhsFZ7PKtSsAu9m/tTM1HL88SPmcq22+Iu8
	0RoOKQ/soCzb9PdkW7Y1hS3WcyY1RUk5DTxi9DDmJjn9rF9tfkqrh94kvltIL7Fyacu1/wL25EwWG
	8URNhKUQykqh38D70sfTCREDz5EvdK3JdJOqQvVNEHXkPDIicjsQH3u+rxhk5zAnfMlwaKf8+0gFH
	MnCqtgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEv4-00000008mQ7-0CmT;
	Fri, 23 Jan 2026 11:01:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEv1-00000008mLL-2bo1;
	Fri, 23 Jan 2026 11:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=0pAMmV06WpTBpCMnulw6ANqIkvdXlb2C/XPgyVldDps=; b=XX/PtujQscqieE3AAPhuj2eEwN
	239ml+EcOiicqsI6J0+Pcclr0RHF5AvUD70TpP7ggxNo63jySOrwzKqf872MYSyaaDDxmwpjvhDnb
	x7JTwy4nBD7/lJX8SVewOrkFMTjUGLn1qFQXNjhYJl3JCLjpmit8m1WlzipUYaSI3ks677pNj4eLm
	EqjEJrA5ccfMxcxsP5KNzme6sWqr0x0qElVa4IIBrGrEMruGRBDgNwTHaQFC/BbUMACwcUs1UDfD2
	KC1r3Xa6Ia3wkJP1zVIFZ+3KCcVW7PmSOk2eZAXrGJYcJB+YK6e2+fycaP7lY8jEC3ezfRCRIudcu
	bHICd2EA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEuy-00000002DSg-23zr;
	Fri, 23 Jan 2026 11:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0pAMmV06WpTBpCMnulw6ANqIkvdXlb2C/XPgyVldDps=; b=Pf8Pk5Gd0ZvF/1sYeTFDn/SnJJ
	4+8CMGILcOgQqd00g6ekLouax+SUGvMFrsy/miCb2qiC3SarF4zYU8LyHCzRbLuf8PP8/43X53Arm
	M2g8TIg8zORqRJ8u5VNOQWWvobFTkBLvAOSu6dBtdfgJODLvatzr1B7kDYELEnf/CtvDPqBMYqFjl
	NUgH8SwUHJyi6hQfTcE0hYDP9CHQcxPJPU8dCfiuIKp9aDdZP6Th93Soa/WUvqkjZvqAxVgRCaYoa
	5Xr6Y29490aOkLqTZys2g0Ff3/PnEuNdaNLZS49YqGTW/RnmIMgbNAIrYzaRQfN/3tkfzEkErgeGt
	T2uicy2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50526 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjEuo-000000001pb-16OS;
	Fri, 23 Jan 2026 11:01:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjEul-00000005ggi-0CAA;
	Fri, 23 Jan 2026 11:01:19 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 12/21] net: stmmac: rk: use rk_encode_wm16() for RMII
 speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjEul-00000005ggi-0CAA@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110132_782240_E02275E1 
X-CRM114-Status: GOOD (  13.30  )
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

The RMII speed configuration is encoded as a single bit, which is set
for 100M and clean for 10M. Provide the bitfield definition in
struct rk_clock_fields, moving it out of struct rk_reg_speed_data's
rmii_10 and rmii_100 initialisers. Update rk_set_reg_speed() to handle
the new definition location of this bit.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 69 +++++++++----------
 1 file changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 0f94304e721a..48852054390d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -28,6 +28,7 @@ struct rk_priv_data;
 
 struct rk_clock_fields {
 	u16 gmii_clk_sel_mask;
+	u16 mac_speed_mask;
 };
 
 struct rk_reg_speed_data {
@@ -171,10 +172,12 @@ static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 
 		val = rk_encode_wm16(ret, bsp_priv->clock.gmii_clk_sel_mask);
 	} else if (interface == PHY_INTERFACE_MODE_RMII) {
+		val = rk_encode_wm16(speed == SPEED_100,
+				     bsp_priv->clock.mac_speed_mask);
 		if (speed == SPEED_10) {
-			val = rsd->rmii_10;
+			val |= rsd->rmii_10;
 		} else if (speed == SPEED_100) {
-			val = rsd->rmii_100;
+			val |= rsd->rmii_100;
 		} else {
 			/* Phylink will not allow inappropriate speeds for
 			 * interface modes, so this should never happen.
@@ -351,8 +354,6 @@ static const struct rk_gmac_ops px30_ops = {
 /* RK3128_GRF_MAC_CON1 */
 #define RK3128_GMAC_FLOW_CTRL          GRF_BIT(9)
 #define RK3128_GMAC_FLOW_CTRL_CLR      GRF_CLR_BIT(9)
-#define RK3128_GMAC_SPEED_10M          GRF_CLR_BIT(10)
-#define RK3128_GMAC_SPEED_100M         GRF_BIT(10)
 #define RK3128_GMAC_RMII_CLK_25M       GRF_BIT(11)
 #define RK3128_GMAC_RMII_CLK_2_5M      GRF_CLR_BIT(11)
 
@@ -370,8 +371,8 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3128_reg_speed_data = {
-	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M | RK3128_GMAC_SPEED_10M,
-	.rmii_100 = RK3128_GMAC_RMII_CLK_25M | RK3128_GMAC_SPEED_100M,
+	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3128_GMAC_RMII_CLK_25M,
 };
 
 static int rk3128_set_speed(struct rk_priv_data *bsp_priv,
@@ -392,6 +393,7 @@ static const struct rk_gmac_ops rk3128_ops = {
 
 	.clock_grf_reg = RK3128_GRF_MAC_CON1,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
+	.clock.mac_speed_mask = BIT_U16(10),
 };
 
 #define RK3228_GRF_MAC_CON0	0x0900
@@ -406,8 +408,6 @@ static const struct rk_gmac_ops rk3128_ops = {
 /* RK3228_GRF_MAC_CON1 */
 #define RK3228_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3228_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3228_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RK3228_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3228_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3228_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 #define RK3228_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -436,8 +436,8 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3228_reg_speed_data = {
-	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M | RK3228_GMAC_SPEED_10M,
-	.rmii_100 = RK3228_GMAC_RMII_CLK_25M | RK3228_GMAC_SPEED_100M,
+	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3228_GMAC_RMII_CLK_25M,
 };
 
 static int rk3228_set_speed(struct rk_priv_data *bsp_priv,
@@ -468,6 +468,7 @@ static const struct rk_gmac_ops rk3228_ops = {
 
 	.clock_grf_reg = RK3228_GRF_MAC_CON1,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(9, 8),
+	.clock.mac_speed_mask = BIT_U16(2),
 };
 
 #define RK3288_GRF_SOC_CON1	0x0248
@@ -476,8 +477,6 @@ static const struct rk_gmac_ops rk3228_ops = {
 /*RK3288_GRF_SOC_CON1*/
 #define RK3288_GMAC_FLOW_CTRL		GRF_BIT(9)
 #define RK3288_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(9)
-#define RK3288_GMAC_SPEED_10M		GRF_CLR_BIT(10)
-#define RK3288_GMAC_SPEED_100M		GRF_BIT(10)
 #define RK3288_GMAC_RMII_CLK_25M	GRF_BIT(11)
 #define RK3288_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(11)
 
@@ -503,8 +502,8 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3288_reg_speed_data = {
-	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M | RK3288_GMAC_SPEED_10M,
-	.rmii_100 = RK3288_GMAC_RMII_CLK_25M | RK3288_GMAC_SPEED_100M,
+	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3288_GMAC_RMII_CLK_25M,
 };
 
 static int rk3288_set_speed(struct rk_priv_data *bsp_priv,
@@ -525,6 +524,7 @@ static const struct rk_gmac_ops rk3288_ops = {
 
 	.clock_grf_reg = RK3288_GRF_SOC_CON1,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(13, 12),
+	.clock.mac_speed_mask = BIT_U16(10),
 };
 
 #define RK3308_GRF_MAC_CON0		0x04a0
@@ -532,16 +532,12 @@ static const struct rk_gmac_ops rk3288_ops = {
 /* RK3308_GRF_MAC_CON0 */
 #define RK3308_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3308_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3308_GMAC_SPEED_10M		GRF_CLR_BIT(0)
-#define RK3308_GMAC_SPEED_100M		GRF_BIT(0)
 
 static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
 static const struct rk_reg_speed_data rk3308_reg_speed_data = {
-	.rmii_10 = RK3308_GMAC_SPEED_10M,
-	.rmii_100 = RK3308_GMAC_SPEED_100M,
 };
 
 static int rk3308_set_speed(struct rk_priv_data *bsp_priv,
@@ -559,6 +555,7 @@ static const struct rk_gmac_ops rk3308_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(4, 2),
 
 	.clock_grf_reg = RK3308_GRF_MAC_CON0,
+	.clock.mac_speed_mask = BIT_U16(0),
 };
 
 #define RK3328_GRF_MAC_CON0	0x0900
@@ -573,8 +570,6 @@ static const struct rk_gmac_ops rk3308_ops = {
 /* RK3328_GRF_MAC_CON1 */
 #define RK3328_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RK3328_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RK3328_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RK3328_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3328_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3328_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -619,8 +614,8 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3328_reg_speed_data = {
-	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M | RK3328_GMAC_SPEED_10M,
-	.rmii_100 = RK3328_GMAC_RMII_CLK_25M | RK3328_GMAC_SPEED_100M,
+	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3328_GMAC_RMII_CLK_25M,
 };
 
 static int rk3328_set_speed(struct rk_priv_data *bsp_priv,
@@ -649,6 +644,8 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 	.gmac_rmii_mode_mask = BIT_U16(9),
 
+	.clock.mac_speed_mask = BIT_U16(2),
+
 	.regs_valid = true,
 	.regs = {
 		0xff540000, /* gmac2io */
@@ -663,8 +660,6 @@ static const struct rk_gmac_ops rk3328_ops = {
 /* RK3366_GRF_SOC_CON6 */
 #define RK3366_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3366_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3366_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3366_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3366_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3366_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -690,8 +685,8 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3366_reg_speed_data = {
-	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M | RK3366_GMAC_SPEED_10M,
-	.rmii_100 = RK3366_GMAC_RMII_CLK_25M | RK3366_GMAC_SPEED_100M,
+	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3366_GMAC_RMII_CLK_25M,
 };
 
 static int rk3366_set_speed(struct rk_priv_data *bsp_priv,
@@ -712,6 +707,7 @@ static const struct rk_gmac_ops rk3366_ops = {
 
 	.clock_grf_reg = RK3366_GRF_SOC_CON6,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.clock.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3368_GRF_SOC_CON15	0x043c
@@ -720,8 +716,6 @@ static const struct rk_gmac_ops rk3366_ops = {
 /* RK3368_GRF_SOC_CON15 */
 #define RK3368_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3368_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3368_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3368_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3368_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3368_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -747,8 +741,8 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3368_reg_speed_data = {
-	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M | RK3368_GMAC_SPEED_10M,
-	.rmii_100 = RK3368_GMAC_RMII_CLK_25M | RK3368_GMAC_SPEED_100M,
+	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3368_GMAC_RMII_CLK_25M,
 };
 
 static int rk3368_set_speed(struct rk_priv_data *bsp_priv,
@@ -769,6 +763,7 @@ static const struct rk_gmac_ops rk3368_ops = {
 
 	.clock_grf_reg = RK3368_GRF_SOC_CON15,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.clock.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3399_GRF_SOC_CON5	0xc214
@@ -777,8 +772,6 @@ static const struct rk_gmac_ops rk3368_ops = {
 /* RK3399_GRF_SOC_CON5 */
 #define RK3399_GMAC_FLOW_CTRL		GRF_BIT(8)
 #define RK3399_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
-#define RK3399_GMAC_SPEED_10M		GRF_CLR_BIT(7)
-#define RK3399_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3399_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3399_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
 
@@ -804,8 +797,8 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3399_reg_speed_data = {
-	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M | RK3399_GMAC_SPEED_10M,
-	.rmii_100 = RK3399_GMAC_RMII_CLK_25M | RK3399_GMAC_SPEED_100M,
+	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RK3399_GMAC_RMII_CLK_25M,
 };
 
 static int rk3399_set_speed(struct rk_priv_data *bsp_priv,
@@ -826,6 +819,7 @@ static const struct rk_gmac_ops rk3399_ops = {
 
 	.clock_grf_reg = RK3399_GRF_SOC_CON5,
 	.clock.gmii_clk_sel_mask = GENMASK_U16(5, 4),
+	.clock.mac_speed_mask = BIT_U16(7),
 };
 
 #define RK3506_GRF_SOC_CON8		0x0020
@@ -1370,8 +1364,6 @@ static const struct rk_gmac_ops rk3588_ops = {
 /* RV1108_GRF_GMAC_CON0 */
 #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
 #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
-#define RV1108_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define RV1108_GMAC_SPEED_100M		GRF_BIT(2)
 #define RV1108_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RV1108_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
 
@@ -1380,8 +1372,8 @@ static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rv1108_reg_speed_data = {
-	.rmii_10 = RV1108_GMAC_RMII_CLK_2_5M | RV1108_GMAC_SPEED_10M,
-	.rmii_100 = RV1108_GMAC_RMII_CLK_25M | RV1108_GMAC_SPEED_100M,
+	.rmii_10 = RV1108_GMAC_RMII_CLK_2_5M,
+	.rmii_100 = RV1108_GMAC_RMII_CLK_25M,
 };
 
 static int rv1108_set_speed(struct rk_priv_data *bsp_priv,
@@ -1399,6 +1391,7 @@ static const struct rk_gmac_ops rv1108_ops = {
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 
 	.clock_grf_reg = RV1108_GRF_GMAC_CON0,
+	.clock.mac_speed_mask = BIT_U16(2),
 };
 
 #define RV1126_GRF_GMAC_CON0		0X0070
-- 
2.47.3


