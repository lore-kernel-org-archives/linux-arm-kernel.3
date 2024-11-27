Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7966D609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/puSsXPhu1hMK3ar0AYGCIWVyIB6fujtiaV/jwOUA8=; b=dWLYaxtKm5vzqSX/9hOA4BPs3r
	oUZeJKms97jItoSH+gl++3245aQpO+LBg20L+8XXM3v8paB+fT2IGOe6GMyEKL8kJ6qsVtceM9fC9
	D3vy0/8ekvNUE6DZiiK/jShEh5OjbxebKWGcD/IxhfLHNASLRREl58/PVoC33AnYijZSIXXQvgUc1
	8+QF/qsusr0LIaD2LKgLQoP9gAYIyeaZpsaLzwtCCw7J40oyaTOWFyvplDs/qs3UuoNRBAqRqvxLl
	lofmqS0p63UYv2wgCvJyo3x/dS1CLM1fn0UB+OcaoIQ7t5/XuKILJiyetVXfITPify6YzIDp47puq
	3zLfoMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD4L-0000000CX0Z-2yh2;
	Wed, 27 Nov 2024 08:06:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCwp-0000000CVP2-1vnL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:58:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGCwk-000639-Aa; Wed, 27 Nov 2024 08:58:50 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGCwj-000ODy-0m;
	Wed, 27 Nov 2024 08:58:50 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A655F37E1A3;
	Wed, 27 Nov 2024 07:58:49 +0000 (UTC)
Date: Wed, 27 Nov 2024 08:58:49 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
Message-ID: <20241127-analytic-azure-hamster-727fd8-mkl@pengutronix.de>
References: <20241127074458.2102112-1-carlos.song@nxp.com>
 <20241127-ninja-dormouse-of-bloom-8ee494-mkl@pengutronix.de>
 <AM0PR0402MB3937614F4866F4F15D2FDA21E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elw43wbzngdfoidk"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937614F4866F4F15D2FDA21E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_235855_499553_E642D15A 
X-CRM114-Status: GOOD (  25.09  )
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


--elw43wbzngdfoidk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 27.11.2024 07:48:13, Carlos Song wrote:
> > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,23 @@
> > > static int i2c_imx_probe(struct platform_device *pdev)
> > >  	if (ret =3D=3D -EPROBE_DEFER)
> > >  		goto clk_notifier_unregister;
> > >
> > > +	/*
> > > +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> > > +	 * this platform, that is not a real error, so just remind "only
> > > +	 * PIO mode is used". If DMA is enabled, but meet error when request
> > > +	 * DMA channel, error should be showed in probe error log. PIO mode
> > > +	 * should be available regardless of DMA.
> > > +	 */
> > > +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +	if (ret) {
> > > +		if (ret =3D=3D -EPROBE_DEFER)
> > > +			goto clk_notifier_unregister;
> > > +		else if (ret =3D=3D -ENODEV)
> > > +			dev_info(&pdev->dev, "Only use PIO mode\n");
> >=20
> > On a system without DMA configured, with this patch we now get this info
> > message that wasn't there before. I think this might annoy some people,=
 so you
> > should remove it.
> >=20
>=20
> :-) hhh, get it.

Some things look reasonable when discussing the patch, but when you
see the new, cleaned-up version, you immediately realize that this is
going to annoy people :)

> How about change to dev_dbg?

Good idea.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--elw43wbzngdfoidk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdG0TYACgkQKDiiPnot
vG+KkQf/Q+u30VAGEE7GQ8pY0YCDMlgwq9Lrph+jmHFG1nrNAnOc525i9+1N5Q5/
HR1cWXxUV/yHkt6tkmKlbmGTv5V4FtLOM1QFq4RDCYql8alygNNcN2v4ZUZg3827
el4CHe85/9/Ra2xln9yJ6WIrw7Lhn0Zh0CdpH97hYqmR0WHrpTecWFHbXNGIVieL
85DPurmsXB7lVCfi7sa4V0NjZtts+bkDeDEVnO30j3SAkOtf3KUMtpNWAIGUmRvk
uhdwGfpKbt4sYrmumv05Oly4FzQC8pGf1PAvpDxrlxTbvaHVnkjxvxQ86BbdWOIP
zdkYoGoEU24Eq3WBH+hUS1LjNmKcRQ==
=dQGb
-----END PGP SIGNATURE-----

--elw43wbzngdfoidk--

