Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B4DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyfspuUXsvtxwACFp2OjNa2e1i5qQ9TaWwXqk1eb8pI=; b=LM0ouZ3JEW/2rvO4nghohgAfuu
	EpLPDw3z6t556lDo7hu9VZOEtfHTeCaqo+UEx+McCNEgX1wC3LsPymNl2xmYEVrECtJISlcW4TaLN
	nTMmdkEXcolCQPaxmiNpRZ0rAgyD6mgsbSholBC9Noa4tsleTxAsy6MBCeq6DirNDfI9jnJd17eha
	J0JrXoFg22qEZZzHC1A43lOwyNOFM1GChHwYYhr8hhzrDfpIaSSDOv/S6n0KYDksR/M8H45bsMrlZ
	pUjAmsFfxMNChmEDScUFx75tcrvmbNAY3oZwiZVRwssqZAU7YLZrHpCgDBOrRlyc+QoVxXfoFoKK7
	IUHhFivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWwb-00000005Cuz-0Azs;
	Sun, 04 May 2025 10:51:37 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWte-00000005CiY-1Zvg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 10:48:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F789102EBA58;
	Sun,  4 May 2025 12:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1746355712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oyfspuUXsvtxwACFp2OjNa2e1i5qQ9TaWwXqk1eb8pI=;
	b=bSHe0DDO0HmUzUv3nmn0yIx82Pqb+ItFmQHz+j+0ES347ylkqZfmv5jaG1li+ZwJeqeCvI
	wbDv5wEkcWm8fn8Uczp/EQI2ok6MxarqXcFhzcaNtCDjbhBRHx80Wq0Pgxi4M9LbGkvo14
	7Fdz3q2pFT6dUJ4ajBPgymZob7aamniu1ETu5GucgZEjEqABhSvhAYGynRyU5q0SFxNE9H
	FbjuTg/HlHFZXtQiP0bcfJpz6w9OUE8lB/bS+MWt4qJNGI73QlE2Q/7DgW8MMCfjOZ/VBt
	3NzAPiixMXGlvwKdLkHxchlhnc2+GaTj35fMn9ZMvi01cZU6XF1euYpK0OSyZg==
Date: Sun, 4 May 2025 12:48:29 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next v10 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250504124829.725a0248@wsk>
In-Reply-To: <20250502170503.GN3339421@horms.kernel.org>
References: <20250502074447.2153837-1-lukma@denx.de>
	<20250502074447.2153837-5-lukma@denx.de>
	<20250502170503.GN3339421@horms.kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6FB_Di5S7gZ0Mh6S0HegD37";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_034834_553072_73A93CB2 
X-CRM114-Status: GOOD (  16.88  )
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

--Sig_/6FB_Di5S7gZ0Mh6S0HegD37
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2025 18:05:03 +0100
Simon Horman <horms@kernel.org> wrote:

> On Fri, May 02, 2025 at 09:44:44AM +0200, Lukasz Majewski wrote:
>=20
> > +static int mtip_sw_probe(struct platform_device *pdev) =20
>=20
> ...
>=20
> > +	ret =3D devm_request_irq(&pdev->dev, fep->irq,
> > mtip_interrupt, 0,
> > +			       dev_name(&pdev->dev), fep);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, fep->irq, =20
>=20
> It looks like the 2nd argument to dev_err_probe() should be ret
> rather than fep->irq.
>=20

+1

> Flagged by Smatch.
>=20
> > +				     "Could not alloc IRQ\n"); =20
>=20
> ...




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/6FB_Di5S7gZ0Mh6S0HegD37
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgXRf0ACgkQAR8vZIA0
zr2NTQf7Bp4wh7lNJIyD6OEZaoyV4crQkImvD0UYuNmerhQ7X1xXh99sWe45M4hr
wUggoeicjfVNJFvjy6LJOfJQASUH/pkgZhUGoiLorpvjdlJ2qEmbDLNa48lEGDCB
GHjvENE6teQt6Ug4gcmgpU0bSrjZRSeLXGTL6CWtHPiqPIaerIP7T4MD/J9SVM3J
kPobZbf+5QfkzM+Tgwib8AZ5y52xCBSeCumXjD5slM9+w1AFrnpcZ8Uf5m/6dSKp
IXuLWzGdDigdq8TUkyGg1Z5GkG3hNErAFdokY6qol6TRKxAVRqKjc+ADyfUVQL7Q
1LvfWI79bwBZ4u5xcfiBHEhgHpGKvw==
=m30w
-----END PGP SIGNATURE-----

--Sig_/6FB_Di5S7gZ0Mh6S0HegD37--

