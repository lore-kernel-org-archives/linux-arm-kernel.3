Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E728CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGlzclWAPvmV9l90+X/3UL+TEboVyGRPeZlBqSVtL2g=; b=fodG/UYZOTxi0RJkKE14m+HLj2
	ZxIJaW4TBHzwRFT/OXjlYJamJp/DyPmSzQB6HMkRcGN18gDO8Q2AShvQ0pH+m0n2W6moF+9QG7zcw
	W4crPpeHozFbO4dryViG6L8MURi0QQSmFcDqEGnk0UAycyVpAofO9CW23NXlStvAb01hL71EoxSxk
	Jj4Z11sKdTeXW5bjShHmyxPqm3XUJXNSVU2sokmHMhzsq1SadQNzU89StI/xg/gAuuJVDKI3AR5Wu
	yG0erQRr+JUibXvXRPEdtG5BGzbrz/MzSUgwOI+5oyfImdyFEQYUxhKwOpCniYzKFpPxSdeKu86f4
	y3zdD1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjLb-0000000CRPX-0203;
	Fri, 02 Oct 2026 19:55:11 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjLX-0000000CRO1-1dQL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:55:09 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-52fb766bfd3so68311911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790970905; x=1791575705; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sGlzclWAPvmV9l90+X/3UL+TEboVyGRPeZlBqSVtL2g=;
        b=TAWnRCwLvuEy27OXAN3dAkTJtIC7quwbbbqRnKNfY1KV3tl3Dl7T3BzomsOkCacpKn
         B+N5YGKtIIMwKwZic7XxnyJW44ZAq6Y3lJ45PldK8J4gD4nFjNdmlkbpZfBG/1eU/jg9
         UN75Xj53jVCPzg2+XFOyetCT/AjidrpZdN/QR6d618o8DxyWqGNeufJJEXsO8ZUrUSCt
         M0rWVQlWfSBmvBeLlN4MtRKIMRof9D+mLiTdY3cZL+YbFzpGxzHmWkb3BTrsQiyyT8X9
         eCDzE+hyfk59eMEeOG7smKtVgZQod8sRuW9YFYXA14IqDsys+aX2jcG2HYbQP6V57GRx
         i10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970905; x=1791575705;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGlzclWAPvmV9l90+X/3UL+TEboVyGRPeZlBqSVtL2g=;
        b=WjksTsjseXoQZfWwSRuIeHs1yi5mR+eZYUih+2U6GRXe2QLhB3HzzrmRYhL3Qx9AIj
         BcvOHfW92dLgy3Q0qdPa16S/FPV8vwQ33Xo+Jf0A5i1b15yfrNHLXF7WsUj250DRcyA4
         Of4oLVXik7oAjewoplDGEIWqhk7g2G8APruYT7GlvId+bijSyQE0JdRu0oj3QpiIkdv6
         GnrdKXJ0mkG2FNiZXlii7lSQsUbOg3RhJblQhkO1ouflt9LqAFvJdaHG/bVdxLavVvaV
         DbEd3hAGU3aW2+pCPC7mJaTYpTT4Z+00sAY6wP3W0hthCAh1P0uLKB9x6DraY0QeDMpK
         xwdw==
X-Forwarded-Encrypted: i=1; AKwUvBxsMktRHVKBY3kI1Ddj9G5YvfkUISJn0ZdH94aLYqV95tMdIYrtp6f2KHBbxzSBagmRt5S5Z+JjFr2KOfBPycoX@lists.infradead.org
X-Gm-Message-State: AFuF++k1+0EfRCimR0A/nKTvRMgxsK6P46+d0lHOj8LQlTgguSkvZtnw
	Sz+esmlDs223Afmcn4k5WYoKIwHyfDCMq1TvsmocmbZYI/bgxdUQA1lhJhSPWLO4fIw=
X-Gm-Gg: AYBFou0ASoAoxjEHlplh+q8RC3aBK3kOON1FJTTsadZSZyWlXUEb2Zf4F2Wwr6Zs+Tl
	n8N3ziH0fqAXUXjR93nGw/Wc79qV9qdZCaaL5CSLaJQhkz+YMPCPZrkyb0hgkCkvVft+pWeAuyV
	Qjn+5zGtX7IGOUqHf+5A0qScaa5kqSEKbcM5tEeVZe7Luam8kSAvdQaMqkOl3/LvdwnQ52hBguV
	rLQWAj6n93AMNWpUZIp1sYR19c2pRJt2hvHvjDqC+FV3TVA2g2vDeQcgTzMObdOCc7C55De0bdx
	jFjLAd0nZbN+JQsjdbqK4RljnDm8YEjBRLjUN1mTE14OUbbCaFsFGJ04K/f5CzKNZ4JgRkSASzY
	CFKTcQWkQwNXrO8jdc7cIe0YRdvx2XENoY1N5QjQW5Y0i1cp1WkDczQkhxnuWVp6waxzZf5nuaR
	4W9sFnh0vW+ZVA6c3C+q63hEqih/FGjLF0RgmdvVF0K6PihVXdUXOeGrP384B7Qj31EluRmoQnU
	8aaOuQdbVcqt54EC1kQfinC
X-Received: by 2002:ac8:5d8b:0:b0:533:1038:ad50 with SMTP id d75a77b69052e-533d9587585mr69965091cf.45.1790970905305;
        Fri, 02 Oct 2026 12:55:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b6b636sm27285076d6.26.2026.10.02.12.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:55:04 -0700 (PDT)
Message-ID: <aaf70162b2f8353d198e4f0a0137574b9963870d.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rkvdec: Switch to modern PM_OPS
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Detlev Casanova	 <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,  Jacob Chen
 <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 15:55:02 -0400
In-Reply-To: <20261001173610.158931-2-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
	 <20261001173610.158931-2-diederik@cknow-tech.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-u687AWLeNGHFAtWYehS2"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_125507_576999_FE1B9C96 
X-CRM114-Status: GOOD (  21.57  )
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


--=-u687AWLeNGHFAtWYehS2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 01 octobre 2026 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> A new set of modern PM_OPS macros got defined in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
>=20
> Switch to those new macros so that the PM callbacks are always seen by th=
e
> compiler, but discarded if not used. This lets us drop the check for
> CONFIG_PM.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..936abd92f703 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1877,7 +1877,6 @@ static void rkvdec_remove(struct platform_device *p=
dev)
>  		iommu_domain_free(rkvdec->empty_domain);
>  }
> =20
> -#ifdef CONFIG_PM
>  static int rkvdec_runtime_resume(struct device *dev)
>  {
>  	struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> @@ -1892,12 +1891,10 @@ static int rkvdec_runtime_suspend(struct device *=
dev)
>  	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
>  	return 0;
>  }
> -#endif
> =20
>  static const struct dev_pm_ops rkvdec_pm_ops =3D {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
>  };
> =20
>  static struct platform_driver rkvdec_driver =3D {
> @@ -1906,7 +1903,7 @@ static struct platform_driver rkvdec_driver =3D {
>  	.driver =3D {
>  		   .name =3D "rkvdec",
>  		   .of_match_table =3D of_rkvdec_match,
> -		   .pm =3D &rkvdec_pm_ops,
> +		   .pm =3D pm_ptr(&rkvdec_pm_ops),
>  	},
>  };
>  module_platform_driver(rkvdec_driver);

--=-u687AWLeNGHFAtWYehS2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasAMFgAKCRDZQZRRKWBy
9FScAP9oQFR10NikWDA9nu2Dfv7rKQ2BsngLSDea0lYtTWwcEgD9HVcbeQIF371C
sm9RTJ7S2Z9Gr+G5/grG+QsiqbS/kws=
=Ce67
-----END PGP SIGNATURE-----

--=-u687AWLeNGHFAtWYehS2--

