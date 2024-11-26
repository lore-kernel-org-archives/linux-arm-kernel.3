Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B53D3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jnlk8pgjtpSm97dX6ohrXw6e5+wjuRHBrA+ATzZX3UM=; b=fQMML3y46G85tpDl5OHIsNk0rb
	dxoM5mLhTAtVaQ+SvbJDGfL3AMgXb7nVPeMp2MXNtKdeK7gf1hIGSZqAT3I0vrggrGrTKwX5nnJHw
	vlO3pG1uePMViXX6cou9l2iaw13G3d3qV4E+ySbSMnQ034rWZQiQ56p74bVD99WTdfz/i5DXgMhr6
	TSTO590iEv+mhdtwivM5D2ygJKWGnL0ak5GNvbiqn4eN8W22cKhcCTP7+I5u/RQUud0ODIcCh/G3+
	pRN2nadJIGNdmMzxp6y5OMKFtNh1UceH7L3jnwEyF8+LJrpJ0xBPmmRmhexDrjVO/hAv1sLSHnPC1
	4ZmKwKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvLa-0000000AfOZ-1x3v;
	Tue, 26 Nov 2024 13:11:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4b-0000000AcIo-1eRU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jnlk8pgjtpSm97dX6ohrXw6e5+wjuRHBrA+ATzZX3UM=; b=l38OLZFXhmNmWByOF/I8WEVWJy
	FgVeNPP90JOJEwnXTwgK5l1FP9eeLclbvVxme5Fx3vPkTIh1xMClDqxx47irbqPOHFeaCLOOpTfzI
	5qoVZwYcQupV9Y96QsXspzaOL1WWUadrp+b/13XLqNXqORRYzKIUV4xAhH6B8dg/X7KFOSxx8lDa2
	TzBFNn+wlszRg8SiNlW2HuQ8zi9CrenhcPVLzM7G06SAIlNE78fvgZdUDsKGePluD71p4uhAZZ9H4
	s1klZ2+/lQgauTavjMO5NyocNPR73kv8IsJZPXldVBNKVHdQ694gNEsrBm7jeK2xcU2coLMaf7XP+
	hF00yiHA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38222 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4V-0006wo-0Q;
	Tue, 26 Nov 2024 12:53:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv4U-005yj2-0F; Tue, 26 Nov 2024 12:53:38 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 17/23] net: stmmac: move tx_lpi_timer tracking to
 phylib
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv4U-005yj2-0F@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045345_428204_22A75CFC 
X-CRM114-Status: GOOD (  16.08  )
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

When stmmac_ethtool_op_get_eee() is called, stmmac sets the tx_lpi_timer
and tx_lpi_enabled members, and then calls into phylink and thus phylib.
phylib overwrites these members.

phylib will also cause a link down/link up transition when settings
that impact the MAC have been changed.

Convert stmmac to use the tx_lpi_timer setting in struct phy_device,
updating priv->tx_lpi_timer each time when the link comes up, rather
than trying to maintain this user setting itself. We initialise the
phylib tx_lpi_timer setting by doing a get_ee-modify-set_eee sequence
with the last known priv->tx_lpi_timer value. In order for this to work
correctly, we also need this member to be initialised earlier.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c   | 14 +-------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1d77389ce953..5ce095a62feb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -898,7 +898,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	edata->tx_lpi_timer = priv->tx_lpi_timer;
 	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
 
 	return phylink_ethtool_get_eee(priv->phylink, edata);
@@ -908,7 +907,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 				     struct ethtool_keee *edata)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret;
 
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
@@ -920,17 +918,7 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 	if (!edata->eee_enabled)
 		stmmac_disable_eee_mode(priv);
 
-	ret = phylink_ethtool_set_eee(priv->phylink, edata);
-	if (ret)
-		return ret;
-
-	if (edata->eee_enabled &&
-	    priv->tx_lpi_timer != edata->tx_lpi_timer) {
-		priv->tx_lpi_timer = edata->tx_lpi_timer;
-		stmmac_eee_init(priv);
-	}
-
-	return 0;
+	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
 static u32 stmmac_usec2riwt(u32 usec, struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3cdc3910f3a0..61d85281d75b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1088,6 +1088,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 			phy_init_eee(phy, !(priv->plat->flags &
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
+		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
@@ -1183,6 +1184,15 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 	}
 
+	if (ret == 0) {
+		struct ethtool_keee eee;
+
+		if (phylink_ethtool_get_eee(priv->phylink, &eee)) {
+			eee.tx_lpi_timer = priv->tx_lpi_timer;
+			phylink_ethtool_set_eee(priv->phylink, &eee);
+		}
+	}
+
 	if (!priv->plat->pmt) {
 		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
 
@@ -3435,10 +3445,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
 
-	/* Convert the timer from msec to usec */
-	if (!priv->tx_lpi_timer)
-		priv->tx_lpi_timer = eee_timer * 1000;
-
 	if (priv->use_riwt) {
 		u32 queue;
 
@@ -3905,6 +3911,10 @@ static int __stmmac_open(struct net_device *dev,
 	u32 chan;
 	int ret;
 
+	/* Initialise the tx lpi timer, converting from msec to usec */
+	if (!priv->tx_lpi_timer)
+		priv->tx_lpi_timer = eee_timer * 1000;
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
-- 
2.30.2


