Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF44C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLCs9BiAdMlk+yQ3waXQ8IuOID59CiQhKnCO9fzZh/Y=; b=pwYubnltH5GNdtrZ/ZLsR21Y+Y
	8s9w/cwIIIUGaThAC7ysfoUfarUrBesfgVNec7nQ7v4a/Hdk4kJy2VrSnLebmikztat0PGdBamfwK
	zDiATN+pVIHl7dBTPRN5d87fkkIuDbHks/voVklQGk5k7oeOHhAj/QfuYt6hk1jc1GClFCIsOr/8x
	xFRt1k95kx1fKdhdw5V1Y+YYqxWwwOtdj5WfIAsF/f7HcyJrUC75fs5Zf5xU/VoN4HyXj07G7MEie
	P3FyG1b2EngP2vakKl3da1/B8PG+a+UyUPtiEKh0vsJ/OkwciRZTebZLbcs3f/u8nmUpMja7UQGFc
	Lwhx//Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mx2-00000009gDf-0lhg;
	Thu, 10 Apr 2025 08:07:56 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mRQ-00000009a03-0PVA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:35:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BF6D102E62AD;
	Thu, 10 Apr 2025 09:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744270513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mLCs9BiAdMlk+yQ3waXQ8IuOID59CiQhKnCO9fzZh/Y=;
	b=QLsr4VwHUrGmJXrOKxr4fge4GMFMNnFlppCn14sMjGMFsaUzUyOIbdbMjG1o/N1J87xs63
	YS92aLv+8SdJ4aoNp7/6UR2wczFJdGRndWbfUZTea4Goos66HzBN6go+EXAcjxcQM7HzAG
	jT0ZE3HbyqsJsOLlCT9yM4JOhcsL4N4agWZjVKgQ7wOFTGa6HmCIHdTWElL/smfNZzdFYF
	5/AE7e35b97TUdUlBaxLUGU03XoGuoNSUntnTlmT1AVWdxzWjUax2j6nmaO9GpoB6hdZVX
	STnDO1jfzQg5AzRbonDpAwad5iE7ZGwkPHxZVMTwyO6hmKPI7WiF246HNhsTnw==
Date: Thu, 10 Apr 2025 09:35:07 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>
Subject: Re: [net-next v4 4/5] net: mtip: The L2 switch driver for imx287
Message-ID: <20250410093507.2caeed2e@wsk>
In-Reply-To: <cab89673-6126-43ff-b7eb-1f311fa4498b@lunn.ch>
References: <20250407145157.3626463-1-lukma@denx.de>
	<20250407145157.3626463-5-lukma@denx.de>
	<cab89673-6126-43ff-b7eb-1f311fa4498b@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hdGKkmySF7Xd2rssuDVn3Ri";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_003516_426367_A33963B3 
X-CRM114-Status: GOOD (  24.00  )
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

--Sig_/hdGKkmySF7Xd2rssuDVn3Ri
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > +static int mtip_ndev_port_link(struct net_device *ndev,
> > +			       struct net_device *br_ndev,
> > +			       struct netlink_ext_ack *extack)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(ndev),
> > *other_priv;
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct net_device *other_ndev;
> > +
> > +	/* Check if one port of MTIP switch is already bridged */
> > +	if (fep->br_members && !fep->br_offload) {
> > +		/* Get the second bridge ndev */
> > +		other_ndev =3D fep->ndev[fep->br_members - 1];
> > +		other_priv =3D netdev_priv(other_ndev);
> > +		if (other_priv->master_dev !=3D br_ndev) {
> > +			NL_SET_ERR_MSG_MOD(extack,
> > +					   "L2 offloading only
> > possible for the same bridge!");
> > +			return notifier_from_errno(-EOPNOTSUPP); =20
>=20
> This is not an error condition as such. The switch cannot do it, so
> -EOPNOTSUPP is correct,

Ok, so the:

return notifier_from_errno(-EOPNOTSUPP);

is correct.


> but the Linux software bridge can, and it
> will. So there is no need to use NL_SET_ERR_MSG_MOD().
>=20

This NL_SET_ERR_MSG_MOD() only is relevant for two ports managed by
MTIP L2 switch driver.

As a result - other bridges created by other drivers will not follow
this execution path.

Considering the above - I would keep this message - it is informative
for the potential user (similar approach has been taken when HSR driver
was added for KSZ9477 switch).

>=20
> > +		}
> > +
> > +		fep->br_offload =3D 1;
> > +		mtip_switch_dis_port_separation(fep);
> > +		mtip_clear_atable(fep);
> > +	}
> > +
> > +	if (!priv->master_dev)
> > +		priv->master_dev =3D br_ndev;
> > +
> > +	fep->br_members |=3D BIT(priv->portnum - 1);
> > +
> > +	dev_dbg(&ndev->dev,
> > +		"%s: ndev: %s br: %s fep: 0x%x members: 0x%x
> > offload: %d\n",
> > +		__func__, ndev->name,  br_ndev->name, (unsigned
> > int)fep,
> > +		fep->br_members, fep->br_offload);
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static void mtip_netdevice_port_unlink(struct net_device *ndev)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(ndev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +
> > +	dev_dbg(&ndev->dev, "%s: ndev: %s members: 0x%x\n",
> > __func__,
> > +		ndev->name, fep->br_members);
> > +
> > +	fep->br_members &=3D ~BIT(priv->portnum - 1);
> > +	priv->master_dev =3D NULL;
> > +
> > +	if (!fep->br_members) {
> > +		fep->br_offload =3D 0;
> > +		mtip_switch_en_port_separation(fep);
> > +		mtip_clear_atable(fep);
> > +	} =20
>=20
> This does not look quite correct. So you disable port separation once
> both ports are a member of the same bridge. So you should enable port
> separation as soon as one leaves. So if fep->br_members has 0 or 1
> bits set, you need to enable port separation.

Yes, the if (!fep->br_members)

shall be replaced with:

if (fep->br_members && fep->br_offload)

to avoid situation when disabling second port would re-enable
separation and clear atable.

>=20
> 	Andrew




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/hdGKkmySF7Xd2rssuDVn3Ri
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf3dKsACgkQAR8vZIA0
zr2pVQf/aFFQjA0NusZsugz08UlZgCLGROCsjexA0ZPnqGSYfsClnYNxq3D5LjqY
HFplFXaHTbwqXBKYI/9tUXVyEccRnZo/D96Rn9XCQwXpNLS1AOiUmomMQaoRMpbR
6Tp0/DevMgTYi80dajfWIx8LxR2trZUGmWEExF9PT1TroiRqyhp+4Larn+e84xnw
l3WQLyd/asQ+B4zFQoPmyZyJ+tdM7Yz5RaZfyVz6K2oRjJNC5vCAZxLAbySNsWxa
WIg3fMl/puG+NPKCAvLxrcit4siucwIXOp9nAUpbTiVeGzZe5f3obE7xRRaY83Gw
/E3PyaeVIuzc83bsMRa7rpP2Pa4gdQ==
=PxXB
-----END PGP SIGNATURE-----

--Sig_/hdGKkmySF7Xd2rssuDVn3Ri--

