Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE825606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOjKyajn;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YgRUXJxT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x6A8HN508TRpSqR/G7vD7jQ2gadLqTKijxxngFC1xs0=; b=lOjKyajndIt/E6hhPyPVy+jYvr
	t0s2u4Cqvu9VoTsAfFr+vAKi1UJPANI82Xw999uhJxl3fd/Dtm4+heSp3E+s8rwc4WrYrbj9OWwIz
	U6GFAU56nU4ZDqUJ3TgnWnSCWYQnQnX2MWQBnV0uXvG7kOfs0DF6skMmlB8hlMaEJpjGaiEDO6XGx
	ofQznHtIQW+KOJPjqUzeGV/vRKkOvY41V+yWw/6NFeIayKrb35Bl1MDpaUffK2fJCJjDUpVGC6Z/P
	PQy55SfwpQHnU8eKJgZ/UF8dykH9goYD1l7v47YouUOxu3L+rTmdE1R2ZyQ2+PWLQHH47HWU7CADf
	G2p9itFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx1R-000000000sY-47YZ;
	Mon, 02 Nov 2026 18:44:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx1P-000000000rX-0wLQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793645081;
	bh=dE/dxAGf/5dlo74VuH1qHMlbasoG0e92NggE0JMisVE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YgRUXJxTv3VdB2I+rSQZQXq8gviYr5gZq5dOYl+L+oJhaIhWYz2f07KwCk5bgyudu
	 v4Dnll71qbQrBy+e8HnJK8SkuF4dacci7yg/IxIBWoVSSI9mllPSOv02M7KxtWUb/d
	 uDHQ74dNQ4DO2yCa2TOKTpi6AsPXhtA7Uuv8NABifPy5731cMxQMvmCpHtzF14GpFl
	 6WCA5/bf+cr10tkV1SyDSj7yQiiSfNnB57sfdHfQOeyTnonLup/IWP3dvniAVq0nD2
	 7DuB+iExtOjuPIpy8PKY6FjGNPIVOZdpItFdL1OOITNNqF5j/++u8mxqB743ajRPTD
	 d3/o739O5+Seg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77ACA17E07F6;
	Mon, 02 Nov 2026 19:44:39 +0100 (CET)
Message-ID: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
Subject: Re: [PATCH 02/10] staging: media: cedrus: reject too large
 H.264/HEVC SPS
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 13:44:38 -0500
In-Reply-To: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Vy+jkNv142A0aYW5E0HP"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_104443_428219_2AA790AD 
X-CRM114-Status: GOOD (  27.33  )
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


--=-Vy+jkNv142A0aYW5E0HP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The hardware decodes whatever picture size the SPS describes. An SPS
> beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> are allocated, makes the hardware overrun memory and hang. On H616, the
> JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> 4216x528) leave the hardware wedged, so that every following job times
> out until reboot.
>=20
> Validate the SPS picture size in try_ctrl. Move the size limits to
> cedrus_video.h for that.
>=20
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
>  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
>  3 files changed, 44 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index c3331b4f3f02..45deebddb630 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -28,10 +28,38 @@
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
> =20
> +/*
> + * The hardware decodes whatever picture size the bitstream headers desc=
ribe.
> + * Reject sizes beyond the hardware limits, or beyond the capture buffer=
s once
> + * they are allocated, instead of letting the hardware overrun memory an=
d hang.
> + */
> +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 =
height)
> +{
> +	struct vb2_queue *vq;
> +
> +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> +		return -EINVAL;
> +
> +	/*
> +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> +	 * formats pad the buffers to at least 16 pixels in both directions.
> +	 */
> +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (vb2_is_busy(vq) &&
> +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> +	     height > ALIGN(ctx->src_fmt.height, 16)))
> +		return -EINVAL;

If my memory is correct, Hans rejected this kind of construct in try_ctrl,
because if you are only doing try() it shouldn't fail like this. Instead we=
 can
validate in the real s_ctrl, but I believe the downside is that it makes th=
e
error asynchronous when a request is used (perhaps that's actually wanted ?=
)

Nicolas

> +
> +	return 0;
> +}
> +
>  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
> +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_ct=
x, hdl);
> +
>  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
>  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> +		u32 height;
> =20
>  		if (sps->chroma_format_idc !=3D 1)
>  			/* Only 4:2:0 is supported */
> @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 !=3D 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +			height *=3D 2;
> +		if (cedrus_check_pic_size(ctx,
> +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> +					  height))
> +			return -EINVAL;
>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_c=
tx, hdl);
>  		unsigned int bit_depth, max_depth;
>  		struct vb2_queue *vq;
> =20
> @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  			/* Only 4:2:0 is supported */
>  			return -EINVAL;
> =20
> +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> +					  sps->pic_height_in_luma_samples))
> +			return -EINVAL;
> +
>  		bit_depth =3D max(sps->bit_depth_luma_minus8,
>  				sps->bit_depth_chroma_minus8) + 8;
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index adc7f255d7cf..2521315abdb7 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -29,11 +29,6 @@
>  #define CEDRUS_DECODE_SRC	BIT(0)
>  #define CEDRUS_DECODE_DST	BIT(1)
> =20
> -#define CEDRUS_MIN_WIDTH	16U
> -#define CEDRUS_MIN_HEIGHT	16U
> -#define CEDRUS_MAX_WIDTH	4096U
> -#define CEDRUS_MAX_HEIGHT	2304U
> -
>  static struct cedrus_format cedrus_formats[] =3D {
>  	{
>  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.h
> index 8e1afc16a6a1..367e52158f01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> @@ -22,6 +22,11 @@ struct cedrus_format {
>  	unsigned int	capabilities;
>  };
> =20
> +#define CEDRUS_MIN_WIDTH	16U
> +#define CEDRUS_MIN_HEIGHT	16U
> +#define CEDRUS_MAX_WIDTH	4096U
> +#define CEDRUS_MAX_HEIGHT	2304U
> +
>  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> =20
>  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,

--=-Vy+jkNv142A0aYW5E0HP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujaFgAKCRDZQZRRKWBy
9GApAP0cwQdda+CAhJmitoR5/UU25ugUyIbeyeggtB4u1qxsSAEA4ttPDgjqzTMX
nhFkFQM3gNbr3NOjrgd1nDwpzxmOEgo=
=8N4Q
-----END PGP SIGNATURE-----

--=-Vy+jkNv142A0aYW5E0HP--

