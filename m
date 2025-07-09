Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4021C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArIGCW5Bhq1y2eO/gihtnGd36bGdErSTiYHxyyM2NBo=; b=OEjc8vRMRuzYRZI6oFGY9Wz4n5
	h7dbHkscnB31r1IveNo5SI0qEKltCXSx+SzeQvzVa+MGfraSBzMzoPc3qcu+YtfO2Y987g99MWJG+
	l6zRqyWFfOSeOqLF+/koQydlvHNBhBy+UsFOYbgRyVRmMgoFL6KA0g93ypmkSwaDVoW6NrtR/tXz6
	0lO/hgYeqoEIBMmfMkUbNxVOMHSTg6hbmcegI9WvJTAsvGnYArsLCtDVZluDPSvJHt++ddbcENuDJ
	uIdIXc0nVSuTV4cMOzIKCKdjf+L6xH/7tRzzdiqLjIF4NwRpm6fKf5n+n2u3jU36fuqKIG+BRhVzT
	9njYCRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTYJ-00000008a6y-48Nz;
	Wed, 09 Jul 2025 12:05:31 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRpJ-00000008HBp-21IC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:14:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57904103972A7;
	Wed,  9 Jul 2025 12:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1752056094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ArIGCW5Bhq1y2eO/gihtnGd36bGdErSTiYHxyyM2NBo=;
	b=c4xztTZuzEmC1w0jFD5JIzskfaeJ9Kuw87IZn0mEp30P3ef4cAo0RNNUPFV8mF+tj7sc1l
	wC9uo6NzlEdIuVz8mVxbe6R1lsU70LUPb1CWeYW15Xguh+joIfcph1z/aboaqKC32Aney0
	EaYFAyGCbgrSIenh5ltO4KiGVIx9pZIngqSLRyjxdaa04TgiDkuCtVzdrdlFD69x+/4rAB
	0hMiMOsv10s8YTYMvV4ZkjmuoV3GuCnLcRHBdIZEGNfUGjaB5ss7PkkN+0Vsr8Syd6KUqf
	g5NtmhCPPUBtGNpiuuxEXrFh9nVZYPnIzyS18FC1Ag+rKDVf+3i3NFCx7D0bQw==
Date: Wed, 9 Jul 2025 12:14:47 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v14 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250709121447.7cc2cd19@wsk>
In-Reply-To: <b68a06a1-076a-4345-bbb4-7dda1cd73591@redhat.com>
References: <20250701114957.2492486-1-lukma@denx.de>
	<20250701114957.2492486-5-lukma@denx.de>
	<b68a06a1-076a-4345-bbb4-7dda1cd73591@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zvP9KrePMHi5Vk1C5hBLMkR";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_031457_807641_1930E5A6 
X-CRM114-Status: GOOD (  19.05  )
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

--Sig_/zvP9KrePMHi5Vk1C5hBLMkR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> > +static int mtip_sw_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	const struct mtip_devinfo *dev_info;
> > +	struct switch_enet_private *fep;
> > +	int ret;
> > +
> > +	fep =3D devm_kzalloc(&pdev->dev, sizeof(*fep), GFP_KERNEL);
> > +	if (!fep)
> > +		return -ENOMEM;
> > +
> > +	dev_info =3D of_device_get_match_data(&pdev->dev);
> > +	if (dev_info)
> > +		fep->quirks =3D dev_info->quirks;
> > +
> > +	fep->pdev =3D pdev;
> > +	platform_set_drvdata(pdev, fep);
> > +
> > +	fep->enet_addr =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(fep->enet_addr))
> > +		return PTR_ERR(fep->enet_addr);
> > +
> > +	fep->irq =3D platform_get_irq_byname(pdev, "enet_switch");
> > +	if (fep->irq < 0)
> > +		return fep->irq;
> > +
> > +	ret =3D mtip_parse_of(fep, np);
> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "OF parse error\n");
> > +
> > +	/* Create an Ethernet device instance.
> > +	 * The switch lookup address memory starts at 0x800FC000
> > +	 */
> > +	fep->hwp_enet =3D fep->enet_addr;
> > +	fep->hwp =3D fep->enet_addr + ENET_SWI_PHYS_ADDR_OFFSET;
> > +	fep->hwentry =3D (struct mtip_addr_table __iomem *)
> > +		(fep->hwp + MCF_ESW_LOOKUP_MEM_OFFSET);
> > +
> > +	ret =3D devm_regulator_get_enable_optional(&pdev->dev,
> > "phy");
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Unable to get and enable
> > 'phy'\n"); +
> > +	fep->clk_ipg =3D devm_clk_get_enabled(&pdev->dev, "ipg");
> > +	if (IS_ERR(fep->clk_ipg))
> > +		return dev_err_probe(&pdev->dev,
> > PTR_ERR(fep->clk_ipg),
> > +				     "Unable to acquire 'ipg'
> > clock\n"); +
> > +	fep->clk_ahb =3D devm_clk_get_enabled(&pdev->dev, "ahb");
> > +	if (IS_ERR(fep->clk_ahb))
> > +		return dev_err_probe(&pdev->dev,
> > PTR_ERR(fep->clk_ahb),
> > +				     "Unable to acquire 'ahb'
> > clock\n"); +
> > +	fep->clk_enet_out =3D
> > devm_clk_get_optional_enabled(&pdev->dev,
> > +
> > "enet_out");
> > +	if (IS_ERR(fep->clk_enet_out))
> > +		return dev_err_probe(&pdev->dev,
> > PTR_ERR(fep->clk_enet_out),
> > +				     "Unable to acquire 'enet_out'
> > clock\n"); +
> > +	/* setup MII interface for external switch ports */
> > +	mtip_enet_init(fep, 1);
> > +	mtip_enet_init(fep, 2);
> > +
> > +	spin_lock_init(&fep->learn_lock);
> > +	spin_lock_init(&fep->hw_lock);
> > +	spin_lock_init(&fep->mii_lock); =20
>=20
> `mii_lock` is apparently unused in the whole series.

Thanks for spotting it.

Indeed this shall have been removed when I added support for MII
operations' polling.

>=20
> /P
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/zvP9KrePMHi5Vk1C5hBLMkR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhuQRcACgkQAR8vZIA0
zr1dEwf+IV70eUIk6GwhBJxy3PxgfnLpjKQlItzlkVVtQfjTSQmIlMCucw9/SW04
2xsHcqT7V5sFWnhAViFyOtG0dRiaNToW8GdvWqwc9N4LKHYn3AkFUHmfD3lRXlqy
Ajwsjuv4q+2yGBlQ1Uzb7/MqnWQTtk82SBhyZXtxpCO5PhQ5qiKdUD/HHyFTkpNw
gpAqRHHk3WLxz9wCg4Kj8O/exiyLsqoiH7gNuQAAvx7OvnGaAt2O8hToAbfBdOzN
cw1od/9oksCZqf8YKXx99bE5lVfg3s+njPD7a0c7cAFIGPlARPoVjDg/2/DYEY0H
zc8GeKgDX8nsKtenNU09INlXdabZzg==
=lGVH
-----END PGP SIGNATURE-----

--Sig_/zvP9KrePMHi5Vk1C5hBLMkR--

