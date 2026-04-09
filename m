Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655F5EA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkBZsu7ZNy9PmPvZHobQpgc7CDIfA8+pmj5UH/4UMu4=; b=KVuqkLtaDVfy8JEjOM4tPSqJmh
	AzmMuidi/8kwsL5To+fI11Gl2FF4SUbnhSHPHUbnC2vA7XJcmBVpf9sOD9pEHGDlnXMZhbOeTpqh0
	RIYnE6ZOjNXghRDgkeGPjchcN/36zSt9jzVXdPovnPyDKYYbGIME4xc7u7WR3uqDgH+3pMX46s1cn
	GDMDjCI0wc3Hwp6yD4jZMTIPIgt+RsdwWucxiC1l8w3JUi37NSyoiHb7HiPxoO1+NPoq7Rn7j3PcA
	+RnczTL7ikVcnAeDg4JRsUr/jQil1rtUr+2ccyU/uV0CLJE8fcBPsFY8b6BCu+brh+kAnpVKvcMjn
	8V8hxm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp6v-0000000ARRj-1NgR;
	Thu, 09 Apr 2026 13:07:53 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp6o-0000000ARNx-40ev;
	Thu, 09 Apr 2026 13:07:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wAp6j-000000001kZ-0rCL;
	Thu, 09 Apr 2026 13:07:41 +0000
Date: Thu, 9 Apr 2026 14:07:38 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: [PATCH RFC net-next 2/4] nf_flow_table: track sub-interface and
 bridge ifindex in flow tuple
Message-ID: <f1964680a3b5e7daa81a07be18f9e91af199102f.1775739840.git.daniel@makrotopia.org>
References: <cover.1775739840.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1775739840.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_060748_827311_C2DC9606 
X-CRM114-Status: GOOD (  14.72  )
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

Store the net_device ifindex alongside each encap entry and for
bridge devices during path discovery so the flow offload stats
path can later update sub-interface (VLAN, PPPoE, bridge)
counters for hw-offloaded flows.

The indices are placed below __hash so they do not affect flow
tuple lookups.

No functional change -- the indices are stored but not yet used.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 include/net/netfilter/nf_flow_table.h | 5 +++++
 net/netfilter/nf_flow_table_core.c    | 2 ++
 net/netfilter/nf_flow_table_path.c    | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index b09c11c048d51..ec1a18cfd9621 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -148,6 +148,9 @@ struct flow_offload_tuple {
 	/* All members above are keys for lookups, see flow_offload_hash(). */
 	struct { }			__hash;
 
+	int				encap_ifidx[NF_FLOW_TABLE_ENCAP_MAX];
+	int				bridge_ifidx;
+
 	u8				dir:2,
 					xmit_type:3,
 					encap_num:2,
@@ -221,11 +224,13 @@ struct nf_flow_route {
 			struct {
 				u16		id;
 				__be16		proto;
+				int		ifindex;
 			} encap[NF_FLOW_TABLE_ENCAP_MAX];
 			struct flow_offload_tunnel tun;
 			u8			num_encaps:2,
 						num_tuns:2,
 						ingress_vlans:2;
+			int			bridge_ifindex;
 		} in;
 		struct {
 			u32			ifindex;
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 2c4140e6f53c5..9bc8be177b392 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -115,6 +115,7 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 	for (i = route->tuple[dir].in.num_encaps - 1; i >= 0; i--) {
 		flow_tuple->encap[j].id = route->tuple[dir].in.encap[i].id;
 		flow_tuple->encap[j].proto = route->tuple[dir].in.encap[i].proto;
+		flow_tuple->encap_ifidx[j] = route->tuple[dir].in.encap[i].ifindex;
 		if (route->tuple[dir].in.ingress_vlans & BIT(i))
 			flow_tuple->in_vlan_ingress |= BIT(j);
 		j++;
@@ -123,6 +124,7 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 	flow_tuple->tun = route->tuple[dir].in.tun;
 	flow_tuple->encap_num = route->tuple[dir].in.num_encaps;
 	flow_tuple->tun_num = route->tuple[dir].in.num_tuns;
+	flow_tuple->bridge_ifidx = route->tuple[dir].in.bridge_ifindex;
 
 	switch (route->tuple[dir].xmit_type) {
 	case FLOW_OFFLOAD_XMIT_DIRECT:
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 6bb9579dcc2ab..c5817cb96a9f6 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -79,8 +79,10 @@ struct nft_forward_info {
 	struct id {
 		__u16	id;
 		__be16	proto;
+		int	ifindex;
 	} encap[NF_FLOW_TABLE_ENCAP_MAX];
 	u8 num_encaps;
+	int bridge_ifindex;
 	struct flow_offload_tunnel tun;
 	u8 num_tuns;
 	u8 ingress_vlans;
@@ -136,12 +138,15 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 					path->encap.id;
 				info->encap[info->num_encaps].proto =
 					path->encap.proto;
+				info->encap[info->num_encaps].ifindex =
+					path->dev->ifindex;
 				info->num_encaps++;
 			}
 			if (path->type == DEV_PATH_PPPOE)
 				memcpy(info->h_dest, path->encap.h_dest, ETH_ALEN);
 			break;
 		case DEV_PATH_BRIDGE:
+			info->bridge_ifindex = path->dev->ifindex;
 			if (is_zero_ether_addr(info->h_source))
 				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
 
@@ -156,6 +161,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				}
 				info->encap[info->num_encaps].id = path->bridge.vlan_id;
 				info->encap[info->num_encaps].proto = path->bridge.vlan_proto;
+				info->encap[info->num_encaps].ifindex = path->dev->ifindex;
 				info->num_encaps++;
 				break;
 			case DEV_PATH_BR_VLAN_UNTAG:
@@ -261,6 +267,7 @@ static void nft_dev_forward_path(const struct nft_pktinfo *pkt,
 	for (i = 0; i < info.num_encaps; i++) {
 		route->tuple[!dir].in.encap[i].id = info.encap[i].id;
 		route->tuple[!dir].in.encap[i].proto = info.encap[i].proto;
+		route->tuple[!dir].in.encap[i].ifindex = info.encap[i].ifindex;
 	}
 
 	if (info.num_tuns &&
@@ -273,6 +280,7 @@ static void nft_dev_forward_path(const struct nft_pktinfo *pkt,
 
 	route->tuple[!dir].in.num_encaps = info.num_encaps;
 	route->tuple[!dir].in.ingress_vlans = info.ingress_vlans;
+	route->tuple[!dir].in.bridge_ifindex = info.bridge_ifindex;
 
 	if (info.xmit_type == FLOW_OFFLOAD_XMIT_DIRECT) {
 		memcpy(route->tuple[dir].out.h_source, info.h_source, ETH_ALEN);
-- 
2.53.0

