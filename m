Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F56C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGahUqCdf5meXkcjTq5OK95LkheDAyTPie1mUYbgP78=; b=IV6R7OVzxDF+ZsZdLdY8UbLjnB
	BGmp/pb5oOSV1si0q2EM+g6CM/xpUX3LzINwbznqGi82WwlTa5rNgo8AVjNOcCAjYXihQf6FXIZxN
	WCyKpk3/ENmdv40+mU8CLkSYcQRCNw4ELfKeB+yAPELu6PcBrLvxcICcWlZvVczNPa2s5110TCSE2
	mRQFyh4aUSyvUaeOXDIfAEbD5zsi0ewi1Tz0f8RxSxB5L6AAZ1q0nL5uYPR0/Lvo/+5XxUND+UtE9
	jgiEX93Zz0Xf+6nkmM/ksbFohFLo9nmacBfdv/5a/hjAkmB+/KXTnYlqoQpmcdgYnj66a8aA12274
	Iz8kXmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCRc-000000071gN-3maj;
	Tue, 24 Jun 2025 22:48:48 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBba-00000006uuc-2CE4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 21:55:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C4AF101E8501;
	Tue, 24 Jun 2025 23:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750802100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wGahUqCdf5meXkcjTq5OK95LkheDAyTPie1mUYbgP78=;
	b=RJgakawTrO/SDfig9PyagjMfiQukmvus9v/OOWf32WB0Rol8PnMAFUaqO9yYwtFGkb2eZr
	8ETiK8jI411rC7apwziHw2QUjkIUhnubRG7WgHjQjS+hwq/Co2vaJYWsKHgGLISZHwBqua
	biK80g4vB0MM0MJ0OhvEzOOP86velfSX8Nd2BkP2TE/m2VubbwqbDReGzeY9aDU7fnvPwI
	wi4FFgDaKZjhByrDqQe06PNhlKvSkrmm+EL1wTQfCP1YwP0+dzM8QYZtoI0pdW+q60cOOx
	ctexi56Wro4TtaGCJColMP1RAzFC9FE8piD5UXQN3EjC2qpFxp9U327aoAnIYA==
Date: Tue, 24 Jun 2025 23:54:54 +0200
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
Subject: Re: [net-next v13 06/11] net: mtip: Add mtip_switch_{rx|tx}
 functions to the L2 switch driver
Message-ID: <20250624235454.1bf0b96a@wsk>
In-Reply-To: <0de412ee-c9ce-463b-92ef-58a33fd132d1@redhat.com>
References: <20250622093756.2895000-1-lukma@denx.de>
	<20250622093756.2895000-7-lukma@denx.de>
	<0de412ee-c9ce-463b-92ef-58a33fd132d1@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V++v/0cAATHYMBWHAJHNfXt";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_145502_863730_F50BDFA7 
X-CRM114-Status: GOOD (  52.99  )
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

--Sig_/V++v/0cAATHYMBWHAJHNfXt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> > This patch provides mtip_switch_tx and mtip_switch_rx functions
> > code for MTIP L2 switch.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v13:
> > - New patch - created by excluding some code from large (i.e. v12
> > and earlier) MTIP driver
> > ---
> >  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 252
> > ++++++++++++++++++ 1 file changed, 252 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 813cd39d6d56..a4e38e0d773e 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c @@ -228,6
> > +228,39 @@ struct mtip_port_info *mtip_portinfofifo_read(struct
> > switch_enet_private *fep) return info; }
> > =20
> > +static void mtip_atable_get_entry_port_number(struct
> > switch_enet_private *fep,
> > +					      unsigned char
> > *mac_addr, u8 *port) +{
> > +	int block_index, block_index_end, entry;
> > +	u32 mac_addr_lo, mac_addr_hi;
> > +	u32 read_lo, read_hi;
> > +
> > +	mac_addr_lo =3D (u32)((mac_addr[3] << 24) | (mac_addr[2] <<
> > 16) |
> > +			    (mac_addr[1] << 8) | mac_addr[0]);
> > +	mac_addr_hi =3D (u32)((mac_addr[5] << 8) | (mac_addr[4]));
> > +
> > +	block_index =3D GET_BLOCK_PTR(crc8_calc(mac_addr));
> > +	block_index_end =3D block_index + ATABLE_ENTRY_PER_SLOT;
> > +
> > +	/* now search all the entries in the selected block */
> > +	for (entry =3D block_index; entry < block_index_end;
> > entry++) {
> > +		mtip_read_atable(fep, entry, &read_lo, &read_hi);
> > +		*port =3D MTIP_PORT_FORWARDING_INIT;
> > +
> > +		if (read_lo =3D=3D mac_addr_lo &&
> > +		    ((read_hi & 0x0000FFFF) =3D=3D
> > +		     (mac_addr_hi & 0x0000FFFF))) {
> > +			/* found the correct address */
> > +			if ((read_hi & (1 << 16)) && (!(read_hi &
> > (1 << 17))))
> > +				*port =3D FIELD_GET(AT_PORT_MASK,
> > read_hi);
> > +			break;
> > +		}
> > +	}
> > +
> > +	dev_dbg(&fep->pdev->dev, "%s: MAC: %pM PORT: 0x%x\n",
> > __func__,
> > +		mac_addr, *port);
> > +}
> > +
> >  /* Clear complete MAC Look Up Table */
> >  void mtip_clear_atable(struct switch_enet_private *fep)
> >  {
> > @@ -820,10 +853,229 @@ static irqreturn_t mtip_interrupt(int irq,
> > void *ptr_fep)=20
> >  static void mtip_switch_tx(struct net_device *dev)
> >  {
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	unsigned short status;
> > +	struct sk_buff *skb;
> > +	unsigned long flags;
> > +	struct cbd_t *bdp;
> > +
> > +	spin_lock_irqsave(&fep->hw_lock, flags); =20
>=20
> This is called from napi (bh) context, and every other caller
> is/should be BH, too. You should use
>=20
> 	spin_lock_bh()
>=20

Ok.

> Also please test your patches with CONFIG_LOCKDEP and
> CONFIG_DEBUG_SPINLOCK enabled, thet will help finding this king of
> issues.

Ok. I will check with lockdep.

>=20
> /P
>=20
> > +	bdp =3D fep->dirty_tx;
> > +
> > +	while (((status =3D bdp->cbd_sc) & BD_ENET_TX_READY) =3D=3D 0) {
> > +		if (bdp =3D=3D fep->cur_tx && fep->tx_full =3D=3D 0)
> > +			break;
> > +
> > +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> > +				 MTIP_SWITCH_TX_FRSIZE,
> > DMA_TO_DEVICE);
> > +		bdp->cbd_bufaddr =3D 0;
> > +		skb =3D fep->tx_skbuff[fep->skb_dirty];
> > +		/* Check for errors */
> > +		if (status & (BD_ENET_TX_HB | BD_ENET_TX_LC |
> > +				   BD_ENET_TX_RL | BD_ENET_TX_UN |
> > +				   BD_ENET_TX_CSL)) {
> > +			dev->stats.tx_errors++;
> > +			if (status & BD_ENET_TX_HB)  /* No
> > heartbeat */
> > +				dev->stats.tx_heartbeat_errors++;
> > +			if (status & BD_ENET_TX_LC)  /* Late
> > collision */
> > +				dev->stats.tx_window_errors++;
> > +			if (status & BD_ENET_TX_RL)  /* Retrans
> > limit */
> > +				dev->stats.tx_aborted_errors++;
> > +			if (status & BD_ENET_TX_UN)  /* Underrun */
> > +				dev->stats.tx_fifo_errors++;
> > +			if (status & BD_ENET_TX_CSL) /* Carrier
> > lost */
> > +				dev->stats.tx_carrier_errors++;
> > +		} else {
> > +			dev->stats.tx_packets++;
> > +		}
> > +
> > +		if (status & BD_ENET_TX_READY)
> > +			dev_err(&fep->pdev->dev,
> > +				"Enet xmit interrupt and
> > TX_READY.\n"); +
> > +		/* Deferred means some collisions occurred during
> > transmit,
> > +		 * but we eventually sent the packet OK.
> > +		 */
> > +		if (status & BD_ENET_TX_DEF)
> > +			dev->stats.collisions++;
> > +
> > +		/* Free the sk buffer associated with this last
> > transmit */
> > +		dev_consume_skb_irq(skb);
> > +		fep->tx_skbuff[fep->skb_dirty] =3D NULL;
> > +		fep->skb_dirty =3D (fep->skb_dirty + 1) &
> > TX_RING_MOD_MASK; +
> > +		/* Update pointer to next buffer descriptor to be
> > transmitted */
> > +		if (status & BD_ENET_TX_WRAP)
> > +			bdp =3D fep->tx_bd_base;
> > +		else
> > +			bdp++;
> > +
> > +		/* Since we have freed up a buffer, the ring is no
> > longer
> > +		 * full.
> > +		 */
> > +		if (fep->tx_full) {
> > +			fep->tx_full =3D 0;
> > +			if (netif_queue_stopped(dev))
> > +				netif_wake_queue(dev);
> > +		}
> > +	}
> > +	fep->dirty_tx =3D bdp;
> > +	spin_unlock_irqrestore(&fep->hw_lock, flags);
> >  }
> > =20
> > +/* During a receive, the cur_rx points to the current incoming
> > buffer.
> > + * When we update through the ring, if the next incoming buffer has
> > + * not been given to the system, we just set the empty indicator,
> > + * effectively tossing the packet.
> > + */
> >  static int mtip_switch_rx(struct net_device *dev, int budget, int
> > *port) {
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	u8 *data, rx_port =3D MTIP_PORT_FORWARDING_INIT;
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	unsigned short status, pkt_len;
> > +	struct net_device *pndev;
> > +	struct ethhdr *eth_hdr;
> > +	int pkt_received =3D 0;
> > +	struct sk_buff *skb;
> > +	struct cbd_t *bdp;
> > +	struct page *page;
> > +
> > +	spin_lock_bh(&fep->hw_lock);
> > +
> > +	/* First, grab all of the stats for the incoming packet.
> > +	 * These get messed up if we get called due to a busy
> > condition.
> > +	 */
> > +	bdp =3D fep->cur_rx;
> > +
> > +	while (!((status =3D bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {
> > +		if (pkt_received >=3D budget)
> > +			break;
> > +
> > +		pkt_received++;
> > +		/* Since we have allocated space to hold a
> > complete frame,
> > +		 * the last indicator should be set.
> > +		 */
> > +		if ((status & BD_ENET_RX_LAST) =3D=3D 0)
> > +			dev_warn_ratelimited(&dev->dev,
> > +					     "SWITCH ENET: rcv is
> > not +last\n"); =20
>=20
> Probably you want to break the look when this condition is hit.

Ok.

>=20
> > +
> > +		if (!fep->usage_count)
> > +			goto rx_processing_done;
> > +
> > +		/* Check for errors. */
> > +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH |
> > BD_ENET_RX_NO |
> > +			      BD_ENET_RX_CR | BD_ENET_RX_OV)) {
> > +			dev->stats.rx_errors++;
> > +			if (status & (BD_ENET_RX_LG |
> > BD_ENET_RX_SH)) {
> > +				/* Frame too long or too short. */
> > +				dev->stats.rx_length_errors++;
> > +			}
> > +			if (status & BD_ENET_RX_NO)	/*
> > Frame alignment */
> > +				dev->stats.rx_frame_errors++;
> > +			if (status & BD_ENET_RX_CR)	/* CRC
> > Error */
> > +				dev->stats.rx_crc_errors++;
> > +			if (status & BD_ENET_RX_OV)	/* FIFO
> > overrun */
> > +				dev->stats.rx_fifo_errors++;
> > +		}
> > +
> > +		/* Report late collisions as a frame error.
> > +		 * On this error, the BD is closed, but we don't
> > know what we
> > +		 * have in the buffer.  So, just drop this frame
> > on the floor.
> > +		 */
> > +		if (status & BD_ENET_RX_CL) {
> > +			dev->stats.rx_errors++;
> > +			dev->stats.rx_frame_errors++;
> > +			goto rx_processing_done;
> > +		}
> > +
> > +		/* Get correct RX page */
> > +		page =3D fep->page[bdp - fep->rx_bd_base];
> > +		/* Process the incoming frame */
> > +		pkt_len =3D bdp->cbd_datlen;
> > +		data =3D (__u8 *)__va(bdp->cbd_bufaddr);
> > +
> > +		dma_sync_single_for_cpu(&fep->pdev->dev,
> > bdp->cbd_bufaddr,
> > +					pkt_len, DMA_FROM_DEVICE);
> > +		prefetch(page_address(page)); =20
>=20
> Use net_prefetch() instead
>=20

Ok.

> > +
> > +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> > +			swap_buffer(data, pkt_len);
> > +
> > +		if (data) {
> > +			eth_hdr =3D (struct ethhdr *)data;
> > +			mtip_atable_get_entry_port_number(fep,
> > +
> > eth_hdr->h_source,
> > +
> > &rx_port);
> > +			if (rx_port =3D=3D MTIP_PORT_FORWARDING_INIT)
> > +
> > mtip_atable_dynamicms_learn_migration(fep,
> > +
> >    fep->curr_time,
> > +
> >    eth_hdr->h_source,
> > +
> >    &rx_port);
> > +		}
> > +
> > +		if ((rx_port =3D=3D 1 || rx_port =3D=3D 2) &&
> > fep->ndev[rx_port - 1])
> > +			pndev =3D fep->ndev[rx_port - 1];
> > +		else
> > +			pndev =3D dev;
> > +
> > +		*port =3D rx_port; =20
>=20
> Do i read correctly that several network device use the same napi
> instance? That will break napi assumptions and will incorrectly allow
> napi merging packets coming from different devices.

Isn't that for what the L2 switch is for? :-)


To present the problem is this IP block:

1. I will put aside the "separate" mode, which is only used until the
bridge is created [*]. In this mode we do have separate uDMAs for each
ports (i.e. uDMA0 and uDMA1).

2. When offloading in HW L2 frames switching we do have single uDMA0 for
the bridge (other such devices have separate DMAs for each port - like
ti's cpsw - the offloading is only by setting one bit - i.e. this bit
enables switching without touching DMA configuration/setup).

That is why the NAPI is as single instance defined inside
struct switch_enet_private. It reflects the single uDMA0 used when
switching offloading is activated.

>=20
> > +
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
> > +			page_pool_recycle_direct(fep->page_pool,
> > page);
> > +			pndev->stats.rx_dropped++;
> > +			goto err_mem;
> > +		} else { =20
>=20
> No need for the else statement above.
>=20

Ok.

> /P
>=20

Note:

[*]:

ip link add name br0 type bridge;
ip link set lan0 master br0;=20
ip link set lan1 master br0;=20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/V++v/0cAATHYMBWHAJHNfXt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhbHq4ACgkQAR8vZIA0
zr0uBQf8ClaEXIB7Av4OnhGxTJenAk/pKse6Lyj4+j5Y4PKNcWZTCIP5Pot96HqJ
Bw64dbS5itTjrWt3ondaTumtSiW2FmravAH1CsauaFa+3RH9LHe7TXop/ac+FATr
6ZbwU2g1fo5uUXVx9Lj63be0cDYCED9PubhcIPh0cL/wsKatiUG0nn2bz3/IMfT+
2zlgwcPh1gUKis+IoZ1gAYdaRxn3MUkSdNF8GqQNE55sZVittTErhi8UzwV178Qg
IWtJxrjoxp8uQyEQvDfFVunGmLEJ724XFtxlt44OTsD+wsTeKbHDmU/JIrsO1cKt
Q7G4GIjvo5BaL0QZvXbACBWaJcxvJA==
=kw5E
-----END PGP SIGNATURE-----

--Sig_/V++v/0cAATHYMBWHAJHNfXt--

