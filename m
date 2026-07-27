Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD85AC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pimLA8PXpe/KB2O0/HbQ+QwyvJSF7KITGTCYTL5PK8=; b=24yY6GQm21UfgU0lOjOBq9qQ1A
	lwIibx4MT4KaI7Q7Nbs5yJYrLwszjfwLzX6dxB1l6DQgUbJsnzRsyK7jJiNvo2rwI8FqjvlgQNSYd
	/xltmvon196Y+XWF5lT/dkTmxLGOR7mO43I7MQMxGJZuh7BQO18WHb8/B8LNAYj5oduMZNj+w3M5T
	n3F14lc+s9Yk1maYhYBIDNps+R+8GQXWLepV/5tupd5FpXAc4z40Lxq5lN3HcIIVuCthEwqutTmJz
	Dk4Ljs3q1l9Bt2PTU7Cl8MyHKtANpuaQ5Nn4lr4iQrfHQvmPbV4c8h9s3+nHHSzlun5PtJusRz6tX
	mY1WT5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNMg-00000003BjY-1xV2;
	Mon, 27 Jul 2026 15:35:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNMf-00000003Bj7-04sT;
	Mon, 27 Jul 2026 15:35:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 533674070E;
	Mon, 27 Jul 2026 15:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53C21F000E9;
	Mon, 27 Jul 2026 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166536;
	bh=6pimLA8PXpe/KB2O0/HbQ+QwyvJSF7KITGTCYTL5PK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPGyshABvDxW3Ih+0CYOdp7ZetMFxAj2p4xEAoU4nrm+vWZ44ccOoqz64YO5hUEEG
	 QvHaF3VO65kWPjOh2uqE1OaZIMSaFqAu3K9HnsjbqXYyuqX5n8xaapj4qeHA/5wr+4
	 92YRfeMwxNcWOCMZr921uKVmanLykM2B8wSC+vT45+s6HjCs+MOT/P4ytTm/yhm1nB
	 mBYgbIvIorqVh8Iqh/Z60kRsAA4NObO39857pZVg5SmgqnrOHER9MrVKuDU2FJuO3Y
	 3rt3l1Z/Hni31UcWyk/3RJbV88Q9trPXsexJgI2uyXEDHzVwhEul1+RiSgFf6KyOEI
	 R4zKa6Bw3KdsQ==
Date: Mon, 27 Jul 2026 17:35:33 +0200
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
Subject: Re: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
Message-ID: <amd6vhL9bX0YmjE3@orome>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zq5ldklgurjwxspu"
Content-Disposition: inline
In-Reply-To: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
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


--zq5ldklgurjwxspu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
MIME-Version: 1.0

On Fri, Jul 24, 2026 at 11:03:53AM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>=20
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/qcom/clk-hfpll.c | 4 ++--
>  drivers/clk/qcom/clk-krait.c | 2 +-
>  drivers/clk/qcom/clk-rcg.c   | 4 ++--
>  drivers/clk/qcom/clk-rcg2.c  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--zq5ldklgurjwxspu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpnesUACgkQ3SOs138+
s6EEqxAAlCFaxoVTCA1CfgRp8dzwZafYmIYgEsE0ClMOdVhcykkwkw+zzREQzNWw
zrNc8zItDXLD59chu4jB1t5x3EUCI0fm0ykDZzAvFdWGIam/VRhf+5fFE0LlKMLC
b3C/IFiDNgi4b+iSQYBVAxsPIxXXTiCtua/+8Hfkc049kvL5g+q0Z+snYb6nWRvt
+It5/oxa3V/Gbb02LDDOyoJudwBB2AuMyBWQIgpLly214d7YySjLH75z5RIjzklN
XeD+uB6bfmKllsYQzn8Gg3IXQS0JDQMaAUGWMQV828p5fiDPRZFo/fHXN+2wkLk9
wDdJTU4u6WcZ7s//S/KMekniPws8XtvC2Qf/X0JC5WeZbKW5cPn5KGIZfEjaZfGv
MVVB7C6coPw4pK8S4enaKy+iEvCsbWSTqa9D1Zlj5yo+7X0gghxJ02FFeahPb2pH
QS6xzkZZkIWaihgjvJ93QmV01HmV8YIY5c2gPayBfjHacGtT+VeY4CqQrhpH8q3Q
wR2akmStfmHdp4RUHXCUKHwG3hVi0BOJtFxYjl2yTQPPesgNk7MP8tmObDyK0wRD
3ObUnCOiWqqQV8JbpMo3d9cbrdcnN0S5fTEb7ETSaVVTzwn4YXQpjSPWeiGLQKVE
RxiLGS6vCX5VSLCFMhFxQwB2bcol+N4e+sibrz68qhc99kNk1aU=
=kezw
-----END PGP SIGNATURE-----

--zq5ldklgurjwxspu--

