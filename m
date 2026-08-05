Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893A6C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQEkViaXZ5mc5evBn4xlg8YvCL2TGNW/en7op+TyPKc=; b=GF/sFsIVDp4BFkLsNLf/79zlxQ
	DrO9+ghlcEk38FYyrpWGvlGGGJ05henKtmfdQvsQUWdgLyVgr2frrg+zJmCbkj/UnsV61j2I1KWHK
	Glo2GXjpx46Y6bRoTzwn/Y0ICUeKomBS/Uicw/0jdBehEg6OmyKgl9Ux6e5Yh53sqqL7sWuD/YlgH
	j7Y1wSHJ4YM6fAcANRsqBjsER+YnTUibpNDH+Xt7FK0P90McU+q2qrMQjKtcK79mpgDmrg5958wwR
	KFttD6PXIRJA0jRznljNy+XyTLRjUXaUbttCFK5fifvXn/t0ikOfI9Oz9RLo4ImAY1oN+vCQ2AGsC
	ZTM8t/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrViw-00000003Mv1-0n2N;
	Wed, 05 Aug 2026 07:07:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVit-00000003Muj-48QS;
	Wed, 05 Aug 2026 07:07:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C5AC600AE;
	Wed,  5 Aug 2026 07:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5956A1F000E9;
	Wed,  5 Aug 2026 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913651;
	bh=AQEkViaXZ5mc5evBn4xlg8YvCL2TGNW/en7op+TyPKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJpri3Yv0Tub5OsZjVMbhAeZE70pBERd/6OnSVOU3A9/Dn1G02+hPZ4gKNYTwHjxF
	 KHOhUmig9WOW+i/ulrb0MC+IFVINef1XXIsw95ns1lUtoS8a0qJaHzNYBx2aBaUlAn
	 1MUK3Xgc4xS6F6AAH7Uagsi3UA9oWTRTl+aTOszZ5Wjjo2PH5lUQVsCaaZU4CqAJJg
	 ae0H0d4OHkfQdBHg5wBKZ/1egy8MIV5RrTVQnz8unOtjxBH3PnEp4kyEg5nY5ngGpS
	 4GvleGQin+Jzd2joagN7iYv0rwA4+moV0fv2f7jL5sbAd47l4qkrk8/D9XpKPj25b0
	 39lXQx0BkuQDg==
Date: Wed, 5 Aug 2026 09:07:28 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 5/7] arm64: dts: renesas: Convert to new media
 orientation definitions
Message-ID: <anLhGvz915Ayvock@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-5-336998dd63b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7of5i7fzz2typs4"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-5-336998dd63b4@ideasonboard.com>
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


--h7of5i7fzz2typs4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/7] arm64: dts: renesas: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:32PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the renesas device trees to use the new
> definitions.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso |=
 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso |=
 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso |=
 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso |=
 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--h7of5i7fzz2typs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4TAACgkQ3SOs138+
s6GkrQ/+OhXaBICC+jLHWm91RNRD7nv9heOLFa+oTyhT+Mmvay9ZZew8cPyd1zz5
Pu+CwXhsIFQkImIrE5nlaQffppt/QpiglzsKTn3mGmrI4L1u2iWQPkEKMfAaXmOW
mQ2x2j7YRvHC1gWxKnjairIkEic+BkPzjH1rYNLmZmIVc19X6a1YKNStjFvThPXe
kOSPt9/mH3MB49k7EN6VTSMf3qCC0M1L9bVl3YabpOHENFKR3Tz2/Zx8wy2HmiFz
H1P5bE8r7zLvM290iCWbDg4w36262BDPRRsceZ7ULs84+C+diCOwlt2c3jWdROHT
YZLx4c0nHORztHaTDFxBz0bzfIzSZJ2AIH28V9bBB4CK+ghwW5TZmXk+9dEyeWhS
ZaUNwX7CFI2qDfSy9DTtGL87hIh7wvgfIO/qHrusuK2YPmN3EE4LoE+BxjqMn3IG
8ugbhVpsnZDg/7oC5Xk5XW0I3rJ0x4XVMHvZ5ybbRWUSaO2M8twQrSw1xkDVPCJA
x5REkBa+YvSYWpDB0K4WN+yWw+xAwdY9y9ORDmePqceXyIITEIGgvGhziKKO4b8Z
nOit024Ueo62Ntdn15DVNctLCNIt3TKWdPGcuvMXRUlET+DIiyrItDbqe+uks1Q3
PrOqa+YAOkoHrJ/r9G+CSY+W9WwCTBI9WzU2ELs4hEQwukU0mcs=
=sJ5K
-----END PGP SIGNATURE-----

--h7of5i7fzz2typs4--

