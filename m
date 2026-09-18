Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5BCC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blk1q2GPfCTIxVHkTJ0NRDYY8Gy1jFgpdBubElhEGHQ=; b=zt0reRuvuwhBhX7pK6kk569Qa9
	EfghztNpeefRJlHzWjxoDtwDYbYezMFQQ5PAc7fTJEZ+nUAJz9hCWMRCWEvpLO1eOIOfOMXbxKTXE
	BEKy+/Y+4WuGdtcZw4P9POLB6S52/Nhr3PL/kkAWcQXLSNfYc9ZEkqhM2/dMqxa6vnA2x8E1FsBmp
	MoEkGeirvq1RoEWkec9wmVyVCaZYxdEpsuI9SgLhrS3IHNJkUrCCsjlDPUB1pVt1reTwKEZ/VO4FW
	5SxFmnLI6WWsaGVcDqo0u5XTQE1S2lTHDiO8NdjkWC627oEmmK/CNLyL6SyjINVLFi8PGmkGMtqIS
	khLzUDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y4Z-0000000EPWd-3fiM;
	Fri, 18 Sep 2026 12:52:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y4Y-0000000EPWT-0SHg;
	Fri, 18 Sep 2026 12:52:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 114B641310;
	Fri, 18 Sep 2026 12:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C8A1F000FF;
	Fri, 18 Sep 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789735928;
	bh=blk1q2GPfCTIxVHkTJ0NRDYY8Gy1jFgpdBubElhEGHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dH/Sx2kfyzBCrftqMkkZn8gRJ4nzM0V+kHF42V1BsRK3M2Za/iOSts6OsbjuSGGcK
	 TvKEpC0SbbuY4nYXcWdGtLuywEsLElyQUYW2XGTn9yu7rZQzjGMQ/FPHb4WsSRu3ci
	 KL1j3X6QG2OGnsKy1C7IKb4YC/IVP6v4PGWvbTaIvJ6CicDYdqFiRuYErlHq49K6kw
	 fC5IJ51WZi70YmllP44DnsZ5+ZE2JXgD3uXs+0H11cIj7AaaCM68tQNrEO45kF6enD
	 SmFdlij59OncUJIFFC5oPHPUla6mHWtxnqmF5BbC7Ms/qcCx8ymmm05JP2bnSEjJLh
	 PecJxJ/QAm71A==
Date: Fri, 18 Sep 2026 14:52:06 +0200
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
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media
 orientation definitions
Message-ID: <aq0z7mX9D3hmsfX-@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzvwtw3fl3akyyhu"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
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


--bzvwtw3fl3akyyhu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:16AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the rockchip device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> ---
> v5:
>  - Fix conflicts in rk3588-rock-5b-plus-radxa-cam4k
> ---
>  arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3=
 ++-
>  arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3=
 ++-
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5=
 +++--
>  .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3=
 ++-
>  .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3=
 ++-
>  5 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--bzvwtw3fl3akyyhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtM/YACgkQ3SOs138+
s6FTahAApCJJD8VZwlXZsthuYmsnMDU3gy+W6iHIuGHqx4nuO+B0Q/L12XsI8LNU
dcGvgin0x3NMcdpa4MnAvIjNt0q3xkeir4zlKIp1b0gs1O1ZklWbOAXWKTaC9hc5
UZmaEjFesI0gezcbogcSsmxwj+gHY7cFSI7kcuUlFguRPK3S7nKKfgdGZKBVoPo0
LBPPcWjQKh7TvsFIhz+xRft0PqHr18l//OY7tOk0vFbjEy7WmPuzyuDcwXatpbhV
WmL+5sirDq2mVBy1mG/gOVoX/q45xWONwqEUqC/M58BlP1zimXuILbHXCIYzwK3x
NccVFsp4MAhswEbaA3gKt+Vi9+Q90xN9uOapQW5W7HRISkQ4d9kwfAecwQuINd0R
YJjjkZubL8GLe8ZlGQAzA5bEK+VGADXvRxtoNim1kFRPN+c6p8jnHk2LCdKdRA+4
CmWzIxSe2nJ58bDd8UmbndptC8MVsGOOC/bT1zk8+SGCoUAN6qRwXs9hFq4bpDB4
w2O4nStGcko7rED/+Ud6FGHHrw7Lqsu0xqIVpF7lBcvA6CfD5dGdMjR1+4uf5DB9
mh3eAKL9kZ16rMwGZ9V28Jr0kvneYKZZk3rxxhcm6Ehl44FHNAynld8E/zVyz2F1
c1AShMJp8jS7FtKRtjLSPku2bRVAHGqG0vabNZUzuh7X/hCEEPk=
=AhHW
-----END PGP SIGNATURE-----

--bzvwtw3fl3akyyhu--

