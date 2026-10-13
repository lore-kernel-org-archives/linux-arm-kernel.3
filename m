Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3249CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJ86ar7ft1Sjd5oHlVMjY4gwK71NzHJf7v8T3vhrJ3o=; b=mwxpKn4eV4vxStgA+FQMz0Yl7p
	ENiXah4mBozhzwg1XiraR7m+O4zeYTGO+O62COSa6qNh2jraVBcYvwPdIfjjDz+a1Tg/igv8pvB9m
	kJdq/W7EJDHVUCH4JHVWkQYmTUl23xvzzlBaO0ARxW5oauHZN6r7XaW9rldT835pogCPrj7FrAzsX
	jKAKzbwCB64IoEYwVgktyTVlCR5RnXVQWk0cWmqoZotlWePBRCOtdCqxpJ6V3S1FThhsgquiwx3ZJ
	6YpQtrnkSjZt1lqwkCUhGkIX44YWC0z065sMG24eYJkkm/d52wv20TiVO791JDNc0G0Y6iwjlklIC
	lKS0S02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGemU-0000000DQR1-3r97;
	Tue, 13 Oct 2026 15:51:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGemR-0000000DQQa-0A9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:51:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D6E4602C3;
	Tue, 13 Oct 2026 15:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230E81F000FF;
	Tue, 13 Oct 2026 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906665;
	bh=MJ86ar7ft1Sjd5oHlVMjY4gwK71NzHJf7v8T3vhrJ3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M7k7sMsxNzFfFxydRPey+N/9CCSkwmN5DyNYLRN5dFgRPYd43mfp0TWbfEdFgtY/w
	 H00/6MvApVWWBqq6LDZx7/+XInjZmbM5zuio3/3YukuSPwX35+4v+bZT4srhksV8Y/
	 8bn1MH/mlIp1/ryVdV5wSZQDhrWJpceSWiOoCDwcWL+D5pwOATLTjZsmlUmRJ4pMfD
	 kLlwAqKnCSGxhK43xZgCQAZ5VYC99wMNctVqXBsraoV+Tk46krOgTi1shEbqCtFfVL
	 Yf1Ycg8KCjLzBo9AnqlKiK7HQ47FXsYThbecmNPzqLxcksT0Py5AI5nA/VimCa4vcF
	 VB7t70b3CeeaA==
Date: Tue, 13 Oct 2026 17:51:03 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
	Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Devyn Liu <liudingyuan@h-partners.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Hu <hanshu@zhaoxin.com>, George Cherian <gcherian@marvell.com>, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
Message-ID: <as5TMuJUE3H7bcFX@orome>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
 <as5S4eXw9_olPYTK@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ta66zshbuz6aaek2"
Content-Disposition: inline
In-Reply-To: <as5S4eXw9_olPYTK@orome>
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


--ta66zshbuz6aaek2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 05:48:58PM +0200, Thierry Reding wrote:
> On Fri, Sep 18, 2026 at 02:01:50PM +0100, Pawel Zalewski wrote:
> > Use a designated initializer for the acpi_device_id fields which makes =
the
> > code more readable and consistent with how lists are initialized in the
> > rest of the kernel code base. Also drop explicitly setting fields to 0
> > where it is redundant.
> >=20
> > Unify the list terminator to have a single space between the brackets a=
nd
> > no trailing comma.
> >=20
> > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> > ---
> >  drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Nevermind, I realized too late that this popped up in my inbox because
of Andi's message saying the patches were applied.

Thierry

--ta66zshbuz6aaek2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOU2cACgkQ3SOs138+
s6EkQg//Q94g8lhAZ9FF1mSkUo8+4iAGe4AwVPaHJcaAsp/d3MMwLNgGHDNCCUTg
G+wEpoEVHWYXoLXJdfApoubX1HNKCyZixOydZMuy/vyjfKK8d24WoUwsrruWKNoC
Qr6q3NbnPuILsnE6wQDTVdRqZ5iJlmJKMwdL9zfnVqM3bLVwpDqLWA7QkJrqsNY+
XJcQw62QQ2bvNUYmnEMs96w/3hFC5bQeQkZcRFHxT5YaZwH7n8XX3hvrMUqPUclG
PWzaf3rRgKJvhonQNuJSHjaSbHTtBt1uuxV/RncTBbTqczCwADWg+huMeyInDKNG
9jZddMF5telzFS0C6Qm320brFB2ZzTRmjHM+2QzdwwnIN48mkmpy3lwdzBDIsd1O
aHW2OyY2zyfp3NG+HeVuBNWw3ctMLcffAk5pdZeVvW15ZaAYUMBFd6xMDS40I4TX
6zJCJz7BRWHyAxLcuIK90E5LgVatIVCJvHGaYnwGPWgGan7CvL3WC+bGGu9u5huD
LdxQ8jbuT81xOMrbWy9h8so1N+3KjZXMnz12Z2TD8mK+BJpgZt52vXOSzmNWB5Jt
O1f8qDoslIrvaisD5tgoXZmn9NhZquYjFl1HqpnHxWpBK4rCW0fzIcMO1vByl8eF
cwD+MtMt4inGeVuyn7CCI4ntQKPY1jGEF0X9EwXGBBfcYoocK/A=
=H7B1
-----END PGP SIGNATURE-----

--ta66zshbuz6aaek2--

