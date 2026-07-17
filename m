Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEEEC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlkbpCy44dlroW2RCEp/LbnBuuBRf54m5s1Dlirl8co=; b=sLhKIDlP3rT3sYqM73FzPy4Z+8
	eJvLCTP3MXOxdp0Y+aVje7LGMR9Shqfl5IfSWh5tjtmRmZWaImwSuuikvl6oay/xRueTIL5/kMg6v
	O735eMRbVKSq15dFrjtO/pbDXSqkBVUy0YosTusQU/Uqx+pTovxZcqxjSVc/oMWWuR02ossqbthIC
	Xhy1T2B7FF6Fi2nDJLXqOl8h9nzz2xKaK2/6OQmqENpUZ9VPnWDP8ZTycshFm0YP8dCRqsTF45Zee
	ipmvIp/i1zGs6VTeZ6o6sVuBRXNHpUe5I9By2QKMODArM5uennOzHVzbTN+SU3JttMDNmFdKlDJyt
	v1QiuG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcUB-00000001KHX-0TcV;
	Fri, 17 Jul 2026 06:55:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTt-00000001Jrn-1MV7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso34320665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271332; x=1784876132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VlkbpCy44dlroW2RCEp/LbnBuuBRf54m5s1Dlirl8co=;
        b=G+Ep80gUp9SLx6yYj7aHcgm6fAsQ7DB1np08JXOaWkBUWC/97/4+M9hJtIBpLdVct6
         7OQISSzw2onLYsjk9vyHenI+MTRmpHZnOapIKUa8UaUP1z9J1aw359UMEDIwTW5RfcOw
         g0x75xaDJAfld15DSbDrV0BBiL+Rzb7JPVT+GNRbPzuXu6qqlwuLhlvTnloeT9bOE9uG
         +Zh8RBtOYg9gEpTHLzoo/QoJ6Bz67mVvZTZKnSEztav8lNLPDxSw2IEuCwLYG75IloSI
         QsjO/fCZQiCN8P7UfT3HOo5VUrJG/WSfzpISPnqP0bdwZdOEGS8GjXDJGAm8GqyYi3Wm
         kFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271332; x=1784876132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VlkbpCy44dlroW2RCEp/LbnBuuBRf54m5s1Dlirl8co=;
        b=YUo3PiwgGyhkYg7sLhw7IpLUQKyoWj5SAwGDvF01btHzjr0snL6jblBPnLP4CtNQjE
         iEvmcuA8Hq0WR/W5Vpxw4QNVc3bWYswuFzuKmNuHCaLHCyBmHejTFnCi4bMbn5y5xBl+
         V1gp1z3kmQNSoElT16ot/EZ38yTtbs9FiHQYAz82sfXQmLxCVJC4eDfsCiG1vZzmEjfX
         S6Z+GuHqH59kZ4Xi72vx4hJ2RP0gGB+OrlYVuj1nuwOw5M9Dxo4aKi70sEnVrThpksdg
         7wxgFiPDR7Y7AH5Vqe0BMirW/4Zf2WaUBy0cXB6ATGCzn9K6K30RfXyUhJwKqmhZTxg8
         nmzg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7XYRT/ta9zlE0LMEt9Gl144GOsFBtcAWoC7AoE0Uo8/b9yUMs20Xg1LPsbDAs1Nx073vJwGvqbqxDWb6C2LDc@lists.infradead.org
X-Gm-Message-State: AOJu0YyNdu2iVVxy7DKVxQtf6R9fUXyCTspnFGhmVWMN9ZmdtqwtHvso
	AYrEgivSEXym3of4jfRTP4BqxcmevMbqSwgizeNg7PphzjpgEU3gPYny
X-Gm-Gg: AfdE7cncfCRSwW+lwhE69/hxGeBTqqXF9flxsQOYwKx07cRGphqk+xNUR79Isi3w5Fd
	xuNUOjBu8oJp1BAn77TEP4zBsweKkAelHRmn1pFTox1gxSL45PPWBHSsxU16KGazUYDUK3+rRSN
	uqfk+dLUm3gyrdq0eHMG6y+9oYj/Ym2Ihf+95Nc1wqS57hZ+cANmFuVQpqgbwAndS+jt4rFT8rp
	XLYxRp95/UNnyfD09w50IIp6UmzltZJJkHKNUOFIdJEqxD9kpwh/RvA8UJFm1H6/6XqDQMbKTdP
	PhA8V2ugEGY63/RPDw+Pj0YXFrBl8iCKyIObclKINftnVSBAdRSR5c9d3fyA0EW3Av1M2O3thy5
	MUksc+HfZSOwoO53zJT71B6AJUeJpZZj7rHq1KrjYDC02LrEh1IRVZYQkYb+8PXFVLXkxclwdoH
	l+187920ZxNS9c8eaV7F1a+pn+rjUa6xY/4+syVyeE+07Fsqfk2MNAvIeUmGm4AJMPEJYb5A==
X-Received: by 2002:a7b:c055:0:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-4954a516ae6mr8142375e9.37.1784271331576;
        Thu, 16 Jul 2026 23:55:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 12/12] net: airoha: add phylink support
Date: Fri, 17 Jul 2026 08:54:12 +0200
Message-ID: <20260717065448.1498335-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235533_516017_6A18E771 
X-CRM114-Status: GOOD (  27.22  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   1 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 194 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   7 +-
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index 1f6640a15fc9..789906516bf8 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,7 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..ed1ac032f337 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -8,6 +8,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -1837,7 +1838,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	struct airoha_gdm_port *port = dev->port;
 	int i;
 
-	spin_lock(&port->stats_lock);
+	spin_lock(&port->lock);
 
 	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
 		if (port->devs[i])
@@ -1848,7 +1849,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
 		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
 
-	spin_unlock(&port->stats_lock);
+	spin_unlock(&port->lock);
 }
 
 static void airoha_dev_set_xmit_frame_size(struct net_device *netdev)
@@ -1870,6 +1871,14 @@ static int airoha_dev_open(struct net_device *netdev)
 	u32 pse_port = FE_PSE_PORT_PPE1;
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
@@ -1909,6 +1918,10 @@ static int airoha_dev_stop(struct net_device *netdev)
 		airoha_set_gdm_port_fwd_cfg(qdma->eth,
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
+
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -2389,6 +2402,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
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
@@ -3120,7 +3151,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
-	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
+	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
@@ -3176,6 +3208,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
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
+	u32 mask, val;
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
+	}
+
+	spin_lock(&port->lock);
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		mask = GDM4_SGMII1_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}  else {
+		mask = GDM4_SGMII0_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}
+	airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG, mask, val);
+
+	if (dev->nbq == 1) {
+		mask = GDM4_SGMII1_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+				 frag_size_rx);
+	} else {
+		mask = GDM4_SGMII0_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_rx);
+	}
+	airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG, mask, val);
+
+	spin_unlock(&port->lock);
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
@@ -3239,7 +3420,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3274,7 +3455,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 		return -ENOMEM;
 
 	port->id = id;
-	spin_lock_init(&port->stats_lock);
+	spin_lock_init(&port->lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
@@ -3471,6 +3652,8 @@ static int airoha_probe(struct platform_device *pdev)
 			netdev = netdev_from_priv(dev);
 			if (netdev->reg_state == NETREG_REGISTERED)
 				unregister_netdev(netdev);
+			if (dev->phylink)
+				phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -3509,6 +3692,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 			netdev = netdev_from_priv(dev);
 			unregister_netdev(netdev);
+			phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6d01a8e8da1..b49fc5304b3a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -561,6 +561,9 @@ struct airoha_gdm_dev {
 	int nbq;
 
 	struct airoha_hw_stats stats;
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
@@ -568,8 +571,8 @@ struct airoha_gdm_port {
 	int id;
 	int users;
 
-	/* protect concurrent hw_stats accesses */
-	spinlock_t stats_lock;
+	/* protect concurrent hw_stats and frag register accesses */
+	spinlock_t lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 6fed63d013b4..8df02f51211c 100644
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


