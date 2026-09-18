Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D48C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZSVa0g2ztWQ8+r1qgpcbkI2lI4vaWG+BMaMpsWGUjs=; b=xxk7XgH2ZBVYtpbEcpngU8xtIy
	mjPePGe3j3L4rrApzZE6dmdHsA5L52+Es/wA5HMGCbSqKT7/ErFJnZTcso4HTXsai0mO3ZADYzPJ0
	hvX5dLlSoM28Kd5YYlJJf72qh1Y66EJ6eVhFIYYl1Xi3kfpPn2jjgxCyk/2ioS41/xzqiao1IlkRK
	9evwoFsdyO2cWxxG1p8NdbtMxNoH4Tw10v/wCImtub4Uq/HO4WE497GvJkmi6lBJD13zGwD7m+0jW
	JN7M/zFcuBk9+T4oRMVxVPGG3WxujhsPv6e1qpjldyyInXjRkhfMCIQshrr5TCxl/tol8aIoMdRr3
	/tkBYzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y6G-0000000EQ2C-024a;
	Fri, 18 Sep 2026 12:53:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y6F-0000000EQ1p-0u9h;
	Fri, 18 Sep 2026 12:53:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A55C260A8F;
	Fri, 18 Sep 2026 12:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A728C1F00898;
	Fri, 18 Sep 2026 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789736034;
	bh=IZSVa0g2ztWQ8+r1qgpcbkI2lI4vaWG+BMaMpsWGUjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eOvhNAH9jJfve68zgfKNDmGY89el9cOkf2NIB06BpJLj53pc9qiqRSzrucRtJzCCp
	 h2tqnDvQ03aQIYDWbL4nVJObNeOWUZT2GPrI9o4llobNMwAkkyVL4hP66hkLudqA0m
	 56/0Y4QHnVhrCbfxYWokAaR5NVn+h2zEDZQsf1kOlWgdub1iVzObD4ooMdu6g99ZNb
	 WikShDV3gpkWy9APDZtbCZ0WqHgW5CdQ4ZVYnYp9bKn4MeLY1jkD0hhlhmHxPam8S6
	 3Y11SOUY8xQba25BtAaqGIrFJeSnWqMr3dkw1NpngGRLEhhfvCTBQeAjLvt7L9mShC
	 9+A9gxqAZZtbA==
Date: Fri, 18 Sep 2026 14:53:52 +0200
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
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 1/6] arm64: dts: freescale: Convert to new media
 orientation definitions
Message-ID: <aq00WXsI5T7Vjz4K@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-1-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wdh2b42vbclylnf"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-1-5e8b1f01be29@ideasonboard.com>
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


--6wdh2b42vbclylnf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/6] arm64: dts: freescale: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:13AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the freescale/NXP device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      |=
 3 ++-
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      |=
 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--6wdh2b42vbclylnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtNF8ACgkQ3SOs138+
s6FhoBAAmy8KNMV4HskuU6PSl9pgsRdWX8u79Y1uLeY0OEPdqN8zN04yU9vPBd3j
gFwQSlydnv11bvR6t4TI96MCj+ywVc+PtdTnyFIXnbj9g/oHFczVj4MuARWOi1F3
rA1znqZNfPOQrqkXDseRP8h3vrzAsJJcE/3xC7ak15m8gCCjQaY3MJEogRIsqLfj
Z7IQ1HSaEJyfOfk/HJ2MGzLvgF0eV/EsNOSZaTtjA10WLWeCXffPGocBG6DvsN44
J9d1NyiMS3GPQiAhwukkDJtS/+qKd7ebtDa/kgKq0vXLRLudY/d73FGAbpmYJjBb
RDr2fxeK6L/7iuJnhzUd+9hWb3o1wJBehyDQMk1VTQ3cs7kVvmvMFAlIFJaNcIvY
pZ/UHqmMWO3cZc15hxezUpSD4nwPIXHF3/Rrpu4KpuvQ2qvfQ6Dmo/Si1QNrF3Kw
iedvIhm6NcO4lXgJ3kwHxS1yh/x8ZKe0Sg42B4X2oR0RfFhPtsDLCL2b0mpyoub9
fbKcVmleDcA3AUEAX8Q0dipTpyF1uSzNgp9w+3M7UQLfCeXpiVmXoSl0ALqhd/Kb
O0RmNU/AubW0LVBBDbobrI5TxS7EtdPt2SJP0I+x6JRFFBvd91smEBNSciFoauKO
L90R0Zfcrac0q8D3mb+pO7zJn1kkzm3j+abTzj3YHJ3FC92Q/xQ=
=7yvd
-----END PGP SIGNATURE-----

--6wdh2b42vbclylnf--

