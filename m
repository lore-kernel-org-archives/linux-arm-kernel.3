Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED10C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmDn6RQJ+QRV6q6JMcajnOpUP8bbZFJKY8h5RYYtrj0=; b=F98Xal3/V8qYlH/gNJ7fzAwe0W
	FeIQ818XqJRMQvz4Trp3sNtSNGEdL7nH8BcPNA1RmqvV2AbxuL4pV/lwiDHyVgdrSYP1PwMEYAGmR
	FiMWrgu2pqwiH4+ExEx722uouGuBR5UE9HTk//zJATmChPqV36rb1qR4RkkOauY9QJsxqivLQubrd
	kQR0BnPI59HnysshQZt9l5vBYBiLX331V51OXMv2X8lsLe7CXwoV6iOFyO5wi/GeDNTRe0fVb+IFK
	vCEV2EECroVegVgsCg19EJrHPU+kVkay1KLrnnW/IYAtm03OpXXXj8OpMPE1ymCbtFlLDt26hPQSH
	nHlvmukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XVl-0000000FqQz-0XRR;
	Sun, 06 Apr 2025 21:26:37 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XTu-0000000FqJz-0gzk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:24:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 941EA103B92CE;
	Sun,  6 Apr 2025 23:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743974677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AmDn6RQJ+QRV6q6JMcajnOpUP8bbZFJKY8h5RYYtrj0=;
	b=hXR1Cj6JiEpHHtfFp5082ABIz3Ak8Om151NMhGXcN0eH+00EcXMRaWfTWSG4ICuq8+a6kk
	PTS24XASiBCImp0rsWts4wT8v0c/Slugz744qxWJRN1sbi4+u6/4baMRPLwQd8522KXcNN
	qo6OUWirQp7OJ3ZJHc2xC4X1VvNfUh6/Iu+Ex2LIK4o87Y2dDRieYlvDaDdFdMsh9eytzY
	3R5MwONrRpoDy+r/VhjddzNeqj92p2pnTavGmB7kWO2N0y0/DerCac0yZShc+CzNarlZ5U
	QfHW1q0jnpXP0b7+2htYYXjI4A1eYZZ4f1hJfC+v0s1Y6ANJ7Ahmt3nDB87Jvw==
Date: Sun, 6 Apr 2025 23:24:31 +0200
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
Message-ID: <20250406232431.48e837e0@wsk>
In-Reply-To: <8f431197-474e-4cd5-9c3e-d573c3f3e6b5@lunn.ch>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331103116.2223899-5-lukma@denx.de>
	<8f431197-474e-4cd5-9c3e-d573c3f3e6b5@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ACv8R=knW+t0ni5QKQO7U2=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_142442_644800_DAAFD04A 
X-CRM114-Status: GOOD (  34.34  )
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

--Sig_/ACv8R=knW+t0ni5QKQO7U2=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> > +static void read_atable(struct switch_enet_private *fep, int index,
> > +			unsigned long *read_lo, unsigned long
> > *read_hi) +{
> > +	unsigned long atable_base =3D (unsigned long)fep->hwentry;
> > +
> > +	*read_lo =3D readl((const void *)atable_base + (index << 3));
> > +	*read_hi =3D readl((const void *)atable_base + (index << 3)
> > + 4); +}
> > +
> > +static void write_atable(struct switch_enet_private *fep, int
> > index,
> > +			 unsigned long write_lo, unsigned long
> > write_hi) +{
> > +	unsigned long atable_base =3D (unsigned long)fep->hwentry;
> > +
> > +	writel(write_lo, (void *)atable_base + (index << 3));
> > +	writel(write_hi, (void *)atable_base + (index << 3) + 4);
> > +} =20
>=20
> It would be nice to have the mtip_ prefix on all functions.

Ok.

>=20
> > +static int mtip_open(struct net_device *dev)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	int ret, port_idx =3D priv->portnum - 1;
> > +
> > +	if (fep->usage_count =3D=3D 0) {
> > +		clk_enable(fep->clk_ipg);
> > +		netif_napi_add(dev, &fep->napi, mtip_rx_napi);
> > +
> > +		ret =3D mtip_alloc_buffers(dev);
> > +		if (ret)
> > +			return ret; =20
>=20
> nitpick: You might want to turn the clock off before returning the
> error.

Ok.

>=20
> > +	}
> > +
> > +	fep->link[port_idx] =3D 0;
> > +
> > +	/* Probe and connect to PHY when open the interface, if
> > already
> > +	 * NOT done in the switch driver probe (or when the device
> > is
> > +	 * re-opened).
> > +	 */
> > +	ret =3D mtip_mii_probe(dev);
> > +	if (ret) {
> > +		mtip_free_buffers(dev); =20
>=20
> I've not checked. Does this do the opposite of netif_napi_add()?

No, the netif_napi_add() is required here as well.

>=20
> > +static void mtip_set_multicast_list(struct net_device *dev)
> > +{
> > +	unsigned int i, bit, data, crc;
> > +
> > +	if (dev->flags & IFF_PROMISC) {
> > +		dev_info(&dev->dev, "%s: IFF_PROMISC\n",
> > __func__); =20
>=20
> You can save one level of indentation with a return here.

Ok.

>=20
> > +	} else {
> > +		if (dev->flags & IFF_ALLMULTI) {
> > +			dev_info(&dev->dev, "%s: IFF_ALLMULTI\n",
> > __func__); =20
>=20
> and other level here.

Ok.

>=20
> > +		} else {
> > +			struct netdev_hw_addr *ha;
> > +			u_char *addrs;
> > +
> > +			netdev_for_each_mc_addr(ha, dev) {
> > +				addrs =3D ha->addr;
> > +				/* Only support group multicast
> > for now */
> > +				if (!(*addrs & 1))
> > +					continue; =20
>=20
> You could pull there CRC caluclation out into a helper. You might also
> want to search the tree and see if it exists somewhere else.
>=20

The ether_crc_le(ndev->addr_len,=C2=B7ha->addr); could be the replacement.

However, when I look on the code and compare it with fec_main.c's
set_multicast_list() - it looks like a dead code.

The calculated hash is not used at all (in fec_main.c it is written to
some registers).

I've refactored the code to do similar things, but taking into account
already set switch setup (promisc must be enabled from the outset).

> > +
> > +				/* calculate crc32 value of mac
> > address */
> > +				crc =3D 0xffffffff;
> > +
> > +				for (i =3D 0; i < 6; i++) { =20
>=20
> Is 6 the lengh of a MAC address? There is a #define for that.

This is not needed and can be replaced with already present function.

>=20
> > +					data =3D addrs[i];
> > +					for (bit =3D 0; bit < 8;
> > +					     bit++, data >>=3D 1) {
> > +						crc =3D (crc >> 1) ^
> > +						(((crc ^ data) &
> > 1) ?
> > +						CRC32_POLY : 0);
> > +					}
> > +				}
> > +			}
> > +		}
> > +	}
> > +}
> > + =20
>=20
> > +struct switch_enet_private *mtip_netdev_get_priv(const struct
> > net_device *ndev) +{
> > +	if (ndev->netdev_ops =3D=3D &mtip_netdev_ops)
> > +		return netdev_priv(ndev);
> > +
> > +	return NULL;
> > +}
> > + =20
>=20
> > +static int __init mtip_switch_dma_init(struct switch_enet_private
> > *fep) +{
> > +	struct cbd_t *bdp, *cbd_base;
> > +	int ret, i;
> > +
> > +	/* Check mask of the streaming and coherent API */
> > +	ret =3D dma_set_mask_and_coherent(&fep->pdev->dev,
> > DMA_BIT_MASK(32));
> > +	if (ret < 0) {
> > +		dev_warn(&fep->pdev->dev, "No suitable DMA
> > available\n"); =20
>=20
> Can you recover from this? Or should it be dev_err()?
>=20

It was my mistake - of course there shall be dev_err().

> More later...
>=20
> 	Andrew


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ACv8R=knW+t0ni5QKQO7U2=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfy8Q8ACgkQAR8vZIA0
zr2K6gf+IeVFnsg+cnEFsWjR/QZHoQEjkMHlOs/vdNba2jlurd4lPwjLvpxs75Lw
o6ISVIdS1JlB/6kmNCSiL8Ktz0H77nfuz1IpJju2duk9TPTwq0/qoHbQqWaxWGVg
1++fPBxV4EYRfR2I4JXTHTGuPVoREgsCTGcd2sF1JUX5RLxjYg8phEd+LV7TpZnT
aIyh6gBIDZKfZ3hTpS73Dzkb+FIqt3EhRuPBX49Gq8ch69mXgEC9PXe0JTe5Xoww
W1P9HKOuUptjr/i+g6V1sQ9t8IGzMxaVme2Ya/TlR4S11+uX4mLZUJGg3Bbi6wVT
tKRaF1x3+3vfVWuSkSY+NiPr5q3aLw==
=eAzq
-----END PGP SIGNATURE-----

--Sig_/ACv8R=knW+t0ni5QKQO7U2=--

