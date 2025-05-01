Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4F2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgop55mX+h2K4OCekjSKKqWx/tXVnI8uvVHWE2m8nL4=; b=MhdDKXUYNo1ieZLL/0FokdTZ/A
	5tmkWqbAqdRALCw/lEF5z+2Os6Ir8y8n6KFO0K1zJ3P2X5NbQhjWe487lvzmNha5sSmDkaotodu8h
	Mdkho/n3AxJUXWOy6GeriSoA17peazu1xsxre0iwZAC6jL/Zf95vLW3tI7ZCk0SOE2PXHjK32Uuj+
	x/xFOJRP4wbk8r39D8fHBBTvhc6H1lj/y8Jql5G9YzFOCKgl7IZRlthvE3lemWvXaiwv2jhnsR8US
	tHRBtoye3YK/crhxOUqRXSMXjVgFU17Crhvbm/n46g4+QTW37XeT/JPNO4weWsb/Ok960TP0BEIu0
	mX8XGzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASoA-0000000FTpI-1Isf;
	Thu, 01 May 2025 12:14:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASMb-0000000FJPm-1Jo1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mgop55mX+h2K4OCekjSKKqWx/tXVnI8uvVHWE2m8nL4=; b=HSZjDXus/XrPdX15GGFhHryWw3
	CLU8YBVsc+pgT88LzbN9IwyZT/JROs3dFvEiSKxxh9n4maj3q0Aknh0u9sAnK2OQmZ3rD1ZLy7jIc
	iwHeDFIEc5Ql2rzFuCDcFDIs4HcfacowdDKZa+OESGNUM2DZgqUC4UWdOs0Jj7Tk5FUfnkXz5Zjfa
	kJ8kUiXGKjepcQbGqAMMxdKB8nHoa5+W9XTOqryi+aAh4gFnBVXRB9ogxo/okYtTHb0vKUxwPpxu8
	qU54M+Kp9ox/567yQ83S62pseQ2ru2bEEVVQdzfaYeZH7qYlzhx6fUS5Uey+P4w6E15OoS7+JGKA9
	/L44hUpg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59058 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uASMU-00005G-2r;
	Thu, 01 May 2025 12:45:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uASLn-0021Qd-Mi; Thu, 01 May 2025 12:45:11 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 3/6] net: stmmac: add get_interfaces() platform
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uASLn-0021Qd-Mi@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:11 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044601_352420_1B2D70F5 
X-CRM114-Status: GOOD (  15.31  )
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

Add a get_interfaces() platform method to allow platforms to indicate
to phylink which interface modes they support - which then allows
phylink to validate on initialisation that the configured PHY interface
mode is actually supported.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++++++++---
 include/linux/stmmac.h                           |  2 ++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ac6ab121eb33..5f66f816a249 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1283,10 +1283,20 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (mdio_bus_data)
 		config->default_an_inband = mdio_bus_data->default_an_inband;
 
-	/* Set the platform/firmware specified interface mode. Note, phylink
-	 * deals with the PHY interface mode, not the MAC interface mode.
+	/* Get the PHY interface modes (at the PHY end of the link) that
+	 * are supported by the platform.
 	 */
-	__set_bit(priv->plat->phy_interface, config->supported_interfaces);
+	if (priv->plat->get_interfaces)
+		priv->plat->get_interfaces(priv, priv->plat->bsp_priv,
+					   config->supported_interfaces);
+
+	/* Set the platform/firmware specified interface mode if the
+	 * supported interfaces have not already been provided using
+	 * phy_interface as a last resort.
+	 */
+	if (phy_interface_empty(config->supported_interfaces))
+		__set_bit(priv->plat->phy_interface,
+			  config->supported_interfaces);
 
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8aed09d65b4a..537bced69c46 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -233,6 +233,8 @@ struct plat_stmmacenet_data {
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
+	void (*get_interfaces)(struct stmmac_priv *priv, void *bsp_priv,
+			       unsigned long *interfaces);
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
-- 
2.30.2


