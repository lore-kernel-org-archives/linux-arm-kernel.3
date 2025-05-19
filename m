Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E1FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUKR1PkGl2Z2FdwJEXA1r2jMzNvP7ZTsOC9uD4WdqUE=; b=VckuS4fhz5KLZ4+BV35xs/LWHS
	H3+nHOJbt4z/3/uSuTGkg6g0w+FOwTGRzhYv2thB39JKV6mZuAlDnAhEyeWT+9Bz3u0gIJsq7Nw1O
	KqQWMo9r/0hndYWInD0vy4LMBDD11dmsHgWlDPrmJTKJbAtl/LhLSwPm463BhEe5Z+PEmHV8UEZ/0
	e1k4GknRcr6OEtrDWlXT12JWsEZoXi1N+mcR0yxEDEJHjk5n8vFALEUb+9hV+M1W3bVyiE3ESxXDk
	COnBgwTximQ3Tq6D3wZLpwaiuzbCalEfnYEQ0nhWs2caKI6dNtCFsLHDgct7UUlEmuZemL6VM7v7v
	rxM/WdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29Y-00000009Xfj-1AXI;
	Mon, 19 May 2025 15:11:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1W9-00000009S2R-0Whz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 318F25C059C;
	Mon, 19 May 2025 14:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF5C4CEE9;
	Mon, 19 May 2025 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747665059;
	bh=Frb3sunV2ENhXKid51T6ZwuAujvRL92OYErynI1QNPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAb1fYLrBeKJGnk2IJ9S1cu3ZQ3cApkn8ZujBtE+RYvjtEGHDElYpRjBunsn+80Lq
	 gk7PazzgHIQVQeI56zkZ+8NeyF76SQ4V6VAjBrO2S6sP6NETgdLs0GB0cY/v1XW3kl
	 UU8egKVe04gTYI2DRfThddoiJq5HBN/WKwoMb1ryiTypcmq+CbsmfU/exzmlli70pH
	 Nw21n1gWRQG6dQB+diYGstG0SuBCeHEz3DksU3sPA68uI0TctlFgFWF7MKKpWGeJhg
	 cRV6BdKStlFX/HTNWaHq/prv34ePzJGq9QgL32YnwjMLeYHIVEy8Jt+thx6TpIfxVu
	 yuNctDG18pERA==
Date: Mon, 19 May 2025 15:30:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
Message-ID: <1ca1fe0b-2337-4aa6-b36d-f4d11df7b0f5@sirena.org.uk>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
 <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <c929b7d8-6348-4978-824e-6902d0364a00@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tcNGpct1qXGitB4"
Content-Disposition: inline
In-Reply-To: <c929b7d8-6348-4978-824e-6902d0364a00@linaro.org>
X-Cookie: We have ears, earther...FOUR OF THEM!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073101_208613_9AE134F8 
X-CRM114-Status: GOOD (  12.91  )
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


--5tcNGpct1qXGitB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 04:13:14PM +0200, Krzysztof Kozlowski wrote:

> You claim with this:

> 	compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

> That 8mp is fully compatible with 8mm, yet here you claim that 8mm is
> not handled. So it is both compatible and not compatible.

Note that binding for anatop and the above compatible list are in
mainline so this is a preexisting issue, whatever differences there are
in the versions in the two SoCs aren't triggering problems with the code
that's in mainline.  The series adding actual clock drivers triggers the
issue but the claim that the two were compatible wasn't introduced by
it.  Given this if people are shipping DTBs based on the existing kernel
we might need something like this patch to work around them, even if we
fix the existing binding and .dtsi files.

--5tcNGpct1qXGitB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrQJ0ACgkQJNaLcl1U
h9DtDAf/YOhQ/EgQbcTye6iDeHwoQtdcs7hIDQQaJYA6f9Io0CcGpfOSYQHlbN/n
OIcXaNe+qIC2nc94z8vn5LvGkFTEb4qHUtW8PJKzXrRurP72HvOAk0oEdJN9OylP
6Lerjp0Z88s3h6t/aeXVedjzsnbDiil9dXtbAnR7QEzma03NJfWdsf/ecwcPFgXc
JsPSniUHinFE4f0bSq5iRPshTdBpwmHMgjbEI2jedSom27U8693k4uRhmq0qZ+ht
plwHnVPkcsH2V4dZe5XGr2pQ82CEyPZkfHYjfjSBBiDMAgOPgrIlUbjXCfuRgCYL
iEz7t/xV12xq7v9pp8sssHCZ2JSf0A==
=Lhqe
-----END PGP SIGNATURE-----

--5tcNGpct1qXGitB4--

