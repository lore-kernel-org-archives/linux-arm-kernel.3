Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15E7D30CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KN19c29cWR/ZFcZ1ULan+V5dVfqzdATU9lfrb8o3Ys=; b=IznQYqr19vt1sTEb2xGyQVTT/S
	zKGl979ECttVXrd1QWkHT+rmR1PKor8QTLOxtMo2Xat2Pb44G/GCSj5tvPit39oj2KNTcjd2p9W/D
	nzOY7UazuepknRJFHCF++6ZC8p2lk7YcO7fk62DIChbo5uMbGSu135Bf9XLgjS8seGjkvOMkYFekQ
	r8TRShN1B5n9fCcZYqA4MB5BwqftEcdRR1lOAgJJUrQJ66HUZX+fvISwxd0eL7ybPjQT6S/02WHuv
	7KBbqawnIEvkQjoc3UyxToNFOiet7iefNYiod9YPws4EkGSTkjdGT8a5ZnGfb/5ss03N2pBnZbJR3
	Duzw2vSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm5J-00000007lYs-0ddf;
	Tue, 13 Jan 2026 21:37:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm5G-00000007lXz-1u69;
	Tue, 13 Jan 2026 21:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768340257; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iGNwv8yUfTLQaBvUuVLTdwi3n4HUNZcg0fy9DwGdGFMvQe+HcL4NYFmjuWVYfacM16XS7yOIpXasW3anCw0IgcZK/ljO+TWHoWTcKmI/QKm/tbpi//WkFmyHl8Wn9omfQiKjNboM/jsTSNHzV76tTUx5i1IRCxwumq6hx9qnNQY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768340257; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9KN19c29cWR/ZFcZ1ULan+V5dVfqzdATU9lfrb8o3Ys=; 
	b=ec71Bx/nsUH+UmLLV28VW1RjmYTMo+dqPVdBqFyidG+VZ4yt/cvf7CtHq2YDAxAaw+pF3sQ5fO6QSuoO+kwlwPrtIAMWfO6Opyb0Aun7s5kZ58ah6VwRiiW8147/6SjCdN6rvSbTLbdlMO+Dapp+xQTNl83DFshCcTiblhUPT/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768340257;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=9KN19c29cWR/ZFcZ1ULan+V5dVfqzdATU9lfrb8o3Ys=;
	b=MS5czSKF1MOYud+jKCOR8jDlvOTk+qJgMrKB5bAhoR8GUS6MMt+4Wc3ibDsKaf5i
	OAUaUaInYk/ujCqCIeNXHH3MfD4q2Tti7MPJ5/tRnX6obG9NBVKzZzew7rcJfSnG0Sp
	9iFAFqTvzQvC0IAuU9Qe58xOZwnVuwcO2U76ATdk=
Received: by mx.zohomail.com with SMTPS id 1768340254235436.27456206601244;
	Tue, 13 Jan 2026 13:37:34 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id ECA46181010; Tue, 13 Jan 2026 22:37:28 +0100 (CET)
Date: Tue, 13 Jan 2026 22:37:28 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
	Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com, robh@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 3/5] drm/bridge: synopsys: dw-dp: Make i2s/spdif clk
 optional
Message-ID: <aWa6_SvvtGXRnbyh@venus>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d5klvf4s3oaeclto"
Content-Disposition: inline
In-Reply-To: <20260109080054.228671-4-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/268.322.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_133750_717114_48A5A590 
X-CRM114-Status: GOOD (  17.55  )
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


--d5klvf4s3oaeclto
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] drm/bridge: synopsys: dw-dp: Make i2s/spdif clk
 optional
MIME-Version: 1.0

Hi,

On Fri, Jan 09, 2026 at 04:00:46PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The i2s/spdif clk are mandatory for rk3588, but not used
> for the upcoming rk3576, so make it optional here.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index eccf6299bdb7..93e3efe18957 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2014,13 +2014,13 @@ struct dw_dp *dw_dp_bind(struct device *dev, stru=
ct drm_encoder *encoder,
>  		return ERR_CAST(dp->aux_clk);
>  	}
> =20
> -	dp->i2s_clk =3D devm_clk_get(dev, "i2s");
> +	dp->i2s_clk =3D devm_clk_get_optional(dev, "i2s");
>  	if (IS_ERR(dp->i2s_clk)) {
>  		dev_err_probe(dev, PTR_ERR(dp->i2s_clk), "failed to get i2s clock\n");
>  		return ERR_CAST(dp->i2s_clk);
>  	}
> =20
> -	dp->spdif_clk =3D devm_clk_get(dev, "spdif");
> +	dp->spdif_clk =3D devm_clk_get_optional(dev, "spdif");
>  	if (IS_ERR(dp->spdif_clk)) {
>  		dev_err_probe(dev, PTR_ERR(dp->spdif_clk), "failed to get spdif clock\=
n");
>  		return ERR_CAST(dp->spdif_clk);
> --=20
> 2.43.0
>=20

--d5klvf4s3oaeclto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlmuxgACgkQ2O7X88g7
+ppGLBAAqT8y4oYvP9cg1uT75YXkG+/k9/iLZ/QVqmIa8OcIJxad5z43b35ZiSpt
lg6lJ1GTGaHluaYFv39FIBnjXqxGhK1vzUcEyOvy042MKciDr01W0TnlygyuvKOc
5ZYwnRBsSRNQA3PJAakXWaAuBlNh/KX8tH9kh5Wn3sf8nNpBZXDodQzZtUTMft6+
OsWF5XgzMPXsTDTs6CjxV5Ym9wXjuByZEf+HNOE6rCFPgYXuDUurcY7o0lKHW4Lp
1RfJ71u0YQfEXWduRilRTqVLbAUHJDOXjuHMgno2Qw6SzLeBy68gkiiz+LJjY5Bx
dEwQjP65nprz1enbT35aKwrfoqcwKD/HdxplVyj7nOVpBEgWIxfkFijAev3z6cVO
ZxZtF9Yx7H/v+zkhQ+MC2Fu3g/vnCLiQqRV6XpcOM4g+eE9gGBFKniIM5Y6jwaAu
IlYoElfj2NHoRUfODaN/VQ1dYIgP9db3APMZGYzPHevi4AkQnxCaXjoqF3wAX+Aw
Ugks43CsEzeIXXYnlsMSpwHJd+iwxaPq70VruPwn0gaTGIHwZWvByhhMtbAuTrgB
PMzDGCGJV8n7IQZCoGyyoJb90fFFemBHwkz/pqlKq+NGRh2DBqUGiWUgIzDW2Stl
VSY4OT8h1zTkNus7WDJBEOCSxiuSXA6peCY3OTZ+EvB1CXmAUBQ=
=vKk1
-----END PGP SIGNATURE-----

--d5klvf4s3oaeclto--

