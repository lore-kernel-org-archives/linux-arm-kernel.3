Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3832C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1sXw35rTSS7pTuDFEY54HVj+OPPf2cg7Q7+jHB1Tok=; b=oKLMMyLsZnYwsW76H68WG0ZLZg
	5gAQZUo2zxZrxf5MNf7NrEdiyD8VEKkYoFA5g4ApSXbVcvv+Z5/rDbeC4FDKw1eB9bedHI/8BfdOu
	P0cV6hoM9fwavMgVTs8RbL6uSg5Em2x3Ypuno96C6t5wK09rPOUvL/LCzhRiWVQi9Rt6xfBOT0ajs
	ouWYROIlwzh/zuRDOJWlBL3oZCHO8lLS6FT3i6FaA3WSxHAc6k5gjZ5mxuJLBwjM/2SLDGuRFgv6j
	IdkHcoYcekkqxE+hQ/fEdunlRES/iMyE47k9NUxWxp0H2KmDCems4tDYFxdZmEAtWLu5mIkpClEwO
	qUZh/KPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfA1-00000001nQK-2vdc;
	Thu, 15 May 2025 20:26:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFekp-00000001kKG-1j9b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 20:00:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad257009e81so217238166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747339229; x=1747944029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h1sXw35rTSS7pTuDFEY54HVj+OPPf2cg7Q7+jHB1Tok=;
        b=ooNDrWMjXwEERgx/TY4rW6EKs6FbJGoUhHaxlHLMrfJWjuxvXKXGm+A5KGj9MkiHcI
         GEetSYxtTpxS4iPIMXgJkjCUGTsN/UcbcjJE5RFY5ePenscRM6Wjf+rTzc7xAO1iXOh1
         gLs3Za1cvVOB4do8iZcRDolru/eFl0lpXchvahNJCWLTma9JguyaldKlmfayG6+ZalSz
         dhi41fkp8H9/mBIEJWrfYpYRHpOfzHd988zZdgnCn0siVy4UjspQGOnFR5HGS5iCiE5M
         VbDV6R9qQ+kYEmPntCPu9TSN3eBXl8LHLUtGq22yxGxvv39FFH9od57WPelJL7rOYYjE
         Dguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339229; x=1747944029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1sXw35rTSS7pTuDFEY54HVj+OPPf2cg7Q7+jHB1Tok=;
        b=Bn+yI4rDdlsHzfwWYaVk+Sv7L9CaqvpAL4sfGQLM2A4AIVRrETbxa1m7Z+GtpdQBpW
         0FnvVlDih47DS+yJgWb3p8h2QGvG80yBxpHCQMT8/aLDLYgjNWWv+bozdRNGVkfV8vR9
         dGEWzRJi9SfA0t4/Q8jG3gCRswVAN6koH7pHlH2LqR2uMFILCg2oQLxDHH4Qw/dIJujH
         G9vek6slDvUHjAN6YULstOLNt0xH7oj0b4Y+amlYLOKyti8natMFGTStjFTyie7i4cpX
         n6nwPwVeMcun98qnbjYwlYz8nV2M+f8Sf/fs17xCgoRwE7EJB1oE+HZzg74PdrlNmlu1
         SK/A==
X-Forwarded-Encrypted: i=1; AJvYcCVfIC40H0dXgmjWf33VhQNVU+R6DL21kVVh+Auj08zymlqRKFgguE4AvNbEvfP5XuBVaJHjWCQvvmAHje9RvE9A@lists.infradead.org
X-Gm-Message-State: AOJu0YxwzePbdWi7F9v9aWopEO6jENvcNpbdbXpwBBzwS3fcqYNdZRlc
	y6Y2tcJTyTVydYQ0khPhI7UqjvG7h7bOm+PLN6+tKNrRQE08LbEyIuEEkurRBKUysdY=
X-Gm-Gg: ASbGncsF/9jPWXmpLS1+nLR72odniZQiMSgMf2sBNO1AMxTPkld5c81YdVmCooGoFZj
	3BrVdLCEENQ6ODdtA/7rZpYrDnEK6zbuHPYof83oL4jGr7OyMP95rxG4MD5De8sFgcmcTKAjehv
	GnJhVRSwzNcPw6+HPA1Ha4P/7al88/nJGtNMzZHMtAvb09sdL2aaF0NsyKo8ZUrHIyooPXpvpaa
	k6yN2VQ0fg4LeHc0uKzwgZvm1PGyBZZyyKIfRGmfyE6sf9fegHbpX4QbcqGPnJKR/QxpwFK4eLn
	APm1mZUyGpqcF28JLAMrkvnjtlXBeOWtyo5FgEYHdynmC3pQ9a5EZHhB
X-Google-Smtp-Source: AGHT+IGPOFtpI/vK8bB6QX01z/3mHJSuoT96bx2VZRxF7C4JeqX1CuZQvwl02jljZ2PZvA1htePF9A==
X-Received: by 2002:a17:907:1c0f:b0:ad2:2ef3:d487 with SMTP id a640c23a62f3a-ad52d5ff0f5mr99764766b.58.1747339229197;
        Thu, 15 May 2025 13:00:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d06df95sm34035166b.56.2025.05.15.13.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 13:00:28 -0700 (PDT)
Date: Thu, 15 May 2025 22:00:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <tdqcadvrr4lfn2ipkbcu2n7zgv3e57q25tirvuo5ooh5zzf6my@u27v7wxswber>
References: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
 <CAGTfZH2jVrD_Bfu3NZJ+vNdQCjdxo4vygxWob+h0VasyxUa4gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3k2tl2vtfjhrlpb"
Content-Disposition: inline
In-Reply-To: <CAGTfZH2jVrD_Bfu3NZJ+vNdQCjdxo4vygxWob+h0VasyxUa4gA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_130031_713429_2EAAD726 
X-CRM114-Status: GOOD (  15.25  )
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


--h3k2tl2vtfjhrlpb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
MIME-Version: 1.0

Hello,

On Thu, May 15, 2025 at 11:38:11PM +0900, Chanwoo Choi wrote:
> On Wed, May 14, 2025 at 5:39=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
>=20
> Applied it after removing the above unneeded information.

Oh indeed. That happend because I added a newline in the header part of
the patch mail. Thanks for fixing.

Uwe

--h3k2tl2vtfjhrlpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgmR9cACgkQj4D7WH0S
/k7qZgf/W9wz4qM8Tz2N3KVv0s0oVU6w1DHns83H0SunE+jquxj7/y0evxnc1Ilq
V7aafapnyBgz/U74H9Utvd9gMBwKk0+lnAQXnOnGeySRsr05q1toZq1bVilPn44z
c3HCsfln9Kb7m4ysM5O6U8p92h9Rg7uP0epQ02JXxknaQDHiY0Ac+EzsZZw1uRbe
mvlrfet/eYHmpaMPxlRM6ksBrxJQpSIKuJpIIf1VlkWNniiXY93fl4yor/7JCj0L
v/fgrnnDu+6Gk6c7cj1fvpL3Twh3AlRwx5lmMkJ7HoSvxhNcrIc2m7U4o9/pCEh6
jTzhBsJxpV9AAfOGA02x5qQdG3x9wg==
=60Q6
-----END PGP SIGNATURE-----

--h3k2tl2vtfjhrlpb--

