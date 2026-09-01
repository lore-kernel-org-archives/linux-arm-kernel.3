Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899E6C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=; b=Yy4PpuXTiNAGjMF5vsIaC1Wbgp
	x4iFr4GDo+7rd7+n+DXosK7xaVrEo+6rQwEJATLOs3SXi2iBlMeYPSENh+fjGKvJQUJsvJ+Laos3Y
	4KQ8ZGGYMvrQBafN+ewdsIgu63nj7MqhHTXAG8lVeyJVSAgQdLaaXfNcjjyUt7ynizbX4qIp4h8jH
	6ycsTvcGMJPZT1qL8h6/QeEs3JUAbRVIDjUpxlynwpFFOVPHWZyYjnCiSm9B1Z6TWRmvuvUc8d8wi
	u59g+RIZ0bNdjebuK6Fe/HiTaDIcfoqkeplm6luoOyi7t95AcAgloP79OPvroyOHXiQkqwi8B45M7
	tFJXkbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Lvz-0000000BZEf-1oXV;
	Tue, 01 Sep 2026 10:41:43 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Lvw-0000000BZCG-1sja
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:41:42 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-855de2d0d4dso12845177b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 03:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788259299; cv=none;
        d=google.com; s=arc-20260327;
        b=erNa4KS7S28JO8/7JbPfw/0bjOIBdRksgAxseUO1OUxLzcmsnezHsvFdtpA+96l8VS
         MDZsaOmR+WAFW3Wlp8Fdz7ycT/9GXwlGHdhUcDiPzukp2DEch6oDaXY3W6AeAM5TC2vk
         pYy5PV3JVjIZceLV1dAWWnIa+J+ZnGCgZkEkpjT33taVmiSwpUz5rgjnwiXqzWOW7sKt
         YoutoNj1mdX4DPu16ycVMMieDaxLfxpAL20oTEyhxU95vyxATsnDg2n9lkIsAC6/iRf9
         cijSA2E+9L8pOjioDC9pBAQH/AVCFClKnBO0Hg/eazVCG5hzJyyecCFmX93ZUUJmNDXN
         LWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=;
        fh=HqwkDT1rJQU5BrEN+BnFx5O1aUmvNYaf7BB1Ys56aO8=;
        b=gHe2CGlbShT2A2fcMXZIhO+OP33W4wrBYS93krWayI3EUu5KINSCxYknFHVQ+aKHUD
         Sv9qLSgN4gBoaIQAd6ezHchUSvcGxT1twaLRNYXGRusV220/1nQYG0RuegvxG3gVsJdU
         JHX6Xyv8/GQRm4k2csyMyDvZ1160996XxErTBS2KiHf2tgrPmUHzdi+Tyo71s4HoBgMt
         vAqirBM9QWNsQ5TyNjItIEuIFMRnu/W6fXy7F4PvKktu4uyvKylVjajqNLwcL84+Obvj
         QugEf/n+HHKKxS3hUiBK69MAG8m1rd7VekIDS0Um5t05/zj0Lkt9r/yGleE59SaYrgCg
         q5rQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788259299; x=1788864099; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=;
        b=F+BCRYWHMYNRDBKXOog1afkcLJkiZAx1IVJqqYi6TQrNmDN8+JjF1ueECVOwKfpUYr
         XtcM2Sb0B7oVpjUFtFU0FL1aGjQ10Sr66WCBrshUeXRJkw5zEd4v4Naf0+mdYT+3ziSM
         UY7TdLuBLmButRBRHyisTuOGO4Pzc7K8l0P5oOgxPgzmh/Kw4ZT728pjLFx9KBT8CrGr
         Fs7+92ccnkGpo/z8JoYszzcvxbKEv2rSxnf7Kt1C4/WR3gYBvb74lDREbRKmRT70PKCo
         ZkIewMNqoptEZAHGq8WUXOFzKv3O09Bf0ritCANL6OezVPZjQ271fVKz0+9uaJXcO7B1
         z0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259299; x=1788864099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=;
        b=JbiVEg3SJNgORb1vMxSyCQV5CC4RbyubeJn8egZa5TRjE0YP8vN7m19CXPanJZnTXA
         d2erIcSlDbN5gwtvLT2JKTbv/gKvP9sMHtnqWrhwYknwlswv3GAHeLZ3xSSfBvth6HlW
         kwhWFvVX2TB9M7c5mqgwbGzLi9iZm+GxuJMg9A8tx/8PJ+2j2dHQodYI+NCqmRnTj3LL
         A/lFLTQcu8e79ahDOea5hoGxpXFTUnzQSgZtEI2XNJDYDmhnWlqQ0zhfgDw3Ehv3APsO
         7U0lva1qpEeqOIJEgaEMQPqTueQh4cRvzwfHEFandLTAsInXHrsfF1HMQIIZmY7vJi0h
         SVCg==
X-Forwarded-Encrypted: i=1; AKwUvBzoIb5kogJEa4J3Lu6B6GugPV9PpmveiFnROZZ6RSDwoWFja+asUfVfRsvvXCi5SEDf5wmyuA3Aa8f63TKu3vL4@lists.infradead.org
X-Gm-Message-State: AFuF++lgdnbe463VTahMK/ynirHylFzwibUPFKravwn7P/p8Rb2KSD+Q
	LRzZV6EUJNzlfXlTsvOh8PAyeyS/MdOfqmVBZCiTPtHG2DTelMcFi7hWKEGlWhWwlG3y0a1rerX
	pvdW1AF7I6F2iQeLTNM8uOBuCbb/Ow2c+NkvMPs4f
X-Gm-Gg: AYBFou18HUajGyJ3bEuYO97YKEkN8qor4pOwxAFmG4UO7ENmao5fFvKXX1T+0DvrmqB
	owcW4Pza7OILBhOzooOG0HBQiorMlVPWudSCHKnHXYoNP7Mi+JGf4QVdBmMJ0U0HzsDW1G6eYA6
	hM3N2ezwFcr9gkeQ2SQnR3kIlD9sQHwEVEG2bxt826JE5WFIkmmJckiegQnZBn/dDN1Ca9rGJyn
	7ub1zyLxca9ouDhRx17xxvJxEHwrZPegRKFEGg8CWlwE9iig25rh9WVf0VRb6kI5EnlsZh5IrMU
	tYiNYGlO9MzGlD4u7x7OvIfY70y/SHLL1z9r4klqkrdDAHIIN202LPkwLN/oRs4VfXZgioPOSfP
	j/GswQ/8PHUjsQMrgU6JNB35z+8UrZ7Y5r23PaPMBY4jJzx9s1YSfmhpjEEkWZD7Oed4BVqnyb/
	USLajtC6wq3UHSp9cqkRm/QK2ZslZ/6+aMYxg82XNIwKdcHTjQW5z7vfd2RtMtbzznLE2tOCKI0
	RAg2lUYvkfawzuN/d78rJS/Qzg+gQ37jlImzuXQ6xtTn9jIIaJOIB74GL4ITlEhWD+nJdXOY/6i
	WkM9M4JqRZ7DgQ==
X-Received: by 2002:a05:690c:e187:b0:82e:2dda:fb0a with SMTP id
 00721157ae682-86949e580b0mr14937287b3.7.1788259299093; Tue, 01 Sep 2026
 03:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260901092632.369248-1-julius@bairaktaris.de> <apaix8MjIkRPjHVq@lore-desk>
In-Reply-To: <apaix8MjIkRPjHVq@lore-desk>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Tue, 1 Sep 2026 10:41:01 +0000
X-Gm-Features: AcwNN1VC5hjHM3WR5pHxOoSAcDyx36Os8cGZ9xiJpcKS8kl0-4xHvvgS61p5JxY
Message-ID: <CAC1t37KSALgrxX_4ZkGqWFnUStfYmMz+sG773UPQQ3TbjHm5CQ@mail.gmail.com>
Subject: Re: [PATCH nf-next] netfilter: flowtable: carry a priority into the offload
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_034140_771868_E833E1FA 
X-CRM114-Status: GOOD (  34.46  )
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

Hi Lorenzo,

Agreed. v2 applies the stored priority on the software fast path as
well, in the IPv4 and IPv6 hooks, so a flow forwarded in software and
one forwarded by hardware get the same treatment; both paths are
exercised on IPQ8074 hardware. It follows once the 24h window passes.

If the earlier discussion is the CT metadata action RFC from last
September, the software-plane point raised there is what v2 closes - a
pointer would be welcome if more was raised elsewhere.

Thanks,
Julius


Am Di., 1. Sept. 2026 um 10:02 Uhr schrieb Lorenzo Bianconi
<lorenzo@kernel.org>:
>
> > A flow rule handed to a driver describes NAT, encapsulation and the
> > output device, but not how the flow should be treated on the way out,
> > so hardware with priority queues can only fall back on the DSCP the
> > packet carries.
> >
> > Carry skb->priority of the packet that created the flow and emit it as
> > FLOW_ACTION_PRIORITY, the action act_skbedit already emits on the tc
> > path. "meta priority set" before "flow add" then reaches the hardware.
> > A flow without a priority emits no action; mtk and airoha, the two
> > in-tree consumers of these rules, ignore the new one as they do
> > FLOW_ACTION_CSUM.
> >
> > The flowtable holds one flow for both directions and the expression
> > runs once, so the priority applies to both; per-direction
> > classification is not carried.
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>
> Hi Julius,
>
> we have already discussed about this kind of approach to offload skb priority
> into drivers that support flowtable hw offload. The main blocking point is we
> need the same feature in the flowtable sw path in order to not introduce any
> missing capability in the kernel tx path.
>
> Regards,
> Lorenzo
>
> > ---
> > The consumer of the emitted action is a DSA driver for the IPQ8074 PPE,
> > maintained in OpenWrt; measured there, "meta priority set" ahead of
> > "flow add" places offloaded flows in the port's hardware priority
> > queues. The mtk and airoha hunks are compile-tested only. The new field
> > grows struct flow_offload by eight bytes on 64-bit; the entry allocates
> > from its own kmem_cache, so no allocation-class change.
> >
> >  drivers/net/ethernet/airoha/airoha_ppe.c        |  1 +
> >  drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
> >  include/net/netfilter/nf_flow_table.h           |  1 +
> >  net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
> >  net/netfilter/nft_flow_offload.c                |  7 +++++++
> >  5 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> > index 92611802801e..2afce76ad131 100644
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > @@ -1161,6 +1161,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
> >               case FLOW_ACTION_REDIRECT:
> >                       odev = act->dev;
> >                       break;
> > +             case FLOW_ACTION_PRIORITY:
> >               case FLOW_ACTION_CSUM:
> >                       break;
> >               case FLOW_ACTION_VLAN_PUSH:
> > diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> > index 99b28aaa7cc4..4ee99e8e4a34 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> > @@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
> >               case FLOW_ACTION_REDIRECT:
> >                       odev = act->dev;
> >                       break;
> > +             case FLOW_ACTION_PRIORITY:
> >               case FLOW_ACTION_CSUM:
> >                       break;
> >               case FLOW_ACTION_VLAN_PUSH:
> > diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
> > index f2e2771f188f..23218c8cbc3d 100644
> > --- a/include/net/netfilter/nf_flow_table.h
> > +++ b/include/net/netfilter/nf_flow_table.h
> > @@ -202,6 +202,7 @@ struct flow_offload {
> >       unsigned long                           flags;
> >       u16                                     type;
> >       u32                                     timeout;
> > +     u32                                     priority;
> >       struct rcu_head                         rcu_head;
> >  };
> >
> > diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
> > index 801a3dd9ceea..caaadffc2563 100644
> > --- a/net/netfilter/nf_flow_table_offload.c
> > +++ b/net/netfilter/nf_flow_table_offload.c
> > @@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
> >           flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
> >               return -1;
> >
> > +     if (flow->priority) {
> > +             struct flow_action_entry *entry;
> > +
> > +             entry = flow_action_entry_next(flow_rule);
> > +             if (!entry)
> > +                     return -1;
> > +
> > +             entry->id = FLOW_ACTION_PRIORITY;
> > +             entry->priority = flow->priority;
> > +     }
> > +
> >       tuple = &flow->tuplehash[dir].tuple;
> >
> >       for (i = 0; i < tuple->encap_num; i++) {
> > diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
> > index 32b4281038dd..dd3ac2b9c963 100644
> > --- a/net/netfilter/nft_flow_offload.c
> > +++ b/net/netfilter/nft_flow_offload.c
> > @@ -117,6 +117,13 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
> >       if (tcph)
> >               flow_offload_ct_tcp(ct);
> >
> > +     /* Whatever classified this packet before it reached the flowtable also
> > +      * describes every packet the hardware will forward in its place, so
> > +      * carry it into the offload rather than losing it with the software
> > +      * path.
> > +      */
> > +     flow->priority = pkt->skb->priority;
> > +
> >       __set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
> >       ret = flow_offload_add(flowtable, flow);
> >       if (ret < 0)
> >
> > base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
> > --
> > 2.53.0
> >

