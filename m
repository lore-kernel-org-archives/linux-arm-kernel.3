Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B4FE6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx0jOvF6tZS8pxKHJ8Mkyoco4/zguV4NZ9A2mS3WuCM=; b=lBsesuxG1XNto1SidPknhN5y9D
	GEUhuprcP+ofg6J8qJ/hn9WxlZnrXko02jSYgq1wjzN0rNkMD2eMflKf5ZHklTfwyaMBBM1io0LNh
	rj0ZYLM47owGKY73K29U1aTz3Xlf69zX+4aO5+AOvWFo+1+p1ILAJvi5deoKzLNC9i8p+8IG1eYsl
	m1TXWqULaIFh0fqE2oG4Tu2SiyJYK08HXGehuYWJCFzgtSbAcQEqEnG2jxFCM4u2Cm7coVC/10EDw
	AZN5hxv6OiwXTAPuaddqMW0s0a/5l01t3dBO6mvkjFmc1oEmn8bTeH0ouK0LoV8ySZfPre1XIte7P
	d9sTe8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY7dG-0000000Fy3r-2B8P;
	Tue, 23 Dec 2025 19:01:18 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY7dE-0000000Fy34-18qN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 19:01:17 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-78ab03c30ceso45323317b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 11:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766516473; x=1767121273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx0jOvF6tZS8pxKHJ8Mkyoco4/zguV4NZ9A2mS3WuCM=;
        b=RvBZ7urdFL+1aiXMKS8y+VDqS8NaaMPUQoUCVWW1t/3UELtAOKON+5kZGd9uKKCgaf
         UDyq2D5F3mNdMhMp8eWVZWpuua5kS3DlyoBQxTZEKbRzcTHOgeo4PAl0/5ssaUsPeGuT
         LJT0aLjukW7oUV1REAEWDJ9R4ypvjabUQO05QEmGs9IDqdGVRggjG9WYnEH6jBmNB/j9
         dd58M5jZvpmkFo7qQzJNeRG5TuN/gxOFEq3QgAmIwqTKDDRDJHzqPYjZrXLPkIM6b5lf
         SD74QF1jNG3LowvShKKlrNUD8v4+yTp9f/o6MGxtFAwadUyBPONTst37CjV+rvfRLaeQ
         zHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766516473; x=1767121273;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vx0jOvF6tZS8pxKHJ8Mkyoco4/zguV4NZ9A2mS3WuCM=;
        b=DLJ3Dsvjgd/9+g+TLvZyK77KD3fPtthz/Byh3zBn6sn5a41+XhQdQjRKZi94eyg21t
         8dxid9v3weds02kUhriemCEXsfk0Hvvu90mPHS+owcjK8P89kYp7eYtXgg7v7jS7z8yJ
         dhIGKH39UeNCirS53zMe3nK9UBRA8+TnS7soi3k3pX9bxpklUUwMWrqdQkwdHWTWdget
         0Pj4Fb26c3CwJ1k0542kx1oiM8jJjaVA7fbXbUA25owcVN+TYjcGOLY5e0vJF6U7YCFV
         ++W/X15/3ZTE2G5LIEdFbz4lvBU4oOFCjAye47XkSks1RiRZLyoG0Q15p5xyV4Vp31e3
         v+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBuc3kCuAEzfbl2Q/jOaVRj34ELlC1Jjmkpqlj6zidZPWtAWs1ghqseRKnQKDSoo2/cRetKjT+ryqxqh6owrW@lists.infradead.org
X-Gm-Message-State: AOJu0YzcegQlfHxIFpiHPRHYgCo26JB/VJkN79r0AOobM8W1YlpHqBgx
	yvGQDcccRNv/g4j5a4NOvE1DtcZSLXps/CmJDkQKaufeB6OcLJOhR9md
X-Gm-Gg: AY/fxX5Jn9K41JaspbNmkgZIip72NxOUIgT/0RS8A0pYzwNmwAvUBfgiaTxZNM0WEHM
	G3fRn3s9gqMdD+KNJd/U4UfuWXHdSTPGFFtmQPeWTzlPskqnn9/v33SrubgycoNLqekisQWNkKP
	CtnkwuD4gqwPEpzM9G4hzcLaaa60727Bnmh39oK/8Wj9kZeSHeZ445NugsqSTC+8FAMzJwG/OuP
	pV0LVzBkqrQ+Ow6HlVlYgDMa98KjGcZp06Baxokdwi4eaPuG20Bimh6b5/u7fjmz93y5q4qPpc5
	bEDdsACDVZujwYqW7/6ySP9SDqYuIdy+9L/8qiBZwY/i2eQCqGMRTgAT2h4VJRSLTX/R2sfKkE3
	hP84hJVT5lORldCOWj35bJR5Fk62UJJdAtEB03zuSdgjk1l6voLCATyfocu0OVST4+fhQuoFVP7
	xHH3SAp1rlDpGTLWbjMgzcyNkTVYPs6FGrHMXNXGdExqy/MuYJAD9ahwVKbNMbh4r7/mpGatsID
	RXHsA==
X-Google-Smtp-Source: AGHT+IEWRFlbhvq7/GCqpt+unPpPjWVNkObSkmzQVDUvyG3eowHw3ouJONLooJzvYG8sKv1QFMJ/Wg==
X-Received: by 2002:a05:690c:6a04:b0:78c:3007:dabf with SMTP id 00721157ae682-78fb3f2c893mr127569747b3.27.1766516473358;
        Tue, 23 Dec 2025 11:01:13 -0800 (PST)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-78fb437380esm57704487b3.4.2025.12.23.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:01:12 -0800 (PST)
Date: Tue, 23 Dec 2025 14:01:11 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>, 
 Jibin Zhang <jibin.zhang@mediatek.com>, 
 Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 steffen.klassert@secunet.com
Cc: wsd_upstream@mediatek.com, 
 shiming.cheng@mediatek.com, 
 defa.li@mediatek.com
Message-ID: <willemdebruijn.kernel.2633c480125d5@gmail.com>
In-Reply-To: <aab6c515-12e4-48ca-8220-c0797dae781f@redhat.com>
References: <20251217035548.8104-1-jibin.zhang@mediatek.com>
 <aab6c515-12e4-48ca-8220-c0797dae781f@redhat.com>
Subject: Re: [PATCH] net: fix segmentation of forwarding fraglist GRO
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_110116_334776_BF1271AF 
X-CRM114-Status: GOOD (  28.29  )
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

Paolo Abeni wrote:
> On 12/17/25 4:55 AM, Jibin Zhang wrote:
> > This patch enhances GSO segment checks by verifying the presence
> > of frag_list and protocol consistency, addressing low throughput
> > issues on IPv4 servers when used as hotspots
> > 
> > Specifically, it fixes a bug in GSO segmentation when forwarding
> > GRO packets with frag_list. The function skb_segment_list cannot
> > correctly process GRO skbs converted by XLAT, because XLAT only
> > converts the header of the head skb. As a result, skbs in the
> > frag_list may remain unconverted, leading to protocol
> > inconsistencies and reduced throughput.
> > 
> > To resolve this, the patch uses skb_segment to handle forwarded
> > packets converted by XLAT, ensuring that all fragments are
> > properly converted and segmented.
> > 
> > Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
> 
> This looks like a fix, it should target the 'net' tree and include a
> suitable Fixes tag.
> 
> > ---
> >  net/ipv4/tcp_offload.c | 3 ++-
> >  net/ipv4/udp_offload.c | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> > index fdda18b1abda..162a384a15bb 100644
> > --- a/net/ipv4/tcp_offload.c
> > +++ b/net/ipv4/tcp_offload.c
> > @@ -104,7 +104,8 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
> >  	if (!pskb_may_pull(skb, sizeof(struct tcphdr)))
> >  		return ERR_PTR(-EINVAL);
> >  
> > -	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
> > +	if ((skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(skb) &&
> > +	    (skb->protocol == skb_shinfo(skb)->frag_list->protocol)) {
> >  		struct tcphdr *th = tcp_hdr(skb);

Using fraglist gso on a system that modifies packet headers is a known
bad idea. I guess this was not anticipated when the feature was added.
But we've seen plenty of examples with BPF already before.

This skb->protocol change is only one of a variety of ways that the
headers may end up mismatching.

It's not bad to bandaid it and fall back onto regular GSO.

But it seems like we'll continue to have to play whack-a-mole unless
we find a more fundamental solution. E.g., disabling fraglist GRO when
such a path is detected, or downgrade an skb to non-fraglist in paths
like this XLAT.


> >  
> >  		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
> > diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> > index 19d0b5b09ffa..704fb32d10d7 100644
> > --- a/net/ipv4/udp_offload.c
> > +++ b/net/ipv4/udp_offload.c
> > @@ -512,7 +512,8 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
> >  		return NULL;
> >  	}
> >  
> > -	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
> > +	if ((skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(gso_skb) &&
> > +	    (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol)) {
> >  		 /* Detect modified geometry and pass those to skb_segment. */
> >  		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
> >  			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
> 
> I guess checks should be needed for ipv6.
> 
> Also it looks like this skips the CSUM_PARTIAL preparation, and possibly
> break csum offload.
> 
> Additionally I don't like the ever increasing stack of hacks needed to
> let GSO_FRAGLIST operate in the most diverse setups, the simpler fix
> would be disabling such aggregation.
> 
> /P
> 



