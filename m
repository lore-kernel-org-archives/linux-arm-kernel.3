Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9pWdndVU9dqNCdt5yutM0V93eSHB5go/aiJnsWq1dU=; b=rXgxUkl8CmmO6rHxouy/cqu4WL
	wB1QiGcLaNhth3g5Sy5CQtK1DUsYlLzVnPQfEwlwjZtUEuhBW5MI3lPkboHBLn6cepgbpfBOSrWN2
	7RX7lYunkQ8kEw6/2nxiVgo+AkvFGwwM0j+iODv5GXEDfF759uM9IXCk3tw0vakcRVH7i5M30HZbv
	MgEJan4WK1OQrfp+K3ALQy8kJzmjhybYhzFWgcgYUAo0IY2spG4Hg4TR2ZuGEx/EpuiPF81qGuei0
	+O/iGNDugZeOgM7ni50Jpo3Zn+zZo3+JYdjtdy3qx+dZ2xYPk5+wlB3EUFrP3SLveyqt2byeSBAt0
	Km3WndMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twegm-00000002mqZ-2Qb7;
	Mon, 24 Mar 2025 10:05:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twecc-00000002m4n-49Hz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:01:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2180810f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742810489; x=1743415289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9pWdndVU9dqNCdt5yutM0V93eSHB5go/aiJnsWq1dU=;
        b=ybM2dVNXT0q1xrwBiKIDfb0pGvaMj9JxQVwFELotTN8gcewb+9ykpqpgA0j4q5xm/i
         jP4n/9Of5GzuCB+2BLqt2fNL59h5xrUrw6fJdSoiHqm5kixYrg5oPFcS/hpoMXpsLoC8
         Ee9sB+bswPxAjT87eFmz8FN+pF2lNbDmPKGYMSZA/2Yyk0NZfvISoabBVLov5rKq6rLP
         iC6b5OpdwLVF+cJarzDLCPBOybHT83T9lo/CJN6sZLo1dQULe2tjFJmxGBQg7McAjZzM
         O0/AXwTAjBIOUHBG8b+KPoHRTIef7jb0+MZ1xUe3gipTjNmYwqv+p0T/+cBggFmaplaM
         CLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810489; x=1743415289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9pWdndVU9dqNCdt5yutM0V93eSHB5go/aiJnsWq1dU=;
        b=j6LG+VEk603Ag75TkSdLXl7NP+7ctSyGbg1CY/q4ZLw3UHeWZ5JWAuWJCvc/ay4FnW
         Jf5aGUYCu4GEiXI+in/mZHwlDHRg5GR+UsYZz/Z9/3q3U+RabpmUkYI67RJwwNLasGwr
         x0r4aUPdTHFB6AyNqB1jaZQgle5FE7vOcqzoPieWAV4p93NW9U1iTvqiRnvmGaKFIXY1
         BtISqNbTUNY084ORV7YSh1zQZ9TDJ2ArhmY4I+7KPycREwglmgwoDQ4CrbturJsl6SW8
         Pzm1axXWMvH1rNHJrvNcV5jJZbAuPh7yOrsyv91HbfNgzlKanZajsxTEFumdn2OSitfq
         mQGg==
X-Forwarded-Encrypted: i=1; AJvYcCUyjRr8k0UdHo6YOXISrTDH6fBJPfusKNRX7j6GC/C52U3m48RnKVVi+cBfrTZUf96ianxPzJBHHiKV6hXQoVYD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy66V/QKfPv/JgrsToirzQWd+4SvASUvvUNyyqSzIirlREz9R+h
	GeK1rufP4xZ71krTsbgZqJxnTgvNJX7DbrGSsXqEUq3xFEYocEiL2qefm2bqYmI=
X-Gm-Gg: ASbGncuqSHJfkWIv1RNHbrfWP5RIRuu+rOmxC87pFyz2D4QeUsAQraw1oT4ErVwo9cO
	MXlZBAn90umfc+gTsdbBVuXzdRhnGRyj3IPQPsEmh5gTEVoafuf28utL/8Z3omwY5teDrrrFcJ5
	60fRw3L1+W9Qs5Oe0H29jeWV8/c8d30QwM67BsTmbCqhC7J1yUggRa0IFAJ2onaGMNPSAh/5AhE
	WJIluY/hkJeJx8edd+kAwupWGML0uHGK7gU2y7WDweyjwx0EN7anQ0pUxRBpbrO/3OrAsUUC2uS
	RLAKdKeFnJeYazzXeZTRgxnyvdIaiwRQQisXK2Um6/4lY0eJ0kspYxhwNbobMoPKMq0dqPf3Veo
	kGWqF9eAewQs=
X-Google-Smtp-Source: AGHT+IEP6KrMueYMbZ1EVyK2uRtOCWBQuSagI7B70MnPdQKoMaCVvuHwOTfSTcNlxRKEsAQJoF8LBg==
X-Received: by 2002:a05:6000:1aca:b0:391:47a7:299c with SMTP id ffacd0b85a97d-3997f94de39mr11330639f8f.40.1742810488933;
        Mon, 24 Mar 2025 03:01:28 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65e0sm10655928f8f.61.2025.03.24.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:01:28 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:01:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <v7btqobpnuss7rldvrnem3tmznyrd54kks6dcnpwqdhpqysqzq@p3bt6bdztiq4>
References: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
 <6ae42224-74cf-4d2e-88fb-f766279d3525@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jwb25zmwvlnmq2g2"
Content-Disposition: inline
In-Reply-To: <6ae42224-74cf-4d2e-88fb-f766279d3525@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_030131_229326_47AB5ED4 
X-CRM114-Status: GOOD (  24.22  )
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


--jwb25zmwvlnmq2g2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
MIME-Version: 1.0

Hello,

On Tue, Mar 04, 2025 at 06:46:18AM -0600, Dinh Nguyen wrote:
> On 2/3/25 10:46, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > The only change since v2
> > (https://lore.kernel.org/linux-arm-kernel/20250130074553.92023-2-u.klei=
ne-koenig@baylibre.com):
> > is that I added patch 1/2 that is supposed to fix the warning that I
> > failed to notice with the testing I did. Thanks to Krzysztof and Rob for
> > their patience with me. I hope I got it right now.
> >=20
> > Best regards
> > Uwe
> >=20
> > Uwe Kleine-K=F6nig (2):
> >    dt-bindings: altera: Add compatible for Terasic's DE10-nano
> >    ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
> >=20
> >   .../devicetree/bindings/arm/altera.yaml       |  1 +
> >   arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
> >   .../socfpga/socfpga_cyclone5_de10nano.dts     | 95 +++++++++++++++++++
> >   3 files changed, 97 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_d=
e10nano.dts
> >=20
> > base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
>=20
> Applied!

Thanks!

I would have expected that patch to pop up on
https://web.git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git/log/=
?h=3Dsocfpga_dts_for_v6.15
in the mean time, but it's not there. Is it still scheduled to go into
mainline?

Having said that, that branch looks really strange. It contains:

	$ git show --format=3Dfuller 2445fc2d7863
	commit 2445fc2d786304c38934199b1f95a9e52be0cec9
	Author:     Linus Torvalds <torvalds@linux-foundation.org>
	AuthorDate: Sun Feb 9 12:45:03 2025 -0800
	Commit:     Dinh Nguyen <dinguyen@kernel.org>
	CommitDate: Wed Feb 19 06:32:34 2025 -0600

	    Linux 6.14-rc2

	diff --git a/Makefile b/Makefile
	index 9e0d63d9d94b..89628e354ca7 100644
	--- a/Makefile
	+++ b/Makefile
	@@ -2,7 +2,7 @@
	 VERSION =3D 6
	 PATCHLEVEL =3D 14
	 SUBLEVEL =3D 0
	-EXTRAVERSION =3D -rc1
	+EXTRAVERSION =3D -rc2
	 NAME =3D Baby Opossum Posse

	 # *DOCUMENTATION*

I assume this is a rebase accident?=20

Best regards
Uwe

--jwb25zmwvlnmq2g2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfhLXQACgkQj4D7WH0S
/k6gNwf9ERnBuzBvYoovtESv5fokVATPgIqwxS62IjWJNvA1XAnDfihLRKuV82FQ
hVHJYpW7bLd2bAZuhtvPw9ZcWieSJw5+k21sDTYWTPapuwTrcFdzB+0QpgmEn951
A8xQ4kMEv3faqma/VzsB1YZkeM2L+vGWgnzQUCXLsq041fAUr8Oqnvh1Km2QBm2a
v9Bx+hu2+iPCVeTE30kuTHF7wQKiNW/gYNmvP+iQC3m1cSB6cWEKEzza9DRU/Ixx
1Q8JnpPXgBOcu1Ml6BGleCkZNv3v1EXtCYeQJmGk+3XtFBLxBB4cmguXVfCQl2A7
VFoauC0k2Fry5UD8Q7FsJM1HsE88Eg==
=o5ZS
-----END PGP SIGNATURE-----

--jwb25zmwvlnmq2g2--

