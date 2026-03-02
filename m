Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C274D58E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ut3Ja5shw6oMOyCIFKPBOjDzsxt+8H78YokZql3NbjI=; b=lVR+m1cI6+Yy7zHo29ttYCUooC
	+V52P0GgcGPhrFDb5uwj3TJAOFCYipkfituPZzARaz8+rOD8nI72bOvxrj8utQfURkZQOiAYSHMql
	4MvwW80SdR2gwS2K9qfc+k3uv4Ydvvm1k5+LtYmImdqssMuNMQ2t/gjhPVyVqidOpzwE1N5PrLLYs
	2asklwpqY2zAP1jeDmiPvTeQu7EGjUiRT5MLGSvEeYb8CSOS3Fi45SBRp11Apj3tD9kX818vJ1jQo
	xxdY7iqtT/AkTfe/U0N4d8sUoItkNYLcjj2bUgzUoXUctXzrWFGA+WtHWmqxcgGZ6fkg8Q/e7StSe
	oT68JiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxBp-0000000CN5E-2IbB;
	Mon, 02 Mar 2026 06:55:37 +0000
Received: from n169-113.mail.139.com ([120.232.169.113])
	by bombadil.infradead.org with smtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxBm-0000000CN1f-0kUH;
	Mon, 02 Mar 2026 06:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=njVd3+QrdgnT0B7ZLjgLu6mVTYUNO447XUnFyx33b0bmxaacxfW0geBNvZCiABpi84IFkIx2Z6QAh
	 04mH0nHPCJn57nngesIQeVJLAKXtGYOQ3/9zmIw0h8mtngofF4PS2L6gHMEuP/6JpODYV5l+mfeFzH
	 6ijS5+70zoQlElcQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
	by rmsmtp-lg-appmail-33-12047 (RichMail) with SMTP id 2f0f69a5345f04b-01060;
	Mon, 02 Mar 2026 14:55:30 +0800 (CST)
X-RM-TRANSID: 2f0f69a5345f04b-01060
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	jibin.zhang@mediatek.com
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	yoshfuji@linux-ipv6.org,
	dsahern@kernel.org,
	matthias.bgg@gmail.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6.6.y 3/3] net: fix segmentation of forwarding fraglist GRO
Date: Mon,  2 Mar 2026 14:55:28 +0800
Message-Id: <20260302065528.2695652-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_225534_691435_EB0781AE 
X-CRM114-Status: GOOD (  11.29  )
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

From: Jibin Zhang <jibin.zhang@mediatek.com>

[ Upstream commit 426ca15c7f6cb6562a081341ca88893a50c59fa2 ]

This patch enhances GSO segment handling by properly checking
the SKB_GSO_DODGY flag for frag_list GSO packets, addressing
low throughput issues observed when a station accesses IPv4
servers via hotspots with an IPv6-only upstream interface.

Specifically, it fixes a bug in GSO segmentation when forwarding
GRO packets containing a frag_list. The function skb_segment_list
cannot correctly process GRO skbs that have been converted by XLAT,
since XLAT only translates the header of the head skb. Consequently,
skbs in the frag_list may remain untranslated, resulting in protocol
inconsistencies and reduced throughput.

To address this, the patch explicitly sets the SKB_GSO_DODGY flag
for GSO packets in XLAT's IPv4/IPv6 protocol translation helpers
(bpf_skb_proto_4_to_6 and bpf_skb_proto_6_to_4). This marks GSO
packets as potentially modified after protocol translation. As a
result, GSO segmentation will avoid using skb_segment_list and
instead falls back to skb_segment for packets with the SKB_GSO_DODGY
flag. This ensures that only safe and fully translated frag_list
packets are processed by skb_segment_list, resolving protocol
inconsistencies and improving throughput when forwarding GRO packets
converted by XLAT.

Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20260126152114.1211-1-jibin.zhang@mediatek.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Li hongliang <1468888505@139.com>
---
 net/core/filter.c        | 2 ++
 net/ipv4/tcp_offload.c   | 3 ++-
 net/ipv4/udp_offload.c   | 3 ++-
 net/ipv6/tcpv6_offload.c | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/core/filter.c b/net/core/filter.c
index ddb6d3dd34de..1732358b96ad 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3340,6 +3340,7 @@ static int bpf_skb_proto_4_to_6(struct sk_buff *skb)
 			shinfo->gso_type &= ~SKB_GSO_TCPV4;
 			shinfo->gso_type |=  SKB_GSO_TCPV6;
 		}
+		shinfo->gso_type |=  SKB_GSO_DODGY;
 	}
 
 	bpf_skb_change_protocol(skb, ETH_P_IPV6);
@@ -3370,6 +3371,7 @@ static int bpf_skb_proto_6_to_4(struct sk_buff *skb)
 			shinfo->gso_type &= ~SKB_GSO_TCPV6;
 			shinfo->gso_type |=  SKB_GSO_TCPV4;
 		}
+		shinfo->gso_type |=  SKB_GSO_DODGY;
 	}
 
 	bpf_skb_change_protocol(skb, ETH_P_IP);
diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index 36595709279c..7b09f6d0818b 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -107,7 +107,8 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
 		struct tcphdr *th = tcp_hdr(skb);
 
-		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
+		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
+		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
 			return __tcp4_gso_segment_list(skb, features);
 
 		skb->ip_summed = CHECKSUM_NONE;
diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index 9be9df2caf65..cd860d8d497b 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -352,7 +352,8 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
 
 	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
 		 /* Detect modified geometry and pass those to skb_segment. */
-		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
+		if ((skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size) &&
+		    !(skb_shinfo(gso_skb)->gso_type & SKB_GSO_DODGY))
 			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
 
 		ret = __skb_linearize(gso_skb);
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index 7567c32670c6..10025c9e07d3 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -109,7 +109,8 @@ static struct sk_buff *tcp6_gso_segment(struct sk_buff *skb,
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
 		struct tcphdr *th = tcp_hdr(skb);
 
-		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
+		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
+		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
 			return __tcp6_gso_segment_list(skb, features);
 
 		skb->ip_summed = CHECKSUM_NONE;
-- 
2.34.1



