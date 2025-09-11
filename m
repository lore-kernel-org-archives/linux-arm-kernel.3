Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2548CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 00:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQdJimVdrTjdv9FHvitb+AYo3/PKMRelOcsVPDf5zlo=; b=kcF6CBKqc4/fDOqw3PJZrSR9aj
	71GZvUaIXaHlCyMTc1P22GEQkKi+1fHsbOcz+witocutm+Ca/o2q+u/1n1NfCjXP49jt4WzGjC+RT
	TpL7Z4H/QtSknaOZ1Hqs2QYWJwPBzlhhYlvMn1EHCE22VId4yQUauBcrcoe6sF2g/sIXp9UJxKBMw
	xCKbOMeYjmTLc8Dl3Tycy5dxR6y8tjksdma0qav9LTCB6jyOs19a4LWzo3T9eb6+aHBvwd11d3dhk
	T0xQWLgu+mlTe4qf+krAZexNIa1+Kdqb6sd6wAtHAdc9Z98gwjhRMRMhs3Uu+n+W5bSh+xsvNBt3R
	zsTZsWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwV5V-0000000HU9d-0RxT;
	Thu, 11 Sep 2025 00:22:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwV5T-0000000HU91-2aqA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 00:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A46296013B;
	Thu, 11 Sep 2025 00:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5974C4CEEB;
	Thu, 11 Sep 2025 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757550173;
	bh=3jhXISuBePjdRc28QV10bEyxfZW++/4+rnhlfaFG4TQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i52ZFODYMHww4ukoSCYBB0gKhmjOdv13UwWd/T2dMkrFLDRdbz+wXLy0QDuA11pNZ
	 nMJjH5kGv1IMZtdlU756ENaoseb6TyMpt2PWVbdkpvIdLBJhcULyypP+/rq5wk4n2a
	 CwQ09Y0DsLJgb8sQ2alPWPsNUxLEIFbzxgOHcw5rBhEaSrH1KAd9vXkcanro4XJ33w
	 KpFMcVr+iCU2Z/Ax1JVehK/0fdXfiKrjbMKc9apyuh7h+HTtazKx7YSBzl4fKyfVSt
	 wkm1pklByS/tk6PcmH1t2uL+7OZr/NwBTptVWA0Fd4acws5ZWTgYPSpoWhMTVsIqhj
	 q7gHm3gx6v+0g==
Date: Wed, 10 Sep 2025 17:22:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
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
Subject: Re: [net-next v19 4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250910172251.072a8d36@kernel.org>
In-Reply-To: <20250910231552.13a5d963@wsk>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
	<20250827082512.438fd68a@kernel.org>
	<20250907183854.06771a13@wsk>
	<20250908180535.4a6490bf@kernel.org>
	<20250910231552.13a5d963@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Sep 2025 23:15:52 +0200 =C5=81ukasz Majewski wrote:
> > > I do use skb =3D buld_skb() which, "builds" the SKB around the memory
> > > page (from pool).
> > >=20
> > > Then, I "pass" this data (and swap it) to upper layer of the network
> > > stack.
> > >=20
> > > The same approach is used in the fec_main.c driver:
> > > https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/net/etherne=
t/freescale/fec_main.c#L1853
> > >   =20
> >=20
> > I probably cut out too much context. I think I was quoting from Tx,
> > indeed on Rx this is not an issue. =20
>=20
> Ok. No adjustments needed then. Good :)

No, you were talking about build_skb() which is Rx.
This is the patch that adds Tx. Tx is wrong.
You can't modify the skb unless you call skb_cow().
Or just copy the data out to your local buffer.

> > > You may have port =3D=3D 1 || port =3D=3D 2 when you receive packet f=
rom
> > > ingres ports.
> > > You may also have port =3D=3D 0xFF when you first time encounter the =
SA
> > > on the port and port =3D=3D 0 when you send/receive data from the "ho=
st"
> > > interface.
> > >=20
> > > When port 1/2 is "detected" then the net dev for this particular
> > > port is used. In other cases the one for NAPI is used (which is one
> > > of those two - please see comment above).
> > >=20
> > > This was the approach from original NXP (Freescale) driver. It in
> > > some way prevents from "starvation" from net devices when L2 switch
> > > is disabled and I need to provide port separation.
> > >=20
> > > (port separation in fact is achieved by programming L2 switch
> > > registers and is realized in HW).   =20
> >=20
> > But what if we have mixed traffic from port 1 and 2?
> > Does the current code correctly Rx the packets from port 1 on the
> > netdev from port 1 and packets from port 2 on the netdev from port 2? =
=20
>=20
> Yes, it does.
>=20
> In the mtip_rx_napi() you have call to mtip_switch_rx() which accepts
> pointer to port variable.
>=20
> It sets it according to the information provided by the switch IP block
> HW and also adjust the skb's ndev.
>=20
> I'm just wondering if the snippet from mtip_rx_napi():
> -------8<--------
> if ((port =3D=3D 1 || port =3D=3D 2) && fep->ndev[port - 1]
> 	mtip_switch_tx(fep->ndev[port - 1]);
> else
> 	mtip_switch_tx(napi->dev);
> ------->8-------- =20
>=20
> could be replaced just with mtip_switch_tx(napi->dev);
> as TX via napi->dev shall be forward to both ports if required.
>=20
> I will check if this can be done in such a way.

Not napi->dev. You have to attribute sent packets to the right netdev.

> > > As I said - we do have only ONE queue, which corresponds to uDMA0
> > > when the switch is enabled. This single queue is responsible for
> > > handling transmission for both ports (this is how the HW is
> > > designed).   =20
> >=20
> > Right but kernel has two SW queues. =20
>=20
> You mean a separate SW queues for each devices? This is not supported
> in the MTIP L2 switch driver. Maybe such high level SW queues
> management is available in the upper layers?

Not possible, each netdev has it's own private qdisc tree.

> > Which can be independently
> > stopped. =20
>=20
> It supports separate RX and TX HW queues (i.e. ring buffers for
> descriptors) for the uDMA0 when switch is enabled.
>=20
> When you want to send data (no matter from which lan[01] device) the
> same mtip_start_xmit() is called, the HW TX descriptor is setup and is
> passed via uDMA0 to L2 switch IP block.
>=20
> For next TX transmission (even from different port) we assign another
> descriptor from the ring buffer.
>=20
> > So my concerns is that for example port 1 is very busy so
> > the queue is full of packets for port 1, port 1's netdev's queue gets
> > stopped. Then port 2 tries to Tx, queue is shared, and is full, so
> > netdev 2's SW queue is also stopped. Then we complete the packets,
> > because packets were for port 1 we wake the queue for port 1. But
> > port 2 also got stopped, even tho it never put a packet on the ring..
> >  =20
>=20
> As fair as I can tell - both ports call mtip_start_xmit(), their data
> is serialized to the TX queue (via descriptors).
>=20
> Queued descriptors are sent always at some point (or overridden if
> critical error encountered).
>=20
> > Long story short I think you need to always stop and start queues from
> > both netdevs.. There's just 2 so not too bad of a hack. =20
>=20
> Maybe there are some peculiarities in for example bridge code (or upper
> network stack layers in general), but I think, that I don't need any
> extra "queue" management for TX code of MTIP L2 switch.

I think I explained this enough times. Next version is v20.
If it's not significantly better than this one, I'm going to have=20
to ask you to stop posting this driver.

