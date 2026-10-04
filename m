Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C420DCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5uUcI1/RkV6pA20Ka1TbaV7lMFxccYVTKU3RyjDpPg=; b=oC8s17DKK8jHEjz4KgwnTukrCo
	Pgpx2OTtyRVor0kvxylnVha2vmoILbsTNh2gFGRUjmNTKHGWiKCOauhSB6nkCqZy2/hqXRTlWBxwo
	85hcFb3QuZzEQgv2Sx7gxqChPzN33EnNMlr9mkpvIA59/kkQIUh+fOG83oGvz7XGPHETgSEgToz9s
	oXmo9G8Y6tDu4s8cyIL14o/smmLlFEC1+8JBzCSwiWbAc+16DvkH9pLkOLoss4kkXMqiCKSQMlVfD
	juuhtXdzEVUCiTQNrcpeZERA4W3XqqpIFRzqnV/vVUXtQWT3IqY2XYH7SEk4PP9iLiISuREpcCbkM
	jou8UFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpS-0000000F5mx-0BHK;
	Sun, 04 Oct 2026 17:16:50 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpL-0000000F5fG-38IQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 17:16:45 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6af7d408b51so716652a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134202; x=1791739002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5uUcI1/RkV6pA20Ka1TbaV7lMFxccYVTKU3RyjDpPg=;
        b=yGMhF/gYyNho5yXSTFjAjtg/11MybZblNkFmA+VERLwIHjYk55NRNL6qqgApLgxCUA
         qYStuCWzGMzJyHG3yPo+7jtMI13hCVsYHyimTuK6Clasr7N5FITlLyVyX7xJQ9iS5lXe
         ilLo9Iga2x6DiydQ0ipcFgNPeFhIjWRrKPZ914Zz4CFnsSvcGrvn7FB93rjpvsyha2Ql
         5PTw3h6iKmpO7r9gigYZoJba8nsn4erxSQeJimh/gSBYuFnpXt/h/4zVWUnc14CwotQW
         KNZJ8eWgVFz0vDX6L/4y7eybVLu3TyOePSTQZv4Lf2TOwGSvF29v+5q1gWt9mRYO6hBc
         +CLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134202; x=1791739002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5uUcI1/RkV6pA20Ka1TbaV7lMFxccYVTKU3RyjDpPg=;
        b=thn0N7eBLNjCf36binXs/d/IAFnTeaU6YopitU8C3Rr9Z144TmlBrimj06tNqsbNdO
         oSvz8ATjesytaZVO3T5AMNwDZ3ALnD6+xYDZIldAKWR5U1Cg8tZ4paYFgU7wkoELK8rB
         7zhhBoWOXROW5K5LcP3OeOGtOb4dZqzQeRUTeKXr0+FQ/JodwK/swCNRRCKBzvs0xvCN
         zICRFqPVWP6GBFST/ukbcdkODKg68m14Tq7peGncJumLMBX1BEG82JDUPZ2i4hEZS67w
         JABx8yyoYxSE47ZguynB4aqi+vKkmU5eFaIAyAN//2yWnq9UqUmevXdXtd7DLCIc8F85
         uPqw==
X-Forwarded-Encrypted: i=1; AKwUvBype+TjMldwb9xpFFj4qK2+OnZVPcCX2bXl3owgnABQJa2WPhzC2zEU1qpztuqfinJKfm9dGMFsCvOkK6pmj0s4@lists.infradead.org
X-Gm-Message-State: AFq9FYLAHjqZ9Njh1gIfdWpKtXh8un/kn1I5oP52XcmOWDeUSlgI+H+E
	9O/5xJlzquVzOmVZ/qqULJzDd1Q3R3d9ntrbFipV9MIxWPdMwIBEVofV8yDIIpCz3Q==
X-Gm-Gg: AYBFou0bQjV0IX2X0AqRYjGOCK1q+zj0Y3A45YzplbOwAoURymx65FJaOXyl/ZdfO1V
	VAWKAHXtxCF7K49CbXt7wmg6adkndxWwsD2+kHew5mIEKfrDQ2bHRIjhKYg8KBYl7Y00gYCdlUx
	ijo8xeLub6oa28G5qA7+g1mdX7hS5zwla310DnEfX9OznSPk/CpY3Hv4niVKr9GHvZHEAzig3zs
	zc582kuUi47Ry5rjAeYNA/Ymbobi5RGdPXDnYWJ3zOcwt5FdevfjJuA6Zq4ZY4SHZ4UfepE9TIC
	rC6gpUMmnH6Kl1hIcGf5HflYrHmpaUZ32gyyc58uv1BYjGM3UnFROeDA6naZTviSM5s8p9sKnP7
	iLFKQcsONFc9ZvlKlnFr0Zjp8VlOIyfSlFGY+jDvB+bFTKoAWb0q02noedOrjsFOegMvn4G0Knw
	Yf3iO/McoUGsOUBesDHAsnZWtnu0La1x/J9Hrk7zL42iHdDIGnXy2/XuaLSd5STlv9VjEWGaeWF
	bd3uDibELKNEY8QqKd+WyG6Nq7fm5snTyZ9t8eOkyMsmDDDNiL7hlOu1ritZngQuQk7krRH8SlQ
	EqckWLyWFPZCreC5t5LF6HyeOyXLLJ3YlneHJUsmfnShsTHnoglFUmlrTXUn5MCCTqKZLldVa1Z
	eTGeTffVy3IWkdOHRk0fNA9accf9+La5xjNBUlGzg97wQU/bsvYMn45Kw2fiomQSb0VjuOLtsaW
	J3hn+RIHYICIa/nrgP7c6sZPBvL74bNOrxlg==
X-Received: by 2002:a05:6402:27c9:b0:6aa:e251:ecb4 with SMTP id 4fb4d7f45d1cf-6af9e0468eamr6985282a12.2.1791134202135;
        Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:40 -0700 (PDT)
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
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun,  4 Oct 2026 19:16:35 +0200
Message-ID: <20261004171636.3545085-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171636.3545085-1-julius@bairaktaris.de>
References: <20261004171636.3545085-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101643_828684_771DF3C6 
X-CRM114-Status: GOOD (  20.41  )
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

Packets forwarded by the flowtable skip the ruleset, so a priority set
by "meta priority set" before "flow add" only applies to the first
packets of a connection, and drivers never see it.

Store skb->priority of the packet that creates the flow, apply it in
the software fast path and emit it as FLOW_ACTION_PRIORITY, the action
act_skbedit uses. Flows without a priority are unchanged. On IPv4,
ip_forward() derives a priority from the TOS by default, so a flow can
carry one without a rule. The priority applies to both directions.

airoha uses it as the QoS queue of flows that leave through a GDM port,
as its software path does, mtk ignores it like FLOW_ACTION_CSUM, and
mlx5 ignores it on flowtable flows (previous patch). airoha and mtk
parse tc flower rules in the same function, so they now also accept
skbedit priority there.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 Documentation/networking/nf_flowtable.rst       |  4 +++-
 drivers/net/ethernet/airoha/airoha_ppe.c        |  3 +++
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
 include/net/netfilter/nf_flow_table.h           |  1 +
 net/netfilter/nf_flow_table_ip.c                |  6 ++++++
 net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
 net/netfilter/nft_flow_offload.c                |  2 ++
 7 files changed, 27 insertions(+), 1 deletion(-)

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
index 92611802801e..e790305ea955 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1161,6 +1161,9 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
+			priority = act->priority;
+			break;
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
index 32b4281038dd..c8eaf7bc356d 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,8 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
+	flow->priority = pkt->skb->priority;
+
 	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
 	ret = flow_offload_add(flowtable, flow);
 	if (ret < 0)
-- 
2.53.0


