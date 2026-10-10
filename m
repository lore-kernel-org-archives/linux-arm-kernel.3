Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82927CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 06:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEEO3v1L3zz+tLSI6RWGQzmGcrPEPkcaUTB011Qb2S8=; b=GoxbcYFBGw8Ruxlwt6oNzfG0H9
	oV9XLD3/Ve11XzwrTYxSUOimvd+UbgvekDmFUm14ZwyPsHwbo1Jm7vX8aNYMcXu+5I4vGuOy3Ze5V
	MamQQk1M6/v2rNxM3me2dIywdfZEvAchKjCi/NPgKWgaah0ED8F7fGV8WVBtdUtTxChl8k5pvtJ0R
	DRQb1ssLwSGJKHZmsj2FvIeBSwrzbsOxEco2F9g9oBo5kpQApHU3SGr6OrGBhFOkLjbrQYSTR7nL7
	Y0QRMybGqAfX9aQHKhJ4B1DGUrBhxG2BZ5oTrqciF9dhZIIvqjH3BnllAanBF5SrwFDLgusHC94hz
	ZB5rRAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFQii-00000007aEw-0lmv;
	Sat, 10 Oct 2026 06:38:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFQif-00000007aEm-2sXe;
	Sat, 10 Oct 2026 06:38:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0BB8601F0;
	Sat, 10 Oct 2026 06:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C791F000FF;
	Sat, 10 Oct 2026 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791614288;
	bh=fEEO3v1L3zz+tLSI6RWGQzmGcrPEPkcaUTB011Qb2S8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ScY9z2HBS55TpFj0u/jp+mgxV3kvlpmSRjNnJwhT3vxjz8n5PtBJ8QmYav7gk2kzV
	 h77fGdHtwleuZ2hxt0u2JOzixIaQMHxGc925jqJHriq1HQK6Fk3zJRvUmm6ylPrzcE
	 rKV4NAV9HezJ4JfjBJ4T8hhR928JS+ZngCDDvPb5pc68ELbwgJdHDrB0OFMewp+vZZ
	 kHV830Bw9MtvSSfkATSMZUMUt+6QiaJU2WARDy0nejQ1UiZLQOGYqxMK54umdc1mdi
	 orUC0LbKopG+05P3fo2bDJecwAU0uajwwuWr+4IUCRI+KZ5wbFjHoUJrgZdJTCeWuZ
	 5UxLPTPMZldGA==
Subject: Re: [PATCH] net: tcp: fix fraglist GRO flushing on alternating TCP PSH flag
From: netdev-bot+sashiko@kernel.org
To: shiming.cheng@mediatek.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, willemb@google.com,
 daniel.zahka@gmail.com, alice@isovalent.com, sd@queasysnail.net,
 eilaimemedsnaimel@gmail.com, imv4bel@gmail.com, nbd@nbd.name,
 dsahern@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, steffen.klassert@secunet.com
Date: Sat, 10 Oct 2026 06:38:06 +0000
Message-ID: <179161428655.434549.7066789783316941855@kernel.org>
In-Reply-To: <20261009060319.6229-1-shiming.cheng@mediatek.com>
References: <20261009060319.6229-1-shiming.cheng@mediatek.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Forwarded TCP FIN/PSH can be dropped from the wire when a
  fraglist GRO skb falls back to tcp_gso_segment()/skb_segment().
- [High] FIN/PSH in a fraglist tail segment is invisible to netfilter,
  conntrack, flowtable, tc and BPF, which all read only the aggregate's…
- [Medium] The commit message calls the removed check 'redundant' and
  only discusses PSH.

--

net: tcp: fix fraglist GRO flushing on alternating TCP PSH flag

This patch removes the unmasked TCP flag word comparison from the is_flist
branch of tcp_gro_receive(). Segments whose PSH/FIN flags differ from the
held packet can then be appended to a fraglist GRO skb. The goal is to stop
premature flushes when a sender alternates [ACK] and [PSH, ACK] segments
in forwarding and tethering setups.

> This redundant check causes premature flushing on any incoming PSH packet,
> shattering aggregation and increasing softirq overhead.

[ ... ]

> a single fraglist, and are safely flushed together upon encountering the
> PSH flag at `out_check_final`, preserving the required TCP push semantics.

[Severity: Medium]
Is the removed check really redundant? Commit 8d95dc474f85 ("net: add code
for TCP fraglist GRO") added it to the is_flist branch on purpose.

The general path can mask FIN|PSH out of its first comparison only because
it later ORs those flags into the held packet's header:

    tcp_flag_word(th2) |= flags & (TCP_FLAG_FIN | TCP_FLAG_PSH);

The is_flist branch jumps to out_check_final before it reaches that line.
So the unmasked comparison was what kept every fraglist member's flags
identical to the head's.

The removal also relaxes FIN, not only PSH. Data-carrying FIN segments,
such as the last segment of a response, can now join a fraglist. The
commit message doesn't mention this.

The claim that push semantics are preserved seems to hold only when the
skb goes through skb_segment_list(). Could the commit message describe the
FIN change and the cases raised in the comments on the diff below?

> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index e74d99ca9face..54b40ec95a080 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -328,7 +328,6 @@ struct sk_buff *tcp_gro_receive(struct list_head *head, struct sk_buff *skb,
>  	flush |= skb_cmp_decrypted(p, skb);
>  
>  	if (unlikely(NAPI_GRO_CB(p)->is_flist)) {
> -		flush |= (__force int)(flags ^ tcp_flag_word(th2));

[Severity: High]
Can this drop a forwarded FIN or PSH from the wire?

Without this check, skb_gro_receive_list() links an in-sequence [PSH, ACK]
or [FIN, ACK] data segment into the held skb's frag_list. The is_flist
branch then jumps to out_check_final. That skips the only place where
FIN/PSH reach the head header:

    tcp_flag_word(th2) |= flags & (TCP_FLAG_FIN | TCP_FLAG_PSH);

tcp4_gro_complete() and tcp6_gro_complete() return early for is_flist.
The head can't carry FIN/PSH itself, because out_check_final would have
flushed it. So the head header has neither flag, while the last frag_list
member has them.

tcp4_gso_segment() uses __tcp4_gso_segment_list() only when the geometry
still matches and SKB_GSO_DODGY is clear:

    if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
        !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
        return __tcp4_gso_segment_list(skb, features);

Otherwise it falls back to tcp_gso_segment()->skb_segment(). That path
copies head_skb's headers, TCP flags included, into every segment.

tcp_gso_segment() then clears fin/psh on every segment except the last:

    while (skb->next) {
        th->fin = th->psh = 0;

The last segment keeps the head's flags, which never had FIN/PSH.
tcp6_gso_segment() has the same fallback.

These can trigger the fallback on forwarded traffic:

  bpf_skb_proto_4_to_6() and bpf_skb_proto_6_to_4(), reached through
  bpf_skb_change_proto() (for example CLAT/464xlat when tethering), set
  SKB_GSO_DODGY on GSO skbs.

  bpf_skb_net_grow() and bpf_skb_net_shrink() set SKB_GSO_DODGY.
  bpf_skb_net_grow() can also linearize frag_list skbs when
  BPF_F_ADJ_ROOM_FIXED_GSO is not set.

  Any pull or linearize that changes the geometry has the same effect,
  for example skb_ensure_writable(skb, skb->len) in NAT mangling.

In those cases the receiver doesn't get the FIN until the sender
retransmits it, and PSH is silently cleared.

A fraglist skb redirected to a local TCP socket after GRO (DNAT/TPROXY) is
also parsed from the head header only. TCP has nothing like UDP's
local-delivery fraglist handling, so the FIN would be missed there too.

ORing the tail's flags into th2 in the is_flist branch doesn't seem to fix
this. skb_segment_list() emits the head skb with its own TCP header, so the
first segment would then carry a spurious FIN/PSH.

[Severity: High]
Does this also hide the tail's FIN/PSH from netfilter, conntrack,
flowtable, tc and BPF? All of these read only the aggregate's head header
before segmentation.

In conntrack, get_conntrack_index() only checks the head's tcph->fin, so
the FIN transition never fires. tcp_in_window() computes:

    end = segment_seq_plus_len(seq, skb->len, dataoff, tcph);

skb->len covers all of the fraglist payload. The +1 for FIN is missing,
because tcph is the head header. The peer's ACK of the FIN then hits:

    if (!before(sack, receiver->td_end + 1))
        return nf_tcp_store_invalid(ct, sender, log, NFCT_TCP_INVALID,
                                    NF_TCP_LOG_ACK_OVER, receiver->td_end + 1);

That ACK is classified invalid, and so are the peer's own FIN and the
final ACK. A typical "ct state invalid drop" rule would then drop the
teardown packets. Without such a rule, the entry stays ESTABLISHED instead
of moving to FIN_WAIT/CLOSE_WAIT.

In the flowtable, nf_flow_state_check() reads fin/rst only from the head
header, so NF_FLOW_CLOSING is never set for the offloaded flow.

tcp_mt() in xt_tcpudp and the nft tcp flags match also read only the head
header, so a FORWARD rule that matches FIN or PSH won't fire.
skb_segment_list() copies only the MAC header from the head and keeps each
member's own TCP header. The FIN/PSH therefore still goes out on the wire
and bypasses that policy.

Before this patch, the unmasked comparison guaranteed that the head header
described every member of the fraglist.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009060319.6229-1-shiming.cheng%40mediatek.com

