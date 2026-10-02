Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F452CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uuw9YcGk9lfdEVRwjqrzUmYDlAJl7TAqXFgwWW6Q8r8=; b=ci7pb5vvipfiuc
	BBEP7KxQq8oF5CY3kI74KVxgR+PqQ8m8ZAr4yk5tHvH4455lpPYfm2ZYEfXFdjBti2gtS/A1IjPAn
	cOaRna2kJFs5pteWYnRPOmyaecf5OLzGieP6bY238N8KpE0+49BnSPEkbE09CnoxxmLnZIWJmJU7H
	naX3skBT4dBf9hdEnxOeTiTnOpOaJSuDkMrcH8ltusPVYg9/h7ZLJcCILK43Ym1QFzP7Q0pibP8AH
	ZgCxjsyDaF908JXePTcIYvCmPK1TcLwBksMIvZcuUL7/3gpMp6IR6LBPZRwFR6WQseRIUHdlAqzIA
	MA2GcZr4fawwLVFoliDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY2F-0000000AuTa-0nQ3;
	Fri, 02 Oct 2026 07:50:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY2E-0000000AuTL-1cj1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F14BC43EA5
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 07:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED851F008BD
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927425;
	bh=Uuw9YcGk9lfdEVRwjqrzUmYDlAJl7TAqXFgwWW6Q8r8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=opAULVzserwDb623yWkTcdiUML85+eUnznNSm2bz9BbqvYiGAwrYmMs4N5G3AI2Do
	 SRosiiL4LqIJdn0j+5KRGCF1G3rI/z7WcudA0XxY2wuaOUQNGF8GzuhELil6VrQcbJ
	 v+TtUe+v2C1s+wtC3hMFSXsxHqN1FKtST0gYH+D7h7EmZfo0fHDxSX+eIdcwsLqHnu
	 EFnpu+wg5W/KoHhGajA0x9yUeS5bjGFxqyZsD6terQGNrPrL27SuXwsYIg196Tt1fC
	 XqubiQjLbY8o+gzwBYblVy+/WkIt0LHmaHO2rXQrKBashx7FIBhHhrwuY19KS9LYe9
	 12slgzEAXYrqA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a77141826cso25751571fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5IA9+aou5gUcsCV00tHL6a0Zco9z8nXSoC7OUbMu4BAbGndWXaHiXbNrS0YhhYzY4lb260tltuAxhQupMDohD@lists.infradead.org
X-Gm-Message-State: AFq9FYLvhnSLceuKXVl3LeKK7LpwGYE8s3i4C9ujPcNrn/p1YURznmsl
	oVm4bXTIu6xP1q3zWHZMsgMwhzymilfgC68oVnJvX1jHi5qXZoUUgZClm8f7lrZTGKwFF3PDs1e
	96ThIIySkppuw7C7N6aVU6stUPUSe+60=
X-Received: by 2002:a05:651c:a107:10b0:3a3:74b9:8a79 with SMTP id
 38308e7fff4ca-3a8877f2af4mr3028011fa.18.1790927423980; Fri, 02 Oct 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net> <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net> <20261002-matted-tux-5b4059bc305a@wendy> <20261002094816.64349979@posteo.net>
In-Reply-To: <20261002094816.64349979@posteo.net>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 2 Oct 2026 15:50:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65YP7WM-FKKJJuEpGWO3xyY1KAhWjw39hgHE=Ns2a0zzw@mail.gmail.com>
X-Gm-Features: AclHuK_HVE57bDVsQlmhG-VM5VBilmJ8qnl2ozGwoiccAzLaGGbOy91FR-N2-UM
Message-ID: <CAGb2v65YP7WM-FKKJJuEpGWO3xyY1KAhWjw39hgHE=Ns2a0zzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson <andersson@kernel.org>, 
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

On Fri, Oct 2, 2026 at 3:48=E2=80=AFPM Wilken Gottwalt
<wilken.gottwalt@posteo.net> wrote:
>
> On Fri, 2 Oct 2026 08:32:51 +0100
> Conor Dooley <conor.dooley@microchip.com> wrote:
>
> > On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > > On Wed, 30 Sep 2026 20:02:21 +0700
> > > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> > >
> > > > Hi Wilken,
> > > >
> > > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspi=
nlock" line to
> > > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and u=
pdate the yaml
> > > > > file accordingly?
> > > >
> > > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a b=
it
> > > > more at the naming. I'd like to keep the A31 fallback: it's the usu=
al
> > > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > > prefers a driver entry instead, I'm fine to change it.
> > >
> > > Yeah, Conor was a bit quick to act here, such things happen often wit=
h patchsets
> > > made out of documentation/devicetrees and code. Though, the get clock=
 and resets
> > > patch is fine. The driver could use some modernization.
> >
> > I dunno, was I too quick to act? The patched looked correct to me, sinc=
e
> > it was using a fallback to a device that it appears to be compatible
> > with. Had the series done what you're suggesting, my review feedback
> > would have been to tell the Tien to add a fallback.
>
> I'm just not sure how to actually do it right, because so many SoCs inclu=
de that
> feature. That is why I asked how you would do it having more insight as a
> subsystem maintainer. It just looks incomplete to me. In the past I actua=
lly
> verified it working with H2, H2+ and H3, none of them being
> "allwinner,sun6i-a31-hwspinlock".

Even if all the SoCs had them, if no one enabled and tested them, then they
wouldn't have entries in the binding or dtsi files.

> > > > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-h=
wspinlock"
> > > > string or add all the possible combinations like
> > > > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspi=
nlock".
> > > > I mean, it is just a naming game and there are 10+ SoCs supporting =
this
> > > > spinlock register file
> >
> > All devices compatible with the a31 should use the a31 as a fallback.
> >
> > >
> > > > > Oh, and I may be able to test it against the D1, I own a Sipeed N=
ezha.
> > > >
> > > > That would be great. You don't need FreeRTOS for it: I tested with =
a
> > > > small Linux module that takes each lock and checks the status
> > > > register. I can clean it up for the single-core D1 and send it.
> > >
> > > Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses=
 the entire
> > > point of the primitive. A hwspinlock arbitrates between two independe=
nt agents,
> > > in this case, Linux running on the C906 core and FreeRTOS running on =
the HiFi
> > > DSP, both sharing the same memory bus and other hardware. If Linux is=
 the only
> > > one who ever takes the locks, it is simultaneously writer and reader =
of the status
> > > register, so the test cannot fail even for a broken (or fake) impleme=
ntation. That
> > > would basically test nothing at all, well, maybe it would be some kin=
d of bring-up
> > > test, but overall quite useless.

