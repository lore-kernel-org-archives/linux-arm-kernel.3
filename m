Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E59ACA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/6dk9nrqC/MKrnHwwRY81eqOJFcj++Fe93uSmAxRa8=; b=03b4e5yk63uyXF
	G0NHGO88EoPIwWrBCNUbDFD5ayR2ihrzkaCBI4mlh1Y6dJoUewdvKjfKG6SmJn8K7StnmigoTqzRH
	Clt7Cxm63fRdBozeCGAuetcnNyhciTGtCgZStlmwka5rPftZA8Xmyo4dq9xZ9+dlKogkzflLUO8FM
	NmTcZCAjFw2f9w5JYNVQGetBWe+TYtDohYrDPMDCv1y4ea2RuztisIdZYhKsuLkHfHt+HFk+lmfjW
	nx1lRpOggl+CqLtngtTksdXD0NGi1ofdVTe0zSuGs2xR236KNzPfEyt7ztuUzyOIMCpGVKILVQXbU
	HYM40pktHYqRcOVkA5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0n-0000000Au3P-3100;
	Fri, 02 Oct 2026 07:48:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0l-0000000Au1y-2ozo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 570C743FAC
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 07:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEC11F0089A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927335;
	bh=K/6dk9nrqC/MKrnHwwRY81eqOJFcj++Fe93uSmAxRa8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WSkLxcBV8rOs1pRakbDhFdSdzRUyIybCbVyESybWpJEoxHEI3bOnqFnDOf8+zKHr0
	 rDC+w/uzqqxpyhYxFQYnCdrZr2yR/vUOUQuDkpjWikmYFE9ZkNGlaV4Pav458TKY5e
	 tZH1RGFqG6HdYOyOuhY5n+i27May7nzMphKSwS0on2OpLZfDtJzJ1oMzfMINn89Yv0
	 ku9wVJKH8Qg0gty6LeSD2XLGjcXCXRa/J5DbD1hzZpWCjQPH3uIWRMXLspS5ssASVX
	 gxIiexEs7f/Ya3Fb6vvgcdtB0ULyp9Bun8rJtF6rE5Aee6mCwdSpiwjokwQ8dH+asI
	 Hxf26SfFBLLcA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a772de44c5so23728841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxco6BrQU/IbxWSQyMv6Zas+dyQmdL7y3+yUuXqF/becCtz2K87P8pD6vrDODv+91oG7v5psCQPncZHeA+1nmEM@lists.infradead.org
X-Gm-Message-State: AFq9FYIo0CWWZTw8kA8YwfjpymxdR6b4yZa50da8uYePIk1lcvL6FEid
	Qj81BXTRLBuRttNGH1z1oxNTtpWBffcnOZVQRrut39s+d6r8ntUvRRblj5cjkrG/ZPDE8CJfZRC
	hymgHp68+79jE4KGjP/8yAy6hFUQ97aQ=
X-Received: by 2002:a05:651c:a214:10b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3a8877acfdbmr2899761fa.19.1790927333136; Fri, 02 Oct 2026
 00:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net> <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net> <20261002-matted-tux-5b4059bc305a@wendy>
In-Reply-To: <20261002-matted-tux-5b4059bc305a@wendy>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 2 Oct 2026 15:48:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v67N_c9qQYCkO3qyAJBD_AiS7121w7TdzaEo+oCHejZz4A@mail.gmail.com>
X-Gm-Features: AclHuK_MycTfrXnUdqDSD2u0CizqQBnqOmkhjG3IcG03pU3h9DtnRs-NxqNzvuk
Message-ID: <CAGb2v67N_c9qQYCkO3qyAJBD_AiS7121w7TdzaEo+oCHejZz4A@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Conor Dooley <conor.dooley@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Oct 2, 2026 at 3:34=E2=80=AFPM Conor Dooley <conor.dooley@microchip=
.com> wrote:
>
> On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > On Wed, 30 Sep 2026 20:02:21 +0700
> > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> >
> > > Hi Wilken,
> > >
> > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinl=
ock" line to
> > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and upd=
ate the yaml
> > > > file accordingly?
> > >
> > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> > > more at the naming. I'd like to keep the A31 fallback: it's the usual
> > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > prefers a driver entry instead, I'm fine to change it.
> >
> > Yeah, Conor was a bit quick to act here, such things happen often with =
patchsets
> > made out of documentation/devicetrees and code. Though, the get clock a=
nd resets
> > patch is fine. The driver could use some modernization.
>
> I dunno, was I too quick to act? The patched looked correct to me, since
> it was using a fallback to a device that it appears to be compatible
> with. Had the series done what you're suggesting, my review feedback
> would have been to tell the Tien to add a fallback.
>
> > > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hws=
pinlock"
> > > string or add all the possible combinations like
> > > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinl=
ock".
> > > I mean, it is just a naming game and there are 10+ SoCs supporting th=
is
> > > spinlock register file
>
> All devices compatible with the a31 should use the a31 as a fallback.

+1.

If the hardware is backward compatible, then with the fallback compatible
everything works.

We ask folks to always add SoC-specific compatibles just in case.


ChenYu

> >
> > > > Oh, and I may be able to test it against the D1, I own a Sipeed Nez=
ha.
> > >
> > > That would be great. You don't need FreeRTOS for it: I tested with a
> > > small Linux module that takes each lock and checks the status
> > > register. I can clean it up for the single-core D1 and send it.
> >
> > Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses t=
he entire
> > point of the primitive. A hwspinlock arbitrates between two independent=
 agents,
> > in this case, Linux running on the C906 core and FreeRTOS running on th=
e HiFi
> > DSP, both sharing the same memory bus and other hardware. If Linux is t=
he only
> > one who ever takes the locks, it is simultaneously writer and reader of=
 the status
> > register, so the test cannot fail even for a broken (or fake) implement=
ation. That
> > would basically test nothing at all, well, maybe it would be some kind =
of bring-up
> > test, but overall quite useless.
> >
> > greetings,
> > Wilken

