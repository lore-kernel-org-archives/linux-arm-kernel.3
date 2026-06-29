Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB15C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZkMfYGbmmBFNVQavhfnwkj1f6U3WSLYvJuEXnZXuTc=; b=ouaZ0TByFdA8bBVQrSpBrPW12L
	nVysmJngzO9zBwr+ZbbRrBy9X4hjpVlLdwvekm/31eKdASsGhbhP7jx6AYj/BiE66tE+7pMp0b78O
	+jYhj40sm0wvKRexKdV/SuGzinHQLWmhi0hSv4sZIpmoJAmi+i3vjB4JvXsPUHHzy62XF0/6dkMDZ
	KsLGLIijTXSDD0gCk+FF+0W1mIPAKW5AFJl0jF0D/3wdmgDugcAgVyd7Q0CjnTeZ2bFuCZqJLfkSd
	s9NAalS/xCP3d9UryyGkNoDy3xbUZ29tr3qGfRScTw94kYMfTODQi1kN1rW9ocxU4HJLqU/FLCprP
	oqHfy+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB7-0000000EZIc-32BY;
	Mon, 29 Jun 2026 12:33:33 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB3-0000000EZBe-0Zoq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso6087256a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736407; x=1783341207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZkMfYGbmmBFNVQavhfnwkj1f6U3WSLYvJuEXnZXuTc=;
        b=U8NQ+AeI2VdmAPztZV17i+wolR2hY3GtLZrI8px2RvB9DxgC6KDirvvA54hsd2vUpX
         pMjkW3m5oXMN6/cSnVBlqgmEdgz1AOWDdjNpXuBn6k4LZ6pla3YIblSXLzUz/0IAs9K3
         QUbZ3bZ3L8PVDSG493Cysx/aEs9MiuV646W+t50CzeaG3YQURZIu9+ZFgrnWlI77Dig/
         FaxzqkfyymcIArznfodAOYmso68d7g9fpW0UAWOV+OqXT1a4rFVzCWpYY0hYj2Oe9TWC
         IzDBVbvmEhqTwSte3SNu7fwS7luWcynha5bjG5YhSjxps/0RZFvrA+qUDQi9dFgWWL76
         wZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736407; x=1783341207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZkMfYGbmmBFNVQavhfnwkj1f6U3WSLYvJuEXnZXuTc=;
        b=sypMF709ybzPDEkTESfyEqkCupgQIzoml6DR1oXFa5OhvTqIB7yomrjhQAldZ2fKr4
         rY0DK4fVVum21iUapgH8S3e1tGYpPYQ3y51yO8fT1akS4oVNMrVxjNK7aAi/TyUQnTfT
         9xe7T4Nuj6GHse/aopbF6qpU1oKv41enySgXCq4UrxMRBHaG9RJLcp5iQIQPweAroXR9
         o6t1KGRGa01JGU6SP5CJTjBc8Jy/fnpqoXdG2B+U+lxBNen26V/OtsxUR6gA5J5qPsBY
         aDjiMgm9fYScQrmUmwxQ8bQ1BUKbuN96pJkD7ZA7yhEyKIz/jdTEaSe+XV478+fx6Btv
         Ke5A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0r0D6eaTRpp3z1ib/nSCbq1DfZZ76bhKPH/Vn5iRz7nPxG2sjfx1kVto4+vhSvApukODlPvJnDNAQEyBy+yYe@lists.infradead.org
X-Gm-Message-State: AOJu0YyJLcxwkuACregHEhnenX/TwCbk2EzEj2fl5nu3FAlFWMDAk5EA
	g2sH/qJsi9ISP5mV9OEGZBosE3rWcI8450Yn3eukocwk2GLHC6ab8tlZ
X-Gm-Gg: AfdE7ck88yaC8AJqeT3wC26efjTKh/ah45xbXGRDiIFpYZbla738B96hXXIUcqDeoaT
	kMsG6dM8ajVzrW+sZvokoTPZGUMrj/d6qoyJsz6BKtm/S1wh2qLkT7NRTLSQ2h5wj0MlvPtH4z5
	IFgLLMSiLUQC3RAtKJCSxULIVjj9On4Ta6HHXVzpGPjSG8uq1SFLZxk19g/pQKe2CEKr/keiqa6
	6xIryYy7d+SDG45qINflwaFopRwA/5oFvbFWWPhdBWyP7OBZ8EYScOCa5FSew7JqCK9jWsRam9V
	+fJ4QJ2dZ2aBvRbqlM7l8DjphfcUhN7Lqww3hjwj23bi55xaffJSaCtd7iZUJ1dpszQ+jL/XM8T
	4om537mmD5uSnXS7fiFPEXzMbRrw5Tz3HGa5UiRZrCC64r0mdVznuGOn4wgsDk6BlaTjIDg076o
	pVhQJ8aoI=
X-Received: by 2002:a17:906:4fc4:b0:c07:fcdd:7043 with SMTP id a640c23a62f3a-c12813bb075mr20833366b.16.1782736407037;
        Mon, 29 Jun 2026 05:33:27 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:25 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 3/5] netfilter: nf_flow_table_path: add L2 bridge offload
Date: Mon, 29 Jun 2026 14:32:51 +0200
Message-ID: <20260629123253.1912621-4-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053329_218725_376A38C7 
X-CRM114-Status: GOOD (  24.84  )
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

From: Ryan Chen <rchen14b@gmail.com>

Allow nft_flow_offload to accelerate traffic forwarded at layer 2 through
Linux bridge ports.

Detection: nft_flow_offload_is_bridging() identifies bridged flows by
checking that the ingress device is a bridge port and that the destination
MAC appears in the bridge FDB with a forwarding destination port (non-local
entry). VLAN resolution and FDB lookup are combined in a single
br_port_get_rcu() call via br_fdb_has_forwarding_entry_rcu().

Routing: nft_flow_route_bridging() allocates minimal dst entries anchored
to the bridge master device via rt_dst_alloc()/ip6_dst_alloc(). A full
routing table lookup via nf_route() is intentionally avoided: it fails for
prefixes that are only bridged, not routed, through the bridge interface
(e.g. when the bridge has no IP address or the bridged subnet is not in
the routing table).

MAC addresses: for bridged flows, nft_dev_forward_path() copies Ethernet
addresses directly from the packet header instead of going through the
neighbour table. Direction (original vs reply) is resolved against the
conntrack direction so both flow directions receive the correct MAC pair.

VLAN context: nft_br_vlan_dev_fill_forward_path() pre-populates the
net_device_path_ctx with the port VLAN id and protocol before the forward
path walk, enabling VLAN-aware hardware offload entries.

Also:
- info->indev is updated for every path type in nft_dev_path_info() so
  the bridge ingress device is correctly tracked regardless of path type.
- nft_flow_route() is now a thin dispatcher that delegates to
  nft_flow_route_routing() (routed traffic) or nft_flow_route_bridging()
  (bridged traffic); the exported API is unchanged.

Path discovery infrastructure was moved to nf_flow_table_path.c in
commit 93d7a7ed0734 ("netfilter: flowtable: move path discovery
infrastructure to its own file"), so all changes land in that file.

Based on a MediaTek SDK patch by Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Co-developed-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 167 +++++++++++++++++++++++++++--
 1 file changed, 157 insertions(+), 10 deletions(-)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 98c03b487f52..6c470854127f 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -15,6 +15,10 @@
 #include <net/netfilter/nf_conntrack_core.h>
 #include <net/netfilter/nf_conntrack_extend.h>
 #include <net/netfilter/nf_flow_table.h>
+#include <linux/if_bridge.h>
+#include <linux/if_ether.h>
+#include <net/route.h>
+#include <net/ip6_route.h>
 
 static enum flow_offload_xmit_type nft_xmit_type(struct dst_entry *dst)
 {
@@ -42,7 +46,25 @@ static bool nft_is_valid_ether_device(const struct net_device *dev)
 	return true;
 }
 
-static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
+static bool nft_flow_offload_is_bridging(struct sk_buff *skb)
+{
+	bool ret;
+
+	if (!netif_is_bridge_port(skb->dev))
+		return false;
+	if (!skb_mac_header_was_set(skb))
+		return false;
+
+	rcu_read_lock();
+	ret = br_fdb_has_forwarding_entry_rcu(skb->dev, skb,
+					      eth_hdr(skb)->h_dest);
+	rcu_read_unlock();
+
+	return ret;
+}
+
+static int nft_dev_fill_forward_path(struct net_device_path_ctx *ctx,
+				     const struct nf_flow_route *route,
 				     const struct dst_entry *dst_cache,
 				     const struct nf_conn *ct,
 				     enum ip_conntrack_dir dir, u8 *ha,
@@ -58,6 +80,12 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		goto out;
 	}
 
+	/* Bridging fastpath copies Ethernet addresses into ha; do not replace
+	 * them via neighbour lookup on the routed destination device.
+	 */
+	if (!is_zero_ether_addr(ha))
+		goto out;
+
 	n = dst_neigh_lookup(dst_cache, daddr);
 	if (!n)
 		return -1;
@@ -72,7 +100,23 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		return -1;
 
 out:
-	return dev_fill_forward_path(dev, ha, stack);
+	return __dev_fill_forward_path(ctx, ha, stack);
+}
+
+static void nft_br_vlan_dev_fill_forward_path(const struct nft_pktinfo *pkt,
+					      struct net_device_path_ctx *ctx)
+{
+	__be16 proto = 0;
+	u16 vlan_id;
+
+	rcu_read_lock();
+	vlan_id = br_vlan_get_offload_info_rcu(pkt->skb->dev, pkt->skb, &proto);
+	if (vlan_id) {
+		ctx->num_vlans = 1;
+		ctx->vlan[0].id = vlan_id;
+		ctx->vlan[0].proto = proto;
+	}
+	rcu_read_unlock();
 }
 
 struct nft_forward_info {
@@ -103,13 +147,13 @@ static int nft_dev_path_info(const struct net_device_path_stack *stack,
 
 	for (i = 0; i < stack->num_paths; i++) {
 		path = &stack->path[i];
+		info->indev = path->dev;
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 		case DEV_PATH_TUN:
-			info->indev = path->dev;
 			if (is_zero_ether_addr(info->h_source))
 				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
 
@@ -244,6 +288,7 @@ static int nft_flow_tunnel_update_route(const struct nft_pktinfo *pkt,
 }
 
 static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
+				bool is_bridging,
 				struct nf_flow_route *route,
 				const struct nf_conn *ct,
 				enum ip_conntrack_dir dir,
@@ -251,11 +296,33 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 {
 	const struct dst_entry *dst = route->tuple[dir].dst;
 	struct net_device_path_stack stack;
+	struct net_device_path_ctx ctx = {
+		.dev	= dst->dev,
+	};
 	struct nft_forward_info info = {};
+	enum ip_conntrack_info pkt_ctinfo;
+	enum ip_conntrack_dir skb_dir;
+	struct ethhdr *eth;
 	unsigned char ha[ETH_ALEN];
 	int i;
 
-	if (nft_dev_fill_forward_path(route, dst, ct, dir, ha, &stack) < 0 ||
+	memset(ha, 0, sizeof(ha));
+
+	if (is_bridging) {
+		nf_ct_get(pkt->skb, &pkt_ctinfo);
+		eth = eth_hdr(pkt->skb);
+		skb_dir = CTINFO2DIR(pkt_ctinfo);
+		if (skb_dir != dir) {
+			memcpy(ha, eth->h_source, ETH_ALEN);
+			memcpy(info.h_source, eth->h_dest, ETH_ALEN);
+		} else {
+			memcpy(ha, eth->h_dest, ETH_ALEN);
+			memcpy(info.h_source, eth->h_source, ETH_ALEN);
+		}
+		nft_br_vlan_dev_fill_forward_path(pkt, &ctx);
+	}
+
+	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0 ||
 	    nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
 		return -ENOENT;
 
@@ -292,9 +359,11 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 	return 0;
 }
 
-int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
-		   struct nf_flow_route *route, enum ip_conntrack_dir dir,
-		   struct nft_flowtable *ft)
+static int nft_flow_route_routing(const struct nft_pktinfo *pkt,
+				  const struct nf_conn *ct,
+				  struct nf_flow_route *route,
+				  enum ip_conntrack_dir dir,
+				  struct nft_flowtable *ft)
 {
 	struct dst_entry *this_dst = skb_dst(pkt->skb);
 	struct dst_entry *other_dst = NULL;
@@ -334,12 +403,12 @@ int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
 	nft_default_forward_path(route, this_dst, dir);
 	nft_default_forward_path(route, other_dst, !dir);
 
-	if (route->tuple[dir].xmit_type	== FLOW_OFFLOAD_XMIT_NEIGH &&
-	    nft_dev_forward_path(pkt, route, ct, dir, ft) < 0)
+	if (route->tuple[dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH &&
+	    nft_dev_forward_path(pkt, false, route, ct, dir, ft) < 0)
 		goto err_dst_release;
 
 	if (route->tuple[!dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH &&
-	    nft_dev_forward_path(pkt, route, ct, !dir, ft) < 0)
+	    nft_dev_forward_path(pkt, false, route, ct, !dir, ft) < 0)
 		goto err_dst_release;
 
 	return 0;
@@ -349,4 +418,82 @@ int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
 	dst_release(route->tuple[!dir].dst);
 	return -ENOENT;
 }
+
+static int nft_flow_route_bridging(const struct nft_pktinfo *pkt,
+				   const struct nf_conn *ct,
+				   struct nf_flow_route *route,
+				   enum ip_conntrack_dir dir,
+				   struct nft_flowtable *ft)
+{
+	struct dst_entry *dsts[IP_CT_DIR_MAX] = {};
+	struct net_device *br_dev;
+	int i;
+
+	/* Allocate minimal dsts anchored to the bridge master device to supply
+	 * xmit_type and MTU. A full routing lookup via nf_route() is avoided
+	 * because it fails for prefixes that are bridged but not routed.
+	 */
+	rcu_read_lock();
+	br_dev = netdev_master_upper_dev_get_rcu(pkt->skb->dev);
+	if (!br_dev || !netif_is_bridge_master(br_dev)) {
+		rcu_read_unlock();
+		return -ENOENT;
+	}
+
+	for (i = 0; i < IP_CT_DIR_MAX; i++) {
+		switch (nft_pf(pkt)) {
+		case NFPROTO_IPV4: {
+			struct rtable *rt;
+
+			rt = rt_dst_alloc(br_dev, 0, RTN_UNICAST, true);
+			if (rt)
+				dsts[i] = &rt->dst;
+			break;
+		}
+		case NFPROTO_IPV6: {
+			struct rt6_info *rt;
+
+			rt = ip6_dst_alloc(nft_net(pkt), br_dev, 0);
+			if (rt)
+				dsts[i] = &rt->dst;
+			break;
+		}
+		}
+	}
+	rcu_read_unlock();
+
+	if (!dsts[dir] || !dsts[!dir]) {
+		dst_release(dsts[dir]);
+		dst_release(dsts[!dir]);
+		return -ENOENT;
+	}
+
+	nft_default_forward_path(route, dsts[dir], dir);
+	nft_default_forward_path(route, dsts[!dir], !dir);
+	/* Drop allocation references; route->tuple[*].dst holds the clones. */
+	dst_release(dsts[dir]);
+	dst_release(dsts[!dir]);
+
+	if (route->tuple[dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH &&
+	    route->tuple[!dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH) {
+		if (nft_dev_forward_path(pkt, true, route, ct, dir, ft) ||
+		    nft_dev_forward_path(pkt, true, route, ct, !dir, ft)) {
+			dst_release(route->tuple[dir].dst);
+			dst_release(route->tuple[!dir].dst);
+			return -ENOENT;
+		}
+	}
+
+	return 0;
+}
+
+int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
+		   struct nf_flow_route *route, enum ip_conntrack_dir dir,
+		   struct nft_flowtable *ft)
+{
+	if (nft_flow_offload_is_bridging(pkt->skb))
+		return nft_flow_route_bridging(pkt, ct, route, dir, ft);
+
+	return nft_flow_route_routing(pkt, ct, route, dir, ft);
+}
 EXPORT_SYMBOL_GPL(nft_flow_route);
-- 
2.54.0


