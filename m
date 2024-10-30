Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48577D7495E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:From:Date:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwEZskytNCIxQggG34Kcvzn/h7WxM+KE0ZJz42WQe0A=; b=JHWOUlNiyy2sJAc4EG2h3E/Fb+
	rsgCyt0ffB9FqJXjpA+igOU50Yb26PQxjJU1sb/4MeqjAjFa82Es7yJhUSATCHrdHmMv5yyLRV3Zc
	6LH1KpR7p8uip+cccS/FMuG/LbbFhdOdm5F8coi277CAFDNPl6mCp1MdyyCnW/kpQcQjvWR8POkmv
	RLDvX5FVanKSUzFQi25OpkjmbkT8rchnC14Ys4ISshP7vmYDLw4xCK2BlTbVolKV4qb+f487eeYTA
	4tkCGN+Cq1b6g+l7D6pl0mUuQ7qJ2aZIcu9Wyh6GWn0oENrC9wEB/b+Vlh5S8nUEuCKVx5VmLbUod
	I/GLyeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63LE-0000000HAvR-2oLR;
	Wed, 30 Oct 2024 07:42:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63DQ-0000000H9iT-1wj2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:34:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so63342505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730273643; x=1730878443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwEZskytNCIxQggG34Kcvzn/h7WxM+KE0ZJz42WQe0A=;
        b=nnTLQwTW7Kis1L/g9eXeCx0SS70sq/xM18zy0I1iKwSO1Z1OawjS0nGdEweBcbWmOk
         UYY4tUFzqKmGugBqsXB6UuCCXJInnwblN/3UGzIl1nEl5XkEM68vp7zcPgoKykp2pbHx
         CY/pfKMyQU4nOmqLeDBO8ivw5W6SdfcTm51I8RlbrkT7Mjo4D4Go20qXqIE20L+lA7P8
         WIm+lpytRp7sUF0cdGTilnHwCj59yAFFs2ogogLUDWzBjbDtJiTfgO5w8ZIOhOOttmwu
         OyscrKpxfpcFiPGvpfDUcuskoQXYxBG7kH/uU3+C1SaZLiS5WAI+Ik8oVrOD/iq0Ueg2
         M6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730273643; x=1730878443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwEZskytNCIxQggG34Kcvzn/h7WxM+KE0ZJz42WQe0A=;
        b=j2uMOMTegeNxPSrkbvYEnoHFe3TD+I9LAu1ltEvsnilmg6mK3CwOYPu5vgal/FN+5k
         lGUQBVQ+/R/E/eM3vGYmgUoIsIwhqFigZLYCkGfndmtp4W5cV37Y5pu5mIzWwWjqs3Xj
         7ZIt3qgBy+MnnhXEECE2HrCd5Xlzp1JGIbuazd1YINa0jujvE1tg103PjuW4zDTXBZa5
         /cG2nunIsMYKMTzT4PdulGjqB4kD8mzaluSLBTwuoboB+DvMd2TSsc0jHlc37ikjj1ev
         Xb1f7jqNYnobH4/SSHeXX9/bLonW+DSCqLkRl8RRLOY4kUu/D/XpSk7GKGBNE5IO5gY0
         Ff9g==
X-Forwarded-Encrypted: i=1; AJvYcCXfGA9GyWaIRIzzC8nLcIpu7iY1IE/eJWvfjSlkH3e7ajxpJI3uwr9CtXhylbzltxxAdqxV/I9HDB++wpXCjWJk@lists.infradead.org
X-Gm-Message-State: AOJu0YylkNEJvOxd7xXEX3ZS5t06D1ivoizjgjjYHagzRmYSxesoWiVG
	r5MLyXloKmBdhjhj8Is2I6ZbJmL99pOMmD5aC7sCHf2L89LnhNQ7FX88/u7liYs=
X-Google-Smtp-Source: AGHT+IFvSeQlKDXZ2TaznWZQry6qmvVUbv1vCSFsNuf03fMgrDansChUa9SPu6uyHlj1+Orbp7RrSg==
X-Received: by 2002:a05:600c:4ecb:b0:42e:75a6:bb60 with SMTP id 5b1f17b1804b1-4319acb8fcbmr123819465e9.19.1730273642534;
        Wed, 30 Oct 2024 00:34:02 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99eab4sm12468095e9.44.2024.10.30.00.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:34:02 -0700 (PDT)
Date: Wed, 30 Oct 2024 08:34:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
Message-ID: <t7i6lkx5oedjma6uauiygnvbgzixnsqmolmkse3j2qiy5znf7t@kfozote6mm2k>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56rk2czsrrb44okr"
Content-Disposition: inline
In-Reply-To: <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_003404_545603_2A6A4059 
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


--56rk2czsrrb44okr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
MIME-Version: 1.0

Hello Linus,

On Tue, Oct 29, 2024 at 11:03:14PM +0100, Linus Walleij wrote:
> On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
>=20
> > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > needs to access the same memory block (gpio memory region) to configure
> > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > childs of a parent mfd driver.
>=20
> OK someone has to merge this and I suggest that I merge patches 1-5
> (all bindings and the pinctrl driver) since the different bindings have
> dependencies between them.

Fine for me.

> Then Uwe can merge patch 6/6 (the pwm driver).

The pwm patch needs some more love, we can handle that separately then.

Best regards and thanks,
Uwe

--56rk2czsrrb44okr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmch4WYACgkQj4D7WH0S
/k5D1QgAjbBhIuEEliXD8FforKpez8jJ1PxkBpkZubAbNImwSpOpOGraTpIwdy94
+Mp7owHDJULSYRibBSz9vASz1ULu+LElGQSTtfO/FMdo4fxZhS8mNWJmso3GgbfB
6sf83Ou6IPy0V9RZS06z92en0jFa296T66+U+eQRcMvgZRZnL0R7Aqhm9acidZFS
kTzQw7fKIpqi5t07aAeQxKZWZ8Ag8hPwQdEECSpzJedn8c9yRaop1swgJ5X46Gs4
NZMYuepIpatIVEfog8i/NzV/AQpy99nlQfLpt7nbPQk+o0gINALiBGe7bGzZMDNj
27futyysj3wJ/nuiDdGOnZtazOm71Q==
=pz6h
-----END PGP SIGNATURE-----

--56rk2czsrrb44okr--

