Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4000510F9975
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 19:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NdSV3WZrVEBftS6fL3YY5Y1mwljswaIR/qaM7Z9BAw=; b=UQhOOqr+j9HrKYYVw7w4YTO1r0
	cIbNVnLo83nT1NgVMGCxqO+c0b6MlbrOncVzdzYDkXNy7qyxmGRgmPO9403dewnJlJ4OZb1/39uXG
	VHyrCKJZoy5FZnEz0ATSGDjflEJ+Nm1krjqiH2YT2/ywtfP+DvsAJU5vfO7dhmI6ceYm3bH9/nnWr
	apMNzQr+vFXeaPZMwngHAwyrO8ewlfwBN1qUVjRq8/2x9drXNLjNqcSFnOvA8yzGEwetjD3ATnPia
	mNibmNjmv3wQnYF1KAhfFVF4UOL11l/pqP8IQ5UyPeNASdQq8NjSBme+vyJ9L3MUtffQy8H5iMXKX
	M2aiBfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYtk-00000009LM0-3x4x;
	Wed, 08 Apr 2026 19:49:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYti-00000009LKk-0D06;
	Wed, 08 Apr 2026 19:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775677746;
	bh=tz8CVy1W20G2fKkpZL7CTx9D5Goyx1D1bN5OlJng/I0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qquXjlNtlX/W3P6CQcrmMP1FqkU+bjHfmbSfGIBGRpjvE9TXs7eJEbMhfumadx2zP
	 mY6G+zfD+ZI8/WG6ATCuhO7Dh4aKG09f7RYHz6snWYizEcfTetq4PUYuWkP19iNFSz
	 yiBTNWkyL3z0wWkgM3rd5zs2/j4us+7MMbLuD1sbKDnSPGX9we83h1CMmS5sG/EyPo
	 uEzgTUxW3uxorkoiGuHIU3rSZGrVKpKJTXbgEpastF1neshWm34nLogGVlVAptGVDC
	 6fgYQ7+AMcdFD6dcNa9tKTlkIRBmApRXEEEkpm0OHGjJ7btq9bkxJlHoh/4moaDeBj
	 5T3WV+u2XdzmQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D225E17E0A2A;
	Wed,  8 Apr 2026 21:49:04 +0200 (CEST)
Message-ID: <16fecb553474b09c280e76d85db619fd2171d8b6.camel@collabora.com>
Subject: Re: [PATCH v2] media: verisilicon: Create AV1 helper library
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Wed, 08 Apr 2026 15:49:03 -0400
In-Reply-To: <20260312091525.28118-1-benjamin.gaignard@collabora.com>
References: <20260312091525.28118-1-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BquN7X0OQqwiN7U+0FMh"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124910_238889_A3922C69 
X-CRM114-Status: GOOD (  11.76  )
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


--=-BquN7X0OQqwiN7U+0FMh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 mars 2026 =C3=A0 10:15 +0100, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> Regroup all none hardware related AV1 functions into a helper library.
> The goal is to avoid code duplication for futur AV1 codecs.
>=20
> Tested on rock 5b board Fluster score remains the same 204/241.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> change in v2
> - rockchip av1 codec use hantro_av1_get_hardware_tx_mode() and no more
> =C2=A0 it own function.
>=20
> =C2=A0drivers/media/platform/verisilicon/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 +-
> =C2=A0.../media/platform/verisilicon/hantro_av1.c=C2=A0=C2=A0 | 780 +++++=
++++++++++
> =C2=A0.../media/platform/verisilicon/hantro_av1.h=C2=A0=C2=A0 |=C2=A0 62 =
++
> =C2=A0...entropymode.c =3D> hantro_av1_entropymode.c} |=C2=A0 18 +-
> =C2=A0...entropymode.h =3D> hantro_av1_entropymode.h} |=C2=A0 18 +-
> =C2=A0...av1_filmgrain.c =3D> hantro_av1_filmgrain.c} |=C2=A0 82 +-
> =C2=A0.../verisilicon/hantro_av1_filmgrain.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 44 +
> =C2=A0.../media/platform/verisilicon/hantro_hw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +-
> =C2=A0.../verisilicon/rockchip_av1_filmgrain.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 36 -
> =C2=A0.../verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0 | 942 ++--------=
--------
> =C2=A010 files changed, 1048 insertions(+), 945 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
> =C2=A0rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode=
.c =3D> hantro_av1_entropymode.c} (99%)
> =C2=A0rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode=
.h =3D> hantro_av1_entropymode.h} (95%)
> =C2=A0rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c=
 =3D> hantro_av1_filmgrain.c} (92%)
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_av1_fi=
lmgrain.h
> =C2=A0delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_=
filmgrain.h

[...]
=C2=A0
> =C2=A0	rockchip_vpu981_av1_dec_set_parameters(ctx);
> =C2=A0	rockchip_vpu981_av1_dec_set_global_model(ctx);
> @@ -2197,6 +1439,16 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx =
*ctx)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)

nit: The wrapper is no longer needed, you can change rockchip_vpu_hw.c code=
 to:

           .init =3D hantro_av1_init

> +{
> +	return hantro_av1_init(ctx);
> +}
> +
> +void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
> +{
> +	hantro_av1_exit(ctx);

Same nit, different function. Appart from that:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +}
> +
> =C2=A0static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
> =C2=A0{
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;

--=-BquN7X0OQqwiN7U+0FMh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadaxLwAKCRDZQZRRKWBy
9OVJAQCBHm061j2iSakJtpkUf3ehkY8lD427TC3hCZcwyNnOBQEAz7E+YilOtBy0
YD6ugaA0uvKYx6SYGex2GZ7c3rAPSQQ=
=FywA
-----END PGP SIGNATURE-----

--=-BquN7X0OQqwiN7U+0FMh--

