Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425CFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R26jjf5EAdEgjitYVP1gkrdr/QO/CbWlMwBRvsHNzY=; b=oj1DJrpHxI1u5LyLz87OC1W7Rw
	OVQXE1i1i1uD30askFpepxZjtUTPQkCB39WGNS7B82HvOOQ7L7Y3qQfdU8v7GgY+TiJKrEB+LojhF
	ETNX0ra1byY2kp2KVdMuBondauShG2dOn7eFgXEUExoEum8Aw9FpogG4cuQaHpu4Uvxd4dSqgETSQ
	D7fUp5+ICwpFc2K/ahoctJmG8xCAedFGK6PoU/EtEf7FbNFi32ZG8wyLhPo29qajI1kLUI6Y/o4iF
	rU2Ti6sjfnD3zoA8a2vthpflhUQUYAeMqWehdmGLm8VRSHMRcYVvhRuthw0cH/dhlgWh4xTMW6M3f
	nvgoTbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Vh-0000000BxeK-3UCt;
	Thu, 20 Aug 2026 17:25:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Vg-0000000Bxdu-3Geq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:25:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4832D40D98;
	Thu, 20 Aug 2026 17:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925801F000E9;
	Thu, 20 Aug 2026 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787246700;
	bh=4R26jjf5EAdEgjitYVP1gkrdr/QO/CbWlMwBRvsHNzY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KqfKnoc/4JD+ts6rcoWaGua/u2Ecod6+E/lNf+5dRB24C2XAPmofNzTqglhPdYTOw
	 P5BNjVl1d+LmUO9S3VjN9gajR9Ei11OkDRuvlpi9Yu2fhiWblTtZUnLKkMuoHrbNqx
	 kq9ClkIraQ9bF4Sb5p0bxN7WLC6AsaOu7Xu/bYrsGfNAXafTr4Y2ru5a4kKHcLPOiv
	 8Q0MAVQNnumI4rkRd43TGuyT62e05W64dmov0N3S3rS9eyTJg9xJDuc5HnpjzZmhFq
	 p1x93yr4wgAoD64muEd2Q0kXaLeEbyh+X/KAy3cui1dTXTTyIHabv81O8pRZlA6KXd
	 gYjzW9EHoj1Dg==
Date: Thu, 20 Aug 2026 10:24:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Machon <daniel.machon@microchip.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Bjarni Jonasson <bjarni.jonasson@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, kees@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v3 2/2] net: sparx5: fix sleep in atomic context in
 MAC table access
Message-ID: <20260820102458.308b78ba@kernel.org>
In-Reply-To: <20260820143443.RTYj4Q3u@linutronix.de>
References: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
	<20260817-misc-fixes-sparx5-lan969x-v3-2-c7c7fef723a8@microchip.com>
	<20260820143443.RTYj4Q3u@linutronix.de>
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

On Thu, 20 Aug 2026 16:34:43 +0200 Sebastian Andrzej Siewior wrote:
> On 2026-08-17 17:41:59 [+0200], Daniel Machon wrote:
> =E2=80=A6
> > Fixes: d6fce5141929 ("net: sparx5: add switching support")
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com> =20
> =E2=80=A6
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/dr=
ivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > index 1d34af78166a..4dedf5d92641 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > @@ -249,7 +254,7 @@ static const struct net_device_ops sparx5_port_netd=
ev_ops =3D {
> >  	.ndo_open               =3D sparx5_port_open,
> >  	.ndo_stop               =3D sparx5_port_stop,
> >  	.ndo_start_xmit         =3D sparx5_port_xmit_impl,
> > -	.ndo_set_rx_mode        =3D sparx5_set_rx_mode,
> > +	.ndo_set_rx_mode_async  =3D sparx5_set_rx_mode,
> >  	.ndo_get_phys_port_name =3D sparx5_port_get_phys_port_name,
> >  	.ndo_set_mac_address    =3D sparx5_set_mac_address,
> >  	.ndo_validate_addr      =3D eth_validate_addr, =20
>=20
> d6fce5141929 is v5.14-rc1
> ndo_set_rx_mode_async has been introduced in v7.1-rc1.
> Youngest LTS kernel is v6.18.
>=20
> What would be the "fix" for the kernels v5.15 =E2=80=A6 v6.18?

stable should backport .ndo_set_rx_mode_async
there's been a number of similar fixes, and the whole point of=20
the new ndo was to help drivers avoid the sleeping in atomic bugs

