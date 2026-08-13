Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803E0C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 02:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnmgta/wS6M8HYTbflNWe4vYMLIDSzI2C2egQNuOXpM=; b=T8PP+EcGAyap4XyWwM4MfJzU8j
	GXtwD9zufSyIx0fl3dp4gPncdiGAbimcLRpp16YsudTBybYf7SVCb++sJBkgdpyIQgpbChv2mAizD
	nVkvFKledWQeijebHYN8HmxPXdio+cS24M9vB+DHxKqBOlMrL0ojwq1IjqHniWaGx8LNRXTiEMkTu
	bPBsFjQWEVB9XvQTNBB0v3GvkzWwtWchHMKxrQV3umqOxX4uEk2alwhpwUeEtQe5sXlSFSxAJ2+bJ
	HIEBMC70gHQjvULymIocGQP/04Bfo47+x03VfYr/fHf6Tj0H1TH02+jAujWUaTQprMkkjN/vSVv33
	fuxLSBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLCW-0000000HHh9-1BWY;
	Thu, 13 Aug 2026 02:29:48 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLCT-0000000HHg4-1kiX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 02:29:47 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-6688acd1a51so2655030d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 19:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786588184; x=1787192984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnmgta/wS6M8HYTbflNWe4vYMLIDSzI2C2egQNuOXpM=;
        b=VEmWudQsoA2Pu/TTylnLJlcpBUZO6T7jz2hdPjIynfJHjWe8dLekvSLCWEqXi7drjN
         xO7wRb/XMIhOMoLOQs3WE+KUYkBCnG75gsZvSur1/msctbBtkDXFJOHwO2NjE3DyKKu5
         7uP8Mka5zYdCFXg6VmT2n1QTydVTqqTQmgGVS7X4lMzaFhXktanGly/qHyVZ6TES6CG4
         SEt8iTF3w/lAtDxWUi7bVw3NELZTqx70Mk4o1j56NZ4g3kDfLD2apMaFFpRrSXkDaQWK
         O2UxjkXhgDLjxiPAhhHepcDhhElyU2zJCddslV8IDBipintlHwyjBCm0KrWw3dzOcT6H
         K2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786588184; x=1787192984;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnmgta/wS6M8HYTbflNWe4vYMLIDSzI2C2egQNuOXpM=;
        b=k0KTURVjNi9u7upUc/59X2tDudP18VRXEilHvbDAvoee5ayP9U5dJb4Pk96BANihPO
         HbpyxirBs98bXhdUT7iZEbX40lo+9Vo2T9rTn/P2WQI2kdmV27aUfFlxTnaabs6qj91u
         sV0NqimKHgMsQMtCIIx/0v3GL9qUizVqPsDB1wgm/4rAKdEbIrdrzl5tcQSamkwvL6QT
         cCs8TYGkzotYGpqnYfHxHQ5MMM1sKUJcpxs7eoh3eOacCI/wMAVyJShGy1A5WWpznZd8
         qRGRVoihi+G1oLa9DhfZMG2qnJbKLvRd9zMW4L6SYuMj/79lDomRdCcm63M8gToCd3Ug
         EdbA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/FVop7mVSVpTAcPoSCjoNkIs78ofZQ6m2Lq2a619O2Sj29WR4LPbviWvQhd/m//g0bfnTiR0vIfRXYoC/enUz@lists.infradead.org
X-Gm-Message-State: AOJu0YxICTAqbDv+SZ/+jWbRdS8MukSAlwi1tfQfc+mjOv78ZE7U7hPN
	ttu3+QQZbbPYzmHriXIJqAdUzeo5MUv7iTY6BpXmUk0Y6IvleXaq7s8w
X-Gm-Gg: AR+sD10BBO2Awjjek8Qzx5q1r8bg8HYznNg3f5VPeaa68xLAv+2a6aZRqRombfnD2KO
	lOSGsbah/1HdD0EzKGq1+OTtQBANdFUawcW50Ln80lHR/YPhFjzmiappSC8wQiX6qe+628sA1zk
	FhFYFwjBfog20Q11RC9EYmL/O9KcnAA2gGVipyrHdyKDBfJbmTnDUpOdQn5zzPK9xIs54d9+WOW
	1FM7UCmWTX+w21S3rgeXaFcXMdb9N5U2/Jjsv3H9F4Xnctwjdz7DVRimnPxtHgs3veYjnYd5zvY
	Fptf0aC8iCUKAcIkBsZH4GVtIzuJez0mpVPHh1DExMIR0Q5bl+AI1gOycI9FfE+TWgeVBsjX9kH
	nv88enemGs6Aa1SCuyS6AXs58KA6kIBXFUO74KnVJiZ/yqSgsyg1KzemCKD54/KZYRX5RmHcHRd
	pAY2C78EAf6Ix4qKdj00Qqx2J6ZFJfJ37ysFJ9PS3Rxfb9z4bPSbMVPh9bvmhQqbAv02ggQN6JM
	hYYo2FwLjt/K4t0GC+BKmOMRjZMlTdzwDTLb4HmsKhwack=
X-Received: by 2002:a05:690e:4288:10b0:66c:4be4:89ef with SMTP id 956f58d0204a3-66c514f1295mr1042206d50.14.1786588183813;
        Wed, 12 Aug 2026 19:29:43 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8346f704851sm4472597b3.48.2026.08.12.19.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:29:42 -0700 (PDT)
Date: Wed, 12 Aug 2026 22:29:42 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: zhaoping.shu@mediatek.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 ncardwell@google.com, 
 kuniyu@google.com, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 hw.he@mediatek.com, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: haijun.liu@mediatek.com, 
 xiayu.zhang@mediatek.com, 
 lambert.wang@mediatek.com, 
 Iven.Yang@mediatek.com, 
 Zhaoping Shu <zhaoping.shu@mediatek.com>
Message-ID: <willemdebruijn.kernel.1372b82f50882@gmail.com>
In-Reply-To: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
References: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
Subject: Re: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in 
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_192945_482921_67C563E1 
X-CRM114-Status: GOOD (  28.65  )
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

zhaoping.shu@ wrote:
> From: HW He <hw.he@mediatek.com>
> 
> A device supports GRO_HW, and the device driver enables the
> NETIF_F_GRO_FRAGLIST feature. During a tethering test,
> skb_gro_receive_list() reaggregates the GSO packet. However,
> skb_segment_list() cannot segment this packet back into
> the original packets, which leads to IP fragmentation or packet drop.
> 
> Scenario (Tethering/Forwarding):
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
> 
> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
> 
> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
> 
> When NETIF_F_GRO_HW is enabled, do not set NAPI_GRO_CB(skb)->is_flist.
> Fall through to the regular skb_gro_receive() path instead of
> skb_gro_receive_list().
> 
> Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> Signed-off-by: HW He <hw.he@mediatek.com>
> Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> ---
> [2]: https://patchwork.kernel.org/patch/14706032
> [1]: https://patchwork.kernel.org/patch/14702209
> ---
>  net/ipv4/tcp_offload.c   | 7 +++----
>  net/ipv6/tcpv6_offload.c | 3 ++-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index 3b1fdcd3cb29..641c47fb1ea2 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -395,9 +395,6 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
>  	struct net *net;
>  	int iif, sdif;
>  
> -	if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> -		return;
> -

Interesting that ipv4 and ipv6 diverge here. Nice to try to make them
more alike.

>  	p = tcp_gro_lookup(head, th);
>  	if (p) {
>  		NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
> @@ -430,7 +427,9 @@ struct sk_buff *tcp4_gro_receive(struct list_head *head, struct sk_buff *skb)
>  	if (!th)
>  		goto flush;
>  
> -	tcp4_check_fraglist_gro(head, skb, th);
> +	if (unlikely((skb->dev->features & NETIF_F_GRO_FRAGLIST) &&
> +		     !(skb->dev->features & NETIF_F_GRO_HW)))

Would it be better to test skb_is_gso(skb) and only skip fraglist GRO
for HW-GRO skbs, rather than disabling it for all skbs?

If treating the features as mutually exclusive, another option would
be to replace these datapath checks with disabling one at configuration
time, in netdev_fix_features.



