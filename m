Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEEDC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uAtYTanQvdsf1B+VPerfl6h7vAqJMoph6hxUBqYX7Y=; b=BegEaUYhwPCjoTJMGYyE9QzgaR
	mp346SX53FImSk1vMwekZcVQfgHSEemvvI6wTPbLxUPRWZQ6ZcSNOh+4UfCH5ue1pDBFinO8tLoZO
	g2Lslbl+lGWyjiUC2FRdOdfH+2qVJHd3IjzM9GUmQHCskSdcCreab2q7/0XLLFmQ3mbTA7c1sAbeQ
	tZZTd/FDfDodGkIzQgfnyx0T0wUoFk82omOauqg6g4QvwsqfHcerBm1k2LJ+e+rv5KkUxrHBBqdnN
	+qYiSTw8ytLYAkbm91zVb/xRCLzc8OpJI2igGFmKUTc7hBbiUzyuvyVETwbYB/6bvPFX8phiivL8u
	QCW8jGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cqj-000000020qs-1e8L;
	Mon, 21 Sep 2026 12:10:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cqi-000000020qU-2UUV;
	Mon, 21 Sep 2026 12:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C607540769;
	Mon, 21 Sep 2026 12:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE441F000FF;
	Mon, 21 Sep 2026 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992619;
	bh=3uAtYTanQvdsf1B+VPerfl6h7vAqJMoph6hxUBqYX7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOpaGtJ8d++Zjqk+UoXhakEjmOlnVQIsuHpbXfFYV7K8jr4hyOGCVgwc3IAF2ni5w
	 p1uvEkfp9voac0b7T8ihJV0NM2Q68FaNxdCAGlv/f+CLHPK45HP7IzejYj81Ylz2HJ
	 +QuWP1387BZap0C4UNLw1ceCBKNpcnPezEY5lbrThWRyOM/V0Phx4YqGxyGEc28xUH
	 oZlcD8tzG9DuLVRxOdQnCR879W9saNzv26PHUVOQvaFhKpXpga0d2EnYJ2nIghTC/y
	 twDPiKShfjwM90J4jSLynS47kyx0geFk9lM0oXqfT/xzzUqwL4OaH3pmkHFW2Yfcvj
	 +xaneJMo9qBRQ==
Date: Mon, 21 Sep 2026 14:10:17 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <arEeG06MiZ_97uzH@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
 <20260921073538.GA1466037@killaraus.ideasonboard.com>
 <arEVs0FDleyHeeLj@orome>
 <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnshuij5kqlf56wu"
Content-Disposition: inline
In-Reply-To: <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>
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


--vnshuij5kqlf56wu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 12:47:23PM +0100, Kieran Bingham wrote:
> Quoting Thierry Reding (2026-09-21 12:33:54)
> > On Mon, Sep 21, 2026 at 10:35:38AM +0300, Laurent Pinchart wrote:
> > > On Mon, Sep 21, 2026 at 09:07:01AM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven wrote:
> > > > > On Fri, 18 Sept 2026 at 12:55, Kieran Bingham wrote:
> > > > > > Add a new dt-bindings/media/video-interface-devices.h header th=
at
> > > > > > initially supports the Orientation types and convert existing u=
sers
> > > > > > throughout the code base.
> > > > >
> > > > > Just noticed these are already in since commit 6ab5acfb8dd38729
> > > > > ("dt-bindings: media: Add macros for video interface devices") in
> > > > > media/master (next-20260903 and later)?
> > > > >
> > > > > > v3 collects tags, and fixes the typo, but drops all hunks that =
do not
> > > > >
> > > > > [...]
> > > > >
> > > > > > v2:
> > > > >
> > > > > Interesting changelog order ;-)
> > > > >
> > > > > [...]
> > > > >
> > > > > > v3:
> > > > >
> > > > > [...]
> > > > >
> > > > > > -v4:
> > > > >
> > > > > [...]
> > > > >
> > > > >
> > > > > > -v5:
> > > > > >  - Definitions now accepted in linux-media, rebased to get conv=
ersions in.
> > > > >
> > > > > Oh, you say so here ;-)
> > > > >
> > > > > >       arm64: dts: renesas: Convert to new media orientation def=
initions
> > > > >
> > > > > So it's been safe for me to pick this up since v5?
> > > >=20
> > > > No it's not, there is a hard dependency.
> > >=20
> > > The whole series needs to be postponed by one kernel cycle :-/ It's n=
ot
> > > urgent so it's not a big deal. Kieran will have the priviledge of
> > > rebasing and sending a v7 :-)
> >=20
> > If all platform maintainers Ack this series, they could go through the
> > media tree where the shared include was already merged. Alternatively
> > the media maintainers could provide a shared branch for everyone to pull
> > into their platform trees.
> >=20
> > But given that this is simply replacing a literal with a preprocessor
> > macro, maybe not worth the extra hassle.
>=20
> Indeed, I'm not personally worried here. I thought that because Sakari
> had accepted the main patches these could go in now, so I refreshed the
> series.
>=20
> I don't really care which route they go, or when. I'd rather not have to
> re-re-rebase again in two months ... but I can cope whatever :D There's
> certainly no urgency here.

You already have my Acked-by and I'm fine with anyone picking up the
Tegra DT changes. I don't think there's going to be any conflict with
any other work in the Tegra tree. If they don't get applied, I'll pick
it up for the next release.

Thierry

--vnshuij5kqlf56wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxHqkACgkQ3SOs138+
s6GCVA/8CTjCU06x7t4Mbm966PsuhGx8Q1j3ntV2PiowxzhJwEyb68oBkfVXTkrL
9rGbkF8OnuoiY/uxupgsIUa+x2hplNqTs6J/OxG5LLbOhdnv1OpzXUBaXlg6ahe2
+7XwSzG2TQcYExblLuZqsViN21+KOWOJAcTGTnxP/X0lbLQYLjSRmzkVlOPjhtEU
uhszVibjBBSQjotx1SMbk0C2Mxmko7X+ocCxsZ+APwIO3xvrxRRefs3s5nWXRaZH
mb8ywwgh0WqojUcfOLazhhfUQ/wIn5WTNutOymPP17QgoUVluJOu9TUz1KEnSDVg
B5NLXtC37c4Ap7iy4ZZMbs95EpkH6c6Dg5qF6avcs3nDUt/g94yCb3eQ20JBveBj
jOBT9Gpc5pz0s5wLzVzCNWmKk1tQYABslMzcS5aQLBy85HUIwDH/DcCXBOQMm5Tu
ukBohOeV+nvFWVkT5gDK+zRzaHqPpYpajvemCYUJrw5eXZp53X0L8JV+4HvhGgnW
uUHIqXFNgXiRGiSfAs+24+jaUhU/W8Wpj5svPEsD2/OeW2jjUTKpo58pQEo7X4up
XVVNGOuxJaT/8Rh62gC7rHMnM2sVlBE9I0rpRtghOzA8EBdyFnq22rDy/xIx/86j
aXnoCcK0YUHzkj4lzswo2sohi0nE4T9nDsfYTN14FxH3WvRPoFk=
=3wJh
-----END PGP SIGNATURE-----

--vnshuij5kqlf56wu--

