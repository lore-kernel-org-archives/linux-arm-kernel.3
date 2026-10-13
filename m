Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADCACC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HIRM0RG8gr/DXh0YsHOuMrZwiwotXguOVcFJ3C/Z+g=; b=sqYTQR0/rciQyYMSKsMHGTA2LL
	7FEfArlkJZYAUeULS0GWZe97jn8tg8m4BEsmBV5GVzVT/AFy39Y3SuF310NG8kqiAvT2TgB2zf/qQ
	khM7l5Z+EEyUPDuoiAxmYWqGtLAa2eeOXbBecbv1lDBBxCyo672mIK48AnBmP3vLTRhWznSnm9O0q
	8ra+D3RmR34c0QPbWXSLINUqFubm0chhDx1r6w51wYlf4WpdKkltbBw7mYz6P0/qX2SLAayshsJpZ
	DVB3uSeM47n57hw6iNml5+QnEIVaowHV9rzGZyZg8/yB2o/Y+3AvAf1oxmFKhDX6zLOYJtmQJ+UJu
	5tgNm3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGekP-0000000DQ9F-1e4S;
	Tue, 13 Oct 2026 15:49:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGekO-0000000DQ8v-3UiL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:49:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92F2A40811;
	Tue, 13 Oct 2026 15:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B381F000FF;
	Tue, 13 Oct 2026 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906540;
	bh=8HIRM0RG8gr/DXh0YsHOuMrZwiwotXguOVcFJ3C/Z+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbcaSXqUcaVh+Dn4Szez+2sa+s1pn6dxh4rk0zuD2iS8MtxWqlXtsDeQFdf0+ndoN
	 e/DNfTRvn9qFxjEsaqLCCTMDD/EciCocH2iWVubkVKjRrjDeFtkfl4bHHsA9fVSzY2
	 5PmwFn+sUQg6zBbcWR6OfrGEZezUr/RDrg6k9Zk3/Zy0QMcHqh3uzg1+sU+SMZxRYt
	 okNpdlpySaXg9Sp07feU4V5/NVpd6+Y7lfTLm1c6W1XLDwF8W5TWDC8N4VrC5JR/32
	 9jFemyokGfVPK87YKsMrGcqPYVVpQOwv5ubDWtaUKYdhlrgu4gTkUxTQAH+//kM1Lu
	 y9f6egNh+AXDA==
Date: Tue, 13 Oct 2026 17:48:58 +0200
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
Message-ID: <as5S4eXw9_olPYTK@orome>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdaukvpfqy47g5lz"
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
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


--bdaukvpfqy47g5lz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 02:01:50PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>=20
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--bdaukvpfqy47g5lz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUukACgkQ3SOs138+
s6FUgw//WLO80tnSOWkfuTVznJOATqQqtXNIxuY17kM5m1EEoZt1NHMjgBpv4ylb
UVXRSs8cAFNkUsmkCkeMiPaJiPSWLzGuuTJ0sE4E/yH0MMoIDPf8b1RwifvG2sSN
ZGDPA+UWX7NANExmBZdu/Fs06EC5xjQtH23rqXP4Yh79x2ZPSkLP6yWrhrY7y+pW
NZbhO6sZK5RmU+vX8JVgFot2fc5kuCXxXhhZP9nxMeiofepJlKO6pK0CgC2h3lMY
rnaNREXSSruDZU4a+NXJtxkuPsKR4wQGGr3bcYJCyjcVmP4z6uUMLSI0YAT1Rgaq
Y/kgJcAvgVY0JtyL2vUcU8IK+8dfiZT/j16cBPlrdlJcETavrz6C1/ySJsl14wmu
o/y6FcKOZHXvLhPA4za1bQU5O8b7UZtP1MyvClac1rSzfL3V/9bb8+evmlWV944X
aesOgjT5EptZyVYamUKXsFYP/XRUgMXykA1QChwVOtfFS4yOXc6k5TC/HbjY8dsq
/7v+zkFiG0oI63U1dGMWWyCSjykdZaS4KyXLzFHptkgUCjj34C76CmENPztxCA+E
M9m2Bac9gmYqgnyPE2QxC8l+s+nl6B+RA3Ajiuve2HQ6ZM8I9AJNKFGfR1kKu5Gf
5CvbCSpmxrZzyS/Bt0DlUt1ZtYkHBF055ZwQtlBWs4AAAFsvcVA=
=wgwe
-----END PGP SIGNATURE-----

--bdaukvpfqy47g5lz--

