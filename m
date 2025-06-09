Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BEAC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=excqZAKj1fpIXuOa842Ci3saNJX9RPSkBqQktvDHT+A=; b=IROt7axHOjVJSljd3vX3J6ZO2F
	AZ7e/uGKDVW4/Ajw8ODctb/Tda4MhnWNc6YGVLYHSbdWxMWxSxGelKODrxRjOmSpN/I3w8OjIk7yo
	MG84g/8dZZbObQ6okW9DtAd0QYoMbd2zdLvAp1F/f0QgrJ6bdiV19WI3xDb11p+zI6uWgHfTY5SDf
	Q6DQfDrk38QAKZLK7XudAPLAhDYxyh+HNkIW/xnpqnissiidjxDvLyIByILvphFK4Fja8sHBCdoPS
	rJPe0xo7AHMVq6dpYd3uc0Rk1pZGFp30jG+hCOSbn0Z7h0entUQ/apPR6HD633uuvx1fzP/POLR1u
	8l5r/biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjAZ-000000059uw-03Lx;
	Mon, 09 Jun 2025 20:32:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOj7D-000000059il-0Zlc;
	Mon, 09 Jun 2025 20:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6E73A50B92;
	Mon,  9 Jun 2025 20:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EB2C4CEEB;
	Mon,  9 Jun 2025 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749500945;
	bh=ynv6xDu7Wvta+MTxVq8GsI3jIBgL0uLRSQMAaRThjp0=;
	h=From:Date:Subject:To:Cc:From;
	b=pdSMrzR/4NX6Gx6Y5aZXBlfcEd4ruoj6qJzMwxt/W8wN9a7Dc1euf/MsBxGnnwRnZ
	 R/SsvMqjvvezL/hOcW/jA+iTYw2GAHN+WMuJjqYJECbCZKm06XK/aBNASgx7E3sSVT
	 Mzy0sLR89if+dRrRvGq4a/vwxrYaMdGhH3MG7PbDA/i5k2bxrdC9tdVZAzJII/gWq6
	 TzeHs7t3B2NN9r4VKN6P5htJFojtDfk4YJSAf1efv2859RC0+k6XBPrCZgYIUIV2zn
	 WlqOb9ANGkSpmiCKM4VUXhiEYshkTI3RGiHz9d0AWmRMHPAcuYf1KC7Cw9piI7v99I
	 InjB2cPKp1AOQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 09 Jun 2025 22:28:40 +0200
Subject: [PATCH net-next] net: airoha: Add PPPoE offload support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-b4-airoha-flowtable-pppoe-v1-1-1520fa7711b4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPdDR2gC/32NQQ6CMBBFr0Jm7Zi2tgZceQ/DouAAEwltpgQ1h
 Ltbce/yveS/v0IiYUpwKVYQWjhxmDLoQwHt4KeekO+ZwSjjlNUnbCx6ljB47MbwnH0zEsYYA6F
 pdVV1TrmKPOR9FOr4tbdvdeaB0xzkvV8t+mt/VWf+VReNCktXWqu0O5ekrg+SicZjkB7qbds+r
 0nOv8MAAAA=
X-Change-ID: 20250413-b4-airoha-flowtable-pppoe-2c199f5059ea
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_132907_316323_F921DB61 
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
 drivers/net/ethernet/airoha/airoha_ppe.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 9067d2fc7706ecf489bee9fc9b6425de18acb634..50d816344b1f8c1ed639de357f62e761ede92f05 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -232,6 +232,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 	      FIELD_PREP(AIROHA_FOE_IB1_BIND_UDP, l4proto == IPPROTO_UDP) |
 	      FIELD_PREP(AIROHA_FOE_IB1_BIND_VLAN_LAYER, data->vlan.num) |
 	      FIELD_PREP(AIROHA_FOE_IB1_BIND_VPM, data->vlan.num) |
+	      FIELD_PREP(AIROHA_FOE_IB1_BIND_PPPOE, data->pppoe.num) |
 	      AIROHA_FOE_IB1_BIND_TTL;
 	hwe->ib1 = val;
 
@@ -281,33 +282,42 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
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
+
+		mac_info = (struct airoha_foe_mac_info *)l2;
+		mac_info->pppoe_id = data->pppoe.sid;
 	} else {
-		l2->src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID, smac_id);
+		l2->src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID, smac_id) |
+				 FIELD_PREP(AIROHA_FOE_MAC_PPPOE_ID,
+					    data->pppoe.sid);
 	}
 
 	if (data->vlan.num) {
-		l2->etype = dsa_port >= 0 ? BIT(dsa_port) : 0;
 		l2->vlan1 = data->vlan.hdr[0].id;
 		if (data->vlan.num == 2)
 			l2->vlan2 = data->vlan.hdr[1].id;
-	} else if (dsa_port >= 0) {
-		l2->etype = BIT(15) | BIT(dsa_port);
-	} else if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
-		l2->etype = ETH_P_IPV6;
-	} else {
-		l2->etype = ETH_P_IP;
+	}
+
+	if (dsa_port >= 0) {
+		l2->etype = BIT(dsa_port);
+		l2->etype |= !data->vlan.num ? BIT(15) : 0;
+	} else if (data->pppoe.num) {
+		l2->etype = ETH_P_PPP_SES;
 	}
 
 	return 0;
@@ -957,6 +967,11 @@ static int airoha_ppe_flow_offload_replace(struct airoha_gdm_port *port,
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

---
base-commit: 2c7e4a2663a1ab5a740c59c31991579b6b865a26
change-id: 20250413-b4-airoha-flowtable-pppoe-2c199f5059ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


