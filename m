Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE123C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiOuQZ+qbKPtsU6vpJkFL0vOoLX/w3NXaU22HaBxqH0=; b=Rw5rGY/ABJ4idYLIhKkl77ZMQ/
	vZ9Ted2IwSjNU9iKPbXUJfBnp/MXsdXcaBlH+qbn+Esn+6J/n08HSnnCxSi6MhTwMylMUBiMlPL3a
	L6wOrQcmY3oTUepjZKC2mvjX2YYF9PZX3S0hXeNTvg+DzekYERnO+oQjK8TQ16DVEUheLAEbL0sd5
	BNTM7MH6h5LHj234hb+gAoSjZMEMJ3b8dSTnOv/hS6FgBV5tpYoMGF3e+QMKYFLaFF/QI/rhV2u9c
	3XgpG47976WKD4P58kj64Fo7mxdrhHV6eHslCxVpi7M31pxCT34MGJJFO2K5EEHst2oaBHt1u6y5Q
	K0ajK8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVi4-00000003Me9-2UFT;
	Wed, 05 Aug 2026 07:06:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVi3-00000003MdO-1beC;
	Wed, 05 Aug 2026 07:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 692F86011F;
	Wed,  5 Aug 2026 07:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBD41F000E9;
	Wed,  5 Aug 2026 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913598;
	bh=hiOuQZ+qbKPtsU6vpJkFL0vOoLX/w3NXaU22HaBxqH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1Ov3nPN/H02R9GEFGczrKNWADKqiMios7nEgu5q0aTkR5yNoAq/YPFCc4FcpCi31
	 NB30DsAGv8mcU1kTHYpNZaIACfvqi6WC7OSHEXsIVNANC+65vIPPtkMuT0meoAIagS
	 TVnDXIygJGYHsUaMutVh3qVorPKIPe/SEvBaHXcmgz68O0l8LbMQ5nAKlNqbTL5mAr
	 jkrFdodytU3oBscZjUbYoeJg1nBVCWq1oYESR+zFJzjKkUzpuqI+7kTJFN7QgEPZNG
	 T4rUNsoC9EMgJgyYMVEDwOe4mMDF08ZFi6PuU8+9FMkgr4fjexF7goUeXOv0lEbTpU
	 czEkoo3pgrTug==
Date: Wed, 5 Aug 2026 09:06:35 +0200
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
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 3/7] arm64: dts: freescale: Convert to new media
 orientation definitions
Message-ID: <anLg9GdLKD4eMguI@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-3-336998dd63b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmyfnhbtb3klucjj"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-3-336998dd63b4@ideasonboard.com>
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


--nmyfnhbtb3klucjj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/7] arm64: dts: freescale: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:30PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the freescale/NXP device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      |=
 3 ++-
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      |=
 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--nmyfnhbtb3klucjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4PsACgkQ3SOs138+
s6HAfA//YOk7q5LpyLNfCLWpw4PJyqRmkuOdrCDSDENusiMG1+cYxA1f/qFGUB08
eQ4+3p3EN8/l6JslxUy98QIy00jJeyyHxrHTQdhTn3wwoxbdfvw1fCKJ5LWKXfXZ
QwuzppC3RuWUpddqA1YgkuF92GFSObqvfhIAGGXjRAdoBkrEuibwoEKRBH/NRNw9
Cc05gKN6CB4FgHxJdZhYX9q+iW5HdWIqOJdUgyfbYw8DojIpYdhYeHUR/Sl54Vky
p9KBloxGTvhBA1oVe0a6bryeBjhE0La5w3SKigRhV85T0A/Mq9W1CJTxtEswNJEa
YcQx+Cj+IVwXnk3HvS5fgVtHTwv2nM8Pgnp21szd9SspfYreM7hBbKJ+AKivd4P5
mKbuay45A9f1iku6VgvQGPUdOjA1m6KiN6NH5MPB73r8R52FveLin+5keZgQH/Dq
K+nVXsNnoAfJznYBHWC2jisv0hTr/ERkSfFbyjeUTfDb6RteETuYqZI13Ub6neSM
ml2sJa2+aZ4n/8j7mvjcx81yVNr5MawTnCHK+dDMvHhPQpaMU5cm8YT2j8KAvAnd
I3PHZhqHoMNhGjifsQDIXARw/gzA27BeL9GcEF3vpUAJA6hec70EJELEbBbZFoC/
rF3yo2GCWGIJWMaIw1tvCwQTm/acz9Qdy2c3QpbDOajzilxwQ4Q=
=QISY
-----END PGP SIGNATURE-----

--nmyfnhbtb3klucjj--

