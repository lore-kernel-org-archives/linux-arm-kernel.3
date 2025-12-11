Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD93D43350
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BHWiooGjHlzCPhceREi8FmP8BPRdmAWAB9cARyM9cI=; b=ZIDBfx6KFx5L3dnLRHBmBlrEJs
	8Q1MqfZUZcnknqpSGR60+XkxkruqtQNJCr1Jn1REGAhIWQgFC6wJmUSH/5Yju1VOOf84FZRy0U/tL
	Y1wKARPYkM5nUGODARKpitZPR5EoiJiauK6fmnbCAI12HpgV2k/3oZ6+lDNMWCqmujTWbKlux5oRr
	zj6T5bnpEkFu34q3965yS4GJutE9gsEhKkh7iP8rjPkhMCdUQ+l2tmQbr6McT1ETjqsUEbdc16aQ3
	ugActRTmW/UCp49VHpr6VFJ2ba8EmcvUI8mmJhIEBvdD2VxHtMYF0gKamWCwsitvrydnL08BtYeMb
	3swEMHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnI6-0000000HDtZ-0FFZ;
	Thu, 11 Dec 2025 20:29:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnI4-0000000HDtB-0UTt;
	Thu, 11 Dec 2025 20:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765484968;
	bh=aorE+XGhS7LAYqgTc6esMCwmzPq1BKGq+EW0ds9kfxA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=orSc8y5DvHwd5U64GaRcrlBH1D0Wi9fmU5WpWzqhi8dvI/wh1C9A20P6yzMt3PtVe
	 c7QhAZ2DC+yqdk92ctW8wo5PkNs4JMdkTRVcaTJy4cog/4OkJ5Fao4zNnzga8rJ74J
	 oGL0ApOTZYCYWsIggFFajo+1bUsbz+/S6NQ9a+1wHmSgqhZso1jHRarc8wQ5giTQ9F
	 Hpe2TEvzbQxW93O1METPRZqc9sp+c10hnwFOI/jQnym5pV/6mGcbOlbJT2OPSduXaR
	 AzYZjjOxastiJTVhd54txlYa/bgvL31ZpMDIJTvaZFG932AA3sWDdeRoxr/AXMwjsx
	 AvazI9KoopE7A==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0141617E110C;
	Thu, 11 Dec 2025 21:29:25 +0100 (CET)
Message-ID: <d9a58ddf9b90d8320562ec54f2bd74fa77f0bc67.camel@collabora.com>
Subject: Re: [PATCH v6 05/10] media: mediatek: vcodec: refactor setup dst
 buffer metadata interface for VP9 decoder
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
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 11 Dec 2025 15:29:24 -0500
In-Reply-To: <20251202074038.3173-6-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-cnFYe8mYcyleE2PY2F67"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_122932_339222_2B281950 
X-CRM114-Status: GOOD (  18.78  )
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


--=-cnFYe8mYcyleE2PY2F67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Previously, calling vdec_vp9_slice_setup_single_from_src_to_dst
> with v4l2_m2m_next_src_buf to obtain both buffers resulted in -EINVAL,
> interrupting the decoding process. To resolve this,
> the interface should be updated to set both src and dst buffers
> for metadata configuration.

I'm haven't figure-out why this happens, perhaps you can add more details ?

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 21 ++++++++++------=
---
> =C2=A01 file changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index fa0f406f7726..9513ddde7c7c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -696,21 +696,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int =
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

My concern is that vdec_vp9_slice_setup_lat_from_src_buf() also depends on =
the
tip of the OUTPUT queue, why it this problem with limited to single core ?

Can you apply the manual completion fixes, and check if the problem still
appear? Is that something you reproduce every time ? Perhaps it should be k=
ept
out of this serie ?


> -	if (!src)
> +	src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	if (!src_buf_info)
> =C2=A0		return -EINVAL;

Its a bit of a concern in term of memory lifetime / possible use after free=
.
Who's holding on the buffer if its not in the queue ?

Nicolas

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
> @@ -1800,7 +1801,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_=
vp9_slice_instance *instance,
> =C2=A0	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance);
> +	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);
> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0

--=-cnFYe8mYcyleE2PY2F67
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsppAAKCRDZQZRRKWBy
9CXrAP9alOmG1EIcOp/r0v4e3t44wyRrJES2KQ9RbQQML4UAAgEA28h4QzuqkSxR
pWAsLr/SYdJQup7lL5McJSFqipmIAg8=
=YXEp
-----END PGP SIGNATURE-----

--=-cnFYe8mYcyleE2PY2F67--

