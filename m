Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859D7CA5FE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJl6vN2DYWl5SvECY/MNPFkAoXMpLzutrBdwcjZxYRo=; b=1zB+zj38SWY5oaW4PfMlHWXgX0
	i4GQheDObfeJwaWkraGtsud1tMkm9TnYlpQtSkm4xqgRc/I+Pf3eiewQckbcfM/GBdI4f+PR3DiTF
	Fz6xJUglNujtQbrLWItJqPFMKCDbHuk8y+ipSHSTiw8mDEpo27Eo9ijuFphaNK1pkKTUUaWBgWhWI
	NVHgZ3GOVp9ZTbYXBQrH0itMGLKHtK2JiHtQFo6HJXTOLYiHZq2rx4GKdzLj1AIXWwR+KxSrBIMro
	EM8+676Wt4EGKhTIbE/U1QWaXh6+EwxCwW7lsk2Ftpr8VwU7hIgfHrEGiGT50W5XktWkEy4umaVWh
	mkM6JI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjMr-0000000CRaX-0n6N;
	Fri, 02 Oct 2026 19:56:29 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjMo-0000000CRZi-2Lcb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:56:28 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-917a9f42283so1665996d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790970985; x=1791575785; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NJl6vN2DYWl5SvECY/MNPFkAoXMpLzutrBdwcjZxYRo=;
        b=w9tBRVAy0FuRGTIdaPkuqDgiTcORaxrjbuBzgnahYpYoUbuxc1+f2nPOlM5zClYqvr
         Czf+lCtTih7PNMCPd3aBbxgszPwL6eChHxEQwSO6MhvhJuod7CXVBZq27cLBFbc7aEKN
         5SSniCbCkd/Xw78DYQyOguGfpsf/4HUwOeV8V+hk1j5bs4a6hxNSODFP38xa1vnuQ84G
         pHwgbOadaM4BVOh4UM0J7ODDtpY9mz9hvjTBh2M15HH6xdANysY63a6zjS+RNeVBEMWa
         Ivp42TCw3SV5B2ksTdC6Wi3PtMW+M1ka4I9FhCBr68PDk65UE88UNLxg2ronfQ2Ymcyy
         PF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970985; x=1791575785;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJl6vN2DYWl5SvECY/MNPFkAoXMpLzutrBdwcjZxYRo=;
        b=wwenUQDFzQvDqMjxYJtlxLot1tWfpNuh120aKda2w5brFMY0e5emfTTsBbP42BqIrn
         X6RARSafR7AIqf39cN2yZ9vfXhyApyfZqnkqzZ/3U9/fgUkqmWE5kgUYLZkqI8SuL68Z
         CzUmNkrK0u7Du8u5U5fdbV+AdHqTsUrYBMbfEg6rVJ7qjaC7YxtWZpLjz565Rx+4OdLW
         te53/wdGx7FIIPPbSwL+BxAqeHsaaaWod9uFZ//X/cJwlCpAuXg55Czadun1bU2lZ5z4
         WtGHuCUamNOzQM1yIa+MTOoX9sUz/uU76kAbQzA+oaprsnv/kYAdktxHZB2lrrFLjVKI
         keCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIo3GgCI0HGquQFDrUeEQJ32WoTuPLOwb0EbcmfrdK7KFORmE4Z2fyXcHubz+YRz7L3JZqDS9QQdfz77r/QPn4@lists.infradead.org
X-Gm-Message-State: AFuF++lYUcczS1s3rLVI5rhGf+lytq/LyFdj1yEw6xovwBR35nNOHYlF
	L0Gj7IyvxtIEuUsZYdCsIuzaSiWe04o3ZngkRdnJiMP7evukSi8vLF9gyDq62AHUKdc=
X-Gm-Gg: AYBFou0XNh0W2LqVWWZ617Zcne62kNkkUGTFi1vGH19M8VdyjDPKwWqDtXSXnip4YK4
	dCNY6J+BCyfGjz2SSZ8I0RWotxvQQMmjqi2SvHlA98HapQDChAIpZeU1hChWZE9nIBvjTb8EfDe
	gYG+g74vllN+SnMkiQ4sqETZ7yEOOdDoMRj4BPGHWqa+C5F8PSzjuDaV71oGb8tI5aitGOoNpSR
	HAkvg6wTGHNPGAoQ19jvpmMR6Ep5n9Q5u21z1S2Dc15RqDIaz0vJ1b/YAtbe0eMc8EzSizLfrV7
	20wiwPubdQG60YEt+TNsj/yDtgiFwTr7jFrI/ubCuqBKA0/30PcPZT3F6J65LzYUlS6Vhd5Plbo
	iq0oQ6zEsFBeZWn7DQp6PQ8eyHFuotvOcYjo86T4Vc2YZbUtHNsmHVrbZUTzMz52SabMI89PG9q
	rmVhpPTWjUuI5kfqcagLfBpbi24iH1p1DWluHyNqEE9IFQiK1l1VA/5zuz2/hiCVUSjVFewg7I4
	0pBvhtum/p0bQ==
X-Received: by 2002:a05:620a:6413:b0:93c:b766:2bfc with SMTP id af79cd13be357-93e50fa6a3dmr87378085a.17.1790970985078;
        Fri, 02 Oct 2026 12:56:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c17b8esm27137276d6.43.2026.10.02.12.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:56:24 -0700 (PDT)
Message-ID: <a153b350bdfd614b4da5a15da29079eec7fc4dd4.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] media: rockchip: rga: Switch to modern PM_OPS
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Detlev Casanova	 <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,  Jacob Chen
 <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 15:56:23 -0400
In-Reply-To: <20261001173610.158931-3-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
	 <20261001173610.158931-3-diederik@cknow-tech.com>
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
	protocol="application/pgp-signature"; boundary="=-1Mpu87nLgk5Us+/k4nVo"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_125626_920481_6FF57886 
X-CRM114-Status: GOOD (  21.83  )
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


--=-1Mpu87nLgk5Us+/k4nVo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 01 octobre 2026 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> A new set of modern PM_OPS macros got defined in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
>=20
> Switch to those new macros so that the PM callbacks are always seen by th=
e
> compiler, but discarded if not used. This lets us drop the __maybe_unused
> annotation from the callback functions.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b3cb6bf8eb86..f28c93d63760 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -883,7 +883,7 @@ static void rga_remove(struct platform_device *pdev)
>  	pm_runtime_disable(rga->dev);
>  }
> =20
> -static int __maybe_unused rga_runtime_suspend(struct device *dev)
> +static int rga_runtime_suspend(struct device *dev)
>  {
>  	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =20
> @@ -892,7 +892,7 @@ static int __maybe_unused rga_runtime_suspend(struct =
device *dev)
>  	return 0;
>  }
> =20
> -static int __maybe_unused rga_runtime_resume(struct device *dev)
> +static int rga_runtime_resume(struct device *dev)
>  {
>  	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =20
> @@ -900,8 +900,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
>  }
> =20
>  static const struct dev_pm_ops rga_pm =3D {
> -	SET_RUNTIME_PM_OPS(rga_runtime_suspend,
> -			   rga_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rga_runtime_suspend, rga_runtime_resume, NULL)
>  };
> =20
>  static const struct of_device_id rockchip_rga_match[] =3D {
> @@ -927,7 +926,7 @@ static struct platform_driver rga_pdrv =3D {
>  	.remove =3D rga_remove,
>  	.driver =3D {
>  		.name =3D RGA_NAME,
> -		.pm =3D &rga_pm,
> +		.pm =3D pm_ptr(&rga_pm),
>  		.of_match_table =3D rockchip_rga_match,
>  	},
>  };

--=-1Mpu87nLgk5Us+/k4nVo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasAMZwAKCRDZQZRRKWBy
9Nm3AP4y8JqQZKv9U0OttedqiWp5M0Ofbzvm9AyImGL7/X3BggEA6Av0uZd+Ipgu
Sn0DcrUr/Ux6st7B3vMRPFDOud8b9gM=
=w8WG
-----END PGP SIGNATURE-----

--=-1Mpu87nLgk5Us+/k4nVo--

