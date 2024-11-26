Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473DDD3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddcUJuLCU+9k5uCEu1Wc0ei7/Z4qP7lTbBY2N2zaevw=; b=VDV3Jmy1MxG3kJBlYE6hShD6Zr
	kf+tqDv8WRNkbrfmKP1HGKIDybB0H8oiRddVMvnCb+VgJwBkSDSb9RayLb+f01lRBLERIuMxDL/25
	jz8ZdudYtyOLMNQrIAn5DN3xJ/5ymvefuL8kIo8tyns3O5VuvEZNoTJ9A7goeOTYt8EcjIpFQTPJ3
	GfM+ny7hH+3KU35UC/FBMCAUGz0IuyczmaG3xdd1CHAXJEw9botr+dxGiMQIKE9ae/IoUaWBGQiwP
	4tH8v3Tj0wIeV15qAa9BO5miPoDsUKAOzMKPIs2wote20lWRSkDoENACLUtAm6UsTqjfyILzxgH2Z
	omS85kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFubM-0000000AZ6e-1S7I;
	Tue, 26 Nov 2024 12:23:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuaO-0000000AYzy-22ql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:22:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFuaH-00037b-Rb; Tue, 26 Nov 2024 13:22:25 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFuaG-000FQ2-1a;
	Tue, 26 Nov 2024 13:22:25 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DDEDD37DA05;
	Tue, 26 Nov 2024 12:22:24 +0000 (UTC)
Date: Tue, 26 Nov 2024 13:22:24 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Message-ID: <20241126-fat-orthodox-eel-5389b4-mkl@pengutronix.de>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
 <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qr4ed5s4vw2t4oyl"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_042232_524841_8867BF8B 
X-CRM114-Status: GOOD (  40.55  )
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


--qr4ed5s4vw2t4oyl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 26.11.2024 12:07:59, Carlos Song wrote:
>=20
>=20
> > -----Original Message-----
> > From: Marc Kleine-Budde <mkl@pengutronix.de>
> > Sent: Tuesday, November 26, 2024 6:24 PM
> > To: Carlos Song <carlos.song@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; o.rempel@pengutronix.de;
> > kernel@pengutronix.de; andi.shyti@kernel.org; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH v2] i2c: imx: support DMA defer probing
> >=20
> > On 26.11.2024 10:15:27, Carlos Song wrote:
> > > > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,13
> > > > > @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > >  	if (ret =3D=3D -EPROBE_DEFER)
> > > > >  		goto clk_notifier_unregister;
> > > > >
> > > > > +	/* Init DMA config if supported */
> > > > > +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > > +	if (ret =3D=3D -EPROBE_DEFER) {
> > > > > +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> > > > > +		goto clk_notifier_unregister;
> > > > > +	}
> > > >
> > > > Don't spam the logs if the driver defers probing, it's not a error.
> > > > And it looks strange to ignore all other errors here. Either add a
> > > > comment here, something like "continue without DMA", or let the
> > > > function return
> > > > 0 in case the driver should continue and propagate the error if the
> > > > caller should take care of it.
> > > >
> > >
> > > Hi,
> > > Thank you for your suggestion! I agree with you.
> > > I will change to this logic:
> > > 	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > 	if (ret) {
> > > 		if (ret =3D=3D -EPROBE_DEFER)
> > > 			goto clk_notifier_unregister;
> > > 		dev_info(&pdev->dev, "use pio mode\n");
> > > 	}
> > >
> > > Ret =3D 0  ----->  enable DMA successfully  -------> no print
> > > Ret!=3D0  ----->  defer probe ---------> no print and try again
> > > Ret!=3D0  ----->  fail to enable DMA ------> remind now is using pio
> > > mode
> > >
> > > Do you think the logic is acceptable?
> >=20
> > Yes, the other option is to move the logic into i2c_imx_dma_request() a=
nd let it
> > return 0 in case of DMA or fallback to PIO, or an error in case of prob=
e defer or a
> > fatal error.
> >=20
> > This way the probe function will look like this:
> >=20
> >      ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> >      if (ret)
> >                 return dev_err_probe(&pdev->dev, ret, "Failed to setup
> > DMA\n");
> >=20
>=20
> Sorry, I have some different ideas...
> 1. DMA mode should be optional for i2c-imx, because i2c-imx can accept DM=
A mode not enabled, because it still can work in CPU mode.

ACK

>   If we use return dev_err_probe(), we have to return error at i2c_imx_dm=
a_request() for "some fatal error", it will cause i2c_adapter can not be re=
gistered, then kill i2c adapter register.

i2c_imx_dma_request should only return an error if PIO mode is not an
option.

>   If we always return 0 at i2c_imx_dma_request(), dev_err_probe will not =
work forever. So from my point, if DMA is not working well, just output a l=
og to remind now i2c is always
>   working at CPU mode, we have no DMA, this is enough.

ACK

> 2. when really defer probe, return dev_err_probe will return defer probe =
directly, but we still need to goto clk_notifier_unregister branch to free =
irq, clk_notifier_unregister and disable runtime pm.
>   So we still need more judgement at probe function to handle this.

Not quite "dev_err_probe()" will not defer probe directly, the return in
"return dev_err_probe();" does. This should work:

        ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
        if (ret) {
                dev_err_probe(&pdev->dev, ret, "Failed to setup  DMA\n");
                goto clk_notifier_unregister;
        }
       =20

> So I prefer this logic:

This also works, LGTM!

> ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> if (ret) {
> 	if (ret =3D=3D -EPROBE_DEFER)
> 		goto clk_notifier_unregister;
> 	dev_info(&pdev->dev, "use pio mode\n");
> }

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--qr4ed5s4vw2t4oyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFvX0ACgkQKDiiPnot
vG+dBgf+NxAQrj6iLQlHEDMSbH2IoHlWMH26HaT5bjMhCGW3CptsWot7YKtEg+YW
0SkJ1U4ivNltky6GMzPVIZoWSTCtSapzrRR9mAWkzHCM7dh3HHxCnzIs7XsVRzy5
RKvBuFJsn3Fz5hs9fK8wV8ucV5tT03Y5Z4wKaIy2NQSsVLT6oKbH+/JIYhZ58Lej
0aYVZWy+4vPQpMDQ/HjtR2eJPbEWlqzawiIJUH/qfH4mYYC+uOSAXQJRPMzlDIN0
mJcGyG8ID4UxGJF1dYkjgSLFB/SuFbW+HF978op+twrxKW7nJUTQhx1XhacjOY9o
/ms5T9s/qWQro5T8tSYiF8SInL7CZw==
=p1Q5
-----END PGP SIGNATURE-----

--qr4ed5s4vw2t4oyl--

