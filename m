Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF4BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnr2+9xlsTKydXsKlBL/WhlQlV9YNlzziRZ/ZZd1KvU=; b=DUpfsLLDA5iIQ9gSkIR3wYz33V
	1RCScul57S6/rQJnwaaQKkO8tDwD4rRBNR/PjYGWuOwb6LfKzPk0+ZpxWUbq0JazwmIBHZ4M23MAD
	cBfaWpSv/KPig1raxv3r2Q9AqaEPn9W6+X8Pwo+KRe5HUXeW01KQcUTd3avStQtckiHA/7AiprPcU
	3BX372weH9ATCxUuH5srWGdALH6AkaNCaoK541G1j+qC2ZunIVIXisXUfLv92+bqUBjLmfRfhqvO1
	sG4zsUA6/pyoqNy2BfkVTUTXMOwnV94lSllullRnKNdikmu178sp50tPl77i5PRXm6zZqj4eRNVs0
	P6FoDeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PlH-00000005A9j-3knU;
	Thu, 16 Oct 2025 15:19:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PlF-00000005A8Q-0ASD;
	Thu, 16 Oct 2025 15:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760627962;
	bh=ati0KgDtCv8PEJWIbHhO/9CBCvu0ooHMQ92xaU79xmk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eyMzW4rQLHVjAGqM0OkLEpY4VZFJWE3w9WApY6ZgKLoh+Q4yWD3UmKac5seip3q1G
	 ZznepgwbmLiplpUFmhtGssykMO6LT53ekQB58MjzKaDZ0+IoIeU776UGgs+9iQ29lu
	 rUDv5twJb29FF6pHWrGk+3H7VjxQ0PvD3OSbixH+vFLJniw72c5zLA24KKmVxGHtJv
	 enz5u8ruG5zNpukj3DiwESj7b8UyWo/ot72UKR+f2svZEyWVU4/Nk9JzKsW5syUEnA
	 rndPCpt6jorI5VXDLNZNIiyfv51L6idtB7ZudXXxUwtYiRImf5HIQvrnfWA/SZtrMY
	 30i/81QAhXWzg==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E50C517E10C8;
	Thu, 16 Oct 2025 17:19:19 +0200 (CEST)
Message-ID: <f5956178a0e5d91dabc12e89f666eac2140f141e.camel@collabora.com>
Subject: Re: [PATCH v4 4/8] media: mediatek: vcodec: Add core-only VP9
 decoding support for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert	
 <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Irui Wang	
 <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 16 Oct 2025 11:19:18 -0400
In-Reply-To: <20251016060747.20648-5-kyrie.wu@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
	 <20251016060747.20648-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Rz6sMYc0nh24Zfb5X2O5"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_081925_246051_3A0564A9 
X-CRM114-Status: GOOD (  22.23  )
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


--=-Rz6sMYc0nh24Zfb5X2O5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 16 octobre 2025 =C3=A0 14:07 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Implemented core-only VP9 decoding functions for MT8189.

What does "core-only" means ? Did you mean single core ?

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 27 +++++++++++-----=
---
> =C2=A01 file changed, 16 insertions(+), 11 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index fa0f406f7726..04197164fb82 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -23,6 +23,7 @@
> =C2=A0
> =C2=A0#define VP9_TILE_BUF_SIZE 4096
> =C2=A0#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_PROB_BUF_4K_SIZE 3840
> =C2=A0#define VP9_COUNTS_BUF_SIZE 16384
> =C2=A0
> =C2=A0#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -616,7 +617,10 @@ static int vdec_vp9_slice_alloc_working_buffer(struc=
t
> vdec_vp9_slice_instance *i
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!instance->prob.va) {
> -		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> +		instance->prob.size =3D ((ctx->dev->chip_name =3D=3D
> MTK_VDEC_MT8196) ||
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->dev->chip_name =3D=3D
> MTK_VDEC_MT8189)) ?
> +					VP9_PROB_BUF_4K_SIZE :
> VP9_PROB_BUF_SIZE;

I feel like this will keep growing, then you'll move to 8K and it will cont=
inue.
You already match every SoC in the driver, you should come up with SoC
configuration data structure so you don't have to add doc check conditions =
all
over the place. This change is also not reflected in the commit message.

> +
> =C2=A0		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> =C2=A0			goto err;
> =C2=A0	}
> @@ -696,21 +700,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int
> mi_num, int tile_log2)
> =C2=A0	return min(offset, mi_num);
> =C2=A0}
> =C2=A0
> -static
> -int vdec_vp9_slice_setup_single_from_src_to_dst(struct
> vdec_vp9_slice_instance *instance)
> +static int vdec_vp9_slice_setup_single_from_src_to_dst(struct
> vdec_vp9_slice_instance *instance,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem
> *bs,
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
> +	dst_buf_info =3D container_of(fb, struct mtk_video_dec_buf,
> frame_buffer);
> +	if (!dst_buf_info)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info-
> >m2m_buf.vb, true);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1800,7 +1805,7 @@ static int vdec_vp9_slice_setup_single(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance);
> +	ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);

This entire change is not explained in the commit message at all. Explain w=
hy
this is needed, what difference it makes. There is no clear indication we a=
re in
an MT8189 code path, so this change could have a incidence on all single co=
re
SoC (if any).

Nicolas

> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0

--=-Rz6sMYc0nh24Zfb5X2O5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPEM9gAKCRDZQZRRKWBy
9AB+AQCgeocVLaEndCMfX388SHPaflaLqJbYBY0d0ZHr7NpAOAEA7g9JD1WWMOrd
Z+Pd5ov2tTNoe3q+1HvqeNDXlNyUOQs=
=+EQ2
-----END PGP SIGNATURE-----

--=-Rz6sMYc0nh24Zfb5X2O5--

