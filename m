Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C59CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkUegvs/QjXszI2ICxLY+Dln+3K11wJLG9CruS+MrzE=; b=DC0ss8lkpmRuM6lznLFEok7Iqr
	v5fOPqDIkpj4ZVwFVnEmT558BXaxAwGvXmX6Y9BFU1tPB7ONvBzLlaVJekTA4WKAtREy2vmxYoQ5+
	2ITI4b6Ynk1kYQaZhjtzUlZoLiTrnjY+0LSqYgNxioa2ByMLN6X8ca56uZWH0heficJTr8eIMiRzv
	Z/VoXP8g3vZJQDTC3n3/4N94EzraoZ++o51Rvn6fEamyp6y25mng0wO2Z1WNuzWG5WJbAV+J2q2lA
	BqW7trAdYztG29XrndshpVL4B/j61XXXUkmuGDfomSWetZG1WTHWVJbIHX4V8iwoKFCABRxi63JVN
	fofzUXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LE9-00000004PzE-3UTm;
	Thu, 16 Oct 2025 10:28:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LE4-00000004Ptj-3r1M;
	Thu, 16 Oct 2025 10:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59B9063EBD;
	Thu, 16 Oct 2025 10:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C316C113D0;
	Thu, 16 Oct 2025 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610532;
	bh=71KjFrakr+1MzbpIjmp0jK4uxgKZaIEWGd8u/KgJPAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iQ/721gM/D3CLRjLEpi+ujS6Jr+Jx0haKBXGQaqpmYorMcd5mxNbkfVL5U9uJDZxB
	 F9sJhsO9Z1EwJ+J543Fr868hCluyt3ZmXaVdy+/afCXR32NWks+uV7HoFcCDm2uTT4
	 R5xVQeYyZq2HxcC7J4cy49iXGKJDwc76xi0MfMb0xZYUyBFbSBT+aWFfDbSAnWRCaU
	 LOYd0meeW6fBLirdvDNw66fXVNyLwxtWdOPuokZI9SLAQ7Ku7c7XsBZQPkrCljme/O
	 6PTBdeS8rQRVgtY9TQwLvjew48OqeJ83l8pLZU4L5CpjzowK4L8oacl+jB6lFKUMi0
	 MFloPGjDK1K8w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:19 +0200
Subject: [PATCH net-next v2 05/13] net: airoha: Generalize
 airoha_ppe2_is_enabled routine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-5-ea6e7e9acbdb@kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
In-Reply-To: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
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

Rename airoha_ppe2_is_enabled() in airoha_ppe_is_enabled() and
generalize it in order to check if each PPE module is enabled.
Rely on airoha_ppe_is_enabled routine to properly initialize PPE for
AN7583 SoC since AN7583 does not support PPE2.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++++-----------
 drivers/net/ethernet/airoha/airoha_eth.h |  1 +
 drivers/net/ethernet/airoha/airoha_ppe.c | 17 ++++++++++-------
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 32015c41b58df68a0fe87bb026ee0a6d44ea6ec9..99e7fea52c6db9c4686fcef368f21e25f21ced58 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -297,8 +297,11 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 	int q;
 
 	all_rsv = airoha_fe_get_pse_all_rsv(eth);
-	/* hw misses PPE2 oq rsv */
-	all_rsv += PSE_RSV_PAGES * pse_port_num_queues[FE_PSE_PORT_PPE2];
+	if (airoha_ppe_is_enabled(eth, 1)) {
+		/* hw misses PPE2 oq rsv */
+		all_rsv += PSE_RSV_PAGES *
+			   pse_port_num_queues[FE_PSE_PORT_PPE2];
+	}
 	airoha_fe_set(eth, REG_FE_PSE_BUF_SET, all_rsv);
 
 	/* CMD1 */
@@ -335,13 +338,17 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 	for (q = 4; q < pse_port_num_queues[FE_PSE_PORT_CDM4]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM4, q,
 					 PSE_QUEUE_RSV_PAGES);
-	/* PPE2 */
-	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE2]; q++) {
-		if (q < pse_port_num_queues[FE_PSE_PORT_PPE2] / 2)
-			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2, q,
-						 PSE_QUEUE_RSV_PAGES);
-		else
-			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2, q, 0);
+	if (airoha_ppe_is_enabled(eth, 1)) {
+		/* PPE2 */
+		for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE2]; q++) {
+			if (q < pse_port_num_queues[FE_PSE_PORT_PPE2] / 2)
+				airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2,
+							 q,
+							 PSE_QUEUE_RSV_PAGES);
+			else
+				airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE2,
+							 q, 0);
+		}
 	}
 	/* GMD4 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4]; q++)
@@ -1762,8 +1769,11 @@ static int airoha_dev_init(struct net_device *dev)
 			airhoha_set_gdm2_loopback(port);
 		fallthrough;
 	case 2:
-		pse_port = FE_PSE_PORT_PPE2;
-		break;
+		if (airoha_ppe_is_enabled(eth, 1)) {
+			pse_port = FE_PSE_PORT_PPE2;
+			break;
+		}
+		fallthrough;
 	default:
 		pse_port = FE_PSE_PORT_PPE1;
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index cb7e198e40eeb2f44bd6e035cc7b583f47441d59..81b1e5f273df20fb8aef7a03e94ac14a3cfaf4d5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -627,6 +627,7 @@ static inline bool airoha_is_7581(struct airoha_eth *eth)
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
+bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
 int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 22ecece0e33ef4d7c9b1e2d6c5c9e510e3e0c040..505a3005f7db1c7804454177bf5b8a6aff54ef3f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -50,9 +50,12 @@ static int airoha_ppe_get_total_num_stats_entries(struct airoha_ppe *ppe)
 	return num_stats;
 }
 
-static bool airoha_ppe2_is_enabled(struct airoha_eth *eth)
+bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index)
 {
-	return airoha_fe_rr(eth, REG_PPE_GLO_CFG(1)) & PPE_GLO_CFG_EN_MASK;
+	if (index >= eth->soc->num_ppe)
+		return false;
+
+	return airoha_fe_rr(eth, REG_PPE_GLO_CFG(index)) & PPE_GLO_CFG_EN_MASK;
 }
 
 static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
@@ -120,7 +123,7 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 						 AIROHA_MAX_MTU));
 	}
 
-	if (airoha_ppe2_is_enabled(eth)) {
+	if (airoha_ppe_is_enabled(eth, 1)) {
 		sram_num_entries = PPE1_SRAM_NUM_ENTRIES;
 		sram_num_stats_entries =
 			airoha_ppe_get_num_stats_entries(ppe);
@@ -518,7 +521,7 @@ static int airoha_ppe_foe_get_flow_stats_index(struct airoha_ppe *ppe,
 		return ppe_num_stats_entries;
 
 	*index = hash;
-	if (airoha_ppe2_is_enabled(ppe->eth) &&
+	if (airoha_ppe_is_enabled(ppe->eth, 1) &&
 	    hash >= ppe_num_stats_entries)
 		*index = *index - PPE_STATS_NUM_ENTRIES;
 
@@ -613,7 +616,7 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 		u32 val;
 		int i;
 
-		ppe2 = airoha_ppe2_is_enabled(ppe->eth) &&
+		ppe2 = airoha_ppe_is_enabled(ppe->eth, 1) &&
 		       hash >= PPE1_SRAM_NUM_ENTRIES;
 		airoha_fe_wr(ppe->eth, REG_PPE_RAM_CTRL(ppe2),
 			     FIELD_PREP(PPE_SRAM_CTRL_ENTRY_MASK, hash) |
@@ -691,7 +694,7 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 
 	if (hash < PPE_SRAM_NUM_ENTRIES) {
 		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
-		bool ppe2 = airoha_ppe2_is_enabled(eth) &&
+		bool ppe2 = airoha_ppe_is_enabled(eth, 1) &&
 			    hash >= PPE1_SRAM_NUM_ENTRIES;
 
 		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
@@ -1286,7 +1289,7 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe,
 	int i, sram_num_entries = PPE_SRAM_NUM_ENTRIES;
 	struct airoha_foe_entry *hwe = ppe->foe;
 
-	if (airoha_ppe2_is_enabled(ppe->eth))
+	if (airoha_ppe_is_enabled(ppe->eth, 1))
 		sram_num_entries = sram_num_entries / 2;
 
 	for (i = 0; i < sram_num_entries; i++)

-- 
2.51.0


