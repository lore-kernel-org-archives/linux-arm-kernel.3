Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6E8C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=; b=G70kyYjcU0yjpjCPP9CRe8AoQA
	yLn8hX5eTBCFYx7XTMoYBI6nC18dCHD7giEV81TnX398NFlBx5AszdfgzRA7f7yOZ5ZRvYnHMJbVH
	YAOKgSXbiL+U+Fzx7aKnQezbW/jfcPu9UTmW9lJ3RupqZparyu0XxWa+1qmddyngHZPDJc4WEv35g
	pcDAP/i7eSlA9Kv8uacRUL9DlxHYk9VDB4DmA9YIf34EMxOmrIL8dIHLx2+2D2MZmXNOeNKgu+cYf
	6Z+R5rFNV02H6UXsNEtKfDbJ+NItXQ+AVub75wI3N4Hqg3jDXCJHMCfwoNwupr/Em1ADuRzoQCceG
	Jg8F5abQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY6Q-000000018bP-0285;
	Thu, 13 Aug 2026 16:16:22 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY6N-000000018ab-1zKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:16:21 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbeeaac53a9so1865800a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786637779; cv=none;
        d=google.com; s=arc-20260327;
        b=SThY+L3NLrS8cP6s6EP4KAq7qPWf+Mz7MimaXnmE6KppOqvK+oT6vBPmwY1QplmN4N
         toprB7AYakd3ZWczlUJ/c3Uq/lt1tjMqkhTBjeRRL7RqnPWfu/VMvombKMzXNrez+o33
         m2xY/+LbFXOyWplMqhRXYq3V1xz6fwYfoDO4ZQezmxBl2FU8L41b/qL1gnhC44gaHvQa
         L3X1xtgjG13JqBiDKhu06UAsgIAFl9hRnZWJONgdKRbQNXVsa2QOulYna+5N0/j7zx8d
         TBPAbuhXs8bfnhJMzmDonbr067nueuW2JuD8g9Gdb6or/gUA8hcxCaGOGVl/hycuEeKK
         7VqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=;
        fh=VIRpuwqACd0zSMEsDH6mVZjJoxan5cTYSImza7h7wDs=;
        b=Jqn5s1MJC0P55CGMJP+pXDh/HrxUqoTQnV5qerYLXwVqFKLGUcOZ/ooTGLT6adara6
         QHJ7Lu0ZKfBXWjfzHKJR6/fjaqA9W5f3SYo7M5Y6S8E73Ktxx6UpXejO3XyccgrKBBDY
         2J9AfZzLwi5V39bxFfrgvzM6nVjfv0k11wM7bCj2Wqepr2ZIVDq8hDGyEo6dDNkh8cOI
         CfS+maHmi+UsB1xOH2HpzbnmFBSoYzHG6tJS5kKBFLEZ1wSAJJAFH9RQFPnJz+yNvPet
         r8dPyjViay0dgmSfirV3FTHu/fTUNL1zvyFXSao0cuh9gSYTCsFB9a8qSt6tjdDllEo0
         wjDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637779; x=1787242579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=;
        b=rs5AylSHtL3wivoZjY4HnbHRSr+p5ZmMgF1DDMl+/8Uk0y1NtLLxH+Lo+mtPb4xqGV
         pLEGYZurnqjxKXUqGFTBevx1Z/Kl2nCkDXjSJAfo7ix2z4PWsj9x9iP35edLfXvUNSIv
         NiSFXPlZ3JeZJcyxonKCbJqE6i2sgAjOR1zDEC5Mk7w6CNpUi8GSXTR5tvfnD7LznM9e
         BULaIIpo5qLm6xKM71FzSZd6bSOVQmFVwgeTDNBSYil+s6FbvVqAv9BwmsDWFT735LVP
         Jkn38fXZaDqO4gP+/PyPFugPw1qIz7l1+rqKbyONcL51ctTyan46Zn06iKC/IaXJz52f
         rdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637779; x=1787242579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=;
        b=NK11gcydyvKLCVHVMEKAS/CfEWkGcYqjsxERWtncxU5Fl7T8YwLcnx8QQTBoLi2Egs
         IfFQoMtRPENCtW1QqovCHJaCCpHUt/lL3on/2JY5YOpMRo68cIAvVH6KujiL+7qkyfZ5
         3mNbL3ItlqJ0gBls9tksrUfJcQMwlFelTaj4m6FhpwLV2EmrXLJ3BdpMKdCWTp2kbT6S
         0wwzyo2hdBaEwWphZN7WEesG2mnM/bkn5lLGtF3IzFD3hO9l0zzLQMZY0zMUMgKiuwk1
         6OqPOkkSPLQKIaUXsSLyOmj4KHmzKGSpVXAZ0nNDHeMTlqbJxkmAOxYIRgxqOz0OhX/U
         bnug==
X-Forwarded-Encrypted: i=1; AHgh+RpXNDZuwnH0x7IyesFBgk87pjd8ojgI1AZ9G/jN2wjOUAZuMD5eD+oc6h8Wl/mycT6uUKA9avV35suw6rE7jjzh@lists.infradead.org
X-Gm-Message-State: AOJu0YzcFsnGWtjnuHieq3Y+S3T0tqqKPfSl/eLNBkPB5XhixngwicYV
	d2z2TXSdvWTD1n4pFyZetYW9Ofpbgg7zmTsG6F4ZZE4cVQ+U8Hu4SgU2jQ1HcQjJTuCLNZLwZ/U
	JDKpcEamnBWv7lOlW4hJB4IQEpO20oSw=
X-Gm-Gg: AR+sD13Czjsth+Wtau4pmFdHxx7B0TEQXQUqcm06BnHJzridQbV3McL3JuRNIxeaJpc
	oUHo3QCWj0uklLN1Sc2iVqc8uLTRrMLd5cj6K/2qn0+wJKQfpcFLF9xujrI6R+7Yr4vq3Wgnl24
	FvRHH0kuan3/fOULemukXKI8OEX1aNe4B18SqvKUzeKHInlYzaQr4K3Tz/gX8uAwy+N70esfikw
	vwimR9OyPfgtH+WXccIAYDgCU5hcCOhbciT5cIpiEjFF8UkXCrF91zQhy41cibQ/AetiiufOJBv
	sB3sWGToU3Dbxq4OL4YplYON7/4ZXW6bgKWsoWflQid18J+OIqa/lVIoHL9SxLhVU90XAUVDt/s
	/5+g=
X-Received: by 2002:a05:6a00:94f8:b0:848:4754:28e4 with SMTP id
 d2e1a72fcca58-84fc6dd20d5mr7964377b3a.15.1786637778230; Thu, 13 Aug 2026
 09:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
 <willemdebruijn.kernel.1372b82f50882@gmail.com> <0e1f71c4417099399eda78fd2a082b2444e42af9.camel@mediatek.com>
In-Reply-To: <0e1f71c4417099399eda78fd2a082b2444e42af9.camel@mediatek.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 13 Aug 2026 12:15:40 -0400
X-Gm-Features: AUfX_mznkHuU-cF144mVumH8tZacn1_Y1N_Jk90APs0ZCVnzLy3r3jqX6yEARUw
Message-ID: <CAF=yD-+AF1aW5D5H_QPKE1yxyU2wLxOmT8c2Fm4CJsPY=BjW-g@mail.gmail.com>
Subject: Re: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"sd@queasysnail.net" <sd@queasysnail.net>, "imv4bel@gmail.com" <imv4bel@gmail.com>, 
	"alice@isovalent.com" <alice@isovalent.com>, 
	"eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
	"horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, 
	"willemb@google.com" <willemb@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"kuniyu@google.com" <kuniyu@google.com>, "ncardwell@google.com" <ncardwell@google.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	=?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	=?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091619_569159_1B36450E 
X-CRM114-Status: GOOD (  41.98  )
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

On Thu, Aug 13, 2026 at 4:40=E2=80=AFAM Zhaoping Shu (=E8=88=92=E5=8F=AC=E5=
=B9=B3)
<Zhaoping.Shu@mediatek.com> wrote:
>
> On Wed, 2026-08-12 at 22:29 -0400, Willem de Bruijn wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > zhaoping.shu@ wrote:
> > > From: HW He <hw.he@mediatek.com>
> > >
> > > A device supports GRO_HW, and the device driver enables the
> > > NETIF_F_GRO_FRAGLIST feature. During a tethering test,
> > > skb_gro_receive_list() reaggregates the GSO packet. However,
> > > skb_segment_list() cannot segment this packet back into
> > > the original packets, which leads to IP fragmentation or packet
> > > drop.
> > >
> > > Scenario (Tethering/Forwarding):
> > > 1.Driver submits a single TCP packet, P1. P1 is kept in the
> > > gro_list as the first packet.
> > >
> > > 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> > > multiple TCP packets by HW_GRO, and its non-linear data is stored
> > > in
> > > frags[].
> > >
> > > 3. P1 and P2 match the GRO rules, and since there is no local
> > > socket,
> > > they are aggregated by skb_gro_receive_list(). The resulting skb,
> > > P3, has a frag_list entry that still contains frags[]:
> > > P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
> > >                                     [ frag[1] ]
> > >                                     [ frag[2] ]
> > >                                     ...
> > > 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> > > skb_segment_list() to segment P3. However, skb_segment_list() only
> > > segments the entries in frag_list. It does not segment the frags[]
> > > inside P2, so P3 is not restored to the original packets, which
> > > leads
> > > to IP fragmentation or packet drop in the following path.
> > >
> > > When NETIF_F_GRO_HW is enabled, do not set NAPI_GRO_CB(skb)-
> > > >is_flist.
> > > Fall through to the regular skb_gro_receive() path instead of
> > > skb_gro_receive_list().
> > >
> > > Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> > > Signed-off-by: HW He <hw.he@mediatek.com>
> > > Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> > > ---
> > > [2]:
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/147060=
32__;!!CTRNKA9wMg0ARbw!kigb147-G9EgNqdWMhaQ43udYOvN90SG6bVjeM-GxTsPo3E07_tb=
ysuoEieszr5CbCqT94AYpt1b_M7VsgNaZcjtBS_AnYo$
> > > [1]:
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/147022=
09__;!!CTRNKA9wMg0ARbw!kigb147-G9EgNqdWMhaQ43udYOvN90SG6bVjeM-GxTsPo3E07_tb=
ysuoEieszr5CbCqT94AYpt1b_M7VsgNaZcjtu0bQPNI$
> > > ---
> > >  net/ipv4/tcp_offload.c   | 7 +++----
> > >  net/ipv6/tcpv6_offload.c | 3 ++-
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> > > index 3b1fdcd3cb29..641c47fb1ea2 100644
> > > --- a/net/ipv4/tcp_offload.c
> > > +++ b/net/ipv4/tcp_offload.c
> > > @@ -395,9 +395,6 @@ static void tcp4_check_fraglist_gro(struct
> > > list_head *head, struct sk_buff *skb,
> > >       struct net *net;
> > >       int iif, sdif;
> > >
> > > -     if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> > > -             return;
> > > -
> >
> > Interesting that ipv4 and ipv6 diverge here. Nice to try to make them
> > more alike.
> >
> > >       p =3D tcp_gro_lookup(head, th);
> > >       if (p) {
> > >               NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)-
> > > >is_flist;
> > > @@ -430,7 +427,9 @@ struct sk_buff *tcp4_gro_receive(struct
> > > list_head *head, struct sk_buff *skb)
> > >       if (!th)
> > >               goto flush;
> > >
> > > -     tcp4_check_fraglist_gro(head, skb, th);
> > > +     if (unlikely((skb->dev->features & NETIF_F_GRO_FRAGLIST) &&
> > > +                  !(skb->dev->features & NETIF_F_GRO_HW)))
> >
> > Would it be better to test skb_is_gso(skb) and only skip fraglist GRO
> > for HW-GRO skbs, rather than disabling it for all skbs?
>
> Yes, for tethering packets, HW-GRO skbs are aggregated by
> skb_gro_receive(), while others go through fraglist GRO. However, care
> must be taken to avoid packets arriving out of order. I will work on
> it and submit V4.

Oh right.

As long as the choice is only between fraglist GRO or not fraglist
(rather than GRO or bypass GRO), it should not introduce any new
reordering concerns.

But the decision cannot be made based on skb_is_gso(skb) of an
arriving skb. Because when such a HW-GRO skb arrives a SW GRO context
in fraglist mode may already have been opened, and it is too late to
convert that to non-fraglist.

So essentially HW-GRO and fraglist are mutually exclusive.

> >
> > If treating the features as mutually exclusive, another option would
> > be to replace these datapath checks with disabling one at
> > configuration
> > time, in netdev_fix_features.
> >
> If V4 work well, there will be no need to check netdev->features.
> Linux kernel GRO will be more robust and able to handle scenarios
> where both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST are enabled.

What is your plan for v4?

