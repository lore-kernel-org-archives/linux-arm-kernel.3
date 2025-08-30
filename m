Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2AECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdVeq+DH8Ok61ytouQu7G9Bwf3CEvXSVj4Eaz6xQmas=; b=lIxA+SGTyB9nR/eLuLBNZ5FBKD
	QGJ3LHBOrKDSUGIRGp+ZlD726mUZ/HQ6CX23w3V2XlKlcAPxiFau7mc3y1rIwzGO72UE7Jrz0R0+w
	R87IzDi30fmjEnwPNvdgb5xSU6Cg/b56aMBKD79s8IHS8K3MdxHIpUGFhNXFCsYgBCsQJXUfrJl1D
	D95idIdFiAm1qYImV6TFtCjyHe/dxZzsv+LZGJvnO5NJv1G032o+I9QdVQfQVAsUstX8lKYrWh5FI
	Bsz/4IJ5XomOhxR1EjLPEhYy82k5nqQpOdNj2zGZszIHp1C9KMlhvg4Vydpv5WwI/5slM9T74SE7p
	S+scDLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usSfM-00000008QjK-1QX7;
	Sat, 30 Aug 2025 20:59:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usScb-00000008QVa-2a1M;
	Sat, 30 Aug 2025 20:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756587368; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C80znvS6HLmQAR2Xqx2p569m7XK5YZhrcbQcKf/Yn94kJSD2gp1i0Rz4AZAC5ruC+LyUVfwavPbr0CNUuC9Ph0LaVbjwoxIt14uKkgCjit+yDbimkUj59ED/q9Y21J05sYFRnkRn0o4d2h6b52IAjM8lsct85yZdszmg0ntznvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756587368; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CdVeq+DH8Ok61ytouQu7G9Bwf3CEvXSVj4Eaz6xQmas=; 
	b=e5vzX8Chj+/Lu12XCMK5TohKDcIYhhgxnvS0ofRnlz9o7UpVmcyCuXGokdTN1TJIavEk4QVklmLfWMl948BnoPDR8CRaokzBhw5SFlpAl+hXDW8sDjxD4/aGMBn/Z8CEpYElmvMXXxyVUmNCbSPuFObsnO6Em4oXbF5JCFJLKAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756587368;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=CdVeq+DH8Ok61ytouQu7G9Bwf3CEvXSVj4Eaz6xQmas=;
	b=KpA68xaPVh5VW42eEhcQOtvZo3Q3fZSv+V5Dt+9oiUS7gwaqusjKNf2maGPpjrGD
	3uZBq/0EnVtpM6r7oedBPZYQcCFNtQJprZllgSAVLoZKP6CllbYgHqDR4KUNFHw0I/b
	ygIU22VEXNh59NC7KnzcHpwgqKvEiXsXx78WT0A8=
Received: by mx.zohomail.com with SMTPS id 1756587363738235.87912575851544;
	Sat, 30 Aug 2025 13:56:03 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C76E4180F91; Sat, 30 Aug 2025 22:55:58 +0200 (CEST)
Date: Sat, 30 Aug 2025 22:55:58 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
Message-ID: <vtpva7fgzwgde3sgtjir4ckns2yak7kmrumgccutwbupyqxyjt@zmxbatrhiaoo>
References: <20250824065441.3220852-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xhy3y75flbopwu4h"
Content-Disposition: inline
In-Reply-To: <20250824065441.3220852-1-damon.ding@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/256.549.67
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_135625_709268_536A9F22 
X-CRM114-Status: GOOD (  19.85  )
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


--xhy3y75flbopwu4h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
MIME-Version: 1.0

Hi,

On Sun, Aug 24, 2025 at 02:54:41PM +0800, Damon Ding wrote:
> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
> while RK3288 and RK3588 do not).
>=20
> It can make the code more consice to use devm_clk_get_optional()
> instead of devm_clk_get() with extra checks.
>=20
> In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ------

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>=20
> Changes in v2:
> - Replace DRM_DEV_ERROR() with dev_err_probe().
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..937f83cf42fc 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -335,15 +335,9 @@ static int rockchip_dp_of_probe(struct rockchip_dp_d=
evice *dp)
>  		return PTR_ERR(dp->grf);
>  	}
> =20
> -	dp->grfclk =3D devm_clk_get(dev, "grf");
> -	if (PTR_ERR(dp->grfclk) =3D=3D -ENOENT) {
> -		dp->grfclk =3D NULL;
> -	} else if (PTR_ERR(dp->grfclk) =3D=3D -EPROBE_DEFER) {
> -		return -EPROBE_DEFER;
> -	} else if (IS_ERR(dp->grfclk)) {
> -		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
> -		return PTR_ERR(dp->grfclk);
> -	}
> +	dp->grfclk =3D devm_clk_get_optional(dev, "grf");
> +	if (IS_ERR(dp->grfclk))
> +		return dev_err_probe(dev, PTR_ERR(dp->grfclk), "failed to get grf cloc=
k\n");
> =20
>  	dp->pclk =3D devm_clk_get(dev, "pclk");
>  	if (IS_ERR(dp->pclk)) {
> --=20
> 2.34.1
>=20

--xhy3y75flbopwu4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmizZVoACgkQ2O7X88g7
+ppybRAAnuprNlS3e0DxWGjBWmgQes7KWMOHGqPxrwx+w7DGlx8UwANysNrj+7TP
/WxUb7x9RoWqCkAQp+eZViVcWT9KJKwCiygwG8Y7Qs6yPOQF+totPtFOSjQjV5U1
seRfhDHhOBF3tlOE6lu1sdaywS8sDetN93iFsXVrPVIPXMHwFuYRIM/RSK9v3tp/
9kSs5cV7QqSAH1YPEVX3HKhbywFixMqld4EWpBz2/uPsS6jyqwo4FgrGoTfEoT0m
o+Mys/Hzl/LxueJF6gn0FC6FGUxd7Jwi5bvkq4Hlyubn+Bb0/ouZJGrhuo8JIpcV
W159aRLupmAb4Sh+NhPUjImDxjtsvoFCM7m64XUTxNsdxwFjEBujk84gYa/hjd9M
P+PZb4HeEzU66JUK/1scp0yGGnXtOM+ZIM186VwIgfGVtqgLmGGswk5Fl0wPZGTn
MqWMHE82iHMfWBOEhmIXMCLF5mOVwpFoFjcftc//2Ko80A27VPgCpzJcf9TXdJ7/
FrZ1PPPfGO1JCLIXRrfXU45OH45xkuZZK55BRyb8TaAzsJ/2tpPCjjcRyJp/znWT
GE2l+eWMNRwPGya3WhC4EOFyXmeTnfNtUhUa60XuINCfJjICM3P+dGtOrBS4lyM8
+MIwGalFj1Odm+lZeHbIQUXJSxVb0IF/Z2SPEwS/ZztVMsuEbAM=
=pWI8
-----END PGP SIGNATURE-----

--xhy3y75flbopwu4h--

