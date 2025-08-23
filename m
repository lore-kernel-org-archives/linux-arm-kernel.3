Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0B7CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeM6rbfuQ7/eKK3heob3gEL4LBxqV7gnyc21mHxBHBk=; b=2plT3F2m2NqWgqOJCIc/itthFP
	gEJTzdggl7JjMLuCH7bwAtHF+Eq/7ksIVKuMC8dsnqmW4P0RTRXoVyndr6egXSnjKakK3s0Gb4cwe
	kRk7rb218BYum3PwsLc2/Mdo2wkfWbp7iwkWeQjXOKQnjj1c9yz2mdxKu5/1HecQDzy8hACQzgFLy
	0ji6Vj7q8QbvgTBIHv8N21J36a3YM5UZOT3jyEwvj9BUiXOq/rgetbRk8lVoXxY6+3YFhySmLwg9L
	TDz5QM5Ae/CaPrbNOM7qpX0qRZISml3FrS+3K2kuLoIzRPuqqGJvIufx/ff3fK0AuwVPmlPZRaE3m
	z3ckHpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjY2-00000004O5s-0TTq;
	Sat, 23 Aug 2025 08:24:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upj76-00000004JRg-0coc;
	Sat, 23 Aug 2025 07:56:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB886023E;
	Sat, 23 Aug 2025 07:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B80C4CEE7;
	Sat, 23 Aug 2025 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755935793;
	bh=Tbme8j5p7op4L6staVb0SYIyNq6Rfw+asaK7RC4Bgu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DEuA0nsmNpRsG8Zr7JOf1GFl3750lOiEqavhv6ysiK3Ksg9bjVyWxn/yXWGZGxKBm
	 b7zSJ4Hd8kb+x02iBWxRe0Q3ZSpTtRDr8XoJy2QOhcG3T1P1/KsYVSGW76UwuYCBBq
	 USEdK3WFEj1wkd815C1Rveo4Vq0b3dVfO9KPBY2an4U+DCLzSg8u+nCM7gfuOxbWP0
	 DIa78dXZyatZWFqq4tCH9HhZ6Las2mSYbnsRKC77l5PuF1JTnZUTQFL/S1AIIwKLXH
	 Q5Sw6uWW2poyl99pa1/O17VXdXEnK0V4csM8+KLFUZAcTAfyCfk21zARXIF7HO7WQh
	 cHCplH6gqkKOw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 23 Aug 2025 09:56:04 +0200
Subject: [PATCH net-next v3 3/3] net: airoha: Introduce check_skb callback
 in ppe_dev ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-airoha-en7581-wlan-rx-offload-v3-3-f78600ec3ed8@kernel.org>
References: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
In-Reply-To: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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
index 03d9b1f24bb34008b36d9590ec355f4503f9b01c..78473527ff508919fa60a464917617cb882aac20 100644
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
@@ -785,7 +786,7 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 		if (!airoha_ppe_foe_compare_entry(e, hwe))
 			continue;
 
-		airoha_ppe_foe_commit_entry(ppe, &e->data, hash);
+		airoha_ppe_foe_commit_entry(ppe, &e->data, hash, rx_wlan);
 		commit_done = true;
 		e->hash = hash;
 	}
@@ -797,7 +798,7 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 	e = rhashtable_lookup_fast(&ppe->l2_flows, &br,
 				   airoha_l2_flow_table_params);
 	if (e)
-		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash);
+		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash, rx_wlan);
 unlock:
 	spin_unlock_bh(&ppe_lock);
 }
@@ -1301,9 +1302,10 @@ int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data)
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
@@ -1315,7 +1317,7 @@ void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
 		return;
 
 	ppe->foe_check_time[hash] = now;
-	airoha_ppe_foe_insert_entry(ppe, skb, hash);
+	airoha_ppe_foe_insert_entry(ppe, skb, hash, rx_wlan);
 }
 
 void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port)
@@ -1404,6 +1406,7 @@ int airoha_ppe_init(struct airoha_eth *eth)
 		return -ENOMEM;
 
 	ppe->dev.ops.setup_tc_block_cb = airoha_ppe_setup_tc_block_cb;
+	ppe->dev.ops.check_skb = airoha_ppe_check_skb;
 	ppe->dev.priv = ppe;
 
 	foe_size = PPE_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 4b4b8b9e426dbc555bec4438b5e110cd235d2edc..1dc5b4e35ef9eaa1d06072a6b6dad52902468f79 100644
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
 static inline struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
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


