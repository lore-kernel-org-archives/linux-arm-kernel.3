Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F771CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JR6lz4T2FZpM1oD4xDnBv0rC9erXbEgbECzVpwgd5Vk=; b=QOYEULXcQnM+rCDhTCXE8tnpgv
	cfgxKbJTBfIllRkYB6vBGwkafRtdQkZXvI2xE/7zo3Ly717NVKSTJY1OBAQ+WN+pBDX73f/w0rrTg
	6Hn4SAgYXvtQs7nNyZ8pPBXCllZIgussio6dh3pf/UdbLr/3MHeIlYkwHLktUvKLdIaD10Nb1ih4R
	AxYGVy5UMP8oGMA6szVfO6ieKqZ22w0Y2NBsnmK9kJUhH73gMMAtQqgHmmbiwfAu+ZcbYGT8YFKo+
	Ff4fZ+iHStUjjuoNI7i+raeRd9/XWNkZJEpus78bkDvLgIVF8v//Bijvu0g/f4erk68t2Ya/z4NFD
	ygLbrr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKc-00000001J5U-2gkW;
	Thu, 18 Jun 2026 12:58:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKM-00000001IfG-3qMB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so5228355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787517; x=1782392317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JR6lz4T2FZpM1oD4xDnBv0rC9erXbEgbECzVpwgd5Vk=;
        b=ITypJYghXDmbAT9+xs4ey77EgVExj2jFyYkt+kpSAM/1N2csAMkdv02nZvVRrTL1mH
         /8pT4az4lDQxh7PIzmcYuTQ9MkcjSuYaC6scAJ6j9kLd5QuytvEga9cCMRNKRQ0WUluX
         w1Rcpff0HyX+8Xa/j29cheiZ73KOvD6fWaSiFKGLe0miEkKo5iQJnhGTESFAaZPcAKhr
         w9vgmgF2bvvbFEAwhmULMtw8H+2Mex//3ervVIT2PlR0QpoTer+MVT94Xq0bb9BKoq4J
         MMuQcQhY9YipBv1tK+Qj8UlmmlV/YCkCThdLxxxZpYoskigkfnMw6wNBji7pmtTQ8Gfz
         Q5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787517; x=1782392317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JR6lz4T2FZpM1oD4xDnBv0rC9erXbEgbECzVpwgd5Vk=;
        b=N91isYq5aLtRfXaV4HrZA4U45tTvPfU+tI7yLXYdM49Gm/o6xwmkv0SPvKpmn335F2
         9yEj9EgUh/n5o61UanLt2qEXVngHRr+5uJX78/C6ThllFIzmIXECkCUoNJs9bGI67h4c
         yc37cjJZGSiOLVzXDZIotZRNguN1BdQV3Web5P+9xB3y6gtPlx2Kwh56H58Ow7RIivTv
         Mj0FoiaygLg7L5Sfw30baSeFIzmPSfyHtuL8ce9V9CeaV1ZlKulS/vd+0Ivgu8IiIbC6
         iBOhacZ8M4HHgNvGDnWZYl8RHI9SfDPVMbywGu+STact8u8+98PzWK9mOTVaeWFvuAqP
         lPIw==
X-Forwarded-Encrypted: i=1; AFNElJ9Poo2aj65o3OiU/PC5Nh/lp0nmzQTHx42WYlyncNChfDgQF7CGhuKxZK0x78uBKdLoZ+1o1NO+TGHRSAkZLI5Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ztqEbU8lKsh/7E6sL+fCSdLFMJxF32IbhvaRipFPmO7u51ru
	Kli9HPAh4kOMHBL0/aPotTRIdeyPgI+DnhKUslMvJYaGwBWoFSN1ZDs+
X-Gm-Gg: AfdE7cmtzTb0TSsf3TtvBakxvcF4UXms+nLmevEPh3nZTA2eodywgzI8GWyEQMROlzQ
	QtJfHn8S7AnuTC7RPcxyK8nYgI/ogKXfYcbMdxLb+XSnhKGhozykXtY7Na0DgqsE8MDZrUFBhO8
	+ZyhETLyrbW2QwlxqQlQvx2xI9Fuw3J2D1yCqDDFLyWtUU++VlcOSr24UOPgAmimm4zww0PQPe3
	UB+GilIxjqEsfEz4DBSOMg+HRl4oM8lls3z7Viy9+aCaiq28awEBz8nNlHc2ttAgW/s0v4ymNTG
	5YnvX1t2YLEq++i7/6z3LbMi2Q0C6ldyNn3DWsnSBv4UenApdHc+k8wETEKrDwxtNMe2jipO2LG
	l9LtnH8Qell8G2EJz+3Z/WJAQC/32kO9eGu6Urrer+iSYUtChclvg/eTbin/5UPo3wp9aEK85BM
	tRunyW8yTis1a30BgQI4bRyAvPXNxPY1qrarTypzgmxCDaG3zSNzHpwwcPDfPrPJ9XBpUfbScM
X-Received: by 2002:a05:600c:1912:b0:492:3763:aeb9 with SMTP id 5b1f17b1804b1-492382268a6mr59479435e9.21.1781787516834;
        Thu, 18 Jun 2026 05:58:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:35 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 12/12] net: airoha: add phylink support
Date: Thu, 18 Jun 2026 14:57:20 +0200
Message-ID: <20260618125752.1223-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055839_117510_46AB25AD 
X-CRM114-Status: GOOD (  27.98  )
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
 drivers/net/ethernet/airoha/airoha_eth.c  | 193 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   7 +-
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 206 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index ad3ce501e7a5..38dcc76e5998 100644
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
index 5f1a118875fb..195e4ead6db3 100644
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
@@ -1788,7 +1789,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	struct airoha_gdm_port *port = dev->port;
 	int i;
 
-	spin_lock(&port->stats_lock);
+	spin_lock(&port->lock);
 
 	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
 		if (port->devs[i])
@@ -1799,7 +1800,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
 		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
 
-	spin_unlock(&port->stats_lock);
+	spin_unlock(&port->lock);
 }
 
 static int airoha_dev_open(struct net_device *netdev)
@@ -1810,6 +1811,14 @@ static int airoha_dev_open(struct net_device *netdev)
 	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
 	struct airoha_qdma *qdma = dev->qdma;
 
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
@@ -1907,6 +1916,9 @@ static int airoha_dev_stop(struct net_device *netdev)
 		}
 	}
 
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -2388,6 +2400,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
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
@@ -3112,7 +3142,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
-	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
+	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
@@ -3168,6 +3199,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
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
@@ -3231,7 +3411,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3266,7 +3446,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 		return -ENOMEM;
 
 	port->id = id;
-	spin_lock_init(&port->stats_lock);
+	spin_lock_init(&port->lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
@@ -3457,6 +3637,8 @@ static int airoha_probe(struct platform_device *pdev)
 			netdev = netdev_from_priv(dev);
 			if (netdev->reg_state == NETREG_REGISTERED)
 				unregister_netdev(netdev);
+			if (dev->phylink)
+				phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -3493,6 +3675,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 			netdev = netdev_from_priv(dev);
 			unregister_netdev(netdev);
+			phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 46b1c31939de..a6fef1777c7b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -554,6 +554,9 @@ struct airoha_gdm_dev {
 	int nbq;
 
 	struct airoha_hw_stats stats;
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
@@ -561,8 +564,8 @@ struct airoha_gdm_port {
 	int id;
 	int users;
 
-	/* protect concurrent hw_stats accesses */
-	spinlock_t stats_lock;
+	/* protect concurrent hw_stats and frag register accesses */
+	spinlock_t lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 436f3c8779c1..6ad91ca6dcd3 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -358,6 +358,18 @@
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


