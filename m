Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A128C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xi0fa9hZtQ3xUfjh/Fd+6H85XEzvRV9KyKLSSoEBIho=; b=am6Ixe8n205uGkppiTfPlRQhoB
	VJxFKB3Mu9gReMAuqnYt53YsdCtT1c/b+32d9Lo0d0O3kG1pcrONTxVZqPJ27bXhuLEI/8ePp5m+7
	hUBJHM1zEDuTFgDtdTbtRip5c3xy5rb9byv3DOoDbQur1eCvStnSWsyaB6NjMR8uGA0kLzI9Sxpqj
	g2E6KORv4QFq8iDFWgNUg8Io5DNtuXDpuPy+KhdbQhusMoYX56nzX4/Byt4uZ/VtZedwsFhQAMFqG
	xz05gWJ6FIVmWECT+4GPVi8KQ82rRPlwH9keL2kNQ+i3VOwYEsHtKatMpm5O8L6f1QNbjhCDocl8y
	TI0u2TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7WG-0000000ASRo-1wRI;
	Mon, 19 May 2025 20:55:32 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7T9-0000000ARkK-0HKa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 20:52:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E433C1039728C;
	Mon, 19 May 2025 22:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1747687934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=xi0fa9hZtQ3xUfjh/Fd+6H85XEzvRV9KyKLSSoEBIho=;
	b=MdKEOgQ2NYMapNfr6nWpzieFKGxPSRJvQ75R1YB86etandc2/tz4Gw51ZJxeKtPDcCGFZm
	jps1OdMdqB19S7kvfimr8bHMPMia877rQmTJ0/EMDs81TVfUyi8P7ogE5ksjtvTzzzMdjd
	SxuV+oa002NkrORXIibfJc2D6cDRzgS89bkKjuiVmE4mKMwnLlAswiicF780OX3xQ0uYiI
	4FD0zTngteBD5df6JzSt5bsNDpA2+yF2qwg5EQvU9/ATfcdAOLVX3n85Cdyb6BOPFKixc5
	V27CH5iBzELG9fL7mGxX3yGwyf2NqPflDDyDitP7wOF1dKfUIuSSz/uQQV+6pw==
Date: Mon, 19 May 2025 22:52:08 +0200
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
Subject: Re: [net-next v11 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250519225208.50d60df5@wsk>
In-Reply-To: <20250516075402.5104a0b6@wsk>
References: <20250504145538.3881294-1-lukma@denx.de>
	<20250504145538.3881294-5-lukma@denx.de>
	<61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
	<20250513073109.485fec95@wsk>
	<20250516075402.5104a0b6@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TOeu=qW_6zT9zkkN5+sCnzY";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_135219_400760_393F2DC5 
X-CRM114-Status: GOOD (  40.21  )
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

--Sig_/TOeu=qW_6zT9zkkN5+sCnzY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> Hi Paolo,
>=20
> > Hi Paolo,
> >  =20
> > > On 5/4/25 4:55 PM, Lukasz Majewski wrote:   =20
> > > > +		/* This does 16 byte alignment, exactly what we
> > > > need.
> > > > +		 * The packet length includes FCS, but we don't
> > > > want to
> > > > +		 * include that when passing upstream as it
> > > > messes up
> > > > +		 * bridging applications.
> > > > +		 */
> > > > +		skb =3D netdev_alloc_skb(pndev, pkt_len +
> > > > NET_IP_ALIGN);
> > > > +		if (unlikely(!skb)) {
> > > > +			dev_dbg(&fep->pdev->dev,
> > > > +				"%s: Memory squeeze, dropping
> > > > packet.\n",
> > > > +				pndev->name);
> > > > +			pndev->stats.rx_dropped++;
> > > > +			goto err_mem;
> > > > +		} else {
> > > > +			skb_reserve(skb, NET_IP_ALIGN);
> > > > +			skb_put(skb, pkt_len);      /* Make
> > > > room */
> > > > +			skb_copy_to_linear_data(skb, data,
> > > > pkt_len);
> > > > +			skb->protocol =3D eth_type_trans(skb,
> > > > pndev);
> > > > +			napi_gro_receive(&fep->napi, skb);
> > > > +		}
> > > > +
> > > > +		bdp->cbd_bufaddr =3D
> > > > dma_map_single(&fep->pdev->dev, data,
> > > > +
> > > > bdp->cbd_datlen,
> > > > +
> > > > DMA_FROM_DEVICE);
> > > > +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
> > > > +
> > > > bdp->cbd_bufaddr))) {
> > > > +			dev_err(&fep->pdev->dev,
> > > > +				"Failed to map descriptor rx
> > > > buffer\n");
> > > > +			pndev->stats.rx_errors++;
> > > > +			pndev->stats.rx_dropped++;
> > > > +			dev_kfree_skb_any(skb);
> > > > +			goto err_mem;
> > > > +		}     =20
> > >=20
> > > This is doing the mapping and ev. dropping the skb _after_ pushing
> > > the skb up the stack, you must attempt the mapping first.   =20
> >=20
> > I've double check it - the code seems to be correct.
> >=20
> > This code is a part of mtip_switch_rx() function, which handles
> > receiving data.
> >=20
> > First, on probe, the initial dma memory is mapped for MTIP received
> > data.
> >=20
> > When we receive data, it is processed and afterwards it is "pushed"
> > up to the network stack.
> >=20
> > As a last step we do map memory for next, incoming data and leave
> > the function.
> >=20
> > Hence, IMHO, the order is OK and this part shall be left as is. =20
>=20
> Is the explanation sufficient?

I would do appreciate your feedback as your OK is required to prepare
v12, so I would had the opportunity to have this patch set accepted to
net-next before cut-off date.

Thanks in advance for your help.

>=20
> >  =20
> > >    =20
> > > > +static void mtip_free_buffers(struct net_device *dev)
> > > > +{
> > > > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > > > +	struct switch_enet_private *fep =3D priv->fep;
> > > > +	struct sk_buff *skb;
> > > > +	struct cbd_t *bdp;
> > > > +	int i;
> > > > +
> > > > +	bdp =3D fep->rx_bd_base;
> > > > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > > > +		skb =3D fep->rx_skbuff[i];
> > > > +
> > > > +		if (bdp->cbd_bufaddr)
> > > > +			dma_unmap_single(&fep->pdev->dev,
> > > > bdp->cbd_bufaddr,
> > > > +					 MTIP_SWITCH_RX_FRSIZE,
> > > > +					 DMA_FROM_DEVICE);
> > > > +		if (skb)
> > > > +			dev_kfree_skb(skb);     =20
> > >=20
> > > I suspect that on error paths mtip_free_buffers() can be invoked
> > > multiple consecutive times with any successful allocation in
> > > between: skb will be freed twice. Likely you need to clear
> > > fep->rx_skbuff[i] here.   =20
> >=20
> > +1 - I will add it with v12.
> >  =20
> > >=20
> > > Side note: this patch is way too big for a proper review: you need
> > > to break it in multiple smaller ones, introducing the basic
> > > features separately.
> > >=20
> > > Cheers,
> > >=20
> > > Paolo
> > >    =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/TOeu=qW_6zT9zkkN5+sCnzY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgrmfgACgkQAR8vZIA0
zr09nAf+PrG7I521kkXUYZKC2dEjxU/q4ixwas9hAklmPl5J8w3C7wiM5/X4unzo
vgyoBo1oGToGHEV79FZkeZxn/MF9YXMrKl2WEAaLyNhHpKeusus4my0xt1Ao/Q9R
dkyM0jAeOSnUNpcIl0zhOmgEyBzPFPeRMz263XvTekvJet3E/gTAPHHc1Cg2PfA1
EyxCnsiGy4aHuPJGg+zMhVHxWkt1awEIwSwEZu5O4OtjpUAqfllFn4eiapelBHb7
Z7IM3C1tqdvKGO8lU9nqIoBnYpU9ZzZcg4N27morc9NfrAbF0KlJr/a+pxbM7ptD
rXo54/GaGqwWVq3BcFVpWi3OD+9oJA==
=WWM9
-----END PGP SIGNATURE-----

--Sig_/TOeu=qW_6zT9zkkN5+sCnzY--

