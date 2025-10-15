Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80126CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD/AFc0UYMGviUCOGumw35vZB0mc0xIF9Y2+onUPUBo=; b=pMYUrghhCa4sCIubIq/knZo6cX
	WOWs6Ezb5QXH/aQ4dKpSGDCNke8B/fGj93b7QzFFHbt/8oXzLIZo1GwKKZNFGahUehKe7eSsMr4Gh
	3bUJJwFUcUvCqNoTjRXr93Cz0ga/v0z31mJxVIXBXqufegZNKW8xdUnchK3OvyoPT/pOAspZyhUBQ
	2lSyfvdoNZJvG3VSL8cCD+gNiI/XgIEXb5Oq5Es0CmvVqCB4ODMBF6q0ee1YPs703vSoiw0gqHPCZ
	2JmTpMxOSQt6fUUzWrDc0FBct5RXbaR79TVeh+Li1iRu9L+SWpiHsFWOBJao/uwIjjIwuZLChAEar
	acYQWRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vk5-00000000gzA-2Hl2;
	Wed, 15 Oct 2025 07:16:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjr-00000000gi5-2FPK;
	Wed, 15 Oct 2025 07:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 666C241877;
	Wed, 15 Oct 2025 07:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61CCC4CEF8;
	Wed, 15 Oct 2025 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512559;
	bh=PieS47PQvx6O4BGuXJE65xiustPAR1BCwqadpxxW9K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CT82OD0jngPS+9HrPHLQYy0QaY9WDAH8EU9zQlATpEHFgiIeSvbJBF/dNpPUtIZmQ
	 1nMFD8eULZzuoxafmPBSX51ntpM0qk1iocDhh/tYR8KKWfXuMjllf5CDnu+PUHdzCz
	 LuiySiuYp791rVHqr8PTKNHmtKHwvSz4D+g8Ve0qmwStAqdxUq6+ER13lUHFJ9tWVf
	 HGhRdbh/JMTODcJ6QS4X0v3YT40zBCu6yQmtlaCuxz/LjjfCggS/q2EiKXthKc21wd
	 mGzim/u46I57QBqWDJoBb4ol5vNUswMTzCx4o8p8tQnxqMYKD7mK4SLPMjx//8V3Qe
	 aQGN7O3leh90Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:11 +0200
Subject: [PATCH net-next 11/12] net: airoha: Refactor src port
 configuration in airhoha_set_gdm2_loopback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-11-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_001600_088860_0548A4FE 
X-CRM114-Status: GOOD (  17.96  )
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

AN7583 chipset relies on different definitions for source-port
identifier used for hw offloading. In order to support hw offloading
in AN7583 controller, refactor src port configuration in
airhoha_set_gdm2_loopback routine and introduce get_src_port_id
callback.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 75 +++++++++++++++++++++----------
 drivers/net/ethernet/airoha/airoha_eth.h  | 11 +++--
 drivers/net/ethernet/airoha/airoha_regs.h |  5 +--
 3 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5f6b5ab52e0265f7bb56b008ca653d64e04ff2d2..76c82750b3ae89a9fa81c64d3b7c3578b369480c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1682,11 +1682,14 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 	return 0;
 }
 
-static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
+static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	u32 pse_port = port->id == 3 ? FE_PSE_PORT_GDM3 : FE_PSE_PORT_GDM4;
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 chan = port->id == 3 ? 4 : 0;
+	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
+	u32 nbq = port->id == 3 ? 4 : 0;
+	int src_port;
 
 	/* Forward the traffic to the proper GDM port */
 	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(2), pse_port);
@@ -1709,29 +1712,23 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(2));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(2));
 
-	if (port->id == 3) {
-		/* FIXME: handle XSI_PCE1_PORT */
-		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
-			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
-			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_PCIE0_SRCPORT));
-		airoha_fe_rmw(eth,
-			      REG_SP_DFT_CPORT(HSGMII_LAN_PCIE0_SRCPORT >> 3),
-			      SP_CPORT_PCIE0_MASK,
-			      FIELD_PREP(SP_CPORT_PCIE0_MASK,
-					 FE_PSE_PORT_CDM2));
-	} else {
-		/* FIXME: handle XSI_USB_PORT */
+	src_port = eth->soc->ops.get_src_port_id(port, nbq);
+	if (src_port < 0)
+		return src_port;
+
+	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
+		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
+		      FIELD_PREP(WAN0_MASK, src_port));
+	airoha_fe_rmw(eth, REG_SP_DFT_CPORT(src_port >> 3),
+		      SP_CPORT_MASK(src_port & 0x7),
+		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(src_port & 0x7)));
+
+	if (port->id != 3)
 		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
 			      FC_ID_OF_SRC_PORT24_MASK,
 			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
-		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
-			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
-			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_ETH_SRCPORT));
-		airoha_fe_rmw(eth,
-			      REG_SP_DFT_CPORT(HSGMII_LAN_ETH_SRCPORT >> 3),
-			      SP_CPORT_ETH_MASK,
-			      FIELD_PREP(SP_CPORT_ETH_MASK, FE_PSE_PORT_CDM2));
-	}
+
+	return 0;
 }
 
 static int airoha_dev_init(struct net_device *dev)
@@ -1748,8 +1745,13 @@ static int airoha_dev_init(struct net_device *dev)
 	case 3:
 	case 4:
 		/* If GDM2 is active we can't enable loopback */
-		if (!eth->ports[1])
-			airhoha_set_gdm2_loopback(port);
+		if (!eth->ports[1]) {
+			int err;
+
+			err = airhoha_set_gdm2_loopback(port);
+			if (err)
+				return err;
+		}
 		fallthrough;
 	case 2:
 		if (airoha_ppe_is_enabled(eth, 1)) {
@@ -3055,11 +3057,38 @@ static const char * const en7581_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
+static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+{
+	switch (port->id) {
+	case 3:
+		/* 7581 SoC supports PCIe serdes on GDM3 port */
+		if (nbq == 4)
+			return HSGMII_LAN_7581_PCIE0_SRCPORT;
+		if (nbq == 5)
+			return HSGMII_LAN_7581_PCIE1_SRCPORT;
+		break;
+	case 4:
+		/* 7581 SoC supports eth and usb serdes on GDM4 port */
+		if (!nbq)
+			return HSGMII_LAN_7581_ETH_SRCPORT;
+		if (nbq == 1)
+			return HSGMII_LAN_7581_USB_SRCPORT;
+		break;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static const struct airoha_eth_soc_data en7581_soc_data = {
 	.version = 0x7581,
 	.xsi_rsts_names = en7581_xsi_rsts_names,
 	.num_xsi_rsts = ARRAY_SIZE(en7581_xsi_rsts_names),
 	.num_ppe = 2,
+	.ops = {
+		.get_src_port_id = airoha_en7581_get_src_port_id,
+	},
 };
 
 static const struct of_device_id of_airoha_match[] = {
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index df168d798699d50c70fa5f87764de24e85994dfd..1b83b935520cd736a1eb376eff937340ed99a49a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -67,10 +67,10 @@ enum {
 };
 
 enum {
-	HSGMII_LAN_PCIE0_SRCPORT = 0x16,
-	HSGMII_LAN_PCIE1_SRCPORT,
-	HSGMII_LAN_ETH_SRCPORT,
-	HSGMII_LAN_USB_SRCPORT,
+	HSGMII_LAN_7581_PCIE0_SRCPORT	= 0x16,
+	HSGMII_LAN_7581_PCIE1_SRCPORT,
+	HSGMII_LAN_7581_ETH_SRCPORT,
+	HSGMII_LAN_7581_USB_SRCPORT,
 };
 
 enum {
@@ -555,6 +555,9 @@ struct airoha_eth_soc_data {
 	const char * const *xsi_rsts_names;
 	int num_xsi_rsts;
 	int num_ppe;
+	struct {
+		int (*get_src_port_id)(struct airoha_gdm_port *port, int nbq);
+	} ops;
 };
 
 struct airoha_eth {
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 69c5a143db8c079be0a6ecf41081cd3f5048c090..cc230f61c0049a663c011556280af736284d018d 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -383,10 +383,7 @@
 #define REG_MC_VLAN_DATA		0x2108
 
 #define REG_SP_DFT_CPORT(_n)		(0x20e0 + ((_n) << 2))
-#define SP_CPORT_PCIE1_MASK		GENMASK(31, 28)
-#define SP_CPORT_PCIE0_MASK		GENMASK(27, 24)
-#define SP_CPORT_USB_MASK		GENMASK(7, 4)
-#define SP_CPORT_ETH_MASK		GENMASK(7, 4)
+#define SP_CPORT_MASK(_n)		GENMASK(3 + ((_n) << 2), ((_n) << 2))
 
 #define REG_SRC_PORT_FC_MAP6		0x2298
 #define FC_ID_OF_SRC_PORT27_MASK	GENMASK(28, 24)

-- 
2.51.0


