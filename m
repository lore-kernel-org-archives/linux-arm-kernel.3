Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DD0D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86MjfvWnJQi9fO+/XaHjcVwzFGECVkyvIJk5JlTA9Ng=; b=jZVYHMxtxMTuEVLu1F2o5bWgO0
	ukkWP0sLcVUK1JcRImxGpU2pD99db/FBD+7jQqY+nDe0esaGFVwG12o0D1JLZYLO2IXGBQKlHVAx3
	Pt/S7zu+HxBG2P5h3Sj0OB9FierGLEEQLPemyxvHZr06ssUOiDSynjxbEUNajZyBWnmamml6O9P0i
	4cIFKcn/HOekHR/2FOxmG4E4AhEALopT2EL/Q07jbbU3F6BejfB9+7Eo1IEk2KjKJVejU8+XhNd/5
	HUZnHv81p0yMT1d9WjgwL1we9BxaLOi3BvvjegGoBfmZhY2UIWdYiiGhj37VCYLMYd3O0YimzsRZE
	S6OIE0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvKe-0000000AfFv-2yIf;
	Tue, 26 Nov 2024 13:10:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4X-0000000AcHJ-1GLO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=86MjfvWnJQi9fO+/XaHjcVwzFGECVkyvIJk5JlTA9Ng=; b=Tq9xLNz5Iv73eyLH2Ytn/cIzsx
	YfvGjrxg9xdpmuM0WM+BtmX8GB6VU5q1VYm+l30Yt6TJ7GbFt3NTyge0H86nPjPbMU071gNRbRCKY
	JmsTplmSzYHslrlvVVUh7asrgkb+CN9uw5GgmLLddEArELQkaS+nEtQNdRp+GGeOKqrwhDf+J09RP
	j+t1Xz0VM/4HzxYv/+MKSLU4FPT7y4XOVmMFu1Wy+az3FSj7Hm+U3th8JHFakaZc0GjWMGUpmhfd/
	3yKACXvmWQ7afsC0MnQl0wcv7XW40cbAO7707kfKmvRGr6j0xZYmnnGjdluNteFQPq3b1AWEyqzUL
	Bt9XTzvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40382 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4Q-0006wS-12;
	Tue, 26 Nov 2024 12:53:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv4O-005yiw-St; Tue, 26 Nov 2024 12:53:32 +0000
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
Subject: [PATCH RFC net-next 16/23] net: lan743x: convert to phylink managed
 EEE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv4O-005yiw-St@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045341_488344_E7DB2155 
X-CRM114-Status: GOOD (  15.84  )
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

Convert lan743x to phylink managed EEE:
- Set the lpi_capabilties.
- Move the call to lan743x_mac_eee_enable() into the enable/disable
  tx_lpi functions.
- Ensure that EEEEN is clear during probe.
- Move the setting of the LPI timer into mac_enable_tx_lpi().
- Move reading of LPI timer to phylink initialisation to set the
  default timer value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/microchip/lan743x_ethtool.c  | 21 -----------
 drivers/net/ethernet/microchip/lan743x_main.c | 37 ++++++++++++++++---
 drivers/net/ethernet/microchip/lan743x_main.h |  1 -
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_ethtool.c b/drivers/net/ethernet/microchip/lan743x_ethtool.c
index 1a1cbd034eda..1459acfb1e61 100644
--- a/drivers/net/ethernet/microchip/lan743x_ethtool.c
+++ b/drivers/net/ethernet/microchip/lan743x_ethtool.c
@@ -1055,9 +1055,6 @@ static int lan743x_ethtool_get_eee(struct net_device *netdev,
 {
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 
-	eee->tx_lpi_timer = lan743x_csr_read(adapter,
-					     MAC_EEE_TX_LPI_REQ_DLY_CNT);
-
 	return phylink_ethtool_get_eee(adapter->phylink, eee);
 }
 
@@ -1065,24 +1062,6 @@ static int lan743x_ethtool_set_eee(struct net_device *netdev,
 				   struct ethtool_keee *eee)
 {
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
-	u32 tx_lpi_timer;
-
-	tx_lpi_timer = lan743x_csr_read(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT);
-	if (tx_lpi_timer != eee->tx_lpi_timer) {
-		u32 mac_cr = lan743x_csr_read(adapter, MAC_CR);
-
-		/* Software should only change this field when Energy Efficient
-		 * Ethernet Enable (EEEEN) is cleared.
-		 * This function will trigger an autonegotiation restart and
-		 * eee will be reenabled during link up if eee was negotiated.
-		 */
-		lan743x_mac_eee_enable(adapter, false);
-		lan743x_csr_write(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT,
-				  eee->tx_lpi_timer);
-
-		if (mac_cr & MAC_CR_EEE_EN_)
-			lan743x_mac_eee_enable(adapter, true);
-	}
 
 	return phylink_ethtool_set_eee(adapter->phylink, eee);
 }
diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 8d7ad021ac70..25d37a2cb4a6 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -2966,7 +2966,7 @@ static int lan743x_phylink_2500basex_config(struct lan743x_adapter *adapter)
 	return lan743x_pcs_power_reset(adapter);
 }
 
-void lan743x_mac_eee_enable(struct lan743x_adapter *adapter, bool enable)
+static void lan743x_mac_eee_enable(struct lan743x_adapter *adapter, bool enable)
 {
 	u32 mac_cr;
 
@@ -3027,10 +3027,8 @@ static void lan743x_phylink_mac_link_down(struct phylink_config *config,
 					  phy_interface_t interface)
 {
 	struct net_device *netdev = to_net_dev(config->dev);
-	struct lan743x_adapter *adapter = netdev_priv(netdev);
 
 	netif_tx_stop_all_queues(netdev);
-	lan743x_mac_eee_enable(adapter, false);
 }
 
 static void lan743x_phylink_mac_link_up(struct phylink_config *config,
@@ -3072,16 +3070,32 @@ static void lan743x_phylink_mac_link_up(struct phylink_config *config,
 					  cap & FLOW_CTRL_TX,
 					  cap & FLOW_CTRL_RX);
 
-	if (phydev)
-		lan743x_mac_eee_enable(adapter, phydev->enable_tx_lpi);
-
 	netif_tx_wake_all_queues(netdev);
 }
 
+static void mac_disable_tx_lpi(struct phylink_config *config)
+{
+	lan743x_mac_eee_enable(adapter, false);
+}
+
+static void mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+			      bool tx_clk_stop)
+{
+	/* Software should only change this field when Energy Efficient
+	 * Ethernet Enable (EEEEN) is cleared. We ensure that by clearing
+	 * EEEEN during probe, and phylink itself guarantees that
+	 * mac_disable_tx_lpi() will have been previously called.
+	 */
+	lan743x_csr_write(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT, timer);
+	lan743x_mac_eee_enable(adapter, true);
+}
+
 static const struct phylink_mac_ops lan743x_phylink_mac_ops = {
 	.mac_config = lan743x_phylink_mac_config,
 	.mac_link_down = lan743x_phylink_mac_link_down,
 	.mac_link_up = lan743x_phylink_mac_link_up,
+	.mac_disable_tx_lpi = lan743x_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = lan743x_mac_enable_tx_lpi,
 };
 
 static int lan743x_phylink_create(struct lan743x_adapter *adapter)
@@ -3095,6 +3109,10 @@ static int lan743x_phylink_create(struct lan743x_adapter *adapter)
 
 	adapter->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
 		MAC_SYM_PAUSE | MAC_10 | MAC_100 | MAC_1000FD;
+	adapter->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
+	adapter->phylink_config.lpi_timer_max = U32_MAX;
+	adapter->phylink_config.lpi_timer_default =
+		lan743x_csr_read(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT);
 
 	lan743x_phy_interface_select(adapter);
 
@@ -3120,6 +3138,10 @@ static int lan743x_phylink_create(struct lan743x_adapter *adapter)
 		phy_interface_set_rgmii(adapter->phylink_config.supported_interfaces);
 	}
 
+	memcpy(adapter->phylink_config.lpi_interfaces,
+	       adapter->phylink_config.supported_interfaces,
+	       sizeof(adapter->phylink_config.lpi_interfaces));
+
 	pl = phylink_create(&adapter->phylink_config, NULL,
 			    adapter->phy_interface, &lan743x_phylink_mac_ops);
 
@@ -3517,6 +3539,9 @@ static int lan743x_hardware_init(struct lan743x_adapter *adapter,
 		spin_lock_init(&tx->ring_lock);
 	}
 
+	/* Ensure EEEEN is clear */
+	lan743x_mac_eee_enable(adapter, false);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/microchip/lan743x_main.h b/drivers/net/ethernet/microchip/lan743x_main.h
index 8ef897c114d3..7f73d66854be 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.h
+++ b/drivers/net/ethernet/microchip/lan743x_main.h
@@ -1206,6 +1206,5 @@ void lan743x_hs_syslock_release(struct lan743x_adapter *adapter);
 void lan743x_mac_flow_ctrl_set_enables(struct lan743x_adapter *adapter,
 				       bool tx_enable, bool rx_enable);
 int lan743x_sgmii_read(struct lan743x_adapter *adapter, u8 mmd, u16 addr);
-void lan743x_mac_eee_enable(struct lan743x_adapter *adapter, bool enable);
 
 #endif /* _LAN743X_H */
-- 
2.30.2


