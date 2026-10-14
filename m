Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA04CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 04:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljQtddetZrnHdZkhpewiA0nv8+K0Dn1c6TsFqcV3Ues=; b=iMWVVmoXlwBRTKuXud84Ivlc2i
	XtB0HrO44wQdKyh0bRc5oJIzoZCmnB1d2jlFekcypNPRscvDvQqyBCsKZvK9x/fdUNtgWHDN2Aj14
	mGwnoe0429FDF4j9CRd6qzCQJWtYbBnvTDb1BL/6gsyjBt+sca5aVI8wt6U0F2JlwReU6QW/KcqT9
	Muyme+IiJYWYw8LHecJal6+ye5ZmOWKdRazPeyRl3TCFIN+MgMDrhqBrI8Lkhrrdx8kVsxGgAjw0T
	DSEmGeKVORalW8jgt+CM6VVgZkHF1QSM5ZsJKk51Ufy3yaGvccAdZXMaKkYXSUEPKrj7IcfP6II1p
	hMRESuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqK0-0000000EU5o-3t9x;
	Wed, 14 Oct 2026 04:10:32 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqJv-0000000EU4z-13wK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 04:10:31 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6776efd4ff1so3188620d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 21:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791951025; x=1792555825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ljQtddetZrnHdZkhpewiA0nv8+K0Dn1c6TsFqcV3Ues=;
        b=OIMWUIhyl1uL9m161+ot2O6DJxls0fEK0RNgeyzuRwA5Zro8KgdjIL7nuKvFBYfHFq
         MxmelRo5DH76ecRCpqYCqXwXXMo1zuq0OZ71rNqv1tOgKx7OkESW0at7+OySJ0FTIbqp
         pDR8m3dhqCdOjqypr+F83VPg1EblUomnOB0W22K9UzCwwQ8VPr54OCaGxzkk/win1wT6
         iyFBk15REszwoWIjp+tx7U3pxv1DCRb69ClQaSsJ4EbazGmzoiuvhCWGGtj/whTxyne+
         Xgt8SfBDouZ1UPWgfr5Qga9mE9E0Fq/kKTPUcLZOuBkMcA8CEDbMzMQ1Ux3+q9zaSYbi
         /nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951025; x=1792555825;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljQtddetZrnHdZkhpewiA0nv8+K0Dn1c6TsFqcV3Ues=;
        b=V/ICKrcAM5BWh9T68/BhTIBGDjYKAo7JUxHA4DOkfTkRrYH3dt4tc6Pv3KAnEl8/V3
         MK1/pMTpulorGWHIj9R4uD1OkvegJ7CAx8fznmHyJivbQ/yhi5/ENG0BcsxA386fXMYf
         lbl8wUaNRrV3YKaMeITWg2EnC+vHtutASiBFamzRgCh/lYNNr1bLl0zXEQA+TmVl8PXu
         CZJuVvxoTLuBoPiOhiPa1EgRhoQPoAMkEpoLomQmyA/lFkn5VHE7iOiDku9nbudeCRo1
         6yNK7Y4EtYI645n7kOacfZNRb7yyKnYWK2S4oQWYkT7+PY1yp9JmGwLdbkTbXP9aqXJ5
         6J+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhFKLQX8sYBrvrE6Dwu1+mFTbFqTLXIjiQ+al+Ro3QLI9Uw7t2VhUojC3DsGdERhEb1LYCuLWnpoDPpzDUN68F@lists.infradead.org
X-Gm-Message-State: AFq9FYKSm9PGQ7ac/tKNAMq2Ex4xoJY7HAiLi3QYoomVaZBOakCF/exD
	dMJ/P3oXzym7LkLhloTUEw9QP9t1vS7w2kr5kkZmBM7cQ957XeaSUY+k
X-Gm-Gg: AYBFou0vc6Ff+ANviYanyF8sjcuupZCsf9cGpYB4/mytqMWXJ3mbeBqxIVlDHmrCsbe
	2pNgKNy5BMAbzedQKXUaXeaVh4AWD8bu4eoJOan7kFh4LzS2xdjMt+oHzjyN2tKZVACreHi21QR
	orYn6w9soGcEjeh7FoBu0jfA05osTaZkuFahp/5g3F/X/n+0P6BEkzSllsoLliFwF/nz9DgZaj2
	iKZ35PuVEg94g5hUxtN65/plBOx3hKShtAWedIVGoyoIvgjql4ZEVZumfjpE8lIRJRF/dkgRFF4
	Z0cH1GYcNA3ac8zkvKeydlksbkJorOWicncxYhvMN7lO5f5sPJ8qzaZtN+I+SeiZ3KU4elJdIUC
	L4hZ5XJyLTgWmzDZSHzTykURGLhIdbpsO+/N9QXjDqPExuVUwT6dbLLjStRQmCrLK/S4FYk3kxa
	1IOXA+fb4I4fB4rzZGlPiPrIeI/k8OM1saS4uszvIXcwMuMFDLl7qQUp43P5HPVA78AxarbQo6h
	u5Gi2k0B6UIYDiFp2jAbzAUxPSJKj2cmLxcq0ZNu0jWEgOMmF0c/ypgoXAVUXmtpqooXyU+4RdG
	GjVFUclJeXqJGTT9aFy+yMzKjtqpPFLWzQasLg==
X-Received: by 2002:a05:690e:e8b:b0:675:4269:156b with SMTP id 956f58d0204a3-679369e3642mr4947534d50.59.1791951024885;
        Tue, 13 Oct 2026 21:10:24 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986a16470sm592229d50.4.2026.10.13.21.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:10:24 -0700 (PDT)
Date: Wed, 14 Oct 2026 00:10:23 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org, 
 shiming.cheng@mediatek.com
Cc: davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 daniel.zahka@gmail.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 nbd@nbd.name, 
 dsahern@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, 
 steffen.klassert@secunet.com
Message-ID: <willemdebruijn.kernel.26605ed441a3a@gmail.com>
In-Reply-To: <179161428655.434549.7066789783316941855@kernel.org>
References: <20261009060319.6229-1-shiming.cheng@mediatek.com>
 <179161428655.434549.7066789783316941855@kernel.org>
Subject: Re: [PATCH] net: tcp: fix fraglist GRO flushing on alternating TCP
 PSH flag
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_211027_432238_F6792B5C 
X-CRM114-Status: GOOD (  40.48  )
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

netdev-bot+sashiko@ wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> =

> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
> =

> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchw=
ork
> know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> (one such reply per series is enough).
> =

> - [High] Forwarded TCP FIN/PSH can be dropped from the wire when a
>   fraglist GRO skb falls back to tcp_gso_segment()/skb_segment().
> - [High] FIN/PSH in a fraglist tail segment is invisible to netfilter,
>   conntrack, flowtable, tc and BPF, which all read only the aggregate's=
=E2=80=A6
> - [Medium] The commit message calls the removed check 'redundant' and
>   only discusses PSH.
> =

> --
> =

> net: tcp: fix fraglist GRO flushing on alternating TCP PSH flag
> =

> This patch removes the unmasked TCP flag word comparison from the is_fl=
ist
> branch of tcp_gro_receive(). Segments whose PSH/FIN flags differ from t=
he
> held packet can then be appended to a fraglist GRO skb. The goal is to =
stop
> premature flushes when a sender alternates [ACK] and [PSH, ACK] segment=
s
> in forwarding and tethering setups.
> =

> > This redundant check causes premature flushing on any incoming PSH pa=
cket,
> > shattering aggregation and increasing softirq overhead.
> =

> [ ... ]
> =

> > a single fraglist, and are safely flushed together upon encountering =
the
> > PSH flag at `out_check_final`, preserving the required TCP push seman=
tics.
> =

> [Severity: Medium]
> Is the removed check really redundant? Commit 8d95dc474f85 ("net: add c=
ode
> for TCP fraglist GRO") added it to the is_flist branch on purpose.
>
> The general path can mask FIN|PSH out of its first comparison only beca=
use
> it later ORs those flags into the held packet's header:
> =

>     tcp_flag_word(th2) |=3D flags & (TCP_FLAG_FIN | TCP_FLAG_PSH);

Indeed. PSH bits are important information and are expected to close
a context.
 =

> The is_flist branch jumps to out_check_final before it reaches that lin=
e.
> So the unmasked comparison was what kept every fraglist member's flags
> identical to the head's.
> =

> The removal also relaxes FIN, not only PSH. Data-carrying FIN segments,=

> such as the last segment of a response, can now join a fraglist. The
> commit message doesn't mention this.
> =

> The claim that push semantics are preserved seems to hold only when the=

> skb goes through skb_segment_list(). Could the commit message describe =
the
> FIN change and the cases raised in the comments on the diff below?
> =

> > diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> > index e74d99ca9face..54b40ec95a080 100644
> > --- a/net/ipv4/tcp_offload.c
> > +++ b/net/ipv4/tcp_offload.c
> > @@ -328,7 +328,6 @@ struct sk_buff *tcp_gro_receive(struct list_head =
*head, struct sk_buff *skb,
> >  	flush |=3D skb_cmp_decrypted(p, skb);
> >  =

> >  	if (unlikely(NAPI_GRO_CB(p)->is_flist)) {
> > -		flush |=3D (__force int)(flags ^ tcp_flag_word(th2));
> =

> [Severity: High]
> Can this drop a forwarded FIN or PSH from the wire?
> =

> Without this check, skb_gro_receive_list() links an in-sequence [PSH, A=
CK]
> or [FIN, ACK] data segment into the held skb's frag_list. The is_flist
> branch then jumps to out_check_final. That skips the only place where
> FIN/PSH reach the head header:
> =

>     tcp_flag_word(th2) |=3D flags & (TCP_FLAG_FIN | TCP_FLAG_PSH);
> =

> tcp4_gro_complete() and tcp6_gro_complete() return early for is_flist.
> The head can't carry FIN/PSH itself, because out_check_final would have=

> flushed it. So the head header has neither flag, while the last frag_li=
st
> member has them.
> =

> tcp4_gso_segment() uses __tcp4_gso_segment_list() only when the geometr=
y
> still matches and SKB_GSO_DODGY is clear:
> =

>     if ((skb_pagelen(skb) - th->doff * 4 =3D=3D skb_shinfo(skb)->gso_si=
ze) &&
>         !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
>         return __tcp4_gso_segment_list(skb, features);
> =

> Otherwise it falls back to tcp_gso_segment()->skb_segment(). That path
> copies head_skb's headers, TCP flags included, into every segment.
> =

> tcp_gso_segment() then clears fin/psh on every segment except the last:=

> =

>     while (skb->next) {
>         th->fin =3D th->psh =3D 0;
> =

> The last segment keeps the head's flags, which never had FIN/PSH.
> tcp6_gso_segment() has the same fallback.
> =

> These can trigger the fallback on forwarded traffic:
> =

>   bpf_skb_proto_4_to_6() and bpf_skb_proto_6_to_4(), reached through
>   bpf_skb_change_proto() (for example CLAT/464xlat when tethering), set=

>   SKB_GSO_DODGY on GSO skbs.
> =

>   bpf_skb_net_grow() and bpf_skb_net_shrink() set SKB_GSO_DODGY.
>   bpf_skb_net_grow() can also linearize frag_list skbs when
>   BPF_F_ADJ_ROOM_FIXED_GSO is not set.
> =

>   Any pull or linearize that changes the geometry has the same effect,
>   for example skb_ensure_writable(skb, skb->len) in NAT mangling.
> =

> In those cases the receiver doesn't get the FIN until the sender
> retransmits it, and PSH is silently cleared.
> =

> A fraglist skb redirected to a local TCP socket after GRO (DNAT/TPROXY)=
 is
> also parsed from the head header only. TCP has nothing like UDP's
> local-delivery fraglist handling, so the FIN would be missed there too.=

> =

> ORing the tail's flags into th2 in the is_flist branch doesn't seem to =
fix
> this. skb_segment_list() emits the head skb with its own TCP header, so=
 the
> first segment would then carry a spurious FIN/PSH.
> =

> [Severity: High]
> Does this also hide the tail's FIN/PSH from netfilter, conntrack,
> flowtable, tc and BPF? All of these read only the aggregate's head head=
er
> before segmentation.
> =

> In conntrack, get_conntrack_index() only checks the head's tcph->fin, s=
o
> the FIN transition never fires. tcp_in_window() computes:
> =

>     end =3D segment_seq_plus_len(seq, skb->len, dataoff, tcph);
> =

> skb->len covers all of the fraglist payload. The +1 for FIN is missing,=

> because tcph is the head header. The peer's ACK of the FIN then hits:
> =

>     if (!before(sack, receiver->td_end + 1))
>         return nf_tcp_store_invalid(ct, sender, log, NFCT_TCP_INVALID,
>                                     NF_TCP_LOG_ACK_OVER, receiver->td_e=
nd + 1);
> =

> That ACK is classified invalid, and so are the peer's own FIN and the
> final ACK. A typical "ct state invalid drop" rule would then drop the
> teardown packets. Without such a rule, the entry stays ESTABLISHED inst=
ead
> of moving to FIN_WAIT/CLOSE_WAIT.
> =

> In the flowtable, nf_flow_state_check() reads fin/rst only from the hea=
d
> header, so NF_FLOW_CLOSING is never set for the offloaded flow.
> =

> tcp_mt() in xt_tcpudp and the nft tcp flags match also read only the he=
ad
> header, so a FORWARD rule that matches FIN or PSH won't fire.
> skb_segment_list() copies only the MAC header from the head and keeps e=
ach
> member's own TCP header. The FIN/PSH therefore still goes out on the wi=
re
> and bypasses that policy.
> =

> Before this patch, the unmasked comparison guaranteed that the head hea=
der
> described every member of the fraglist.
> =

> [ ... ]
> =

> -- =

> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/pat=
chset/20261009060319.6229-1-shiming.cheng%40mediatek.com



