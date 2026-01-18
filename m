Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7041C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 22:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hzz5inUnvKCeQhpZ2e2wg6AhbQItFM6Xb59+ebcW94A=; b=CNFkx4TBr0dAD6UJOEU19lF9wd
	lHKK/zUK+wNlzYZZB+uwbjC0+M33nK5kuBDlCFaiYBNmQfaehknVZWytNx9Fwa/NAZwCO5FiW3M/0
	v5KJgxrBQ0sU+C58rx4HWOk/s9flfBj2aiiazGOfrUkyuwGIMLu8kaNqOPcHHFIFa0rOP764RSVWq
	nudYRHT4z4yIA87ug6WpZNCo9KH+8FkTA6MXW9HiDq7ZhF5VNFW5BiSfglgDURT9KG5Idvt5EpOpm
	1CPW3aO9vp7UiFFi6GujfuJ3r9GxEHlf7exb4bwvzAcmn8FBu2bZVZdPRQpq/F7/sCJ94ngnDgmtM
	VzaTJMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhbLs-000000016sU-2BNY;
	Sun, 18 Jan 2026 22:34:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhbLp-000000016rp-3nE0;
	Sun, 18 Jan 2026 22:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768775667;
	bh=+fpZRcVkISnDsiOYZILcnwYIBQK89nnMOZCHLherCTU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ov3T7bN5higH0YOJ80PhZDF7mKZQH6dYsmkUv1GseIpzIF/PfldTg6wfTainrTEv4
	 IruEyHZD1doDp68UGhBefy6HtORDyCyUzsmmTl55yXM5HRAu2KjtL+9ZPql47JoJ59
	 RfXr5rPdRah7xbfDKWZr8BysO6k87NLnOPnNeVfhmqj3uFXth4xUlNCfH05oje/QXK
	 qjoKBEpqLhqAdLVlYGysLh8qogH9+HeA7hDt9+6nsyLeI0Ncem/7u0I5PqSVHNzmhR
	 rrR1XU8HQ07HuMaJr7lbCzct02Kih8fGry98TUkOdrygkWi44FAZFWXmi5GOk8omID
	 3sGHnseSuuqdw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1662917E1274;
	Sun, 18 Jan 2026 23:34:25 +0100 (CET)
Message-ID: <e63bea4f457dad4e4661185188f2b030d82b7879.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Fix tile info buffer size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Sun, 18 Jan 2026 17:34:24 -0500
In-Reply-To: <20260114090710.71473-1-benjamin.gaignard@collabora.com>
References: <20260114090710.71473-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-jI/5S99Z0pZFxvjm1Yct"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_143430_144431_47F4B485 
X-CRM114-Status: GOOD (  12.69  )
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


--=-jI/5S99Z0pZFxvjm1Yct
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 14 janvier 2026 =C3=A0 10:07 +0100, Benjamin Gaignard a =C3=A9c=
rit=C2=A0:
> Each tile info is composed of: row_sb, col_sb, start_pos
> and end_pos (4 bytes each). So the total required memory
> is AV1_MAX_TILES * 16 bytes.
> Use the correct #define to allocate the buffer and avoid
> writing tile info in non-allocated memory.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
> ---
> =C2=A0.../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0=
=C2=A0 | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4703bb6be7c..af854b149f35 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -373,12 +373,12 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx =
*ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0	av1_dec->global_model.size =3D GLOBAL_MODEL_SIZE;
> =C2=A0
> -	av1_dec->tile_info.cpu =3D dma_alloc_coherent(vpu->dev, AV1_MAX_TILES,
> +	av1_dec->tile_info.cpu =3D dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_S=
IZE,
> =C2=A0						=C2=A0=C2=A0=C2=A0 &av1_dec->tile_info.dma,
> =C2=A0						=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> =C2=A0	if (!av1_dec->tile_info.cpu)
> =C2=A0		return -ENOMEM;
> -	av1_dec->tile_info.size =3D AV1_MAX_TILES;
> +	av1_dec->tile_info.size =3D AV1_TILE_INFO_SIZE;

After checking the sizes, I can only conclude the we rarely have more then =
8
tiles in our tests.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0
> =C2=A0	av1_dec->film_grain.cpu =3D dma_alloc_coherent(vpu->dev,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(sizeof(struct rockchip_av1_fil=
m_grain), 2048),

--=-jI/5S99Z0pZFxvjm1Yct
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1f8QAKCRDZQZRRKWBy
9MMVAP9W46+A8zHAErcgPaB+4lWE35ITcz/n6XeOwtZ74V1TdQD/ScSGmvqGGrh0
gcsWab4t4CLQtCetxyPHwd0GpkD+FQ0=
=oGdY
-----END PGP SIGNATURE-----

--=-jI/5S99Z0pZFxvjm1Yct--

