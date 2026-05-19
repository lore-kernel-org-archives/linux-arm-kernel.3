Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D811CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GearOUgNerGM6yoZiFO1KIeAfnbYeqrV0kDSMPKhjJ0=; b=pHOOy1Nsz+UITwXTF4bUDmZCH0
	5OgjDXJkDpGzFbSZfcxHr0bTTNHPgTRWI2++N4YdYH0+vaEB5RzXpyWjP6g7N3PDeWv2zNywX/rXW
	IeQ6YvusQmWRmfhztTy+iBpy1J/ebPr8EEdJGjCZOQbMofcfvl/3LkXnFO8bP22ZFHmUGEOsDbkAx
	cEdW5XT4Gs/4MUqtP60Ob6G8aDves8qGf9uZf8+RbTwIQnT7l7is5LmS84QP48ik66YkJrB+Gx0WY
	/5lEgKK2VVASWV2nuMpHHn3DC7a4KNu6ekaLlgQGPOdASom096XgGxk7xQeNmKluX7Sd/IGqGpYs5
	tZXraw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMBG-00000001y4t-1fjq;
	Tue, 19 May 2026 15:16:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMBD-00000001y4E-0SL1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779203780;
	bh=LeeRjDKdU98xs9zRHyVlw4Dxq1DWY3AOHyqzA6RQyk8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BIzGmVZX7WuoGCBqs8TVvfe6IAiXzAbgNzXkT5K/YhBIwLJwSni7btMn9SumAwHRd
	 yYMxK+FlNvhcL5reNzbEaqTVpwYwJMAn6mvoi86ru++B1H1wUBohGelADL4ThXNazp
	 kcQ7ARc9mdtezse4LnovGMYXMcFZAfyeXmJSDv9Q31YkIq6Hfn3dcHmujAdWagpViT
	 NnI9aZpdq6Vq57u7E9gC4ZWAXpXKep7D4xIRnxtEDOkZMUa5r4L7cTmzfLezpmOj2h
	 RmDVZMINMEcFZkD8jeIj5MsoxAIs4UT/N/oXazgSSObDkVfO+d6jwxeWDJ/9ojYlNE
	 DBUftxHB1ZJGg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB6A017E1299;
	Tue, 19 May 2026 17:16:18 +0200 (CEST)
Message-ID: <d2c20b4cac22f04bf864534edf27993236ac9e09.camel@collabora.com>
Subject: Re: [PATCH 05/16] media: v4l2-common: Fix NV15_4L4 format info
 block height
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 19 May 2026 11:16:17 -0400
In-Reply-To: <20260518102451.417971-6-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
	 <20260518102451.417971-6-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-GJ5iBdhdx0UoTc8uYpG1"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081623_294432_DCA3AE05 
X-CRM114-Status: GOOD (  17.99  )
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


--=-GJ5iBdhdx0UoTc8uYpG1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=C2=
=A0:
> The NV15_4L4 format is specified as a 4x4 format, not 4x1.
> In addition the block size should not take subsampling in account,
> so specify it as 4x4 for both luma and chroma.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e1113..77a0daa92c2b 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -309,7 +309,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		/* Tiled YUV formats */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bp=
p_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> -		=C2=A0 .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 1, 1, 0, 0 }},
> +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

Only the block_h is broken. The block_w is in "pixels" which for the UV pla=
ne is
component pairs. So both set of tiles have 5bytes stride. But since the sec=
ond
set, the UV tiles, are interleaved, they only have 2 pairs of UV per row. S=
o to
me the correct fix is:

+		  .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

If its not the case for the camera pipeline, then a new format is needed, s=
ince
this format should perfectly match NV15 + VIVANTE_TILED in the DRM world.

regards,
Nicolas

> =C2=A0		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0
> =C2=A0		/* YUV planar formats, non contiguous variant */

--=-GJ5iBdhdx0UoTc8uYpG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagx+wQAKCRDZQZRRKWBy
9H3cAQCZckjwaH4Ua7bFNH0TlIe7qNnm4JBXewMsZ3UzDAKbHAD+MzI3Pek25YiV
cuO2+w5f3DUEwgpRmjCUKnqmGO9WqQ4=
=HPXQ
-----END PGP SIGNATURE-----

--=-GJ5iBdhdx0UoTc8uYpG1--

