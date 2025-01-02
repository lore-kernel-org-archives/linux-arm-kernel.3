Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kaRy8hvQiwVBlFWG9ZlYPjmGDHZFPf/6Z415OdGfZlw=; b=3u358GFBn40yltZ6Cm+9HS0Xg8
	rVYjsTRpzj8ssn+iTD5B155MDsjqv6Wl1HG7WOdVpH81m0oXoEqqDSG0OE1m0BZCzesf2OdUZ4PKT
	7yQl1YTGxmaZ/GCRZn20KyXCwwJE+DdAGzXBQgFFWFiYJBNdxOHmE4qTun36RcfKFyczoUp2oVSlv
	aftzOx5wO7KP9kK8r42yzwCzezRURi5SvnSMtwrKWEVYwFoqYiokpIqrlk2WvxLdKcUIF6FdsZ6mS
	mkW7Ef8Q8hS5E6Ms0iv17BMz6vgv0w/ASoTTfHcWWnEvYaNl4eZNF5q+5D+6v7YsH1xVME8H6mEJ2
	PElUh+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHpf-0000000A5hP-2RlK;
	Thu, 02 Jan 2025 09:49:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHoT-0000000A5WC-1xSJ;
	Thu, 02 Jan 2025 09:48:22 +0000
X-UUID: b16878f6c8ee11ef82ff63e91e7eb18c-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kaRy8hvQiwVBlFWG9ZlYPjmGDHZFPf/6Z415OdGfZlw=;
	b=SZM9ivaZiBX/M0nU1SfdVHj3aa6vbnBi/J4KeQFuRqGhNNIOKT/PrWnvI3falGC9LYO9GdccshDO8xfIpJfYf9eeFC5rY5E/K8yOeERjEKY1ASQJiVJbgy60G41jbeB6kOLS/uXnU+nXPk2hgmqQ6qRSh+3Xg+SO7PQwu1iNjO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:bb62d745-b04d-4180-88b6-f05399ea0295,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:a7908c25-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b16878f6c8ee11ef82ff63e91e7eb18c-20250102
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <shiming.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877320844; Thu, 02 Jan 2025 02:48:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 Jan 2025 17:48:14 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 Jan 2025 17:48:13 +0800
From: shiming cheng <shiming.cheng@mediatek.com>
To: <willemdebruijn.kernel@gmail.com>, <davem@davemloft.net>,
	<dsahern@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <netdev@vger.kernel.org>, <lena.wang@mediatek.com>, shiming cheng
	<shiming.cheng@mediatek.com>
Subject: [PATCH]  ipv6: socket SO_BINDTODEVICE lookup routing fail without IPv6 rule.
Date: Thu, 2 Jan 2025 17:51:11 +0800
Message-ID: <20250102095114.25860-1-shiming.cheng@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014821_513502_5F13A4BA 
X-CRM114-Status: GOOD (  14.80  )
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
        same as IPv4. If IP rule is not found, it will also use
        socket-bound out interface to send packts.

Signed-off-by: shiming cheng <shiming.cheng@mediatek.com>
---
 include/net/ip6_route.h |  2 ++
 net/ipv6/ip6_output.c   |  6 +++++-
 net/ipv6/route.c        | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

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
index f7b4608bb316..ed162ac3cb31 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1156,7 +1156,11 @@ static int ip6_dst_lookup_tail(struct net *net, const struct sock *sk,
 		*dst = ip6_route_output_flags(net, sk, fl6, flags);
 
 	err = (*dst)->error;
-	if (err)
+	if (err && (flags & RT6_LOOKUP_F_IFACE)) {
+		*dst = (struct dst_entry *)ip6_create_rt_oif_rcu(net, sk, fl6, flags);
+		if (!*dst)
+			goto out_err_release;
+	} else if (err) {
 		goto out_err_release;
 
 #ifdef CONFIG_IPV6_OPTIMISTIC_DAD
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


