Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D654FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1J/RESx0avW+Fd/6bVNs8OltfDhTdNo7aLUSFszu68=; b=k61IN3tA+1SVGae+aJkFXtMBhR
	/bjQJgBaJce5BgLIlwh/3FAXCAsuBz9yo2WTt3j55hbE5ggw7KUWpOHSWEmsI0pLbLqJ+HVhsdSFZ
	DBVrJL3O1AurUhEDr72dEUEDys6V10C/s6tRD3/3utaP1TE0AgevYG+a/6TJSKxFv0Q1kvwg15BCL
	GC2W/Is28zB4AmpanudSPxXIN+lln++FEtCCgBP5vLmVedBYT7eRUt0vIzdd++6l1BcOsXI2gIpGN
	UApL+1Z4UCdkCaIXunyM59KEmxSdBerB/ji7/QFTy811pPgKWtU141Sj7F9CIG5uqk/tM6+Ou5vS5
	Dz6d84rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNOo-00000003CUJ-424M;
	Mon, 27 Jul 2026 15:37:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNOn-00000003CTd-1b1N;
	Mon, 27 Jul 2026 15:37:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25B52436A9;
	Mon, 27 Jul 2026 15:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773A11F000E9;
	Mon, 27 Jul 2026 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166669;
	bh=R1J/RESx0avW+Fd/6bVNs8OltfDhTdNo7aLUSFszu68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=haCgqshVbgUxU1ZFuCRavAnmnbOcSUp/gP+r3uOztDMXsFX7RWjVGyZ9XIaFPz6QR
	 gvVNYalcT8mf4dmo4Jwoiaun6tXYQQ+l/qbg84khZ+KXP2GqU5l/PB4TeBg3+G2G3+
	 wnm1jkkC/iO/LpM7E/+a3f2Up23ewmM86r7sl54PI1YUBFnPKXj8m4PKUU2ayKq9C/
	 q1WSeRfCuB3F8xUmaW3wNbjUj5Ivkq2iLU+JG4rQwpus3R5S7q54uIbBB1KkxcaoeV
	 7pMpiIQR2Gtar58vxRL4XC/OuVgBtaCoWaInz4huvaW380WLfCICQRkWgFYndg3YBp
	 hOTPMEkHFWINQ==
Date: Mon, 27 Jul 2026 17:37:46 +0200
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
Subject: Re: [PATCH v2 6/7] clk: tegra: clean-up simple provider misuse of
 the consumer API
Message-ID: <amd7QR0IGwYXwuN6@orome>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-6-56f306156d25@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpcm6taaw3amtboj"
Content-Disposition: inline
In-Reply-To: <20260724-clk-provider-simple-clean-v2-6-56f306156d25@baylibre.com>
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


--lpcm6taaw3amtboj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/7] clk: tegra: clean-up simple provider misuse of
 the consumer API
MIME-Version: 1.0

On Fri, Jul 24, 2026 at 11:03:57AM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>=20
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--lpcm6taaw3amtboj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpne0oACgkQ3SOs138+
s6Hdng/+MMPWOkElyufdJQ/sD2uXGLUU0LCHitJ49eyaTRGzy+NEXHeVGJYyJUYb
fdCKCwV4OhqpdvA5Oy1jUyNkdPmuNQE2o+v8mCH8waFwhBJCDwI9/t7u22GjMZX7
11EWqVlA3sU6oSaUzjada2rm8lagt8gft5MSiMSggs9XfvCjZxkDoqsURqOHxzzD
zyHODFRd3k4ZBqx6Qnco1QUjE+KYCwXt2Fq6LdwdISgpAcAKp0nfP4nUhKgIhBB1
hCrYstVYtqFWMt5wABAu79HXvsLia73SoJzl1FlS5rJj4K47Wgtxl/C5Pt4K/mTd
iAWKSO1VFC+7w5R8eCgzIjsl+WbbSSbWN+PsTn6aVTObZkv/6UCOPM5LcJPgQgDA
qJ4jrmRknp6KGf1aW4O1ZPCm+HMW72o9Q8lC/9zePOenO7OxKsZ7mmE6uHxCw/dK
FFmR/ptCtXPCLb8HXW0XlzS2sQCKsuHg2enmKdI/w9+iea58I2XxtQGMjfkOx6Vd
FiCkJSSlwhWNj3/7Zlu814b04umPJr4VrvucaKODusIKPezBZEZowVNz+gXqHp2v
8/GPPH1YFFLixOOMyxL7ilSipgTV1MPIx7j4anAPY3Opz64jnyncvOFGUl+kcSeA
+7twxZLAPEBAJBNdjvmav0utaqIwiE4zzzmTcjWzlN2CpKRWe0w=
=aWGl
-----END PGP SIGNATURE-----

--lpcm6taaw3amtboj--

