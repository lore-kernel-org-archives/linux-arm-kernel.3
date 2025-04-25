Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21A6C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dXNASC/WIWqaw/KcaFHN25jpUIQ4813arUoFsnAA/w=; b=L6maZrJvR5/a28Rhn9G6zDo9cM
	UsG+raZzuQlUM5r0gXtgSpva4VZlSkU/pF2c9EONXqPSuFJedk3MmEFTKqFqjEw9p940lC19UhhwY
	BfCr+AXFZUq8R3XVus7lkOuAeNDs3kD/wBWOpinw8alXQ/2cmExSVLAEm0mQtI5OR3mgynKuY2Cj+
	crzt5VKibCa8h9MO8BrzzrMK9THBwaOyP/BeweuAgvQ72amluOGF9Ie0Y/D2i8Mc/SYujA9aRev3a
	hjiq9U/Ztto9gOIgdvwcZQUADTZ9chvQvlML8JJ3VWR82SyarjIeQNhVyxXiSLgCogDQUWZvy6sji
	mFeHBqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Dr4-0000000GFJ7-4BAQ;
	Fri, 25 Apr 2025 07:52:15 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DoB-0000000GElb-1Afp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 07:49:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F99710275AFE;
	Fri, 25 Apr 2025 09:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745567352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/dXNASC/WIWqaw/KcaFHN25jpUIQ4813arUoFsnAA/w=;
	b=W5mzngPWSoevp/RkCHlrm6bIeICmfBGApQFzJ0GYblGaR6HMtVLH2FxtRBPpnBDPDuTvMu
	gGj/huEmIcEK+7lQIm6QDNgYvojSeuwBJC+IW/9AAz/26JOzVxaGchp3mN8rT0+4k+PHDg
	JA5+9KOV1Yn5cRq20sNAN9dUYRhzx1o4oa0J7Qr4i8mKibnDACG2XvcftijG+JK6neBKuz
	5nUduG0llbzLBYuz1oPnEez9otGn0mt2TSb1opiKqJGW/MPGR2gD+z71p0fsdAk902HIh7
	NtbcYJyrJ8+CKVCJYWlKOEF9QrmO7GO5KDspKWxPSrnkHe1KT000/vGRU+eC/A==
Date: Fri, 25 Apr 2025 09:49:07 +0200
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
Message-ID: <20250425094907.27740d07@wsk>
In-Reply-To: <a5f54d46-6829-4d60-b453-9ee92e6b568c@kernel.org>
References: <20250423072911.3513073-1-lukma@denx.de>
	<20250423072911.3513073-5-lukma@denx.de>
	<20250424181110.2734cd0b@kernel.org>
	<0bf77ef6-d884-44d2-8ecc-a530fee215d1@kernel.org>
	<20250425080556.138922a8@wsk>
	<a5f54d46-6829-4d60-b453-9ee92e6b568c@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aD7bD6eqbseU9NHDSHb+3ZT";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_004915_606577_33581660 
X-CRM114-Status: GOOD (  34.80  )
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

--Sig_/aD7bD6eqbseU9NHDSHb+3ZT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof, Jakub

> On 25/04/2025 08:05, Lukasz Majewski wrote:
> > Hi Krzysztof, Jakub,
> >  =20
> >> On 25/04/2025 03:11, Jakub Kicinski wrote: =20
> >>> On Wed, 23 Apr 2025 09:29:08 +0200 Lukasz Majewski wrote:   =20
> >>>> This patch series provides support for More Than IP L2 switch
> >>>> embedded in the imx287 SoC.
> >>>>
> >>>> This is a two port switch (placed between uDMA[01] and
> >>>> MAC-NET[01]), which can be used for offloading the network
> >>>> traffic.
> >>>>
> >>>> It can be used interchangeably with current FEC driver - to be
> >>>> more specific: one can use either of it, depending on the
> >>>> requirements.
> >>>>
> >>>> The biggest difference is the usage of DMA - when FEC is used,
> >>>> separate DMAs are available for each ENET-MAC block.
> >>>> However, with switch enabled - only the DMA0 is used to
> >>>> send/receive data to/form switch (and then switch sends them to
> >>>> respecitive ports).   =20
> >>>
> >>> Lots of sparse warnings and build issues here, at least on x86.
> >>>
> >>> Could you make sure it's clean with an allmodconfig config,=20
> >>> something like:
> >>>
> >>> make C=3D1 W=3D1 drivers/net/ethernet/freescale/mtipsw/    =20
> >>
> >> ... and W=3D1 with clang as well.
> >> =20
> >=20
> > The sparse warnings are because of struct switch_t casting and
> > register =20
>=20
> clang W=3D1 fails on errors, so it is not only sparse:
>=20
> error: cast to smaller integer type 'uint' (aka 'unsigned int') from
> 'struct cbd_t *' [-Werror,-Wpointer-to-int-cast]
>=20
> You probably wanted there kenel_ulong_t.

This I did not catch earlier (probably because of my testing on
imx287). Thanks for spotting it.

>=20
> > access with this paradigm (as it is done with other drivers). =20
>=20
> I don't understand. I see code like:
>=20
> 	struct switch_t *fecp =3D fep->hwp;
>=20
> But this is not a cast - the same types.

For example:

The warning:

mtipl2sw.c:208:30: warning: incorrect type in argument 1 (different
address spaces) mtipl2sw.c:208:30:    expected void const volatile
[noderef] __iomem *addr mtipl2sw.c:208:30:    got unsigned int *

corresponds to:
 info->maclo =3D readl(&fecp->ESW_LREC0);   [*]

where:

struct switch_t {
        u32 ESW_REVISION;
        u32 ESW_SCRATCH;
	...
        /*from 0x420-0x4FC*/
        u32 esw_reserved9[57];
        /*0xFC0DC500---0xFC0DC508*/
        u32 ESW_LREC0;
        u32 ESW_LREC1;
        u32 ESW_LSR;
};


The 'u32' type seems to be valid here as this register is 32 bit wide.

To fix the sparse warnings - I think that I will replace [*] with:

info->maclo =3D readl((u32 __iomem *)&fecp->ESW_LREC0);

as such solution is used in a wide way in the mainline kernel.

Is this the acceptable solution?

> >=20
> > What is the advise here from the community?
> >  =20
> >> Best regards,
> >> Krzysztof =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
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

--Sig_/aD7bD6eqbseU9NHDSHb+3ZT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgLPnMACgkQAR8vZIA0
zr2n/Af+LVw/038n6xkuDzEVw1Ws29jNVFmBbGwSS1Om+WVKtZVnR0MEJigZTpNh
Xw3M68InMX0jlbko1jdRMbhfzovDicEY9KYmg3pKQCZcWiFS93x+PIGFNY+ekeov
jXyoiQY1zaC1/FT3PWtOwK6Ls+yGL83vJm9O86c2dCa6/wnARvbWULW/uQPh0AlX
yTDzLR3RuRQqow6k+M+Rv3ruF0lx7cis6RCVOb3YkCwwBMrjUFQ/T05K5ZilZMr5
9N257fwmaKEtAqk9Sc7fXi/kGf2IvPtobVyWOxWpyIJVeyjjp3s6G4linPN8U46P
s2b/DM39xFJsCGTqF8rG0CJFUNM1FA==
=Id9L
-----END PGP SIGNATURE-----

--Sig_/aD7bD6eqbseU9NHDSHb+3ZT--

