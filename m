Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF9EC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obn1fFptpDWsfOTGxxja0aYNB+v0Pa/lgexMoMKfewU=; b=OPFtf5FDibGoj/JOPYkPLbcqPN
	nYO3FljytQyei4Qqao4r5hPfK+N81pPcoiq00YEp1VvarrhPgSrfucNf3ml2CtFNFI03ZVsZ0n6n1
	jNKjtU99AaXxu3ZMsbkhrgRCwAm43+Xqocg8zduoEpKkRl8LdgVPkL86KLWoJXd3vn5y5EB4sGYah
	x81XTwZmty3F1ePbg0ylk/LS7rLmyXTvLgTVLP3E0eNWfkbsl3ShAuk/a2m6TPSse8PNbqVzNSzpf
	b9k4G8/b2ndwdeX0XztUfjJRnlBMs4e3lv3v8JTZxu6KTlbGwKhMrKhdHq3b0d0PJasA3u1fnn3OG
	ONWVbQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWD7W-0000000278T-3UlX;
	Mon, 30 Jun 2025 11:56:22 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCmd-0000000234Q-3Dqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:34:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8878A10380104;
	Mon, 30 Jun 2025 13:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1751283283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=obn1fFptpDWsfOTGxxja0aYNB+v0Pa/lgexMoMKfewU=;
	b=AQKIf/Udw+b5eHV6+NEZhbR5iX7W6bnm9XB4i+kaxnIFF7ccKGLFWIWC5uMO3mJ8qit8Ip
	syY2HMQgXz/9DhT8zh6n3gqlEnCwMxdalNKZL19Gt5E11nFXihxyA9tVQ1ln9KP7QE6Aid
	swuQKBUviYdIb5tD18Ii2WK8aE1RDLUjJz6jKzA4KZNNfcKsqkRf39KQKht9qDteCaiYkk
	1lMb68+r+Yd8p9pXy44vqdcBKerwNy6x7dyMARVmvWFTWu921/6iGCr9nFM/LXTunUVRKp
	jF18ykoSo/sMQUVo7s8rX8Azv5fFl096GpeWJulsTb5gJ1QmdssrG9NCTqk8vw==
Date: Mon, 30 Jun 2025 13:34:36 +0200
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
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, =?UTF-8?B?xYF1a2Fz?=
 =?UTF-8?B?eg==?= Majewski <lukasz.majewski@mailbox.org>
Subject: Re: [net-next v13 06/11] net: mtip: Add mtip_switch_{rx|tx}
 functions to the L2 switch driver
Message-ID: <20250630133436.71238a65@wsk>
In-Reply-To: <0de412ee-c9ce-463b-92ef-58a33fd132d1@redhat.com>
References: <20250622093756.2895000-1-lukma@denx.de>
	<20250622093756.2895000-7-lukma@denx.de>
	<0de412ee-c9ce-463b-92ef-58a33fd132d1@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ft7tAwYwUt/T1YMHVHAewjX";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_043447_972678_BC335BF1 
X-CRM114-Status: GOOD (  23.05  )
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

--Sig_/ft7tAwYwUt/T1YMHVHAewjX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

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

I've double check the spin locking in the driver - I've also consult
the fec_main.c.

It looks like the mtip_switch_rx() and fec_enet_rx() are not using
explicit locks and rely on NAPI locking.

On the other hand - the fec_enet_tx (and corresponding MTIP variant)
use spin_lock(), not the _bh() variant.

>=20
> Also please test your patches with CONFIG_LOCKDEP and
> CONFIG_DEBUG_SPINLOCK enabled, thet will help finding this king of
> issues.

This was enabled by default. By changing all locks to _bh() there were
deadlocks observed.

On the MTIP driver (due to this HW IP block) there are some locks which
must disable interrupts:

1. One is when mtip_adjust_link() is called - as it is the same for
both switch ports. Moreover, at some use cases it is required that the
switch IP block is reset.

2. The mtip_atable_dynamicms_learn_migration() - it changes the content
of dynamic switching table. IRQ from switch shall not be possible at
this time as it can be called from mtip_switch_rx() (from NAPI) and
from timer/kthread (at specified period).


To sum up:

I'm going to prepare the v14 with changes around the timer / kthread
running mtip_atable_dynamicms_learn_migration() and use time stamps
extracted from jiffies.

Locks will be optimized and following paradigm used with fec_main.c
driver.

>=20
> /P


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ft7tAwYwUt/T1YMHVHAewjX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhidkwACgkQAR8vZIA0
zr1gIwgA5RFaOOf/zToxgLklld0AgiA7amktt6Vm7D+yrAK4VbOKEnAMTahAU7iE
Z/aSDSy3TmQ6p+k7SOMCK/W7UyAGi4nIffvLFo5N4PGTYmBqVhq+qlpjSm7bnFAU
mUKTz6s/N3KoneKHrKRf6ogC4PubkGH4RqQ4gVbr0YZgwd4XsA6uEFVoPYeUQ25U
EVRkOV9W2ouDS/MpoHsQoFN35ottbyK0i2kVUqywK/QGPuQtLXOEfswnnqQ6B692
nRkf9dcbOPJqCiabDst66cODEgmDJ5brs7f6SZ7nPIB1ASnGmjDaVgIzuT9CuA4G
LfMIlP/XANgIKp/dLSJtVT7sdEdmDA==
=eCtd
-----END PGP SIGNATURE-----

--Sig_/ft7tAwYwUt/T1YMHVHAewjX--

