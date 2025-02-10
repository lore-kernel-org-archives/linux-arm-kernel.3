Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57A9C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRoVYFJvOYyL8xWCdpgS4WvSxBvenJHq66eRRrS+VXM=; b=I/cBRPWU8MTlso2uBK04u7TVzH
	TZoLzLyAZSZFuR8Wm/JNYAXHi31w8VRaKYTvgxX2ILxa/4GSehZv1zMXlqMu+92+5JX1kwhHJOQ5K
	ilL3L7VU97sYu87eH1erFo0DWt8HgRYxfho2+I2LVmrmO5T1vtCbcS315gc/kkZaG96MqCAfTrUh7
	YlNUQX1RWvRpWq+6wKZCvqPyp+LnS3kaGwdh7eEN6hwNJ0g5L3/AvpuGdBbf/u9T74sWBzaWM6mf8
	oxX+sthnn7aZyrO2p2DsHcq/xFkQ4LEreVfhXMtM3FCZ2bsJ5o2jJOmZwKLLYIF+RLLiB+am84rKN
	uTfAce/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeG-00000001AdZ-3X8z;
	Mon, 10 Feb 2025 19:40:53 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYYq-00000000vnl-3lTZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:31:14 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so580360166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739212271; x=1739817071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRoVYFJvOYyL8xWCdpgS4WvSxBvenJHq66eRRrS+VXM=;
        b=2rxD7qrJVPuXH9NbnzCJxUrg6w6UA1C5ECJbjWO0f87xAp715qDbIpLTt7UegsE7XG
         7BcEMjo6uRDmf5WW8p5ogYlqLT4ZjdPG6uIWzLgSoxjR2NTp+Agwex9q6IxKaqM7yH9w
         Om5l+DgqvGy0stDXlu6BESWyGAvcWSSaEm5eYjAoWiqKfx4K77s+mgSZ1FAiJmrYoIfo
         nLnnVHUkF8n6dMOiYVCyz2ejSdDJtNG40QnkPuVnnRdyyAUghOWGRZYGPiefQmbfzTK5
         fQUpP+LBFPhDyO/0SenVwVH/VoycpglXgkDPFIvFuhIXZ2q64DeyTrN3jVnXxHLnDs4u
         cSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212271; x=1739817071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRoVYFJvOYyL8xWCdpgS4WvSxBvenJHq66eRRrS+VXM=;
        b=S0hHWBZ/02MukiBa6Ip8PGJ/Y7OcalJZNb9NNuGOoj7+icIxNWFMP8wMVHeIcutahb
         mKxA29iNsujQO6m1ee60zwp8X2yuc8zoMHRGdah0wWkzgd6c2saBsU3xYgms/yja+VwF
         J0ncB3Q5oQIkD568gSPUkN0Slc9jlaKQusJYlpoy9gOVnWgBpWhjizvd9T54EwQRWtS6
         lcLYhgE9su704K+dIDu2YIBz0xPRBSAkBeNklPFdWpTdGL03xoL9AHK7gPiK63gV5wc2
         d2vB46Z5VkejA5/lvhN8jaUuQmSqSxB6j9PY1FidVzFpM6EZHhk7FZ2poPlV4yqj08ky
         KR5g==
X-Forwarded-Encrypted: i=1; AJvYcCXqSrvLzKvH4tLwTgjbDOzZ3CHhmpAZ1S17TT9vtfrSE3GiuXFTx2OJwAFJvmfcmOTScNwhb2CDQcxAnmoZPSH4@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3KdgBgiZFE+eJz78i9kNy068b8GDtMmooxfTijNtnpk55ReY
	pmrU9jmmqCPoAzTc7oFXEFonm3GPMYodl5VY7lqK24XMk3YpAFK99x1UfxUgBJo=
X-Gm-Gg: ASbGncsZq69iT6AbrTRUZ27bjG59zjmEIzFnm9NR9UtCMLSNfkP/g3P8MAN9uZHqc3r
	51QTaQCPYCYt5QdNN+uCSjnB11keDSLz/J3s6foZ+Yq7Vpvxwyv0FZNY3ZqfK+B7u7IADd6e3IT
	hAl6cP69SAWDqOxjzdMU1tqQsR75+8j09lPjU5Qi3lV7SNi4XtzmcrbqPM0NQrVDqKAFrDitPH5
	YNyOX9oVwt9gOc5N+xRQgHA1TLyPoS2dhpz6B5tUH2rkN90xrdk35xfWVLhBCkpDGn1lNJ+VBUg
	YX9JKR9aGT4a+gkI3zgNJGKp4igR64/1j+2TQZCTi+r81GihFBmI7jiGLw==
X-Google-Smtp-Source: AGHT+IGxnUYjEIEFumIffoV7za36A5epYh//QQ89hdBeu7W4Q3SvvoIDdRj/qSFbZjMv9ioyPcD/UQ==
X-Received: by 2002:a17:906:9c8d:b0:ab7:c1f:2b63 with SMTP id a640c23a62f3a-ab789bca7e5mr1713691266b.27.1739212271071;
        Mon, 10 Feb 2025 10:31:11 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7aab8d8fasm487594166b.58.2025.02.10.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:31:10 -0800 (PST)
Date: Mon, 10 Feb 2025 19:31:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] pwm: pxa: Use #pwm-cells = <3>
Message-ID: <lzlzq4fh3762kyezzr7eqnbkgsu6nbvzgi7yqzwy5tbsrb4tg2@gdpjz3cqrqq6>
References: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cuu5yijfy6peiu4x"
Content-Disposition: inline
In-Reply-To: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_103112_946194_E60F4F50 
X-CRM114-Status: GOOD (  25.78  )
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


--cuu5yijfy6peiu4x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] pwm: pxa: Use #pwm-cells = <3>
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 01:06:24PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> this series' goal is to soften the special device-tree binding of
> marvel,pxa-pwm devices. This is the only binding that doesn't pass the
> line index as first parameter.
>=20
> Here the #pwm-cells value is bumped from 1 to 3, keeping compatibility
> with the old binding.
>=20
> The motivation for this was that Herv=C3=A9 sent a patch introducing pwm
> nexus nodes which don't work nicely with the marvel,pxa-pwm
> particularities.
>=20
> Changes since (implicit) v1, available at
> https://lore.kernel.org/linux-pwm/cover.1738777221.git.u.kleine-koenig@ba=
ylibre.com:
>=20
>  - Use #pwm-cells =3D <3> also in the binding example (*sigh*), pointed
>    out by Rob
>  - Add review, ack and test tags by Herv=C3=A9 Codina, Conor Dooley, Duje
>    Mihanovi=C4=87 and Daniel Mack. Thanks!
>=20
> I intend to take the first patch via my pwm tree. Assuming the pxa and
> device tree maintainers and bots are happy now: Dear pxa maintainers,
> please tell if I should take the whole series via pwm, or if you want to
> take patches #2 and #3. If the latter: Do you want to delay application
> or should I provide an immutable branch for patch #1?

I applied patch #1 to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
now.

I don't know yet what should happen to the two other patches, but maybe
it's a good idea to wait a bit anyhow to have 3 cells working for the
pxa driver for a kernel release or two before we switch it.

Best regards
Uwe

--cuu5yijfy6peiu4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeqReoACgkQj4D7WH0S
/k4VkQf6AzUwWcUMhatT49kzLrH9Ik8W0qT2EHQhxjiTKiZvylgEcKffpbQkdE63
S3rsHNK2V+sauwfreQSx3KA4YW95TWhVfjGOS/aij1mL4Plse94GOCEhw8zLCzsc
HJi4SKa3A6BPsuRYLuIqdNcgKh0HYEXibFojcux7CKSAyfS9mk9K3WsEuCpw3MVV
6Moq80l2BVV82SKZ9xR9iANgDIxji9xFJpMRTNcK673fnq8++TFwevwzB1u/iMf9
MitOOVkNj5+X/oYZwDZAneQLABUE/qDeYzWEtU6P/2KuT3RiTmP0rGAPcHlzZwIb
GkiTBJZ6Xu07fhBuP9ceT5liCF7+NA==
=GLjj
-----END PGP SIGNATURE-----

--cuu5yijfy6peiu4x--

