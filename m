Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D623C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2DP9sd+V3gapp2vPDfzOknQfw1soNffgDYWsjI+4Hs=; b=H1ezpsdE9AfllHwogMhy5xdOOT
	N/DRpVGqersnEBPXxn/hkceKKyP2tX1QQYpBEcy1Yzm4OgmHnbWtuf4PhItIqRVp2yBMT6iA20Jf1
	ZPsTuUD801LdKWdaQyrwuTLgN5jeSpAuiU/gIzq0Q2W+pURTF+N+n5gzWo3TlhsiisaUEHTrxKF9w
	t8q1VzY/IFOtAgqMjZF7/YN0zNr16k+LvJ4GYiIu5HIdsy1X9vsG3uHScdUvAQcyoKfoKccfXC+8K
	gQMpiKzGGHz2j53AqPC0sKNnQpeEjGo6RFTPVsxPzZoCTNIQ9S+cRNyzPPxZP/uqky7iXryxBcmzs
	j9TU/nHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNNt-00000003C7w-0Fct;
	Mon, 27 Jul 2026 15:36:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNNr-00000003C7i-2oVE;
	Mon, 27 Jul 2026 15:36:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2224360008;
	Mon, 27 Jul 2026 15:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468F71F000E9;
	Mon, 27 Jul 2026 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166610;
	bh=O2DP9sd+V3gapp2vPDfzOknQfw1soNffgDYWsjI+4Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XsOWJdfedVUvAlAsTjIsfwaiMzFbrquKnAstZhHi4+vXSekL2D60TGJVuQQAU4S9H
	 jNtGSxefNhWWdWWEPLViTwIZZ+UqrI2C2awIK3R5gajgvVMB7XLZauHrpepXb02OQg
	 5r0l5GJw/+iuhe/NGsTpdn5373eTYRXa0QolApGMsCoXIFWjxG6p0wbjO7r2ytLSS7
	 2Qrn6T/33aWyRhftWLXomiGcNvkh7Kz4pE8cnzaPkuUyCOVkSyCfIT0klJs7l1KKSg
	 nRxeDYGGkqfcDWVGxgj+N8UXZB56saDnFi0A56YdfJwsZMat9ybWEkgUWwHqDc2So0
	 E0N7FsMYg43uA==
Date: Mon, 27 Jul 2026 17:36:48 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: rockchip: clean-up simple provider misuse of
 the consumer API
Message-ID: <amd7CasCCYOoyXhf@orome>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-4-56f306156d25@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbtxxe6iq2gig57t"
Content-Disposition: inline
In-Reply-To: <20260724-clk-provider-simple-clean-v2-4-56f306156d25@baylibre.com>
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


--xbtxxe6iq2gig57t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] clk: rockchip: clean-up simple provider misuse of
 the consumer API
MIME-Version: 1.0

On Fri, Jul 24, 2026 at 11:03:55AM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>=20
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/rockchip/clk-pll.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--xbtxxe6iq2gig57t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpnexAACgkQ3SOs138+
s6HjrBAAqVx4wDajmCyTkTuu6eCSuKR8bW8dpLrULaaLS4gwAjsVCLv/lzY7LpDg
+d7MXmAEth+FTysFv2BJIbi8843APxU+e230/GErUGMV7l42ITOIepPHVDoFRdl4
lP2vp96vn9eXV/tUSBVWoiyaqpk/TDbaPT5GtGsGU3TrtrmTFA1uC16YmAikOOV6
EbexV8rKrsf+90wnf2ScvcZN25SrkjdHZPPiYm8ha+25tubNWQooRKGMaUF8wppr
XQSHImaQ4Z0uDPqkZsn0DUJZcSQOHPMEmXgzfdZ/FyGueKY4028P2rsYU3xax4hZ
qCxTSXsfkkUUm9jZOtuGLhgUPdVZ7Gc5G9x8VtSToJaBR0yA9Ko1L7pbPIKWoVFz
FlivG9Fx1tetf3wKKbSqPtR1ncFtJeg3UENYFlawkgdONOYTbyjH/oZ9U7fWny9p
UskCye1oz98QG0n7bpXlEQRs/GvdNZbgkgp50MENqjKDuSDn2LugNesoBSygozIU
ewfAbShTn/10piWzHhHvekgPKhwQ7Utxu9E1P8FOovFB9k0S2R3uIUHSL+MldaJt
p7pjYEC2RjPPvk7RpvVhCtsyr8Pihnx7Oh6wtaBOFf3tESxZSBgFfX/JOgD4w6IO
mNYMw4Nt5ICFcm/aSDngscGzgFSO1mi7QQIUZWFDFMQQSbgjYg8=
=q9vv
-----END PGP SIGNATURE-----

--xbtxxe6iq2gig57t--

