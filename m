Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BF5CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9yA9nMen4tirsCg1md4LpwPLHlo/fqK6KphhTUnG+I=; b=yxvLg75plkGNr2KjA/xdIpdevj
	KpBWhgN1/OIPB5JeGMgWyO+/L7kP5R0z20jbGyp6JmfSUCLJCYCGakwTL0OB8gU7WVLIC8sBZMvlW
	dFCLYrvSfIxrEI178Xuy8yhLckWudbDK4COglaGvCivXV3nYhqNPo6NbfZzztFxj6iTX99b+9Zwz6
	Pf0US5umyUQKkwUa8+73Wi/26ZBsTA9RleUyIMokMSlHZMlNqA9B5DybLQotBjdLuh1Dr6dsq/8bT
	ozzYa605xQpdHpWGCR64Is2qz3Z2infSnzljCy5XHUKCtjN1sdKwT39zj6y9ox5cbLRUOwD2qz3L3
	JHMDo8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjh-00000000gZ1-46bB;
	Wed, 15 Oct 2025 07:15:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vje-00000000gW0-44IC;
	Wed, 15 Oct 2025 07:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E00B4A1EC;
	Wed, 15 Oct 2025 07:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC8AC116B1;
	Wed, 15 Oct 2025 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512546;
	bh=23/jFxviVmsGWoMCtGpoqnQYUZPgZBpFqBcYr11iqPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nkwz2dezj53oVslJQAwG5tQOaxSehWPykMgdwyYLZBXxhUVtDhgKvT6gcj2GC8TaK
	 r/WR2z6l6YzvIHFnfc89AusG+KE5JpdnN/6dBvEeahzsOMrw7k/Z5/i4UGLbcpnIgK
	 hbcdwmf8u1muQ/mA3hWcuP7ACln2arw0oacomjtu9ikLaMr4H0wjDrgJ3P4UppcfUv
	 3Os91fZy9a9qW+2RiVjz/tXA7HoMKJnaXpOpJ+VgpXyUiuJ0glUhTIrkkWIzUR96iX
	 7otnxgKI13a7HJMfKAdEfKfz7S9qujO/JuNiujg94S8+kkd7vslE2l+0IbVskiNTV7
	 sDfWFDNgpxJ0g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:06 +0200
Subject: [PATCH net-next 06/12] net: airoha: ppe: Move PPE memory info in
 airoha_eth_soc_data struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-6-064855f05923@kernel.org>
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
X-CRM114-CacheID: sfid-20251015_001547_064261_4ECAF387 
X-CRM114-Status: GOOD (  20.80  )
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

AN7583 SoC runs a single PPE device while EN7581 runs two of them.
Moreover PPE SRAM in AN7583 SoC is reduced to 8K (while SRAM is 16K on
EN7581). Take into account PPE memory layout during PPE configuration.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h         |  10 +-
 drivers/net/ethernet/airoha/airoha_ppe.c         | 129 +++++++++++------------
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c |   3 +-
 3 files changed, 67 insertions(+), 75 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 81b1e5f273df20fb8aef7a03e94ac14a3cfaf4d5..df168d798699d50c70fa5f87764de24e85994dfd 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -47,14 +47,9 @@
 #define QDMA_METER_IDX(_n)		((_n) & 0xff)
 #define QDMA_METER_GROUP(_n)		(((_n) >> 8) & 0x3)
 
-#define PPE_NUM				2
-#define PPE1_SRAM_NUM_ENTRIES		(8 * 1024)
-#define PPE_SRAM_NUM_ENTRIES		(PPE_NUM * PPE1_SRAM_NUM_ENTRIES)
-#define PPE1_STATS_NUM_ENTRIES		(4 * 1024)
-#define PPE_STATS_NUM_ENTRIES		(PPE_NUM * PPE1_STATS_NUM_ENTRIES)
+#define PPE_SRAM_NUM_ENTRIES		(8 * 1024)
+#define PPE_STATS_NUM_ENTRIES		(4 * 1024)
 #define PPE_DRAM_NUM_ENTRIES		(16 * 1024)
-#define PPE_NUM_ENTRIES			(PPE_SRAM_NUM_ENTRIES + PPE_DRAM_NUM_ENTRIES)
-#define PPE_HASH_MASK			(PPE_NUM_ENTRIES - 1)
 #define PPE_ENTRY_SIZE			80
 #define PPE_RAM_NUM_ENTRIES_SHIFT(_n)	(__ffs((_n) >> 10))
 
@@ -634,6 +629,7 @@ int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
 void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port);
+u32 airoha_ppe_get_total_num_entries(struct airoha_ppe *ppe);
 struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 						  u32 hash);
 void airoha_ppe_foe_entry_get_stats(struct airoha_ppe *ppe, u32 hash,
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 68b0b7ebf0e809bb1905f80ac544fb87027ec62f..58306cf91daf9faeb4f1cc0092579654dde3cfb0 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -36,7 +36,7 @@ static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe,
 					    u32 *num_stats)
 {
 #ifdef CONFIG_NET_AIROHA_FLOW_STATS
-	*num_stats = PPE1_STATS_NUM_ENTRIES;
+	*num_stats = PPE_STATS_NUM_ENTRIES;
 	return 0;
 #else
 	return -EOPNOTSUPP;
@@ -46,16 +46,31 @@ static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe,
 static int airoha_ppe_get_total_num_stats_entries(struct airoha_ppe *ppe,
 						  u32 *num_stats)
 {
+	struct airoha_eth *eth = ppe->eth;
 	int err;
 
 	err = airoha_ppe_get_num_stats_entries(ppe, num_stats);
 	if (err)
 		return err;
 
-	*num_stats = *num_stats * PPE_NUM;
+	*num_stats = *num_stats * eth->soc->num_ppe;
 	return 0;
 }
 
+static u32 airoha_ppe_get_total_sram_num_entries(struct airoha_ppe *ppe)
+{
+	struct airoha_eth *eth = ppe->eth;
+
+	return PPE_SRAM_NUM_ENTRIES * eth->soc->num_ppe;
+}
+
+u32 airoha_ppe_get_total_num_entries(struct airoha_ppe *ppe)
+{
+	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
+
+	return sram_num_entries + PPE_DRAM_NUM_ENTRIES;
+}
+
 bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index)
 {
 	if (index >= eth->soc->num_ppe)
@@ -73,15 +88,22 @@ static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
 
 static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 {
-	u32 sram_tb_size, sram_num_entries, dram_num_entries;
+	u32 sram_ppe_num_data_entries = PPE_SRAM_NUM_ENTRIES, sram_num_entries;
+	u32 sram_tb_size, dram_num_entries, sram_num_stats_entries;
 	struct airoha_eth *eth = ppe->eth;
-	u32 sram_num_stats_entries;
 	int i;
 
-	sram_tb_size = PPE_SRAM_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
+	sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
+	sram_tb_size = sram_num_entries * sizeof(struct airoha_foe_entry);
 	dram_num_entries = PPE_RAM_NUM_ENTRIES_SHIFT(PPE_DRAM_NUM_ENTRIES);
 
-	for (i = 0; i < PPE_NUM; i++) {
+	if (!airoha_ppe_get_num_stats_entries(ppe, &sram_num_stats_entries))
+		sram_ppe_num_data_entries -= sram_num_stats_entries;
+
+	sram_ppe_num_data_entries =
+		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
+
+	for (i = 0; i < eth->soc->num_ppe; i++) {
 		int p;
 
 		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
@@ -113,10 +135,16 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 
 		airoha_fe_rmw(eth, REG_PPE_TB_CFG(i),
 			      PPE_TB_CFG_SEARCH_MISS_MASK |
+			      PPE_SRAM_TB_NUM_ENTRY_MASK |
+			      PPE_DRAM_TB_NUM_ENTRY_MASK |
 			      PPE_TB_CFG_KEEPALIVE_MASK |
 			      PPE_TB_ENTRY_SIZE_MASK,
 			      FIELD_PREP(PPE_TB_CFG_SEARCH_MISS_MASK, 3) |
-			      FIELD_PREP(PPE_TB_ENTRY_SIZE_MASK, 0));
+			      FIELD_PREP(PPE_TB_ENTRY_SIZE_MASK, 0) |
+			      FIELD_PREP(PPE_SRAM_TB_NUM_ENTRY_MASK,
+					 sram_ppe_num_data_entries) |
+			      FIELD_PREP(PPE_DRAM_TB_NUM_ENTRY_MASK,
+					 dram_num_entries));
 
 		airoha_fe_wr(eth, REG_PPE_HASH_SEED(i), PPE_HASH_SEED);
 
@@ -129,43 +157,6 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 				      FIELD_PREP(FP1_EGRESS_MTU_MASK,
 						 AIROHA_MAX_MTU));
 	}
-
-	if (airoha_ppe_is_enabled(eth, 1)) {
-		sram_num_entries = PPE1_SRAM_NUM_ENTRIES;
-		if (!airoha_ppe_get_num_stats_entries(ppe,
-						      &sram_num_stats_entries))
-			sram_num_entries -= sram_num_stats_entries;
-		sram_num_entries = PPE_RAM_NUM_ENTRIES_SHIFT(sram_num_entries);
-
-		airoha_fe_rmw(eth, REG_PPE_TB_CFG(0),
-			      PPE_SRAM_TB_NUM_ENTRY_MASK |
-			      PPE_DRAM_TB_NUM_ENTRY_MASK,
-			      FIELD_PREP(PPE_SRAM_TB_NUM_ENTRY_MASK,
-					 sram_num_entries) |
-			      FIELD_PREP(PPE_DRAM_TB_NUM_ENTRY_MASK,
-					 dram_num_entries));
-		airoha_fe_rmw(eth, REG_PPE_TB_CFG(1),
-			      PPE_SRAM_TB_NUM_ENTRY_MASK |
-			      PPE_DRAM_TB_NUM_ENTRY_MASK,
-			      FIELD_PREP(PPE_SRAM_TB_NUM_ENTRY_MASK,
-					 sram_num_entries) |
-			      FIELD_PREP(PPE_DRAM_TB_NUM_ENTRY_MASK,
-					 dram_num_entries));
-	} else {
-		sram_num_entries = PPE_SRAM_NUM_ENTRIES;
-		if (!airoha_ppe_get_total_num_stats_entries(ppe,
-							    &sram_num_stats_entries))
-			sram_num_entries -= sram_num_stats_entries;
-		sram_num_entries = PPE_RAM_NUM_ENTRIES_SHIFT(sram_num_entries);
-
-		airoha_fe_rmw(eth, REG_PPE_TB_CFG(0),
-			      PPE_SRAM_TB_NUM_ENTRY_MASK |
-			      PPE_DRAM_TB_NUM_ENTRY_MASK,
-			      FIELD_PREP(PPE_SRAM_TB_NUM_ENTRY_MASK,
-					 sram_num_entries) |
-			      FIELD_PREP(PPE_DRAM_TB_NUM_ENTRY_MASK,
-					 dram_num_entries));
-	}
 }
 
 static void airoha_ppe_flow_mangle_eth(const struct flow_action_entry *act, void *eth)
@@ -464,9 +455,11 @@ static int airoha_ppe_foe_entry_set_ipv6_tuple(struct airoha_foe_entry *hwe,
 	return 0;
 }
 
-static u32 airoha_ppe_foe_get_entry_hash(struct airoha_foe_entry *hwe)
+static u32 airoha_ppe_foe_get_entry_hash(struct airoha_ppe *ppe,
+					 struct airoha_foe_entry *hwe)
 {
 	int type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe->ib1);
+	u32 ppe_hash_mask = airoha_ppe_get_total_num_entries(ppe) - 1;
 	u32 hash, hv1, hv2, hv3;
 
 	switch (type) {
@@ -504,14 +497,14 @@ static u32 airoha_ppe_foe_get_entry_hash(struct airoha_foe_entry *hwe)
 	case PPE_PKT_TYPE_IPV6_6RD:
 	default:
 		WARN_ON_ONCE(1);
-		return PPE_HASH_MASK;
+		return ppe_hash_mask;
 	}
 
 	hash = (hv1 & hv2) | ((~hv1) & hv3);
 	hash = (hash >> 24) | ((hash & 0xffffff) << 8);
 	hash ^= hv1 ^ hv2 ^ hv3;
 	hash ^= hash >> 16;
-	hash &= PPE_NUM_ENTRIES - 1;
+	hash &= ppe_hash_mask;
 
 	return hash;
 }
@@ -614,9 +607,11 @@ static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
 static struct airoha_foe_entry *
 airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 {
+	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
+
 	lockdep_assert_held(&ppe_lock);
 
-	if (hash < PPE_SRAM_NUM_ENTRIES) {
+	if (hash < sram_num_entries) {
 		u32 *hwe = ppe->foe + hash * sizeof(struct airoha_foe_entry);
 		struct airoha_eth *eth = ppe->eth;
 		bool ppe2;
@@ -624,7 +619,7 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 		int i;
 
 		ppe2 = airoha_ppe_is_enabled(ppe->eth, 1) &&
-		       hash >= PPE1_SRAM_NUM_ENTRIES;
+		       hash >= PPE_SRAM_NUM_ENTRIES;
 		airoha_fe_wr(ppe->eth, REG_PPE_RAM_CTRL(ppe2),
 			     FIELD_PREP(PPE_SRAM_CTRL_ENTRY_MASK, hash) |
 			     PPE_SRAM_CTRL_REQ_MASK);
@@ -675,6 +670,7 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 				       struct airoha_foe_entry *e,
 				       u32 hash, bool rx_wlan)
 {
+	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
 	struct airoha_foe_entry *hwe = ppe->foe + hash * sizeof(*hwe);
 	u32 ts = airoha_ppe_get_timestamp(ppe);
 	struct airoha_eth *eth = ppe->eth;
@@ -699,10 +695,10 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 	if (!rx_wlan)
 		airoha_ppe_foe_flow_stats_update(ppe, npu, hwe, hash);
 
-	if (hash < PPE_SRAM_NUM_ENTRIES) {
+	if (hash < sram_num_entries) {
 		dma_addr_t addr = ppe->foe_dma + hash * sizeof(*hwe);
 		bool ppe2 = airoha_ppe_is_enabled(eth, 1) &&
-			    hash >= PPE1_SRAM_NUM_ENTRIES;
+			    hash >= PPE_SRAM_NUM_ENTRIES;
 
 		err = npu->ops.ppe_foe_commit_entry(npu, addr, sizeof(*hwe),
 						    hash, ppe2);
@@ -829,7 +825,7 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 	if (state == AIROHA_FOE_STATE_BIND)
 		goto unlock;
 
-	index = airoha_ppe_foe_get_entry_hash(hwe);
+	index = airoha_ppe_foe_get_entry_hash(ppe, hwe);
 	hlist_for_each_entry_safe(e, n, &ppe->foe_flow[index], list) {
 		if (e->type == FLOW_TYPE_L2_SUBFLOW) {
 			state = FIELD_GET(AIROHA_FOE_IB1_BIND_STATE, hwe->ib1);
@@ -889,7 +885,7 @@ static int airoha_ppe_foe_flow_commit_entry(struct airoha_ppe *ppe,
 	if (type == PPE_PKT_TYPE_BRIDGE)
 		return airoha_ppe_foe_l2_flow_commit_entry(ppe, e);
 
-	hash = airoha_ppe_foe_get_entry_hash(&e->data);
+	hash = airoha_ppe_foe_get_entry_hash(ppe, &e->data);
 	e->type = FLOW_TYPE_L4;
 	e->hash = 0xffff;
 
@@ -1292,17 +1288,15 @@ static int airoha_ppe_flow_offload_cmd(struct airoha_eth *eth,
 static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe,
 					 struct airoha_npu *npu)
 {
-	int i, sram_num_entries = PPE_SRAM_NUM_ENTRIES;
+	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
 	struct airoha_foe_entry *hwe = ppe->foe;
+	int i;
 
-	if (airoha_ppe_is_enabled(ppe->eth, 1))
-		sram_num_entries = sram_num_entries / 2;
-
-	for (i = 0; i < sram_num_entries; i++)
+	for (i = 0; i < PPE_SRAM_NUM_ENTRIES; i++)
 		memset(&hwe[i], 0, sizeof(*hwe));
 
 	return npu->ops.ppe_flush_sram_entries(npu, ppe->foe_dma,
-					       PPE_SRAM_NUM_ENTRIES);
+					       sram_num_entries);
 }
 
 static struct airoha_npu *airoha_ppe_npu_get(struct airoha_eth *eth)
@@ -1379,9 +1373,10 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan)
 {
 	struct airoha_ppe *ppe = dev->priv;
+	u32 ppe_hash_mask = airoha_ppe_get_total_num_entries(ppe) - 1;
 	u16 now, diff;
 
-	if (hash > PPE_HASH_MASK)
+	if (hash > ppe_hash_mask)
 		return;
 
 	now = (u16)jiffies;
@@ -1471,7 +1466,7 @@ EXPORT_SYMBOL_GPL(airoha_ppe_put_dev);
 
 int airoha_ppe_init(struct airoha_eth *eth)
 {
-	u32 ppe_num_stats_entries;
+	u32 ppe_num_entries, ppe_num_stats_entries;
 	struct airoha_ppe *ppe;
 	int foe_size, err;
 
@@ -1482,18 +1477,18 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	ppe->dev.ops.setup_tc_block_cb = airoha_ppe_setup_tc_block_cb;
 	ppe->dev.ops.check_skb = airoha_ppe_check_skb;
 	ppe->dev.priv = ppe;
+	ppe->eth = eth;
+	eth->ppe = ppe;
 
-	foe_size = PPE_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
+	ppe_num_entries = airoha_ppe_get_total_num_entries(ppe);
+	foe_size = ppe_num_entries * sizeof(struct airoha_foe_entry);
 	ppe->foe = dmam_alloc_coherent(eth->dev, foe_size, &ppe->foe_dma,
 				       GFP_KERNEL);
 	if (!ppe->foe)
 		return -ENOMEM;
 
-	ppe->eth = eth;
-	eth->ppe = ppe;
-
 	ppe->foe_flow = devm_kzalloc(eth->dev,
-				     PPE_NUM_ENTRIES * sizeof(*ppe->foe_flow),
+				     ppe_num_entries * sizeof(*ppe->foe_flow),
 				     GFP_KERNEL);
 	if (!ppe->foe_flow)
 		return -ENOMEM;
@@ -1508,7 +1503,7 @@ int airoha_ppe_init(struct airoha_eth *eth)
 			return -ENOMEM;
 	}
 
-	ppe->foe_check_time = devm_kzalloc(eth->dev, PPE_NUM_ENTRIES,
+	ppe->foe_check_time = devm_kzalloc(eth->dev, ppe_num_entries,
 					   GFP_KERNEL);
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
index 05a756233f6a44fa51d1c57dd39d89c8ea488054..0112c41150bb05d1f99def4e58acd1a11e81696c 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
@@ -53,9 +53,10 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
 		[AIROHA_FOE_STATE_FIN] = "FIN",
 	};
 	struct airoha_ppe *ppe = m->private;
+	u32 ppe_num_entries = airoha_ppe_get_total_num_entries(ppe);
 	int i;
 
-	for (i = 0; i < PPE_NUM_ENTRIES; i++) {
+	for (i = 0; i < ppe_num_entries; i++) {
 		const char *state_str, *type_str = "UNKNOWN";
 		void *src_addr = NULL, *dest_addr = NULL;
 		u16 *src_port = NULL, *dest_port = NULL;

-- 
2.51.0


