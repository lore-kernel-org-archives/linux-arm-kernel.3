Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE4ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRAJRW4WfloKke+sA3cXYCgUSWJDPjglxO5sAwdnW9Y=; b=2RUJ9+Di+EQd4p9g1BaDR+8RYa
	GbaCyDqH58c353hSQqbUxjKRvppkvBfciXGl5GGIzc4NEQ2gADTRV565o0eNPT997xPAqN8CTxq2v
	NgsLk/N1iXnALvvaHtkUXCaPB7d+S8uJe04N/qjbJN8qfe4s1C5dfGCpmewzjQAENQ7p/nuUFsNk0
	mvMOBRwsLJWDkHuk8Z0yaGSEtkfNsVPIdg2y5pBAOSGEzPXLwhRci+W3UtY7ui7q7xj9Wrx63llmC
	SIJ0R5NW2b52H9bXpaqtWjpbJB8kEqnv8fsPZ1C1xh2+uhZr/aL6ZDFJkfcnGDRFDJT6qYIcCNlQq
	8Jx4BjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu6L-0000000CiRa-05Jv;
	Wed, 17 Sep 2025 15:29:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu6K-0000000CiR2-0Alu;
	Wed, 17 Sep 2025 15:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=JRAJRW4WfloKke+sA3cXYCgUSWJDPjglxO5sAwdnW9Y=; b=Fd73Bh7S8lnlbDZh5RXasb9yhS
	eu1+PdkpDNi9z2ac80XNI3cVbGhT2FNjwN9LexSz6wIPblJucNQ7FmVODAK+8AE9Duwqtk4ygyGZ1
	Whl44rdhvj60j4jZxhG6Kndb5WemK5d1AbGNWyH1sgyq/ipz5V4bTYNP61+rgNU734pQ3IYpaPlcC
	OGMHzI0qwyvezG1afTOO5P5mnRr0uAENyGy+JCYPAvAFFK2uIfkD6di2ShEvhEG3cIsD6Y36FicIL
	+338uvjL2hen0tPw3JXrb1GED37nsQHhH3wIDX0AHxVQyd3RJ3Rn0lJOF5yxr+AswgFAcqiZQQxIv
	JPVRimmg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu6H-00000007Qvf-0rck;
	Wed, 17 Sep 2025 15:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JRAJRW4WfloKke+sA3cXYCgUSWJDPjglxO5sAwdnW9Y=; b=0YjQF4VTUahjY2yLEZTHLsirA9
	PmtQnLqyIa+N9Biz3pWT4UPa3AVij5qesBfp0YDnwdGc7Wq/WQ1+HwQdPkENVqDIksW9znV3+9a1f
	ISQo4WIImUOMmHsM8Emuf9P0MCwoxa9RL6W22jfMyjn+1s9PO1SsErOlhang4vSFhpbtPRs8dVGQp
	0wJvgqB+ECAtCKkcn3K0P85Yls1KJnJij/sQSIbuA/LTdqLRxtrAnUeEZ3MPg26dAqFC1MPz3/QRg
	3j1ZDLRaIkCR2+CcgGv6s86gtpKnLs63wPqVlWK29iTQXbWglpSXwCtqk/uszytdKzEvu+lrUirz3
	9KJyp2Nw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42810 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytpu-000000004mr-1r1L;
	Wed, 17 Sep 2025 16:12:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpq-00000006H2q-0ajY;
	Wed, 17 Sep 2025 16:12:42 +0100
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
Subject: [PATCH net-next 09/10] net: stmmac: thead: convert to use
 phy_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpq-00000006H2q-0ajY@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:42 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_162941_393482_F96E702B 
X-CRM114-Status: GOOD (  11.48  )
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

dwmac-thead supports either MII or RGMII interface modes only.

None of the DTS files set "mac-mode", so mac_interface will be
identical to phy_interface.

Convert dwmac-thead to use phy_interface when determining the
interface mode rather than mac_interface.

Also convert the error prints to use phy_modes() so that we get a
meaningful string rather than a number for the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index 6c6c49e4b66f..a3378046b061 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -56,7 +56,7 @@ static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
 	struct thead_dwmac *dwmac = plat->bsp_priv;
 	u32 phyif;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		phyif = PHY_INTF_MII_GMII;
 		break;
@@ -67,8 +67,8 @@ static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
 		phyif = PHY_INTF_RGMII;
 		break;
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -81,7 +81,7 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 	struct thead_dwmac *dwmac = plat->bsp_priv;
 	u32 txclk_dir;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		txclk_dir = TXCLK_DIR_INPUT;
 		break;
@@ -92,8 +92,8 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 		txclk_dir = TXCLK_DIR_OUTPUT;
 		break;
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
@@ -112,7 +112,7 @@ static int thead_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 	plat = dwmac->plat;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	/* For MII, rxc/txc is provided by phy */
 	case PHY_INTERFACE_MODE_MII:
 		return 0;
@@ -143,8 +143,8 @@ static int thead_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 		return 0;
 
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 }
@@ -154,7 +154,7 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 	struct thead_dwmac *dwmac = plat->bsp_priv;
 	u32 reg, div;
 
-	switch (plat->mac_interface) {
+	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
 		break;
@@ -177,8 +177,8 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 		break;
 
 	default:
-		dev_err(dwmac->dev, "unsupported phy interface %d\n",
-			plat->mac_interface);
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
 		return -EINVAL;
 	}
 
-- 
2.47.3


