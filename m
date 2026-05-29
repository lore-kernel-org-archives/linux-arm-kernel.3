Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B388CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwrPCj2IqJEcRJugk6Ecz2xdcmK5e89mwdODai47RFE=; b=Ppr7FvmgBWwxrOD3urClots2iF
	4zuisqdiviXIw1W3ysvtgTJMxte6L5seQvtuvYDyimX99Nb+wW/jQAVnmYSIbJANRLRww4HwOgyGs
	gOihrLIVG1yQ1HAVrdsySLRm7XcKlIX2hQ2bffNYiQ5vWrVpp+RiSXNBeWViBJdMzxego5t3jm/+C
	jAV25jHPct/6JgNtgyliBxmaRJ1601krJx4dLavnupv8n5gdqSJ4s/ECpazDF+J/hROaj8If0nwbY
	mk6R7zbC09K6Ipv8yycv+lf4J9Fh3dEGx6tXyH6nQZi0l7ZIbd+qLQoBYzDw5s2pyu1XDRcVCE/Yc
	9T6vvTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSs3d-00000006ukq-3HWF;
	Fri, 29 May 2026 07:55:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSs3b-00000006ukG-0Qf1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:55:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49050bfe053so42132055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780041301; x=1780646101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwrPCj2IqJEcRJugk6Ecz2xdcmK5e89mwdODai47RFE=;
        b=R1DrLtvQyryI3xiSBAm1RQX+7bE9R6KeICRyGEDzP9anauwvvFwMH4/17e6sQo/BTJ
         72l0za40nfd1HuqzwmJDaaRRcdRtPFNKN4PkT3ZOGavjuG+D5nb+7ow6MNLzJsslP1iX
         CdzSk9sd0hVC3mbSKlU36bq6FkU00zxCPi/4+CXU4nW99vb70HlwMtrOsA92suqmwmtv
         O6NbJys5fMdjsiXja0Ln99BpY9twyZ3CJ6mw7LbEoymb/O7+6u5pBJg4YPrI6OJY+txM
         qIwoCVDJl0GfKMR5pzZhHOdzLXv/ROiFvy10dxur4DUvq5MoToMZXucZds3BH9F5Z+7w
         IYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041301; x=1780646101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwrPCj2IqJEcRJugk6Ecz2xdcmK5e89mwdODai47RFE=;
        b=lggwLZfhpAi27zfBvBql4/3UkfEM3Wx4XdRSj9KgkVWFW+HlhZIAXfX2ZALytYyNCX
         Zg0SmHbxi94OS/xDi6OnK2MwWLvaN5bO+o1SZxdHOupFu5LkJ0D7v9gN4APaFnoQzgOw
         kCd3DMzMiKeK6o1Tk88uc/WPd96Gr6VnarUYyDBwfQzbVxFmbI1GSWc1d5LK19eoa6/H
         oKxm1NdVRDgA1/UC8gGWFT7LCdCPlZgUp0lKVwMtUygh3lohF5Z4yz1GL5Ob1oR7+F4z
         PKfngz7Q6OY8i4ulGY+KmJ6mpxbCJRmLyLU4LXyh5BwQDvMsg5iLO2T8mzxdCMHlz6fJ
         wSog==
X-Forwarded-Encrypted: i=1; AFNElJ83VM0NJy06jgL3dB0rxtMfOM8M3mJ3ZF4DmBQF5GfN4Jw8VWCSfktx5VEFJhIKtmPTqnZuSMDTuWLhCSi73OVh@lists.infradead.org
X-Gm-Message-State: AOJu0YwYeKVZOzSLMApyJHcq0Sk0Q3KLl61KTvp3v0DEzJJcQagT0Nol
	NL+lgQYbSCMZgZxkB5/gCd9bC+CHZqMI+6uXc4QPYInYpOVIMuoE+HuuhVSN3eZvVzo=
X-Gm-Gg: Acq92OGQVQaLYHUTPBlwdJDAsduDWhOJwfBgpFQXoomynLe5Dn92PPA9R82UHh1q/U4
	9X2MQgUEUj3VSwi2/vpKIZXLvV/USZLBnmeOupPHSGueuUAi5BlZe//CliAv9YqFAUdl2nlB6n1
	WVbRGS3aLLBQOtGm9+sBSypM2Cz7oCTKnb3d7lzhDcNMULGLNh6fCwO0n8xGwQfBlZ5KRebloy4
	H6mRBLj6xEJdu3Tjh4bHwtJ33ZeAPDhXMlOngitviXNf2urmgEJ86PpO3c3H8RyCJOXNUxq2Y4Z
	THfH8gqYqGuX3XYHDVgiqyGeL98jYdfjgmZtcwnQUFEwfSsDj7P31FOvMMmMcD+BJCQDW9b9V/P
	0bD/6/5KyZmXosfT+sUIR561h0sLNrdjvcjrvo3rnKindCTeAzvEro1DC8MaFYyfKQAGfMTPi0p
	b+QDBgPkvf3n8ls7yF/qjvDQYGmHMpmA4i403Gt8M5KvH8rKF9ruiuwUYMXMcxUReFhzZgjfP5r
	+IT3u8Z5HGYFis0/kxtkQ7PaBFR54SaLHQT
X-Received: by 2002:a05:600c:4504:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-4909c0b33fcmr30600785e9.19.1780041300797;
        Fri, 29 May 2026 00:55:00 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909ca65f54sm27221465e9.5.2026.05.29.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:55:00 -0700 (PDT)
Date: Fri, 29 May 2026 09:54:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: fix size_t format string
Message-ID: <ahlFfp-kIqpdPGZd@monoceros>
References: <20260527194525.45762-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jnujdylfqv2kbd66"
Content-Disposition: inline
In-Reply-To: <20260527194525.45762-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_005503_175488_812CDBE4 
X-CRM114-Status: GOOD (  21.26  )
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


--jnujdylfqv2kbd66
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/exynos: fix size_t format string
MIME-Version: 1.0

Hello,

On Wed, May 27, 2026 at 09:45:07PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The exynos_gem->base.size argument is a size_t rather than an
> unsigned long, so adapt the printk() format string accordingly:
>=20
> In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_bu=
f':
> drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expect=
s argument of type 'long unsigned int', but argument 6 has type 'size_t' {a=
ka 'unsigned int'} [-Werror=3Dformat=3D]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx),=
 size(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr, exyn=
os_gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
>=20
> The dma_addr in the same line is already printed using a cast
> to unsigned long, so change that similarly to use the correct
> %pad format.
>=20
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 297a93b087cd..8e357f2beb9e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *=
exynos_gem, bool kvmap)
>  	if (kvmap)
>  		exynos_gem->kvaddr =3D exynos_gem->cookie;
> =20
> -	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n=
",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
>  	return 0;
>  }
> =20
> @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *=
exynos_gem)
>  		return;
>  	}
> =20
> -	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);

Inconsistent formatting. The first hunk used dma_addr(%pad), the second
adds "0x". Chen-Yu Tsai's patch[1] was better in that regard.

Best regards
Uwe

[1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.org/

--jnujdylfqv2kbd66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoZRlAACgkQj4D7WH0S
/k4uLAf8CDNBSWkI/8nW1u/hhrBYD4t2URn0LO0re8mpGRHjxAyA2ted0Ag3jvDa
8F55jr1ySezFOkOTycAdA+yW6AiferDGR6YbeeJURQtgw6/OR0QQ/iHO+PC2ZyjC
9q6ls8fHy2K99TM2nwUh2SjbucVfCUhCXYL8iK88guLXcWdOfAyFJMT5Q1iQEhAU
qW8lFER+hwe6VMeTZQk5CyqPhsUcYz0Pt+qVkGs3hOBbIL505NlsnPzSDgsE6kC/
GnmGyW63GGoVoyA6J1C6ybt/geR4ilr12gm+rZqKDU9Wydfwz/kfmA3sc5JzWVZT
xF6rNWt7febUyDzSmbvzndFdKi1DcA==
=vHrt
-----END PGP SIGNATURE-----

--jnujdylfqv2kbd66--

