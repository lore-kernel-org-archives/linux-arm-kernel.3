Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0461C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 20:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWGAw9HUc5B0uTkDq7v2wXCo5i2oNA3eTY8zlOASEHM=; b=JKmOpMVEYnXWFOoQ9pKcYlAFEN
	1+0G+FsgXTofJ+gJGCTUmnHzVVWYeSVjH4ab9KPbqilKAkOi5DyHR/2JB/2bZEvaU3O0x8L6N7bWR
	7oEUSQ/U/X490TjLus8LGbkkXynN+ZdnGP5q/MwNeqqlWqyEL7VOU4B8ptb0Y4i+NBDrnZybnMCNW
	0NdF49UeA4/JJSAf/y9Sm2xsymB4b1V5N/hwJmqPrtKsy0ebRG1LoROjRflrII9jEQOZjttDXddF1
	v7vZqkvyNEX9z2QPJisFErFlJtsBtpfTUdK4HyjMxHOirwAiHIen8WKLmMyPzIs1R1Djx+51Q7xAn
	FjCIuZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflJW-0000000BqE9-2CRG;
	Sat, 26 Jul 2025 20:16:14 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflGx-0000000Bpp5-32vR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 20:13:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEA6010391E80;
	Sat, 26 Jul 2025 22:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753560811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TWGAw9HUc5B0uTkDq7v2wXCo5i2oNA3eTY8zlOASEHM=;
	b=WAUpxAveeRNrvct46TWQ/f5v6/UOhl/3j5bocPV7TalPE7I2Nf7mF1teQT53k6EZ3haj/H
	4Ic4Kv6vhrx3W9oeFSHeDXnuVeaoHVg9bSGO4H63FvtRNM8N33xCIVchxBDi2n4BJvIr7X
	HL+fE0L2uKoRhLm7NmLugowT8OM2yfwgLybhfhGxjrr+sIOMg9H7jZOFw9h+vb2JRAQzML
	5GyaJdICf/g1xecNRK3jgIQ++DuL6KOl6uxa+xU/5gGEpdSuq3Ga78Aeqf3XZ6UnzUS3Sf
	U24HFTBtB2dO54LfmaZDKbQmJNseF43LNIzJDdt7I1sGA6vwzkxQWIQKsRbInQ==
Date: Sat, 26 Jul 2025 22:13:23 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v16 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250726221323.0754f3cd@wsk>
In-Reply-To: <20250725151829.40bd5f4e@kernel.org>
References: <20250724223318.3068984-1-lukma@denx.de>
	<20250724223318.3068984-5-lukma@denx.de>
	<20250725151829.40bd5f4e@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QBKx1stqUcQHszVRzo3MNYj";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_131335_919542_E55E5832 
X-CRM114-Status: GOOD (  15.62  )
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

--Sig_/QBKx1stqUcQHszVRzo3MNYj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Fri, 25 Jul 2025 00:33:10 +0200 Lukasz Majewski wrote:
> > +	for (i =3D 0; i < SWITCH_EPORT_NUMBER; i++) {
> > +		fep->ndev[i] =3D alloc_netdev(sizeof(struct
> > mtip_ndev_priv),
> > +					    fep->ndev_name[i],
> > NET_NAME_USER,
> > +					    ether_setup);
> > +		if (!fep->ndev[i]) {
> > +			ret =3D -ENOMEM;
> > +			break;
> > +		}
> > +
> > +		fep->ndev[i]->ethtool_ops =3D &mtip_ethtool_ops;
> > +		fep->ndev[i]->netdev_ops =3D &mtip_netdev_ops;
> > +		SET_NETDEV_DEV(fep->ndev[i], &pdev->dev);
> > +
> > +		priv =3D netdev_priv(fep->ndev[i]);
> > +		priv->dev =3D fep->ndev[i];
> > +		priv->fep =3D fep;
> > +		priv->portnum =3D i + 1;
> > +		fep->ndev[i]->irq =3D fep->irq;
> > +
> > +		mtip_setup_mac(fep->ndev[i]);
> > +
> > +		ret =3D register_netdev(fep->ndev[i]);
> > +		if (ret) {
> > +			dev_err(&fep->ndev[i]->dev,
> > +				"%s: ndev %s register err: %d\n",
> > __func__,
> > +				fep->ndev[i]->name, ret);
> > +			break;
> > +		} =20
>=20
> Error handling in case of register_netdev() still buggy, AFAICT.

I've added the code to set fep->ndev[i] =3D NULL to mtip_ndev_cleanup().
IMHO this is the correct place to add it.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/QBKx1stqUcQHszVRzo3MNYj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmiFNuMACgkQAR8vZIA0
zr1nZAgAuEPG2jcxe5x4z5+TI7n7rwPtz3Cgbueuh1wjlJ58IWVvM/Q6XbLQ0Av9
1Fgmn5jR6AY8Zhh/9/rW6jb12GTvFA/fmOgqykhvRFhUbaMfWw6mZqROiGBQZ6lX
Esg9sYHVGwMr3W2efNc3FCw4jfHJMtW7D6wPCFkCXjnppo6lD88tstj4saczatDO
asEz2RqDh8HQFbi542j/iUcCNYVm2K7WNRq0RhZf43a789W4I3ARMDFrxwioK5uJ
8a/Cu/P5ITnAnAIgjgdXBouLIMeSf9iAQy/W9Xu6bGJSk6Ng4i8u9C+TTwUlzJdw
VPWafe7Gb1LENnDxHz07QYeWtVB9AQ==
=27wW
-----END PGP SIGNATURE-----

--Sig_/QBKx1stqUcQHszVRzo3MNYj--

