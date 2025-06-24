Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F12C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UhNAC3lKdYVhIoChsWVA+SRZl7G6DDkisMf4TzuHdo=; b=xsLBz38HqpSNfW90KJjWZEimZ3
	Vvnh0MG/pnwng4HOKrn76bsItzg8KUx1pa2AMLb3A7nqAPx7utP0yvpzTVHrvdR07p782vnIaZYPJ
	7cNnIgsHF17E9QTIZuPDwgco//SIYWpOwk5YJsg5eOCBEHIe/wKsmALJzYixMZNdQCVmjlwKqbeyW
	yJEa0hWqOdjNz3CoUOGTxF4bSUk0q81NUZ7U8EcdFMGCvqhrHVtBMcvsli9Rap5xjZA8+t52gGl6r
	xEaN5DO4e8SGogpJK1uopY75Q7pfPi7TXnItCk5aoYhEYiBSYC3zEXwgkl+kXDfwGpLRWt22Y6yc2
	1668F3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCPN-000000071P1-0Ij9;
	Tue, 24 Jun 2025 22:46:29 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBH3-00000006suc-29IO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 21:33:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 813B0101DC30D;
	Tue, 24 Jun 2025 23:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750800826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4UhNAC3lKdYVhIoChsWVA+SRZl7G6DDkisMf4TzuHdo=;
	b=BhtecKHFSH40sq5dBlZLZSkAGauBEg3kEus/1IipfnwaDjZu3QDaNMxlbQJV2bOLttJivj
	7qsER9CSOEEC+QIH4qDqBcFgCnG2Dkykui8GOkUjvQHhr9z+yFkw5eJlXMmA4mb/TxnNfI
	FH4uSgDuaUwm/zX0NCVeN9r6+Wo9DvNpwWnJNWWGnE+w2ULZHPnSvB2h84fwVg7rkUm+eK
	blREfwEWax3TCwtFSTs55KLhW6Bjvo44vTOlPgdFLbHdbabb7XqcuwQaHo9Uh13vQFSbel
	C+h3F6hw2krNjW3lZsoeogcpPoQuuEwOhrIqGtqUtdzq236ivTUwd1Gky8OAig==
Date: Tue, 24 Jun 2025 23:33:42 +0200
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
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v13 05/11] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250624233342.5fdb37af@wsk>
In-Reply-To: <c82c19a6-fd0f-4efe-9d93-838b52102ff4@redhat.com>
References: <20250622093756.2895000-1-lukma@denx.de>
	<20250622093756.2895000-6-lukma@denx.de>
	<c82c19a6-fd0f-4efe-9d93-838b52102ff4@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CJrMgWIo4Z=lmZ0vE4F4UWW";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_143349_849797_AE4B8278 
X-CRM114-Status: GOOD (  43.59  )
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

--Sig_/CJrMgWIo4Z=lmZ0vE4F4UWW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> > This patch provides callbacks for struct net_device_ops for MTIP
> > L2 switch.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >=20
> > ---
> > Changes for v13:
> > - New patch - created by excluding some code from large (i.e. v12
> > and earlier) MTIP driver
> > ---
> >  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 273
> > ++++++++++++++++++ 1 file changed, 273 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 5142f647d939..813cd39d6d56 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c @@ -43,6 +43,15
> > @@=20
> >  #include "mtipl2sw.h"
> > =20
> > +static void swap_buffer(void *bufaddr, int len)
> > +{
> > +	int i;
> > +	unsigned int *buf =3D bufaddr;
> > +
> > +	for (i =3D 0; i < len; i +=3D 4, buf++)
> > +		swab32s(buf);
> > +}
> > +
> >  /* Set the last buffer to wrap */
> >  static void mtip_set_last_buf_to_wrap(struct cbd_t *bdp)
> >  {
> > @@ -444,6 +453,128 @@ static void mtip_config_switch(struct
> > switch_enet_private *fep) fep->hwp + ESW_IMR);
> >  }
> > =20
> > +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> > +					struct net_device *dev,
> > int port) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	unsigned short status;
> > +	struct cbd_t *bdp;
> > +	void *bufaddr;
> > +
> > +	spin_lock_bh(&fep->hw_lock);
> > +
> > +	if (!fep->link[0] && !fep->link[1]) {
> > +		/* Link is down or autonegotiation is in progress.
> > */
> > +		netif_stop_queue(dev);
> > +		spin_unlock_bh(&fep->hw_lock);
> > +		return NETDEV_TX_BUSY;
> > +	}
> > +
> > +	/* Fill in a Tx ring entry */
> > +	bdp =3D fep->cur_tx;
> > +
> > +	status =3D bdp->cbd_sc;
> > +
> > +	if (status & BD_ENET_TX_READY) {
> > +		/* All transmit buffers are full. Bail out.
> > +		 * This should not happen, since dev->tbusy should
> > be set.
> > +		 */
> > +		netif_stop_queue(dev);
> > +		dev_err(&fep->pdev->dev, "%s: tx queue full!.\n",
> > dev->name);
> > +		spin_unlock_bh(&fep->hw_lock);
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
> > +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {
> > +		unsigned int index;
> > +
> > +		index =3D bdp - fep->tx_bd_base;
> > +		memcpy(fep->tx_bounce[index],
> > +		       (void *)skb->data, skb->len);
> > +		bufaddr =3D fep->tx_bounce[index];
> > +	}
> > +
> > +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> > +		swap_buffer(bufaddr, skb->len);
> > +
> > +	/* Save skb pointer. */
> > +	fep->tx_skbuff[fep->skb_cur] =3D skb;
> > +
> > +	fep->skb_cur =3D (fep->skb_cur + 1) & TX_RING_MOD_MASK;
> > +
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
> > +		dev->stats.tx_dropped++;
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
> > +			| BD_ENET_TX_LAST | BD_ENET_TX_TC);
> > +
> > +	/* Synchronize all descriptor writes */
> > +	wmb();
> > +	bdp->cbd_sc =3D status;
> > +
> > +	netif_trans_update(dev);
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
> > +		netif_stop_queue(dev); =20
>=20
> You may want to stop the queue earlier, i.e. when 75% or the like of
> the tx ring is full. Also you can use netif_txq_maybe_stop() - with
> txq =3D=3D netdev_get_tx_queue(dev, 0)

There are two main reasons why the netif queue management is so rugged:

1. Due to simplicity - this driver is not using txq (queues), so I
cannot use APIs using as input argument queues. That is why functions
accepting only struct netdev pointer are used.

2. My feeling is that I would need to use queues abstraction only for
one queue - so this would be extra code overhead. I'm trying to
upstream driver which in fact has very simple internals (i.e. ringbuf
with 16 descriptors for tx/rx).

>=20
> [...]
> > +static void mtip_timeout(struct net_device *dev, unsigned int
> > txqueue) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct cbd_t *bdp;
> > +	int i;
> > +
> > +	dev->stats.tx_errors++;
> > +
> > +	if (IS_ENABLED(CONFIG_SWITCH_DEBUG)) {
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
> > +		} =20
>=20
> Here you are traversing both rings without any lock, which looks race
> prone.

I will add  spin_{un}lock_bh(&fep->hw_lock); (this is only code used
for debugging, not production)

>=20
> /P
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/CJrMgWIo4Z=lmZ0vE4F4UWW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhbGbYACgkQAR8vZIA0
zr1nQAf8DbYsGNqHDbFPU8PQZ/XrmTtF041853WB8TNnJwaOsUnvvoywrOrdDFqt
9jzOpwf2AB6RZB1BDHGVyzNeOHW1UdfkrAL/z5Ko7r9Nx5vkicMSFTX+Orf1NJtX
FCHTxYxx0uN/rbHUmKXaqgN9pvXc+AlpoB7eC/v2CJnvbSMF8S3iklvBhpJ6YVm/
LQS/WjrmKmJSL+NZO5hy3TaMbsLi3Hv4yQAao4xmYDf7JG5xcy+VewQSv8+CY1Fj
T4a91/L5+ueoyZ1Pwlnzr/RrRrhnHKspVRIrnexH1dQJ2oCUB3X1KmsSC+yjIDAb
pC4DEXZZu3VOA+HDAikhW8tGF5DM4A==
=HTk3
-----END PGP SIGNATURE-----

--Sig_/CJrMgWIo4Z=lmZ0vE4F4UWW--

