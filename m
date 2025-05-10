Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503B1C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P2IsG4NpDD2fbYW/iI8BvKjWMNl+8X1z9p0WNQNKVQ=; b=frq5L6z5JgMsADYpzpE07xg17Z
	MEVwTkHhLKWF/V1DOFoL4Gf5HcmoxEGNFvuKu6/EHxZypGCu7ROmap1/Ga8Y2N7C7ycxUGi6DsIGs
	CRqsJIft7E73GLtHwPGwQ/Ng2W0pG53X1+vv5RQF7Hz51UtRUjxrjNfrJSCfWjjR2VfORVgl2UXsQ
	Ir+qT9K8k1BhPOdNgmdT9L/AOpAT3DFogJFt8G1g8IpoIE/c/flL1qcLTh8LQqcBcM4zAgpTWBXP4
	+LbPqg6xI6sES1oxov3Jw1/U4QSDLUWaCg7/ioj0BMHiPhAp6B5jmiH0v4pv5QbelsSzjgBETZdNJ
	KbnKf1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhk5-00000005qMz-3fVO;
	Sat, 10 May 2025 10:47:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNq-00000005nku-1HAG;
	Sat, 10 May 2025 10:24:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a0b9303998so1473442f8f.0;
        Sat, 10 May 2025 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872680; x=1747477480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P2IsG4NpDD2fbYW/iI8BvKjWMNl+8X1z9p0WNQNKVQ=;
        b=H5nOyxjx0ZIxhyAz6iNdLtNLhC6CQuEPzwruM3ksL31QZ6hFyDExUFAfz+uWJAYoLq
         Sk1wOUHSTRnm1Ae5K/EZ4eRnllb3fmPWOIYhiQPQ2+cWN0T9keAwCPAkpC62KBsi+iyD
         JZPEMyuj2t0iW+oiCXy7FUKdGLRyQUVnMNXkyoI8/tjd9C9QhzS1wiZ1mqfksEI/2NZC
         4XmvG13TApDib/YetR9gi2Z9RhHCqErSgrHMKQfUqxRqJTa3zx7iPw7/eWjBKJ46JNGd
         zLYTp3rE4loIXdrO6EZ12zcFPQhsaYl+776iNMWnFQ7+zC4fd7ZooKPFT5dp8qegSvbI
         TGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872680; x=1747477480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P2IsG4NpDD2fbYW/iI8BvKjWMNl+8X1z9p0WNQNKVQ=;
        b=GQt5XnjJCLk7BX6pkyomAAVwYEJdVWyDg0+kIlbzniDwwmT1kong2b5RDCQtz59T+o
         KJq7RwSoArJjUH4B2QttJYIaqN7DcuM7RyBmw9AHmoFiV4FZUEmz1ebSd2ArMVtfJ7ZM
         OW7Pe70zC+8NhCFf3+oEHgoQ+QYLE2p+RRzpI+P3gbgOxjju4/YS+YbUvN2VdyHfobSj
         O8PLBfzbbFEXfoY6NHYpIxnUqrrEqUj1C1cGZIbUOoXj1LZhj88qP6x/CHyWlRFX1hGy
         McZapQGNMF4QeGqxyimYzEIAlqmbK3TD/miJLR3AMx28gVglDz3flffEC8fXWHDPBsos
         357A==
X-Forwarded-Encrypted: i=1; AJvYcCVxgyw0iIpJTz8Xs1g9hq+oE4Z3viM8ugkANGSRabRDeoQE8NL/BdqICSBv6TFsueCCsoXJq24OxxdH4KDVOLc=@lists.infradead.org, AJvYcCW78N6QXWzKdbnvHNqzjYzz1dxjDBKlS6FQK0IwCTbCfWRSLCCiXEvuFsWvyHkiNZNnDGwSD2K7AB1ZfHcrcWeB@lists.infradead.org
X-Gm-Message-State: AOJu0YxpBWzICoTXmHZk+Lnb2I1UOmhZjgFz4RtBTsf8M7UgWg4wYdbQ
	BIXTmRUyTEB6KrtXu7279WyorDklAoY7c1OXcxTrakfAXwg9XqPX
X-Gm-Gg: ASbGncsaOvwcgHhHV2YxWQB9ZOJ51m/ZSelL0ca1UCTdrAnors0+PufJFHpucs2jzEN
	0zD2czG/qm50jgq5tZIpsEHGfQcM931KiZ8gJDKvUTecWfBtDfH2tzCbQSiEGjlYM+Q6lWrWoia
	+Vbt0tzKNYWh1n1oKoR/ckWpqYmv4zI/2usaQ4lC25Z8dLOWIEgvYa1oJgr2+th8cwrWzE1vbjz
	s3x1PnkA0po334V0mcWf235lH7u/aTzuRy04mFOIG+D7c4nnYteMgUu/AJv8q8efJfhctZ/Lrq0
	M87D22+/OOfGJH4beNKiyQslK7FVepq5L4wRId8AQRrCyKw2WkUCQDq+33PfzDG3trLdX3I6ndJ
	C8QPxCwzXfeRVkKTCige/
X-Google-Smtp-Source: AGHT+IGaAcxFH348QW/5C7QPg9ecKePMXYXEMnalPhZCY4oj4yf2UPL3DkEaoRM26UOdLaNwKJl6Hw==
X-Received: by 2002:a05:6000:1a8c:b0:3a1:f538:d9d5 with SMTP id ffacd0b85a97d-3a1f538da17mr6327826f8f.28.1746872680525;
        Sat, 10 May 2025 03:24:40 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 11/11] net: airoha: add phylink support for GDM2/3/4
Date: Sat, 10 May 2025 12:23:31 +0200
Message-ID: <20250510102348.14134-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032442_345365_013638D8 
X-CRM114-Status: GOOD (  22.20  )
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

Add phylink support for GDM2/3/4 port that require configuration of the
PCS to make the external PHY or attached SFP cage work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 138 ++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 3 files changed, 153 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931f..17521be820b5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -7,6 +7,7 @@
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -79,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
 	return port->id == 1;
 }
 
+static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
+{
+	return port->id != 1;
+}
+
 static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 {
 	struct airoha_eth *eth = port->qdma->eth;
@@ -1613,6 +1619,17 @@ static int airoha_dev_open(struct net_device *dev)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 
+	if (airhoa_is_phy_external(port)) {
+		err = phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
+		if (err) {
+			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
+				   err);
+			return err;
+		}
+
+		phylink_start(port->phylink);
+	}
+
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
 	if (err)
@@ -1665,6 +1682,11 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	if (airhoa_is_phy_external(port)) {
+		phylink_stop(port->phylink);
+		phylink_disconnect_phy(port->phylink);
+	}
+
 	return 0;
 }
 
@@ -2795,6 +2817,110 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 	return false;
 }
 
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
+						    phylink_config);
+	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	u32 frag_size_tx, frag_size_rx;
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
+	/* Configure TX/RX frag based on speed */
+	if (port->id == 4) {
+		airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, GDMA4_SGMII0_TX_FRAG_SIZE,
+			      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE, frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, GDMA4_SGMII0_RX_FRAG_SIZE,
+			      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE, frag_size_rx));
+	}
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_link_up = airoha_mac_link_up,
+};
+
+static int airoha_setup_phylink(struct net_device *dev)
+{
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct device_node *np = dev->dev.of_node;
+	struct phylink_pcs **available_pcs;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	unsigned int num_pcs;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&dev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	port->phylink_config.dev = &dev->dev;
+	port->phylink_config.type = PHYLINK_NETDEV;
+	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
+						MAC_5000FD | MAC_10000FD;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
+	if (err)
+		return err;
+
+	available_pcs = kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);
+	if (!available_pcs)
+		return -ENOMEM;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
+				       &num_pcs);
+	if (err)
+		goto out;
+
+	port->phylink_config.available_pcs = available_pcs;
+	port->phylink_config.num_available_pcs = num_pcs;
+
+	__set_bit(PHY_INTERFACE_MODE_SGMII,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_USXGMII,
+		  port->phylink_config.supported_interfaces);
+
+	phy_interface_copy(port->phylink_config.pcs_interfaces,
+			   port->phylink_config.supported_interfaces);
+
+	phylink = phylink_create(&port->phylink_config,
+				 of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink)) {
+		err = PTR_ERR(phylink);
+		goto out;
+	}
+
+	port->phylink = phylink;
+out:
+	kfree(available_pcs);
+
+	return err;
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 				 struct device_node *np, int index)
 {
@@ -2873,6 +2999,12 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (err)
 		return err;
 
+	if (airhoa_is_phy_external(port)) {
+		err = airoha_setup_phylink(dev);
+		if (err)
+			return err;
+	}
+
 	return register_netdev(dev);
 }
 
@@ -2967,6 +3099,9 @@ static int airoha_probe(struct platform_device *pdev)
 		struct airoha_gdm_port *port = eth->ports[i];
 
 		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+			if (airhoa_is_phy_external(port))
+				phylink_destroy(port->phylink);
+
 			unregister_netdev(port->dev);
 			airoha_metadata_dst_free(port);
 		}
@@ -2994,6 +3129,9 @@ static void airoha_remove(struct platform_device *pdev)
 			continue;
 
 		airoha_dev_stop(port->dev);
+		if (airhoa_is_phy_external(port))
+			phylink_destroy(port->phylink);
+
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 53f39083a8b0..73a500474076 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -498,6 +498,9 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index d931530fc96f..71c63108f0a8 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -357,6 +357,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_GDMA4_TMBI_FRAG		0x2028
+#define GDMA4_SGMII1_TX_WEIGHT		GENMASK(31, 26)
+#define GDMA4_SGMII1_TX_FRAG_SIZE	GENMASK(25, 16)
+#define GDMA4_SGMII0_TX_WEIGHT		GENMASK(15, 10)
+#define GDMA4_SGMII0_TX_FRAG_SIZE	GENMASK(9, 0)
+
+#define REG_GDMA4_RMBI_FRAG		0x202c
+#define GDMA4_SGMII1_RX_WEIGHT		GENMASK(31, 26)
+#define GDMA4_SGMII1_RX_FRAG_SIZE	GENMASK(25, 16)
+#define GDMA4_SGMII0_RX_WEIGHT		GENMASK(15, 10)
+#define GDMA4_SGMII0_RX_FRAG_SIZE	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.48.1


