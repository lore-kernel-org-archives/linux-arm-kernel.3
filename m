Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6DED59F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veBhBSNbRzW+fzyye0nDKOdSc+pkgsDriYh5q7vKWko=; b=La3Qq5jDHOoDvXY6Dxh7K1Nm60
	0OTr3ZxYbxQEgn4GP9SQh8af+AMY0wsLt6IJN9loPk3LSMtZ+9FY4auyZGTxpNR3P24Jud36BtVfI
	stt1rdvrAtK/Ja/y86CQuNdav55ZeyWOy+x0Sp6EcquyGeVzZCYsKcnGaSNAIiiXn89raEeI2Syfc
	VWO7Reiq9u6ud5eI3X3MLiJ30YerktpBnXEAd8uQAfgzHmCr0QFILlP4e+DP5QtiZS/++nTuSDiDy
	fUmVnzgribV/v1UWG2E16kthoQoZB1m5X5bUxEcjL4ojk3DkqSVvd9vVDSYfiAPe3djooNDqnKDnk
	WZRPROLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ksv-00000004Me0-0tR5;
	Wed, 06 Nov 2024 18:36:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kqb-00000004Lyd-0wNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E3C5A4424E;
	Wed,  6 Nov 2024 18:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0069C4CEC6;
	Wed,  6 Nov 2024 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730918020;
	bh=y2p9ZXBMTA9Kxb0m1NNUcP0JaTs+i1CzMOB0sUQFJ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2kbkIVVWaM3yO7REJyQCuGZCGdvolulDmtWYZJ0519Ine255Oc+aU0EfsQBl5qnz
	 ZhVvIX8tYeXL5CG1bDHiVCtWL6JSaB9HWVHfUZgUiwPJfC3+tN7AjLZr7YrAWJ+9zX
	 huQL2/Vw2aWIHmrd1fWltvMnj2gEnIql62lTQCRJnygS54B5HtRx26fqV7u5QrhlRE
	 nqXaQ+4jXROb6fWlsgz5HtTGJ6fPPGDPclGFwzEWUO6JQ/QMcXNJw4QeoYDHK+2QlK
	 Y9qWRWt5TDUSMbESUMfXKUu6tXKgV3nzYV8Se/Bv1/RUunU692C2eKh45GN3w2Mxqd
	 NfilyF32y3EWg==
Date: Wed, 6 Nov 2024 18:33:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20241106-motivator-mama-5a9d8d14aece@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
 <20241105-sulfite-justness-d7b7fb98905c@spud>
 <fd3d9f34-0e8f-44a1-ac21-2ee0c49d65fa@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwRbB0EuidyiYIep"
Content-Disposition: inline
In-Reply-To: <fd3d9f34-0e8f-44a1-ac21-2ee0c49d65fa@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_103341_347097_6BB6BCEE 
X-CRM114-Status: GOOD (  15.84  )
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


--uwRbB0EuidyiYIep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:18:10AM +0000, Matt Coster wrote:
> On 05/11/2024 18:03, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 03:58:14PM +0000, Matt Coster wrote:
> >> +    / {
> >> +        #address-cells =3D <2>;
> >> +        #size-cells =3D <2>;
> >> +        interrupt-controller;
> >> +        #interrupt-cells =3D <3>;
> >> +
> >> +        gpu@4e20000000 {
> >> +            compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,=
img-rogue";
> >> +            reg =3D /bits/ 64 <0x4e2000 0000 0x80000>;
> >=20
> > Can you format this normally please? Drop the #address/size-cells down
> > to 1 if you're against having 0x0s.
>=20
> Sure. I thought /bits/ was the "new" way of doing things, but I'm not
> really bothered either way.

Maybe in other cases, I've never seen it for reg. The dts coding style
examples even have 0x0s in them. For other properties, sure this might
be the "new" way of doing it but not for reg, probably in part because
it makes it difficult to see if the number matches the number of cells
in #address/size-cells.

--uwRbB0EuidyiYIep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyu2fgAKCRB4tDGHoIJi
0kWlAP9yWsCojC2B4lhypgsjcV7rscFmE6WzqejRkjQrCUmWsgD/bTWjxUFQ+uvC
x36sUGD0EDrdVAQB+gNiLRi+EDhv7Ag=
=VsBN
-----END PGP SIGNATURE-----

--uwRbB0EuidyiYIep--

