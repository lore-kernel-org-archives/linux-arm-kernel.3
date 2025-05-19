Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B72CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaNav3sBrf+ajbZXLhUMarN3/MfBoyVyN/UScWNXpy0=; b=Rdw4rOfgEl3s19Q5/sSBGD1pwB
	Dsl+K0H33wCiECCE2S7qyShRWqdbFmy9+TnoGvIQtx3P2hkusRapS3aVsbPImMkP7u1Pb0d9qQ2XU
	bmwQpYDoEk8LBwttUVTCJHcJ0DnPb86e3ajojMHzBL5bqKSBenxSVVEg4muviL1kbLGH7wf0bOdfv
	LYIqXWm7DspZwnPYtSYJj87fuFJH5HtbPyXeW28ZLeodJvYkx6/6VkjV3s/ekySTW2+USjueHdD3A
	hxxIYXU8JK4U9b+1/hM56OmZ7lvjIBPlAz2kCq+DnGMGBnToqAXSLxbg7O+ja+W+QWo4kXTVkREbj
	bOCK2c8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0M5-00000009GSb-1RqL;
	Mon, 19 May 2025 13:16:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0DD-00000009FBI-0YuR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 13:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9873C4397A;
	Mon, 19 May 2025 13:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDD6C4CEEF;
	Mon, 19 May 2025 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747660042;
	bh=3Wg7xeXwWg57LwctIHTN36UKwYy2WkoauQgrpE6/j0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6LfSAIXHN3Ee/wXz+FiJ7aHcVXuo5JBL6t6SyO0SQKXw1f48rt15b0jamMU2mpwI
	 ZwLK3BLryJ+WTYHp5ljoj+RTj3jpI5SHINo/TWUaHcwDKTJYA8oLFa7/FfRIsJaX1X
	 EHsa9iUuisfSj3vOJrWkWCMu7fbe/3AwW8N7BR93QPU0FfFujvI7jzPPxYiNuyWC1y
	 DYqmDJPw7nB1FwNI88bVh+W1GsDEzuA3g4g0HwJdWBWuyq/4sKEFQojdVveeNIZzaB
	 /rj1kcvpVEmf+rmFs5KJfP3bg22nd8YpKs7rUM3Fu+laYcptQC91NbKSL7teQCfKp6
	 9EXJhoMGULS2g==
Date: Mon, 19 May 2025 14:07:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Message-ID: <671f0a01-34b4-4593-bd69-4fb5ed9667a1@sirena.org.uk>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
 <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MBclyymphZ97chDx"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_060723_189628_8C97E66B 
X-CRM114-Status: GOOD (  11.40  )
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


--MBclyymphZ97chDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:58:48PM +0000, Peng Fan wrote:
> > Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on
> > i.MX8MM platforms

> DT Maintainer Krzysztof NACKed [1] because of ABI break.

> Are we continuing breaking the ABI?=20

> [1] https://lore.kernel.org/imx/6a28f9bb-05fa-45ff-8c0b-790c0caf3252@kern=
el.org/T/#u

As I've reported a couple of times now (including in the thread you
link above) i.MX8MP platforms haven't booted -next for several weeks:

   https://lore.kernel.org/imx/6a28f9bb-05fa-45ff-8c0b-790c0caf3252@kernel.=
org/T/#m8f7886b2f57fe80e2d87e2242bc88389dedf2ae4a

These patches need to be either fixed or dropped.

--MBclyymphZ97chDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrLQQACgkQJNaLcl1U
h9Bnggf/dVpAK8GCD1ZnWPqRKPRHVdzjgULXGUb/rFn5DrklU1uBMK8sVMN/jp2G
EYcYEsSSAgF+shGKrwmAKvlBewxQG5Y59dCwtcBqQjJ8Va7M4YWm/SFQRUB2R+pV
O66RK+MaWWZlc+0b/vBG3AjWSRXrDmVj/z5en/6v3ThXxvJgm1k1l0pzDXOCIlkD
pdmCkUzoY1yKOGhpxSIycmJxxEf5lo8PwJvXRGxPD56UcFh0TcG7+p7gbaDihg6L
JDazog/9fov5QRTIk/urQk3n8sdl8FSTeMy4RVXNatSKcgtlH+AwOAEnO/KmdCtR
peijzQUTbAkAfOtVndqcNjd8bqm4tA==
=ph3t
-----END PGP SIGNATURE-----

--MBclyymphZ97chDx--

