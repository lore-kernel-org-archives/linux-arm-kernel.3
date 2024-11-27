Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD861D6ACF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bms3y6TLw1Qu9vm9b33NdwLcIuRTFtBMppabnH2eyxE=; b=wvx94uy9tdrrBynZlFaGAB6i69
	rVzJTKUA3KbiSwphX/+7eHu0H2ydX0c1TKPmbFX6Da1dKoBJhcOo5/vkBlc/tk1DcmCZ13XMjuKAg
	+W+xA0ZLVPr2vKRaT6B/MaQEKKvyj9yJbwUNlBMwjtSxRPT7xlieYkGD+RwA2oHfnx0w6XpFFdmmp
	ffxcO4N4gBhUjdYxYg2hlpX+0ewUA1sQVOENwrR8GjG9bs+vc7c/U9q0Izvt5ZxDE9GXgrIKLc6WF
	wtp0/SIkNMdfb908RfJs7fg+a1mrymcobVtwTX7nBCrL6fwsI+fCJjs68ftJCz99zdiPmBhJ5Si/G
	SPXOEP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL0T-0000000DeCH-45mG;
	Wed, 27 Nov 2024 16:35:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKzV-0000000De2d-3vjo;
	Wed, 27 Nov 2024 16:34:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58F3AA43962;
	Wed, 27 Nov 2024 16:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F29C4CECC;
	Wed, 27 Nov 2024 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732725252;
	bh=hDuzp2NmlbEoolqNz7tS5zWguegqWZEB4qmgDT93Sh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VaoZ2EHAt7Qfxz1Jd4yaT56/sHHn+ppPf00joDkMgjcCFy/VVPPWQFaaWf80Xrrph
	 YfiT77Eojcg/c3bu6R6UvPzjx0DoF+4qzrrxKcWDBaZo+5pMpDyO4sGa2DR3RblziL
	 Dfa6Q3d97VURedCKP079RJrBUfzOzqBDMQwRy6Uej2W5+LfPSJpesmMxgQKUNz7N74
	 LzP0dYYP4Pb6SfsT6U9dykZHOonswPV546D+CoIoB2fFkrgKLmeOj23encHDacywML
	 nVmI0iW0gfu3r01jeDQT+q+mobkGvfW0rKZtB+SJFF5IbmcjDezPd57+aG3mEXq6rJ
	 itSiSD04kiSBA==
Date: Wed, 27 Nov 2024 16:34:06 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Message-ID: <20241127-hazily-shininess-263835b86a76@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
 <20241127-majorette-decorated-44dc1e7dd121@spud>
 <813713d8ac62be0782bcf36d1d23bec5f4a3c08e.camel@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c8M+h+w9DKAEhDaA"
Content-Disposition: inline
In-Reply-To: <813713d8ac62be0782bcf36d1d23bec5f4a3c08e.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_083414_102265_7CC9A583 
X-CRM114-Status: GOOD (  21.39  )
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


--c8M+h+w9DKAEhDaA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 04:24:08PM +0000, Andr=E9 Draszik wrote:
> Hi Conor,
>=20
> On Wed, 2024-11-27 at 16:00 +0000, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 10:58:13AM +0000, Andr=E9 Draszik wrote:
> > > The USB PHY on gs101 needs to be configured based on the orientation =
of
> > > the connector. For that the DTS needs a link between the phy's port a=
nd
> > > a TCPCi, and we'll need to inform the phy driver that it should handle
> > > the orientation (register a handler).
> > >=20
> > > Update the schema to enforce that by requiring the orientation-switch
> > > and port properties (on gs101 only).
> > >=20
> > > Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> >=20
> > What is your driver doing if these are not provided? New required
> > properties are an ABI break after all and I don't see a mention of how
> > you're handling it here.
>=20
> This is hooked-in in patch 8 of this series in
> exynos5_usbdrd_setup_notifiers(). The new behaviour is gated off
>=20
>     if (device_property_present(phy_drd->dev, "orientation-switch")) {
>         ...
>=20
> Without that property (i.e. old DTS or !gs101), the driver will behave as
> before (meaning for gs101 it will work in SS mode in one orientation only=
).
>=20
> Does that address your concern?

Aye, but it'd be good to call that out in your commit message.

--c8M+h+w9DKAEhDaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dJ/gAKCRB4tDGHoIJi
0uE8AP4xieE2w7MVLlioQY/EzB7WNxxZkSBijdbdgKHeVBmpCAEAvg0mUlHd9e5B
HhD6UoGTOBy3QKdFgrcuKRKcPf5nAgg=
=ZhMC
-----END PGP SIGNATURE-----

--c8M+h+w9DKAEhDaA--

