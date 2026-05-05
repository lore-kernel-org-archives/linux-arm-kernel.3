Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C4ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbS3OG+YVDKJuembzs3rrFe7024t5JnNqmdQJp33Wns=; b=RvvraBodxPC899iAL5Isfz7AHV
	8c1jScetVpiNm1H8apwciGogtIoeC1g+yVDQ0Ksa6AJX+FtHgChEBVcTmlprT889VZzgtQsyGn5i7
	3/lrLPrepiH0dWQIKKld/xCnOF/+0RTo3iPynw/mc6b3YOSOm1VgKYY5uYui2OxBHJe4p3fCJwBsi
	BOhIFOx3v5OS3MY84ZWAa58zTLHm1Zo5pon5xBVv/SxQVj4WeJLWFMI8dqTJi3JzehyCLj6xxIttM
	Ht1+LUgeYxW08Cs9UdtcNFyMQLOkfSMxqUwdMNKvbwH2Mbu7dIa49/c5B6cWqbNQmK5Q7TJU2yiT+
	W3X38dfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUq-0000000HAjH-0Cm6;
	Tue, 05 May 2026 18:27:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUl-0000000HAc9-2Sds
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so45119725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005666; x=1778610466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbS3OG+YVDKJuembzs3rrFe7024t5JnNqmdQJp33Wns=;
        b=A4CzJSQ519MMNlZprw5hDeBk78yZ+F2NnGQMlpSytrqFIrkOw5WSd4U1rB80ucTygL
         iyeRdbsNAods1mofLK8QunnBbJZne5MbrQNnHw9Q1pyV+wyHDaMxus2Aeb1SYFeX9Lfp
         qGJk6/BVHXXgp06WkuqhRQ6LwyvJKZYmRv04i6WIxJG5n+fHBJV1D3zJAins5dDEzHeI
         r+Yhtgk+1NuKUNhYC10kFy8oxjuUh8A81rXW6aMKttjOrnqRQ+bpQ6vJGWfeQDuAQMCH
         T0hqcvyvrs0quoridR+i5JAGeiB7pr3klpyT2x+tPQ5jUneIW9t5aybaKlqB79EsX+d0
         zy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005666; x=1778610466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbS3OG+YVDKJuembzs3rrFe7024t5JnNqmdQJp33Wns=;
        b=hrZuT9H9e8rkKnNuBLhVa+qflAz4qMUz/KaJPVs2ul3H30ARbNAyTtMg6NLytMnCF0
         S1RMMynVxPOZLHB/6v4Oq713pdnRxPxtfkGVnKzXsOOHwbqj9JcIfXXeq/Iw8Y2tOSGu
         ajOPM3so5oYxl6O3pQaCNxsltJE/+RN3qVw69k+gpf9Pb+7fsm8RFeV+5u1PaRvWMsbZ
         Lnb0s8TiUQ2i389dhK9vQcjSoYCevYX8IocQFVmFpOh0jQV/rsng8avxRjeFGWeUeyQY
         00/dr6hw/YIwH60G3og5+rK8X9OVllxMwzqWodkY+XmktZHB1/ajUqtBUkuCraEGy20U
         PzLw==
X-Forwarded-Encrypted: i=1; AFNElJ/3KwcxALhmcZyfZpk3F5OAJWRR4jMf6GiJ2EsdJZKIuR7mRfrdWgJWJ5+AJBnt7A0oOv1yjnVN8a9ZiSet3Xqg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw073HFnFYt1kx0W9l+YGHsbVfZCXCfmd775c9MZSi8s7hUIgbi
	OguTrC6j+BN3DAqMwR9fpTmJGofe7LXUcwXcjHTgNvQd3b0Yr8xnK5pZ
X-Gm-Gg: AeBDievGdmBoP3gnqp9pR2K8UHrXe78xMc+MRgW1/GNst0Yqnkm0/fG+4sq2FC6u3qT
	zg9hGkIUjIpT+EIS/wN2/czJyzYLaQoDWELAhTUN6/sswTT+h64INBgumgnMEkE+h8jRJSERhNU
	UK7x6xTJ8vw7JH/rywXVeQ4Zyw7mD4iVxTjUALTZlqMiQ1t4IDe/OT0N3+L35Ik8XayVR/Xx0fU
	oGktblVLXahDAso2yqWjoW0egSWr/ru+ub8/tMBIT0r1xraDvgd6HtmRHaFTt6Q4ewY174mnwa3
	VFfwEWSDn4YxX8e4CRuGu6O4hPX/oJ3RhMZX5XyGeDnjAygxVj68abG7z0YvYtgZE07pVWacI7/
	rjvgSaR5r8o3yZlWDRisGirroAMmRklKAxeXWYqxBm+rpaNveO0NcJudunavHNPD2dfI8SrMXvr
	hpopKmIceL18LqpE0XYbjdGj+/qtAwjWJUul1y/YG3fvppvGRCnYDuygVENfS27OPPGt3yth7f1
	7Jt3wg=
X-Received: by 2002:a05:600c:34ca:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-48e521e6085mr3516555e9.16.1778005665680;
        Tue, 05 May 2026 11:27:45 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:45 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 10/10] net: airoha: add phylink support for GDM2/3/4
Date: Tue,  5 May 2026 20:27:11 +0200
Message-ID: <20260505182713.27644-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112747_714133_01A2D3D0 
X-CRM114-Status: GOOD (  24.54  )
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
 drivers/net/ethernet/airoha/Kconfig       |   1 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 144 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 159 insertions(+), 1 deletion(-)

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
index 2bd79da70934..ad0328a25422 100644
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
@@ -71,6 +72,11 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
 	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
 }
 
+static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
+{
+	return port->id != 1;
+}
+
 static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 {
 	struct airoha_eth *eth = port->qdma->eth;
@@ -1644,6 +1650,17 @@ static int airoha_dev_open(struct net_device *dev)
 	struct airoha_qdma *qdma = port->qdma;
 	u32 pse_port = FE_PSE_PORT_PPE1;
 
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
@@ -1707,6 +1724,11 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	if (airhoa_is_phy_external(port)) {
+		phylink_stop(port->phylink);
+		phylink_disconnect_phy(port->phylink);
+	}
+
 	return 0;
 }
 
@@ -2883,6 +2905,115 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
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
+	if (port->id != 4)
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
+	/* Configure TX/RX frag based on speed */
+	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG,
+		      GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+		      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx));
+
+	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG,
+		      GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+		      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_rx));
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
 				 struct device_node *np)
 {
@@ -2954,6 +3085,12 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	port->id = id;
 	eth->ports[p] = port;
 
+	if (airhoa_is_phy_external(port)) {
+		err = airoha_setup_phylink(dev);
+		if (err)
+			return err;
+	}
+
 	return airoha_metadata_dst_alloc(port);
 }
 
@@ -3081,8 +3218,11 @@ static int airoha_probe(struct platform_device *pdev)
 		if (!port)
 			continue;
 
-		if (port->dev->reg_state == NETREG_REGISTERED)
+		if (port->dev->reg_state == NETREG_REGISTERED) {
+			if (airhoa_is_phy_external(port))
+				phylink_destroy(port->phylink);
 			unregister_netdev(port->dev);
+		}
 		airoha_metadata_dst_free(port);
 	}
 	airoha_hw_cleanup(eth);
@@ -3107,6 +3247,8 @@ static void airoha_remove(struct platform_device *pdev)
 		if (!port)
 			continue;
 
+		if (airhoa_is_phy_external(port))
+			phylink_destroy(port->phylink);
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index af29fc74165b..e5c70f1fa4f1 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -538,6 +538,9 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 436f3c8779c1..27f2583e143a 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -358,6 +358,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_GDMA4_TMBI_FRAG		0x2028
+#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_GDMA4_RMBI_FRAG		0x202c
+#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.53.0


