Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A671DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe+5znHVUqk5GYGgi3E2U343rq4B5qNUfQk8zHOXAdQ=; b=FMctXIcK5/48UOLEQ9cLv//65Z
	GN1dZtJbw2+G5Py8yQ+00SBXhIu/Suw66PUpla9TwXqXzHa3MG90+z2Y/CMkPfy9/nd8CZP/d4+yb
	8+MFnsuYaZ2l/MOwWKCbNrI3bYOIWy6DyQUcvnEVjsh6SO/oI6W+X3z3K4uJ6P0t3t14gUZSoCjVN
	Nv10vG48+JBJG3bLv0p7oZl/faoLMIOxOeVlaL1vOsYWvEzeYHDAxO9SpcBuovPC8wUTzviRXFblO
	hvwPquJFPnJWBbJ93hUC8/SqG+u9pAkd0mEu8bhfn9e2vNqdcm2F1Duq36XTgGXyDawLiCsi8bwU0
	sSgbt+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gDt-00000008ujx-3M5w;
	Tue, 29 Apr 2025 08:21:49 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gBx-00000008uKc-48OY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:19:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C94F110271400;
	Tue, 29 Apr 2025 10:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745914785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Xe+5znHVUqk5GYGgi3E2U343rq4B5qNUfQk8zHOXAdQ=;
	b=gFr5oOyMT8linriMuZr4uL8ElmpqxoxstsyXFpKtaJBbO/PHV0+T/mvjKtJIq0pW7818vo
	fKP1kr190BR1IYMiH+OBIRxpV0dBeHoDWDV7S1N6R6qqdYAsYd6r39YGf5uGyjCPQa27VD
	RDTRJsd+oTkMZOY5TrV7Tg6outSqHIHlVUnqm1WIq7+6fpnER7bCYnNaVISTyqZRVIwOFs
	PUt1eZwWSGb0Zpfnojzid/sB4N003pyGEZDQs/Xlg3OiuzqdM/Qa6Z2Lbbvm7vnf2Ga3fT
	GJQ19qKKbF2BleEtlQaAzpYVTmp646Uxr1rnI8AB2R/o1Vr/baw76GJE70KLLQ==
Date: Tue, 29 Apr 2025 10:19:38 +0200
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
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v8 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250429101938.54790e51@wsk>
In-Reply-To: <20250428132932.273fc568@kernel.org>
References: <20250428074424.3311978-1-lukma@denx.de>
	<20250428074424.3311978-5-lukma@denx.de>
	<20250428132932.273fc568@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7C5c+VP_Ssr.yXpqT9xQXe/";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_011950_313149_0132736C 
X-CRM114-Status: GOOD (  23.15  )
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

--Sig_/7C5c+VP_Ssr.yXpqT9xQXe/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Mon, 28 Apr 2025 09:44:21 +0200 Lukasz Majewski wrote:
> > This patch series provides support for More Than IP L2 switch
> > embedded in the imx287 SoC.
> >=20
> > This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> > which can be used for offloading the network traffic.
> >=20
> > It can be used interchangeably with current FEC driver - to be more
> > specific: one can use either of it, depending on the requirements.
> >=20
> > The biggest difference is the usage of DMA - when FEC is used,
> > separate DMAs are available for each ENET-MAC block.
> > However, with switch enabled - only the DMA0 is used to
> > send/receive data to/form switch (and then switch sends them to
> > respecitive ports).
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch> =20
>=20
> Linking fails with allmodconfig
>=20
> ERROR: modpost: missing MODULE_LICENSE() in
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.o WARNING:
> modpost: missing MODULE_DESCRIPTION() in
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.o ERROR: modpost:
> missing MODULE_LICENSE() in
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.o WARNING: modpost:
> missing MODULE_DESCRIPTION() in
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.o ERROR: modpost:
> "mtip_forced_forward"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_port_learning_config"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_port_blocking_config"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_port_enable_config"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_port_broadcast_config"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_port_multicast_config"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_switch_en_port_separation"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_register_notifiers"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_unregister_notifiers"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw.ko] undefined! ERROR:
> modpost: "mtip_is_switch_netdev_port"
> [drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.ko] undefined!
> WARNING: modpost: suppressed 3 unresolved symbol warnings because
> there were too many)

Yes, you are right.

I've adjusted makefile to build it properly as a module.

Thanks for spotting it.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/7C5c+VP_Ssr.yXpqT9xQXe/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgQi5oACgkQAR8vZIA0
zr0EhQgAlT/wbAiGajLapmWxKuLFGzpGBN8yTQAWZkR4q5Av8pTGrIofsvMVyke5
CAsy+yyi3ZJTiuqTKCKQYolWV3uFnFxiUhyy/s1V/8gJqZFPUx3H3p/vC1ezXORM
f6gWiBdCwYS9e3FPbAY8UFo8oaIjF9O3ec020NvIeCbBXYTy5KOyp+Vbpkifc3uj
Ns3T/3nqxmuzg6OyIos2sJIi/NUc6z9ihZV5wyg9AyOBccteEsIfTWamUSKNj/i8
2GyU4WiMR8/h9lOiXB+wtrCQ9m8DtpnrfBNek1bOuIZgZr7yQhh7A2pUqRk698NS
zC79DNTenk6v6L6vNX/Ii47rbfis/w==
=llBU
-----END PGP SIGNATURE-----

--Sig_/7C5c+VP_Ssr.yXpqT9xQXe/--

