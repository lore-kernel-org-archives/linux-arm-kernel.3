Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34948C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eDjRS2hC0vlG/zR57fnDcqGBidSBNVgWKh9+kcMn9o=; b=OkdzgggnwwwpHHZ4M211pfGu46
	a03w6by1HKZOWUGQTbAwfI5dtpiNy9QZq8QPflacIipgzSZy3HdrWbfPHOomHXqYqI1U8A/vpAD3z
	azvFSXwMCdTykuhBe5bQc1jBZK7r3sAVtjJkVd3ywLBIakYKHBN5/DIKt8KNTLh8wmESw9TJJ2kHw
	vEjAhM09H4/4HVbejrKRqbqThVwp9Jd4dvkJQw3T+6x1EFsOEJ3uoTFe2snCcLWtaMgeLulH7RisM
	QE1AadhXREqjK9G54apvxYiCO/b2kNrkiTHTtNE5Phn5KivxAeGqz+qmIyRJs97hReJzgfnwGXpFy
	tkJVRBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jDJ-0000000HHWS-1xMS;
	Mon, 07 Apr 2025 09:56:21 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1j0C-0000000HEcY-3oMU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:42:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6097103B92D0;
	Mon,  7 Apr 2025 11:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744018966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4eDjRS2hC0vlG/zR57fnDcqGBidSBNVgWKh9+kcMn9o=;
	b=OacILLR0PwfGSFd3hcH03M4AGX0eCI+iwWLGOHkju2e/YjCChp42qafsC7ngwfwStcTbGB
	yBEfpNQezQ8CC9+MjOI9E+r3mkWD8hWIOlJzQNlT5lJxe/lU9M1BrOmdbZ6NxsCEJTbFmh
	CBPP6rIic66CUcRi0f/AbztRI4GnG/frJ+runK2heeTWaE6cDDM5t+G3ZvhRWD7MW/Fu9u
	BxpzTVV/ikPpPimshka6Te0UALX8btX3TIYzZneD2IH/A8dx54upW92ZdWdSZEgTiispCF
	/7cyDDgUJMTi/kVsrbeVtZibZKzfKm8Q4p5IaaJx5rqt3+ykqd+uKzG7MOLPfQ==
Date: Mon, 7 Apr 2025 11:42:39 +0200
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
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] net: mtip: The L2 switch driver for imx287
Message-ID: <20250407114239.193cd217@wsk>
In-Reply-To: <33394d5b-9a67-4acc-bdd1-bf43dc3bd8ab@lunn.ch>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331103116.2223899-5-lukma@denx.de>
	<33394d5b-9a67-4acc-bdd1-bf43dc3bd8ab@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dGGFaEc2.hmY7aZKdqC+Kiu";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_024249_238236_A578146D 
X-CRM114-Status: GOOD (  33.05  )
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

--Sig_/dGGFaEc2.hmY7aZKdqC+Kiu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > +struct switch_enet_private *mtip_netdev_get_priv(const struct
> > net_device *ndev) +{
> > +	if (ndev->netdev_ops =3D=3D &mtip_netdev_ops)
> > +		return netdev_priv(ndev);
> > +
> > +	return NULL;
> > +} =20
>=20
> > +static bool mtip_port_dev_check(const struct net_device *ndev)
> > +{
> > +	if (!mtip_netdev_get_priv(ndev))
> > +		return false;
> > +
> > +	return true;
> > +}
> > + =20
>=20
> Rearranging the code a bit to make my point....
>=20
> mtip_port_dev_check() tells us if this ndev is one of the ports of
> this switch.
>=20
> > +/* netdev notifier */
> > +static int mtip_netdevice_event(struct notifier_block *unused,
> > +				unsigned long event, void *ptr)
> > +{
> > +	struct net_device *ndev =3D netdev_notifier_info_to_dev(ptr);
> > +	struct netdev_notifier_changeupper_info *info;
> > +	int ret =3D NOTIFY_DONE;
> > +
> > +	if (!mtip_port_dev_check(ndev))
> > +		return NOTIFY_DONE; =20
>=20
> We have received a notification about some interface. This filters out
> all but the switches interfaces.
>=20
> > +
> > +	switch (event) {
> > +	case NETDEV_CHANGEUPPER:
> > +		info =3D ptr; =20
>=20
> CHANGERUPPER is that a netdev has been added or removed from a bridge,
> or some other sort of master device, e.g. a bond.
>=20
> > +
> > +		if (netif_is_bridge_master(info->upper_dev)) {
> > +			if (info->linking)
> > +				ret =3D mtip_ndev_port_link(ndev,
> > +
> > info->upper_dev); =20
>=20
> Call mtip_ndev_port_link() has been added to some bridge.
>=20
> > +static int mtip_ndev_port_link(struct net_device *ndev,
> > +			       struct net_device *br_ndev)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(ndev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +
> > +	dev_dbg(&ndev->dev, "%s: ndev: %s br: %s fep: 0x%x\n",
> > +		__func__, ndev->name,  br_ndev->name, (unsigned
> > int)fep); +
> > +	/* Check if MTIP switch is already enabled */
> > +	if (!fep->br_offload) {
> > +		if (!priv->master_dev)
> > +			priv->master_dev =3D br_ndev;
> > +
> > +		fep->br_offload =3D 1;
> > +		mtip_switch_dis_port_separation(fep);
> > +		mtip_clear_atable(fep);
> > +	} =20
>=20
> So lets consider
>=20
> ip link add br0 type bridge
> ip link add br1 type bridge
> ip link set dev lan1 master br0
>=20
> We create two bridges, and add the first port to one of the bridges.
>=20
> fep->br_offload should be False
> priv->master_dev should be NULL.
>=20
> So fep->br_offload is set to 1, priv->master_dev is set to br0 and the
> separation between the ports is removed.
>=20
> It seems like the hardware will now be bridging packets between the
> two interfaces, despite lan2 not being a member of any bridge....
>=20
> Now
>=20
> ip link set dev lan2 master br1
>=20
> I make the second port a member of some other bridge. fep->br_offload
> is True, so nothing happens.
>=20
> This is why i said this code needs expanding.
>=20
> If you look at other switch drivers, you will see each port keeps
> track of what bridge it has been joined to. There is then logic which
> iterates over the ports, finds which ports are members of the same
> bridge, and enables packets to flow between those ports.
>=20
> With only two ports, you can make some simplifications, but you should
> only disable the separation once both ports are the member of the same
> bridge.
>=20

I think that I do have your point. Thanks for the info.

> 	Andrew




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/dGGFaEc2.hmY7aZKdqC+Kiu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfzng8ACgkQAR8vZIA0
zr1QPggAx9Y8piyOWlU04a35TryOc69ycDWnjqzMqg11YaCSKZRe0597B8yD8gCi
aNIIj+tSDbWmJS9aghABK6uFYyWdHV6reZPoDA2FSIyc+HnmNyJG8l+467EJyVyE
cfPbcXsw/Pg0eAgEJVbcXoCrzLi+sAwBXzsegu6xFVOOcZoVpwJ37I7sSzTC/7zZ
T90PsPu/sBksuaIr0xMW/VbYG5I0FLCEaOf06iThR3xQOTpWisjgdwmYPSvigPoq
HmVQXp0w4LsfRTTvLavgpwa9YBJXOk87Jnyi86KvPoRxCVFNUvlSU432qzCV/7AN
eXojuGHIx4+E2CgGqhfOCrcv/Ffnxg==
=nOs3
-----END PGP SIGNATURE-----

--Sig_/dGGFaEc2.hmY7aZKdqC+Kiu--

