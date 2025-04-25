Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F36C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgWHx4MEbQ/1h/6YgoQKX18Aje/eTp7H4Cfr/9VNVY0=; b=cHuiiIvb2T6WvCGwqcvJSW15dQ
	a2nCSsP4BDdi5Zv8Xkodx01vEo/SjDLOEUWMsB0RrOGHoGe+mzYeDgIQ11V2gbVWFReQUgzPZEAnA
	4RZlNGFb6QJSXMSpNjudwJvqLvzQhVPXe9/ye8LGDcWJJx4uku/Unb6h5YOhDaeXamPHB5m+m2gKv
	7ZtjBs47ZHXAmpC02JJ+OJWpUp34VWcuEU6JmH3DboWiXFGwpR4yXIsorBqOw8CRZSqlJcnJYMyIQ
	+8xJPdzFHb9gVZHm/C+9+wVoJsHdPxQ5xSp3r4XVAj3MtybAuZLaHkEAgtTxTGiHfBykEbaMgHap2
	4GTfF0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8I6R-0000000H7Je-0anG;
	Fri, 25 Apr 2025 12:24:23 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GlC-0000000GqTh-2c3c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:58:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20B5A10273DB4;
	Fri, 25 Apr 2025 12:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745578699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cgWHx4MEbQ/1h/6YgoQKX18Aje/eTp7H4Cfr/9VNVY0=;
	b=KaaGpbSB8aszqMBo8a8rZHQ4ooR44WiwSq5BTFtRnx5JkQrIVzu8F3OQtaIJoufYy2Dpy+
	1d2weoNCcfc4jWtKkP1bGWKpw7xQN5ViInjBXJu+gRUGB8PS6Fzr26JeKkJE3l26MjMGTq
	OqUQJ96OGmfz1pkJYgahFmFzmusJ6k1VX3u6NiwxAQrFNrvyYfpGJ+K8ZH+aZ1k75eLhLk
	hdOpBgy8LlcFgRLaUzFw1PILCQ4VfBe4cY36tY3YqdbeUQaT6oJRPbS9uiPE5RG9YgJVob
	Y6zs6tpjBOmbtl6Ky5QPcjnwJ+sjAEjM8uoo6phGq6SiKBTeUyYJN5A6PWQzgQ==
Date: Fri, 25 Apr 2025 12:58:08 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v7 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250425125808.7f1ad08c@wsk>
In-Reply-To: <fc450dca-a1ba-4b9f-befa-f9643d9b1b82@kernel.org>
References: <20250423072911.3513073-1-lukma@denx.de>
	<20250423072911.3513073-5-lukma@denx.de>
	<20250424181110.2734cd0b@kernel.org>
	<0bf77ef6-d884-44d2-8ecc-a530fee215d1@kernel.org>
	<20250425080556.138922a8@wsk>
	<a5f54d46-6829-4d60-b453-9ee92e6b568c@kernel.org>
	<20250425094907.27740d07@wsk>
	<fc450dca-a1ba-4b9f-befa-f9643d9b1b82@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SA=k3nMQ25JqWflep8XHAe/";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_035822_951339_67E0B981 
X-CRM114-Status: GOOD (  41.24  )
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

--Sig_/SA=k3nMQ25JqWflep8XHAe/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 25/04/2025 09:49, Lukasz Majewski wrote:
> > Hi Krzysztof, Jakub
> >  =20
> >> On 25/04/2025 08:05, Lukasz Majewski wrote: =20
> >>> Hi Krzysztof, Jakub,
> >>>    =20
> >>>> On 25/04/2025 03:11, Jakub Kicinski wrote:   =20
> >>>>> On Wed, 23 Apr 2025 09:29:08 +0200 Lukasz Majewski wrote:     =20
> >>>>>> This patch series provides support for More Than IP L2 switch
> >>>>>> embedded in the imx287 SoC.
> >>>>>>
> >>>>>> This is a two port switch (placed between uDMA[01] and
> >>>>>> MAC-NET[01]), which can be used for offloading the network
> >>>>>> traffic.
> >>>>>>
> >>>>>> It can be used interchangeably with current FEC driver - to be
> >>>>>> more specific: one can use either of it, depending on the
> >>>>>> requirements.
> >>>>>>
> >>>>>> The biggest difference is the usage of DMA - when FEC is used,
> >>>>>> separate DMAs are available for each ENET-MAC block.
> >>>>>> However, with switch enabled - only the DMA0 is used to
> >>>>>> send/receive data to/form switch (and then switch sends them to
> >>>>>> respecitive ports).     =20
> >>>>>
> >>>>> Lots of sparse warnings and build issues here, at least on x86.
> >>>>>
> >>>>> Could you make sure it's clean with an allmodconfig config,=20
> >>>>> something like:
> >>>>>
> >>>>> make C=3D1 W=3D1 drivers/net/ethernet/freescale/mtipsw/      =20
> >>>>
> >>>> ... and W=3D1 with clang as well.
> >>>>   =20
> >>>
> >>> The sparse warnings are because of struct switch_t casting and
> >>> register   =20
> >>
> >> clang W=3D1 fails on errors, so it is not only sparse:
> >>
> >> error: cast to smaller integer type 'uint' (aka 'unsigned int')
> >> from 'struct cbd_t *' [-Werror,-Wpointer-to-int-cast]
> >>
> >> You probably wanted there kenel_ulong_t. =20
> >=20
> > This I did not catch earlier (probably because of my testing on
> > imx287). Thanks for spotting it.
> >  =20
> >> =20
> >>> access with this paradigm (as it is done with other drivers).   =20
> >>
> >> I don't understand. I see code like:
> >>
> >> 	struct switch_t *fecp =3D fep->hwp;
> >>
> >> But this is not a cast - the same types. =20
> >=20
> > For example:
> >=20
> > The warning:
> >=20
> > mtipl2sw.c:208:30: warning: incorrect type in argument 1 (different
> > address spaces) mtipl2sw.c:208:30:    expected void const volatile
> > [noderef] __iomem *addr mtipl2sw.c:208:30:    got unsigned int *
> >=20
> > corresponds to:
> >  info->maclo =3D readl(&fecp->ESW_LREC0);   [*]
> >=20
> > where:
> >=20
> > struct switch_t {
> >         u32 ESW_REVISION;
> >         u32 ESW_SCRATCH;
> > 	...
> >         /*from 0x420-0x4FC*/
> >         u32 esw_reserved9[57];
> >         /*0xFC0DC500---0xFC0DC508*/
> >         u32 ESW_LREC0;
> >         u32 ESW_LREC1;
> >         u32 ESW_LSR;
> > };
> >=20
> >=20
> > The 'u32' type seems to be valid here as this register is 32 bit
> > wide. =20
>=20
> It is not about size, but IOMEM annotation and pointer/non-pointer.
>=20

+1

>=20
> >=20
> > To fix the sparse warnings - I think that I will replace [*] with:
> >=20
> > info->maclo =3D readl((u32 __iomem *)&fecp->ESW_LREC0); =20
>=20
> I don't understand why are you reading address of ESW_LREC0.

The driver (still) uses the apparently "old" programming paradigm, so
there is struct switch_t with u32 elements cast to the __iomem address.

If I want to have the address - I'm using & on the element of the
struct. That is why sparse is complaining as it in fact gets pointer to
u32.

In the fec.h the set of #defines are used and void __iomem *hwp;
pointer.

It looks like to make the spare happy - I need to use similar approach
with the mtip.

The other option would be to add (u32 __iomem *) explicit cast to
readl()/writel().

Or do you see another solution?

> This is
> MMIO, right? So you are supposes to read base + offset (where base is
> a proper iomem pointer).
>=20
>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/SA=k3nMQ25JqWflep8XHAe/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgLasAACgkQAR8vZIA0
zr2XKwgAiRNxdQrQc8u/cqo1JuMPxpSRrWrD+p7QkOnoHtml0U6X6v5PAlj8llSD
UGLKoCACJrY2Iw7XMxElDOhsHFgdIGPz1IYOBwODPikkScfeYuUjDb4wG4CNxeem
2Q/Ro7+dfZS/pHYxAuBtjyaxbzauprf8POaFoxsVHQ2pvs8UOf96TTvG+4L01wW1
0cm+3KYyT73PjelCB+LsSnV3SfqgGUOfHV8brmHW8PY5XmgNXGmShg3Kv6cddzMo
FSiHQNmPdeO++SXoP3/BDd3SJs/FL0igpWx8vDLoHbWhDTPLOL2OlD6CyMTg2z0k
KoiNkSnNmIInx7JRzEinVN657fMUog==
=Xa9T
-----END PGP SIGNATURE-----

--Sig_/SA=k3nMQ25JqWflep8XHAe/--

