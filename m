Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E478CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 05:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c50mz8/OMleInqbX4ArLESamRXgTiGj9hU87miF2NLk=; b=Ux8pypQSynFC3nRjlIHuHrDWD9
	WMlV3TGjbHNu8CYaicmIkT52dZfKGpQbnkQp4sDmNVP2m1+sV+TksTAy5MBMLVRjvBGJnXX6SQjYU
	Q7hcZTapHfxHQ93RP1FgJvFa9XZ/8M9ITSZyxkPOfw4leaVx5QukVFEeWALB6623fQKe+MV0X8bn+
	jRfJ3xa9E0XBBZonvDHPpQd8vnMnMIen0Fm+4cQ333q5Sbwd6uhj/lKIS9yiAVJrIiy8LVQPjiFNh
	gMYbbv4TcIaWAY+HRvwzrngFEFjxNillB9JaImDqyhJZJhjveu2O29M1Zgl9Ar+6FPB92VuHCLfxF
	JtsbmllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7Ec-00000003NFe-3QWA;
	Wed, 27 May 2026 05:55:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7EZ-00000003NEg-3hOb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 05:55:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso97150365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779861314; x=1780466114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c50mz8/OMleInqbX4ArLESamRXgTiGj9hU87miF2NLk=;
        b=gooMPzC4JpI4wTK+COHX08nrjhJwpmg23G+xsIbV0oX6CU1mjTOBPF8ohT1as/bBlv
         1fRctc7l8yZWSWQIEHU1vfHNeWL0cxvvhrzcxuGcTCElDXsXNIvVhUSQYW5jCmMn1EIr
         pMsFjhMqRD4q3s4+uwr+IvL2rd3L3wcLO5Pt3Jpe/F3X3xKLIEVMgEN3v+y/MNkYijOJ
         tHjAWEyNAaXLOnqI0p1QO/P9wZ3DpMtxnSMNBnWhE5EeCywWecU1htZCcMqeE9MWuOIL
         cbSfyF7qnMMuLrIDOEL2BVhdAm+4xE9U7pEzIvdn5TibEmim2H8gjQYDgpnFYOcoEFVe
         29RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861314; x=1780466114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50mz8/OMleInqbX4ArLESamRXgTiGj9hU87miF2NLk=;
        b=YLhjgbG+dFVDuJCabUz/g2A7kQnVOZTXx/ygWzEwPxeWMA3GsnKkYZWzdXpFtG+/OH
         R84Mv92YCT5f7m3CErppMXHKvIB+023lqyppVE0+E74VwbFTWJHfD0pcTVqmC5Qpk7rf
         BCmG6oMgmhR4L/1eW8UlSh6qFVKpOjqreQHWUBDz+PbUjwtFPYh4fveOQdCydlxnyMk5
         hNGd3t5D9eRXclvXdZEXiRM7KzfHt1eW7kKQc7VZ08U7KjCw5p+9YxmRY1XhriyjVpqT
         1uLwTdmffEBV9YAXdmOpOSyqlgfal4DwcUtjxeN4XVeIVFpbrvwvSS+QFcb+e3+Igstc
         raWw==
X-Forwarded-Encrypted: i=1; AFNElJ98aKfgUK9bN1D9KAgoK3cQmlq1E0Nke5BHWm7zrAS2zx13+ljds0OdTtmBfbQb1KLk66IjCEG7YTZAjpeXhvRB@lists.infradead.org
X-Gm-Message-State: AOJu0YyY/+LF5ncQaA1AHECLLH8WQmrMe72Zwstb46+fVbvflxxdk/H3
	dp7m8S7QKFh1nHWGBhQW7DfIVtdQeHDv1wmBVoK2BXgJCA5mtT4e8tKG9XzqJwoWBkY=
X-Gm-Gg: Acq92OG5OeErWPxA6zYv8EQl7Tq/z1/zB3ortCkH3BsVPRPp/4i5lrQc3auzsElf8lW
	g1q7XyQJ1Z0JO/JE9WQlIUYDFWdx2S25/dQX/qkvRkiDcr5UZESuVR9sP3WkROvJ4UZUoKxMJba
	g15UO7waKtg7WeBd/4MSVvxeZLeMsuEEfAfAjWse6WQzTrUF4WyobLfSPo7f8AZ9sA+rctdpPIY
	PfeBjs8o0rwdHd7Q/HKJ3c17UKQQ0DP3HtuC0HddRKzdLseafFW9qr92z+6d6/sN/nMo+1CgKLe
	d+r/jFV5Sxx2UIo8A8vu96SQVfPYgDOBNVFNpsvAsVbrvUx6uhwuShoELfzsg8CyLeBoKjOPKL0
	ShcsOFmNjsvbgOWDDociqgBrayNfjythzPcsKA59GYoArqvgZ3UCgwVMqyV1cmZ91tlRtujA7Ih
	2HZ2VeM36jHD2SWEX5Z3l0U3AOcgzHQnP45pjsfs1yDlLgtGJGal5cNH0oePWFfklpSjcJEW7Ao
	0g5n1h68I2vjgI=
X-Received: by 2002:a05:600c:8599:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490424acb4cmr286306315e9.8.1779861313464;
        Tue, 26 May 2026 22:55:13 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4907e69dc39sm11042195e9.4.2026.05.26.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:55:12 -0700 (PDT)
Date: Wed, 27 May 2026 07:55:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/exynos/gem: Fix printk specifier for gem_object.size
 and dma_addr
Message-ID: <ahaGfhW81fcW7h2u@monoceros>
References: <20260408064936.1342321-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="matup4lkrscj23am"
Content-Disposition: inline
In-Reply-To: <20260408064936.1342321-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_225515_949481_F32BC426 
X-CRM114-Status: GOOD (  25.72  )
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


--matup4lkrscj23am
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/exynos/gem: Fix printk specifier for gem_object.size
 and dma_addr
MIME-Version: 1.0

On Wed, Apr 08, 2026 at 02:49:34PM +0800, Chen-Yu Tsai wrote:
> In the recent change to use the GEM base object's size field instead of
> the exynos_gem object's additional field, the printk format was not
> adjusted for the change to size_t type. This causes a new warning on
> platforms on which size_t is not unsigned long.
>=20
> Fix this by using the correct "%zx" type.
>=20
> While at it, fix the specifier for dma_addr so that the cast to unsigned
> long is not longer needed.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604081331.jSJQSVmg-lkp@i=
ntel.com/
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is only compile tested. Build for ARM 32-bit confirms the warning
> is fixed. Sorry for the noise.
>=20
> The commit hash used in the Fixes tag is the current one seen in
> exynos-drm-next.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index d9d42809a1a9..f264e170bc26 100644
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
> +	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
> =20
>  	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem-=
>cookie,
>  			(dma_addr_t)exynos_gem->dma_addr,

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Still fixes a build warning in s390 allmodconfig builds as of
next-20260527. I can haz this patch applied please?

Best regards
Uwe

--matup4lkrscj23am
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoWhzwACgkQj4D7WH0S
/k4YJAf/Sa0klbijQQ3e2afYyNHdRBpeOnuHnt7DkXbXMETQbXPOVvHKTlQXDYOk
j8FttwSGQyKq70nn3di59M5IaFgKtvg4ZH+9ZdN86PBdvz1vYjE8YOKpPQo1NvaU
u71+tkIZr10dm4lqwrFQOLz9wKtVpGWcwLOJOx35dE4AhqDZ2t7d4qF9aX2E+M5K
nSCcuxYGYW9PQ3JOqjhP2DYAkFspPYKTF8ekZiEoPBxYQI8AQtzanH5urgTL5yPD
MMLOIYjAeD1LxDUfUx6uxATzDvYTSAA0ZG8iuOIAALaYa5j3M0GlQGeOZotyr9Pi
NWZH725YiRLgpEpNRqbc5hhIji3Eaw==
=AuW5
-----END PGP SIGNATURE-----

--matup4lkrscj23am--

