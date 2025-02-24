Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHxjy6XCdP5VBZsQazPLkzVwNnPGIjzJzcJik5SRrY8=; b=w/3RtkvI67q2odTPakWab2bIiM
	CJ3VMefCRnUkBU0p2apSi8l0qVdrGn+11LbpokQhcMdMHJBLOlHpPvDlmrf9lIYS5EumlM9HbzXhH
	t24dvvS5sCPbQDygwkIoQa7drfb/9BSrNT2WL/w/Y5kjQZ7jRDwePzBZEvHfiCHYIJtqQxQnRJL+H
	3dt88PmzKxHttpeaelsuSWBZDAW+y9JCpp4J21FO0l5HmyCHKvnn93VcXi2JJ8EJcxLrdSV4lJ3nI
	IQwniUkmbPwV1gGGnRzBOtG/idWEpv20zmExrvd+29AKtzqoU7kZJjmo6vXvOtRR+hRYaYz8qps+W
	RSvlOMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmX4d-0000000DYNl-2fit;
	Mon, 24 Feb 2025 11:56:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWbS-0000000DMzt-1Aun;
	Mon, 24 Feb 2025 11:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE179611A9;
	Mon, 24 Feb 2025 11:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A26C4CED6;
	Mon, 24 Feb 2025 11:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740396385;
	bh=Wg+QjK1xzNqVLaoXJIpbPD9MqRDVwxtgaO6M2sdlLc0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hYSPnh2HR78i7KC5enTGVRyp3+oCpL6r9Xq+5ZsAZwd/s4ssn1jt/YSpgIVJfVZce
	 wl9lUh7guc8qW1HSncYYaiZZGKn/KDm9JOvMSSoJv6ETHW+h2WTV3y07vCw4zMMkb3
	 89ib7lQpsErj8X8hkI/r88ArGde1WskzHcP2e3hTkj3IWJm6oyViVCLR4R9707l+qk
	 cNFWaeXGzEnn0dpre9QvMhLChGpp4ObpR+iqx22Ac3SzN8w/CmMTyScN34a8OQOcUq
	 DZ72HIer8VoTpAhGOdjRWBpXYKaa20DRZUzX3pHHZP/prwuhmSmHWGzSYULKMKWOKY
	 50eFL6Fgx5rYw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 24 Feb 2025 12:25:34 +0100
Subject: [PATCH net-next v7 14/15] net: airoha: Add loopback support for
 GDM2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-airoha-en7581-flowtable-offload-v7-14-b4a22ad8364e@kernel.org>
References: <20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org>
In-Reply-To: <20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
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

Enable hw redirection for traffic received on GDM2 port to GDM{3,4}.
This is required to apply Qdisc offloading (HTB or ETS) for traffic to
and from GDM{3,4} port.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 71 ++++++++++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |  7 +++
 drivers/net/ethernet/airoha/airoha_ppe.c  | 13 +++---
 drivers/net/ethernet/airoha/airoha_regs.h | 29 +++++++++++++
 4 files changed, 112 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8449679524e2a191646cb125d2caecfd57ee91de..113078af7c5936915a1636ac6dd8465fbfcbc793 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1588,14 +1588,81 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 	return 0;
 }
 
+static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
+{
+	u32 pse_port = port->id == 3 ? FE_PSE_PORT_GDM3 : FE_PSE_PORT_GDM4;
+	struct airoha_eth *eth = port->qdma->eth;
+	u32 chan = port->id == 3 ? 4 : 0;
+
+	/* Forward the traffic to the proper GDM port */
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(2), pse_port);
+	airoha_fe_clear(eth, REG_GDM_FWD_CFG(2), GDM_STRIP_CRC);
+
+	/* Enable GDM2 loopback */
+	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(2), 0xffffffff);
+	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
+	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
+		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
+		      FIELD_PREP(LPBK_CHAN_MASK, chan) | LPBK_EN_MASK);
+	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(2),
+		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
+		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
+		      FIELD_PREP(GDM_LONG_LEN_MASK, AIROHA_MAX_MTU));
+
+	/* Disable VIP and IFC for GDM2 */
+	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(2));
+	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(2));
+
+	if (port->id == 3) {
+		/* FIXME: handle XSI_PCE1_PORT */
+		airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(0),  0x5500);
+		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
+			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
+			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_PCIE0_SRCPORT));
+		airoha_fe_rmw(eth,
+			      REG_SP_DFT_CPORT(HSGMII_LAN_PCIE0_SRCPORT >> 3),
+			      SP_CPORT_PCIE0_MASK,
+			      FIELD_PREP(SP_CPORT_PCIE0_MASK,
+					 FE_PSE_PORT_CDM2));
+	} else {
+		/* FIXME: handle XSI_USB_PORT */
+		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
+			      FC_ID_OF_SRC_PORT24_MASK,
+			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
+		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
+			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
+			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_ETH_SRCPORT));
+		airoha_fe_rmw(eth,
+			      REG_SP_DFT_CPORT(HSGMII_LAN_ETH_SRCPORT >> 3),
+			      SP_CPORT_ETH_MASK,
+			      FIELD_PREP(SP_CPORT_ETH_MASK, FE_PSE_PORT_CDM2));
+	}
+}
+
 static int airoha_dev_init(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_eth *eth = port->qdma->eth;
+	u32 pse_port;
 
 	airoha_set_macaddr(port, dev->dev_addr);
-	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id),
-				    FE_PSE_PORT_PPE1);
+
+	switch (port->id) {
+	case 3:
+	case 4:
+		/* If GDM2 is active we can't enable loopback */
+		if (!eth->ports[1])
+			airhoha_set_gdm2_loopback(port);
+		fallthrough;
+	case 2:
+		pse_port = FE_PSE_PORT_PPE2;
+		break;
+	default:
+		pse_port = FE_PSE_PORT_PPE1;
+		break;
+	}
+
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id), pse_port);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 60f5dd9908b41f95b5b627640ff6b25c8e3e1706..064941348bd91f1115082bf5e7734f34007953f8 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -67,6 +67,13 @@ enum {
 	QDMA_INT_REG_MAX
 };
 
+enum {
+	HSGMII_LAN_PCIE0_SRCPORT = 0x16,
+	HSGMII_LAN_PCIE1_SRCPORT,
+	HSGMII_LAN_ETH_SRCPORT,
+	HSGMII_LAN_USB_SRCPORT,
+};
+
 enum {
 	XSI_PCIE0_VIP_PORT_MASK	= BIT(22),
 	XSI_PCIE1_VIP_PORT_MASK	= BIT(23),
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 482822e7522958e0f0ea44dd96786358d226cc12..846abd2b497141a47171f7a3b7e0f520dc6499ed 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -213,21 +213,22 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
 	      AIROHA_FOE_IB1_BIND_TTL;
 	hwe->ib1 = val;
 
-	val = FIELD_PREP(AIROHA_FOE_IB2_PORT_AG, 0x1f);
+	val = FIELD_PREP(AIROHA_FOE_IB2_PORT_AG, 0x1f) |
+	      AIROHA_FOE_IB2_PSE_QOS;
 	if (dsa_port >= 0)
 		val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ, dsa_port);
+
 	if (dev) {
 		struct airoha_gdm_port *port = netdev_priv(dev);
 		u8 pse_port;
 
-		pse_port = port->id == 4 ? FE_PSE_PORT_GDM4 : port->id;
+		if (dsa_port >= 0)
+			pse_port = port->id == 4 ? FE_PSE_PORT_GDM4 : port->id;
+		else
+			pse_port = 2; /* uplink relies on GDM2 loopback */
 		val |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port);
 	}
 
-	/* FIXME: implement QoS support setting pse_port to 2 (loopback)
-	 * for uplink and setting qos bit in ib2
-	 */
-
 	if (is_multicast_ether_addr(dest_mac))
 		val |= AIROHA_FOE_IB2_MULTICAST;
 
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 6cc64c60953a3961b7c93dfa75a289a6f7a6599b..1aa06cdffe2320375e8710d58f2bbb056a330dfd 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -38,6 +38,12 @@
 #define FE_RST_CORE_MASK		BIT(0)
 
 #define REG_FE_FOE_TS			0x0010
+
+#define REG_FE_WAN_PORT			0x0024
+#define WAN1_EN_MASK			BIT(16)
+#define WAN1_MASK			GENMASK(12, 8)
+#define WAN0_MASK			GENMASK(4, 0)
+
 #define REG_FE_WAN_MAC_H		0x0030
 #define REG_FE_LAN_MAC_H		0x0040
 
@@ -126,6 +132,7 @@
 #define GDM_IP4_CKSUM			BIT(22)
 #define GDM_TCP_CKSUM			BIT(21)
 #define GDM_UDP_CKSUM			BIT(20)
+#define GDM_STRIP_CRC			BIT(16)
 #define GDM_UCFQ_MASK			GENMASK(15, 12)
 #define GDM_BCFQ_MASK			GENMASK(11, 8)
 #define GDM_MCFQ_MASK			GENMASK(7, 4)
@@ -139,6 +146,16 @@
 #define GDM_SHORT_LEN_MASK		GENMASK(13, 0)
 #define GDM_LONG_LEN_MASK		GENMASK(29, 16)
 
+#define REG_GDM_LPBK_CFG(_n)		(GDM_BASE(_n) + 0x1c)
+#define LPBK_GAP_MASK			GENMASK(31, 24)
+#define LPBK_LEN_MASK			GENMASK(23, 10)
+#define LPBK_CHAN_MASK			GENMASK(8, 4)
+#define LPBK_MODE_MASK			GENMASK(3, 1)
+#define LPBK_EN_MASK			BIT(0)
+
+#define REG_GDM_TXCHN_EN(_n)		(GDM_BASE(_n) + 0x24)
+#define REG_GDM_RXCHN_EN(_n)		(GDM_BASE(_n) + 0x28)
+
 #define REG_FE_CPORT_CFG		(GDM1_BASE + 0x40)
 #define FE_CPORT_PAD			BIT(26)
 #define FE_CPORT_PORT_XFC_MASK		BIT(25)
@@ -351,6 +368,18 @@
 
 #define REG_MC_VLAN_DATA		0x2108
 
+#define REG_SP_DFT_CPORT(_n)		(0x20e0 + ((_n) << 2))
+#define SP_CPORT_PCIE1_MASK		GENMASK(31, 28)
+#define SP_CPORT_PCIE0_MASK		GENMASK(27, 24)
+#define SP_CPORT_USB_MASK		GENMASK(7, 4)
+#define SP_CPORT_ETH_MASK		GENMASK(7, 4)
+
+#define REG_SRC_PORT_FC_MAP6		0x2298
+#define FC_ID_OF_SRC_PORT27_MASK	GENMASK(28, 24)
+#define FC_ID_OF_SRC_PORT26_MASK	GENMASK(20, 16)
+#define FC_ID_OF_SRC_PORT25_MASK	GENMASK(12, 8)
+#define FC_ID_OF_SRC_PORT24_MASK	GENMASK(4, 0)
+
 #define REG_CDM5_RX_OQ1_DROP_CNT	0x29d4
 
 /* QDMA */

-- 
2.48.1


