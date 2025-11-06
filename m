Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC0DCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1j++rKgQioea2S6g3jgPObuU+o9z5vS/BYGYaYTwxY=; b=HJPXEHLAYQzgWV0f02HYYChLiG
	BMTIqRzvY3veP9TsgTeF8O7C8uECvTnZl496r7Ho7u2qhBDvjoGWebBREDP6yvi42P4aBRiq3ZuXb
	g3hkp7ux2D7k9JHJehk3pvGxUrOTxF6KFSYXHwO7J54O/8Ydd4oH8Ah6LgTHVXeO0irwNnnr9W4Rr
	NhZVRhdQpgHh1UsFal1nZs28iusc3JzzCLnv5BqIRdZrW4b9JlLCGzceZuIMsQKJeAqLkVcnZ/Is0
	gz6+MPF/RRpexNBA56yX5OEcph1sV6ss0Yl72I4bqG+F1YXPeHCMdge7h0Gi3ktbHvAgSr7EIZHXp
	Ts5i10Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0zJ-0000000FhRo-0Twu;
	Thu, 06 Nov 2025 14:29:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0zG-0000000FhRO-2KRA;
	Thu, 06 Nov 2025 14:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762439355;
	bh=V144ITPhJaheSq6B4sSkjanob0iMvCwByWKwZnn8vVw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=X6YkEiQJfoguC+wfJWLl+scVfOt+2BoboFhF58RJ+alMJ4GUR2Vdx+lDly6tm4VgK
	 rHtU0GhiHNskumXYJWcQX2/Jbplhmlhypv1gfS6bN/C7/Yt14dYC7hobmYOvLtRpo1
	 JhR+GbWromFuLorTVZBoD1aYamepfJ9KllMKxykYjEBIQApOBSR9GrE5jZe9uspPsF
	 0ho/FgxfUIOVmnsXByjnP4zw7lWO58a2Z0p8a8vPC8aOdLl4veltCZWSnBX8hO/fgL
	 gpBGlhRehaozRgIDWekWlXmK5ew/BhN4K+5y9bakveGYamaP6xcbWhbLYSZ4ooHud/
	 El0bRpp2Loakg==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E43E17E0E63;
	Thu,  6 Nov 2025 15:29:13 +0100 (CET)
Message-ID: <5834fe661f38462d65795a20b5a4f9d2a12d3b35.camel@collabora.com>
Subject: Re: [PATCH v5 4/8] media: mediatek: vcodec: Add single core VP9
 decoding support for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 Yilong Zhou <yilong.zhou@mediatek.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 06 Nov 2025 09:29:12 -0500
In-Reply-To: <20251106061323.2193-5-kyrie.wu@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-wlcyIPJc95NX9hPSGVRO"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_062918_768593_18C28FAB 
X-CRM114-Status: GOOD (  22.64  )
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


--=-wlcyIPJc95NX9hPSGVRO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. add config to support 4K prob size;
> 2. Previously, calling vdec_vp9_slice_setup_single_from_src_to_dst
> with v4l2_m2m_next_src_buf to obtain both buffers resulted in -EINVAL,
> interrupting the decoding process. To resolve this,
> the interface should be updated to set both src and dst buffers
> for metadata configuration.

Please avoid using bullets in commit messages. Everyone will assume that if=
 you
have two bullets, you should have two patches. And I think they would be ri=
ght
for this patch.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 43 ++++++++++++++--=
---
> =C2=A01 file changed, 32 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index fa0f406f7726..d966914db4b9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -23,6 +23,7 @@
> =C2=A0
> =C2=A0#define VP9_TILE_BUF_SIZE 4096
> =C2=A0#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_PROB_BUF_4K_SIZE 3840
> =C2=A0#define VP9_COUNTS_BUF_SIZE 16384
> =C2=A0
> =C2=A0#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -542,6 +543,23 @@ static int vdec_vp9_slice_init_default_frame_ctx(str=
uct vdec_vp9_slice_instance
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static size_t mtk_vcodec_get_vp9_prob_size(enum mtk_vcodec_dec_chip_name=
 chip_name)
> +{
> +	size_t prob_size;
> +
> +	switch (chip_name) {
> +	case MTK_VDEC_MT8189:
> +	case MTK_VDEC_MT8196:
> +		prob_size =3D VP9_PROB_BUF_4K_SIZE;
> +		break;
> +	default:
> +		prob_size =3D VP9_PROB_BUF_SIZE;
> +		break;
> +	}
> +
> +	return prob_size;
> +}

This is another example of something that could be in the static compatible
data.

> +
> =C2=A0static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slic=
e_instance *instance,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_vp9_slice_vsi=
 *vsi)
> =C2=A0{
> @@ -616,7 +634,9 @@ static int vdec_vp9_slice_alloc_working_buffer(struct=
 vdec_vp9_slice_instance *i
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!instance->prob.va) {
> -		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> +		instance->prob.size =3D
> +			mtk_vcodec_get_vp9_prob_size(ctx->dev->chip_name);
> +
> =C2=A0		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> =C2=A0			goto err;
> =C2=A0	}
> @@ -696,21 +716,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int =
mi_num, int tile_log2)
> =C2=A0	return min(offset, mi_num);
> =C2=A0}
> =C2=A0
> -static
> -int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_in=
stance *instance)
> +static int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_s=
lice_instance *instance,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem *bs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_fb *fb)
> =C2=A0{
> -	struct vb2_v4l2_buffer *src;
> -	struct vb2_v4l2_buffer *dst;
> +	struct mtk_video_dec_buf *src_buf_info;
> +	struct mtk_video_dec_buf *dst_buf_info;
> =C2=A0
> -	src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -	if (!src)
> +	src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	if (!src_buf_info)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	dst =3D v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
> -	if (!dst)
> +	dst_buf_info =3D container_of(fb, struct mtk_video_dec_buf, frame_buffe=
r);
> +	if (!dst_buf_info)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info->m2=
m_buf.vb, true);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1800,7 +1821,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_=
vp9_slice_instance *instance,
> =C2=A0	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance);
> +	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);

I don't see a direct correlation betwen the buffer size change and this cha=
nge.
Please split. Changes looks good, the commit message isn't very clear thoug=
h.

Nicolas

> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0

--=-wlcyIPJc95NX9hPSGVRO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQywuAAKCRDZQZRRKWBy
9K5IAQCXlmAAzl+iCuLAYIlMe0L1aV3/vtGJvQ4QmLxUy0BkRgEA89XXHgOE2Ewx
OrW4Z94rpraxJcv92KTX7rtrXRkmkw4=
=qhRy
-----END PGP SIGNATURE-----

--=-wlcyIPJc95NX9hPSGVRO--

