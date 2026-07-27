Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA5C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH0dfJwx6TaUJRP9778eSVp+cuHpBPdxCqvvTxPFEdM=; b=pHem+PXMWLGGoVvOfstRFosyLQ
	/HGy9M69OiMMYfByRt8RPGMisw7AfqSUHdJwCoUlHjIlPwcXTS4myfETYd7mXm6CdeBFv2bxA7DxN
	tUztSbjZK6FCP/a/CK6lR+/0KzVof2Qzrw7P4beP2YOcpYiZZP2pMH09w1pkY9GfHtfWu9neLIKxA
	E0E3luArs/SnQ3JMGM9cEAhPnTi1Pwva37KiAkUlXwdjU251Y38fYomy601Z0OC4/ODbD90FZhGC9
	NRtcMUBJgzx+icYJHV+8A4JIB7F+7OKDvgJ0qiXqNVTc0n4/du2CSuN1tN6fTaGjQn3SmfAgXewbb
	OWJf4OIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNN5-00000003BrO-2m78;
	Mon, 27 Jul 2026 15:36:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNN3-00000003Bqu-47Jx;
	Mon, 27 Jul 2026 15:36:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6438741576;
	Mon, 27 Jul 2026 15:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B419D1F000E9;
	Mon, 27 Jul 2026 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166561;
	bh=rH0dfJwx6TaUJRP9778eSVp+cuHpBPdxCqvvTxPFEdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VR0PAk25kOTzE8THqAMeXyIQ4iDVWM4cRIM07AXEHoe/7C/k/ktnbEHFIWB8fJeQj
	 VjNd1r5ZFVqeMOoBTDTlUS0MEY4OGSnwJAXzBIEUvMnewMoWOWDHjMULcPcaoSLK2z
	 a7aPaVwplqFn+8mNoq1biGH2vNiSKFWmL/hRwdRp5ZvQmBim74pLuCmuTKHXGiSvPZ
	 sNEcCsoZnPdqbHixGkvHC+yysAjMjqmx2WTTOlNp1Rh401XT3XgyxxE4YCaK4bqBT1
	 3kbMqNHU24jY2NCnD5v0NKGwkjWGgtF99j1vSPP9hJpBZccswonp6S8m7iTYTGNC3R
	 daVrbOWXZhdyg==
Date: Mon, 27 Jul 2026 17:35:58 +0200
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
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
Message-ID: <amd61_Itb8wOTq0H@orome>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7jdk6oml7vjgb7j"
Content-Disposition: inline
In-Reply-To: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
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


--d7jdk6oml7vjgb7j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
MIME-Version: 1.0

On Fri, Jul 24, 2026 at 11:03:54AM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>=20
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--d7jdk6oml7vjgb7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpnet4ACgkQ3SOs138+
s6HboA//b1oIVu6KgMhWD7qHih0fVg+6Q3uvEb6OaReWRKDnD3Nqllw7sGwwDz5D
kcOBUi3cZBA0RzeiEphBBZ9Tp4kHSIi7RRYW3W+RNHqYHHe1tkqUyJwbrKVawxEA
e6CZMYf754GInAjT1QnThDGLTCK2ufz9jo2ljLyBhPkS1kuqJcLHIrXO52LdAvEh
BwCzJDc5lpSVOnsaHh+bx1qUFRgcI5p/LOyfkhhFMGxpT4OnHZMJlZRdKfQti3QZ
Pbk73asqPr5USZXPiPj8RRce9EwuKvq5+UppVu6MHKiP/Kq6jwPAcgVGYBf1+w2n
cKtNv4/xKTEDBwcaZQ2I5VyCsoA4dLGj+q2ZvAvdtjI7xYziBrwRzQSYhZYtMeaK
mSEmRzoZuOjcfajc1Gi4r920wTMcRgSnuLodSVQGxThjnDD7pPZSeP/PiXc+Q7pG
C3z656rLQjarmY1iua5rt57KAwkr4kC0iuoHnGJuj2jcxOINB870xeTmjP15jzKB
KjhvHs/g9wItAZcDYVaeQlN1sWv7doDJNp7U4b8xqB9ZIk29RcHYfdaSlTbxtVuW
CVbxn10yKOVPws4Aq/M7vai+p8nxcSA4MdK6obo8lvcLf3h0s+BFhRkDQ0CEmfIr
bolWFbEuM9bXdBRTMeA1FjyuThd6KZIokWYXTHif5SMV8hrTwf4=
=VEtD
-----END PGP SIGNATURE-----

--d7jdk6oml7vjgb7j--

