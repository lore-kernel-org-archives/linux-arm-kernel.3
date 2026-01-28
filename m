Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F0AD3F076
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0L21iZQE6yD4RaKldOb6lO8mhKXmFZPHTycUeA2FrU=; b=vsC1/xkMAsFi5v9VNKvE8tr5Kk
	DhV3l8U3OoHPkcIyYvzH0DE/ASEmTlwPxhsf8Irw2rRbVTsblgcjg0kd9Br1wtRX5f2OJXNyfK+vV
	oCv4V00T9aKmLBDvhFs6BYx4UgN08BMNM4II47qTfD7hWZ8wVVn9tOttgeYbezM6OIc3LrFzd6ond
	MMWMwmKpYBKe2YGg2+9AwJqN+9pQ+GxD0o7HRrRYxCOwIMFG5BdvJmvcdI4MLR5aldgI+Z7GbAA7U
	EIxsP0N7dtrlvJ+OqWzIYkrXY5a8C+FXaFV4ZRSDfniqNiG4MZqq43uIFsiLbO/X9szF4yE5iMfzk
	DDrM9R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6pC-0000000GCfj-2czf;
	Wed, 28 Jan 2026 14:47:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6p9-0000000GCfQ-2rtT;
	Wed, 28 Jan 2026 14:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C315F600AD;
	Wed, 28 Jan 2026 14:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF98C4CEF1;
	Wed, 28 Jan 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769611634;
	bh=tHWNBPFYS91KkDSP5taGybUFdFj3eFVqHM55nD7uiTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul09wiqX8UI6vXHuhBsL1eLLc7dCJAXEsJeehfRWsu+h1mwgsjjfsDX+NWjAL2b0/
	 4xqPup32t3j8pF3fJvYzjBxDVdTjfbqCjine4m+iR1kdAfSATO6+JS1XECxnrGg6is
	 LZ5YvjxU11g0ldUEHoMSJwXuoJcpmrGJfShYZe7EEnhLY5rVl0VxGyNsyOmNYKbAY0
	 iI4GVkNvMY/i7nt1HyCra7DRgdR/olvh0SbCo66t9XYKIAsHI3ADMRSK4Q4s63HEtX
	 BGbImqzNemsDZ6piY5Kvm38n1ehvBSDQFVIvExRsnn2/e+tvmf8632pV3aPoU2Fmp/
	 xO+gE52vLMC0A==
Date: Wed, 28 Jan 2026 14:47:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6800096.lOV4Wx5bFT@workhorse>
 <1cbf0f37-13de-46a5-a3c0-0509048c519e@sirena.org.uk>
 <6678782.DvuYhMxLoT@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GDKwEpCHvyP7dewC"
Content-Disposition: inline
In-Reply-To: <6678782.DvuYhMxLoT@workhorse>
X-Cookie: I brake for chezlogs!
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


--GDKwEpCHvyP7dewC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 03:09:46PM +0100, Nicolas Frattaroli wrote:
> On Wednesday, 28 January 2026 00:14:29 Central European Standard Time Mark Brown wrote:

> > Do you have a debugging patch we could run which would say which clocks
> > are impacted?  I guess it's more of an issue for the platforms that give
> > no output but for at least Avenger96 I was getting earlycon output.

> Try this one

For the Avenger96 that says:

[    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
[    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
[    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
[    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu

https://lava.sirena.org.uk/scheduler/job/2412562#L563

--GDKwEpCHvyP7dewC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6IWwACgkQJNaLcl1U
h9BBPwf+LjkTj9Qp0vyhD/i/R80ajL4bZ1ZDsFjeS7Q9ndpXjMlkWi2WkEMZIwa/
P+8ztpF6h/fmEXd3p0CscB4vRcESWpxlen8r+emlnUb+3fauARNtpcCn2rKnHkOO
jD6NPuNlD8RtZ4I2CciBtNW62ueWIz6wicxe31v6YMianQtrz7x6ir8LJjYO8yLx
4vrxf50/IQcQYSaNAukI+kmPEL/61gjY6FK8/vj6in7tdZDiIU/tj2pjI5WVtP28
MzzqbpFGPx9OEPRwKeScc8p9c69qdWQ+WCORo6VxGo1FQ4r068BFEUjOKSNFwRWU
W3J95d/PsXOZF12bpTIlh1Kq63T43A==
=9Yi1
-----END PGP SIGNATURE-----

--GDKwEpCHvyP7dewC--

