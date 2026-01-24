Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C096DD715DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EHh228QxGIXrrJVTE4aa2QYRaQvESHcQuamH6lLYXdQ=; b=j4iwexuXvMHMp4j1aoF3HAVsph
	PIt8PvOK4VWjUVElI1XcetwSDLgNKSWAk0+Dy7RozW9gxYspMRciKQHTDiP+sLbu4Nly94VVcwo4x
	1cEoBa1Tb0UeiGO2FcFOqWBPv/2igf17c4rnk0TzP+f/SwGoZfs123du8b9OBc31uENtoVlpj6pEn
	aCE2hhS2bT6dfAPyxSVOAP1M4S6HAKN460fsjHDxGEovmMcpx0glg+goE7CTiZV2xwM3/7uhYVrhU
	Zop1cXpgcecE57fSG172iDqr80TFrKQElUAiggt+S19blYPnKzgqjzT84BlDipVLRhT2rPZqke02P
	Oxk2sFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaHs-0000000A8dV-2NxW;
	Sat, 24 Jan 2026 09:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaHp-0000000A8d1-0gDO;
	Sat, 24 Jan 2026 09:50:34 +0000
X-UUID: 1c8eb004f90a11f0a16f0188aa809bee-20260124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EHh228QxGIXrrJVTE4aa2QYRaQvESHcQuamH6lLYXdQ=;
	b=QiMq/4qW7pDGYKe/lJWvzXjQMUous/lQdv7DVMOoiUe6pM8l4TZ6IiT7EoVS5lTNxmTm/qgjgF3vlvf4KUCMu3UzfzidNFhN23Qk43yQ9KsKdvZNLL4WBl9bhjyopAsimuFMSIiiX0EBnjuGlkndP6iyLpoY4DuIp6uyIkbknDg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:159fc861-47c4-473a-a0f6-e06fdb9d59c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:97ac297a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1c8eb004f90a11f0a16f0188aa809bee-20260124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jibin.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 126600993; Sat, 24 Jan 2026 02:50:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 24 Jan 2026 17:50:24 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 24 Jan 2026 17:50:23 +0800
From: Jibin Zhang <jibin.zhang@mediatek.com>
To: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller"
	<davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Jibin Zhang <jibin.zhang@mediatek.com>
Subject: [PATCH v3] net: fix segmentation of forwarding fraglist GRO
Date: Sat, 24 Jan 2026 17:50:18 +0800
Message-ID: <20260124095021.3953-1-jibin.zhang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_015033_237142_1E6FD102 
X-CRM114-Status: GOOD (  15.25  )
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
v3: Apply the same fix to tcp6_gso_segment(), as suggested.

v2: To apply the added condition to a narrower scop

  In this version, the condition (skb_has_frag_list(gso_skb) &&
(gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol))
is moved into inner 'if' statement to a narrower scope.

  Send out the patch again for further discussion because:

1. This issue has a significant impact and has occurred in many
countries and regions.
2. Currently, modifying BPF is not a good option, because BPF code
cannot access the header of skb on the fraglist, and the required
changes would affect a wide range of code.
3. Directly disabling GRO aggregation for XLAT flows is also not a
good solution, as this change would disable GRO even when forwarding
is not needed, and it would also require cooperation from all device
drivers.

[2]: https://patchwork.kernel.org/patch/14375646

[1]: https://patchwork.kernel.org/patch/14350844

---
 net/ipv4/tcp_offload.c   | 4 +++-
 net/ipv4/udp_offload.c   | 4 +++-
 net/ipv6/tcpv6_offload.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index fdda18b1abda..6c2c10f37f87 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -107,7 +107,9 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
 		struct tcphdr *th = tcp_hdr(skb);
 
-		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
+		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
+		    skb_has_frag_list(skb) &&
+		    (skb->protocol == skb_shinfo(skb)->frag_list->protocol))
 			return __tcp4_gso_segment_list(skb, features);
 
 		skb->ip_summed = CHECKSUM_NONE;
diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index 19d0b5b09ffa..2a99f011793f 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -514,7 +514,9 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
 
 	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
 		 /* Detect modified geometry and pass those to skb_segment. */
-		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
+		if ((skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size) &&
+		    skb_has_frag_list(gso_skb) &&
+		    (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol))
 			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
 
 		ret = __skb_linearize(gso_skb);
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index effeba58630b..3c7fd0362475 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -170,7 +170,9 @@ static struct sk_buff *tcp6_gso_segment(struct sk_buff *skb,
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
 		struct tcphdr *th = tcp_hdr(skb);
 
-		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
+		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
+		    skb_has_frag_list(skb) &&
+		    (skb->protocol == skb_shinfo(skb)->frag_list->protocol))
 			return __tcp6_gso_segment_list(skb, features);
 
 		skb->ip_summed = CHECKSUM_NONE;
-- 
2.45.2


