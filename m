Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAADDD7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAA6S4oPNmkGryTm0KBSPRHi5Lj0tu35Mdjk5cYMuDc=; b=m6KZIoUoFY12ssj5YXIYT6CGv2
	1gjRG2Ja+3Y44Ctn6Tftfk3mYxe2SaaTnmSyskxyS1cgAWQHJcynfj3bbpCGU1Q+Nm4vFmQwi8OrC
	tvARWoOIQAOWQQT/M3B2Hm4YDD8XrDia4vFrQkgKLEptTrl6y/qEAombjGLFFNVdED40VT9ON/Rf8
	IUTwgm494NcaO4U/0t33kWkLRQrGURnZ+yiWbN6/DWMdY5dYUpBRsr5hboTj4r0hU2RA7Y6vJAB6P
	p+JquiiNnCbFy8uS59hb876ZebU7zO/9HG3lT4HF6S+Xi+Cr9dVKC8hRhgN3GUHXBY9E/nzfz7UFh
	TiLq0c9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8AF-0000000BY18-2p1P;
	Sun, 25 Jan 2026 22:00:59 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8AC-0000000BY0T-3TpE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:00:58 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-649523de905so5043904d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 14:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769378455; x=1769983255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAA6S4oPNmkGryTm0KBSPRHi5Lj0tu35Mdjk5cYMuDc=;
        b=IhqJ2MuQ/ASyH63wmyHQu9xbdTYefq7KKrpL9pK34px2N6h/GWogKMEHT0VBznrhQp
         ex6V30n/a/xx6J+Xc7Y+2rC5+TEW/iJwhQxYFZXrvY5qC+cAQlFWImChLFlL8nu5r6Cs
         SNLGxEFafGibXk0DSqXStH5HJdgVdjAAWKfPv9GlaHea29Ry9qv8Jn7YY2NxHmSjbtdf
         rjd5mBheQG8PVIiFDzaiSJGrx3Ft0RyvmN/yeraEU6BKKikWSzg/JPB5nLX7JkxYKRpg
         29cluFq/ypw4OcjBBbfWH3knjvyEHoRGHD5ZpZ5vbJYKx55TP8bHatMgc8mG8C+43fSo
         CHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769378455; x=1769983255;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAA6S4oPNmkGryTm0KBSPRHi5Lj0tu35Mdjk5cYMuDc=;
        b=nMDjasXuHb9ntGrk9b/AwCPYSoiYBSPC3kxWUwvFEQQ9FHQuLb7i/b2PQqgYw00X4U
         7Cll7w0WzM97+1EiCEs0zNGNpK1b645wUz7a2Y+SeC37sgBq09cUEbybntcqI5I6xnQa
         ihJKcqxsTaCa8cNPz/KnxcS8gGkz4dr/nZWv0pC4ure45Uy4KY41vw73tssDhD0wWb6T
         /8gXm2eSY4zTi3WHPVuZkVjMbqI1ikd/JLb1ZNAcH5XdyIJDyRg4StnipPKqimGDA7km
         rubrPeWRAYJQyaNc6YUY6wZimRm3JaaA3TLqfSX8XwCdleI4siDljBDQpSLroAVW6uIL
         ueVw==
X-Forwarded-Encrypted: i=1; AJvYcCWx40F3J+DwTEfLZKpkzxbxOGY5e00cBsbJXj1UP1J+A3CRA9oL+ElzRHArN00vJGA/3dJXpUNL0v2cAVB494Qd@lists.infradead.org
X-Gm-Message-State: AOJu0YwJBg3IVMB6T4eWtY48/BxxQozL7lrU54Gg0DJuWIepJsJkoz6w
	mTufs4R1iHtApzIalRMzaWHic/+p09e9XIvCw2crvW2mk9/BcAW8iQAY
X-Gm-Gg: AZuq6aIST/8zBojfy6nX1NEXE3JjH3TqGViKYTJgYkRULtfFSUCe6KbfyNkXb+B7ZCn
	56dV6IxLPTuaX1lKhbuRKy3R3QKL2dc5R6wJaisDI/Ucc64banqZopHy2cmJ6V/7s7nZjY3dpXY
	LPnXqkrgLW+50bayrYvaRRcv2X0gBbg2D7PM9sRHP6lRjW7+gVHGT9xgwoWh4Lijf29JAyItBzd
	/B8OYu8bTaNlsmRxXZZI4Qt8aO05YWH9xgWp2qf0gVJydw8/+alCCmNyvYCez7YvCREGL0SPPTm
	Hp4WQNiAi6EQ8XvYCTco83j7yL4aanch1CjvjKPeFICR5UMOk0fe33eCWmiLOsCqT4a3hbiHfBw
	oiLmFs4OqCtSExOSr5CmQ0LBOtGk6ZOvQLMx7aa2JRWbD5xQeVoLNHxD6lSG5UCFyQz/60seesD
	E2M6s29rGzLnDpDqKXqYafGV4XK7F/ZuP/jQKLLfNKkt7EhzdIs+5pvaWGBTA=
X-Received: by 2002:a05:690e:12ce:b0:649:47f1:26e0 with SMTP id 956f58d0204a3-6497140db99mr1986222d50.38.1769378454977;
        Sun, 25 Jan 2026 14:00:54 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7943ae2d7f9sm40457437b3.0.2026.01.25.14.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:00:54 -0800 (PST)
Date: Sun, 25 Jan 2026 17:00:54 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jibin Zhang <jibin.zhang@mediatek.com>, 
 Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: wsd_upstream@mediatek.com, 
 Jibin Zhang <jibin.zhang@mediatek.com>
Message-ID: <willemdebruijn.kernel.4c5ab6b532d7@gmail.com>
In-Reply-To: <20260124095021.3953-1-jibin.zhang@mediatek.com>
References: <20260124095021.3953-1-jibin.zhang@mediatek.com>
Subject: Re: [PATCH v3] net: fix segmentation of forwarding fraglist GRO
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_140056_927954_F7772769 
X-CRM114-Status: GOOD (  27.08  )
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

Jibin Zhang wrote:
> This patch enhances GSO segment checks by verifying the presence
> of frag_list and protocol consistency, addressing low throughput
> issues on IPv4 servers when used as hotspots
> 
> Specifically, it fixes a bug in GSO segmentation when forwarding
> GRO packets with frag_list. The function skb_segment_list cannot
> correctly process GRO skbs converted by XLAT, because XLAT only
> converts the header of the head skb. As a result, skbs in the
> frag_list may remain unconverted, leading to protocol
> inconsistencies and reduced throughput.
> 
> To resolve this, the patch uses skb_segment to handle forwarded
> packets converted by XLAT, ensuring that all fragments are
> properly converted and segmented.
> 
> Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
> ---
> v3: Apply the same fix to tcp6_gso_segment(), as suggested.
> 
> v2: To apply the added condition to a narrower scop
> 
>   In this version, the condition (skb_has_frag_list(gso_skb) &&
> (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol))
> is moved into inner 'if' statement to a narrower scope.
> 
>   Send out the patch again for further discussion because:
> 
> 1. This issue has a significant impact and has occurred in many
> countries and regions.
> 2. Currently, modifying BPF is not a good option, because BPF code
> cannot access the header of skb on the fraglist, and the required
> changes would affect a wide range of code.
> 3. Directly disabling GRO aggregation for XLAT flows is also not a
> good solution, as this change would disable GRO even when forwarding
> is not needed, and it would also require cooperation from all device
> drivers.
> 
> [2]: https://patchwork.kernel.org/patch/14375646
> 
> [1]: https://patchwork.kernel.org/patch/14350844

[PATCH net] and please include a Fixes tag and CC: stable.

> 
> ---
>  net/ipv4/tcp_offload.c   | 4 +++-
>  net/ipv4/udp_offload.c   | 4 +++-
>  net/ipv6/tcpv6_offload.c | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index fdda18b1abda..6c2c10f37f87 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -107,7 +107,9 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
>  	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
>  		struct tcphdr *th = tcp_hdr(skb);
>  
> -		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
> +		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
> +		    skb_has_frag_list(skb) &&

Not all skbs with frag_list are SKB_GSO_FRAGLIST skbs.
Let's limit to those, which was the intent when skb_segment_list was
introduced.

Could XLAT set SKB_GSO_DODGY when modifying headers for GSO packets?
Not sure which exact code is being referred to. All such BPF helpers
in net/core/filter.c do. skb_segment has a further sanityf check for
odd frag_list geometry, but conditional on SKB_GSO_DODGY.

See also https://lore.kernel.org/netdev/willemdebruijn.kernel.30b0807bf46c0@gmail.com/

But in general: it is always safe to downgrade from skb_segment_list
to skb_segment. And fine to err on the side of caution esp. for any
packets that were modified along the way, so Ack on the general idea.


> +		    (skb->protocol == skb_shinfo(skb)->frag_list->protocol))
>  			return __tcp4_gso_segment_list(skb, features);
>  
>  		skb->ip_summed = CHECKSUM_NONE;
> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index 19d0b5b09ffa..2a99f011793f 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -514,7 +514,9 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
>  
>  	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
>  		 /* Detect modified geometry and pass those to skb_segment. */
> -		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
> +		if ((skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size) &&
> +		    skb_has_frag_list(gso_skb) &&
> +		    (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol))
>  			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
>  
>  		ret = __skb_linearize(gso_skb);
> diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
> index effeba58630b..3c7fd0362475 100644
> --- a/net/ipv6/tcpv6_offload.c
> +++ b/net/ipv6/tcpv6_offload.c
> @@ -170,7 +170,9 @@ static struct sk_buff *tcp6_gso_segment(struct sk_buff *skb,
>  	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
>  		struct tcphdr *th = tcp_hdr(skb);
>  
> -		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
> +		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
> +		    skb_has_frag_list(skb) &&
> +		    (skb->protocol == skb_shinfo(skb)->frag_list->protocol))
>  			return __tcp6_gso_segment_list(skb, features);
>  
>  		skb->ip_summed = CHECKSUM_NONE;
> -- 
> 2.45.2
> 



