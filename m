Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A72D64071
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g6vBW2JewppFyaRLb6KGyeqKVlYw6haEmZpTMY8QxvI=; b=gvOyx6M54OnOGf9HYe8LkKET2u
	gjyRezBESoW4RxTNKqAtiqaPL+vM8tbP00Da2cVawa2f8G8FEh8tBtkcdGxRkgFmbbGsr0wRvqib8
	CzPSqZ5iJb2aYkE7SOxKGyKj/aGJ5EjvORe6xOfJBI+2dt83O+jLsd0FuDPobnJOsAJRzn7ZufJE9
	JuYPzi3xfH57vcTLRJOPP90sMpB0Z6CnubEj5AmnqtE9dCvdfh6a/PmjeolBN2nZV1ny5dqUBIwDP
	XAHzyZ8p+3qUboNRbvur8R9HeuBgGfSXsaMLvyeou7N7x6YTKm5u7GExj9WTrnCkN1Hrnp5X464KW
	//jQoi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVidv-0000000689K-1dVu;
	Wed, 17 Dec 2025 03:56:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVidt-0000000688w-0WXs;
	Wed, 17 Dec 2025 03:56:02 +0000
X-UUID: 49c3e64cdafc11f09f706fa2197c6ceb-20251216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g6vBW2JewppFyaRLb6KGyeqKVlYw6haEmZpTMY8QxvI=;
	b=Tlni7/FISvDqX4RHVG3FxCMKhoNzFiQ8m8hrBTkHN/TCMoxCbPdWonNZdiwU6+wLPhQNMsjust2OZlW64AIkp8lXrpcRfMsWoSg116LddbRckcasrpP31cbAMHLc2bwDlk3PcPX28sP6D8958jocsdyZOv8IyLhWc2JedZRpFao=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:44793be4-917b-4a7c-876e-0a308d9d0388,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:caad86c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49c3e64cdafc11f09f706fa2197c6ceb-20251216
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jibin.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87060361; Tue, 16 Dec 2025 20:55:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 11:55:52 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 11:55:51 +0800
From: Jibin Zhang <jibin.zhang@mediatek.com>
To: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller"
	<davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, <shiming.cheng@mediatek.com>,
	<defa.li@mediatek.com>, Jibin Zhang <jibin.zhang@mediatek.com>
Subject: [PATCH] net: fix segmentation of forwarding fraglist GRO
Date: Wed, 17 Dec 2025 11:55:42 +0800
Message-ID: <20251217035548.8104-1-jibin.zhang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_195601_174670_7CCDF26D 
X-CRM114-Status: GOOD (  12.41  )
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

This patch enhances GSO segment checks by verifying the presence
of frag_list and protocol consistency, addressing low throughput
issues on IPv4 servers when used as hotspots

Specifically, it fixes a bug in GSO segmentation when forwarding
GRO packets with frag_list. The function skb_segment_list cannot
correctly process GRO skbs converted by XLAT, because XLAT only
converts the header of the head skb. As a result, skbs in the
frag_list may remain unconverted, leading to protocol
inconsistencies and reduced throughput.

To resolve this, the patch uses skb_segment to handle forwarded
packets converted by XLAT, ensuring that all fragments are
properly converted and segmented.

Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
---
 net/ipv4/tcp_offload.c | 3 ++-
 net/ipv4/udp_offload.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index fdda18b1abda..162a384a15bb 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -104,7 +104,8 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
 	if (!pskb_may_pull(skb, sizeof(struct tcphdr)))
 		return ERR_PTR(-EINVAL);
 
-	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
+	if ((skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(skb) &&
+	    (skb->protocol == skb_shinfo(skb)->frag_list->protocol)) {
 		struct tcphdr *th = tcp_hdr(skb);
 
 		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index 19d0b5b09ffa..704fb32d10d7 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -512,7 +512,8 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
 		return NULL;
 	}
 
-	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
+	if ((skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(gso_skb) &&
+	    (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol)) {
 		 /* Detect modified geometry and pass those to skb_segment. */
 		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
 			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
-- 
2.45.2


