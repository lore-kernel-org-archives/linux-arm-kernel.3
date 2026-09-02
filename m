Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88213C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rYT1wpgmmF4A2seGhMcChmpltzwukxsYVo40VLDCkr4=; b=ZP4qsleFZnLDLdE7dnHVlicisP
	fFjfq1NYuToqj8DL7SDMmTl+9u1rd7k3N0VECfOBOPGFofqQhxzQ/wTP8AHlOYANFGyxuPunU3SEn
	3lpFGrng6X8UJjlbuGrX8ROV3BmZqpGNAtCn0+fnTEwCRJGUf8eX9SGRtZ+Al3ucbdfeLT0QGVB+M
	SETS6PCxwgsXSl6zfmb9cCRNmgLOSh3iqRjajHHii08yAqf6rJkP09JMKHyn5QDxa5I1BFy5a0cyl
	0p4DuaggARRBP7DXCSorMUmsEq2ah1UQy/2ISESymJK4sDfhc3QwATcPQUsy2IEEGIRY2EaZhhAAp
	zdGhJVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nFx-0000000F98z-442L;
	Wed, 02 Sep 2026 15:52:09 +0000
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nFu-0000000F97K-1RQN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:52:08 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c254113e9beso36365966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788364324; x=1788969124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYT1wpgmmF4A2seGhMcChmpltzwukxsYVo40VLDCkr4=;
        b=M1zJuMMqLqpjeaB9eAyxyCnsBCbMan5/vLOhUJA1vqgw4ne6aj9NE1iRA1UDRWU7Am
         Fdg9ANYQcy6WiDbLuvd9bb6aCAr5Bas5e9sbIxNEfb2IH7duEUME8Vxyv85/5B4I6Aw9
         mKmInP/5FXUmtevNKQcNOw1HeNOk2KHoqEwrlSSaYYFfr82SnKGIiKYK2MrO1ylarNFY
         Cy85ZAbKpzlHHni9STsk17Hd9F3eIt4s12U5C4OT4tlDmy08fdkZn+Im8QcFiARqHMbl
         lZ8XwSscvuxvUnv5jLrYXa2y1T1JhYb8a2WfEyvVukujjt3krdYthEagCJwfqT183Cjl
         OyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364324; x=1788969124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYT1wpgmmF4A2seGhMcChmpltzwukxsYVo40VLDCkr4=;
        b=lcemS7tDl9Z+IoInzkn7FE9P2qKXvrOiDNQYP7yiqXC0GvvZMNcL79IAnokA/q/dT/
         JoMMbU4BCTFfBmPKYPj1aeKA3h/eYKKFuh5WQ1qS+wK3NPKC32W/sPmTwZUt8mR4A4sP
         bNPdKDJ4T9WIT0YbUPMd0ugnP9v+4wX2gYCdh5OTW/lkmFyNMQC15o1QEVA+FmTPxi5Y
         reP4O15UnvHU4meOnqzWIuQQtVnFYW6d4UnobyPNyI9pbC0Q2YOkKNANAx+TfK4cW3dc
         bq2y5p7fmTiLW4Xk/DJFRJ6s+fYWKrsH7dI8vLRAi8I+SusiHhdT8cYy4SC+tOAKmbPq
         rP7g==
X-Forwarded-Encrypted: i=1; AKwUvByNFbREdP1TgCUfDMGbuALFaY2LpfxwBKI7kqDtXSFHRp7D0vk4YGwQ1K4G57euap1ImlXGuj6XYhcka7ghVCZ6@lists.infradead.org
X-Gm-Message-State: AFuF++kLEfDu+P9LMgZebBOhkAYGG1DfTHlU07yOnPGDI79cU6m7VbLc
	V2BeCBLKk2DjhlNxPAm81oOiA1biXxtfF5v1AbHq6xipEV1plsmCfMSIuTDaaeRNhg==
X-Gm-Gg: AYBFou1jw7k/90ngnxH6e5wk9mOkesSBJ4L7FcD4AUON3siZymo3Nqtg9jE/VqOozNR
	6e66MTzWxEqAGAgoDGMpVVRenwSiNpEG8uajahfOx/Qxz2rH0Ee4g3xx4J+3PL1epDKvvAqgINz
	CUt0mvMuH0U05VF0+UQQtBdqiTh99tcICoOy4ZurtwC8Bpo3R4Dz6bR4kut3yrLYSaabihvSAnc
	cXa2aoIGlasQkatRfjzLIaAkbgtMKlaf5CHwH18J+su6mUANbskzgMjfP/3BSlEgaj+6NEQT3jM
	l388/elNZVCfTxylufXZHqqcSkTCf5OhQXYQBwKI0+5pFNz5/r1CbOfuLAEBHLXHMHoV0R9NBim
	XkKM9whPVRsZVSikcnUvpm6rvNHMDkyb/rBkgs8AYcnPjgHvq/T/xrQEkwG4M3J8VxSXPRdzboI
	8H7ufUk7IxCfwKgG1JSN86L2Gsc4df8LeahSnJuNSQBA4SiO6REox0oimusJ3BNA3Js1uCKkHxy
	HIc33o7oMoHPh41tlmCgfkkeKNrqp9Pb5mlggOg7z/9kyw0HZW85ECnAyb1UWugb0eocWe2HcCd
	9PyZQ5mZ29PjLmzgFbtazEu7YcKK2Lz8SujsuvvxqpwPpZkL89D/1CNZqmIbSyawuHJE7GF1gEj
	hpx6X7RBlBaDaBs+hEAlU5vAD8YS6OLstsWYMgjwoazn/tSmIPFtFWxvk48Eei9Y7ke4BEtrIEY
	TCmUieH4TxdGQ=
X-Received: by 2002:a17:907:3f88:b0:c21:450d:cd7e with SMTP id a640c23a62f3a-c25d53be168mr376567466b.9.1788364323750;
        Wed, 02 Sep 2026 08:52:03 -0700 (PDT)
Received: from Desktop (pd9513d53.dip0.t-ipconnect.de. [217.81.61.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03fbb75sm160187366b.49.2026.09.02.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:52:03 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v2 1/2] netfilter: flowtable: carry a priority into the offload
Date: Wed,  2 Sep 2026 17:51:35 +0200
Message-ID: <20260902155136.4963-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_085206_437963_B282E314 
X-CRM114-Status: GOOD (  26.66  )
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

The packets the flowtable forwards bypass the rules that classified
the connection, so a priority set by "meta priority set" ahead of
"flow add" reaches the qdisc only on the packets that traversed the
ruleset before the flow existed; the rest keep the priority they
arrived with, which for a forwarded packet is normally none. A flow
rule handed to a driver has the same gap: it describes NAT,
encapsulation and the output device, but not how the flow should be
treated on the way out, so hardware with priority queues can only
fall back on the DSCP the packet carries.

Store skb->priority of the packet that created the flow. The software
fast path applies it to the packets it forwards; the hardware path
emits it as FLOW_ACTION_PRIORITY, the action act_skbedit already
emits on the tc path, so the rule handed to the driver describes what
the software path does. A flow without a priority emits no action and
leaves skb->priority of the packets it forwards alone.

Of the in-tree consumers of these rules, mtk and airoha ignore the new
action as they do FLOW_ACTION_CSUM. mlx5 has no parser for it and
rejects the rule, so a flow with a priority stays on the software path
there, as a flow with PPPoE encapsulation already does.

The flowtable holds one flow for both directions and the expression
runs once, so the priority applies to both; per-direction
classification is not carried.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2:
- apply the priority on the software fast path as well, in the IPv4
  and IPv6 flowtable hooks, so a flow forwarded in software and one
  forwarded by hardware get the same treatment (Lorenzo Bianconi)
- describe it in nf_flowtable.rst
- add the selftest in 2/2

v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-julius@bairaktaris.de/

The consumer of the emitted action is a DSA driver for the IPQ8074 PPE,
maintained in OpenWrt; measured there, "meta priority set" ahead of
"flow add" places hardware-offloaded flows in the port's priority
queues, and with hardware offload disabled a 30 MB IPv4 and a 30 MB
IPv6 transfer both land in the stamped priority band with only the
handshake traversing the ruleset. The selftest in 2/2 passes on this
series and fails on the base commit, x86_64 under QEMU, three runs
each. The mtk and airoha hunks are compile-tested only. The new field
grows struct flow_offload by eight bytes on 64-bit; the entry allocates
from its own kmem_cache, so no allocation-class change.

 Documentation/networking/nf_flowtable.rst       |  4 +++-
 drivers/net/ethernet/airoha/airoha_ppe.c        |  1 +
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
 include/net/netfilter/nf_flow_table.h           |  1 +
 net/netfilter/nf_flow_table_ip.c                |  6 ++++++
 net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
 net/netfilter/nft_flow_offload.c                |  5 +++++
 7 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/nf_flowtable.rst b/Documentation/networking/nf_flowtable.rst
index d757c21c10f2..5844ab19aec6 100644
--- a/Documentation/networking/nf_flowtable.rst
+++ b/Documentation/networking/nf_flowtable.rst
@@ -71,7 +71,9 @@ forwarding path including the Netfilter hooks and the flowtable fastpath bypass.
 
 The flowtable entry also stores the NAT configuration, so all packets are
 mangled according to the NAT policy that is specified from the classic IP
-forwarding path. The TTL is decremented before calling neigh_xmit(). Fragmented
+forwarding path. The TTL is decremented before calling neigh_xmit(). The flow
+also stores the priority of the packet that created it, so a priority set before
+``flow add`` applies to the packets that the flowtable forwards. Fragmented
 traffic is passed up to follow the classic IP forwarding path given that the
 transport header is missing, in this case, flowtable lookups are not possible.
 TCP RST and FIN packets are also passed up to the classic IP forwarding path to
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 92611802801e..2afce76ad131 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1161,6 +1161,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 99b28aaa7cc4..4ee99e8e4a34 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index f2e2771f188f..23218c8cbc3d 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -202,6 +202,7 @@ struct flow_offload {
 	unsigned long				flags;
 	u16					type;
 	u32					timeout;
+	u32					priority;
 	struct rcu_head				rcu_head;
 };
 
diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index c8c29a9a1684..c85e2d608c32 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -509,6 +509,9 @@ static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 	ip_decrease_ttl(iph);
 	skb_clear_tstamp(skb);
 
+	if (flow->priority)
+		skb->priority = flow->priority;
+
 	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
 		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
 
@@ -1104,6 +1107,9 @@ static int nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
 	ip6h->hop_limit--;
 	skb_clear_tstamp(skb);
 
+	if (flow->priority)
+		skb->priority = flow->priority;
+
 	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
 		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
 
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 801a3dd9ceea..caaadffc2563 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	    flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
 		return -1;
 
+	if (flow->priority) {
+		struct flow_action_entry *entry;
+
+		entry = flow_action_entry_next(flow_rule);
+		if (!entry)
+			return -1;
+
+		entry->id = FLOW_ACTION_PRIORITY;
+		entry->priority = flow->priority;
+	}
+
 	tuple = &flow->tuplehash[dir].tuple;
 
 	for (i = 0; i < tuple->encap_num; i++) {
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 32b4281038dd..ca91924b4de3 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,11 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
+	/* The packets the flow forwards in its place bypass the rules that
+	 * classified this one; carry the result with the flow.
+	 */
+	flow->priority = pkt->skb->priority;
+
 	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
 	ret = flow_offload_add(flowtable, flow);
 	if (ret < 0)

base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
-- 
2.53.0


