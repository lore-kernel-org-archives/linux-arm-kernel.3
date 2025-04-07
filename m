Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1auUoTPr7Oz11P+/FMFNheHGLj7KmSTlsD2PRFxfQg=; b=0oMSa6DJqVmiJLtXfDQ+3qO+GW
	uU7gz+Rh1if1jcuLfnKdbUJGO1JD0mbXYtqdb3oCs2HkCPguSa8jTPHdW9kwLN/Ma1mOC78q/OsIC
	4C+OtIsAiPmdLRPNRimt+CX2hm+hjy5vkWd+2eQdoKYTHYQzXekEcZuDWI15W5Fy+5H+7iT/Cr6K/
	q6DpByxcW0EieoeVUyr3uwXBRpjKLyIcr8oRAH9LEhu3aBPY/LFvQcut7uLsnCtgWYfr9jppGLYaU
	0ewSmrXG18nlwCtOT5Szierim3ITtNtlW82lmbgsH+8b7gTdHqbz2ESbl04JBsuaxvlEfeuzSuETX
	eER7c4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oxq-000000013JT-1L47;
	Mon, 07 Apr 2025 16:04:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nJG-00000000h4Z-402W;
	Mon, 07 Apr 2025 14:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97EF36113B;
	Mon,  7 Apr 2025 14:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A22C4CEDD;
	Mon,  7 Apr 2025 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035525;
	bh=PEpWf8UDnWeJgZfMFDcP4fGro2nxdLzGkplXxHxBRYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UqFeO53ffL2wmeJDPwHEtPBVn0HgR/ZAof9fceTLjw7xZAvzUodrc6+ZGRcrpqFNc
	 FJb6tAElmStsMRakUxfajNYGcUmDhNmRE+yOKGPMUYvTdfmcKEG7/XOyiE5On6YHI0
	 VIxtwBHYXf6SfMHFYFW/0FyorPzHIgT1bn4/jM3vsDLKRkAGclY5VVxebIDxwBWaIe
	 sHL0tw63cjr/R4IFsJLuLCR4zJrDGHJ+kJORaxbogIfT7lWYZrgfiyWCc1fBToKzV8
	 nwzSmj8nk/vP++iUEYCSlmAaaebZ4jUp2r9x3lriBoCom0x0VGKzuC04xpswo7D2e9
	 f2cICdZEFRVwA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 07 Apr 2025 16:18:30 +0200
Subject: [PATCH net-next 1/3] net: airoha: Add l2_flows rhashtable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-airoha-flowtable-l2b-v1-1-18777778e568@kernel.org>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
In-Reply-To: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
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

Introduce l2_flows rhashtable in airoha_ppe struct in order to
store L2 flows committed by upper layers of the kernel. This is a
preliminary patch in order to offload L2 traffic rules.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 15 ++++++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 67 +++++++++++++++++++++++++++-----
 2 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index ec8908f904c61988c3dc973e187596c49af139fb..57925648155b104021c10821096ba267c9c7cef6 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -422,12 +422,23 @@ struct airoha_flow_data {
 	} pppoe;
 };
 
+enum airoha_flow_entry_type {
+	FLOW_TYPE_L4,
+	FLOW_TYPE_L2,
+	FLOW_TYPE_L2_SUBFLOW,
+};
+
 struct airoha_flow_table_entry {
-	struct hlist_node list;
+	union {
+		struct hlist_node list;
+		struct rhash_head l2_node;
+	};
 
 	struct airoha_foe_entry data;
 	u32 hash;
 
+	enum airoha_flow_entry_type type;
+
 	struct rhash_head node;
 	unsigned long cookie;
 };
@@ -480,6 +491,8 @@ struct airoha_ppe {
 	void *foe;
 	dma_addr_t foe_dma;
 
+	struct rhashtable l2_flows;
+
 	struct hlist_head *foe_flow;
 	u16 foe_check_time[PPE_NUM_ENTRIES];
 
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index f10dab935cab6fad747fdfaa70b67903904c1703..aed4a22f3a8b8737f18509b48fc47eae594b9d5f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -24,6 +24,13 @@ static const struct rhashtable_params airoha_flow_table_params = {
 	.automatic_shrinking = true,
 };
 
+static const struct rhashtable_params airoha_l2_flow_table_params = {
+	.head_offset = offsetof(struct airoha_flow_table_entry, l2_node),
+	.key_offset = offsetof(struct airoha_flow_table_entry, data.bridge),
+	.key_len = 2 * ETH_ALEN,
+	.automatic_shrinking = true,
+};
+
 static bool airoha_ppe2_is_enabled(struct airoha_eth *eth)
 {
 	return airoha_fe_rr(eth, REG_PPE_GLO_CFG(1)) & PPE_GLO_CFG_EN_MASK;
@@ -505,11 +512,36 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe, u32 hash)
 	spin_unlock_bh(&ppe_lock);
 }
 
+static int
+airoha_ppe_foe_l2_flow_commit_entry(struct airoha_ppe *ppe,
+				    struct airoha_flow_table_entry *e)
+{
+	struct airoha_flow_table_entry *prev;
+
+	e->type = FLOW_TYPE_L2;
+	prev = rhashtable_lookup_get_insert_fast(&ppe->l2_flows, &e->l2_node,
+						 airoha_l2_flow_table_params);
+	if (!prev)
+		return 0;
+
+	if (IS_ERR(prev))
+		return PTR_ERR(prev);
+
+	return rhashtable_replace_fast(&ppe->l2_flows, &prev->l2_node,
+				       &e->l2_node,
+				       airoha_l2_flow_table_params);
+}
+
 static int airoha_ppe_foe_flow_commit_entry(struct airoha_ppe *ppe,
 					    struct airoha_flow_table_entry *e)
 {
-	u32 hash = airoha_ppe_foe_get_entry_hash(&e->data);
+	int type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, e->data.ib1);
+	u32 hash;
 
+	if (type == PPE_PKT_TYPE_BRIDGE)
+		return airoha_ppe_foe_l2_flow_commit_entry(ppe, e);
+
+	hash = airoha_ppe_foe_get_entry_hash(&e->data);
 	e->hash = 0xffff;
 
 	spin_lock_bh(&ppe_lock);
@@ -524,13 +556,18 @@ static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
 {
 	spin_lock_bh(&ppe_lock);
 
-	hlist_del_init(&e->list);
-	if (e->hash != 0xffff) {
-		e->data.ib1 &= ~AIROHA_FOE_IB1_BIND_STATE;
-		e->data.ib1 |= FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
-					  AIROHA_FOE_STATE_INVALID);
-		airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash);
-		e->hash = 0xffff;
+	if (e->type == FLOW_TYPE_L2) {
+		rhashtable_remove_fast(&ppe->l2_flows, &e->l2_node,
+				       airoha_l2_flow_table_params);
+	} else {
+		hlist_del_init(&e->list);
+		if (e->hash != 0xffff) {
+			e->data.ib1 &= ~AIROHA_FOE_IB1_BIND_STATE;
+			e->data.ib1 |= FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
+						  AIROHA_FOE_STATE_INVALID);
+			airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash);
+			e->hash = 0xffff;
+		}
 	}
 
 	spin_unlock_bh(&ppe_lock);
@@ -890,9 +927,20 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	if (err)
 		return err;
 
+	err = rhashtable_init(&ppe->l2_flows, &airoha_l2_flow_table_params);
+	if (err)
+		goto error_flow_table_destroy;
+
 	err = airoha_ppe_debugfs_init(ppe);
 	if (err)
-		rhashtable_destroy(&eth->flow_table);
+		goto error_l2_flow_table_destroy;
+
+	return 0;
+
+error_l2_flow_table_destroy:
+	rhashtable_destroy(&ppe->l2_flows);
+error_flow_table_destroy:
+	rhashtable_destroy(&eth->flow_table);
 
 	return err;
 }
@@ -909,6 +957,7 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 	}
 	rcu_read_unlock();
 
+	rhashtable_destroy(&eth->ppe->l2_flows);
 	rhashtable_destroy(&eth->flow_table);
 	debugfs_remove(eth->ppe->debugfs_dir);
 }

-- 
2.49.0


