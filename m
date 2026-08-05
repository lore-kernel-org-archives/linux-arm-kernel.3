Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6788CC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eknVX0861nDOKN5z4L+9yWvQ2f3wGrn2cEr5rttrL2M=; b=Go8BIj3b3KKEA3otijnoGq9fi1
	xWJUqwQwlXoT9otX9BXs321fGSNIopWcgGCWDZlvt/B7xnZ+U4gbgN1zr0Lb1exJwh0A4pu5bRHUA
	jN+cBVtqtP0tpWQQ4Ik6qBawH+HJRdgrAl7gcw3PjI/Gq/a8UefFdwNOiRaqRFIAFPaQuALEELnDb
	9lP705Ld4PEzozs4M24fCFZ3j5FWU7QAb8kA0sv7OyGtp/ZGTB+jZ4GD6jUmZdlmU1zIUtASd4fRh
	HFqkMoXxO+4YC0IXyu5mEK1UHCIJ5q7bHm8zVxhUN0Ac9arJZoiASPcAhaoGbqMVTDrNfCOMwWf8i
	o25kGCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVhh-00000003MWh-0BC8;
	Wed, 05 Aug 2026 07:06:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVhf-00000003MWQ-2PBd;
	Wed, 05 Aug 2026 07:06:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A95E600AE;
	Wed,  5 Aug 2026 07:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95E71F000E9;
	Wed,  5 Aug 2026 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913574;
	bh=eknVX0861nDOKN5z4L+9yWvQ2f3wGrn2cEr5rttrL2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZCJQ00ZM/6jRCBJ7sim1OY48D9QamjxYzsjWXpuG3i6QUhpGZWvuU3Z3H3mJnbrJg
	 GzAMmQq9xsXz+9u/nLJkdckcie/yalUEXIcQS9BlUREx3Vxf3AuFnGO+eFIXHf5Bi6
	 TS9KFf9KelVJ/gsbyPlg/LKsrqNnhT8GfPMzP1q3VWX1yyTxI0RDE+S7wTxkm1UtLt
	 LTT44MKtBImOfrDwImCD6LniAloMPBHDHBY34xBw7TEzZmJwM8CuOnRhaO0zCV8QOz
	 DayMa4k8cqAqlvJJET3MOaG5p+GxUqtnijJOV7m0Vrthp59Rf6XAtNbXshOBrmWlVx
	 ktcXVZ5EdjuBA==
Date: Wed, 5 Aug 2026 09:06:12 +0200
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
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 2/7] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
Message-ID: <anLg1lmGUlsfqCKL@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-2-336998dd63b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="crtkhkxtfcvyoatl"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-2-336998dd63b4@ideasonboard.com>
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


--crtkhkxtfcvyoatl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/7] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:29PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the existing examples throughout the bindings documentation for
> camera sensors.
>=20
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml  | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml  | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 3 ++-
>  12 files changed, 24 insertions(+), 12 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--crtkhkxtfcvyoatl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4OQACgkQ3SOs138+
s6HEXQ/+NE4OTznpxu0nClmHdRJqIZarnzOuvAgqFtMSmVGZokmcz08vGbCmoDKX
ZeVVALZyvhdwepTYHsn7uO99xCUbNgUV3mpz6tBHua1wihU0lpLfp6PWnzqN+fBK
4mWr3pMX+Y8Lq9bMt+P8LqOPXr7qJByVZIDb0ncBcJAfzkElFapHqDHdDI92INNy
RCMsbBwiESoxfmwWTZhB/wbsRprAy0eflhLVFyi+HDph9ZeT02RzqsdLVUhQspLX
naqbOD5HgwoINV3NECp/Zj4nnjGb7LN4cXncy0f2IvLNAyzbIsT6bY9buFKB4o1K
1Q4jNyvamZ4bpuvtRVibvAT2ATwxVRtBRZWzFJ6pBiS00kldJI8ez+U2gsFD8g1/
z4zd1vntTYhNrxiPEtEUa0knho4h7pCWUjS+huxQgtZsv8lBRT8H7aNVIakM2PoN
n/M0MPzc0YjxDfw/7HiaSugeCPorswVf387VvNGhkyRkUvuKFd8+8vC5HN0QK8Ad
E+M3NlUAzNOW/yKxXZTCILAzH5/1wzeI47uBsbU8rduHaGyViNvO1YQyfiV2J7X+
Ka6+YLPRwTB8QXP3m/I2Mg3uoUWkIwRf2dAmtC87Iv4dYnbHWovomWO4C5g//a1g
GCRxpADDOg2f+/pfAYk2FmYeG1/j+AHgAuRj3bJJTXcAlOdc6Yk=
=IBGL
-----END PGP SIGNATURE-----

--crtkhkxtfcvyoatl--

