Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC91C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE+lFIM3UFlIMDzXhXPT065cUaDU4oEMPdyY1ZBUy+g=; b=j5ThXbbI64bQKdj6Gqy/4CyBwV
	wigju5i5LR4OASJY9bZxriDMgYvghEmwq3ZUOi9PN5e6sstTo4qDLQVnHbBOU6WDmevdHDpQMwhWY
	lx5/SfyMuRjAK/AEFvcniCqL4dEGmnUlI9piCzXUywrny3Du8vkYpIiJnyLJgGlUWdGlIW2zN+s6F
	GU/pA/ZIfGZSftqkC1gL41JSfhJRZugX0ZMQjb1hyu7emH0XeG7HzYiHt7RjUnrG3klHo86NTd1Wo
	m40l+sNHJLKSCOJ7MF9n3qafixVbxnjvCVhbb+t4Lz11SPJlRBZNRZkDlUUslrVE2GRzFKg0DN/bH
	idEqETXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquWL-0000000HWRK-3bOo;
	Mon, 03 Aug 2026 15:24:05 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquWJ-0000000HWPn-0xVe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:24:04 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81f52945098so165007b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785770641; x=1786375441; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sE+lFIM3UFlIMDzXhXPT065cUaDU4oEMPdyY1ZBUy+g=;
        b=rGGvaArDdW4PbiKt9F1lFb9g/aTDSnoI7m9A2XG9fA9MMSfG+2qAHpTGkQUl1c92N3
         RZS4lT1dztvYR/cHhFceWPQ7T2dUD10ejzUWoNW6RYUBjBq2kTrXsehf/bhoznwI6ibl
         Qjq4HDYCA2kfW/BRkHAuZkQ/FDTV/Q4+MWETeTj4HBjL+SBTpNLnfTJ6pgeHC0/FIK2H
         zQJkYE+9+lqnexXaF8fsSqsJgvjIrTxuygQiZH4bBNLCn9SZVf0TevxiaRmhjraI0mCF
         /rQ4pLXVBavqkGIhQUNcuLkQma3tlWz6lw+MClP4wiHc8SOCb6p01diFuz/bQ/PcH6ns
         Ixrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770641; x=1786375441;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sE+lFIM3UFlIMDzXhXPT065cUaDU4oEMPdyY1ZBUy+g=;
        b=XPUdKmRE1xg+q+MfTMg02vE8Agm1L1sXqTYzgOGENEpLQXhIZF9cmCA9yK6tuLZXQ5
         6h8S5H63mzfx/Yd/Zv4+BrkkXp2ysIkTN8mcOKN+HZsgoKCXlqJz7zBcKjjgGxyNRJFY
         scBj96qIH8M6o1mSrcJocChk7SBbiPL9zJi4YRsmjrKVgUetWXxoVYmHir3zZXi8w8z7
         nJivjvwHhxiSbC+ohCQDAFcADWJxZ7p9xOTl3aQyEqBD3yWC1wT1ejQfULsJLLUte4I4
         WGGZXWs7ptO1/MfTdNThGU0x3dntYcOHsebHBm3mbl69WpBlrCl5r1dCG/uAR8PbvZ/t
         bS/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpT110uKBydyE8Qj7lF1BOvv7reGoCxSDwpRh1q+a9pTS5Id3+RjQZviiuHZYKr9VHjhjmBKdb6Ga+QYe5rHce8@lists.infradead.org
X-Gm-Message-State: AOJu0YxksNkUoOPfycsSKrkaIt3FYoefNdQ0L3kOoWGkoMKpjAaC0b6U
	EkY+GxpPPK788/clcKW+bvkEujhrCAg8G6oI3rOwmWVUm5jVDXJPwV8q
X-Gm-Gg: AR+sD13obw1AoH9mC8xuWcrQZe94KESYr9VOnfunhzCzBW1cQK5bsCcK5Dyopwiya7a
	gJrWyymHpJrJZDFzOyj3UjgHCB2I5fi4H+y7z8CHOoX6UfjZX9PJjV4OGQM8uw4/UIeS2aXHB8G
	o0RULNoy8Pw6jhh0A/nofCxcydXwf3YnLFbWJlFFSOYndL+TKhU22mAtaptQP5ouG8P54o/qaum
	hFKi71OSXm9en+d2w8aoFSkFWi8qkSSKGb+3T2LGmBzc8pl1sd2dwVcCEsbIjKo20MSfXLjWvke
	QKAJKDDBqswrmZRLKZJ4anEGnr7zThLNFfvh9i/cl4J/idMbuq3+Rlwq8+D3LNr6r86XhAdfWuT
	pbmkVZdTB1q4w9zIOS38s5ZlbE8na3QXb3ScZYM8Dq72a0TDN85myJlQDdWiTKgXeC9nfuqFOqH
	gVZuGHbIrSp2rfoTad5eAhJncRuvhGCJ1fZQX+wV74d5tPCRfK0mVaxxZ4BWOeICzmmvnYxgq3Y
	tu6UBrYSxLTWx6Er2Woru1S1y8gHmaZugYFallIEgTvEiM=
X-Received: by 2002:a05:690c:6701:b0:81e:abe2:e022 with SMTP id 00721157ae682-81fd4d6e458mr131027997b3.5.1785770641326;
        Mon, 03 Aug 2026 08:24:01 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d5ec2sm56116767b3.23.2026.08.03.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:24:00 -0700 (PDT)
Date: Mon, 03 Aug 2026 11:24:00 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "willemb@google.com" <willemb@google.com>, 
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>
Cc: "kuniyu@google.com" <kuniyu@google.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
 "steffen.klassert@secunet.com" <steffen.klassert@secunet.com>, 
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
 "horms@kernel.org" <horms@kernel.org>, 
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
 =?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 "sd@queasysnail.net" <sd@queasysnail.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "ncardwell@google.com" <ncardwell@google.com>
Message-ID: <willemdebruijn.kernel.104ee0d69507c@gmail.com>
In-Reply-To: <c84c9f4bd495977e08ee38343282f05f42b080fb.camel@mediatek.com>
References: <20260723091601.72103-1-zhaoping.shu@mediatek.com>
 <20260723063935.75bf55e3@kernel.org>
 <CA+FuTSfgBbPkdLanqEgbDq-jLVQJax4fUxQ-tuzTuFwQANwxBA@mail.gmail.com>
 <0f5668da79eb9a13dfdb9c97c7d71c5153b3a48f.camel@mediatek.com>
 <willemdebruijn.kernel.1758c8f19209@gmail.com>
 <c84c9f4bd495977e08ee38343282f05f42b080fb.camel@mediatek.com>
Subject: Re: [PATCH net v2] net: gro: avoid nesting TCP GSO skbs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_082403_282959_14795407 
X-CRM114-Status: GOOD (  49.88  )
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

Zhaoping Shu (=E8=88=92=E5=8F=AC=E5=B9=B3) wrote:
> On Wed, 2026-07-29 at 14:57 -0400, Willem de Bruijn wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > =

> > =

> > Zhaoping Shu (=E8=88=92=E5=8F=AC=E5=B9=B3) wrote:
> > > On Thu, 2026-07-23 at 16:02 +0200, Willem de Bruijn wrote:
> > > > On Thu, Jul 23, 2026 at 3:39=E2=80=AFPM Jakub Kicinski <kuba@kern=
el.org>
> > > > wrote:
> > > > > =

> > > > > On Thu, 23 Jul 2026 17:16:01 +0800 zhaoping.shu@mediatek.com
> > > > > wrote:
> > > > > > From: HW He <hw.he@mediatek.com>
> > > > > > =

> > > > > > On devices that support both NETIF_F_GRO_HW and
> > > > > > NETIF_F_GRO_FRAGLIST,
> > > > > =

> > > > > "devices that support FRAGLIST"? Isn't it a software feature?
> > > =

> > > Sorry for not making it clear. The test environment is:
> > > device supports GRO_HW, and enable NETIF_F_GRO_FRAGLIST in
> > > driver.
> > > =

> > > > > =

> > > > > > the hardware or driver may deliver packets that have already
> > > > > > been
> > > > > =

> > > > > If you have a driver in mind please name it.
> > > > > =

> > > > > > aggregated into a TCP GSO skb with frags[]. GRO may then
> > > > > > aggregate the skb again in skb_gro_receive_list().
> > > > > > =

> > > > > > This can create a nested GSO skb, which is not handled
> > > > > > correctly
> > > > > > by the
> > > > > > later GSO segmentation paths. When the skb is segmented by
> > > > > > skb_segment_list(), it not be fully restored to the original
> > > > > > packets.
> > > > > > =

> > > > > > Avoid this by setting NAPI_GRO_CB(skb)->flush for GSO skbs
> > > > > > before
> > > > > > aggregation.
> > > > > =

> > > > > I don't think we can do this. For GRO_HW devices re-aggregating=

> > > > > in SW is quite helpful, HW often runs out of contexts or times
> > > > > out too soon, generating skbs with 16kB..32kB of data, the SW
> > > > > can help bring it up to full TSO.
> > > =

> > > I'll try to explain this issue below.
> > > =

> > > > =

> > > > Also, after e751256486d0 ("net: gro: fix double aggregation of
> > > > flush-marked skbs"), it's not clear an another bug remains.
> > > > =

> > > > If it is: as said "nested GRO" of hw + sw GRO is intentional,
> > > > e.g.,
> > > > for BIG-TCP.
> > > > =

> > > > But it may not be anticipated for skb_gro_receive_list. One
> > > > option
> > > > would be to skip the fraglist GSO optimization for such packets.
> > > > =

> > > > First I'd like to understand better what exact bug remains.
> > > =

> > > I agree that re-aggregation is useful for improving GRO efficiency.=

> > > =

> > > However, as a general rule, a GSO skb must be segment back to the
> > > exact original packets stream. In tethering test,
> > > skb_segment_list()
> > > cannot correctly segment a nested GSO skb produced by this path.
> > =

> > So the specific issue is a driver that builds a regular (HW) GSO
> > packet followed by software GSO that uses fraglist?
> > =

> > Then I see three paths to fixing this
> > =

> > 1. decline to further apply SW GRO if skb is GSO and in fraglist mode=

> > 2. if in fraglist mode, further apply SW GRO, but do not use fraglist=

> > 3. in skb_segment_list detect this case and fall back onto
> >    skb_segment
> > =

> > We already apply option 3 to various cases where skb_segment_list
> > cannot handle complex use-cases of fraglist.
> > =

> > This patch chooses option 1, which is fine. Alternatively it could
> > fall through to the regular skb_gro_receive path below.
> > =

> =

> Thanks for the feedback.
>  =

> Patch (option 1) is a minimal fix for the reported issue.

And that would be sufficient.
  =

> For the other options, my initial thought is to handle this in
> tcp4_check_fraglist_gro()/tcp6_check_fraglist_gro(): if the netdev
> has both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST enabled, do not set
> NAPI_GRO_CB(skb)->is_flist, so that this tethering/forwarding case
> can keep using SW GRO and fall through to the regular skb_gro_receive()=

> path instead of skb_gro_receive_list().

Yes, that sounds good. And then the above option 1 is not needed.

No HW-GRO implementation generates fraglist GRO packets, so the two
are fundamentally at odds anyway.

Ignoring the fraglist hint for HW-GRO skbs sounds good to me, thanks.
  =

> If that direction makes sense, I can work on it,
> or send a follow-up patch to fix the reported issue with option 1.
> =

> > > This issue can reproduce in the following scenario:
> > > 1.Driver submits a single TCP packet, P1. P1 is kept in the
> > > gro_list as the first packet.
> > > =

> > > 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> > > multiple TCP packets by HW_GRO, and its non-linear data is stored
> > > in
> > > frags[].
> > > =

> > > 3. P1 and P2 match the GRO rules, and since there is no local
> > > socket,
> > > they are aggregated by skb_gro_receive_list(). The resulting skb,
> > > P3, has a frag_list entry that still contains frags[]:
> > > P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
> > >                                     [ frag[1] ]
> > >                                     [ frag[2] ]
> > >                                     ...
> > > =

> > > 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> > > skb_segment_list() to segment P3. However, skb_segment_list() only
> > > segments the entries in frag_list. It does not segment the frags[]
> > > inside P2, so P3 is not restored to the original packets, which
> > > leads
> > > to IP fragmentation or packet drop in the following path.
> > > =

> > > The patch only prevents that nested case before
> > > skb_gro_receive_list()
> > > aggregation. It does not affect packets that are re-aggregated by
> > > skb_gro_receive().
> > =

> > Thanks for the detailed explanation.
> > =

> > =

> =




