Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BDCEFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5Bl4X7yI81ScRHLniRdDiy4Lg39CIQtHgwg3me+MHc=; b=Kixx6gOQtG8KIp2USuxmNNnZYk
	fbGzhU5EbWKWoP1ECWzZUclAMlZRxyH6BKoEzekigPT/8G9dv9X1tVtrpwKfMkZv8pH7/zU4BsVMW
	SzU67EYiFLWG8BtYxzShsjRqBLt4Ftu60S1CpcauSIUIV+TWkHWEeFRoSSHC+W9Ojfwsv4mdc8DK3
	alme9E9ooxl8Gc43cIxtUYfDZc8T64Do+ZpV1dw7P5BG7bxqg4EqUxzm8KI6Kt3DKrJ/Yyd6QKTfM
	AoVZo6BT/8KW6wtnq5H3m4FbATy2mYc+lpG57//agdNxSWbibSTHc8N8GzvoHkETwDNY7MjgHMDJn
	fDYgsBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYZ5-000000079rJ-2GQK;
	Mon, 09 Mar 2026 11:14:23 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYZ3-000000079qm-1x8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:14:22 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-38a32d36396so32593421fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773054859; x=1773659659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5Bl4X7yI81ScRHLniRdDiy4Lg39CIQtHgwg3me+MHc=;
        b=S1XwGce6Iy2likfRHzP77zfMhi/MZWjRPUP9vdpE5J58W2jJqC6YrYmEVRsFcD6Ddl
         7O7AFf8NPLGF4lGPd/ziT9uu27LU2wp+4RDxbWDcK2DH93yBl2zUGw45Fo5eKytIxnCi
         zhn2kghczKlXU8BWp0a4cr8lWN8NBO8pchW5PtIGLu5NbKSWCCqx7eUOG58Z46Xp/5r7
         iCaEa+al7obr4DDLyQpu0wFQw+ZXugAsFjPQ3PqR2UP3dX3e0Zbm4kq4OGY0uw8cr8g2
         tL+8Rp0nNQGxYQV7zvHh8Z3VmrmgQbAEbL7xEzh5KzdbJdBlsD0kxL3mgb3Ks0NtVGYO
         tbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054859; x=1773659659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5Bl4X7yI81ScRHLniRdDiy4Lg39CIQtHgwg3me+MHc=;
        b=JPnCOirC+g2ERghSNh89kVAUcyUBztvmR16o/DDnm3yDiGq967tjuZZf/NaVlRB45a
         POUz3XL6/LD/7stbPF5NDvP+ZbCd8KKySnM7z2Lr0UlbNjXOAhtrZ4widbODPbDh3gI4
         36cjzCI5SSlqoTedl7+GhytlVoUoZF6Gyuq37nEpVScdXsSLGsgztuQkVT4MBfjmEC0+
         IBOplPxsg+i/0JZYIZJV4KjnvSaid3pzYfyPTZbDBtCnshHO7bL2PQC5n63POTPZJkR/
         8xaZ6eKwqSlLViMlA2rsDW5RA9i4GqXywKyXBvzi7+dPBMdMN+aWpUamCfATzGyG6pMq
         vOXA==
X-Forwarded-Encrypted: i=1; AJvYcCVHIqdJ1uHj6zQQsG2gHHVgIEBtvFimTQHexREnYQ7jMw2AnqVWMS4OE4yPLeF3fs+lwvlyTFTSU1R2f4Vh2Zst@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2Z6poAOHUsv6h32JUCxYZdP6miBdmvFfrOBQltF8Bc4LCMpF
	JxXi90ILGvrfQCssfr3SwEe7dUc9OmwIIabAQ/h9Vnr2L+fc6TypJm3u
X-Gm-Gg: ATEYQzxPVMkpJSKra1fWKCOCFdhzDwU7Y+EWVdLPaNYOj/bgPgLONtbBh5LZcANPnod
	Zw9L+bpYJBGJXKJjUB9M3w+I0AF0we6Z/deK5bQzG7kPoLwIzYXdcWgwyBXWcsS7N/2DWJvoxVc
	DnpjJa5GB3GtOwoPmkyIklIblwzpCKf23SGFpWjINlcUrCwg/26q1oKYx7kR33sFZKwU8tIWfGe
	jv+4eiMnuExDj/2fz4zLmWRIajIQpbDKwQBnqa95F10kgu7c/XUOld1dTYCXYUTRe50Jw6hjTrv
	jJYfHvCDAveHyVMaw+T3mLnGx3CbJz6Z/O8T/bEnY+qXorHxOSYKsQxVbpqHlEHmF6AuZ8adPi0
	6sKqmBFGEzT8J2XsJHo/yu1o4tBLxwOY+0EMv9ZbSmU7V7cUbeFwDdpyEpOkudihzML/HE/66/0
	wOiLSo9zplf9ZsMP/0WreKz5hAaHQa9iFgl5dT56Ee4z8pp9GEBzw51xRRNHMV
X-Received: by 2002:a05:651c:41dc:b0:38a:29ea:ee48 with SMTP id 38308e7fff4ca-38a40e6c046mr29974411fa.18.1773054858535;
        Mon, 09 Mar 2026 04:14:18 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a4203ea59sm15213891fa.33.2026.03.09.04.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:14:17 -0700 (PDT)
Date: Mon, 9 Mar 2026 12:14:15 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <aa6rhyZLhPY7aE-D@gmail.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
 <20260223-i2c-mux-v7-3-ec75b214718a@gmail.com>
 <aZxrZbbXxm31q62s@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mJq/Dl0uaZftLsjw"
Content-Disposition: inline
In-Reply-To: <aZxrZbbXxm31q62s@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041421_524748_CF5125C3 
X-CRM114-Status: GOOD (  19.73  )
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


--mJq/Dl0uaZftLsjw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Feb 23, 2026 at 04:59:49PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 23, 2026 at 03:33:52PM +0100, Marcus Folkesson wrote:
> > The bus frequency is unnecessarily converted between Hz and kHz in
> > several places.
> > This is probably an old legacy from the old times (pre-devicetrees)
> > when the davinci_i2c_platform_data took the bus_freq in kHz.
> >=20
> > Stick to Hz.
>=20
> ...
>=20
> > -	clk =3D ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
> > +	clk =3D ((input_clock / (psc + 1)) / (dev->bus_freq_hz));
>=20
> Two pairs too many parentheses!
>=20
> 	clk =3D (input_clock / (psc + 1)) / dev->bus_freq_hz;
>=20
> ...
>=20
> > +	dev_dbg(dev->dev, "bus_freq_hz =3D %dHz\n", dev->bus_freq_hz);
>=20
> %u ?


Thank you for your comments, both this and the other.

This driver has a a few  other style & formatting issues, would you prefer
to fix those in a separate patch in this patchset or in a following one?

>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

Thanks,
Marcus Folkesson

--mJq/Dl0uaZftLsjw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmuq4MACgkQiIBOb1ld
UjLTwRAArYUfraX/TF6LW2865GGn5YoXBr+d3Bibi69zxz4WYBQsXuAIjRfA2yl/
yed43OaeOBalpxCnHrdbbEEnA31IVB1dm9IO1PLT855x5EwCc+JXv+NAQGTt6tFC
PPxPZiajK7/odFHYxUA3jEDzlWwdPv9Km9Pa7QkK/Gri4uxLt+VKq94qPJiAKVIk
Tx/1ffT31ymNAbynHH7xd9wIlo+8frHKdrKI0hVLXq8/s+UDJxZMsO9TcO/KKnhH
a38tYWwNq3Mj7sHi0cmK1axsOKCMtPBf4feh/mxRIxQ++45gBg3MvXQ8vHihVFUE
ntLiJG8QVJyL/h7cxTEDCefP5xLFR0hc+vrtYQxrhN5NZearOdvjAIuO0UDRNNw3
YW748qAtEWw17MBZDz4bEAoY/slfoTWPyov2IOhkQAiuaqKRLdaDyav76EtrvG7M
4glgspLbv8NtQzJq3zfvuYqwJughPVx4FRf2+52u+6JxRwEzQnN6nhe/DQEWtFb0
V/1bbVhaHd7raU2+liFFoJpqfmlDyVc9xYJ22EiD3txBJzO4dv3owV90DF5J1wli
ZSR91NN0pQ6oMw5G67cg2u5RKukk1vvI8vs0e+3yoh74QqImHZV5SNcHZWNmmfdC
nDc0eShyJUTPn/qNE7BjGH0858/P2uwhSH1r6E0uIgHbll8l2Fg=
=mhhV
-----END PGP SIGNATURE-----

--mJq/Dl0uaZftLsjw--

