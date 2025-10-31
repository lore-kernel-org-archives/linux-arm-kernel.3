Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A455ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yrm5olPCZv+MKZt1QBiFa4Kqvhr/2YybfwLySCaXxMc=; b=OlWWn9dw02Ax5hD3Hy2icxwKMq
	waCpCC/CtceNhmBojjp4s9mKVD/bQZ7v8VkJa3xCSoj2W97TmsyTgkYQtmvhfbK7Ot19+Kbx9zPKZ
	tOJV0MTWGp1Go3vhhkyRNZP26D/usi75iMeUrCl+fRjxB7GTPmfeovpBC002uJNkAW+5ApXvy3LwH
	wXTUw0VpxSdso780bAWvDskY8CG/ujVpDJPRr3N0b0W/y0WExOQ5WPl2cWzM3BM9MwXk82MR6CJE5
	oN9tyON6JRCAN0eaVXyI4luTkIIx85hr/rJp74i7QharWhQ1afRM+4SZbmSbYHpoI+vgxZQYTSoby
	VSa1HN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqFj-00000006FP9-0tl7;
	Fri, 31 Oct 2025 14:37:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqFi-00000006FOx-0IrM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 174A1603B0;
	Fri, 31 Oct 2025 14:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3FDC4CEE7;
	Fri, 31 Oct 2025 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761921436;
	bh=Yrm5olPCZv+MKZt1QBiFa4Kqvhr/2YybfwLySCaXxMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N50Vm5tQrO0PZCXBrwnFaZD4cz5xOyC5R5i0oU9Ke+NrJenx0xBHU4sGw4xF/oQ0V
	 7q+wNYoe8pObjsuBpItN1xA8PZvYkRQode6g4lVOkvZpNMUD2b7h7wzmF9OFqyANUu
	 Vt7J4iRtKeYzG/eVh/BxBiOYBZhTYO3ofWAmg5ac9sg8WoMbFuZugDPK4pmYHm3IAL
	 RwnQm2l/y83hw4AYKudWmWlzG66QqXUofiycqiU6WUw0asFZjocqJAG7HmMX0OCn/E
	 tfXj7rWMdkTqLKwfm/ybVQ7btG0MSSh0/1yv+eMgc2q5dD3cC/qRq4GSyqEUJ0TnV9
	 rk6NybrcSS5Aw==
Date: Fri, 31 Oct 2025 14:37:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"open list:GENERIC PM DOMAINS" <linux-pm@vger.kernel.org>
Subject: Re: RPi 4 deferred probe timeout of V3D PM domain
Message-ID: <77bbe008-427b-4491-a191-15be5e40e708@sirena.org.uk>
References: <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
 <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
 <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
 <d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
 <d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
 <CGME20251030191426eucas1p29ce063b538b60e4a998bcd32f925267c@eucas1p2.samsung.com>
 <043f1702-52fc-4a83-82f7-683a26851623@gmx.net>
 <b02c8890-4568-4afe-8628-10b77e79bf44@samsung.com>
 <3c171b6b-f8f5-4192-a3a3-da453a900316@sirena.org.uk>
 <aff4e3de-6dde-475b-9df0-3d7d6ad5d740@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X5uYBAMfzR7WDf5d"
Content-Disposition: inline
In-Reply-To: <aff4e3de-6dde-475b-9df0-3d7d6ad5d740@samsung.com>
X-Cookie: Byte your tongue.
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


--X5uYBAMfzR7WDf5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 02:54:15PM +0100, Marek Szyprowski wrote:
> On 31.10.2025 13:39, Mark Brown wrote:

> > Or the GPU driver should be moved to a module to match the clock.

> V3D already is being built as a module in ARM64's defconfig. The problem=
=20
> is in CONFIG_BCM2835_POWER driver (defaults to 'y'), which depends on=20
> resources provided by CONFIG_CLK_RASPBERRYPI (defaults to 'm'). IMHO=20
> both of them should be built-in and this will solve this issue.

Ah, yes so it is - I agree.

--X5uYBAMfzR7WDf5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkEyZIACgkQJNaLcl1U
h9A1Ugf/YzkqFyXsikEGtRnC21evm/sbuTehV9VfpTcKzm0S41+hb2KBsArFjUSf
6UPvt2hTKFZQGhrslYCm8/K9WCog41Ai+anzrlCtPxYZ0oJ1nImyB0DEPdLnZFbS
0ykvMWQQwRaCJbPaKL1ryv8IxfRYW1O+hDxzZQ+g4qRBN9IRsE7nVcLFdQjZPvBU
dCvpe57Id+Nd1M/wNaO46emy4juCYxdyH2kotwW2k2l/p7bYLEZS5f1YqhQfhrTI
0YA5577P19tieAncVpJM+YkWOWTz8A5kQCnJYWNIkYKesimePHek9jNN7IsNYMj4
SHkVuRoe+e9kJs0Pa2UyDL9ZLSBssg==
=h+x7
-----END PGP SIGNATURE-----

--X5uYBAMfzR7WDf5d--

