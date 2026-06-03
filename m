Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B631FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxqzNwaAdmL0/SThUg+qILxDXPPyBFWSONMfuCfu5/s=; b=c7lj+z8fBOPSrqceI8LWicwIfj
	WqHFEw8g1prjknhogZaI7wzZ0EZg5BCUz/1b8ba5uh+uOStzlsT4pJODHwBbbrqVG4MWMizu96ozK
	Xm2o6Ud6pEUsznCF2t5XTFHnZFsot8mHZ7C9miAU0gCXgEGP/1zYDaSx/2aWii/kGYvE2skPI3FZo
	5AWElXF9gj4lxtG6yLv8RqPlNXKNIPbbq8CGiofNr3+E7RM7J6VLbsGiE+EB8Cwgro7rqGREKLeJ8
	myHu9ISp7fU/pERy3St2qtEzZ7khhOB6hD/A6vSANYteB9AG5vONCDv8KG03aeyguqZ21s06o/hS/
	1DvjxgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnE6-0000000FKtI-2552;
	Wed, 03 Jun 2026 15:09:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnE3-0000000FKsf-3yad
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:09:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso5772915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780499384; x=1781104184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YxqzNwaAdmL0/SThUg+qILxDXPPyBFWSONMfuCfu5/s=;
        b=EZZUUDEtYSV9MxqVTvvTDT3KbSZo+JezwR/39ayoWLj2aEAb8U8fVNzgDwMgJ3PUX2
         DxvLTUTwAQphixAtDkQr1dhTjnf59GgBcZ2LKKKCDdea8wkYRbsL8JVTezGgEsnYodv8
         Q3tP4cXMep2CmxjXtL8DW5Gd39v466Rwp2hutTXPrkXmcWYnp2ofsOpUmXjC/TdL7bEU
         3rsU7QepCMYjFiMXut2Sr8epBplxWGsUuo6/bfzsTskDpO4O0qmLJjeDQ1yIL9VQHitg
         WLf1gu24kh5yFlxOjQ+RSr5s44Gtz5x4g0XIjVNyieMaTgi9RkGwOV1b0Fp4SpcHA0Yn
         ZcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499384; x=1781104184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxqzNwaAdmL0/SThUg+qILxDXPPyBFWSONMfuCfu5/s=;
        b=o8XgMaitsBuwDqsbonr0DWAPqv/5Dc0QjbGZVs99tpw2np0cSEkBNuc7IJ2AevLV9G
         OoBGp1b1ZbwoWNeg3jQpMo+vGq7z80ktXFiBTdpOUtjgk50u3a3h5u81VYHiD0oxNbHf
         2pO563ntyu33x/yUUuiCdFcNt8oua1KbjFA9/BoxNzLyGwP7mfqXf+V1JgtWcYIQYklV
         fugo5Mop1eKKNTfph9Vnpm/OYBbK5zb5L6TShxyx6LztBiNaxdtzL0XQgY2vADsbqx7Z
         ehQK2zQi3bYCudKQ+3ErMm++aRiFCB/1lNkyXcopisiK38ud42PYsulayTN3C5Pn5hhY
         q7GQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LrB8tmjfbjAWPOJlryqA5q0Va4mY9hDmBZmf+n3FwxcNoSE94eQs4GSzyHYJTTk9avIr9N190NXsJ6TdEBj3V@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsn9Ta9p/ozCbMVT8k6w7O5RNvuxhsdM+82ASBoLYMYKnBY+Xg
	uY79Z8dQ6u6CkodilQmj1eD6FXlk5ByvPtP3Doeet5aluua0rg6bqTspLg7pfXaGMHA=
X-Gm-Gg: Acq92OGZyLqNaGZJ9n6YijwxV9KqQne+ffruWfVxRz2gMOKR48KkSZsud7ErhCZMinW
	FlyCFnLkXqt46vWxSN50lwV8wOUAB0yEpPz11JkYNLHascfS2S84IRYVwmQa4dXkHpF9pU1KutD
	ELPdkeF/cIKJgRruNvwVD7kqWgHDL/wHngtDpfXjeHyMwM8qgzcqXakIW2kTSrtXryI7BqdVxKO
	z4YffArH8WD3Phty6ftPjVMeK7iqzkbzl99OsE9x7xm5u9Jo0eXMY8xS50UFfvlkYD9yxyvuqVq
	UQ3QEF819Bwq+xriQRRAVQV5VbZsTPXklg7jKXT9WbGkFPKxwMi6BI35WG4HtRQ5LJLKnR9DEz2
	UtA3HSOP3fliqUKKkdL4bUX2QiagfGHHn+RentVOjTNMYUWMFKECbuZW34a30bDpdqHyTzf4jCT
	CMtJ0o18qxrK2nuPf9OzhKbV5b3l1CkvfM8tOEEKr0faY=
X-Received: by 2002:a05:600c:4750:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490b611ac38mr48537035e9.4.1780499384621;
        Wed, 03 Jun 2026 08:09:44 -0700 (PDT)
Received: from localhost ([90.85.134.233])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490b63d810dsm76797115e9.9.2026.06.03.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:09:43 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:09:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marco Felsch <m.felsch@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Ryan Eatmon <reatmon@ti.com>, kernel@pengutronix.de
Subject: Re: [PATCH] arm: gen-mach-types: don't include absolute filename
Message-ID: <aiBDAQmQFKeN033y@monoceros>
References: <20260603-arm-remove-path-from-mach-types-h-v1-1-cda9890ba788@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oavmczg5e5fbabuf"
Content-Disposition: inline
In-Reply-To: <20260603-arm-remove-path-from-mach-types-h-v1-1-cda9890ba788@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_080948_007924_D151AC89 
X-CRM114-Status: GOOD (  15.88  )
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


--oavmczg5e5fbabuf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm: gen-mach-types: don't include absolute filename
MIME-Version: 1.0

Hello Sascha,

On Wed, Jun 03, 2026 at 04:12:10PM +0200, Sascha Hauer wrote:
> mach-types.h is part of the kapi and as such shipped in the
> linux-headers package. The embedded build path makes that package
> non-reproducible without going through an extra step of normalizing the
> path. YOCTO has similar problems in the kernel debug source package.
>=20
> Make the path relative to the kernel source tree which is enough to
> find the tool that has generated the file.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Compared to my old patch this is simpler, I like it.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--oavmczg5e5fbabuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmogQ7MACgkQj4D7WH0S
/k4dewf+MNI97X4Fwp5u/4n9hOmWPPEgzpwtq2F7qjwkXHhWs7ec/8U15RAQ1W5V
F6Vr7r1vp6pW1iS7SYm0FdQ5ckV4D1/a6aEMHCplGoOsObHbTRz1dHF/NttGsJoR
Yz5Tq7jVx/RTZxOW35g5CIOZNc+g9SPGsdIzf+7Xjh+MYzIErpDa5HcxMia78fFN
2V13SvUO4s2adPY/tj13BogMaCnuXnRGeIQg5vZdyNK090y9HZK3h3Zmp9xDWREj
2QN/tjGU4mV+QGqmWLCYFKSkpGjbmLu/pEX61pegOVjhNYgwYsV7I3yNNwsRpcqn
o5nWsb5MijkWtSFxX/O5c0epteFS4A==
=dgqp
-----END PGP SIGNATURE-----

--oavmczg5e5fbabuf--

