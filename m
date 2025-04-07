Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC39AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKi3slRvjki8fVHN5rWjp+XsedZXgybN1mZlgeDcx8s=; b=In6skX92nzvzUlOAi+jSvAAtc6
	ujRlZqHbFj0BBY9PO/S/tUWURkTiXsuJsLWEjswFVtJLmIBSud02G48+ZT2g4SLgUn/t9uBE5HGsq
	SoZ0ck5mPQi+hslUKfuaDXZkMn5cxFg32YSE4xay0MlyUNLcWqt30IRkTYz7mG3mZ65eXIU4w93VD
	weDZy7/Vc551+IYooHiHqcgb1lV4X7gWvsC55xeEBJIc9wn9Lqbtz9VZuC5A2RNUDpb74ZKmdi7cv
	g/RuScMW/gS4GJCH9K6ZF50JqIUrH1V+pDqQ9M8ktoWjCR0ZJgJ6EVWJY4/FA7hxtiN0F0aSdTE5d
	FL8GTjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nOQ-00000000hwO-3ZYO;
	Mon, 07 Apr 2025 14:24:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nJJ-00000000h4o-1pLj;
	Mon, 07 Apr 2025 14:18:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFE105C5DD0;
	Mon,  7 Apr 2025 14:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46906C4CEDD;
	Mon,  7 Apr 2025 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035528;
	bh=K5EzkBuJAc3ZaJRcknCSYudz4Q3lzDRYva1mnChGj0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V4vmVd1QY1vK4QwpKwk2rxeIMORGRSdiYWWTZ/Dqt983289euYrYVv5/04Ncn9XBi
	 ZZcYbWrdCAC+UuS5uEEClfwBgWF+CTPEw7dWKCcX2IgMKpke9LVPYn8w5E9aPbOi67
	 5Y/0gbpbiV9RDBnK5CRyJSx9pml5HfosgDls8D0FWh6DntGfq2B8YvXXt7OmXsGQnB
	 Aol/cPmZ80Nepju+4QgE5cP7k/fit+x28BFaGzf7Rx3TjGc3rXriKspzgu3mbXH3/M
	 Zc7w0qGWdJyw4+AXxugoq7YedOluRrCxgAw09ISjMPjU8VM2f4cGH0XApA0gqD0mxD
	 zKkFM4/UDgSRg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 07 Apr 2025 16:18:31 +0200
Subject: [PATCH net-next 2/3] net: airoha: Add
 airoha_ppe_foe_flow_remove_entry_locked()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-airoha-flowtable-l2b-v1-2-18777778e568@kernel.org>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
In-Reply-To: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071849_564169_925ECAA8 
X-CRM114-Status: GOOD (  11.12  )
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

Introduce airoha_ppe_foe_flow_remove_entry_locked utility routine
in order to run airoha_ppe_foe_flow_remove_entry holding ppe_lock.
This is a preliminary patch to L2 offloading support to airoha_eth
driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 45 ++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index aed4a22f3a8b8737f18509b48fc47eae594b9d5f..8f75752c6714cc211a8efd0b6fdf5565ffa23c14 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -483,6 +483,26 @@ static int airoha_ppe_foe_commit_entry(struct airoha_ppe *ppe,
 	return 0;
 }
 
+static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
+					     struct airoha_flow_table_entry *e)
+{
+	lockdep_assert_held(&ppe_lock);
+
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
+	}
+}
+
 static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe, u32 hash)
 {
 	struct airoha_flow_table_entry *e;
@@ -551,25 +571,12 @@ static int airoha_ppe_foe_flow_commit_entry(struct airoha_ppe *ppe,
 	return 0;
 }
 
-static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
-					     struct airoha_flow_table_entry *e)
+static void
+airoha_ppe_foe_flow_remove_entry_locked(struct airoha_ppe *ppe,
+					struct airoha_flow_table_entry *e)
 {
 	spin_lock_bh(&ppe_lock);
-
-	if (e->type == FLOW_TYPE_L2) {
-		rhashtable_remove_fast(&ppe->l2_flows, &e->l2_node,
-				       airoha_l2_flow_table_params);
-	} else {
-		hlist_del_init(&e->list);
-		if (e->hash != 0xffff) {
-			e->data.ib1 &= ~AIROHA_FOE_IB1_BIND_STATE;
-			e->data.ib1 |= FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
-						  AIROHA_FOE_STATE_INVALID);
-			airoha_ppe_foe_commit_entry(ppe, &e->data, e->hash);
-			e->hash = 0xffff;
-		}
-	}
-
+	airoha_ppe_foe_flow_remove_entry(ppe, e);
 	spin_unlock_bh(&ppe_lock);
 }
 
@@ -762,7 +769,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_gdm_port *port,
 	return 0;
 
 remove_foe_entry:
-	airoha_ppe_foe_flow_remove_entry(eth->ppe, e);
+	airoha_ppe_foe_flow_remove_entry_locked(eth->ppe, e);
 free_entry:
 	kfree(e);
 
@@ -780,7 +787,7 @@ static int airoha_ppe_flow_offload_destroy(struct airoha_gdm_port *port,
 	if (!e)
 		return -ENOENT;
 
-	airoha_ppe_foe_flow_remove_entry(eth->ppe, e);
+	airoha_ppe_foe_flow_remove_entry_locked(eth->ppe, e);
 	rhashtable_remove_fast(&eth->flow_table, &e->node,
 			       airoha_flow_table_params);
 	kfree(e);

-- 
2.49.0


