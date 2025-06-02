Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9C2C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oyBei5zNGhXFER5VsaUhJm1Ho0yy4/glyljYg8yeqI=; b=us017rZCfNF+0imnVmvz6SqZX/
	odRQcuqEG4vHbpOa+frF3NpEfmRhqL2PVnnaog/tVYDya2Gv2nVngEO3lbxhcusBbggmplcRbSVTQ
	A/dHWY1CR+qxPHdaZEMWSS8b9S71IMjPma2FC8a7sgfnyZrI4TDdqhqgdPDw4bF4xXZcjjAyrRKFq
	NyZ0EtA9Yg/zoPFCy6TWg54MgcqW6/TJAmpJ4PaZLLrheGYUsSuZEvt46qyM8b1fFZ8mtsZeWWY2B
	OrRK4mY6DMEebsINv9IiM5SRRTqESuDOhCVuviScODFfUd4jc/5ZCbAw0eP+Ao1dmVQN09E4jdLFo
	e0B/T44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2wB-00000007Fcf-0uxo;
	Mon, 02 Jun 2025 11:02:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2pm-00000007EnN-1rPh;
	Mon, 02 Jun 2025 10:56:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E56B45C58D1;
	Mon,  2 Jun 2025 10:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2640CC4CEEB;
	Mon,  2 Jun 2025 10:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861761;
	bh=KGXQsqjuf+rgYidf6tzgY9bpwLnO257ZStKX95kSwjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PajkfvFAu+letbcKYheYBet9yR6/CeYQYK2/U6r72qEai39jK7jvrZg3StrPTwx8f
	 aqJFlV5pTLvVVTg9M5fL7DvjXapplNTm9iM/iWACN8pOrvKnQK3PAWrtHOmuyV8VUK
	 rqR6y3CgXjzXX27yewcljJm5OdLUk2Y4RvxC5+OL4MF0sVqH60PbO19XQ+bpDmvNqQ
	 nBS8rfQrf9FSW02AVZSZ30Cp9VBqHM7316wBkaa2TEOc/yxibPiJDMcvWOThFwXU46
	 wfWm2oJwqmRbu3GVWB4Y5tzopqd4R81QWgtmEU94WwRx5B3NToyrKDajvx/xdknFBz
	 HBfvL14L7AUhA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 02 Jun 2025 12:55:38 +0200
Subject: [PATCH net v2 2/3] net: airoha: Fix IPv6 hw acceleration in bridge
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-airoha-flowtable-ipv6-fix-v2-2-3287f8b55214@kernel.org>
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_035602_574611_691DD90F 
X-CRM114-Status: GOOD (  11.16  )
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

ib2 and airoha_foe_mac_info_common have not the same offsets in
airoha_foe_bridge and airoha_foe_ipv6 structures. Current codebase does
not accelerate IPv6 traffic in bridge mode since ib2 and l2 info are not
set properly copying airoha_foe_bridge struct into airoha_foe_ipv6 one
in airoha_ppe_foe_commit_subflow_entry routine.
Fix IPv6 hw acceleration in bridge mode resolving ib2 and
airoha_foe_mac_info_common overwrite in
airoha_ppe_foe_commit_subflow_entry() and configuring them with proper
values.

Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index a783f16980e6b7fdb69cec7ff09883a9c83d42d5..557779093a79a4b42a1dc49b8ba0dacbdc219385 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -639,7 +639,6 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 	u32 mask = AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_UDP;
 	struct airoha_foe_entry *hwe_p, hwe;
 	struct airoha_flow_table_entry *f;
-	struct airoha_foe_mac_info *l2;
 	int type;
 
 	hwe_p = airoha_ppe_foe_get_entry(ppe, hash);
@@ -656,18 +655,20 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 
 	memcpy(&hwe, hwe_p, sizeof(*hwe_p));
 	hwe.ib1 = (hwe.ib1 & mask) | (e->data.ib1 & ~mask);
-	l2 = &hwe.bridge.l2;
-	memcpy(l2, &e->data.bridge.l2, sizeof(*l2));
 
 	type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe.ib1);
-	if (type == PPE_PKT_TYPE_IPV4_HNAPT)
-		memcpy(&hwe.ipv4.new_tuple, &hwe.ipv4.orig_tuple,
-		       sizeof(hwe.ipv4.new_tuple));
-	else if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T &&
-		 l2->common.etype == ETH_P_IP)
-		l2->common.etype = ETH_P_IPV6;
-
-	hwe.bridge.ib2 = e->data.bridge.ib2;
+	if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
+		memcpy(&hwe.ipv6.l2, &e->data.bridge.l2, sizeof(hwe.ipv6.l2));
+		hwe.ipv6.ib2 = e->data.bridge.ib2;
+	} else {
+		memcpy(&hwe.bridge.l2, &e->data.bridge.l2,
+		       sizeof(hwe.bridge.l2));
+		hwe.bridge.ib2 = e->data.bridge.ib2;
+		if (type == PPE_PKT_TYPE_IPV4_HNAPT)
+			memcpy(&hwe.ipv4.new_tuple, &hwe.ipv4.orig_tuple,
+			       sizeof(hwe.ipv4.new_tuple));
+	}
+
 	hwe.bridge.data = e->data.bridge.data;
 	airoha_ppe_foe_commit_entry(ppe, &hwe, hash);
 

-- 
2.49.0


