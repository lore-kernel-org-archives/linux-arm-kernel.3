Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F5C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDIUNnJTr3U0Ey9p4etc55PGRbEZi0JsFTUGlPBKo5M=; b=C8+a+dcQFlcFBq9KxTt4nspj7z
	DrVNKXsJ+cqbVKKBfRieFrhvAmAuanIw6L+OSq99stNSQOlIpTiEgZgeQCkezho32xcHbC7lqdGBb
	04x9cBjVjfZCbubMwNwoG+KG8xTAJ8TV+4IMMITqDEWTdKljugmaZonVW2S0U1TxzYu4WOtI8LIc0
	EUz2Qy5Ge0AAAgqgifzyietrDg3qnV5/sYa5NsBXCGgNHPIM2ekxfHPCD3W/sHi3hJCuOTWkZdzKR
	DvhRlw4kBUCBWqcyGg1ZfSmR+FyE0qziK+KKU+GaPf5ieHSO6St1lOgAITB7i8hXiYxVuk3VhWBFu
	GXkZMYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cHW-00000001vck-12Jo;
	Mon, 21 Sep 2026 11:33:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cHV-00000001vcX-14pd;
	Mon, 21 Sep 2026 11:33:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 927454394F;
	Mon, 21 Sep 2026 11:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B591F000FF;
	Mon, 21 Sep 2026 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789990436;
	bh=MDIUNnJTr3U0Ey9p4etc55PGRbEZi0JsFTUGlPBKo5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MdJ1QI3yp0m4W6wPjnpOlP/LuYDBBHyHtO6Zn5chWqo6r8O56zfzdu30oPxNYD7eA
	 6NGIwnlNi7nbYAUpTe1nB9kvVWEiGBLoBvhjAHsDR6BvGuOtqTHJcPSCEiap+Uxct0
	 XCeDFQD0PyS9iZgRDiVsh2TcunDaQiBgZY/9kjfjGSJr7L8n5Hmu9QWXs9J+wkqaLD
	 OQSjmUuvVqsmZx1mUngxnmaYWwePogbProrqJV/yU2encACF0F3DNiP/Z86Sez1sve
	 3bQh5KztIL9br8JUjHdDnn67RbY+tci0wjl5CYZnvUkpF+gfVLiTLCjAdHzsfTJzui
	 Wb+6X6UdDhHpQ==
Date: Mon, 21 Sep 2026 13:33:54 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
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
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	David Heidelberg <david@ixit.cz>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <arEVs0FDleyHeeLj@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
 <20260921073538.GA1466037@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rscvpqrbalagvufr"
Content-Disposition: inline
In-Reply-To: <20260921073538.GA1466037@killaraus.ideasonboard.com>
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


--rscvpqrbalagvufr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 10:35:38AM +0300, Laurent Pinchart wrote:
> On Mon, Sep 21, 2026 at 09:07:01AM +0200, Geert Uytterhoeven wrote:
> > On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven wrote:
> > > On Fri, 18 Sept 2026 at 12:55, Kieran Bingham wrote:
> > > > Add a new dt-bindings/media/video-interface-devices.h header that
> > > > initially supports the Orientation types and convert existing users
> > > > throughout the code base.
> > >
> > > Just noticed these are already in since commit 6ab5acfb8dd38729
> > > ("dt-bindings: media: Add macros for video interface devices") in
> > > media/master (next-20260903 and later)?
> > >
> > > > v3 collects tags, and fixes the typo, but drops all hunks that do n=
ot
> > >
> > > [...]
> > >
> > > > v2:
> > >
> > > Interesting changelog order ;-)
> > >
> > > [...]
> > >
> > > > v3:
> > >
> > > [...]
> > >
> > > > -v4:
> > >
> > > [...]
> > >
> > >
> > > > -v5:
> > > >  - Definitions now accepted in linux-media, rebased to get conversi=
ons in.
> > >
> > > Oh, you say so here ;-)
> > >
> > > >       arm64: dts: renesas: Convert to new media orientation definit=
ions
> > >
> > > So it's been safe for me to pick this up since v5?
> >=20
> > No it's not, there is a hard dependency.
>=20
> The whole series needs to be postponed by one kernel cycle :-/ It's not
> urgent so it's not a big deal. Kieran will have the priviledge of
> rebasing and sending a v7 :-)

If all platform maintainers Ack this series, they could go through the
media tree where the shared include was already merged. Alternatively
the media maintainers could provide a shared branch for everyone to pull
into their platform trees.

But given that this is simply replacing a literal with a preprocessor
macro, maybe not worth the extra hassle.

Thierry

--rscvpqrbalagvufr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxFiIACgkQ3SOs138+
s6HA/BAAlTOuxN7hAGKsy7dYRPGn5XonD1CL3PrwL+ma3OlyhbTXIVe+Io6RW7J5
zKfOah30Mnvem2LLH7Sg0m4pfm8rTX/nF7tQQihKyk5IU0/9OgH8/2J5VeB6WRmb
7ekKOnFAQw9YQs1vcpGn4Jm1JvkIz1ari2ZXHx2qf3gfSi43gDwZ5ZLZSnL2NyTG
ZaSMB+Sqiao0Q8YuY0UYuEi4jqGJr6qV0fpJKMaG+LHrPS42UG0PYDSbwLkkXALN
GOz3A9wsFz58L3s92t3+L030Jl/WJEzrg9b6HzfbuS1YKX0mcG1FWRQB3k6waSQM
lSVq/HZ2fzW31WglB118JZFVqyBGH8cHxXumpsOkOcPiga0dkUIkfCIdOm1GWP1J
Q/CMLKNu3phGaXej8wIlhtZxUbhP1DYJmAWtYNSAbOg/Zgomo1Q4y+m2qxkO2VWr
fq/UoozCz2rYlLcTDYB/ML7e2KZHsh7OTNwIGaJ3eIretaKyI+K9jOfOxLZ83SuJ
yvkNTOAq9sRKiSQod41cgN4UWLsSEdLn6399hyFGHpcwazrebRKfnnfMUauRflSq
sLokqJGJrk/Ck2uecD/pNXlBGztCR5Czxyf+R4CHNMKMa8HqYQS9OFvU32QnyD26
6Nb3cTM0bMwTrWMTJVQnV+SVmqld3xVL6f9i1vImIvJAiEcxJQg=
=n1ZD
-----END PGP SIGNATURE-----

--rscvpqrbalagvufr--

