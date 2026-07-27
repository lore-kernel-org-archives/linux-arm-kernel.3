Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A68C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klO53puD5NrabNv6m54OJeAQmMgu1fEnyntD/bbDp2A=; b=tYf1Pq2jyTuN/k3cIUArwiKZpo
	2wFZFZmN2XIAxIWaabi9o3lmqELPtBAQVpGp7JvUouMa49OSuDJf0Z9hxkqTs2OQpRhKEmp304L13
	DKYfpxsEqtOtBvgvkyfeilcFGBuGgD/RO8T0f7kttRP4IPR8l7qmHWigtcPDndLthOfM0M+avwioi
	mRnpdtLE9SDtP6M8422bvDNN4WXlAs1e8xJBonS2uJXN34ygaYK+CIEDdVKLgKooNvVJQlw/VndUM
	38o9EKrMh6PMwJ1gm5Gw894Rf7lbyQYgHan11m+B0lzofGdoyyb3IPBar9Lqw7SRcbYAaA0Yjyl9B
	RseO32Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNOW-00000003CLq-2WXV;
	Mon, 27 Jul 2026 15:37:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNOV-00000003CLO-1oa4;
	Mon, 27 Jul 2026 15:37:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C571660008;
	Mon, 27 Jul 2026 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFEB1F000E9;
	Mon, 27 Jul 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166650;
	bh=klO53puD5NrabNv6m54OJeAQmMgu1fEnyntD/bbDp2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QTRduarjBINEjNCTHYzdt+uzf2InnWa+Tvtj6OVfVlItRjitkODqtYLYwm8hVZcP0
	 rBJqwYGZ87Sdfd0PqEqM8qTTLqNP5ipQ9BYi3BqWDrhCFDBHCId0APNjcPmoXjYIY9
	 6OwAi/yl8qAmkJ5GR419G86sTKFJnDC/LmIZjHFzDXe7GN8N4Mbmw+ht2NzM86YnuT
	 +PYV5PzWPmdLLG98bTvXMCMgJFDlDbOM/owQKngIoE6ysunVrwTG6sV9pj29wGGR/K
	 BqO5EFwTaJ2WxhJ4vNZIlyEt5dVWkEgbQnzzKjN4DJR0i8ezLj0kcy0JXuYgSpOfmW
	 nvxKL8YfNWY4A==
Date: Mon, 27 Jul 2026 17:37:28 +0200
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
Subject: Re: [PATCH v2 5/7] clk: st: clean-up simple provider misuse of the
 consumer API
Message-ID: <amd7MPUztiwFv-LC@orome>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-5-56f306156d25@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcdjwua2gpwoo5z7"
Content-Disposition: inline
In-Reply-To: <20260724-clk-provider-simple-clean-v2-5-56f306156d25@baylibre.com>
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


--pcdjwua2gpwoo5z7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/7] clk: st: clean-up simple provider misuse of the
 consumer API
MIME-Version: 1.0

On Fri, Jul 24, 2026 at 11:03:56AM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>=20
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/st/clkgen-pll.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--pcdjwua2gpwoo5z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpnezcACgkQ3SOs138+
s6HsZQ/+LvB4jTxDrUCsLxlcfpOR2jSnZ7ksqLoOTN2khBxKv458+/ll4tskMIkb
sqjSbWWmhJUsgxJlcxT0YUYtrzAIYW2vindM+Qpmtbbel/zeSqQqMCAjYS1E/CF4
Cb1bsos8jD5VECJHRmvidSX9NOHxqY2C7YncrVaorAwHRjYDZYvVGS4insZ2ZRuZ
+nDMRwl6T85AAAnws+tTJxqFzA9x2xxs4AuRyT8mdcrbJ3naftwbOhCynbamSmK1
OliDoEHNeX9a+RcySySbTWVE76dGtJ/7oBXt5y8I/DcoAFyO3sKvVaefvJe8QgHO
wsbnrS+azLWghtUj6tYEjI8AxZk7jH81ywzHhzU6Gmzt19qtUSFY4gFUepf1o4Jt
BOdR9UW2WWqrtf+7ol5QMGSIeoWA4mDBo1NQ570UdRDQ3fPN2buc2nwY7AxzEP9O
QOksTDoZ0XcT9LLPHiwZdJk3KwRJRkoyMQfg7h0I7leDQEqyciRRjBCkZVrR8tel
+TRYfhhSjhbz52BIg6+30i8iI1whVsla0IPP9cu3rgkjcSx057RAfDgfZxXMtQl8
XUKiofLK67yQ/JvWrk4YE1PtOJFttjzeLR3nkgNrzhd0TKIYgEyz/5osP8CLrejl
zpwGOyT2m/F0ixCLQxcbPRn98rEXI+vRr1AhPshhdDVI1CrqJkk=
=gZ4y
-----END PGP SIGNATURE-----

--pcdjwua2gpwoo5z7--

