Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E8FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 05:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eg4Oi75Mp1rTvatlYQI4XUjpgg0k+tOQGw3eIL+gTkE=; b=HzaKilzOAOG6/zehfhFzrmgfcY
	jXqjdr+GA4HHM2Ah/yESJTM7ReAz0bHEH2hrcm1mkY5dhuP2PdmXw034Nx49JhpsTvL45AVE6pZ+V
	uZ20lSmAvenTCFzxc9UeaV/nStSEguEvLySDOlxtkK4LlkmtQnm2SAT6E0HOELw5YsdpIs6Z/8X4Y
	BC/+U90voTGvxY14gcvVvSd/WonYMaRKC9h5aaskxXVktEyUGQkxnXCyBjygq5oEXtHevZxEb4mgq
	2l1Z9fcqNOc1m2GjRjx5GdCCRoyI4rAYkHV79s4qpCIZoIwmdvr328QfUP4fun1+PthpqOV5EuCeT
	yCx7n3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaWx-0000000C8yb-0lXW;
	Fri, 03 Jan 2025 05:47:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaQt-0000000C8Kb-31v9;
	Fri, 03 Jan 2025 05:41:16 +0000
X-UUID: 571382f4c99511ef9048ed6ed365623b-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Eg4Oi75Mp1rTvatlYQI4XUjpgg0k+tOQGw3eIL+gTkE=;
	b=KdgoD3eFnnRyhud7vYZxYUy1SqJIxLwgU1XhlcKKyjMtMncPS4k3DQi+Xz7395yZsc9WSQqDjyUU/HIRDWO5rKYbRT1BRqkqcxiN9/DVpwn12Y50lmZSslUtcE+Felu6a8yCf58BeLjampe/xaRfbDCdAf/qKfWk1oZHtICNv90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:66bcb037-040a-4523-b78e-4e846e66de5c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:db904b37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 571382f4c99511ef9048ed6ed365623b-20250102
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <shiming.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1131111858; Thu, 02 Jan 2025 22:41:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 13:41:09 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 13:41:08 +0800
From: Shiming Cheng <shiming.cheng@mediatek.com>
To: <willemdebruijn.kernel@gmail.com>, <davem@davemloft.net>,
	<dsahern@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <netdev@vger.kernel.org>, <lena.wang@mediatek.com>, Shiming Cheng
	<shiming.cheng@mediatek.com>
Subject: [PATCH net v2] ipv6: socket SO_BINDTODEVICE lookup routing fail without IPv6 rule.
Date: Fri, 3 Jan 2025 13:43:49 +0800
Message-ID: <20250103054413.31581-1-shiming.cheng@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_214115_775571_5F8D6BD8 
X-CRM114-Status: GOOD (  14.60  )
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

When using socket IPv6 with SO_BINDTODEVICE, if IPv6 rule is not
matched, it will return ENETUNREACH. In fact, IPv4 does not behave
this way. IPv4 prioritizes looking up IP rules for routing and
forwarding, if not matched it will use socket-bound out interface
to send packets. The modification here is to make IPv6 behave the
same as IPv4. If IP rule is not found, it will also use socket-bound
out interface to send packts.

Fixes: 6f21c96a78b8 ("ipv6: enforce flowi6_oif usage in ip6_dst_lookup_tail()")
Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
---
 include/net/ip6_route.h |  2 ++
 net/ipv6/ip6_output.c   |  7 ++++++-
 net/ipv6/route.c        | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 6dbdf60b342f..0625597def6f 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -214,6 +214,8 @@ void rt6_multipath_rebalance(struct fib6_info *f6i);
 
 void rt6_uncached_list_add(struct rt6_info *rt);
 void rt6_uncached_list_del(struct rt6_info *rt);
+struct rt6_info *ip6_create_rt_oif_rcu(struct net *net, const struct sock *sk,
+		struct flowi6 *fl6, int flags);
 
 static inline const struct rt6_info *skb_rt6_info(const struct sk_buff *skb)
 {
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index f7b4608bb316..95728c8921cb 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1156,8 +1156,13 @@ static int ip6_dst_lookup_tail(struct net *net, const struct sock *sk,
 		*dst = ip6_route_output_flags(net, sk, fl6, flags);
 
 	err = (*dst)->error;
-	if (err)
+	if (err && (flags & RT6_LOOKUP_F_IFACE)) {
+		*dst = (struct dst_entry *)ip6_create_rt_oif_rcu(net, sk, fl6, flags);
+		if (!*dst)
+			goto out_err_release;
+	} else if (err) {
 		goto out_err_release;
+	}
 
 #ifdef CONFIG_IPV6_OPTIMISTIC_DAD
 	/*
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 67ff16c04718..7d7450fab44f 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1214,6 +1214,40 @@ static struct rt6_info *ip6_create_rt_rcu(const struct fib6_result *res)
 	return nrt;
 }
 
+struct rt6_info *ip6_create_rt_oif_rcu(struct net *net, const struct sock *sk,
+				       struct flowi6 *fl6, int flags)
+{
+	struct rt6_info *rt;
+	unsigned int prefs;
+	int err;
+	struct net_device *dev = dev_get_by_index_rcu(net, fl6->flowi6_oif);
+
+	if (!dev)
+		return NULL;
+	rt = ip6_dst_alloc(dev_net(dev), dev, flags);
+
+	if (!rt)
+		return NULL;
+	rt->dst.error = 0;
+	rt->dst.output = ip6_output;
+	rt->dst.lastuse = jiffies;
+	prefs = sk ? inet6_sk(sk)->srcprefs : 0;
+	err = ipv6_dev_get_saddr(net, dev, &fl6->daddr, prefs, &fl6->saddr);
+
+	if (err) {
+		dst_release(&rt->dst);
+		return NULL;
+	}
+	rt->rt6i_dst.addr = fl6->daddr;
+	rt->rt6i_dst.plen = 128;
+	rt->rt6i_src.addr = fl6->saddr;
+	rt->rt6i_dst.plen = 128;
+	rt->rt6i_idev = in6_dev_get(dev);
+	rt->rt6i_flags = flags;
+	return rt;
+}
+EXPORT_SYMBOL_GPL(ip6_create_rt_oif_rcu);
+
 INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 					     struct fib6_table *table,
 					     struct flowi6 *fl6,
-- 
2.45.2


