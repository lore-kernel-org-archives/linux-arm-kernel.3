Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D65C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thKRdw3kXRGji+6JCd7tx86+QfpE7R4ymI26oelJ9l0=; b=vtKJpH35EA7FiGP/7yusZ12pAw
	mTylbuKK5TlFXfD8BwPG6ZOTc4EoUm2a+W3Wyp5qvr9wyyns2jRMzNiBA5rqLfL89IPAV2B6FYShl
	zES4WDETMPbw1kiOyd/8KHScK6eXvSEOl94+Z20f1Tn5BOU8mfkRRgoJPnFwGzKJ9TgPoHL9I7PJ+
	jbFutSbHtpksvgIsF0AJPd6GBuj+J51O886dwwUjS8SKGZkUD/9Nf3pPyrBS7BvyHObPH/XGgn7PE
	RfNbxmW8eXRD7G9Rfht5zaYl2VwvqbCYexyoFhRc341UM8wuWP80lxHa/1uRMJZTnnJYk5kuMDvAi
	KFfew38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxkm-00000000hXO-1rDh;
	Mon, 21 Jul 2025 21:08:56 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxiI-00000000hB5-1y9D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 21:06:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5E5D1027235A;
	Mon, 21 Jul 2025 23:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753131977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=thKRdw3kXRGji+6JCd7tx86+QfpE7R4ymI26oelJ9l0=;
	b=LDA9mQZeGJ84HzhFTkWldHixuCTUA/2gE47EdutdCG+Queg5IVgKVkacRhbSBE9pi4toBn
	YJd+Q+hW3wat8/0owk0Y66IS3WJaNw5Rwyng+Is6zLxORIdFz5YH8OaN+ULShn7wwQn7+L
	dWPT/cbpL76ZkNS3FINCOYXeQQaI3Szr4cnkhOCpmPDoQtFxWdICD5Ru8Ea4HvdjTig3Q2
	aSoHgioT/8mOJp0+c+Ihr5af1VabgqEYZDZKxuUEZY8/y/Jv90wx4vJG+6+xwE5Co0uTvZ
	3YFyhX1rxpWhfqXtj4o1f0b7WkhYqwQlZPq4y0EcKaQHGRBDGW1inBrF/1GXPA==
Date: Mon, 21 Jul 2025 23:06:11 +0200
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
Subject: Re: [net-next v15 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250721230611.45fb74df@wsk>
In-Reply-To: <20250718181028.00cda754@kernel.org>
References: <20250716214731.3384273-1-lukma@denx.de>
	<20250716214731.3384273-5-lukma@denx.de>
	<20250718181028.00cda754@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yEbJNgP2XSHi9_nucQvhE7B";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_140622_804168_542D4D41 
X-CRM114-Status: GOOD (  25.38  )
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

--Sig_/yEbJNgP2XSHi9_nucQvhE7B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Wed, 16 Jul 2025 23:47:23 +0200 Lukasz Majewski wrote:
> > +static void mtip_ndev_cleanup(struct switch_enet_private *fep)
> > +{
> > +	struct mtip_ndev_priv *priv;
> > +	int i;
> > +
> > +	for (i =3D 0; i < SWITCH_EPORT_NUMBER; i++) {
> > +		if (fep->ndev[i]) { =20
>=20
> this just checks if netdev is NULL
>=20
> > +			priv =3D netdev_priv(fep->ndev[i]);
> > +			cancel_work_sync(&priv->tx_timeout_work);
> > +
> > +			unregister_netdev(fep->ndev[i]); =20
>=20
> and if not unregisters
>=20
> > +			free_netdev(fep->ndev[i]);
> > +		}
> > +	}
> > +}
> > +
> > +static int mtip_ndev_init(struct switch_enet_private *fep,
> > +			  struct platform_device *pdev)
> > +{
> > +	struct mtip_ndev_priv *priv;
> > +	int i, ret =3D 0;
> > +
> > +	for (i =3D 0; i < SWITCH_EPORT_NUMBER; i++) {
> > +		fep->ndev[i] =3D alloc_netdev(sizeof(struct
> > mtip_ndev_priv), =20
>=20
> but we assign the pointer immediatelly
>=20
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
> > +		ret =3D register_netdev(fep->ndev[i]); =20
>=20
> and don't clear it when register fails
>=20
> > +		if (ret) {
> > +			dev_err(&fep->ndev[i]->dev,
> > +				"%s: ndev %s register err: %d\n",
> > __func__,
> > +				fep->ndev[i]->name, ret);
> > +			break;
> > +		}
> > +
> > +		dev_dbg(&fep->ndev[i]->dev, "%s: MTIP eth L2
> > switch %pM\n",
> > +			fep->ndev[i]->name,
> > fep->ndev[i]->dev_addr);
> > +	}
> > +
> > +	if (ret)
> > +		mtip_ndev_cleanup(fep); =20
>=20
> You're probably better off handling the unwind on error separately
> from the full cleanup function, but I guess that's subjective.

Yes, you are right - I shall add:
fep->ndev[i] =3D NULL;

just after free_ndev(fep->ndev[i]); in the
mtip_ndev_cleanup() function.

>=20
> > +	return ret;
> > +} =20
>=20
> > +static int mtip_sw_probe(struct platform_device *pdev)
> > +{ =20
>=20
> > +	ret =3D mtip_ndev_init(fep, pdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "%s: Failed to create virtual
> > ndev (%d)\n",
> > +			__func__, ret);
> > +		goto ndev_init_err;
> > +	}
> > +
> > +	ret =3D mtip_switch_dma_init(fep); =20
>=20
> > +	ret =3D mtip_mii_init(fep, pdev); =20
>=20
> Seems like we're registering the netdevs before fully initializing=20
> the HW? Is it safe if user (or worse, some other kernel subsystem)=20
> tries to open the netdevs before the driver finished the init?
> =20

This needs to be reordered - the ndev registration shall be the last
step.

Thanks for pointing this out.

>=20
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "%s: Cannot init phy bus
> > (%d)!\n", __func__,
> > +			ret);
> > +		goto mii_init_err;
> > +	}
> > +	/* setup timer for learning aging function */
> > +	timer_setup(&fep->timer_mgnt, mtip_mgnt_timer, 0);
> > +	mod_timer(&fep->timer_mgnt,
> > +		  jiffies +
> > msecs_to_jiffies(LEARNING_AGING_INTERVAL)); +
> > +	return 0;
> > +
> > + mii_init_err:
> > + dma_init_err:
> > +	mtip_ndev_cleanup(fep); =20
>=20
> Please name the labels after the action they jump to, not the location
> where they jump from.

Ok.

>=20
> > + ndev_init_err:
> > +
> > +	return ret; =20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/yEbJNgP2XSHi9_nucQvhE7B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmh+q8MACgkQAR8vZIA0
zr0HdggAwco5wjKk7FZTResfk+vt1Mqevf2S3izXGuVnFYMYDXkwS5yUJyI858DL
fafdGgSK3ohngKrEv4OIz35sfT8KxYWCtxMo0hNP8YyJsknOAQSeAvrofp75T/Ej
R9bgz/dJKUls586SPXfLjy37a567H06CJHVk9kGuxDigPKbmv9PgTyS31ng+n9jq
0Ugb4u4zU4/I7Ul4BjnwWC6tckzbtawepEyHEO/pcaVdpI+W7yoOetDfCShbYnL/
VPwticChtJfuOgKiXD9HVcP0QVL0PkCXlKluklqKnHeSPHC8J5W7CnAtOZhi3IHH
+S9Q+H1D5mGWD+M2PeMRZYcn8aZ5sA==
=1O0w
-----END PGP SIGNATURE-----

--Sig_/yEbJNgP2XSHi9_nucQvhE7B--

