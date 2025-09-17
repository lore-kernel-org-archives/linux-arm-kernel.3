Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1608ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHSQ+RaFu0KBQqFTLVbeHlZC6n9bOFTaTq8CjHGDQOw=; b=qKl1Ygo9ViOuwyUVB6Bg2l/Nxb
	WUp5y4Hrl1Vjg5yV8Q5JBnwhs9zcl5q9waa6dKUNrVe1sPkFzuaJsClKLPULp/wCOEnF5WCouiS1p
	Rqar3zPuZphyIM92wjiO1yFQy4/ytq2uHw1G7qOxx4xVXHhNUib0hal7MXxiraq4ydWPKcPZ6Fkq+
	Yn9NAdlANj+pK6tEYeC+xUjrHj6AJqBDMR6+VySArg7NyzB9uG2FrsRAUDPYdbKWDRuOzOhvJ1J2C
	539PggV5m790qN3fz3oL9/SSLLJ/ELQHA89Ek8vPe0r3mJomtpZLkFNcAh+9YKEfrA8kZK+Z5JQ3m
	ha0BfC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpt-0000000CaR5-21Bd;
	Wed, 17 Sep 2025 15:12:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpr-0000000CaK2-0kpJ;
	Wed, 17 Sep 2025 15:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yHSQ+RaFu0KBQqFTLVbeHlZC6n9bOFTaTq8CjHGDQOw=; b=MKAuvQDtEtgNfMzhwzjV8r8xgP
	MA40JSEfx2W+1qrr8SwP2ukornVJjksr1bNjlM2u8GrzNvFS2gnmrInqIPa3CIVQlBwasWSruJhtw
	lF4RPM2ySN1xcB7urXSizeXm73q3+OIPrPaNIqji8HTilKukU4QQGGUkJ7F/2LPK6a12KSY7okHOK
	iSwU6pzn1CjUQihhwZLDyjzHurthSlqDajFfhnzp2OGzbeKYZ0/eMOYs5xLXEXIE4TIgR6CNso4eC
	gHQGuc+bX2AyjCm3lTupCItG1qU2yIzRMSz8Ldqy8gKzsfXRcvgMwFnp+Drl+m1dn/Kh1t4O6DufU
	OpOF9rNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58692 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytpT-000000004kx-365Q;
	Wed, 17 Sep 2025 16:12:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpQ-00000006H2L-2Jzb;
	Wed, 17 Sep 2025 16:12:16 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 04/10] net: stmmac: ingenic: convert to use
 phy_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpQ-00000006H2L-2Jzb@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:16 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081243_223223_56D28AD8 
X-CRM114-Status: GOOD (  11.13  )
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

dwmac-ingenic uses only MII, RMII, GMII or RGMII interface modes, none
of which require any kind of conversion between the MAC and external
world. Thus, mac_interface and phy_interface will be the same.

Convert dwmac-ingenic to use phy_interface when determining the
interface mode that the dwmac core should be configured to at reset,
rather than mac_interface.

Also convert the error prints to use phy_modes() and terminate with a
newline so that we get a human readable string rather than a number for
the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 15abe214131f..c1670f6bae14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -90,7 +90,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
 			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
@@ -119,7 +119,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -131,13 +132,14 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -150,14 +152,15 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -170,7 +173,7 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
 			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
@@ -178,7 +181,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -191,7 +195,7 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
 			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
@@ -221,7 +225,8 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(mac->dev, "Unsupported interface %d", plat_dat->mac_interface);
+		dev_err(mac->dev, "Unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
-- 
2.47.3


