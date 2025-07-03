Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29DAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlXjQfP8GnxX9ajgir2dOyxEvzms+UWr9GzE+yiGVRo=; b=nxPMTAt+uiE8H6AaN3Mt9BoHAv
	wkJSQUrFBdqFGQkagiajo+eat21X1HfwCTbHITjSSX85E5jN8tYHSQd9i6nnwxMhIL2wmhkFUlt5r
	J88tBuQXj5eVy7BTyJK/1qcobE0+okRwZ0foPfkVai5hUvWn8sSTcI7fuN5pzTHiUnLYcxgALmSkR
	wZFm7A+sUFuIOTnrZP8rxe4h4BUcX2BNcCbGhdSfI6VdQvlLvg3KXtBbl83N6mpNZkTkXrkOWxZoC
	P3Kvx2TIK6GXiZX+nYpd61y5A6V+a7YG5A/PtaCUcMntJtGHijHDzPzpxL45E0SRpHtihe+SgJTUy
	URJVLfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMuW-0000000C0lS-0YpN;
	Thu, 03 Jul 2025 16:35:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKor-0000000Be61-24fs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:21:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6880A5C600D;
	Thu,  3 Jul 2025 14:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE4AC4CEE3;
	Thu,  3 Jul 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751552504;
	bh=8q/IVKrUxZauGxiUn174NgZfIXYmxkzaKI174acXcJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOnfj6JddvGC2tczpxc5Nhlp+9Z0UiFGRRU3sr4q71VnRB/GwYAQRCLZmuHr4sxxA
	 vEZU7xqhdgzNxuNCO3jBWjnpljc8VTGcskBdQEC556pU9PhKZcOTRVcBCzaMmQR+bJ
	 s9+uOMF6FGLhRLlVxnWJqQgXF4lPrSwE7sfN3zlKS0x9xMxXxyfq5b0b/Ys53xJ79N
	 3/rhDg3aIR2ZYVy29OK+y6hX9gwwhCcLOcDN1+TDIDhuxGHglj5hs8laI0aqAr8uf2
	 2UxfmVUtfg2N/objv3RDgkIZOnSwMCKi9DT6cACPvZ4UCg5vDGQ6jOT5EC7Tjapg5B
	 Nu+V/A49DF7fQ==
Date: Thu, 3 Jul 2025 15:21:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Machon <daniel.machon@microchip.com>, luka.perkov@sartura.hr
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
Message-ID: <20250703-lapped-itunes-1cd711479f75@spud>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
 <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MYqRzWYWScpig/dd"
Content-Disposition: inline
In-Reply-To: <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_072145_625912_57F95B57 
X-CRM114-Status: GOOD (  25.03  )
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


--MYqRzWYWScpig/dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 09:57:10PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> > Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
> >
> > However, this means that new Microchip platforms that share drivers need
> > to constantly keep updating depends on various drivers.
> >
> > So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> > could instead depend on.
>=20
> Thanks for updating the series to my suggestion!
>=20
> > @@ -174,6 +160,27 @@ config ARCH_MESON
> >  	  This enables support for the arm64 based Amlogic SoCs
> >  	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >=20
> > +menuconfig ARCH_MICROCHIP
> > +	bool "Microchip SoC support"
> > +
> > +if ARCH_MICROCHIP
> > +
> > +config ARCH_SPARX5
> > +	bool "Microchip Sparx5 SoC family"
>=20
> This part is the one bit I'm not sure about: The user-visible
> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> here, or more generally speaking any of the nested ARCH_*
> symbols.
>=20
> This version of your patch is going to be slightly annoying
> to existing sparx5 users because updating an old .config
> breaks when ARCH_MICROCHIP is not enabled.
>=20
> The two options that I would prefer here are=20
>=20
> a) make ARCH_SPARX5 a hidden symbol in order to keep the
>    series bisectable, remove it entirely once all references
>    are moved over to ARCH_MICROCHIP
>=20
> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
>    ARCH_SPARX5 but keep the menu unchanged.
>=20
> Let's see what the sparx5 and at91 maintainers think about
> these options.
>=20
> The other patches all look fine to me.

One more fun thing to consider is that we ended up defining
ARCH_MICROCHIP on riscv because people didn't want to have an
ARCH_MICROCHIP_POLARFIRE symbol enabling the pic64gx SoC. Therefore,
anything that relies on CONFIG_AT91 to be only selectable by users on
arm/arm64 when moved to CONFIG_ARCH_MICROCHIP (as this patch does) will
become selectable on riscv as a result.

--MYqRzWYWScpig/dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGaRywAKCRB4tDGHoIJi
0kalAP9rQkzuJjuFkyPd9IlOQj3R+Ld5bQNONlz6IG3u/RaW3wEA1mcw+qjQrIc8
tzY+P2Bw7n2cprxDhZQKO1xk0ihwGws=
=qB70
-----END PGP SIGNATURE-----

--MYqRzWYWScpig/dd--

