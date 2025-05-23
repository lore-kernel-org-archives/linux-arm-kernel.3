Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C736DC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/VsvwwJ/XWjMpGzxZSi5tL5S/u4oUvjiWYaA5OwQso=; b=oW2UTNnnL2+gg40/YUUtDdwCKZ
	Knv3vidy/W0fYpDVAFTK9EDf67LWZv5cecaGPAfMi1VxE6FpjgURjsWmaz3wHJQyOTtn/bwYmQoj5
	HwNRETSqTi9VtKeuRG2FiFhmVtKFU7tZDS9gJOxPYRo//YkVfexQrcw/1XfYUr+Z/IL7OUV19cHOY
	1sSVn5v+DBnty42oRx5RXVCg5cvb9PZRBrWbIGNNHZnDFZnqMI/ZA1CTBmikf1y9c38n1LMQje5eO
	l6PAKx5J2cNJEIL/nT2ZKNX265OZ8nB4EpOm45Jn0IfPHflVJRN5+QDlpjMwk829WXVTXuq9IFk8/
	NbBPYMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIY9L-00000004o9O-2bAl;
	Fri, 23 May 2025 19:33:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXzq-00000004n2s-0uiV;
	Fri, 23 May 2025 19:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D70B3444F3;
	Fri, 23 May 2025 19:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DAAC4CEEB;
	Fri, 23 May 2025 19:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748028237;
	bh=Q2Dup5l+vEvGwrc1bpceFqvGlnEspT+jpGeX8zIyloQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ELkz6srq6PjLkje3gdZEsiN0t9qgNjOqMMyKZbqaCWKuwxuw7odDwVEiRbd1TW0T0
	 KwcqONMCOjI3+60F8UnaFzxoP2t5IPU812FOlrBH6ppulteDSokIScMfBrp1GVbgL4
	 ET7WlE1o0hoHzy14ReV8RDjSyYTUuuYuRV67mEfMh7W0EMemIjBBzZVqRd5crjyVUk
	 EPtrhb2P6eduJZGbegiqSesV8j9FnaJd4fKsG2aCCulHf05+nPTaM0wjWrfcQ8AzeF
	 zHVJKAApuUjlXqwAWHlv77Pu4nKM0qH0PXkxCNBiefu1qCc6VsftY+RkplnNG8tGml
	 5AhkHihCWt8/Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 23 May 2025 21:23:31 +0200
Subject: [PATCH net-next 2/2] net: airoha: Add PPPoE offload support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-airoha-flowtable-pppoe-v1-2-8584401568e0@kernel.org>
References: <20250523-b4-airoha-flowtable-pppoe-v1-0-8584401568e0@kernel.org>
In-Reply-To: <20250523-b4-airoha-flowtable-pppoe-v1-0-8584401568e0@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_122358_311694_3FDA7204 
X-CRM114-Status: GOOD (  11.93  )
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

Introduce flowtable hw acceleration for PPPoE traffic.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 37 +++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 1d5a04eb82a6645e2b6a22ff4e694275ef1727d8..6571511cf4bb8c341b03b94ba8e444f558cbf125 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -232,6 +232,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 	      FIELD_PREP(AIROHA_FOE_IB1_BIND_UDP, l4proto == IPPROTO_UDP) |
 	      FIELD_PREP(AIROHA_FOE_IB1_BIND_VLAN_LAYER, data->vlan.num) |
 	      FIELD_PREP(AIROHA_FOE_IB1_BIND_VPM, data->vlan.num) |
+	      FIELD_PREP(AIROHA_FOE_IB1_BIND_PPPOE, data->pppoe.num) |
 	      AIROHA_FOE_IB1_BIND_TTL;
 	hwe->ib1 = val;
 
@@ -274,33 +275,38 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 		hwe->ipv6.data = qdata;
 		hwe->ipv6.ib2 = val;
 		l2 = &hwe->ipv6.l2;
+		l2->etype = ETH_P_IPV6;
 	} else {
 		hwe->ipv4.data = qdata;
 		hwe->ipv4.ib2 = val;
 		l2 = &hwe->ipv4.l2.common;
+		l2->etype = ETH_P_IP;
 	}
 
 	l2->dest_mac_hi = get_unaligned_be32(data->eth.h_dest);
 	l2->dest_mac_lo = get_unaligned_be16(data->eth.h_dest + 4);
 	if (type <= PPE_PKT_TYPE_IPV4_DSLITE) {
+		struct airoha_foe_mac_info *mac_info;
+
 		l2->src_mac_hi = get_unaligned_be32(data->eth.h_source);
 		hwe->ipv4.l2.src_mac_lo =
 			get_unaligned_be16(data->eth.h_source + 4);
-	} else {
-		l2->src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID, smac_id);
-	}
 
-	if (data->vlan.num) {
-		l2->etype = dsa_port >= 0 ? BIT(dsa_port) : 0;
-		l2->vlan1 = data->vlan.hdr[0].id;
-		if (data->vlan.num == 2)
-			l2->vlan2 = data->vlan.hdr[1].id;
-	} else if (dsa_port >= 0) {
-		l2->etype = BIT(15) | BIT(dsa_port);
-	} else if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
-		l2->etype = ETH_P_IPV6;
+		mac_info = (struct airoha_foe_mac_info *)l2;
+		mac_info->pppoe_id = data->pppoe.sid;
 	} else {
-		l2->etype = ETH_P_IP;
+		l2->src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID, smac_id) |
+				 FIELD_PREP(AIROHA_FOE_MAC_PPPOE_ID,
+					    data->pppoe.sid);
+	}
+	l2->vlan1 = data->vlan.hdr[0].id;
+	l2->vlan2 = data->vlan.hdr[1].id;
+
+	if (dsa_port >= 0) {
+		l2->etype = BIT(dsa_port);
+		l2->etype |= !data->vlan.num ? BIT(15) : 0;
+	} else if (data->pppoe.num) {
+		l2->etype = ETH_P_PPP_SES;
 	}
 
 	return 0;
@@ -944,6 +950,11 @@ static int airoha_ppe_flow_offload_replace(struct airoha_gdm_port *port,
 		case FLOW_ACTION_VLAN_POP:
 			break;
 		case FLOW_ACTION_PPPOE_PUSH:
+			if (data.pppoe.num == 1 || data.vlan.num == 2)
+				return -EOPNOTSUPP;
+
+			data.pppoe.sid = act->pppoe.sid;
+			data.pppoe.num++;
 			break;
 		default:
 			return -EOPNOTSUPP;

-- 
2.49.0


