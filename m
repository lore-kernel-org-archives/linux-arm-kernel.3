Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E386CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9lvs027XalS52O25VGX0LN0cLTqRJnkDJWChil5KG8=; b=a0upoT10AoQkh/Ki3qAl9KEYVO
	wZKeExwV/Iw2r9CcVhgFoMwx1kAiKeui4BMdsdQvZLcHNWT/3CGb0cwrg6W1gG6X3HzF7zK9Gf7d0
	Sd/IFqvtMcAtiOLFCY5sKrhT942dmSw6Hp5BFhItCJ34U5KeYC43Rwp7YWZNYiveRyf4a0BmsGJts
	thIUnaSx+9uikouxuslNKCTRlY8RZCbLJpKKRIBQdQjkqYn12qIu3timK+oEb47XwLinQ09L4XWAx
	dY8qDNpj1k+iEhjRy/vLSO3WcSvcKBK7s/ri/+edA1HpToM7fj+HdtdDEtq8ldAUcJ3aPUBJltdcG
	HBP7mV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjz-00000000gts-3MAg;
	Wed, 15 Oct 2025 07:16:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vju-00000000gni-2o2w;
	Wed, 15 Oct 2025 07:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 098CD6299B;
	Wed, 15 Oct 2025 07:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CE9C4CEFE;
	Wed, 15 Oct 2025 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512561;
	bh=S4CJOPreTSFAueUrvY6h/HbfEswJjG7BoSqKebhsDAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NtEIprY8JHcGVSY65cRr/AskgToTX3ZELWnVosoiRCkQ4NWI4VSpNiOxy5ddxdapD
	 mkH5nZYlOI24yL2RbaxNgEFUqON6BbielDvIRfW4Lvc9EjgUkM1jf/XW5GPQ0f08fd
	 uSx7ZLkWxpnNMFMX6igupDessmvhmCZl8zyuipcsvBkSbhadSDZQSzRhSlqFhRy+Pj
	 3XC2R8REKHAQtOKUIdLof/Xz96Uan96pj1N7c1tinCRaawASvGGFXxZSeYNBLp9/P4
	 lGN2ivBooBlbOYpERybZgZ3G70+GH11nDUoD26TxRN5JGAibKDHdUINl9h0eMas2xI
	 9My1Ezli/RWlA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:12 +0200
Subject: [PATCH net-next 12/12] net: airoha: Add AN7583 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-12-064855f05923@kernel.org>
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

Introduce support for AN7583 ethernet controller to airoha-eth dirver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 66 +++++++++++++++++++++++++++++---
 drivers/net/ethernet/airoha/airoha_eth.h | 11 ++++++
 drivers/net/ethernet/airoha/airoha_ppe.c |  3 ++
 3 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 76c82750b3ae89a9fa81c64d3b7c3578b369480c..1e432922c8418777d2a9ba482924ef5d8f98081a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1686,9 +1686,7 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	u32 pse_port = port->id == 3 ? FE_PSE_PORT_GDM3 : FE_PSE_PORT_GDM4;
 	struct airoha_eth *eth = port->qdma->eth;
-	u32 chan = port->id == 3 ? 4 : 0;
-	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
-	u32 nbq = port->id == 3 ? 4 : 0;
+	u32 chan, nbq;
 	int src_port;
 
 	/* Forward the traffic to the proper GDM port */
@@ -1698,6 +1696,8 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	/* Enable GDM2 loopback */
 	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(2), 0xffffffff);
 	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
+
+	chan = port->id == 3 ? airoha_is_7581(eth) ? 4 : 3 : 0;
 	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
 		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
 		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
@@ -1712,6 +1712,8 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(2));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(2));
 
+	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
+	nbq = port->id == 3 && airoha_is_7581(eth) ? 4 : 0;
 	src_port = eth->soc->ops.get_src_port_id(port, nbq);
 	if (src_port < 0)
 		return src_port;
@@ -1723,7 +1725,7 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      SP_CPORT_MASK(src_port & 0x7),
 		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(src_port & 0x7)));
 
-	if (port->id != 3)
+	if (port->id != 3 && airoha_is_7581(eth))
 		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
 			      FC_ID_OF_SRC_PORT24_MASK,
 			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
@@ -1878,6 +1880,20 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
 #endif
 }
 
+static int airoha_get_fe_port(struct airoha_gdm_port *port)
+{
+	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_eth *eth = qdma->eth;
+
+	switch (eth->soc->version) {
+	case 0x7583:
+		return port->id == 3 ? FE_PSE_PORT_GDM3 : port->id;
+	case 0x7581:
+	default:
+		return port->id == 4 ? FE_PSE_PORT_GDM4 : port->id;
+	}
+}
+
 static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *dev)
 {
@@ -1918,7 +1934,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		}
 	}
 
-	fport = port->id == 4 ? FE_PSE_PORT_GDM4 : port->id;
+	fport = airoha_get_fe_port(port);
 	msg1 = FIELD_PREP(QDMA_ETH_TXMSG_FPORT_MASK, fport) |
 	       FIELD_PREP(QDMA_ETH_TXMSG_METER_MASK, 0x7f);
 
@@ -3081,6 +3097,35 @@ static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
 	return -EINVAL;
 }
 
+static const char * const an7583_xsi_rsts_names[] = {
+	"xsi-mac",
+	"hsi0-mac",
+	"hsi1-mac",
+	"xfp-mac",
+};
+
+static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+{
+	switch (port->id) {
+	case 3:
+		/* 7583 SoC supports eth serdes on GDM3 port */
+		if (!nbq)
+			return HSGMII_LAN_7583_ETH_SRCPORT;
+		break;
+	case 4:
+		/* 7583 SoC supports PCIe and USB serdes on GDM4 port */
+		if (!nbq)
+			return HSGMII_LAN_7583_PCIE_SRCPORT;
+		if (nbq == 1)
+			return HSGMII_LAN_7583_USB_SRCPORT;
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
@@ -3091,8 +3136,19 @@ static const struct airoha_eth_soc_data en7581_soc_data = {
 	},
 };
 
+static const struct airoha_eth_soc_data an7583_soc_data = {
+	.version = 0x7583,
+	.xsi_rsts_names = an7583_xsi_rsts_names,
+	.num_xsi_rsts = ARRAY_SIZE(an7583_xsi_rsts_names),
+	.num_ppe = 1,
+	.ops = {
+		.get_src_port_id = airoha_an7583_get_src_port_id,
+	},
+};
+
 static const struct of_device_id of_airoha_match[] = {
 	{ .compatible = "airoha,en7581-eth", .data = &en7581_soc_data },
+	{ .compatible = "airoha,an7583-eth", .data = &an7583_soc_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_airoha_match);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 1b83b935520cd736a1eb376eff937340ed99a49a..35fca0a0ea9793388fda2598f7bc830f821cd926 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -73,6 +73,12 @@ enum {
 	HSGMII_LAN_7581_USB_SRCPORT,
 };
 
+enum {
+	HSGMII_LAN_7583_ETH_SRCPORT	= 0x16,
+	HSGMII_LAN_7583_PCIE_SRCPORT	= 0x18,
+	HSGMII_LAN_7583_USB_SRCPORT,
+};
+
 enum {
 	XSI_PCIE0_VIP_PORT_MASK	= BIT(22),
 	XSI_PCIE1_VIP_PORT_MASK	= BIT(23),
@@ -622,6 +628,11 @@ static inline bool airoha_is_7581(struct airoha_eth *eth)
 	return eth->soc->version == 0x7581;
 }
 
+static inline bool airoha_is_7583(struct airoha_eth *eth)
+{
+	return eth->soc->version == 0x7583;
+}
+
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 0315aafe2fd596e5f5b27d2a2b3fb198ff2ec19f..85bc5301f4b8cdfba4e582a0d8368910545c9a5b 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -36,6 +36,9 @@ static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe,
 					    u32 *num_stats)
 {
 #ifdef CONFIG_NET_AIROHA_FLOW_STATS
+	if (airoha_is_7583(ppe->eth))
+		return -EOPNOTSUPP;
+
 	*num_stats = PPE_STATS_NUM_ENTRIES;
 	return 0;
 #else

-- 
2.51.0


