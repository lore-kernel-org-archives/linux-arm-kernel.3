Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45368D59D92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ygbl89qoPUm2yY6YlNeXblUu/RHIuhsj3749PofjBo8=; b=NKwgX5euOUJ6j6Awb3gcjnnJxz
	6pKWjJXlQ8E3eB6gXPsSYjo3SzvhZIKtz2YPF+l8xXRE1eyB7XsksoF0rHrVo1V4oXyBe32T4mfnH
	0t13C7cYyA+RBn7zW+ExAVOpahC/vj0kMNtsBgASvPnS8NLFGXzuAYNpdH54BbzICICu9buOoGwXN
	EJeLdkBCrxvS2s5+MjEoiSCHZrEz/ze8MXFmdFTfekkVCQpYMlsvXchiVLGqmsUglkWR9hIKNIEgf
	OllHrCWNRzmB+TwCsloR92Zb+/0HHgkCZy7V+2wNS6UoPjChqrrGg14zKVA8sZQVeBSK9zdPslshF
	zsNG2YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFskd-0000000AIdp-1s5Q;
	Tue, 26 Nov 2024 10:24:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsjf-0000000AIUL-1S8q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:24:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFsja-00033P-Dp; Tue, 26 Nov 2024 11:23:54 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFsjZ-000ERt-18;
	Tue, 26 Nov 2024 11:23:54 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C120437D8B6;
	Tue, 26 Nov 2024 10:23:53 +0000 (UTC)
Date: Tue, 26 Nov 2024 11:23:53 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Message-ID: <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvifcaczcjfl73wu"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_022359_380646_C1262C23 
X-CRM114-Status: GOOD (  24.86  )
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


--pvifcaczcjfl73wu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 26.11.2024 10:15:27, Carlos Song wrote:
> > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,13 @@
> > > static int i2c_imx_probe(struct platform_device *pdev)
> > >  	if (ret =3D=3D -EPROBE_DEFER)
> > >  		goto clk_notifier_unregister;
> > >
> > > +	/* Init DMA config if supported */
> > > +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +	if (ret =3D=3D -EPROBE_DEFER) {
> > > +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> > > +		goto clk_notifier_unregister;
> > > +	}
> >=20
> > Don't spam the logs if the driver defers probing, it's not a error. And=
 it looks
> > strange to ignore all other errors here. Either add a comment here, som=
ething
> > like "continue without DMA", or let the function return
> > 0 in case the driver should continue and propagate the error if the cal=
ler should
> > take care of it.
> >=20
>=20
> Hi,
> Thank you for your suggestion! I agree with you.
> I will change to this logic:
> 	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> 	if (ret) {
> 		if (ret =3D=3D -EPROBE_DEFER)
> 			goto clk_notifier_unregister;
> 		dev_info(&pdev->dev, "use pio mode\n");
> 	}
>=20
> Ret =3D 0  ----->  enable DMA successfully  -------> no print
> Ret!=3D0  ----->  defer probe ---------> no print and try again
> Ret!=3D0  ----->  fail to enable DMA ------> remind now is using pio mode
>=20
> Do you think the logic is acceptable?

Yes, the other option is to move the logic into i2c_imx_dma_request()
and let it return 0 in case of DMA or fallback to PIO, or an error in
case of probe defer or a fatal error.

This way the probe function will look like this:

     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
     if (ret)
                return dev_err_probe(&pdev->dev, ret, "Failed to setup DMA\=
n");


regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pvifcaczcjfl73wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFobYACgkQKDiiPnot
vG9Llwf/Wiv7XC46iia/74g2fDIJu4YvYXnAdteDyubnJwlpk/staezEgeh11+FB
V7BahH36iz1E3w0phN/JpzgZxKjpHDACgm7iDoil6/VHUZFJYbxFCiwQnbGYBpTv
ekAyLcdsfDhSEP8sPTaraAiCQVZT/7C7Vjxk6kMrqaOEELTkZ+nRl5OW0Ym0SWhZ
ID8m4rQyNzbxUMZg0/dEbyCcf6E2CJzUe8diixOc4DT1VtLWqEW0qHvZdsBMn7fW
a6+F68O4oQD8pPC1lm1/yvUmwMY/RqWfXhT9cJU3ArxfqJsEFKeLEI5I0DIymosh
p/S7I/1xEjQhBCPW0NTMyMUBqsdoAg==
=L7AI
-----END PGP SIGNATURE-----

--pvifcaczcjfl73wu--

