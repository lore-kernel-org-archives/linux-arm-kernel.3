Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49FDC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoXf7tbT+GijFUb8lgA9KilXjWzwUEA0M4rKTFmRF+o=; b=ZlbVAasQhfBTJJSlqxUFDGet35
	1olQy18saFde144PpLM6YhsnbBaD8uHWA+3KI89CeEMxpnmnDC81ntkZW/WXnxICSxPWzODNo+/D7
	NK19jBaJR4x9sUIxf9MfaEAaEquR6BqGIe1UDs3hBWHxdoqAl7RfgGhEYnf9rIB0GFO5KjIAA9tgZ
	kKWMyoGko6d+/bB7+qq54UAKFqiRwtfKOmxN3JX52CE7FEs9XOK/bLxBj9yvIda7+ksva9NpQJDRK
	vr6P27gLh0+PN+fbDy7XtmLP78XbhQcpOugBjLoCNVmktIpo6pPlsWDQ5hdyeUYhfsQmI8jQwgq62
	J2O3rEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVgo-00000003MMm-0tH9;
	Wed, 05 Aug 2026 07:05:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVgm-00000003MML-3dLP;
	Wed, 05 Aug 2026 07:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E31A760A69;
	Wed,  5 Aug 2026 07:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8A61F00A3A;
	Wed,  5 Aug 2026 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913518;
	bh=DoXf7tbT+GijFUb8lgA9KilXjWzwUEA0M4rKTFmRF+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1eDJqeCdnafzhh5h3TF31h4Kx8ZVMOH4twLNGsfIT4KTU0H135BCRSBlXs6M5XFx
	 bojlJfWNyiX6mEQsdfHshfxYVzEpOR3ULPvmyg7DbQitGTL/pcctkL2CLaSW8qTS4Y
	 oRt85JYkTLtnVxo4LUQIvXqRFnnrn/o1hSRUnf91kuPGTRqR01FfubauOhniWOXthZ
	 BYZc67/ae9as8G46mp1iy78FvQI2LbidzPAb6Mm14sD3soAp1tgXbm/GxJxzr9eofk
	 q/ZGW9ZpAqZtTCA1fX12TVkixDwST8oEXozbT1rDYlExGuU8Ye8vPV+vG2rAMx44ln
	 WbabuA10U4W5A==
Date: Wed, 5 Aug 2026 09:05:15 +0200
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
	Conor Dooley <conor.dooley@microchip.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 1/7] dt-bindings: media: Add macros for video
 interface devices
Message-ID: <anLgoTtDZQ38QzWM@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-1-336998dd63b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3q7nwjwirtsmzgs"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-1-336998dd63b4@ideasonboard.com>
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


--j3q7nwjwirtsmzgs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/7] dt-bindings: media: Add macros for video
 interface devices
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:28PM +0100, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
>=20
> Expand the documentation of the video-interface-devices orientation to
> reference the new header which provides human readable defines for the
> orientation enum, to help avoid hardcoding values in dts.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Michael Riesch <michael.riesch@collabora.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++=
------
>  include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++=
++
>  2 files changed, 24 insertions(+), 6 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--j3q7nwjwirtsmzgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4KsACgkQ3SOs138+
s6FSixAAvF/nuWj8x0EsLtnIBtNApx4xw1S4zIAzPiQ7t5eq2zZYJWFAcZZJPLIJ
pXoirHiAJCM3MfbvDqNag7+P3Qg31O0jWacsvMhuQCv1sJlZG8MmVbXxkma2/asj
q1k0p5ODledgKBvIabnlCbEaomZUK+umsCNxBiabNCRuRbl3/Xkpd1+VdJW3cdML
X2Zs2KoULb13xnF2LXMtH8IlUpnUpUMCPX3hX6BCJAxCTnIUq2P+rYKZAszJ7R8o
ljbgmv/2odtHZ4o9LlrLUjAZqOJWZyZC+em9aYUu2ywfOHfYcq/gGebPo5yS9f5N
gNVywyLAPqloKHrsE4qjD6fctMByN+PzuUBKJ1Wlc3dYjBp/hnWcMlqISrB4GYuc
VAeUoX1A+aYK7/MHQsNOJ2EdkP/ROQkkySOazY2rRpGqkJ/P7PSSPQ1GhchzTun8
ce2e0+HUhKpEUa1+dPE6cyaSnMlZR2DMkzT1muQAoZlXKHotNbMgUy010SzbYBzE
Ejwg3UD4KM//QVHejyFg1TKolJyqEFIcyYtizWejLN2F4uyzY1MlA9768XrzuNNG
mDM/YSoNMVBTJVeYM9js/FSqOpgxrPw0D4fd9EBbCF6qxvkEfkguNSx9iZlahGKh
Q/N8W4rn+WXb+optFaVTZxwxtSD/7rIy3Iddo4ZCFdzO5gHirdQ=
=qQ7c
-----END PGP SIGNATURE-----

--j3q7nwjwirtsmzgs--

