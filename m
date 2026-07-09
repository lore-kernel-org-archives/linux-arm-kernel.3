Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241D6C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N+zQCH0A9q9dzH/bvqLvSAQ5/Ea/cC6su+kc1dzM5I=; b=ikKjtrFmWo8VxqZmBMq4Xv+S3y
	fmRXSjUkhysDZ+0wSFbq6eF85CiWVmF6KrIaSwkZp8pAA9xTCLC5p6fx8AewaIOlaNJZr+INggIfp
	qpErK7WkJHjmVs6H21k4f1XKrtWOrGtxDl/eY/kUIIU7xkkaYkeS/mGiouENw0NQqMA6BZdUuf4Sm
	m/6h1dfQ7okmMCIqqh26fnptnkkyt9Zz+OlEitTkTHpgQQ/m4vXvOPV8DIGNRdp4bGv4jbVyb7RPH
	57KIrFkie29/1Vr+AMs4U3wXvGJEsecPseYllxqXUinGI8Y6qQ1hDylUtlDbnTnEXfuIWhJAC0dBh
	GzT9n8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWo-00000001eQv-3wcz;
	Thu, 09 Jul 2026 08:54:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkUk-00000001aSM-3Ag8;
	Thu, 09 Jul 2026 08:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36D8861373;
	Thu,  9 Jul 2026 08:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679181F000E9;
	Thu,  9 Jul 2026 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587153;
	bh=1N+zQCH0A9q9dzH/bvqLvSAQ5/Ea/cC6su+kc1dzM5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=odcsK8za/ih1OmRM+AmRkDjRYOHmiEcpy5+sqrxy5LwngXJ5ggPfmTAAKMNt3/pss
	 3Y4wexQEeOIeIwEGbnYBV+Z9QovHvH5OWrbxRnL9FZC1WcYGFKbwjE2Y7ssq+40lg9
	 +kpAQSdp02dQR02vodsm7mJptytYnzZEN5sieorwwD76fPhwWt61lnPrq+rf7gQap6
	 e7GHkyyiMtv8OURxKC//sj832tWHwJkBSAonydL5mFXbydOPD5K9Y6ZshsaY4KIsVL
	 MZHTfhcks7meHBu6hfoHMvCAvecklurosssR+p8eYdG91ad5BCCNqy1LJX4oOY0vyG
	 cDx86qCNoFLjQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 09 Jul 2026 10:52:08 +0200
Subject: [PATCH nf-next v5 1/6] net: netfilter: add ether_type to
 net_device_path_ctx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-b4-flowtable-sw-accel-ip6ip-v5-1-828ceaf85bab@kernel.org>
References: <20260709-b4-flowtable-sw-accel-ip6ip-v5-0-828ceaf85bab@kernel.org>
In-Reply-To: <20260709-b4-flowtable-sw-accel-ip6ip-v5-0-828ceaf85bab@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Shuah Khan <shuah@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.14.3
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

Add an ether_type field to struct net_device_path_ctx to allow IPv6
tunnel drivers to select the appropriate L3 protocol based on the
encapsulated traffic.
Update the airoha and mtk Ethernet drivers to use the new
dev_fill_forward_path() signature.
This is a preliminary patch to enable sw flowtable acceleration for
IPv4 over IPv6 tunnels.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c        | 13 ++++++++-----
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 13 ++++++++-----
 include/linux/netdevice.h                       |  4 +++-
 net/core/dev.c                                  |  6 ++++--
 net/ipv6/ip6_tunnel.c                           |  5 ++++-
 net/netfilter/nf_flow_table_path.c              |  8 +++++---
 6 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index e7c78293002a..06d128c67c8c 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -276,7 +276,8 @@ static int airoha_ppe_flow_mangle_ipv4(const struct flow_action_entry *act,
 	return 0;
 }
 
-static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
+static int airoha_ppe_get_wdma_info(struct net_device *dev,
+				    const u8 *addr, __be16 ether_type,
 				    struct airoha_wdma_info *info)
 {
 	struct net_device_path_stack stack;
@@ -287,7 +288,7 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 		return -ENODEV;
 
 	rcu_read_lock();
-	err = dev_fill_forward_path(dev, addr, &stack);
+	err = dev_fill_forward_path(dev, addr, ether_type, &stack);
 	rcu_read_unlock();
 	if (err)
 		return err;
@@ -331,7 +332,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 					struct airoha_foe_entry *hwe,
 					struct net_device *netdev, int type,
 					struct airoha_flow_data *data,
-					int l4proto)
+					__be16 ether_type, int l4proto)
 {
 	u32 qdata = FIELD_PREP(AIROHA_FOE_SHAPER_ID, 0x7f), ports_pad, val;
 	int wlan_etype = -EINVAL, dsa_port = airoha_get_dsa_port(&netdev);
@@ -354,7 +355,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 		struct airoha_wdma_info info = {};
 
 		if (!airoha_ppe_get_wdma_info(netdev, data->eth.h_dest,
-					      &info)) {
+					      ether_type, &info)) {
 			val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ, info.idx) |
 			       FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT,
 					  FE_PSE_PORT_CDM4);
@@ -1081,6 +1082,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 	struct flow_action_entry *act;
 	struct airoha_foe_entry hwe;
 	int err, i, offload_type;
+	__be16 ether_type = 0;
 	u16 addr_type = 0;
 	u8 l4proto = 0;
 
@@ -1107,6 +1109,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		struct flow_match_basic match;
 
 		flow_rule_match_basic(rule, &match);
+		ether_type = match.key->n_proto;
 		l4proto = match.key->ip_proto;
 	} else {
 		return -EOPNOTSUPP;
@@ -1177,7 +1180,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		return -EINVAL;
 
 	err = airoha_ppe_foe_entry_prepare(eth, &hwe, odev, offload_type,
-					   &data, l4proto);
+					   &data, ether_type, l4proto);
 	if (err)
 		return err;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index cc8c4ef8038f..2601c17b29c8 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -89,7 +89,8 @@ mtk_flow_offload_mangle_eth(const struct flow_action_entry *act, void *eth)
 }
 
 static int
-mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_info *info)
+mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr,
+		       __be16 ether_type, struct mtk_wdma_info *info)
 {
 	struct net_device_path_stack stack;
 	struct net_device_path *path;
@@ -102,7 +103,7 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
 		return -1;
 
 	rcu_read_lock();
-	err = dev_fill_forward_path(dev, addr, &stack);
+	err = dev_fill_forward_path(dev, addr, ether_type, &stack);
 	rcu_read_unlock();
 	if (err)
 		return err;
@@ -190,12 +191,12 @@ mtk_flow_get_dsa_port(struct net_device **dev)
 static int
 mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
 			   struct net_device *dev, const u8 *dest_mac,
-			   int *wed_index)
+			   __be16 ether_type, int *wed_index)
 {
 	struct mtk_wdma_info info = {};
 	int pse_port, dsa_port, queue;
 
-	if (mtk_flow_get_wdma_info(dev, dest_mac, &info) == 0) {
+	if (mtk_flow_get_wdma_info(dev, dest_mac, ether_type, &info) == 0) {
 		mtk_foe_entry_set_wdma(eth, foe, info.wdma_idx, info.queue,
 				       info.bss, info.wcid, info.amsdu);
 		if (mtk_is_netsys_v2_or_greater(eth)) {
@@ -273,6 +274,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 	struct mtk_flow_data data = {};
 	struct mtk_foe_entry foe;
 	struct mtk_flow_entry *entry;
+	__be16 ether_type = 0;
 	int offload_type = 0;
 	int wed_index = -1;
 	u16 addr_type = 0;
@@ -319,6 +321,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		struct flow_match_basic match;
 
 		flow_rule_match_basic(rule, &match);
+		ether_type = match.key->n_proto;
 		l4proto = match.key->ip_proto;
 	} else {
 		return -EOPNOTSUPP;
@@ -481,7 +484,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		mtk_foe_entry_set_pppoe(eth, &foe, data.pppoe.sid);
 
 	err = mtk_flow_set_output_device(eth, &foe, odev, data.eth.h_dest,
-					 &wed_index);
+					 ether_type, &wed_index);
 	if (err)
 		return err;
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9981d637f8b5..a97aee0e49b2 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -938,6 +938,7 @@ struct net_device_path_stack {
 struct net_device_path_ctx {
 	const struct net_device *dev;
 	u8			daddr[ETH_ALEN];
+	__be16			ether_type;
 
 	int			num_vlans;
 	struct {
@@ -3420,7 +3421,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+int dev_fill_forward_path(const struct net_device *dev,
+			  const u8 *daddr, __be16 ether_type,
 			  struct net_device_path_stack *stack);
 struct net_device *dev_get_by_name(struct net *net, const char *name);
 struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
diff --git a/net/core/dev.c b/net/core/dev.c
index 714d05283500..b0e2de0e95f8 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -750,12 +750,14 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+int dev_fill_forward_path(const struct net_device *dev,
+			  const u8 *daddr, __be16 ether_type,
 			  struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
 	struct net_device_path_ctx ctx = {
-		.dev	= dev,
+		.dev		= dev,
+		.ether_type	= ether_type,
 	};
 	struct net_device_path *path;
 	int ret = 0;
diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index bf8e40af60b0..38da07101601 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1863,7 +1863,10 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 		path->type = DEV_PATH_TUN;
 		path->tun.src_v6 = t->parms.laddr;
 		path->tun.dst_v6 = t->parms.raddr;
-		path->tun.l3_proto = IPPROTO_IPV6;
+		if (ctx->ether_type == cpu_to_be16(ETH_P_IP))
+			path->tun.l3_proto = IPPROTO_IPIP;
+		else
+			path->tun.l3_proto = IPPROTO_IPV6;
 		path->dev = ctx->dev;
 		ctx->dev = dst->dev;
 	}
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 98c03b487f52..c8011ec36532 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -45,7 +45,8 @@ static bool nft_is_valid_ether_device(const struct net_device *dev)
 static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 				     const struct dst_entry *dst_cache,
 				     const struct nf_conn *ct,
-				     enum ip_conntrack_dir dir, u8 *ha,
+				     enum ip_conntrack_dir dir,
+				     u8 *ha, __be16 ether_type,
 				     struct net_device_path_stack *stack)
 {
 	const void *daddr = &ct->tuplehash[!dir].tuple.src.u3;
@@ -72,7 +73,7 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		return -1;
 
 out:
-	return dev_fill_forward_path(dev, ha, stack);
+	return dev_fill_forward_path(dev, ha, ether_type, stack);
 }
 
 struct nft_forward_info {
@@ -255,7 +256,8 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 	unsigned char ha[ETH_ALEN];
 	int i;
 
-	if (nft_dev_fill_forward_path(route, dst, ct, dir, ha, &stack) < 0 ||
+	if (nft_dev_fill_forward_path(route, dst, ct, dir, ha, pkt->ethertype,
+				      &stack) < 0 ||
 	    nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
 		return -ENOENT;
 

-- 
2.55.0


