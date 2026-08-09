Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503CCC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94lQlIC2bYbitZXez6xVpq3PxYuRMlGhHfYdCk7VWOI=; b=DLw+3zALEpF4CKzq34iZI9e9TA
	tM+vYJHiWhEqXTXn7qhYxET5I6BUx1lVdHPOB1TU+BH2zzmmMUMNZn6cwTcieClqRSxHxvn3FIMjH
	CHwi3ECHK76KO4Z1eg8DJstu2LL6J2o1lGZxossTOJjD1ngcoZWu+SVllmwm8nROhNnsWsntd2Rnx
	l22XIyztCXB7qmBTjMHgGLy5HMNgAFOLKZVOpsdS51bO34XMOM279x3SCR2Pzd79o2ZGDFN0uZAdf
	T6/SU9PHi99TZTlExDKv1wCv3noGH4KEvNVnBtsaVkkbY0X85iBfuSSizAj6fX3bMXpEatJm3uKTQ
	OxHj4uvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABh-0000000Agda-0HOZ;
	Sun, 09 Aug 2026 20:32:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABb-0000000AgSv-0gqB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:32:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so7289805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307517; x=1786912317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94lQlIC2bYbitZXez6xVpq3PxYuRMlGhHfYdCk7VWOI=;
        b=YfrDk7dFonjrARUordpEHNpnQLtffdyz5IwMjWK/NHYl65NA3gFoDOmiLpPodQqR4B
         G1v7lYwOY7q5eOXdx90OocxcZF3tsmv08dYDUrLnnbmBgBBlX8ylvkOZDAZTFnuubjkB
         likFW7Ugd5OtLpB0pg9r8BBTF8sNteCnPsahr4lbN8GnvcFw4Ysfp5Q2IJmx74RlyWFi
         VAUickF/a4X/ElwQoODGhmObCq4ZyHhcsf0pDUwEg/e+3BS7UKNHoeHDYR208sIMFD7J
         iG0sdLDFdPjJzcO8JGqF+7lA6LaYFZJsrmUtoPn+vA3UFk7iivhxFek6abbxDJkaTucI
         MAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307517; x=1786912317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=94lQlIC2bYbitZXez6xVpq3PxYuRMlGhHfYdCk7VWOI=;
        b=b/Hg4VkBYj6Ps+tDGlLVOtOy5Yxopv4/DOiQ0yrV9avIElrnEMrjYpPWJzWxGuR7Jz
         IlyKhMcy937cHsaCNZaJHNNbpMnLTwuoAjP+wLh9/uec8i87zyp65Xca2G/ExAWxrY8Q
         ehLCFSs449lxgd1xwKGgQNH+VhaMPgJySTMoQBXJdqhbHgsztW5VUaNpATIzrUGVioY1
         SqWIEc8beHHB8RdV8sYDsfzSXMO8nhq1xoPIIsmPYbUCnajsIOso40t8SE+Ox/EkZMLU
         PZ7VK/Dj1DTtqzToe9loN/bCrxTMp9mqK5aACLyr3sfGbWAz6AD3dedL/vvG6Hyp+YwH
         E5Bg==
X-Forwarded-Encrypted: i=1; AHgh+RpT3n1JEe4tDp4LjTzK7VASWrlxDe0mpmNejpv14LQKJKqjuYFOIL+xfmJ9lJgpZLabxKBIcUkrpXKy+Xnqh84U@lists.infradead.org
X-Gm-Message-State: AOJu0YwzhkVJV4sPIegi5dCb66gxYhEPTE8nuOTDf9tUEbQxKNVVCfxi
	0+t2gHg7e0ONoM3T0U9F81WE8kUgwkyt4aqZfiPIQrpM8rQE86ZOb2A1
X-Gm-Gg: AR+sD10wgyW0csC6MbiNd6lESv7UDV5nTwAujIl0aRiAlu+P/7zkSCa5Y/n+cMiM04D
	2+So8dYuwBoDdw7tdrz4rDjHrcVXssvRpBNCJnN3LjLD5IO4GR998mlxjEYHJ5uErFPO0zGlt5A
	euUhRODUhoRaQccHOPvejCJHvdDvpieszxfZdHi87cYGm9aUuGFupmyZgonKKNoENo8qKe6bIvm
	Tg6P9+7j8gIqrZNhTzLewPdCj7LJIiZg0yQI+TQ0D7pIIS+ytmr9gj/CCJeGT841Swsu103iLx9
	yOUAw2bB4I/FDA4Uyy4j6VqftpfsmN9s/eThlApsB6Upq4/R1g5CNSbUccST7ND2tzhzblXDM/n
	Y8GmIaOQzMizFKtGN3M0eCGVgOmzp5kHfaNLkR+9U1lJp5iK7bTjZaeGEk6w13Wy48VJCTBUaxc
	iDs9syvK66302/gT0vn1BvtES+WqvlYEE4NoX1QMIj/ZROfJV1cQ4ESKuw54zdQ6NBzoyIvmLXS
	ll+OZ1nMhEbMJQvC6sDU8HsV+raHcv+yRgz7+oXJgryEDxi
X-Received: by 2002:a05:600c:4692:b0:498:162a:dbda with SMTP id 5b1f17b1804b1-4994e714b73mr484803275e9.5.1786307517192;
        Sun, 09 Aug 2026 13:31:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v12 12/12] net: airoha: add phylink support
Date: Sun,  9 Aug 2026 22:31:09 +0200
Message-ID: <20260809203116.640271-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133159_266253_B3CE7A2B 
X-CRM114-Status: GOOD (  27.75  )
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

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Update and provide a .get/set_link_ksettings function that use phylink
for ethtool OPs now that we fully support phylink.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   2 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 190 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   5 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 207 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index 1f6640a15fc9..5c54a07d2a76 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,8 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PCS_AIROHA
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64619e9a704d..9fe8376aca0f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -6,6 +6,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/pcs/pcs.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
@@ -1915,6 +1916,14 @@ static int airoha_dev_open(struct net_device *netdev)
 	struct airoha_qdma *qdma;
 	int err;
 
+	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
+	if (err) {
+		netdev_err(netdev, "could not attach PHY: %d\n", err);
+		return err;
+	}
+
+	phylink_start(dev->phylink);
+
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
@@ -1945,6 +1954,8 @@ static int airoha_dev_stop(struct net_device *netdev)
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
 
+	phylink_stop(dev->phylink);
+
 	netif_tx_disable(netdev);
 	airoha_set_vip_for_gdm_port(dev, false);
 
@@ -1954,6 +1965,9 @@ static int airoha_dev_stop(struct net_device *netdev)
 		airoha_set_gdm_port_fwd_cfg(dev->eth,
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
+
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -2509,6 +2523,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
+static int
+airoha_ethtool_get_link_ksettings(struct net_device *netdev,
+				  struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
+}
+
+static int
+airoha_ethtool_set_link_ksettings(struct net_device *netdev,
+				  const struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
+}
+
 static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
@@ -3353,7 +3385,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
-	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
+	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
@@ -3409,6 +3442,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
 	return false;
 }
 
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
+						  phylink_config);
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
+	u32 frag_size_tx, frag_size_rx;
+
+	/* TX/RX frag is configured only for GDM4 */
+	if (port->id != AIROHA_GDM4_IDX)
+		return;
+
+	switch (speed) {
+	case SPEED_10000:
+	case SPEED_5000:
+		frag_size_tx = 8;
+		frag_size_rx = 8;
+		break;
+	case SPEED_2500:
+		frag_size_tx = 2;
+		frag_size_rx = 1;
+		break;
+	default:
+		frag_size_tx = 1;
+		frag_size_rx = 0;
+		break;
+	}
+
+	mutex_lock(&port->link_lock);
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG,
+			      GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+					 frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG,
+			      GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+					 frag_size_rx));
+	} else {
+		airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG,
+			      GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+					 frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG,
+			      GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+					 frag_size_rx));
+	}
+
+	mutex_unlock(&port->link_lock);
+}
+
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_fill_available_pcs(struct phylink_config *config,
+				     struct phylink_pcs **available_pcs,
+				     unsigned int num_possible_pcs)
+{
+	struct device *dev = config->dev;
+
+	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+					num_possible_pcs);
+}
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct device_node *np = netdev->dev.of_node;
+	struct airoha_gdm_port *port = dev->port;
+	struct phylink_config *config;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&netdev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	config = &dev->phylink_config;
+	config->dev = &netdev->dev;
+	config->type = PHYLINK_NETDEV;
+
+	/*
+	 * GDM1 only supports internal for Embedded Switch
+	 * and doesn't require a PCS.
+	 */
+	if (port->id == AIROHA_GDM1_IDX) {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10000FD;
+
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+	} else {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10 | MAC_100 | MAC_1000 |
+					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
+
+		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
+		config->fill_available_pcs = airoha_fill_available_pcs;
+
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_10GBASER,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_USXGMII,
+			  config->supported_interfaces);
+
+		phy_interface_copy(config->pcs_interfaces,
+				   config->supported_interfaces);
+	}
+
+	phylink = phylink_create(config, of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	dev->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 				   struct airoha_gdm_port *port,
 				   int nbq, struct device_node *np)
@@ -3474,7 +3656,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3510,6 +3692,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 	port->id = id;
 	spin_lock_init(&port->stats_lock);
+	mutex_init(&port->link_lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
@@ -3706,6 +3889,8 @@ static int airoha_probe(struct platform_device *pdev)
 			netdev = netdev_from_priv(dev);
 			if (netdev->reg_state == NETREG_REGISTERED)
 				unregister_netdev(netdev);
+			if (dev->phylink)
+				phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -3744,6 +3929,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 			netdev = netdev_from_priv(dev);
 			unregister_netdev(netdev);
+			phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fa9a8edce22f..83daec003257 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -595,6 +595,9 @@ struct airoha_gdm_dev {
 	 * QDMA migration.
 	 */
 	spinlock_t txq_lock[AIROHA_NUM_NETDEV_TX_RINGS];
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
@@ -604,6 +607,8 @@ struct airoha_gdm_port {
 
 	/* protect concurrent hw_stats accesses */
 	spinlock_t stats_lock;
+	/* protect concurrent GDM4 register access */
+	struct mutex link_lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 442b48c9b991..4ea89057b560 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -357,6 +357,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_FE_GDM4_TMBI_FRAG		0x2028
+#define GDM4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_FE_GDM4_RMBI_FRAG		0x202c
+#define GDM4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.53.0


