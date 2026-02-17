Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85959E68149
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KP22+PfNvIQ4JRJHKrRSAiSbBKzIbTD7/fuUITNUSEc=; b=qnylLAO5Qdud3gCWGgIM+ok8nU
	PXv/EPllhFrC0oZZ3G8f86j/9ahV+MnjW0dv7ijnxMMlk10a/4Gmy6EKh+vCKTkrG/QMclebTHEwu
	3jI3IrOuZQ0quC+hyUNQziMZGPh8N3IJvI5N62QWyC/YoxHyHJ2SoKap6cnnplVoV530RQeqV4q9M
	pDg3REvDbu/vTj54td6qI/7j7Zd+T+NUQOVohbJ9Hno9scLSVFg31dGnso+J2NvmzsbOamOPjyh9e
	iPwkDI1Fbknmu8joNVDYXGrLcBDkdDON4Ib4q7iuyKw0X0Joh5P5vjqbEbFHnGhW3naHWFJkxsU3t
	IMl7pJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHIH-00000007wIV-2SJG;
	Tue, 17 Feb 2026 09:22:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHIF-00000007wEr-0Bzz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:22:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59e64657f0cso3901458e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771320172; x=1771924972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KP22+PfNvIQ4JRJHKrRSAiSbBKzIbTD7/fuUITNUSEc=;
        b=ApxwqoKEYaU+xBl0CzhTkLcnqMYY8SSP0SG6dSzycrZJU29NCQxoDd0f5aE1/rHkho
         L9RoAk6ZyfuMI060dbw7bWrw2KsdB8xFeI9OqA8cWP7SBoEudvJBfec0Si9Lnu0qVxk7
         wKQVtZ8T4SP+16vW/YeMoamInspSem7QpmON2uPPrY2rSq7/NPbZ+IBa3jrQfjRtgZAw
         LMdfn50XrSfExX8gBjzn5YYySC2/yjymMHPueAoEeMGWP3mVzSwk3Sr2dRoH+VGh2lBq
         yLXFmQ95S7HIJM9SpTE0ouU14Q7FDjV+MR1EpiB5EARE6CgN3GCEbBvJ+361oqIKMpbo
         HN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320172; x=1771924972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP22+PfNvIQ4JRJHKrRSAiSbBKzIbTD7/fuUITNUSEc=;
        b=wRWtokxzO+BiDBTJ+J4dfomE9pS5OY/Wn2D01a9Tpm8Z45q2xQ4W2kXE87wHpAWCFL
         hJLkOlR094kNiZYxA8+Spj4HPIgwyEfFSULv8IR4n6E+naEmWwHfsE3gdX1JhjZY06K1
         vank0LSNvyZIt/8rlJ22iPknpG3bm7Yz6jmg1kDXZ+OOldmLfgYuCMOGCWJ44I5Cv3fk
         b6RmUeJ3BDf0gIqIP/w4YvMBuvBDMLyPZ4YisBxHPimZo6BBJa7CaY9Vh3pN6MWMc92R
         c4aNX7Co8Blgk8y9rRqXKn38rGJuBtJFKGUtL7Ru64K90A0JGROVMSIeY6qZuSlTJnXN
         AmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7aO2CfqtY0Av3Fi0h9pQ+ewJqmmE+tm8FL4S2WGYGxD6nKCGT5+aDSsUHXwkeuIuCqjR61cflVZn2b4yRRrtw@lists.infradead.org
X-Gm-Message-State: AOJu0YzqQxn4lX4I2Gb0Hmy/GT+7U7BeccyVj1gVhYa0ABTPu9sUQTPW
	0PXXA4F9IYYNSynrmR9GliSgLQmYPC0WMFxHvN3wdk8ukz4+y1FTy3pg
X-Gm-Gg: AZuq6aJcBDaVT52AX/qLsZxIUtAfm0B8L+x+3/s0ayRxigNU6av92rLm4tuWWxy5M9p
	YRokpDZVPl1+mxHmVZ1NQ7nz4GP2nw/5qSXccmoetpyZtTnubMz27ZEtDiiepuE2rF3IJOF+HDv
	8zbjkl8j25JXVfD/y5nWUovb0I9au2D6JZFz6iNRsXZylnuOAFn0hHJFWydhZYTP9aZhfBKTf59
	3kE/7o5Y5YrUfzvcq2PkwamqaMX218QPaKPhaXitkJe5DilTR3/hFFnSxeXki3K9qmbQvZ2wCWy
	k4hOZuHFi6BuSQw6pdLjZTMxGtsGOhHnLn+5wY7ph2n5fKiY390TPUNGx3dZEA6iQ5lDOpACknM
	ZJSOYt7H+QTjGW4eLAfKPDbKO75iVIPsJqyZKQYwGS4QXfsMMBQjMJInAzUoT+ZL1MnCdkaVFa9
	x/zCgSv8V8NTzZFtVLK61JUjYFcGt+NMCftAzulC7+aS/mIRkw8TVLamq0eO2Y
X-Received: by 2002:a05:6512:ac7:b0:59e:465d:e346 with SMTP id 2adb3069b0e04-59f6d35849dmr3079335e87.20.1771320172217;
        Tue, 17 Feb 2026 01:22:52 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56369dsm3753854e87.2.2026.02.17.01.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:22:50 -0800 (PST)
Date: Tue, 17 Feb 2026 10:22:47 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <aZQzZ4iQPDswwp-t@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
 <20260216-i2c-mux-v6-3-9be28ecfd7e3@gmail.com>
 <aZQvuh1KEAWFSdRU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LvYrtrax5P9jJvAj"
Content-Disposition: inline
In-Reply-To: <aZQvuh1KEAWFSdRU@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_012255_106131_8FCEA645 
X-CRM114-Status: GOOD (  23.08  )
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


--LvYrtrax5P9jJvAj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, Feb 17, 2026 at 11:07:06AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 16, 2026 at 01:38:15PM +0100, Marcus Folkesson wrote:
> > The bus frequency is unnecessarily converted between Hz and kHz in
> > several places.
> > This is probably an old legacy from the old times (pre-devicetrees)
> > when the davinci_i2c_platform_data took the bus_freq in kHz.
> >=20
> > Stick to Hz.
>=20
> ...
>=20
> >  	/*
> >  	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
> >  	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HI=
GH
> >  	 * to LOW ratio as 1 to 2 is more safe.
> >  	 */
> > -	if (dev->bus_freq > 100)
> > +	if (dev->bus_freq_hz > 100000)
>=20
> The 100000 has a definition in i2c.h....

Good point, thanks.
>=20
> >  		clkl =3D (clk << 1) / 3;
> >  	else
> >  		clkl =3D (clk >> 1);
>=20
> ...
>=20
> >  	r =3D device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
>=20
> (Why not using i2c timings? The I=B2C core has an API to parse firmware p=
roperties.)

Actually, I found i2c_parse_fw_timings() just a day ago and have on my
TODO-list to convert all bus drivers to use it right after the work with th=
is
series is done.

>=20
> >  	if (r)
> > -		prop =3D DAVINCI_I2C_DEFAULT_BUS_FREQ;
> > +		prop =3D I2C_MAX_STANDARD_MODE_FREQ;
>=20
> ...like this one.
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

Best regards,
Marcus Folkesson

--LvYrtrax5P9jJvAj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmUM2IACgkQiIBOb1ld
UjKzBw//YXfk8Pa5HmqhP/jWcZBbuAw56cYB1n7qv6qX3dozdeWpBzZM6Ylffeno
p3eMMqgOCleCKhGWLoZETzV8OjNIlSa84S1lrLoaQ6+ke8opse93yyvK2yG7fIJC
/l5Kt+bqayWMMg4um2cm3asau8Z+BVQUYfx23aB3ZbHZCmT+DqWZgx5ahiin8ebf
5OFKIDlJfYs3YtZY+GWDlbRbs1a+yVUbvH8BAY68GEmvS3zasbZOI6y0CCgVvo69
R+1St8eekXOkcgPs/2f83fP7PbjX2zD2x0+51MkI7ioDSJ6t0LWTi2oG48h4SE5z
9gWHXhx527t6FYhk4FAxIGjZGDYSoRHHE2aTXU9aqsBG6h2XCscNfqD2InKj1FVG
zO+fiKzNg+WESGzXey0FyktC8dj09fSCB5TznhQLl8a+rhNNzglOKfkt1l2ZjCLr
69cCwOKrZu94Zzljc1jZJEOep1/CmFIiBP98ENESRaTFA55jtsDrFhPBwXv6p7E5
uJrdwIIpDqMcW5NDdiu3BW7qNH/XrlC9fY3zUVNHErOn+7sIy5FFCkTXkbFzsihq
7bsRwURzunwp1+OQsvGNpfS4ivju93R/NjBbpliGNn6bU7gVemFqPflk4OPFc1z3
6KIj3sWwuUGh9VjoQ+ar/sjU/VYu4ujT9fWz8c6cTIoOjkizpzQ=
=rz0G
-----END PGP SIGNATURE-----

--LvYrtrax5P9jJvAj--

