Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0488FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNISZlrzl0Z3dZdoogVfl+lJdfeLWJhnuVzoA7+Ixkk=; b=bZE80C/t8ozn6emywSd4C3fk2R
	LNgYiC5s0Ds9nLcK8aGvxeHTKbRm16EpXkyS2dCrMHmZJkaVGCFUvxRVHJWSr8eoRLmjlkAMMTSLh
	LI64EZ8fN60M8brs92lIsKK5+Y1X7e6MJ95r/HVq606dP31Xq8jUAZBKIRpnHQBKBPvDrWds3M8Op
	2/7Ww8e9K9plnSlzHKK8QCqpel3z5WAHIy4wPTA58DquG8ozfK33nn3t2LooXkt11BFEPeO70rfuV
	1TTkP2PybjyFiTjeodmbWYuO415qdf51319csfmr1pBtGJloKadE7dzP7mtivUd+S8KKCEag6KGOL
	qANcPBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmBO-0000000Buvt-0NP7;
	Sat, 26 Jul 2025 21:11:54 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufm8q-0000000Bugq-0xAb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:09:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2D2F10391E80;
	Sat, 26 Jul 2025 23:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753564152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=eNISZlrzl0Z3dZdoogVfl+lJdfeLWJhnuVzoA7+Ixkk=;
	b=c3NaRGG00BtAzqGFmo87hfj9z0wshVOQm8vOwNQFLymfIbbgscrohKzlZ0mF8STj2V0rSk
	5b7Y3etuydPLum0x2qmSTy6tirEHVQHrIlOuxMFfkzF9sw3c3XkiHkit73qdLQvgaAvGeP
	ID8cq003K+IVbx5VNFcQtZgJqHYYjeS/Rpsp+KRd+s3TFwtGXA/3cI1EgbR8/eJ/XmGFhM
	3uugmBQRDBIPQQqgh+SniVBET/izCY4uTLQdnBbsB+VmhfVQTSEft7IGss/ySBolLM43ii
	f2DGm7I6oLa2SQ7iTyEyEpP5T3W5ntH7nuIvrvq3vw1+sfBLhLVej9JgSJMspg==
Date: Sat, 26 Jul 2025 23:09:08 +0200
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
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v16 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250726230908.3d1e4c87@wsk>
In-Reply-To: <20250725151618.0bc84bdb@kernel.org>
References: <20250724223318.3068984-1-lukma@denx.de>
	<20250724223318.3068984-7-lukma@denx.de>
	<20250725151618.0bc84bdb@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IKCY4fFb7hT6jq/Pg_jxQM6";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_140916_571800_BCDDB850 
X-CRM114-Status: GOOD (  28.55  )
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

--Sig_/IKCY4fFb7hT6jq/Pg_jxQM6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Fri, 25 Jul 2025 00:33:12 +0200 Lukasz Majewski wrote:
> > +static void swap_buffer(void *bufaddr, int len)
> > +{
> > +	int i;
> > +	unsigned int *buf =3D bufaddr;
> > + =20
>=20
> nit: reverse xmas tree

Ok.

>=20
> > +	if (status & BD_ENET_TX_READY) {
> > +		/* All transmit buffers are full. Bail out.
> > +		 * This should not happen, since dev->tbusy should
> > be set.
> > +		 */
> > +		netif_stop_queue(dev);
> > +		dev_err_ratelimited(&fep->pdev->dev, "%s: tx queue
> > full!.\n",
> > +				    dev->name);
> > +		spin_unlock(&fep->hw_lock); =20
>=20
> As we discussed on previous revision you have many to one mapping
> of netdevs to queues. I think the warning should only be printed
> if the drivers is in "single netdev" mode. Otherwise it _will_
> trigger.

It will not trigger (as far as I understand the HW) because no matter
which interface will call this function, there will be next, available
descriptor provided to perform the transmission to switch port 0.

>=20
> BTW you should put the print after the unlock, console writes are
> slow.

+1

>=20
> > +static void mtip_timeout(struct net_device *dev, unsigned int
> > txqueue) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct cbd_t *bdp;
> > +	int i;
> > +
> > +	dev->stats.tx_errors++;
> > +
> > +	if (IS_ENABLED(CONFIG_SWITCH_DEBUG)) { =20
>=20
> why are you hiding the debug info under a CONFIG_ ?=20
> (which BTW appears not to be defined at all)

The CONFIG_SWITCH_DEBUG is rather a "local" variable.

> Seems useful to know the state of the HW when the queue hung.
> You can use a DO_ONCE() if you want to avoid spamming logs

Hmmm.... Good point. I will rewrite it.

>=20
> > +	/* Set buffer length and buffer pointer */
> > +	bufaddr =3D skb->data; =20
>=20
> You should call skb_cow_data() if you want to write to the skb data.

This is the place where I do send data... (the *xmit_port function).

For reading I do have pool of pages and then I do copy the data to skb.

>=20
> > +static void mtip_timeout(struct net_device *dev, unsigned int
> > txqueue) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct cbd_t *bdp;
> > +	int i;
> > +
> > +	dev->stats.tx_errors++; =20
>=20
> timeouts are already counted by the stack, I think the statistic
> is exposed per-queue in sysfs

Ok. I will remove it.

>=20
> > +		spin_lock_bh(&fep->hw_lock);
> > +		dev_info(&dev->dev, "%s: transmit timed out.\n",
> > dev->name);
> > +		dev_info(&dev->dev,
> > +			 "Ring data: cur_tx %lx%s, dirty_tx %lx
> > cur_rx: %lx\n",
> > +			 (unsigned long)fep->cur_tx,
> > +			 fep->tx_full ? " (full)" : "",
> > +			 (unsigned long)fep->dirty_tx,
> > +			 (unsigned long)fep->cur_rx);
> > +
> > +		bdp =3D fep->tx_bd_base;
> > +		dev_info(&dev->dev, " tx: %u buffers\n",
> > TX_RING_SIZE);
> > +		for (i =3D 0; i < TX_RING_SIZE; i++) {
> > +			dev_info(&dev->dev, "  %08lx: %04x %04x
> > %08x\n",
> > +				 (kernel_ulong_t)bdp, bdp->cbd_sc,
> > +				 bdp->cbd_datlen,
> > (int)bdp->cbd_bufaddr);
> > +			bdp++;
> > +		}
> > +
> > +		bdp =3D fep->rx_bd_base;
> > +		dev_info(&dev->dev, " rx: %lu buffers\n",
> > +			 (unsigned long)RX_RING_SIZE);
> > +		for (i =3D 0 ; i < RX_RING_SIZE; i++) {
> > +			dev_info(&dev->dev, "  %08lx: %04x %04x
> > %08x\n",
> > +				 (kernel_ulong_t)bdp,
> > +				 bdp->cbd_sc, bdp->cbd_datlen,
> > +				 (int)bdp->cbd_bufaddr);
> > +			bdp++;
> > +		}
> > +		spin_unlock_bh(&fep->hw_lock); =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/IKCY4fFb7hT6jq/Pg_jxQM6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmiFQ/QACgkQAR8vZIA0
zr01lwf9GsVk2YF8UuVzfEfWghkxAMjT42fDPAJABZxKQQiRLoDiTWsctU9lSOq3
dDKZvdScv+0smZgfukCgwdUUdQV20xV4178yo7weQuSg1jPPLonTQ7sZTbV1Eg0p
ayOpB7BPG1PBjqlVdvjGFu4sf/m6Mdwp5CQ4IAtQuY4PoTVqlIxfhRJ7Z7Vt/ZS3
kOosem9z7v6OSTAo0vwfERyfgkXn0Z+S2rPrg1zzm8MsOETmqTnXRDDolN8bRycW
oaFeF748G7QTVUlmE7Z3qnkFTDGm5DLCgF5AowfSCbbJFISfaOOvAb/IRTOJGYQQ
jHXaWPJCKfknuPWzQ+hVId/6QyhUQA==
=qmTS
-----END PGP SIGNATURE-----

--Sig_/IKCY4fFb7hT6jq/Pg_jxQM6--

