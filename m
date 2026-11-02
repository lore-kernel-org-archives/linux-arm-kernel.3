Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1D9606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OkA/ecdt;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AT8Tz8je
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IpJrp3N4n3cXTcMWGiDBwAKw8MhlspUrUrRVTsA/62c=; b=OkA/ecdtyiV4bp5IJQ3PM2T0zo
	CVDFmltZw4QemQqnvRnYKatPXP5NPViMd4ipKjc5fCy6/EQcw/r/GH5HkM07rTJfLRWaT3Hz9nvLU
	Wl5RfC7ClwRGPBEkkGfAiMvwFVR/x/7phyPRkdTzaBiJysZVLQCLTOVdmViweq4xIC/4OZnTaq+S2
	xG6ZcmtUeWc9RPdbuteuk7yxzL6wzdGaWSpGk0na8eQsVhtCHKnDmN1HBbDvblPgv1moyWrOSlGRZ
	xvBOzIV7JabbnMB9qkPGXdcvg6L9szmSIosdUBkRjvvmpRFR+r/HQ9M8PgN1dqCYaehZHVg9m3091
	kLUFQHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxGg-000000002ve-0eYv;
	Mon, 02 Nov 2026 19:00:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxGd-000000002vB-0O9X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646024;
	bh=7+cVgQKAwNDl4tvndFXaFuD+9S20VGeyFcozWWAl4/8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AT8Tz8je60MbshoZd0M6PPDwIC3OIL0QoKhsTdkYU2mblDuoMqkdO0UsSzymVYs8y
	 vYRRgg5hAHEsF/59SuSizZ36ZvQUWgxMHJ3i5I0h+3Ap10TIISaCnmfMEMomDGyHXI
	 rnFVEYOb9LudeS/0jtN0yJ4A75F3HOlZntZ/OGiIEVVjU+yzUxUhV7CN7GKlQYlX8Q
	 WIId5QEu02g9zzP0DAwyf+9hNXguNJSTGknY6jqP74PzHJgAr/F0ZsR1St3ayDiM75
	 6ox6d1XwXDs5VcRkrfYXCl4GhpNtvgdMth4gaQq2w+hOohg3AEGz6/MmN5DzP7XkpH
	 ap4moRcGUxzaA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31C8617E038E;
	Mon, 02 Nov 2026 20:00:22 +0100 (CET)
Message-ID: <dd7046d1ca454fa53b51d0cd122f96ad05c7a2c2.camel@collabora.com>
Subject: Re: [PATCH 05/10] staging: media: cedrus: mpeg2: derive the field
 order of field pictures
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:00:20 -0500
In-Reply-To: <20261102170303.1973892-6-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-6-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-WApOxz+sTMoS9JafJBm/"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_110027_305103_097579FE 
X-CRM114-Status: GOOD (  29.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-WApOxz+sTMoS9JafJBm/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The hardware uses the top field first bit of the picture header to tell
> the first field of a frame from the second one. However,
> top_field_first is always 0 in field pictures, so userspace passes
> V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
> every top field first pair is predicted from the wrong reference.
>=20
> Detect the second field in the driver instead: it has the opposite
> parity of the previous field and is decoded into the same capture
> buffer. This works with unmodified userspace.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Its quite likely other MPEG-2 decoder are affected. Would have been nice to=
 pass
the picture structure explicitly in the decode params in the first place. N=
ot
your fault.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index 54f867949fba..a523b56a9b8c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -144,6 +144,11 @@ struct cedrus_ctx {
>  			void		*entry_points_buf;
>  			dma_addr_t	entry_points_buf_addr;
>  		} h265;
> +		struct {
> +			bool		pair_pending;
> +			unsigned int	pair_dst;
> +			u8		pair_structure;
> +		} mpeg2;
>  		struct {
>  			unsigned int	last_frame_p_type;
>  			unsigned int	last_filter_type;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index ca66a3c6b830..4c8accee5389 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  	struct vb2_queue *vq;
>  	const u8 *matrix;
>  	unsigned int i;
> -	bool field;
> +	bool field, tff;
>  	u32 reg;
> =20
>  	seq =3D run->mpeg2.sequence;
> @@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
>  	}
> =20
> +	/*
> +	 * top_field_first is always 0 in field pictures, but the hardware
> +	 * uses this bit to tell the first field of a frame from the second.
> +	 * A field is the second one when it has the opposite parity of the
> +	 * previous field and is decoded into the same capture buffer.
> +	 */
> +	if (pic->picture_structure =3D=3D V4L2_MPEG2_PIC_FRAME) {
> +		tff =3D !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
> +		ctx->codec.mpeg2.pair_pending =3D false;
> +	} else {
> +		bool second =3D ctx->codec.mpeg2.pair_pending &&
> +			      ctx->codec.mpeg2.pair_structure !=3D pic->picture_structure &&
> +			      ctx->codec.mpeg2.pair_dst =3D=3D run->dst->vb2_buf.index;
> +
> +		tff =3D (pic->picture_structure =3D=3D V4L2_MPEG2_PIC_TOP_FIELD) !=3D =
second;
> +		ctx->codec.mpeg2.pair_pending =3D !second;
> +		ctx->codec.mpeg2.pair_structure =3D pic->picture_structure;
> +		ctx->codec.mpeg2.pair_dst =3D run->dst->vb2_buf.index;
> +	}
> +
>  	/* Set MPEG picture header. */
> =20
>  	reg =3D VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
> @@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	reg |=3D VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision=
);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_struc=
ture);
> -	reg |=3D VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PI=
C_FLAG_TOP_FIELD_FIRST);
> +	reg |=3D VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPE=
G2_PIC_FLAG_FRAME_PRED_DCT);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4=
L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_F=
LAG_Q_SCALE_TYPE);
> @@ -186,6 +206,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx=
, struct cedrus_run *run)
>  	return 0;
>  }
> =20
> +static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
> +{
> +	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
> +
> +	return 0;
> +}
> +
>  static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> @@ -203,5 +230,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 =3D {
>  	.irq_disable	=3D cedrus_mpeg2_irq_disable,
>  	.irq_status	=3D cedrus_mpeg2_irq_status,
>  	.setup		=3D cedrus_mpeg2_setup,
> +	.start		=3D cedrus_mpeg2_start,
>  	.trigger	=3D cedrus_mpeg2_trigger,
>  };

--=-WApOxz+sTMoS9JafJBm/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujdxAAKCRDZQZRRKWBy
9FEyAQC8/q6Nd1DoHPrJt6RmqNj59GInV2qqqrnhS3ndvJGV7gEAs9tcUUCE4igf
xOK38RK8vM8z6QMV9E8zb/YjVh7zLAs=
=xRX+
-----END PGP SIGNATURE-----

--=-WApOxz+sTMoS9JafJBm/--

