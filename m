Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C54CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUe9rlUXRtSFBdvBHEKDFyeAsTRBjlooxhUZO8iF2Bs=; b=b8xwNJ6qkqVsLXIJD3d+tH0UUI
	gcWFTb0MDMkaYNAIta8XeiBtewluQdcmZXw+YSTknQF/ul9PZymyBuoVIktIQrPOWjD/g+RbsXfaf
	wVszf6QXl6eHkh+QOuxJYQR2Ye+2V9Diltwe/xdPoURzRDns9tRSR6X3zlpwXzme4+/kSdVs3JQns
	vwDtuevv8QytV074p+waZNHHYyW09FoG1I4AUFdChYSRrZf1JVOOE+3V5NpOd+/Dntvt0qGUqHDHk
	7AxqwioTQ5TO4Nsyy5rUJtTnVTDWyhIuTOpHi/9pLXrvnPrBX/hg5vNuXK7Vd+ZIKePMJFWtYJsdi
	TVkaR6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTDE-0000000GE5a-2vi6;
	Thu, 14 Aug 2025 08:21:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSkV-0000000G9Xg-25RN;
	Thu, 14 Aug 2025 07:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E67D9429C1;
	Thu, 14 Aug 2025 07:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A8DC4CEF4;
	Thu, 14 Aug 2025 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755157906;
	bh=dmpTosncAaE7Nn1ATog0PXraXtGDs0p8ha4JWC1qTo4=;
	h=From:Date:Subject:To:Cc:From;
	b=nZzOPP56EsxqzgrTP30aj4u8udATEp39etY8efpK0WqF/olSle/O9PEoRhfnINou6
	 XusIcCtzqkD1tseoGvfJlyU+7qzFhKdltSZ2ygHaPphVnXUya2X7JSzzmRLjJvo5G7
	 D9u7qz+GZFCgB8w8kmjm2gok2N8prV268n8CwH11auKsdVoPx8fYDQvRJ6lFqHsstb
	 6Lx9btVFw31Cm0WRHdbv+8JuCkMbNNeymbyodMLMazr0w6ij2fr7Iz/NyZPUTW1ft+
	 tWNXnE3+UK3zbEx0YqahL51yMzC6G3WPxui837ktBsoDA6/IxwSDUP9OqwEG0/CX1t
	 RBBJ00Pg+psVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 14 Aug 2025 09:51:16 +0200
Subject: [PATCH net-next] net: airoha: Add wlan flowtable TX offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-airoha-en7581-wlan-tx-offload-v1-1-72e0a312003e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHOVnWgC/x3MwQqEIBAA0F+JOTeQsa7Sr0SHKcdtIDQ0KpD+f
 aXju7wCmZNwhqEpkPiULDFUqLaBZaXwYxRXDX3X686qD5KkuBJyMNoqvDYKeNwYvd8iOZzN/NW
 GHFlPUI89sZf7/cfpef7z11YzbwAAAA==
X-Change-ID: 20250814-airoha-en7581-wlan-tx-offload-b7b657ada8fa
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_005147_579082_8B73BFAC 
X-CRM114-Status: GOOD (  17.61  )
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

Introduce support to offload the traffic received on the ethernet NIC
and forwarded to the wireless one using HW Packet Processor Engine (PPE)
capabilities.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h |  11 ++++
 drivers/net/ethernet/airoha/airoha_ppe.c | 103 ++++++++++++++++++++++---------
 2 files changed, 85 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index a970b789cf232c316e5ea27b0146493bf91c3767..9f721e2b972f0e547978419701caf532df664910 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -252,6 +252,10 @@ enum {
 #define AIROHA_FOE_MAC_SMAC_ID		GENMASK(20, 16)
 #define AIROHA_FOE_MAC_PPPOE_ID		GENMASK(15, 0)
 
+#define AIROHA_FOE_MAC_WDMA_QOS		GENMASK(15, 12)
+#define AIROHA_FOE_MAC_WDMA_BAND	BIT(11)
+#define AIROHA_FOE_MAC_WDMA_WCID	GENMASK(10, 0)
+
 struct airoha_foe_mac_info_common {
 	u16 vlan1;
 	u16 etype;
@@ -481,6 +485,13 @@ struct airoha_flow_table_entry {
 	unsigned long cookie;
 };
 
+struct airoha_wdma_info {
+	u8 idx;
+	u8 queue;
+	u16 wcid;
+	u8 bss;
+};
+
 /* RX queue to IRQ mapping: BIT(q) in IRQ(n) */
 #define RX_IRQ0_BANK_PIN_MASK			0x839f
 #define RX_IRQ1_BANK_PIN_MASK			0x7fe00000
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 82163392332c92d3bf50a976ffd473ae7a31a344..2bf1c584ba7b7217549ce79df86f7a123199b5e1 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -190,6 +190,31 @@ static int airoha_ppe_flow_mangle_ipv4(const struct flow_action_entry *act,
 	return 0;
 }
 
+static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
+				    struct airoha_wdma_info *info)
+{
+	struct net_device_path_stack stack;
+	struct net_device_path *path;
+	int err;
+
+	if (!dev)
+		return -ENODEV;
+
+	err = dev_fill_forward_path(dev, addr, &stack);
+	if (err)
+		return err;
+
+	path = &stack.path[stack.num_paths - 1];
+	if (path->type != DEV_PATH_MTK_WDMA)
+		return -1;
+
+	info->idx = path->mtk_wdma.wdma_idx;
+	info->bss = path->mtk_wdma.bss;
+	info->wcid = path->mtk_wdma.wcid;
+
+	return 0;
+}
+
 static int airoha_get_dsa_port(struct net_device **dev)
 {
 #if IS_ENABLED(CONFIG_NET_DSA)
@@ -220,9 +245,9 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 					struct airoha_flow_data *data,
 					int l4proto)
 {
-	int dsa_port = airoha_get_dsa_port(&dev);
+	u32 qdata = FIELD_PREP(AIROHA_FOE_SHAPER_ID, 0x7f), ports_pad, val;
+	int wlan_etype = -EINVAL, dsa_port = airoha_get_dsa_port(&dev);
 	struct airoha_foe_mac_info_common *l2;
-	u32 qdata, ports_pad, val;
 	u8 smac_id = 0xf;
 
 	memset(hwe, 0, sizeof(*hwe));
@@ -236,31 +261,47 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 	      AIROHA_FOE_IB1_BIND_TTL;
 	hwe->ib1 = val;
 
-	val = FIELD_PREP(AIROHA_FOE_IB2_PORT_AG, 0x1f) |
-	      AIROHA_FOE_IB2_PSE_QOS;
-	if (dsa_port >= 0)
-		val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ, dsa_port);
-
+	val = FIELD_PREP(AIROHA_FOE_IB2_PORT_AG, 0x1f);
 	if (dev) {
-		struct airoha_gdm_port *port = netdev_priv(dev);
-		u8 pse_port;
-
-		if (!airoha_is_valid_gdm_port(eth, port))
-			return -EINVAL;
-
-		if (dsa_port >= 0)
-			pse_port = port->id == 4 ? FE_PSE_PORT_GDM4 : port->id;
-		else
-			pse_port = 2; /* uplink relies on GDM2 loopback */
-		val |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port);
-
-		/* For downlink traffic consume SRAM memory for hw forwarding
-		 * descriptors queue.
-		 */
-		if (airhoa_is_lan_gdm_port(port))
-			val |= AIROHA_FOE_IB2_FAST_PATH;
-
-		smac_id = port->id;
+		struct airoha_wdma_info info = {};
+
+		if (!airoha_ppe_get_wdma_info(dev, data->eth.h_dest, &info)) {
+			val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ, info.idx) |
+			       FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT,
+					  FE_PSE_PORT_CDM4);
+			qdata |= FIELD_PREP(AIROHA_FOE_ACTDP, info.bss);
+			wlan_etype = FIELD_PREP(AIROHA_FOE_MAC_WDMA_BAND,
+						info.idx) |
+				     FIELD_PREP(AIROHA_FOE_MAC_WDMA_WCID,
+						info.wcid);
+		} else {
+			struct airoha_gdm_port *port = netdev_priv(dev);
+			u8 pse_port;
+
+			if (!airoha_is_valid_gdm_port(eth, port))
+				return -EINVAL;
+
+			if (dsa_port >= 0)
+				pse_port = port->id == 4 ? FE_PSE_PORT_GDM4
+							 : port->id;
+			else
+				pse_port = 2; /* uplink relies on GDM2
+					       * loopback
+					       */
+
+			val |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port) |
+			       AIROHA_FOE_IB2_PSE_QOS;
+			/* For downlink traffic consume SRAM memory for hw
+			 * forwarding descriptors queue.
+			 */
+			if (airhoa_is_lan_gdm_port(port))
+				val |= AIROHA_FOE_IB2_FAST_PATH;
+			if (dsa_port >= 0)
+				val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ,
+						  dsa_port);
+
+			smac_id = port->id;
+		}
 	}
 
 	if (is_multicast_ether_addr(data->eth.h_dest))
@@ -272,7 +313,6 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 	if (type == PPE_PKT_TYPE_IPV6_ROUTE_3T)
 		hwe->ipv6.ports = ports_pad;
 
-	qdata = FIELD_PREP(AIROHA_FOE_SHAPER_ID, 0x7f);
 	if (type == PPE_PKT_TYPE_BRIDGE) {
 		airoha_ppe_foe_set_bridge_addrs(&hwe->bridge, &data->eth);
 		hwe->bridge.data = qdata;
@@ -313,7 +353,9 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 			l2->vlan2 = data->vlan.hdr[1].id;
 	}
 
-	if (dsa_port >= 0) {
+	if (wlan_etype >= 0) {
+		l2->etype = wlan_etype;
+	} else if (dsa_port >= 0) {
 		l2->etype = BIT(dsa_port);
 		l2->etype |= !data->vlan.num ? BIT(15) : 0;
 	} else if (data->pppoe.num) {
@@ -490,6 +532,10 @@ static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
 		meter = &hwe->ipv4.l2.meter;
 	}
 
+	pse_port = FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, *ib2);
+	if (pse_port == FE_PSE_PORT_CDM4)
+		return;
+
 	airoha_ppe_foe_flow_stat_entry_reset(ppe, npu, index);
 
 	val = FIELD_GET(AIROHA_FOE_CHANNEL | AIROHA_FOE_QID, *data);
@@ -500,7 +546,6 @@ static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
 		      AIROHA_FOE_IB2_PSE_QOS | AIROHA_FOE_IB2_FAST_PATH);
 	*meter |= FIELD_PREP(AIROHA_FOE_TUNNEL_MTU, val);
 
-	pse_port = FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, *ib2);
 	nbq = pse_port == 1 ? 6 : 5;
 	*ib2 &= ~(AIROHA_FOE_IB2_NBQ | AIROHA_FOE_IB2_PSE_PORT |
 		  AIROHA_FOE_IB2_PSE_QOS);

---
base-commit: 3b5ca25ecfa85098c7015251a0e7c78a8ff392e5
change-id: 20250814-airoha-en7581-wlan-tx-offload-b7b657ada8fa

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


