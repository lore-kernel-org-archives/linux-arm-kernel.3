Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSFOAuiaPI2/+DxkkZU76QYTYYbvDO8tyKW7icXghZU=; b=drHBgltTl2z6ruczlSPUlKFbpN
	bFNJeFecYzCOqwzP5VZovBUO1Vk/xuGuE0+EfV7ePLTWSAkqigz2zloQ4ukz1h14tNQDdq9zY+Kch
	GEZ+mkcMRSjggBe49QYxj0UnjQMA6rmJydCoHHHUbiRnv1RZYMXWdmae2d5O+7EdypMvbyNDmACDH
	FbrTASjBHnsOtmTiXthuf51TegjM1eetPBMgeP+AX1BUwcyeyRAjuiVGSOlFkZsjC4BWY8FJdCfbE
	L41fmzcOcL+9py6gscTvfrLGNCaCQfiYd7Oa/CV3mxMJAUpVjOxYZHPeKMxYhggWqUTfEWtr09rZ3
	/hqEFa1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsG2-00000004ur2-0p2U;
	Tue, 09 Sep 2025 06:55:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmni-00000003Njh-0YGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 01:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27545601AA;
	Tue,  9 Sep 2025 01:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F907C4CEF1;
	Tue,  9 Sep 2025 01:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757379936;
	bh=lOMpq9HD8ZJq2w0ihl+zDHfmveKIJThydH7VNjKRaeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QQbBUUZOEKmgcyR1PIp+AIKCcwn8fPT8bMELctKOeIciHM8ykBO4tFcJ3NYKG2ylm
	 M1jxFnADvYk6FZIvi6lSOKzJL0YiuJkMMFKSXZshklN94Uy9IOvXD9dcPop+KGwwvm
	 P1kzpVbIka7Cg/zuycgcpr91a3iXXncT16Iwd2YCsKS++LsFuOv6NhHNFxewmBt0t0
	 C1fB1BHQ/z2a/UxdxfLOzMkR0gioVk5kfbUcD9q2/2DTFHImi8s0xncgbEDz6umetX
	 0R+SgapDsxKYnG8EmRean8vT6oZfwIGm8el7SfSu17WZjVBR7Szo31squJU28nW0dl
	 Se2KrausOUZkQ==
Date: Mon, 8 Sep 2025 18:05:35 -0700
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
Message-ID: <20250908180535.4a6490bf@kernel.org>
In-Reply-To: <20250907183854.06771a13@wsk>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
	<20250827082512.438fd68a@kernel.org>
	<20250907183854.06771a13@wsk>
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

On Sun, 7 Sep 2025 18:38:54 +0200 =C5=81ukasz Majewski wrote:
> > On Mon, 25 Aug 2025 00:07:33 +0200 Lukasz Majewski wrote: =20
> > > +	/* Set buffer length and buffer pointer */
> > > +	bufaddr =3D skb->data;   =20
> >=20
> > You can't write (swap) skb->data if the skb is a clone.. =20
>=20
> I do use skb =3D buld_skb() which, "builds" the SKB around the memory
> page (from pool).
>=20
> Then, I "pass" this data (and swap it) to upper layer of the network
> stack.
>=20
> The same approach is used in the fec_main.c driver:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/net/ethernet/fr=
eescale/fec_main.c#L1853

I probably cut out too much context. I think I was quoting from Tx,
indeed on Rx this is not an issue.

> What I'm trying to do - is to model the HW which I do have...
>=20
> When switch is enabled I do have ONE uDMA0 which works for both eth
> ports (lan0 and lan1).
>=20
> That is why I do have only one NAPI queue.
>=20
> > What makes my head spin is that you seem to record which
> > netdev/port was doing Rx _last_ and then pass that netdev to
> > mtip_switch_tx(). Why? =20
>=20
> You may have port =3D=3D 1 || port =3D=3D 2 when you receive packet from =
ingres
> ports.
> You may also have port =3D=3D 0xFF when you first time encounter the SA on
> the port and port =3D=3D 0 when you send/receive data from the "host"
> interface.
>=20
> When port 1/2 is "detected" then the net dev for this particular port
> is used. In other cases the one for NAPI is used (which is one of those
> two - please see comment above).
>=20
> This was the approach from original NXP (Freescale) driver. It in some
> way prevents from "starvation" from net devices when L2 switch is
> disabled and I need to provide port separation.
>=20
> (port separation in fact is achieved by programming L2 switch registers
> and is realized in HW).

But what if we have mixed traffic from port 1 and 2?
Does the current code correctly Rx the packets from port 1 on the
netdev from port 1 and packets from port 2 on the netdev from port 2?

> > Isn't the dev that we're completing Tx for is
> > best read from skb->dev packet by packet? =20
>=20
> It may be worth to try.... I think that the code, which we do have now,
> tries to reuse some kind of "locality".
>=20
> > Also this wake up logic
> > looks like it will wake up _one_ netdev's queue and then set tx_full
> > =3D 0, so presumably it will not wake the other port if both ports
> > queues were stopped. Why keep tx_full state in the first place? Just
> > check if the queues is stopped..? =20
>=20
> As I said - we do have only ONE queue, which corresponds to uDMA0 when
> the switch is enabled. This single queue is responsible for handling
> transmission for both ports (this is how the HW is designed).

Right but kernel has two SW queues. Which can be independently stopped.
So my concerns is that for example port 1 is very busy so the queue is
full of packets for port 1, port 1's netdev's queue gets stopped.
Then port 2 tries to Tx, queue is shared, and is full, so netdev 2's
SW queue is also stopped. Then we complete the packets, because packets
were for port 1 we wake the queue for port 1. But port 2 also got
stopped, even tho it never put a packet on the ring..

Long story short I think you need to always stop and start queues from
both netdevs.. There's just 2 so not too bad of a hack.

