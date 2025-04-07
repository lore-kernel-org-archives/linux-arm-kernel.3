Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739CAC369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcpHIHdpCMLJF4s/VJZo/G6a9nsNam8x34XSwJ2u6Pg=; b=P3S7KIyZqsvAHCvlXohWW4Q7G4
	6iNTTQ/2vZqda6SxfNZsEs4CFfln14de34K0OSgyEFEaKRwQJ0CyO0TR9vMTQmxcWGLxjNERMmXDK
	LN9bS0x5OPO9rdTaVX01k0oxwqQBH87dom4Xzj+3QWgesgI6QOIJC+GMaA70DlhN90PzYK1mLiHgh
	lliAe0BOPUBDrh2tvO/5dqecrUX0yFrEPCYHQ2u6KNQQyORxypauUj8lRaxMTxdclhhIUEFBhfaKf
	rKCHuD4AbY8BFgh27gZ6RHEaAd4hs6yhx35o34rt+BbmkuEIqc37yIQfDC67JhMyDIhGfDoNSDl/b
	w4/TbVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYb-00000001dJ8-43je;
	Mon, 07 Apr 2025 18:50:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pfB-00000001H5U-1ln8;
	Mon, 07 Apr 2025 16:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EcpHIHdpCMLJF4s/VJZo/G6a9nsNam8x34XSwJ2u6Pg=; b=qqa/4dRGnVDR62Hv5OhVImQIXU
	sNnKKxkLnFP2nJfL0cJS8sAUjVGvO7+mwMfQp6/4r1+xB0BbpBmcr2O6/O72IEjrYMlaWX2i3gpZC
	3xW3F1kqBWP/1ZCq80fnzB4YR5s/92qqMUmeTOwqBlVxE8e+NJFZmkHpUFz7ujfHSp8wB07TKgIb8
	3BzneylOTil6JTVRjE45XGq43GuyY6Kimt757++x+1E9uh8Zo9L5qcJgGhFo66bCAMN5uoKoKoNIe
	N9VbiaFbdLhTrl9Jw0p6vBEHUo71CcU64wjzth0N8AycRu8m1WYR82uBLo5TqbqgjfCWJcgFUL79l
	33BmgLBw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pf7-000000084Xb-035V;
	Mon, 07 Apr 2025 16:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EcpHIHdpCMLJF4s/VJZo/G6a9nsNam8x34XSwJ2u6Pg=; b=AIOr9KeOCXW3cDn3zHEBy8fKnn
	ayCLSm0pqP94IK2Qj0y6Td2zAucfuTKPpOipaO1sbrXyDxJv/XgPRrx3y74yn0qoC5fQEyMpbAaWg
	m4TUkWdviNIHqw5T04qfz8gGuOO6afiGkGiHk5+cTKWdAHXleNJXMuODJtbXy3UMJ2QCiWOtQWeRq
	3dYbcvBdcifWh1m9+Tn8IwTRX6L8Vsx6ReO4HNksS/oNHk/tVoaVkPmE1f/UG/C7MRmQSkvTEJmyn
	FZMickVV4wb45j7XJ6u4rZ+CneyK9EU3jkb+diMe3erRXkg5ciZd0v5jCHR0fjBj8XChFUeo7x8Gn
	1+vMBrGw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1pf6-0006eA-5t; Mon, 07 Apr 2025 18:49:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Mon, 07 Apr 2025 18:49:27 +0200
Message-ID: <2000188.PYKUYFuaPT@diego>
In-Reply-To: <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
References: <5552256.Sb9uPGUboI@phil> <8512245.T7Z3S40VBb@diego>
 <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_174929_216421_FDEE72CE 
X-CRM114-Status: GOOD (  26.18  )
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

Am Montag, 7. April 2025, 18:43:54 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring:
> On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >
> > Hi Rob,
> >
> > Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Rob Herring:
> > > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.=
de> wrote:
> > > >
> > > > Hi soc maintainers,
> > > >
> > > > I made an error and accidentially applied a patch that was meant for
> > > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > > commit appeared in linux-next.
> > >
> > > Both commits are in v6.15-rc1 now and the revert is not, so this
> > > should not get applied/pulled. Or you will need to revert the revert.
> >
> > yes, that was the intention.
> >
> > Back when I submitted this PR, I talked with Arnd on IRC the next day.
> >
> > As both commits are identical sans some Signed-off-by lines, he suggest=
ed
> > not trying to put a revert in, but instead let git solve it itself, bec=
ause
> >
> > arnd on IRC:
> > > [...], but I worry that this would make things worse if 'git merge'
> > > ends up doing the revert on top of the original commit once it gets to
> > > torvalds. Not sure if that's still a problem in git these days, but
> > > I've seen it happen in the past.
> > > if two identical patches are in different branches, just leaving them
> > > there is usually easier
> >
> > So this PR was already marked as "superseeded" in patchwork back
> > on march 20th.
> >
> >
> > Nevertheless, thanks for making sure no funky revert happens now.
>=20
> The commit is still in linux-next though. That's how I happened upon this.

Ah right. I've recreated my next branch earlier today, after the -rc1
release, so this should be gone with the next linux-next.

Heiko



