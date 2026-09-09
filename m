Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00448C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hlzJNzei2knOn1RYcaTNkb4UoqZbwgVsH5KNit1MHs=; b=I1aOgS8KM2Ca4cSrZtDuLu5K2N
	xkk6hadbRw9vbC4Tl3tBIsx4t3QaBYs0vuhACkLzvK6jUWuXYGdatsBW5LFue0jsLoViF5/M5zMHP
	YmoX5Cp2VnFaOtfq1PD194OmRfylb0dVYXJ9dcP0Gl3+yrWk5sH8yQBTfV0MZdzNHKm8El7g3+Ax8
	eYk3J/pRjw707aX5mJKQY8Twppqk2QW85zjVeu9Vhj9wCFD5QxGkYLZthU6MsH9WUsHWxRA2ABIDI
	iZNz6g5/USex5Zx00qP9307XVrzB96wZrP24S6e6fgKsADwTdyabPGtfsQs5WeWhpcHHbr2C7tS0I
	nmxfd2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ILQ-0000000Bnce-3HXu;
	Wed, 09 Sep 2026 13:28:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ILP-0000000BncO-3GDJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:28:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1193D60216;
	Wed,  9 Sep 2026 13:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C301F00A3A;
	Wed,  9 Sep 2026 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788960486;
	bh=/hlzJNzei2knOn1RYcaTNkb4UoqZbwgVsH5KNit1MHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eR5D3nm1CPgbjmHPZ0Vv7T4vdNRF/43OgybS94gl2A9fsyrl4gGmKe6vwaT3jfTzX
	 +jD4I9IGrYtGuGXb5/A7jnHJvsDKGHllhymRTLq9kCq/SQi87n+n9y8sD4xk8HYc4W
	 1FMZTsqHXMX6M3yTH47nD27tyCXLTKlR5oFEGKYxbRLJ27lUqEnoIOljlrumgyldGk
	 vQ0EiMkovKU1SvLxEK2ji2FQp/hgc7rRh1M5u3fknsEg1fK7g7esz94rpEqvklnBCa
	 BYmZFTXxMbawW0CHZITqBgDveaise1uxWGeZVkrhXq8mgPMzdHFvBAlr06emaY0HNc
	 eC2FsYwPx3u3A==
Date: Wed, 9 Sep 2026 14:27:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: [PATCH 04/14] mfd: remove unused wm8400 driver
Message-ID: <76d70b0a-a3c1-4051-84c9-77afb715c4a8@sirena.org.uk>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E7vTznbJl/k8Ppdd"
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-5-arnd@kernel.org>
X-Cookie: Postage will be paid by addressee.
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


--E7vTznbJl/k8Ppdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 03:21:41PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This driver requires a platform_data definition, which does not exist
> in the kernel.
>=20
> According to Mark Brown, the hardware supported by this driver was never
> shipped in production.

Acked-by: Mark Brown <broonie@kernel.org>

--E7vTznbJl/k8Ppdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhXtwACgkQJNaLcl1U
h9DKkgf/RLbTE5UB6RL3Q66U8VBY9ivEji//LxLXmZDVRMWW85M/tZkuimYXhr1H
qRZzWzsDpkIZhMa5DFLZxJGgVhSyRq9lmv40QYt8TboWu0+dKRy4nuB95+RSTNWh
fjmkSjHkD/A3ELOP2Q/9B/cCFXsbGXHwS8eXeJVkuaDa1BSP3E7o1l338kofZy5F
KyFWqJgxYKL/U82xSTvj04+NKj++SorlCIGShW9hgF11hhNTRHMwW8uF2pksnopN
W8URlMgbSAEsELUabpsbzCFqwtnOJZU2y2vWAICyNt491Nctuj5oUx6D3c0HFsnZ
z8z8A5SciRK3sUB/+Uh4thfPneAMHA==
=lTKT
-----END PGP SIGNATURE-----

--E7vTznbJl/k8Ppdd--

