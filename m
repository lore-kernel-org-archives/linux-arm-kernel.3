Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C43BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lo87YNHTd22a8u23NqJ4DQaE8Yoczuuy8HSqU5SqIsY=; b=A9lS8xOEKPIKAvjhHyZzSJLOQC
	SGXRRm7DkHBwbe3Ocickg2eBIbxLW2Y/P5qqnu7z3zcfcmVDzBxM1ObgwHkqBMubJTJ+F1rTjj9BT
	NAVh3wNaITjaNtlG4KZfLkie64fi5ESuw6R5FqNT3lolvd10ROkhypsv/u/jYryfaAvh2OIXJQDge
	eVKpUR8BwlfGQgUybmC4SIu5PerrJSBJ5GW604VCJ7XS006NP58zaqdasAY1r9aXaFSDFsjHqP6LW
	ypA1cwd9pzJhTk5rOwdBW/yXU247fT/zdK14SrDzEPbUhN8npqDFffCR6PRpXXTtd1CyDWM5yblqP
	Rwa2sluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNxK-0000000Aqrw-08C6;
	Tue, 19 Aug 2025 15:08:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLLI-0000000APrt-2pkt;
	Tue, 19 Aug 2025 12:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9750B44A34;
	Tue, 19 Aug 2025 12:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F9EC4CEF1;
	Tue, 19 Aug 2025 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606091;
	bh=ZgAeLqBCCGeArPANi6zUOMhnXQnhm50yrseYUAeXpLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pr3HgkPeU7GI0BXmHpGPavkiQtTYVbLpiTh+0cqT+e3I4r6M5lvCCmNIblDjVysZP
	 f8ZIIG2AoW5DqcpuXFfn5+gHHFyWhuAZ+maZRSmR3XAa4L3itSWam5mIjzhVC1/8xM
	 ww+Q+iGqeoGW7BkizRWGdZ+6lPXdkWWGq8VIemOX1yySDV/KBW/Ecl2Y6JBGDrzM6X
	 WUe/xvfwjNJ/aWY/pQuagZx3sc8FSAUSPrYWhv8049LJWuSX4E5xAACX0hq/2AFMig
	 rQbXbI5YBP+igkhq7GJ7NteNL2aFHq1Q6Tg2zlIiTIDXWCWSXqbhxcXjryn/jYLH6n
	 kLMY8tblcjmVA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 19 Aug 2025 14:21:08 +0200
Subject: [PATCH net-next 3/3] net: airoha: Introduce check_skb callback in
 ppe_dev ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-airoha-en7581-wlan-rx-offload-v1-3-71a097e0e2a1@kernel.org>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
In-Reply-To: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052132_762354_7DD470B3 
X-CRM114-Status: GOOD (  15.01  )
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

Export airoha_ppe_check_skb routine in ppe_dev ops. check_skb callback
will be used by the MT76 driver in order to offload the traffic received
by the wlan NIC and forwarded to the ethernet one.
Add rx_wlan parameter to airoha_ppe_check_skb routine signature.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  |  3 ++-
 drivers/net/ethernet/airoha/airoha_eth.h  |  8 ++------
 drivers/net/ethernet/airoha/airoha_ppe.c  | 25 ++++++++++++++-----------
 include/linux/soc/airoha/airoha_offload.h | 20 ++++++++++++++++++++
 4 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a04f90dd3de47ae0ee8e90bfe221618076297e6..81ea01a652b9c545c348ad6390af8be873a4997f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -698,7 +698,8 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 
 		reason = FIELD_GET(AIROHA_RXD4_PPE_CPU_REASON, msg1);
 		if (reason == PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
-			airoha_ppe_check_skb(eth->ppe, q->skb, hash);
+			airoha_ppe_check_skb(&eth->ppe->dev, q->skb, hash,
+					     false);
 
 		done++;
 		napi_gro_receive(&q->napi, q->skb);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 9060b1d2814e0e4023d42a05ecb5265212df588f..77fd13d466dcd235a3ab39a488aa26d8f793cf77 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -229,10 +229,6 @@ struct airoha_hw_stats {
 	u64 rx_len[7];
 };
 
-enum {
-	PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED = 0x0f,
-};
-
 enum {
 	AIROHA_FOE_STATE_INVALID,
 	AIROHA_FOE_STATE_UNBIND,
@@ -622,8 +618,8 @@ static inline bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
-void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
-			  u16 hash);
+void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
+			  u16 hash, bool rx_wlan);
 int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index fe050a54cdcc818e18cd781a5c6a0b5cf1b496d6..9ffcff8c3ddfa0651058d0f48dffe027231a55aa 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -616,7 +616,7 @@ static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
 
 static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 				       struct airoha_foe_entry *e,
-				       u32 hash)
+				       u32 hash, bool rx_wlan)
 {
 	struct airoha_foe_entry *hwe = ppe->foe + hash * sizeof(*hwe);
 	u32 ts = airoha_ppe_get_timestamp(ppe);
@@ -639,7 +639,8 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 		goto unlock;
 	}
 
-	airoha_ppe_foe_flow_stats_update(ppe, npu, hwe, hash);
+	if (!rx_wlan)
+		airoha_ppe_foe_flow_stats_update(ppe, npu, hwe, hash);
 
 	if (hash < PPE_SRAM_NUM_ENTRIES) {
 		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
@@ -665,7 +666,7 @@ static void airoha_ppe_foe_remove_flow(struct airoha_ppe *ppe,
 		e->data.ib1 &= ~AIROHA_FOE_IB1_BIND_STATE;
 		e->data.ib1 |= FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
 					  AIROHA_FOE_STATE_INVALID);
-		airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash);
+		airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash, false);
 		e->hash = 0xffff;
 	}
 	if (e->type == FLOW_TYPE_L2_SUBFLOW) {
@@ -704,7 +705,7 @@ static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
 static int
 airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 				    struct airoha_flow_table_entry *e,
-				    u32 hash)
+				    u32 hash, bool rx_wlan)
 {
 	u32 mask = AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_UDP;
 	struct airoha_foe_entry *hwe_p, hwe;
@@ -745,14 +746,14 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 	}
 
 	hwe.bridge.data = e->data.bridge.data;
-	airoha_ppe_foe_commit_entry(ppe, &hwe, hash);
+	airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
 
 	return 0;
 }
 
 static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 					struct sk_buff *skb,
-					u32 hash)
+					u32 hash, bool rx_wlan)
 {
 	struct airoha_flow_table_entry *e;
 	struct airoha_foe_bridge br = {};
@@ -787,7 +788,7 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 			continue;
 		}
 
-		airoha_ppe_foe_commit_entry(ppe, &e->data, hash);
+		airoha_ppe_foe_commit_entry(ppe, &e->data, hash, rx_wlan);
 		commit_done = true;
 		e->hash = hash;
 	}
@@ -799,7 +800,7 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 	e = rhashtable_lookup_fast(&ppe->l2_flows, &br,
 				   airoha_l2_flow_table_params);
 	if (e)
-		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash);
+		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash, rx_wlan);
 unlock:
 	spin_unlock_bh(&ppe_lock);
 }
@@ -1303,9 +1304,10 @@ int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data)
 	return err;
 }
 
-void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
-			  u16 hash)
+void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
+			  u16 hash, bool rx_wlan)
 {
+	struct airoha_ppe *ppe = dev->priv;
 	u16 now, diff;
 
 	if (hash > PPE_HASH_MASK)
@@ -1317,7 +1319,7 @@ void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
 		return;
 
 	ppe->foe_check_time[hash] = now;
-	airoha_ppe_foe_insert_entry(ppe, skb, hash);
+	airoha_ppe_foe_insert_entry(ppe, skb, hash, rx_wlan);
 }
 
 void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port)
@@ -1407,6 +1409,7 @@ int airoha_ppe_init(struct airoha_eth *eth)
 		return -ENOMEM;
 
 	ppe->dev.ops.setup_tc_block_cb = airoha_ppe_setup_tc_block_cb;
+	ppe->dev.ops.check_skb = airoha_ppe_check_skb;
 	ppe->dev.priv = ppe;
 
 	foe_size = PPE_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index e05ded67c9e6fb89940e5b152f14c6ea0d7c6c49..4da562d0e4db6899d53f95b90a2a4ef2c63c974c 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -9,10 +9,17 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
+enum {
+	PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED = 0x0f,
+};
+
 struct airoha_ppe_dev {
 	struct {
 		int (*setup_tc_block_cb)(struct airoha_ppe_dev *dev,
 					 void *type_data);
+		void (*check_skb)(struct airoha_ppe_dev *dev,
+				  struct sk_buff *skb, u16 hash,
+				  bool rx_wlan);
 	} ops;
 
 	void *priv;
@@ -27,6 +34,13 @@ static inline int airoha_ppe_dev_setup_tc_block_cb(struct airoha_ppe_dev *dev,
 {
 	return dev->ops.setup_tc_block_cb(dev, type_data);
 }
+
+static inline void airoha_ppe_dev_check_skb(struct airoha_ppe_dev *dev,
+					    struct sk_buff *skb,
+					    u16 hash, bool rx_wlan)
+{
+	dev->ops.check_skb(dev, skb, hash, rx_wlan);
+}
 #else
 static inline airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
 {
@@ -42,6 +56,12 @@ static inline int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline void airoha_ppe_dev_check_skb(struct airoha_ppe_dev *dev,
+					    struct sk_buff *skb, u16 hash,
+					    bool rx_wlan)
+{
+}
 #endif
 
 #define NPU_NUM_CORES		8

-- 
2.50.1


