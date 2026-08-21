Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F5C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=; b=M/0hSB7cB7DVsv4oPd8/nIjZaV
	LRrgfGuo6wjOwVdWonX8pU6cYlaVb3ih3+cMtoXAgpJaSX+5E/ZkdSB957q8kwH2iGsyLQl3eo70p
	lc5uF729MNLaN/6o3AhU4DfGDIBYA/Ol26KVMPwGhOBdk/4PA1pE9PZ7B5bXCM/D96GnjiQ5uPQZX
	KnY4LF0HP+ONp9crYvLJ63XpXnMD4Jni1JAQszZXBDTi026w46sU5yoFb9jIOI8Lr8W6Cm/KLeeKT
	veZTe8D2zVP+YHcpkpy6UKemHgrVyC6qDdiWsIF9ZZpDvHfi2zZx5bHQ87bc2mW6RwuaVD7zr9pfM
	+KfgtAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQss-0000000DdGG-2NgF;
	Fri, 21 Aug 2026 15:10:18 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQsp-0000000DdED-0KSZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:10:16 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66ce4a63e17so1258736d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 08:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787325011; cv=none;
        d=google.com; s=arc-20260327;
        b=U1cHPXH/l48dRYBSmXnG6CJ9gJFa3L7ZCQK25NiA3hYwq+X2QrUG3nOR8aUq7nGMoD
         CYqp2yB3fi+Gu9VN/yzxk93PvHgaHae3ibWG0okJsmXkLF+pqgWvUflO8olhcqPg3wWT
         UYpm4fuqN7EY6JmNPqJPXiHZ8FS4GXFZ2o4XCSDscBLEsOHglfMyLSijokqLnsbuGa8q
         /drMAbUj9l4FDzrRijAERS/5VNVsXksd4bhIBN4minQLoEYbq8YuCuUemqHG0n0IxUQU
         O2s1W+Vl+4Wbc9CjHF2YoLFTPxRVozjjXD/9n2YbIchAMEKWG0WXFwyTtw5vLQLK4XDs
         fw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=;
        fh=dOtxxkxqWAP0KXEF2RIQfMsN+oQL/4OCGHNm7vad/Qk=;
        b=SG/OcpQIbXeO/h0blW5WSL7zYG88OVqeLOWwc9KjEnA88uJnHDDIscBJg/G27zif71
         lVPeGQMZ9G/qFr4GpEEtxNT2eg2XHciFFQ9aNsL5mjxjpXAhYrGXgZ0dL8mOYzGJd9g3
         kgbOdH+gTrc6h7JiZQPsijTtzJkBHcUfuI8WYMKebNXcvBPAx/ho2Z7HW8YppnPej4j1
         UmB3fH3wIOWARqB1zrEHiLxIB27EEGWqD/cc7xl1dc3ut+fTR9U0ASkZLSlD8kOZ5/QP
         W3Axxc4rfs2Ly41ynFFN/D17d2EMl4+yG4fVB48OMlnzP1Gxffi2bu3dEgY5DH2WhDgS
         LAOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325011; x=1787929811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=;
        b=T5W12H3JrM2GotFkd7Yrt5rON8quLtzcoxl2mIU4lW0aKiJSc8nwqTc4atXZ6AlSSh
         fJ2ougAo1E2OPqXD3H69QUmVC/SX8bt+uD8axHPnbM+A31aGIo3WiutqJRu0Fmg2s2ki
         KugHdkZKjm+I7UzBkiRGnCeBm6sLbOnL4Km4b7vsVm0GXh6ZgVsWJF3ZixxDkqqS3+vV
         T70FK7SOb6a3n0UzKUeozqLhjBysPgDkEV3i4BkQ9dsY4XdzAvhGqXv7Hl5ImZOPlReW
         FqZn4pIxivhklayb0NSi1AkEYdVqKirr3nezWKX+z5ZaRScZk1BbWgBlGjBXwXUGu1P5
         Aokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325011; x=1787929811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=;
        b=j6HDa8v86grrI5aF2Iv4/91WizoIcGwr/e1prYn+zE9M83kttdeuWb0e7fpTjBl5mV
         P/IiApnzWuPdeTC8qZ4n29whx/21k0B9hx1hjVHuZIXyEqwuvR4PlgQWkifsuwRFi+Ci
         C1Q8q87MdPmXaaFfhpwQ+bSi6GMNWsdA514b0SiqfJmq7b5Zd5MV45i69f05wrPkzio0
         Gr/DMQHEcUfiQb/yLy2WWXQ5zNn41l3AgU/yL5QnVpc/2HN0qgd6A2sMb6cDgp1hWxby
         Ox/ZzZCEbEh63Ynj5H5eBYEbWey6vurYfyJ8ZVnUt5x8cQboX4qpxePeFC59GAq+r+oG
         J43A==
X-Forwarded-Encrypted: i=1; AHgh+RpbK+ujx0J0xNO1lEJ1ma0XhYNHmuCdBLTdAtDVsKq6HgHgKWe+n7O7ZFti0lamBLOFU11LJ4HzWTr/c0JeYZqS@lists.infradead.org
X-Gm-Message-State: AFuF++nXYnksvHbz4KNmqRxsP4yG+bDBmZ1R4dpbRZ+f5gygdLNVULR9
	qXevkhj3Z5bsXnB0glS4k7Qor3gjVplE0QrF0HbcpWUnG26pFzZBXvHtnwpjSxTEDYqo1y05nZF
	xp1MjUGaefrnInHjvcrWJpw51ynvyZ6E=
X-Gm-Gg: AR+sD10BNATLdCmO8flYb+ZMbEx4pMcFVh9CvfotT2tuh4KJPHDRzbUxj80Ubs1kzhP
	hgsfABXWDutnHPZqCnfLIOSBt6ipZPt8MQywsalBWBLSgf6uBqfbKHNtrgntykTfodWRdHdNhjJ
	I/HyPq8cqGd5FvcXyQ/+K4GQ8cCkkjhJuf/rNwmaUpVOYS1u5uVEC/ml2RuSF+XPAqmvLP9/SWC
	eXP4d7x7Yxdy0uN9xpnGrOEeBYyi3jF8Uf00JmEEnylRp81l4Gix7z9x2bCEYhZscMaweL4FdPd
	8tG+UEcRM3YiB7rKfnytlIARm3nJJ31aLWcv5jZ/fNsvmRq/ms9hJPYxTZjLhl+3U29N9D//ROW
	oK7U=
X-Received: by 2002:a53:dccc:0:b0:66b:ee21:4852 with SMTP id
 956f58d0204a3-66ce4a1321amr1957781d50.13.1787325010568; Fri, 21 Aug 2026
 08:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260819093226.193385-1-zhaoping.shu@mediatek.com>
 <CAF=yD-Lx7aHQEr6MN7D8LBp9ctZz3B3dmfsyhLbPxWaiK1UBzw@mail.gmail.com> <ef026015528638cb69404f22976479515251e4d5.camel@mediatek.com>
In-Reply-To: <ef026015528638cb69404f22976479515251e4d5.camel@mediatek.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Fri, 21 Aug 2026 11:09:33 -0400
X-Gm-Features: AcwNN1WIhUj4DkwKagzxOfTG0D1RVHOFkdHA6O1sbDTgVBzQt97XErr-O1wBuek
Message-ID: <CAF=yD-JOVSLoasxQHnRE-mvS_oQZ7f=wHeCc7nxBgw2g_4-C8g@mail.gmail.com>
Subject: Re: [PATCH net v4] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"dsahern@kernel.org" <dsahern@kernel.org>, =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	"horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, 
	"willemb@google.com" <willemb@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"kuniyu@google.com" <kuniyu@google.com>, "ncardwell@google.com" <ncardwell@google.com>, 
	=?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_081015_126003_A17B41A1 
X-CRM114-Status: GOOD (  28.74  )
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

> > > @@ -395,12 +396,20 @@ static void tcp4_check_fraglist_gro(struct
> > > list_head *head, struct sk_buff *skb,
> > >         struct net *net;
> > >         int iif, sdif;
> > >
> > > -       if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> > > -               return;
> > > -
> > >         p =3D tcp_gro_lookup(head, th);
> > >         if (p) {
> > > -               NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)-
> > > >is_flist;
> > > +               /* flist GRO applies to consecutive non-GSO skbs */
> > > +               if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist)
> > > {
> > > +                       NAPI_GRO_CB(skb)->is_flist =3D
> > > NAPI_GRO_CB(p)->is_flist;
> > > +                       return;
> > > +               }
> > > +
> > > +               /* Fall back to the regular GRO path */
> > > +               if (NAPI_GRO_CB(p)->count =3D=3D 1)
> > > +                       NAPI_GRO_CB(p)->is_flist =3D 0;
> > > +
> > > +               NAPI_GRO_CB(skb)->is_flist =3D 0;
> > > +
> >
> > This reduces the chance to have to flush, by downgrading fraglist GRO
> > packets if a hardware GRO packet is detected at the stage (count =3D=3D
> > 1)
> > where fraglist is not enabled in practice.
> >
> > This is quite a bit of complexity. And if hardware GRO is enabled,
> > what
> > are the odds in practice that the device does not produce any
> > hardware
> > GRO packets, yet the software GRO stack is capable of assembling
> > signficant GSO packets. I suspect low.
> >
> > The solution is technically correct. But would simply disabling
> > fraglist
> > GRO when hardware GRO is enabled not be simpler? Or only keeping
> > the flush and avoiding this micro-optimization.
>
> In V2, for the tethering scenario, we directly flush GSO packets.
> This is the simplest way to address the reported issue,
> but those packets can no longer be aggregated by regular GRO.
> This is the main difference from V4 and Jakub pointed out this issue.
>
> V3 disables fraglist GRO when hardware GRO is enabled.
> The additional suggestion for V3 is =E2=80=9Creplace these
> datapath checks by disabling it at configuration time in
> netdev_fix_features.=E2=80=9D
> However, if we disable NETIF_F_GRO_FRAGLIST in netdev_fix_features,
> UDP packets will also can't aggregate by fraglist. This will affect
> UDP performance.
>
> V4 is more complex than V2, but it can maximize the number of
> packets aggregated by GRO. It works similarly to how regular
> GRO tries to further aggregate TCP GSO packets.
>
> This is a trade-off between code complexity and
> the GRO aggregation rate. You can choose either approach.
> If you have another solution in mind, please let me know.

So this code is there only to allow UDP to use fraglist software
aggregation mode while HW-GRO handles TCP aggregation
And fraglist aggregation is only really useful in the forwarding
case.

The benefit over non-fraglist aggregation is moderate. I'm
a skeptical that maintaining extra code for this edge case
targets a significant workload and is worth it. Open to other
opinions. But i'd just fall back onto non-fraglist broadly.

If keeping the optimization, the patch needs to be respun with
both the commit-msg clarifications, and a Link to this discussion.

