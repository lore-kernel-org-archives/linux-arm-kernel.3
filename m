Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FDCC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsxQbQPIJsaYTNOu6ABUMe0d1muypWFSA2FGjsr9hv4=; b=KNyVHdhDVX5lW691Ln/crx+l/W
	MjPPF9Va7n5DV2IGkkB+TYYEYMigqEvEInGnq8gCDZ/FInVIUIP0kSaJzKGJprEvUiXSy7zzzVZT3
	EXm+cwYV233mmHXl8sDb/XoKmggOpao8TCTTzgFt7TBltFK4X63hJF1XnX6qQD3zMoMTRyFqynJ9/
	BkIMmeWJwrWVVr5B7TEiGcQoKeWYio17vdQ3rZ5CIAuzL0qPBk9DZH1iITL67ekG6q/0rs047C4cZ
	gUHEI5nY0CMMBZZ+qJqY1KfNwRlMQSe0l/kthP3YoB/9GUYZ1woCmLPxh9vPtsvxdyfTSM3L/FZRj
	ZmyI07Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTP7-00000008Ypm-3wdA;
	Wed, 09 Jul 2025 11:56:01 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRiy-00000008Fhp-1Wwg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:08:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86578103972A7;
	Wed,  9 Jul 2025 12:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1752055701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=FsxQbQPIJsaYTNOu6ABUMe0d1muypWFSA2FGjsr9hv4=;
	b=ZOFR5QYJmEImw0t8AqiKiZi5hRhUsSDtDlUVGIS/tUYksC4yoQ27YObM0jcDNKmO4vuUnH
	pdj8Z7iZN+40EH8d9HeL2x7deLr2PBODbaRgerSiLocF5B6C8AnLAYlY6ZQXoFIXeNHmM4
	PDk8LbWwrGlZmWNFtFU7x/BTVfF/ZHH/f8RuBrLOUkkoUbWZTP2Ew2nJki3o2zoRaQb86W
	3YE44lWolkv7qhe8wPGRebTXD4bzsyYaTFmZsAx1vjvn46ZzK1g/vFBfoDSHbKiyd0cdLe
	0EsKGZENUVrx6pJbJQ8lGmKaW6ruKtHDitD3pifYamAk7ljyesoF3NGy6pRD1w==
Date: Wed, 9 Jul 2025 12:08:16 +0200
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
Subject: Re: [net-next v14 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250709120817.5b2f631a@wsk>
In-Reply-To: <ea22a546-9381-48c3-8bb6-258fdd784ca3@redhat.com>
References: <20250701114957.2492486-1-lukma@denx.de>
	<20250701114957.2492486-7-lukma@denx.de>
	<ea22a546-9381-48c3-8bb6-258fdd784ca3@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kSh+3R=zs/0/CbqzphcKx.b";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030824_553839_F61EB4BD 
X-CRM114-Status: GOOD (  19.30  )
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

--Sig_/kSh+3R=zs/0/CbqzphcKx.b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 7/1/25 1:49 PM, Lukasz Majewski wrote:
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
> mtip_start_xmit_port() runs with BH disabled. The above lock variant
> is inconsistent with what you use in patch 4.

I've looked into the fec_main.c driver. They use for TX path
__netif_tx_lock(nq, cpu); which is a simple spin_lock(). I've followed
the same approach (as _irqsave() seems to be an overkill).

This function (mtip_start_xmit_port()) is call as a callback from:
.ndo_start_xmit (member of struct net_device_ops).

IIRC net core code provides locking on this call anyway.

> Please be sure to run
> tests vs the next iteration with CONFIG_PROVE_LOCKING enabled.

This is already enabled. Locking in this driver is a bit special, as
one uDMA is used for both ports... (unlikely as in fec_main.c).

>=20
> /P
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/kSh+3R=zs/0/CbqzphcKx.b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhuP5EACgkQAR8vZIA0
zr2DCAgAxD7rrFXIyi+rHYv1bwydkkv0xAPwNNg4ilaG0hVeKYG1argzJUIBwp1E
Oo/EvG2HUoBs/I83nrGq+Uk5SX6R4zqDIx/iYu+/V/9hll06UV6MmtdNW772+LRD
slkfHgqjAAiVSfGvE1iUPZc8nkR7+0foXlv/dIeQWaYoROg2dQtK/p+X8SUMe914
ojjlmPsxPPIbfIclJc+lIqQgrJbme2z4EYldIjK+aTfjiRtAFdnMdnCUjtqw5slO
MpSrlAYs00wS4RS+KH+Zlp12ief5Zaw4h5H2vfX65p/2pV84RBAT9E6SL7ZC2rsh
TYfU75uh2iv8ow1RM40r+MrWqaOCNg==
=f3nq
-----END PGP SIGNATURE-----

--Sig_/kSh+3R=zs/0/CbqzphcKx.b--

