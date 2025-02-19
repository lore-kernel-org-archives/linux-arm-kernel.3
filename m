Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C622C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9YlWf0udibHi5PYSeWM2mVi7/K2aWeL2dI07eP9SBw=; b=Z2uhiCLBO/oYg4XT9yAOxEy5zr
	i2dRTEsp1g+UwbqtwdgX+s5TnBlquluzNorwEmVyDi9izsalcvjrPomszAvmSomUFRCUkHzFB5NRr
	gfOYXWnkyCpnkLdLI7oPoDse/pzvnaATzrTcph788fP7iGP7lKtMdeh2dbnsQa6nUXCayGwU+ArcZ
	s0Vp7Lj0pPmVUM7Ns+bnj9JkOrr3JYaFtdBDIjaLNJ8n0UEQsWTypgGusBCmIOhnHgGwTWlJdnPna
	DkpPtO0YLati8MrFRv/ZfF4nmu2RjeOVl+lez7qBjmGxs9J4XK46UC6ZVrC3owwsvBFxGR9HRKIi8
	pbgDyv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjM5-0000000CiVw-1fiY;
	Wed, 19 Feb 2025 12:39:09 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjEd-0000000Cg0x-3Cek
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:31:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5462ea9691cso1111584e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968286; x=1740573086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9YlWf0udibHi5PYSeWM2mVi7/K2aWeL2dI07eP9SBw=;
        b=UT1EkYgh1TUHpT0VQFQPx9gbbhPuG+YttfWfR+d42HQIKOOntBgZZz6mDOEuRwFzKO
         4yX7ee5jpOVVCCwSsylM9P0d1/ycF28D/C/dCzxJdHJVuIy+1ClczyDZaUf5eLWnI0yW
         HqMPekAFYqkGIoYObj+4HD4o4AtX1OlUqJoTu+b8ErLcKRweC9OaoxEnhcWGj7SPBMJa
         y3Bw19DmKN2jsh7FNZW6TlJGB8qUflyw8WNAAleGbA3dypfToMEmCM+L0SErTaoYZA/x
         riCVSIQChUIM0aLTkL7dlKKd14QyLgLq+AiAavSutYQpd/dlxT6OQ4eUCVT8Yu1uPMAj
         pdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968286; x=1740573086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9YlWf0udibHi5PYSeWM2mVi7/K2aWeL2dI07eP9SBw=;
        b=kcd68sqGXyc6NR5J/vFCmBKbXVvM4CYJ7Gn5xkOxScTdh7vhLFKysccw0uq+4ufHX2
         qnh6320v1aLZd2eeVpZHvY5z4rec50LnVUkcY4XNcWoERmmMoOwP3/3MvqCx4TQba1jK
         OlDRSjj8XNGxEM/nWVZ7b7R/PqeRiAzf1rSSFyW/PaBXn8LN6+gf7hgVekdd5xPh2nz7
         wB3kckvoS5/2R6x5hRdL4e7vYPy44vIeXN2RV4WM05nZ41MAxgCbvafcWZqAymP1ssib
         LQp/QHcadjhcabL5niArJPf2M/GCqPmnPQUnInF8esZUlHDi4ONBkZy6HNVEjNBsAij8
         4Bdw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+fblI73FGad5+P0BaAd0uzq1saKEIGnrad10D7lMwKpZohL1/1Jr3lY9S6J9BYW9mBJTWpDogCDGamuOw5zw@lists.infradead.org
X-Gm-Message-State: AOJu0YwIFrDf/GtOj4aOrI9LyvodRKvFmane5J3/iaEBLf+3oeSIA2Mf
	MJ4L4/NHBlaN1vOcFX2uhOdlim8CyTcNs5LYtYT8BeG6fW7FrRAs
X-Gm-Gg: ASbGnctAzGtQY2ZSc3nCyCDc/J2txZDcN4fdVN3qvUgHZeaOn6/aJXKfSHTMrMDBLGU
	O9JzZ5q4LS39KVl/Vogl5ALJzwl6AWgDUZ8nGlup7SFU8KNBt/jAR5tPPGvYcfbOIG42qWxcdbz
	38W/qYpHgiRLoDWqTWTBoyZVrq9QM9tPWRuvk5OqPMmzNOgnvN/qabd8gwPRmxtG/+fYyj1NmSu
	0OSefIpbyQMuyza21vu38vbncAZLirOk83iTeXZhP/XH5flQq7vo/D5r9a7sUqDihhVO70SHubq
	B9GzhtYULGgkCQ/K2Fykww==
X-Google-Smtp-Source: AGHT+IECGLbBg8/Gfg56YN71xZxnO3b9XbM0HqSAvG6g7x6DJxq2h38ifv+YIKS+tWOSHyQD921kRg==
X-Received: by 2002:a05:6512:131a:b0:545:cc2:accd with SMTP id 2adb3069b0e04-5462eee4789mr1463016e87.20.1739968285827;
        Wed, 19 Feb 2025 04:31:25 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f08332bsm2121536e87.48.2025.02.19.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:24 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:20 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 5/9] MAINTAINERS: Add ROHM BD79124 ADC/GPO
Message-ID: <33dd64a9f43ded7809e9d96de81c975cf9d68a5c.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cgogUbgcoimvAkuI"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043127_834953_DBDB1F0E 
X-CRM114-Status: GOOD (  12.68  )
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


--cgogUbgcoimvAkuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the ROHM BD79124 ADC/GPO driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - Drop MFD and pinmux drivers
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfe2f53fa74d..2021327e665e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20299,6 +20299,11 @@ S:	Supported
 F:	drivers/power/supply/bd99954-charger.c
 F:	drivers/power/supply/bd99954-charger.h
=20
+ROHM BD79124 ADC / GPO IC
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+S:	Supported
+F:	drivers/iio/adc/rohm-bd79124.c
+
 ROHM BH1745 COLOUR SENSOR
 M:	Mudit Sharma <muditsharma.info@gmail.com>
 L:	linux-iio@vger.kernel.org
--=20
2.48.1


--cgogUbgcoimvAkuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zxgACgkQeFA3/03a
ocULuAgAjZavIzHTPjKXGVeBG0YHgO77wmABK9DsiC/qVjVCqjKymrPlKSOoz6De
5KuSLf6blVfl4g3VNLi+25yKc4rOctFr5iyTV5pWFzIhidkV55fw3PMIYnYL/foR
+iRaRpl8okONUYuxsiSQLZe2IRTrforggRQXW5JGu+PLTzlEgcZ4Gw5t1bDijmFC
3jNohUynNb8Iw/5w2Hnj0mqL+Z18jb1hZoJF9M2Ns/mPwQonGf0yi6Q+4kNzp86y
YE4yqyf/e+fzMC7Q7hUzGvRonL2iulD5a5D7XR630YImkpeMwLEM0DZGqYAO7qTT
252ljGVsQsIiefcFr0UagxfopFPVuQ==
=V7e1
-----END PGP SIGNATURE-----

--cgogUbgcoimvAkuI--

