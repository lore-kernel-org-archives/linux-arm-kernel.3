Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71551C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nY9hNH8Xulfxtod44cCabgUPMOownby6PT6DFrz5lQ=; b=Sao7uJdb18WciNpCGGET0o27Id
	B525lXrMuAT5nUICVbhC1Xnyc79SlUpNvP2JSXhCH+f/P6udxSzdN0qjCDVDcQpzPRbEY7kMpx0uS
	5bLN1gwJK4zUcatqQYPN+8JAGccz+h6toUkv4X0aqXrKWkFRNYNOxTJblGcO8H0NVLCmvh1pYLH/1
	XMR1a0fUaHKJpIaHIvTayNrwTCjSf/2wdrdugyu7PtLDRxBz8ByTOoUJi8GoEt0E/N4Ep8bY20gzU
	yKO37OGs6mH0yUbQc3U2wC8ej2ZU3pjWtJhTxTWSI+7fFOsE3ouOK9RcOAXdvmmHjXAnOgRVpgMvk
	04ci4YUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Qr-000000021sV-45xS;
	Tue, 22 Jul 2025 09:37:09 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue97C-00000001ySk-03xr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:16:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 529FC1026E02C;
	Tue, 22 Jul 2025 11:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753175806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4nY9hNH8Xulfxtod44cCabgUPMOownby6PT6DFrz5lQ=;
	b=LjIbbUbJbG2EhihBKkxwPGR29XItOid1lgo5AYyInQTAhh+5DuxFeZGRqnhC9o6cS/qwfG
	fuUPlRKJga3Ujq45JSB74KI5S35BWjlox4tLdVQPgxj+qR49/+LHsntQNaW8uRNjSX9jZS
	L6T7euknFsOZyFWvGs3duEpnVoewPiPzPZ5XiSyNQfgkn8WObJumJgYsBiuyq3PdvOswzf
	b4NNteNWy7NlZ9OLeQJSGZcNR+1HZsV5sdmAeJL85/apZep1P9YtI5HfdIehos1eBBABwp
	0W/JEWaj0OGyZoATbfVYsVBrVKV8KEaTcf2Ta96KI4g4s9M2aFWAaO/0/TlPtQ==
Date: Tue, 22 Jul 2025 11:16:39 +0200
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
Subject: Re: [net-next v15 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250722111639.3a53b450@wsk>
In-Reply-To: <20250718182840.7ab7e202@kernel.org>
References: <20250716214731.3384273-1-lukma@denx.de>
	<20250716214731.3384273-7-lukma@denx.de>
	<20250718182840.7ab7e202@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m4ErR0/Y681iJgWNOq_wn4J";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021650_354224_E5589B9F 
X-CRM114-Status: GOOD (  57.27  )
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

--Sig_/m4ErR0/Y681iJgWNOq_wn4J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Wed, 16 Jul 2025 23:47:25 +0200 Lukasz Majewski wrote:
> > +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> > +					struct net_device *dev,
> > int port) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	unsigned short status;
> > +	struct cbd_t *bdp;
> > +	void *bufaddr;
> > +
> > +	spin_lock(&fep->hw_lock); =20
>=20
> I see some inconsistencies in how you take this lock.
> Bunch of bare spin_lock() calls from BH context, but there's also
> a _irqsave() call in mtip_adjust_link().

In the legacy NXP (Freescale) code for this IP block (i.e. MTIP switch)
the recommended way to re-setup it, when link or duplex changes, is to
reset and reconfigure it.

It requires setting up interrupts as well... In that situation, IMHO
disabling system interrupts is required to avoid some undefined
behaviour.

> Please align to the strictest
> context (not sure if the irqsave is actually needed, at a glance, IOW
> whether the lock is taken from an IRQ)

The spin_lock() for xmit port is similar to what is done for
fec_main.c. As this switch uses single uDMA for both ports as well as
there is no support (and need) for multiple queues it can be omitted.

>=20
> > +	if (!fep->link[0] && !fep->link[1]) {
> > +		/* Link is down or autonegotiation is in progress.
> > */
> > +		netif_stop_queue(dev);
> > +		spin_unlock(&fep->hw_lock);
> > +		return NETDEV_TX_BUSY;
> > +	}
> > +
> > +	/* Fill in a Tx ring entry */
> > +	bdp =3D fep->cur_tx;
> > +
> > +	/* Force read memory barier on the current transmit
> > description */ =20
>=20
> Barrier are between things. What is this barrier separating, and what
> write barrier does it pair with? As far as I can tell cur_tx is just
> a value in memory, and accesses are under ->hw_lock, so there should
> be no ordering concerns.

The bdp is the uDMA descritptor (memory allocated in the coherent dma
area). It is used by the uDMA when data is transferred to MTIP switch
internal buffer.

The bdp->cbd_sc is a half word, which is modified by uDMA engine, to
indicate if there are errors or transfer has ended.

The rmb() shall improve robustness - it assures that the status
corresponds to what was set by uDMA. On the other hand dma coherent
allocation shall do this as well.

The fec_main.c places the rmb() in similar places, so I followed their
approach.

>=20
> > +	rmb();
> > +	status =3D bdp->cbd_sc;
> > +
> > +	if (status & BD_ENET_TX_READY) {
> > +		/* All transmit buffers are full. Bail out.
> > +		 * This should not happen, since dev->tbusy should
> > be set.
> > +		 */
> > +		netif_stop_queue(dev);
> > +		dev_err(&fep->pdev->dev, "%s: tx queue full!.\n",
> > dev->name); =20
>=20
> This needs to be rate limited, we don't want to flood the logs in case
> there's a bug.

+1

>=20
> Also at a glance it seems like you have one fep for multiple netdevs.

Yes.

> So stopping one netdev's Tx queue when fep fills up will not stop the
> other ports from pushing frames, right?

This is a bit more complicated...

Other solutions - like cpsw_new - are conceptually simple; there are
two DMAs to two separate eth IP blocks.
During startup two separate devices are created. When one wants to
enable bridge (i.e. start in-hw offloading) - just single bit is setup
and ... that's it.

With vf610 / imx287 and MTIP it is a bit different (imx287 is even
worse as second ETH interface has incomplete functionality by design).

When switch is not active - you have two uDMA ports to two ENET IP
blocks. Full separation. That is what is done with fec_main.c driver.

When you enable MTIP switch - then you have just a single uDMA0 active
for "both" ports. In fact you "bridge" two ports into a single one -
that is why Freescale/NXP driver (for 2.6.y) just had eth0 to "model"
bridged interfaces. That was "simpler" (PHY management was done in the
driver as well).

Now, in this driver, we do have two network devices, which are "bridged"
(so there is br0). And of course there must be separation between
lan0/1 when this driver is used, but bridge is not (yet) created. This
works :-)


So I do have - 2x netdevs (handled by single uDMA0) + 2PHYS + br0 +
NAPI + switchdev (to avoid broadcast frame storms + {R}STP + FDB -
WIP).


Just pure fun :-) to model it all ... and make happy all maintainers :-)

>=20
> > +		spin_unlock(&fep->hw_lock);
> > +		return NETDEV_TX_BUSY;
> > +	}
> > +
> > +	/* Clear all of the status flags */
> > +	status &=3D ~BD_ENET_TX_STATS;
> > +
> > +	/* Set buffer length and buffer pointer */
> > +	bufaddr =3D skb->data;
> > +	bdp->cbd_datlen =3D skb->len;
> > +
> > +	/* On some FEC implementations data must be aligned on
> > +	 * 4-byte boundaries. Use bounce buffers to copy data
> > +	 * and get it aligned.spin
> > +	 */
> > +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) { =20
>=20
> I think you should add=20
>=20
> 	if ... ||
>            fep->quirks & FEC_QUIRK_SWAP_FRAME)
>=20
> here. You can't modify skb->data without calling skb_cow_data()
> but you already have buffers allocated so can as well use them.

The vf610 doesn't need the frame to be swapped, but has requirements
for alignment as well.

I would keep things as they are now - as they just improve readability.

Please keep in mind that this version only supports imx287, but the
plan is to add vf610 as well (to be more specific - this driver also
works on vf610, but I plan to add those patches after this one is
accepted and pulled).=20

>=20
> > +		unsigned int index;
> > +
> > +		index =3D bdp - fep->tx_bd_base;
> > +		memcpy(fep->tx_bounce[index],
> > +		       (void *)skb->data, skb->len); =20
>=20
> this fits on one 80 char line BTW, quite easily:
>=20
> 		memcpy(fep->tx_bounce[index], (void *)skb->data,
> skb->len);
>=20
> Also the cast to void * is not necessary in C.

+1

>=20
> > +		bufaddr =3D fep->tx_bounce[index];
> > +	}
> > +
> > +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> > +		swap_buffer(bufaddr, skb->len);
> > +
> > +	/* Save skb pointer. */
> > +	fep->tx_skbuff[fep->skb_cur] =3D skb;
> > +
> > +	fep->skb_cur =3D (fep->skb_cur + 1) & TX_RING_MOD_MASK; =20
>=20
> Not sure if this is buggy, but maybe delay updating things until the
> mapping succeeds? Fewer things to unwind.

Yes, the skb storage as well as ring buffer modification can be done
after dma mapping code.

>=20
> > +	/* Push the data cache so the CPM does not get stale memory
> > +	 * data.
> > +	 */
> > +	bdp->cbd_bufaddr =3D dma_map_single(&fep->pdev->dev, bufaddr,
> > +					  MTIP_SWITCH_TX_FRSIZE,
> > +					  DMA_TO_DEVICE);
> > +	if (unlikely(dma_mapping_error(&fep->pdev->dev,
> > bdp->cbd_bufaddr))) {
> > +		dev_err(&fep->pdev->dev,
> > +			"Failed to map descriptor tx buffer\n");
> > +		dev->stats.tx_errors++;
> > +		dev->stats.tx_dropped++; =20
>=20
> dropped and errors are two different counters
> I'd stick to dropped

Ok.

>=20
> > +		dev_kfree_skb_any(skb);
> > +		goto err;
> > +	}
> > +
> > +	/* Send it on its way.  Tell FEC it's ready, interrupt
> > when done,
> > +	 * it's the last BD of the frame, and to put the CRC on
> > the end.
> > +	 */
> > +
> > +	status |=3D (BD_ENET_TX_READY | BD_ENET_TX_INTR
> > +			| BD_ENET_TX_LAST | BD_ENET_TX_TC); =20
>=20
> The | goes at the end of the previous line, start of new line adjusts=20
> to the opening brackets..
>=20

I've refactored it.

> > +
> > +	/* Synchronize all descriptor writes */
> > +	wmb();
> > +	bdp->cbd_sc =3D status;
> > +
> > +	netif_trans_update(dev); =20
>=20
> Is this call necessary?

I've added it when I was forward porting the old driver. It can be
removed.

>=20
> > +	skb_tx_timestamp(skb);
> > +
> > +	/* Trigger transmission start */
> > +	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);
> > +
> > +	dev->stats.tx_bytes +=3D skb->len;
> > +	/* If this was the last BD in the ring,
> > +	 * start at the beginning again.
> > +	 */
> > +	if (status & BD_ENET_TX_WRAP)
> > +		bdp =3D fep->tx_bd_base;
> > +	else
> > +		bdp++;
> > +
> > +	if (bdp =3D=3D fep->dirty_tx) {
> > +		fep->tx_full =3D 1;
> > +		netif_stop_queue(dev);
> > +	}
> > +
> > +	fep->cur_tx =3D bdp;
> > + err:
> > +	spin_unlock(&fep->hw_lock);
> > +
> > +	return NETDEV_TX_OK;
> > +} =20


Thanks for the feedback.

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/m4ErR0/Y681iJgWNOq_wn4J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmh/VvcACgkQAR8vZIA0
zr0EkQf+OKA9kVy9T6DLsGgkcx0n/BaQWjeHYKKNdbWFdsYqtJ+1WK0SgmlnezPx
6W/7JzwKVM1DBH3Nw8iJUpUT7K5t4WIQTuL8amoncPzpQq3WZPf0gcRNyEKZUH9A
zsXc5Z1KcU4B9RqSz/cBQbqezZYeDUZOgJYzttjZhL51F865oe8BIOUaJIBf+WJQ
zyYcPqREs61l4QsBonzuLECUW5Ps6oUWPPOVWg6EX4YrDm01gZlkVgKr3m4lEu2F
taQChqtcKHfRbEoZ4l2tVh5kIqt2zDtqhe5bKg69fLwv3aTqly+aUlQ1QA1P3ec9
1EFyQFEyRxedvE+CctCupZGB1v0y0Q==
=VUW3
-----END PGP SIGNATURE-----

--Sig_/m4ErR0/Y681iJgWNOq_wn4J--

