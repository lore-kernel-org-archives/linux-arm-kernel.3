Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66F5C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOoLpSlcMEI3x/GsGXxu7WykZ1/+A4nN7MIcD+H/+uQ=; b=oYty8gQh79YEoXtD3mnWNCCf7X
	tIPqihbSajgFdSBXfPch1dEKwN/TM3j09NbhjZ40YlgVH7GZBiyB2iq/3sIwgJfqqgmqdWZbrrSzv
	N0C1TFRnK8soFMlPWlVbFZZ1Fd4eyXjbrClv2bqvey5GJ1yWHWKLhUdILj0IbaPeNbcvtnZ9mMOrH
	BMSiCClaE4iAuDXeBUNYsBSMIgmprFCn7TAYRHolOmYhQGqrR8C+JbF5c+ZxXqDkiKYBj777E2hZh
	Fda4tWtAJ4iTuSJh5nyQeHaAznJBElfB35Z6dkGy75P6tTRkV+sS3fxS1bZcwhJLgZU5x6R/MtC7V
	bN66k/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEiH7-0000000BOw8-3Yms;
	Tue, 13 May 2025 05:33:57 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEiEb-0000000BObR-0RSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 05:31:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 257C0101F54F9;
	Tue, 13 May 2025 07:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1747114276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AOoLpSlcMEI3x/GsGXxu7WykZ1/+A4nN7MIcD+H/+uQ=;
	b=AyOcLNrgYSbYvX4wYgUv7mAVOse9uZXTb2e+Unl8AVKvxYEBs1D9iqL+oee+kyOUJMQeh0
	p8TL9HQCLcGSTXMaQtY5jJwQO9bkdLR0tdV9uKejyTTl/I2RVZhXVcR+0gbCfS+TD3WQXt
	WQBIMODdESc0ckXiMmWXI9zZZ8FiJZX117MsatlhANrhd6M2Ev4JBfYNLP2oe3PV8hZE/t
	l4gLRaLVEmSC/r8zxEuRJDSVUEIRtFDUcsjYVJiXRvKd6xsn3/wSxqK2vNqEAS2vyP12ot
	jisN+XZssVfk7xllsfE8hzFW3p42yDJtW2K/NE5Ct+138mhoEwrK7BLTv/V02w==
Date: Tue, 13 May 2025 07:31:09 +0200
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
Message-ID: <20250513073109.485fec95@wsk>
In-Reply-To: <61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
References: <20250504145538.3881294-1-lukma@denx.de>
	<20250504145538.3881294-5-lukma@denx.de>
	<61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NdXiA+ua5HLGGlUZSgHFP74";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_223121_438483_3B8C908D 
X-CRM114-Status: GOOD (  28.44  )
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

--Sig_/NdXiA+ua5HLGGlUZSgHFP74
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 5/4/25 4:55 PM, Lukasz Majewski wrote:
> > +		/* This does 16 byte alignment, exactly what we
> > need.
> > +		 * The packet length includes FCS, but we don't
> > want to
> > +		 * include that when passing upstream as it messes
> > up
> > +		 * bridging applications.
> > +		 */
> > +		skb =3D netdev_alloc_skb(pndev, pkt_len +
> > NET_IP_ALIGN);
> > +		if (unlikely(!skb)) {
> > +			dev_dbg(&fep->pdev->dev,
> > +				"%s: Memory squeeze, dropping
> > packet.\n",
> > +				pndev->name);
> > +			pndev->stats.rx_dropped++;
> > +			goto err_mem;
> > +		} else {
> > +			skb_reserve(skb, NET_IP_ALIGN);
> > +			skb_put(skb, pkt_len);      /* Make room */
> > +			skb_copy_to_linear_data(skb, data,
> > pkt_len);
> > +			skb->protocol =3D eth_type_trans(skb, pndev);
> > +			napi_gro_receive(&fep->napi, skb);
> > +		}
> > +
> > +		bdp->cbd_bufaddr =3D dma_map_single(&fep->pdev->dev,
> > data,
> > +						  bdp->cbd_datlen,
> > +						  DMA_FROM_DEVICE);
> > +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
> > +					       bdp->cbd_bufaddr)))
> > {
> > +			dev_err(&fep->pdev->dev,
> > +				"Failed to map descriptor rx
> > buffer\n");
> > +			pndev->stats.rx_errors++;
> > +			pndev->stats.rx_dropped++;
> > +			dev_kfree_skb_any(skb);
> > +			goto err_mem;
> > +		} =20
>=20
> This is doing the mapping and ev. dropping the skb _after_ pushing the
> skb up the stack, you must attempt the mapping first.

I've double check it - the code seems to be correct.

This code is a part of mtip_switch_rx() function, which handles
receiving data.

First, on probe, the initial dma memory is mapped for MTIP received
data.

When we receive data, it is processed and afterwards it is "pushed" up
to the network stack.

As a last step we do map memory for next, incoming data and leave the
function.

Hence, IMHO, the order is OK and this part shall be left as is.

>=20
> > +static void mtip_free_buffers(struct net_device *dev)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct sk_buff *skb;
> > +	struct cbd_t *bdp;
> > +	int i;
> > +
> > +	bdp =3D fep->rx_bd_base;
> > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > +		skb =3D fep->rx_skbuff[i];
> > +
> > +		if (bdp->cbd_bufaddr)
> > +			dma_unmap_single(&fep->pdev->dev,
> > bdp->cbd_bufaddr,
> > +					 MTIP_SWITCH_RX_FRSIZE,
> > +					 DMA_FROM_DEVICE);
> > +		if (skb)
> > +			dev_kfree_skb(skb); =20
>=20
> I suspect that on error paths mtip_free_buffers() can be invoked
> multiple consecutive times with any successful allocation in between:
> skb will be freed twice. Likely you need to clear fep->rx_skbuff[i]
> here.

+1 - I will add it with v12.

>=20
> Side note: this patch is way too big for a proper review: you need to
> break it in multiple smaller ones, introducing the basic features
> separately.
>=20
> Cheers,
>=20
> Paolo
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/NdXiA+ua5HLGGlUZSgHFP74
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgi2R0ACgkQAR8vZIA0
zr22dAf7BLxjZukHTC/6XVODiBt97iljTiAjzfkSLa9WXpEue6HV1GmD6tkt3wnJ
HdyON1QvZxs7JUywLFPzF6JgjFz6rxpTR/EpvshLzQOkyW991XrhmPyvHRvUCS2+
hddDVP0K+6Nbo2EEmlkq3383XOZwPtP93pYieNwkzml9NDgY7tdxwl6fumWOX05c
obTZQIo6zLfjjoK2alr3lqYke6CfmkJRl7o8/xhcu9Ju9hYIpJl1EPhePCn0ZcVq
Pmorr7BxDgT1h0M/DnxyRC1RfzIhSekjIaL6+ZBzBWM5mYXy/oDO8jk1q6pS1lPP
5WomLLwha1NwFG4Y8w+1Ll6gH++xTg==
=g2d0
-----END PGP SIGNATURE-----

--Sig_/NdXiA+ua5HLGGlUZSgHFP74--

