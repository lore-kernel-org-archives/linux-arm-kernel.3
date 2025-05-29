Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5932BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq6yFKkalOl4LwtolvwfyGp+iifxQRx+6zneX+9HCGw=; b=uF74v1opvsACfxOInD+hhGhg1J
	UKG9nru69sCHET5eCO8fWVd28tPmDeMP9XU2mYTi70BXV1AL+ysp6XP67/pfe9+P7v60F+T7AjVoH
	+S/zd4bc/gwA+YH0lci+RDuwUtS7szlCamEiv79DjKxQ+Ldcb+XngF/IzAVZkTeWTRcE93vKOe4O0
	9UpEMOjbpnCNgn+JQz/bwOrCgbiOhV+rHgaMtPuiE4D9moOpfrUvc87oCLn0fa6joMiCH7RjQL0Te
	e2Vk7hwo5yqCQ2H5XAs6mh8vEA8IXzdJ59+L3jK3Eqzn8by1asIn9DCOhlp1XdHDTPicu1R7qXf9K
	XvWaLktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKftk-0000000G9NE-1y9a;
	Thu, 29 May 2025 16:14:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfYz-0000000G7uR-2PkD;
	Thu, 29 May 2025 15:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0776E5C67D9;
	Thu, 29 May 2025 15:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25163C4CEE7;
	Thu, 29 May 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748533980;
	bh=dBrwp1lSjo0/zOXj6+oiqnIpBPI1NPg/5I0TXg2hVv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yw+rhh/7vLdzy29EEq4xkty36nZuNp/uVPHljZW42ReP4ZM0WRx5x00cuKa8nKoWW
	 cehhCWZD2qR5mAB9p7IPwFaxZ57fAMxlQdZbMmPU65C+9U9vwNu7pX2j58pUoNappk
	 5IffxJ5eBVEc3ui9eV7Yy1bZQWajrtJTvZcrLaS672kA1Q4lMxXddS7BFJ03sF7Yi9
	 seAOrSV0ZVz4riIGZjG133mrmxPWWox+J6l3T+6Ht0uBdtQXB6eYr80J2wQTqaT0Qj
	 5hzRAllPMLyk2rjcCIeb3KtkrzyJjisjwW7tesfif8Bj4v/B/NKPoEZqQJ/6nUorL0
	 JxVVdPWvO1hGQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 29 May 2025 17:52:38 +0200
Subject: [PATCH net 2/2] net: airoha: Fix IPv6 hw acceleration in bridge
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-airoha-flowtable-ipv6-fix-v1-2-7c7e53ae0854@kernel.org>
References: <20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org>
In-Reply-To: <20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_085301_703864_10A6160C 
X-CRM114-Status: GOOD (  11.68  )
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
airoha_foe_bridge and airoha_foe_ipv6 structures. Fix IPv6 hw
acceleration in bridge mode resolving ib2 and airoha_foe_mac_info_common
overwrite in airoha_ppe_foe_commit_subflow_entry routine. Moreover, set
AIROHA_FOE_MAC_SMAC_ID to 0xf in airoha_ppe_foe_commit_subflow_entry()
to configure the PPE module to keep original source mac address of the
bridged packets.

Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index a783f16980e6b7fdb69cec7ff09883a9c83d42d5..d5dbcb556f2b10b23ebbdd32a66a3c4f32cfb460 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -639,7 +639,6 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 	u32 mask = AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_UDP;
 	struct airoha_foe_entry *hwe_p, hwe;
 	struct airoha_flow_table_entry *f;
-	struct airoha_foe_mac_info *l2;
 	int type;
 
 	hwe_p = airoha_ppe_foe_get_entry(ppe, hash);
@@ -656,18 +655,23 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 
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
+		/* keep origianl source mac address */
+		hwe.ipv6.l2.src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID,
+						    0xf);
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


