Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDE6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOVKrShfngqoG7pUuUhPe5rOvalA8siTTMVurVSw28E=; b=UePak1GUkPU9kH55v4jWRy6y6o
	Gz/zao7a4FIAxPLEOmK36dHPz6LKHCRO3M2VqcBB4kHZuHJcIRuppfjrhvSGWP5iRBeeDlB2u2zYi
	oTSwT7C0kCHhigrl6+6FiyVQh72/6xgvpxrqZBGLOdnypVrs9mP8TcILfDWw6pb5DWm3U6Z1WDhS9
	zYRVkcgZNVbZTeb9B34zES4Bi3sVOQ7U763ELVzsY/UR/nBfrCuqVezMABDm/3As4fI6Cthu5UOOU
	BtLRGeLXy9gmo72Pfa8vosc6ahyhWWIglTfaKnrXVedSHN0E4V+t7aRyFhKinwPN2b9qildBw8Tnu
	YchZXAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKPO-00000003AfC-3eAr;
	Fri, 09 May 2025 09:52:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJah-000000031QY-2v8U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1943E6111F;
	Fri,  9 May 2025 09:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E588C4CEE4;
	Fri,  9 May 2025 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746781222;
	bh=WggMzPB4PnrTuJVx60/e7YDCOMcSJ2K4xopMb4oUKlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBGJSfUcQQhwvIfaq6rz0bXdvpjSawL2rnIVRci9JQxF0vJytuc4Zt6AkacWf/R4Q
	 NkGsl35CCsc7X5QbWMJhEYe4eNgGqRv9+K3l32nYK5iNGvIgLejRnn7kIkIJWDkwO/
	 HMs1VlQRJ9fkwttxLy+FYYAiFcdcp0XAO9js/CyhiCk0B2nHWLJevYboF/y81KjGu8
	 R0ePIVKVQe3S5VNloWQ8IOnjmBxBIx3ZbRzMwGLqI/UYaiBN7TxhW1Wavz3Nd3HG9Q
	 q5faFlaW5CTMYk2m9mFaiPehhKJ3FggnNY5UhKCHv+PZlJN48Uf0N93FRP5pImIgO4
	 uZiQ4y1mjO6AQ==
Date: Fri, 9 May 2025 18:00:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock
 driver
Message-ID: <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
 <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNr9BVPJwGXcU9WK"
Content-Disposition: inline
In-Reply-To: <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
X-Cookie: Well begun is half done.
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


--LNr9BVPJwGXcU9WK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 09, 2025 at 10:34:38AM +0200, Dario Binacchi wrote:

> From the log I see that you are testing a board with i.MX8MP, but it's
> probing the anatop for i.MX8MM.
> Is it possible that you have the CONFIG_CLK_IMX8MM option enabled?

This is an arm64 defconfig so whatever that has set, including the
above.  Note that arm64 is supposed to be single kernel build for all
platforms so we shouldn't explode due to config options for other
platforms.

Current -next defconfig:

   https://builds.sirena.org.uk/f48887a98b78880b7711aca311fbbbcaad6c4e3b/arm64/defconfig/config

> I have personally tested the patches on i.MX8MN and i.MX8MP
> architectures, with only
> CONFIG_CLK_IMX8MN and CONFIG_CLK_IMX8MP enabled respectively, and I
> didn't encounter any issues.

Given it's wide use for CI the defconfig really needs covering, any
random combination of options that can be set ought to work though.

--LNr9BVPJwGXcU9WK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgdxB0ACgkQJNaLcl1U
h9BSlwf/Vtb8OMqevi6wj00lKii/uNGXMGvMTb9ifa4UeAtfm5zK6qZXBmlEq0UC
cTA1i2924jNkx+ibv6O8m3+inlwjJL5Z6TFpHUn/4QinBhHQeqp0uAlw07lFR2rC
xzNOMYpxPqxoA8s+zzpXIKnlq7sVaPBj04pw9mlbFEeOf/6BRNOTPWePvkH4Ivl7
c34t8qAzUcfZjuVV0mDfrNUKrWTrMvwYTYJWhXemCXwO5QzhFD97YFWXnF+sGBlP
y388Wc4mqN8yO9ePREYfR8aN4jFtcB8+J6LUuDtotLw5QQS62DmPnZ3dC3sMeJGE
4xm+8aOZ1B4WIIQtQm2MPtwX350Srw==
=nfNO
-----END PGP SIGNATURE-----

--LNr9BVPJwGXcU9WK--

