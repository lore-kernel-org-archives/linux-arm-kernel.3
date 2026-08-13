Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C80C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGRpOM/KyLSRqGYlhqMn9rv/CZjCp3mr3TzX59jyJJo=; b=X8gIQVzR+WZPFrZVr3nPI2paRE
	mjVaECjLdV0IJB+8zAI20r5rbaa8bc2eoS853sM1mCl1gF/YzfCUUFVkelGddmpi36e+0MZi72Ed3
	wouPvQ+Yf0/dMkHaYoXoemKIOWhtvPrFtYY1yI+43+RrDDtzcnI3fntAexgYfQj0p30DJdE4qp5fx
	O+A+YZteJ80XTH6sLw9U6eeVArnDrBogBChx1zfUHKVPVoKpTBNksES8FGwHVrYnw8NtwckDYXOhX
	hVhQ2R1gou2ywzvqEx+6OVbdExdZiU/4MRlISbH9et5WQxLnKU66Xehk1Ae3P+bdwkfGZWukYiG+5
	k7MBcpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuKRU-0000000HFHl-35Vy;
	Thu, 13 Aug 2026 01:41:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuKRR-0000000HFHB-2pyB;
	Thu, 13 Aug 2026 01:41:10 +0000
X-UUID: 0bbed4e296b811f1afed4741b24580c9-20260812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qGRpOM/KyLSRqGYlhqMn9rv/CZjCp3mr3TzX59jyJJo=;
	b=Mxe22oy1kHFf8edanl6+FWeXFkISXdrF6RysrgaP4MYfxvyh7BWR5/a8dMr+5ANn8kjghAxzoddqhVRUiA9FJg8gXWX6JBNHljopM/Scfw7Og2I1K3lPsf18gNuz7NNVSFvKeBcX/+ZKKAb3/f0cwsdKv1HvNBvpWsgh8zjbnrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:21228dc4-bb6f-4013-ba0e-17767d7a6ab9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9090d0f1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:102|123|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0bbed4e296b811f1afed4741b24580c9-20260812
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <zhaoping.shu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 83107601; Wed, 12 Aug 2026 18:41:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 13 Aug 2026 09:41:01 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 13 Aug 2026 09:40:59 +0800
From: <zhaoping.shu@mediatek.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <ncardwell@google.com>,
	<kuniyu@google.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <willemb@google.com>,
	<alice@isovalent.com>, <sd@queasysnail.net>, <eilaimemedsnaimel@gmail.com>,
	<imv4bel@gmail.com>, <hw.he@mediatek.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <haijun.liu@mediatek.com>, <xiayu.zhang@mediatek.com>,
	<lambert.wang@mediatek.com>, <Iven.Yang@mediatek.com>, Zhaoping Shu
	<zhaoping.shu@mediatek.com>
Subject: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in  skb_gro_receive_list()
Date: Thu, 13 Aug 2026 09:40:56 +0800
Message-ID: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_184109_736549_2976913C 
X-CRM114-Status: GOOD (  16.30  )
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

From: HW He <hw.he@mediatek.com>

A device supports GRO_HW, and the device driver enables the
NETIF_F_GRO_FRAGLIST feature. During a tethering test,
skb_gro_receive_list() reaggregates the GSO packet. However,
skb_segment_list() cannot segment this packet back into
the original packets, which leads to IP fragmentation or packet drop.

Scenario (Tethering/Forwarding):
1.Driver submits a single TCP packet, P1. P1 is kept in the
gro_list as the first packet.

2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
multiple TCP packets by HW_GRO, and its non-linear data is stored in
frags[].

3. P1 and P2 match the GRO rules, and since there is no local socket,
they are aggregated by skb_gro_receive_list(). The resulting skb,
P3, has a frag_list entry that still contains frags[]:
P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
                                    [ frag[1] ]
                                    [ frag[2] ]
                                    ...
4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
skb_segment_list() to segment P3. However, skb_segment_list() only
segments the entries in frag_list. It does not segment the frags[]
inside P2, so P3 is not restored to the original packets, which leads
to IP fragmentation or packet drop in the following path.

When NETIF_F_GRO_HW is enabled, do not set NAPI_GRO_CB(skb)->is_flist.
Fall through to the regular skb_gro_receive() path instead of
skb_gro_receive_list().

Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
Signed-off-by: HW He <hw.he@mediatek.com>
Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
---
[2]: https://patchwork.kernel.org/patch/14706032
[1]: https://patchwork.kernel.org/patch/14702209
---
 net/ipv4/tcp_offload.c   | 7 +++----
 net/ipv6/tcpv6_offload.c | 3 ++-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index 3b1fdcd3cb29..641c47fb1ea2 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -395,9 +395,6 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 	struct net *net;
 	int iif, sdif;
 
-	if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
-		return;
-
 	p = tcp_gro_lookup(head, th);
 	if (p) {
 		NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
@@ -430,7 +427,9 @@ struct sk_buff *tcp4_gro_receive(struct list_head *head, struct sk_buff *skb)
 	if (!th)
 		goto flush;
 
-	tcp4_check_fraglist_gro(head, skb, th);
+	if (unlikely((skb->dev->features & NETIF_F_GRO_FRAGLIST) &&
+		     !(skb->dev->features & NETIF_F_GRO_HW)))
+		tcp4_check_fraglist_gro(head, skb, th);
 
 	return tcp_gro_receive(head, skb, th);
 
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index f2a659cd6183..e983f55c4419 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -57,7 +57,8 @@ static __always_inline struct sk_buff *tcp6_gro_receive(struct list_head *head,
 	if (!th)
 		goto flush;
 
-	if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
+	if (unlikely((skb->dev->features & NETIF_F_GRO_FRAGLIST) &&
+		     !(skb->dev->features & NETIF_F_GRO_HW)))
 		tcp6_check_fraglist_gro(head, skb, th);
 
 	return tcp_gro_receive(head, skb, th);
-- 
2.17.0


