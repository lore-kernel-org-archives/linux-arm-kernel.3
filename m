Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C1DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YjkTQ+gqqWFDmNpTCB2YM86WSAHzpa8fQ0Pcb/kVSA=; b=bB93ijI5TnNP2i+xRrop5N3+Pp
	ymPzZ2cZn+G4sbqlJkHwZaG5CZWH2R1BxIoxbL1ojttHeWJWcHu43OaNN7NTEfkSHOKcmCniDk6KO
	siElNE71x1ITW/g8wR0WZnecCV175mqWoXOkdwMh7lgXC4hpW2MGc3uvC7gHOXZcPYw6rN52opRqI
	7QtTcR6jGdJ0ei92CuksEoyn/rBlnkGHN4ztd9UCfoa8YG2t6Qi6jclsP1MOFxuOXjBrvnJDvSuGe
	fKyFpFThIKirPNgVXcvaBTIzgR/rbBv5bT3BizQvM+WhjuLNPltdBv4Li/SXRK4o8hu894w1YV89h
	Nx+SAeBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tREN5-00000000kAd-3vKm;
	Fri, 27 Dec 2024 17:43:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRELv-00000000k34-1JD9;
	Fri, 27 Dec 2024 17:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D9995C4CA7;
	Fri, 27 Dec 2024 17:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52404C4CED0;
	Fri, 27 Dec 2024 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321342;
	bh=0bFdHqCzn5f2CvXlfqGybIGbQK8L/GTLyJ6yIAZPZGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uerjnRn9qAtLEzUGvZUSOs4DGdLkb3mptAl+BnZV7M2SiEq/UIHP/l0jB2/M0W039
	 cJliRm9pTDW4UIfHiEjFo6x8zVtR9urPmcZNvivkXRGKgTaBmSVnVtlQZyurpnuZH7
	 ENOWgO44kAx4z4xp0qAJtcVsJNdBm7N90JE935SHx/bA/ZVe2hKaF3LcOMU7Hh1MYg
	 Ro8u/DqH21EFFVPzpb1bZmIkCLZ0fYL8S/r9GY7DpWgmluLOItuC9q2xLHgwIS4kkJ
	 jJhuQMuzsppKHclV2BRo23cKrw+fR8CbGdTG3n90j3sMPl80w7iYFi70InS2zL3imK
	 WJKmnYJPtwe3g==
Date: Fri, 27 Dec 2024 17:42:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 01/22] dt-bindings: iommu: sun50i: remove resets
 from required property
Message-ID: <20241227-backward-sandfish-3734dadba8a4@spud>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jmNM+Wy3mOmacT9A"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_094223_442531_CC1131C3 
X-CRM114-Status: GOOD (  14.74  )
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


--jmNM+Wy3mOmacT9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 06:30:50PM +0530, Parthiban Nallathambi wrote:
> iommu in a133/a100 does not have reset control. remove it
> from required property to make it optional.

Merge this with patch 2, making the reset required for the existing
devices and not permitted (false) for your new devices please.

>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml |=
 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-=
iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-io=
mmu.yaml
> index a8409db4a3e3..03176f68485b 100644
> --- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> +++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> @@ -42,7 +42,6 @@ required:
>    - reg
>    - interrupts
>    - clocks
> -  - resets
> =20
>  additionalProperties: false
> =20
>=20
> --=20
> 2.39.5
>=20

--jmNM+Wy3mOmacT9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27m9gAKCRB4tDGHoIJi
0gDTAQCkD8Xhuyviy0vhXeZ4H+KJGL4kLQQgH/BbJQrWmtEiKgEA0tU2Y5TQpef1
SQ6NyzqbRTQrGqT89fyibG21/6vErQs=
=VGkJ
-----END PGP SIGNATURE-----

--jmNM+Wy3mOmacT9A--

