Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A29FC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC7c2L3dN5H0a7ZvdygvQjadKOhqw131ufK/tKt+pGw=; b=I2J8Q3joNDGQF3SiuOaxP7MOEc
	f75avURlHPs6ApGfwuuuA4SkiHm4IgKgdez/7uD+uUvN+Y2wcm5Rnfe3/0VycCFXek3ZmhvQhAnSk
	qiFUhVjc5907YZ3+KiqYB8rtJb8DqEf2lyEl4lCENwfAPZ1QjR+t7jOsUzcm2XkMzJoaqzN3wZVb6
	KmmJ5Ubmid7nhCUY4+U6Vre0aG1w7IVAI1Hey1z+BDKyAwRfxt5upFROTzEHBqwFSzsFNJGUumCKq
	Dyo54khlKTDj8L+i6jhKYWIBKCWwWpOc9tLBjtSgmD54TX7kT6j6XqajxdLtxLfkssUiiHZf57HBq
	b17DnaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KVy-0000000CDid-37Oj;
	Wed, 09 Sep 2026 15:47:10 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KVw-0000000CDhc-1Ev3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788968814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NWqgUnlz0EJenbR7p3bRr4RvkCXiCRDswiSpFYPAvo9Cjd9e1kSoAikD0GySgLPcoSO32UtWIt8V9ElghsTOYwQPSS0GfyxsOJzpnEwUporMCFkd1ndf94/W4biYMSoTaYbCAuJ12I9F3OQ67uiEziSz/NLnHTpWjeQUsS8W/Do=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788968814; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mC7c2L3dN5H0a7ZvdygvQjadKOhqw131ufK/tKt+pGw=; 
	b=B+E0uIUaCMIUHKyrUWF+vLY3+2VUY4Je9VmBddMlEPp749RaHeM2vFlAqcfYpTvU7ghNgnIOx6NqL15sCnmFS9y3X2NwT8d0hblRgfD5DtGWEeBbMui3TW1hG1+wM52SSzIMV+SXj1BrC4ZtZ6/w2Ze5RGCr6PcRnhWdObBwq08=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788968814;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=mC7c2L3dN5H0a7ZvdygvQjadKOhqw131ufK/tKt+pGw=;
	b=B/HFwGAa4B+Qi3K+W3Qx9RDREu/HLUljdqWnRLBu5svwvc2Xad+FYf0EpjLXcMpr
	dtMP2sXFc05p5OkFCN3/vZliMeu0l0LyRRU4KMDkFEWNBCl0GrPs12ikWwqCYGdZ/Bv
	f1xLkPk+G36FSGFsSQNRETx0rzToIzuTy74Ku6as=
Received: by mx.zohomail.com with SMTPS id 1788968813674960.6791693136165;
	Wed, 9 Sep 2026 08:46:53 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3C29D183377; Wed, 09 Sep 2026 17:46:45 +0200 (CEST)
Date: Wed, 9 Sep 2026 17:46:45 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, Support Opensource <support.opensource@diasemi.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 07/14] mfd: remove unused lp8788 driver
Message-ID: <aqF_T3c4ZJmUPbyG@venus>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iscqnuh5vut2lbrn"
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-8-arnd@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.959.6
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_084708_363266_E7E4217B 
X-CRM114-Status: GOOD (  16.91  )
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


--iscqnuh5vut2lbrn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/14] mfd: remove unused lp8788 driver
MIME-Version: 1.0

Hi,

On Wed, Sep 09, 2026 at 03:21:44PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This driver was apparently never used upstream, and without devicetree
> support cannot be used by external board support.
>=20
> The MAINTAINER entry was already removed in 2021 as the email address
> bounced.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iio/adc/Kconfig               |   9 -
>  drivers/iio/adc/Makefile              |   1 -
>  drivers/iio/adc/lp8788_adc.c          | 219 --------
>  drivers/leds/Kconfig                  |   7 -
>  drivers/leds/Makefile                 |   1 -
>  drivers/leds/leds-lp8788.c            | 171 ------
>  drivers/mfd/Kconfig                   |  10 -
>  drivers/mfd/Makefile                  |   1 -
>  drivers/mfd/lp8788-irq.c              | 194 -------
>  drivers/mfd/lp8788.c                  | 246 ---------
>  drivers/power/supply/Kconfig          |   8 -
>  drivers/power/supply/Makefile         |   1 -
>  drivers/power/supply/lp8788-charger.c | 730 --------------------------
>  drivers/regulator/Kconfig             |   6 -
>  drivers/regulator/Makefile            |   2 -
>  drivers/regulator/lp8788-buck.c       | 541 -------------------
>  drivers/regulator/lp8788-ldo.c        | 640 ----------------------
>  drivers/rtc/Kconfig                   |   6 -
>  drivers/rtc/rtc-lp8788.c              | 322 ------------
>  drivers/video/backlight/Kconfig       |   6 -
>  drivers/video/backlight/Makefile      |   1 -
>  drivers/video/backlight/lp8788_bl.c   | 190 -------
>  include/linux/mfd/lp8788-isink.h      |  48 --
>  include/linux/mfd/lp8788.h            | 289 ----------
>  24 files changed, 3649 deletions(-)
>  delete mode 100644 drivers/iio/adc/lp8788_adc.c
>  delete mode 100644 drivers/leds/leds-lp8788.c
>  delete mode 100644 drivers/mfd/lp8788-irq.c
>  delete mode 100644 drivers/mfd/lp8788.c
>  delete mode 100644 drivers/power/supply/lp8788-charger.c
>  delete mode 100644 drivers/regulator/lp8788-buck.c
>  delete mode 100644 drivers/regulator/lp8788-ldo.c
>  delete mode 100644 drivers/rtc/rtc-lp8788.c
>  delete mode 100644 drivers/video/backlight/lp8788_bl.c
>  delete mode 100644 include/linux/mfd/lp8788-isink.h
>  delete mode 100644 include/linux/mfd/lp8788.h

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--iscqnuh5vut2lbrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqhf2QACgkQ2O7X88g7
+poZ9A/+KshNLxDrI9GkDnWKmPjCwdFkL8/mQnJmXIzcsdBWTseNvn0kj7cdkjOM
5PyqqzFm4keht6lvH/wk6rWjzcrdlC5R7AkpfQiDjGEjdo4CEavTNOhCh9OzkmT/
GAHUxL8dojKtkLaZTMu8mui/oBgD8P+C9sGAV9GMrk5PELZqW0GoaFK1Dk01EElj
RHivtoCATAon2jchkAyAaHdTZbXT4JRR4BIm9XHWdmYp4/+x2JH4Dl4dwrD/ej78
wTevj+w+M7Nxlif2J9BofvzsTVH1rSpFp/R9nIXBG0oA0l7LG1rVU4IIQkKHLEbE
XB03NcG+VC/mh3xvoKgLB4PkA23jiQkqVrPGYM/X4yEfOCf4rXc/CFMnLmCtwPoW
e61B7t8S3McXX+SUYwFtvXm3tsGVqajRNxGyID9vFAIxa5tYR3bftDDQMuzPZHcG
BSAQaoBErv5tVmy6EidZ3qroVpQN9zPmFKGHxjivWP+41/EGJ0Rp99H5qa7fzSsg
7h3QPSLGuJNI5n8poeicI3/x081TxvdgMAiAkzzl+ho65GsDQEcDbc8vvMZgLwSp
yu9SDtfrXk+yr5YOt/IIzTy9it95XyjBUEUhgNxXDCOZewp9pnn1S9+4daKmVICV
raNAJNyg5gC+IZwmT8YNayI3BoFdY95sHJOSUVpQcHNXQve+7mg=
=SAgI
-----END PGP SIGNATURE-----

--iscqnuh5vut2lbrn--

