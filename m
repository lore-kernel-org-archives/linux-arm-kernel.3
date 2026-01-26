Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C44CF65E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Yu05EAsl6kTw5F/OQwJby6NHqAfG40p8VrCO9zN6J0=; b=nmeuGN4eEbm41KlgLR9ZH92y/J
	38pS0fVZcnpMPNNDiNr4fwoIzerjM5Wgo2kC6KxJOHipiAksiu+T2DeWE2letx1+/vajXj7f9nbxN
	1TA9LVhm+6o3R9i0JD1tzOqbMTuICHa6BO3qi7G6fVa0MB6KAoGtom9XGPKi3E0I1zgjnKjrAr7DV
	me+pBhk2Cko0Gw7Yf371G4Z0J7I+DzF7EtrZSh0A9A016Es/iTOtY/KCQ/EUvdoV3cRWgA5dRx7Ck
	KsmpVZ7lrVc2TZTGj39YeXj1RBKHFa2XS7PaieNDH0rH+VSy1600rOV6ePv/WWhdmnZkP5Ph1kQeP
	sSuzGL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2G-0000000CQoN-0iNR;
	Mon, 26 Jan 2026 11:45:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2C-0000000CQjG-1sfq;
	Mon, 26 Jan 2026 11:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2Yu05EAsl6kTw5F/OQwJby6NHqAfG40p8VrCO9zN6J0=; b=zjBmlQM8V1NZI53wUnI2VjKKmI
	yaeJUsmps8E9FTK1h7bjs6jWZ9vWnLJQBE/J357bxvsLxwL5BwOKqAE4dCffHtxhCgXk7Bkx/yyIK
	MSmxKA96GYT95j5O3Xm9rVm+o6hqipin8hu/APRRs8sHIQo4ni/TMOXMGjjGCm/yq0FCDTb1P4gaZ
	Nq9mcNhqe7NDaaO52XXRxfFPFtao/b/WjuABqncDHMTwxhrnmsUzZI1Xq8rhzOMvEnICzma7Rho3N
	rW93oV9eV07HMzF9orL8/1qWe4LesIldRed4epIrc2qfrc9o8nqDztt1iUzeJLL07qmKnWdPd0Nif
	xKODu6sQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37962 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL24-000000004ef-252B;
	Mon, 26 Jan 2026 11:45:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL23-00000005usc-22sK;
	Mon, 26 Jan 2026 11:45:23 +0000
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
Subject: [PATCH net-next v2 05/22] net: stmmac: rk: add GMAC_CLK_xx constants,
 simplify RGMII definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL23-00000005usc-22sK@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034532_650752_37148B52 
X-CRM114-Status: GOOD (  12.03  )
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

All the definitions of the RGMII related xxx_GMAC_CLK_xxx definitions
use the same field values to select the clock rate. Provide common
defintions for these field values, passing them in to a single macro
for each variant that generates the appropriate values for the speed
register.

No change to produced code on aarch64.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 108 ++++++++----------
 1 file changed, 45 insertions(+), 63 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 5f8d2031b97c..7f8ffd1549bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -91,6 +91,10 @@ struct rk_priv_data {
 	struct regmap *php_grf;
 };
 
+#define GMAC_CLK_DIV1_125M		0
+#define GMAC_CLK_DIV50_2_5M		2
+#define GMAC_CLK_DIV5_25M		3
+
 static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 			    const struct rk_reg_speed_data *rsd,
 			    unsigned int reg, phy_interface_t interface,
@@ -299,9 +303,7 @@ static const struct rk_gmac_ops px30_ops = {
 #define RK3128_GMAC_SPEED_100M         GRF_BIT(10)
 #define RK3128_GMAC_RMII_CLK_25M       GRF_BIT(11)
 #define RK3128_GMAC_RMII_CLK_2_5M      GRF_CLR_BIT(11)
-#define RK3128_GMAC_CLK_125M           GRF_FIELD_CONST(13, 12, 0)
-#define RK3128_GMAC_CLK_25M            GRF_FIELD_CONST(13, 12, 3)
-#define RK3128_GMAC_CLK_2_5M           GRF_FIELD_CONST(13, 12, 2)
+#define RK3128_GMAC_CLK(val)           GRF_FIELD_CONST(13, 12, val)
 #define RK3128_GMAC_RMII_MODE          GRF_BIT(14)
 #define RK3128_GMAC_RMII_MODE_CLR      GRF_CLR_BIT(14)
 
@@ -325,9 +327,9 @@ static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3128_reg_speed_data = {
-	.rgmii_10 = RK3128_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3128_GMAC_CLK_25M,
-	.rgmii_1000 = RK3128_GMAC_CLK_125M,
+	.rgmii_10 = RK3128_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3128_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3128_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3128_GMAC_RMII_CLK_2_5M | RK3128_GMAC_SPEED_10M,
 	.rmii_100 = RK3128_GMAC_RMII_CLK_25M | RK3128_GMAC_SPEED_100M,
 };
@@ -362,9 +364,7 @@ static const struct rk_gmac_ops rk3128_ops = {
 #define RK3228_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3228_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3228_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
-#define RK3228_GMAC_CLK_125M		GRF_FIELD_CONST(9, 8, 0)
-#define RK3228_GMAC_CLK_25M		GRF_FIELD_CONST(9, 8, 3)
-#define RK3228_GMAC_CLK_2_5M		GRF_FIELD_CONST(9, 8, 2)
+#define RK3228_GMAC_CLK(val)		GRF_FIELD_CONST(9, 8, val)
 #define RK3228_GMAC_RMII_MODE		GRF_BIT(10)
 #define RK3228_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(10)
 #define RK3228_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -399,9 +399,9 @@ static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3228_reg_speed_data = {
-	.rgmii_10 = RK3228_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3228_GMAC_CLK_25M,
-	.rgmii_1000 = RK3228_GMAC_CLK_125M,
+	.rgmii_10 = RK3228_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3228_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3228_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3228_GMAC_RMII_CLK_2_5M | RK3228_GMAC_SPEED_10M,
 	.rmii_100 = RK3228_GMAC_RMII_CLK_25M | RK3228_GMAC_SPEED_100M,
 };
@@ -440,9 +440,7 @@ static const struct rk_gmac_ops rk3228_ops = {
 #define RK3288_GMAC_SPEED_100M		GRF_BIT(10)
 #define RK3288_GMAC_RMII_CLK_25M	GRF_BIT(11)
 #define RK3288_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(11)
-#define RK3288_GMAC_CLK_125M		GRF_FIELD_CONST(13, 12, 0)
-#define RK3288_GMAC_CLK_25M		GRF_FIELD_CONST(13, 12, 3)
-#define RK3288_GMAC_CLK_2_5M		GRF_FIELD_CONST(13, 12, 2)
+#define RK3288_GMAC_CLK(val)		GRF_FIELD_CONST(13, 12, val)
 #define RK3288_GMAC_RMII_MODE		GRF_BIT(14)
 #define RK3288_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(14)
 
@@ -474,9 +472,9 @@ static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3288_reg_speed_data = {
-	.rgmii_10 = RK3288_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3288_GMAC_CLK_25M,
-	.rgmii_1000 = RK3288_GMAC_CLK_125M,
+	.rgmii_10 = RK3288_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3288_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3288_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3288_GMAC_RMII_CLK_2_5M | RK3288_GMAC_SPEED_10M,
 	.rmii_100 = RK3288_GMAC_RMII_CLK_25M | RK3288_GMAC_SPEED_100M,
 };
@@ -543,9 +541,7 @@ static const struct rk_gmac_ops rk3308_ops = {
 #define RK3328_GMAC_SPEED_100M		GRF_BIT(2)
 #define RK3328_GMAC_RMII_CLK_25M	GRF_BIT(7)
 #define RK3328_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(7)
-#define RK3328_GMAC_CLK_125M		GRF_FIELD_CONST(12, 11, 0)
-#define RK3328_GMAC_CLK_25M		GRF_FIELD_CONST(12, 11, 3)
-#define RK3328_GMAC_CLK_2_5M		GRF_FIELD_CONST(12, 11, 2)
+#define RK3328_GMAC_CLK(val)		GRF_FIELD_CONST(12, 11, val)
 #define RK3328_GMAC_RMII_MODE		GRF_BIT(9)
 #define RK3328_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(9)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
@@ -580,9 +576,9 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3328_reg_speed_data = {
-	.rgmii_10 = RK3328_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3328_GMAC_CLK_25M,
-	.rgmii_1000 = RK3328_GMAC_CLK_125M,
+	.rgmii_10 = RK3328_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3328_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3328_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3328_GMAC_RMII_CLK_2_5M | RK3328_GMAC_SPEED_10M,
 	.rmii_100 = RK3328_GMAC_RMII_CLK_25M | RK3328_GMAC_SPEED_100M,
 };
@@ -632,9 +628,7 @@ static const struct rk_gmac_ops rk3328_ops = {
 #define RK3366_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3366_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3366_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
-#define RK3366_GMAC_CLK_125M		GRF_FIELD_CONST(5, 4, 0)
-#define RK3366_GMAC_CLK_25M		GRF_FIELD_CONST(5, 4, 3)
-#define RK3366_GMAC_CLK_2_5M		GRF_FIELD_CONST(5, 4, 2)
+#define RK3366_GMAC_CLK(val)		GRF_FIELD_CONST(5, 4, val)
 #define RK3366_GMAC_RMII_MODE		GRF_BIT(6)
 #define RK3366_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(6)
 
@@ -666,9 +660,9 @@ static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3366_reg_speed_data = {
-	.rgmii_10 = RK3366_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3366_GMAC_CLK_25M,
-	.rgmii_1000 = RK3366_GMAC_CLK_125M,
+	.rgmii_10 = RK3366_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3366_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3366_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3366_GMAC_RMII_CLK_2_5M | RK3366_GMAC_SPEED_10M,
 	.rmii_100 = RK3366_GMAC_RMII_CLK_25M | RK3366_GMAC_SPEED_100M,
 };
@@ -697,9 +691,7 @@ static const struct rk_gmac_ops rk3366_ops = {
 #define RK3368_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3368_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3368_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
-#define RK3368_GMAC_CLK_125M		GRF_FIELD_CONST(5, 4, 0)
-#define RK3368_GMAC_CLK_25M		GRF_FIELD_CONST(5, 4, 3)
-#define RK3368_GMAC_CLK_2_5M		GRF_FIELD_CONST(5, 4, 2)
+#define RK3368_GMAC_CLK(val)		GRF_FIELD_CONST(5, 4, val)
 #define RK3368_GMAC_RMII_MODE		GRF_BIT(6)
 #define RK3368_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(6)
 
@@ -731,9 +723,9 @@ static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3368_reg_speed_data = {
-	.rgmii_10 = RK3368_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3368_GMAC_CLK_25M,
-	.rgmii_1000 = RK3368_GMAC_CLK_125M,
+	.rgmii_10 = RK3368_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3368_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3368_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3368_GMAC_RMII_CLK_2_5M | RK3368_GMAC_SPEED_10M,
 	.rmii_100 = RK3368_GMAC_RMII_CLK_25M | RK3368_GMAC_SPEED_100M,
 };
@@ -762,9 +754,7 @@ static const struct rk_gmac_ops rk3368_ops = {
 #define RK3399_GMAC_SPEED_100M		GRF_BIT(7)
 #define RK3399_GMAC_RMII_CLK_25M	GRF_BIT(3)
 #define RK3399_GMAC_RMII_CLK_2_5M	GRF_CLR_BIT(3)
-#define RK3399_GMAC_CLK_125M		GRF_FIELD_CONST(5, 4, 0)
-#define RK3399_GMAC_CLK_25M		GRF_FIELD_CONST(5, 4, 3)
-#define RK3399_GMAC_CLK_2_5M		GRF_FIELD_CONST(5, 4, 2)
+#define RK3399_GMAC_CLK(val)		GRF_FIELD_CONST(5, 4, val)
 #define RK3399_GMAC_RMII_MODE		GRF_BIT(6)
 #define RK3399_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(6)
 
@@ -796,9 +786,9 @@ static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3399_reg_speed_data = {
-	.rgmii_10 = RK3399_GMAC_CLK_2_5M,
-	.rgmii_100 = RK3399_GMAC_CLK_25M,
-	.rgmii_1000 = RK3399_GMAC_CLK_125M,
+	.rgmii_10 = RK3399_GMAC_CLK(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3399_GMAC_CLK(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3399_GMAC_CLK(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3399_GMAC_RMII_CLK_2_5M | RK3399_GMAC_SPEED_10M,
 	.rmii_100 = RK3399_GMAC_RMII_CLK_25M | RK3399_GMAC_SPEED_100M,
 };
@@ -905,9 +895,7 @@ static const struct rk_gmac_ops rk3506_ops = {
 #define RK3528_GMAC1_CLK_RMII_DIV2	GRF_BIT(10)
 #define RK3528_GMAC1_CLK_RMII_DIV20	GRF_CLR_BIT(10)
 
-#define RK3528_GMAC1_CLK_RGMII_DIV1	GRF_FIELD_CONST(11, 10, 0)
-#define RK3528_GMAC1_CLK_RGMII_DIV5	GRF_FIELD_CONST(11, 10, 3)
-#define RK3528_GMAC1_CLK_RGMII_DIV50	GRF_FIELD_CONST(11, 10, 2)
+#define RK3528_GMAC1_CLK_RGMII(val)	GRF_FIELD_CONST(11, 10, val)
 
 #define RK3528_GMAC0_CLK_RMII_GATE	GRF_BIT(2)
 #define RK3528_GMAC0_CLK_RMII_NOGATE	GRF_CLR_BIT(2)
@@ -945,9 +933,9 @@ static const struct rk_reg_speed_data rk3528_gmac0_reg_speed_data = {
 };
 
 static const struct rk_reg_speed_data rk3528_gmac1_reg_speed_data = {
-	.rgmii_10 = RK3528_GMAC1_CLK_RGMII_DIV50,
-	.rgmii_100 = RK3528_GMAC1_CLK_RGMII_DIV5,
-	.rgmii_1000 = RK3528_GMAC1_CLK_RGMII_DIV1,
+	.rgmii_10 = RK3528_GMAC1_CLK_RGMII(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3528_GMAC1_CLK_RGMII(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3528_GMAC1_CLK_RGMII(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3528_GMAC1_CLK_RMII_DIV20,
 	.rmii_100 = RK3528_GMAC1_CLK_RMII_DIV2,
 };
@@ -1099,9 +1087,7 @@ static const struct rk_gmac_ops rk3568_ops = {
 #define RK3576_GMAC_CLK_RMII_DIV2		GRF_BIT(5)
 #define RK3576_GMAC_CLK_RMII_DIV20		GRF_CLR_BIT(5)
 
-#define RK3576_GMAC_CLK_RGMII_DIV1		GRF_FIELD_CONST(6, 5, 0)
-#define RK3576_GMAC_CLK_RGMII_DIV5		GRF_FIELD_CONST(6, 5, 3)
-#define RK3576_GMAC_CLK_RGMII_DIV50		GRF_FIELD_CONST(6, 5, 2)
+#define RK3576_GMAC_CLK_RGMII(val)		GRF_FIELD_CONST(6, 5, val)
 
 #define RK3576_GMAC_CLK_RMII_GATE		GRF_BIT(4)
 #define RK3576_GMAC_CLK_RMII_NOGATE		GRF_CLR_BIT(4)
@@ -1145,9 +1131,9 @@ static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
 }
 
 static const struct rk_reg_speed_data rk3578_reg_speed_data = {
-	.rgmii_10 = RK3576_GMAC_CLK_RGMII_DIV50,
-	.rgmii_100 = RK3576_GMAC_CLK_RGMII_DIV5,
-	.rgmii_1000 = RK3576_GMAC_CLK_RGMII_DIV1,
+	.rgmii_10 = RK3576_GMAC_CLK_RGMII(GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3576_GMAC_CLK_RGMII(GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3576_GMAC_CLK_RGMII(GMAC_CLK_DIV1_125M),
 	.rmii_10 = RK3576_GMAC_CLK_RMII_DIV20,
 	.rmii_100 = RK3576_GMAC_CLK_RMII_DIV2,
 };
@@ -1223,12 +1209,8 @@ static const struct rk_gmac_ops rk3576_ops = {
 #define RK3588_GMA_CLK_RMII_DIV2(id)		GRF_BIT(5 * (id) + 2)
 #define RK3588_GMA_CLK_RMII_DIV20(id)		GRF_CLR_BIT(5 * (id) + 2)
 
-#define RK3588_GMAC_CLK_RGMII_DIV1(id)		\
-	(GRF_FIELD_CONST(3, 2, 0) << ((id) * 5))
-#define RK3588_GMAC_CLK_RGMII_DIV5(id)		\
-	(GRF_FIELD_CONST(3, 2, 3) << ((id) * 5))
-#define RK3588_GMAC_CLK_RGMII_DIV50(id)		\
-	(GRF_FIELD_CONST(3, 2, 2) << ((id) * 5))
+#define RK3588_GMAC_CLK_RGMII(id, val)		\
+	(GRF_FIELD_CONST(3, 2, val) << ((id) * 5))
 
 #define RK3588_GMAC_CLK_RMII_GATE(id)		GRF_BIT(5 * (id) + 1)
 #define RK3588_GMAC_CLK_RMII_NOGATE(id)		GRF_CLR_BIT(5 * (id) + 1)
@@ -1275,17 +1257,17 @@ static int rk3588_set_gmac_speed(struct rk_priv_data *bsp_priv,
 		if (interface == PHY_INTERFACE_MODE_RMII)
 			val = RK3588_GMA_CLK_RMII_DIV20(id);
 		else
-			val = RK3588_GMAC_CLK_RGMII_DIV50(id);
+			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV50_2_5M);
 		break;
 	case 100:
 		if (interface == PHY_INTERFACE_MODE_RMII)
 			val = RK3588_GMA_CLK_RMII_DIV2(id);
 		else
-			val = RK3588_GMAC_CLK_RGMII_DIV5(id);
+			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV5_25M);
 		break;
 	case 1000:
 		if (interface != PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMAC_CLK_RGMII_DIV1(id);
+			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV1_125M);
 		else
 			goto err;
 		break;
-- 
2.47.3


