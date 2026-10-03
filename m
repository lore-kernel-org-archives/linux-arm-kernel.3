Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDFCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXMtAL44iVcAA9WhOxwAITTnVgekcVqTaNx1U8S7snU=; b=kau1tO/yW6LqRPp/6Dp60UgKcC
	SPYx9sZVGU/L3BhHHtFvifckOL9yHbDuhD21QXZ0agg3XzMs4tzIW3BVqAJi3ScwcPStqC1lPCtg5
	VoIXhCwoWWMEyf6X8s9hT8bn1cZ1M0bSuvvaXlL/uKd4KOxjwE1FxiV1++2Kzl+SafiWw1Hq7Gq3E
	ezn4WhSGWXX5TCgEJA+WpkbayNzTyjShZS3xrS8M7BdpNs0YbpFYFwYtxyFvk28VFPNEWTsveNHx6
	2YhT0lmPfseGB/UX8D7KMalSVx0MG4s0vgaX1KGIcyLp0dqLV0wAwNTHLzA+TuNkYp9lJ7cZ9J5r1
	0G0Gmf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwvg-0000000DMZ1-43Hw;
	Sat, 03 Oct 2026 10:25:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwvf-0000000DMYS-0VqX;
	Sat, 03 Oct 2026 10:25:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37A4960A56;
	Sat,  3 Oct 2026 10:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F751F0089B;
	Sat,  3 Oct 2026 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791023117;
	bh=vXMtAL44iVcAA9WhOxwAITTnVgekcVqTaNx1U8S7snU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ObKK7SNvJ4iK/TmrgstzeGLH8c/hvCwqZD1SP+BrFfC/TwLDEx/D3pvSBA2br3NZg
	 QylWtd/Dml3XK2wrm+x3CG4NsZ388JrygzvySxe1ouHnZA6yBTWMCxyAQ8h3UPPVwU
	 /X9lkwxNa1hbIxBf00Jmpzf0N7XtF5hag4S0X2WAGC0A61AVKuagROT5uyIldsHofd
	 NKILFHMZnCaoFnwVgjm3spo7MHjpuDexFsvsXfhonXEebVNtLDZaotfuhBq7sa9Lhg
	 VUrts4oRZUjdEE3EQwETkySLZP5u1q+HXpK92Spl8tAi97lYFqT3R9t3fK0eEM6Gpt
	 ZhkeZJUjj8mLA==
Subject: Re: [PATCH] net: gro: mark frag_list GRO packets as SKB_GSO_DODGY
 when a list element exceeds gso_size
From: netdev-bot+sashiko@kernel.org
To: shiming.cheng@mediatek.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, willemb@google.com,
 daniel.zahka@gmail.com, alice@isovalent.com, sd@queasysnail.net,
 eilaimemedsnaimel@gmail.com, imv4bel@gmail.com, nbd@nbd.name,
 dsahern@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, steffen.klassert@secunet.com, lena.wang@mediatek.com
Date: Sat, 03 Oct 2026 10:25:16 +0000
Message-ID: <179102311631.434549.14789093097225958254@kernel.org>
In-Reply-To: <20260929100256.23192-1-shiming.cheng@mediatek.com>
References: <20260929100256.23192-1-shiming.cheng@mediatek.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch's premise does not hold on this tree, so the new
  check in skb_gro_receive_list() (net/core/gro.c:262-264) can never…
- [Medium] The Fixes: tag points at the wrong commit, and the message
  leaves out the commit the patch depends on.

--

net: gro: mark frag_list GRO packets as SKB_GSO_DODGY when a list element exceeds gso_size

This commit sets SKB_GSO_DODGY on the aggregated skb in
skb_gro_receive_list() when an appended frag_list element is longer than
skb_shinfo(p)->gso_size. The goal is to push LRO-produced aggregates
onto the conservative segmentation path instead of skb_segment_list().

> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Cc: <stable@vger.kernel.org>

[Severity: Medium]
Is this the right Fixes: tag?

3a1296a38d0c added the generic fraglist chaining that UDP uses. The
condition tested here doesn't look reachable through UDP fraglist GRO.
GSO UDP skbs are flushed in dev_gro_receive():

net/core/gro.c:dev_gro_receive() {
    ...
		if (!skb_is_gso_tcp(skb) ||
		    (skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
			NAPI_GRO_CB(skb)->flush = 1;
    ...
}

Also, udp_gro_receive_segment() stops merging once an skb's ulen is larger
than the head's, so no element can be longer than gso_size.

An element longer than gso_size could only come from TCP fraglist GRO.
That was added by 8d95dc474f85 ("net: add code for TCP fraglist GRO").
The existing fix for this scenario, 66817a9794263c, also names
8d95dc474f85.

The DODGY bit set here only has an effect through the checks in
tcp4_gso_segment() and tcp6_gso_segment():

net/ipv4/tcp_offload.c:tcp4_gso_segment() {
    ...
		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
			return __tcp4_gso_segment_list(skb, features);
    ...
}

426ca15c7f6c ("net: fix segmentation of forwarding fraglist GRO") added
the DODGY test there. 17bd3bd82f9f79 added the skb_pagelen() check next
to it.

With Cc: stable, the current tag would pull this patch into 5.10, 5.15,
6.1 and 6.6. Those trees do not have TCP fraglist GRO, so the change
does nothing there. Trees that have TCP fraglist GRO but not
426ca15c7f6c never read the new bit either.

Should the tag point at 8d95dc474f85 instead? Should the dependency on
426ca15c7f6c be mentioned? The commit those stable trees seem to need is
66817a9794263c.

> diff --git a/net/core/gro.c b/net/core/gro.c
> index 29b4d02bf5198..6c5b11b63d3b5 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -259,6 +259,9 @@ int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
>  	skb_shinfo(p)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
>  
>  	NAPI_GRO_CB(skb)->same_flow = 1;
> +	/* frag_list element larger than gso_size (already coalesced before list-append) */
> +	if (skb_shinfo(p)->gso_size && skb->len > skb_shinfo(p)->gso_size)
> +		skb_shinfo(p)->gso_type |= SKB_GSO_DODGY;

[Severity: Medium]
Can this condition ever be true on the current tree?

Commit 66817a9794263c ("net: gro: Fix nesting of TCP GSO SKBs in
skb_gro_receive_list()") is already an ancestor of this patch. It covers
the same HW-GRO case by keeping GSO skbs out of fraglist GRO:

net/ipv4/tcp_offload.c:tcp4_check_fraglist_gro() {
    ...
		/* flist GRO applies to consecutive non-GSO skbs */
		if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
    ...
}

tcp6_check_fraglist_gro() has the same guard. A GSO skb therefore ends
up with is_flist == 0. tcp_gro_receive() then flushes before it calls
skb_gro_receive_list():

	flush |= NAPI_GRO_CB(p)->is_flist != NAPI_GRO_CB(skb)->is_flist;

A GSO skb that starts a new flow also gets
is_flist = !sk && !skb_is_gso(skb), which is 0.

For non-GSO TCP skbs, tcp_gro_receive() also flushes on:

	flush |= (len - 1) >= mss;

Here mss is skb_shinfo(p)->gso_size and len is skb_gro_len(skb). After
the skb_pull(skb, skb_gro_offset(skb)) in skb_gro_receive_list(), len
equals skb->len. So skb->len > gso_size can't hold at this point.

For UDP, dev_gro_receive() flushes GSO skbs, as well as skbs that already
carry a frag_list:

	NAPI_GRO_CB(skb)->flush = skb_has_frag_list(skb);

udp_gro_receive_segment() also stops merging when
ulen > udp_get_len_short(uh2).

Is there a reproducer that still hits this after 66817a9794263c? If not,
this looks like dead code, and the stable tag would send it in place of
66817a9794263c. Should this patch be dropped in favor of the existing
fix?

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260929100256.23192-1-shiming.cheng%40mediatek.com

