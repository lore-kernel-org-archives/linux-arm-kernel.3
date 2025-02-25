Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5484C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=; b=MRyelHxvSA811oNFE0o0LLdkhd
	7YyvpmEnUw8uJxb9O+W4TRWH77RKe+uNjYdtJW8i8p9h6Jzu8A408HWHRG3g8dJ3o73sus+IhUwWS
	jQx0z24yo9bb6ZtC+245KlDnh7ff6tvy7Tdzl3THpV6yQJvbhh24TSwOLyyRxOVKSmOhQtbizg9fX
	/NNBNpa3613sunMcQR9FPwBJIqDG05tkrKLmUJUwdlaLi4GbB6Ht8mhaESLeAjb5+zSZuHZxxNv/a
	wR+FqOvn2IfLQhL+JhEz3RIlO8TNM0wgIkW6Dj+/4lL7nQmKKZ55EKG+si8Gy+D+Cwf34ER9TuB1/
	91CoVGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn28d-00000001TtY-2PcL;
	Tue, 25 Feb 2025 21:06:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1NC-00000001L04-3eUT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=; b=EFzPUcF495l5XAy+HpPWUl4yET
	w6CAoRtzTtwOdMdI1YKmIUakc28g2NHf1Dx85rXJQ/DZTKt+qDMk+AUhucpuMRsibYfURQZHcXdwp
	XG+IVy4gcgHl50slkUUtSHUVZxMuPjRZm0O7q/32QeioZvxquO7Be477+atPh+zIw3IjhAPHDOm6a
	UKVY2dRMpwyHVPk45fI4qtg2Zk1lGZrtcG+TqpBMpEs85dxzpaVhpC0jq0N3/oP6LG4sz3dn8bafJ
	Eo7KyHgpE83YkUIPC2StKn17qTqrVlduBCsuOb6gFv5EdYkF8vgeIqwKoOfhE6AhQ+UQ6ObK18Svs
	ApX/AP3Q==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1N8-00000003POF-31b6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:17:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so11292526a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740514660; x=1741119460; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=;
        b=OUCkrcmMEl0IomlOeggdtvWDT8u+uEq1PE/RhA2J9w8Ybv6AYyL0jfmXelx6h/lJ1i
         JIL/LJekurTBBwdgDzvePhgCOd+qbYgi8qXZR2Ny4BSum9IMvP56iXsKaQyy/q/8eDy7
         tmczwLt50g1d+6JupOrLC5+Sf1PsXCOVJeXkHg6p6WjOXFN0Am3jcmFMBtOIRSyOXqdy
         Wg1op1j+/8I9eDmqrUbPg2LRehWY2ODWaCZkw/Ad1CyJjHWWrvuy0wogad2J/iy54Xx2
         a2k0MfC5qhUij7H/xI7CqDNXvwelxqwHDrm/ehemY/j75uGZ9v9aPIvIoI6DrcOLP0FJ
         0pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514660; x=1741119460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=;
        b=unLEw2WAIxKmPO18IamKkWZ1Y4gt6SEWRuij+Fhv25Caswy0sszpF7++7xh44nSgSb
         kXjtbSMmUZpE61rAUnXdsVBJjqL+sjwWE+s/5WSIINWADmSKukDjTMW3GOsqvS7f+5D7
         9PPapFbT7eANtlKCuewxA3hLXhYUcyDjI8OVfYD2td2/HwNNTvf1mU9Z6h3/xAm+Uvwf
         6MDVlwMZfSc4y5wbJrmeLBQHRUg+gExXcF87sH3RQwtoD2Sqbi7i7bbwwpMi69zBCQnE
         o8Yx5YsJ9CQoZB76FWLSoFglVYnLxnvH3jrgmcel3ma5v+8C2jHEs0X1wWLaRKfRPtiD
         aiug==
X-Forwarded-Encrypted: i=1; AJvYcCWjs2w2BitM2P3Yl7vTET2qfcpzhH4xUooTy8a7Z5l/nsGkAxJxYJQcG+KrEjYDnJCDJoK4+lp1wQYyQlcy/ork@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2KdMlr47Rv3S4QzEWCEkfLgnK3Pks4h4YUJbajxv+7jzQeQ2R
	3WtaWv+/ITz2gwGxyEouQlxpSJx1T92qSyRzf5T0tW7iFzg+GjuKMvjICJLit3k=
X-Gm-Gg: ASbGnct5ta2fIxQGrelkFCeXspaB1VRlNGJ7IcFEdV3DmH8Gkt4PHNWnamK8v1WY5xr
	RfQNfdDDSY8o2ZHxovy2r1ZscGZjBTp/OEo1Nqpy6xdGisxdPyE+spD7tCuqRXAxlzD9rdjTHPZ
	y8r3laAdGjSMej+Ao9dDKgiYk4NNwOvOaAFOsmSSruWltnSk1DrbuJiavoa6gx0t3ZEMCQsiw0r
	FlEFEYxfz4KuZSqp/NOazWkYTUcwpbNjS+1c0JZCZAZcKTiEeVITDsHEpCWZKG8Uktf3xBQvEc0
	LU21MB9TDKjFadvZKqukjwfSPGBnQMM=
X-Google-Smtp-Source: AGHT+IEP4H83eueMuTFXJWlrHU2PDik7Lal5HqZTmunkxw5tmpnhf4TdWmcw3iZXzovmtEQLvNVBdA==
X-Received: by 2002:a05:6402:50c8:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5e44448118fmr4326163a12.7.1740514659840;
        Tue, 25 Feb 2025 12:17:39 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4518460dcsm1697685a12.0.2025.02.25.12.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:17:38 -0800 (PST)
Date: Tue, 25 Feb 2025 21:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Yu Jiaoliang <yujiaoliang@vivo.com>, Oliver Graute <oliver.graute@kococonnector.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
Message-ID: <ccjng5mrvqngfg6eujq6mtl6dj2sz5vsqvjoqz6gm5ntcibduz@wqoc6zhchrvv>
References: <20250225145332.1116557-1-arnd@kernel.org>
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
 <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f55raej2e5xwtv3g"
Content-Disposition: inline
In-Reply-To: <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_201742_975322_616A5E81 
X-CRM114-Status: GOOD (  27.25  )
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


--f55raej2e5xwtv3g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
MIME-Version: 1.0

Hello Arnd,

On Tue, Feb 25, 2025 at 05:25:05PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 16:47, Uwe Kleine-K=F6nig wrote:
> > On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
> >> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touc=
hscreen/
> >
> > With=20
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 30e5b19bafa9..014f033ef1ba 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -250,7 +250,8 @@ extern void cleanup_module(void);
> >  extern typeof(name) __mod_device_table__##type##__##name		\
> >    __attribute__ ((unused, alias(__stringify(name))))
> >  #else  /* !MODULE */
> > -#define MODULE_DEVICE_TABLE(type, name)
> > +#define MODULE_DEVICE_TABLE(type, name)					\
> > +static const typeof(name) *__mod_device_table__##type##__##name##_ptr=
=20
> > __attribute__((unused)) =3D &(name)
> >  #endif
> >=20
> >  /* Version of form [<epoch>:]<version>[-<extra-version>].

Hu?

> > the warning goes away and stmpe_ts_ids isn't included in the .o file
> > without having to add __maybe_unused to the driver.
> >
> > I would consider that a superior approach.
>=20
> Not sure, I can see how this avoids some warnings, but this is
> currently the only remaining instance of this problem (I fixed
> another two recently), and in most cases a MODULE_DEVICE_TABLE()
> entry that is completely unused ends up pointing to a real bug,
> where there is a table but it's not also part of the
> device_driver definition.

It might be the only instance without __maybe_unused and so triggering a
warning. But there is also:

$ git grep -E 'of_device_id.*__maybe_unused' | wc -l
231

$ git grep -E 'mdio_device_id.*__maybe_unused' | wc -l
58

Best regards
Uwe

--f55raej2e5xwtv3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme+JVwACgkQj4D7WH0S
/k74zAf/dGlacxqVy9vAqpyEEhNrerDYdon6jOL4XYedysGHXBDPOFK38QCnWC6d
19Lu/uVu0sftbAmTRLbUOjCAQ5sLlJLOYIsoeXm03OQ1u4DjDS12Xz43uphpMlBX
jl5NMQs6PApcy7z+KPjuc0mcHnhFse71fpWfNyCxN7l2KAIRkCRXqLWgZ8eJfeLV
pLvIN4/VkcCzIXXP7qLJrz4ZezjGkjvgxBaMVH2DVmkxHymmo0RycjP2QooDJAk7
S6iir9ZFD+UfFeujJBsx70rkrsJ3dXSGNn97DNiulacw7UwLU+aUxjs89g/DIsPA
9+qrSzSEFDXZZSOh2ocNUbgfzl9mPQ==
=d8EH
-----END PGP SIGNATURE-----

--f55raej2e5xwtv3g--

