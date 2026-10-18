Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1436CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 01:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNo5LH0uBFrA7ZF5X9xdA2VKlNHbadCcy4TU1bSUOvI=; b=VEb4dJQvpwNtgEb8CN5fky026j
	08eeKrHZhWOP1WGjT1X4pp+2iINHe2FvZ+ZoiF6d+F3zyUU67cXSI3sBebMqSQVxJ9Tjx6mvtHCCq
	hWCxOBreETHq3zPJBVhCOIlx+uBAYhtfnhptZk5SgiijbJjIcBscqBcdYafe0vXEkoDbRfmFjauiB
	dA7EgbNf7IaqId1j3W2yxKL9D1vQMJlvDw4vEDyK2IIMONDI90kK3iv40Fr+qilofYvViIvTiDFRQ
	gwpvzG2sZme9Z1xDNS1wwA6hoFC90nqhYSskkH7INMaE1MVTYeYtIPNn5nthPP26YKWA8ts7RR3bY
	5yBtpXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIFwL-00000005Q10-1XRr;
	Sun, 18 Oct 2026 01:43:57 +0000
Received: from mail.netfilter.org ([217.70.190.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIFwI-00000005Q0M-3gZy;
	Sun, 18 Oct 2026 01:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1792287829;
	bh=rNo5LH0uBFrA7ZF5X9xdA2VKlNHbadCcy4TU1bSUOvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaoTNkQ/PbXZuga6nX22i2LG5XBhzK1NT4WnG7HIyBcd2RIhLfMC+3xyhpZ4g1ZJo
	 DeJklXnQDnCGUyEKBDgEiKt6BaNtlG5NuiM806zoHPxhlAdxjjQjLKy24yXUIAryZm
	 Zlq5eVBAC2iSPjJiA9B1LAJX0iCEq09bifeQtDampd5SBU3ALZ+dhxIK9wJWzRA6ia
	 /i/BAwKQFzy5axGyWyiUTlT/5TznsDIwHC+DnFGT5tlv5hyMTeYUx6sP8DGxEvJ6p7
	 p1+QrINKbm3EwVyWA4WuuWq3xtwzVon2cmh92G293tKXr1I6/CAPFpUaJfXPxip8oc
	 b9yMNQy/kuA5Q==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 38B656005B;
	Sun, 18 Oct 2026 03:43:49 +0200 (CEST)
Date: Sun, 18 Oct 2026 03:43:46 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: fw@strlen.de, phil@nwl.cc, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org, lorenzo@kernel.org,
	nbd@nbd.name, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
	rdunlap@infradead.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com,
	leon@kernel.org, tariqt@nvidia.com, mbloch@nvidia.com,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority
 into the offload
Message-ID: <atQkUoH3aa-J5-vf@chamomile>
References: <20261004171636.3545085-1-julius@bairaktaris.de>
 <20261004171636.3545085-3-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004171636.3545085-3-julius@bairaktaris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_184355_059309_A6B043C7 
X-CRM114-Status: GOOD (  28.46  )
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

On Sun, Oct 04, 2026 at 07:16:35PM +0200, Julius Bairaktaris wrote:
> Packets forwarded by the flowtable skip the ruleset, so a priority set
> by "meta priority set" before "flow add" only applies to the first
> packets of a connection, and drivers never see it.
> 
> Store skb->priority of the packet that creates the flow, apply it in
> the software fast path and emit it as FLOW_ACTION_PRIORITY, the action
> act_skbedit uses. Flows without a priority are unchanged. On IPv4,
> ip_forward() derives a priority from the TOS by default, so a flow can
> carry one without a rule. The priority applies to both directions.
> 
> airoha uses it as the QoS queue of flows that leave through a GDM port,
> as its software path does, mtk ignores it like FLOW_ACTION_CSUM, and
> mlx5 ignores it on flowtable flows (previous patch). airoha and mtk
> parse tc flower rules in the same function, so they now also accept
> skbedit priority there.

I think we already mentioned this only works for hardware, this is a
no-go.

> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  Documentation/networking/nf_flowtable.rst       |  4 +++-
>  drivers/net/ethernet/airoha/airoha_ppe.c        |  3 +++
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
>  include/net/netfilter/nf_flow_table.h           |  1 +
>  net/netfilter/nf_flow_table_ip.c                |  6 ++++++
>  net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
>  net/netfilter/nft_flow_offload.c                |  2 ++
>  7 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/nf_flowtable.rst b/Documentation/networking/nf_flowtable.rst
> index d757c21c10f2..5844ab19aec6 100644
> --- a/Documentation/networking/nf_flowtable.rst
> +++ b/Documentation/networking/nf_flowtable.rst
> @@ -71,7 +71,9 @@ forwarding path including the Netfilter hooks and the flowtable fastpath bypass.
>  
>  The flowtable entry also stores the NAT configuration, so all packets are
>  mangled according to the NAT policy that is specified from the classic IP
> -forwarding path. The TTL is decremented before calling neigh_xmit(). Fragmented
> +forwarding path. The TTL is decremented before calling neigh_xmit(). The flow
> +also stores the priority of the packet that created it, so a priority set before
> +``flow add`` applies to the packets that the flowtable forwards. Fragmented
>  traffic is passed up to follow the classic IP forwarding path given that the
>  transport header is missing, in this case, flowtable lookups are not possible.
>  TCP RST and FIN packets are also passed up to the classic IP forwarding path to
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> index 92611802801e..e790305ea955 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -1161,6 +1161,9 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
>  		case FLOW_ACTION_REDIRECT:
>  			odev = act->dev;
>  			break;
> +		case FLOW_ACTION_PRIORITY:
> +			priority = act->priority;
> +			break;
>  		case FLOW_ACTION_CSUM:
>  			break;
>  		case FLOW_ACTION_VLAN_PUSH:
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index 99b28aaa7cc4..4ee99e8e4a34 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
>  		case FLOW_ACTION_REDIRECT:
>  			odev = act->dev;
>  			break;
> +		case FLOW_ACTION_PRIORITY:
>  		case FLOW_ACTION_CSUM:
>  			break;
>  		case FLOW_ACTION_VLAN_PUSH:
> diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
> index f2e2771f188f..23218c8cbc3d 100644
> --- a/include/net/netfilter/nf_flow_table.h
> +++ b/include/net/netfilter/nf_flow_table.h
> @@ -202,6 +202,7 @@ struct flow_offload {
>  	unsigned long				flags;
>  	u16					type;
>  	u32					timeout;
> +	u32					priority;
>  	struct rcu_head				rcu_head;
>  };
>  
> diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
> index c8c29a9a1684..c85e2d608c32 100644
> --- a/net/netfilter/nf_flow_table_ip.c
> +++ b/net/netfilter/nf_flow_table_ip.c
> @@ -509,6 +509,9 @@ static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
>  	ip_decrease_ttl(iph);
>  	skb_clear_tstamp(skb);
>  
> +	if (flow->priority)
> +		skb->priority = flow->priority;
> +
>  	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
>  		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
>  
> @@ -1104,6 +1107,9 @@ static int nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
>  	ip6h->hop_limit--;
>  	skb_clear_tstamp(skb);
>  
> +	if (flow->priority)
> +		skb->priority = flow->priority;
> +
>  	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
>  		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
>  
> diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
> index 801a3dd9ceea..caaadffc2563 100644
> --- a/net/netfilter/nf_flow_table_offload.c
> +++ b/net/netfilter/nf_flow_table_offload.c
> @@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
>  	    flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
>  		return -1;
>  
> +	if (flow->priority) {
> +		struct flow_action_entry *entry;
> +
> +		entry = flow_action_entry_next(flow_rule);
> +		if (!entry)
> +			return -1;
> +
> +		entry->id = FLOW_ACTION_PRIORITY;
> +		entry->priority = flow->priority;
> +	}
> +
>  	tuple = &flow->tuplehash[dir].tuple;
>  
>  	for (i = 0; i < tuple->encap_num; i++) {
> diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
> index 32b4281038dd..c8eaf7bc356d 100644
> --- a/net/netfilter/nft_flow_offload.c
> +++ b/net/netfilter/nft_flow_offload.c
> @@ -117,6 +117,8 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
>  	if (tcph)
>  		flow_offload_ct_tcp(ct);
>  
> +	flow->priority = pkt->skb->priority;
> +
>  	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
>  	ret = flow_offload_add(flowtable, flow);
>  	if (ret < 0)
> -- 
> 2.53.0
> 
> 

