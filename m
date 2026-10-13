Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A72CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYCeAc1t7YDhbo8UUG5XDwubHVOci6vebazkH/sVjcE=; b=b6QyVaHGjMnX3CVDtQa5G6+tbI
	PTM4cBSBSbSpeKoNwRJAJGjrgYy9ap8eEqWVOL9w49j+4LR6Aa95Db4Lsg8cpz8IiidwFO1zYQop5
	8cIZlyAkO8xsx8/i0yohsEpoFr14b0y/ypM46Wo6NaovWah3dDdl6GcLY6m3FaJobSyxGpOB/jQDD
	dw2C3VtIz3jk0GIvWiLv5//R/RQIxb1nUpGi80FnWY73hcMxED4456hnJf/kzdd+vCZ+HZ5WeK+SP
	YzHw5IOSNAciLGZpJ37YOCs38DuwSIi023ld36jWbaH1ZvuSEnHhjCnKuNUMq8zj6PolLC70J9w41
	0YrfKClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgaA-0000000DkFy-3nZq;
	Tue, 13 Oct 2026 17:46:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGga9-0000000DkFF-3XJd;
	Tue, 13 Oct 2026 17:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B99D403E9;
	Tue, 13 Oct 2026 17:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611B71F00893;
	Tue, 13 Oct 2026 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913593;
	bh=HYCeAc1t7YDhbo8UUG5XDwubHVOci6vebazkH/sVjcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpggZkBK3OeaP8o6UC6PixSgCdq6VgfWcoOEf+2JajZOlKBCN26pFKQ+L1f9CZLxG
	 ij/oTYLtx8caXto0296ZOPLFzOKc+yLjEc3kSEGks5I3hUXDpj8qiWkQab1c6zSmGD
	 voGZyjBD9Yt9SvmGS6dMfvEQwPAUcwMXlLwgAM4JuliTSJ03XBALwTYrn1n65E/mig
	 I1sXLiCmF8ffzVkPqf7VFlSfpOKBWejcx5xR/GCyAJQc/b7rBrnsVU4JIp2ai+OACW
	 612CfR3DIJzvXFW+naxfPxvgLVJb6JQtWHvvRaxTIbMpxYt+b52YXt2dN1smP5Isec
	 KferN61ngwDwA==
Date: Tue, 13 Oct 2026 18:46:25 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
Message-ID: <48d8de43-071a-462f-ae70-2e96a9b9a96a@sirena.org.uk>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
 <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YsUmANrUs0kpxFup"
Content-Disposition: inline
In-Reply-To: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
X-Cookie: Some equipment shown is optional.
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


--YsUmANrUs0kpxFup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 10, 2026 at 12:20:04PM +1000, James Calligeros wrote:
> Krzysztof Kozlowski wrote:
> > On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:

> > > Some integrators do not expose the power rails connected to the codec
> > > in a way that can be expressed in the Devicetree. Do not require them
> > > to be specified on such platforms.

> > I don't understand how these cannot be expressed in Devicetree. What are
> > we missing?

> On Apple devices, the regulator(s) driving these pins are completely opaque.
> They are not exposed via the Apple Devicetree or any other discoverable
> interface, and they are not controllable. As far as we can tell, the pins in
> question are powered whenever the machine is powered on.

So just put some fixed regulators in your DT if that's what you have?
They must physically exist.

--YsUmANrUs0kpxFup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrObnEACgkQJNaLcl1U
h9D0TAf/RXyh1qyxX0LsoKQj8mCy5yFI4o5W/kAUP2LtHoYyi04v+NllBnz+E+RV
LHBSSxgBpR8uDmFHBgZMJZGRWzaKMqkjntwLk2UTIcePwz+iDFWumGabGui1CP0H
EtYQkVZD70ReiM5nPe7Ldqp6DxcK3f81IsKAwBe1laDwcwP0WCiN8MxJKcKDimg9
HeOPcCbg8o+iLMmViCO7ZPMpLR9MA7LdGpy8i15/hNeHy0Nj51uVwQRWfnmiyV0c
nZZZQ2GNwIj0LdsJ08byVrvh7iw9pvzrcVW7fGd5QRVw+ldZ/Y5J/FU1aG2W8UhM
206Pcl5qESO18bA9iGiCAvtESUjcaQ==
=47vz
-----END PGP SIGNATURE-----

--YsUmANrUs0kpxFup--

