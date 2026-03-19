Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3731091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDWG/geeJYspKYMBy3mzZYNh/TEj6fM7awr8whI4S8c=; b=VZtKgZRsWv2r6q598V06gGia76
	6VjPgDz0NCLtKmLJ0yaYHSpnPr3EX9i6WIjrltMq8FoW4bJbeJLgerqXlizIbvbU+lNiJSf04Wbwa
	NGgJvR6CHvopoECs3+xzbZ/zn483aY7V31A1SoElSfxyEnpnPrRSB+masGirJns/1PqwN87HnW3tN
	gGpQfhC5nOy6cVOC0/9Mp1CcqMi0yX/2a+BxdEreSJ/gMX76ha6MpZPSQTe8OJo8H93eJDgRZSrmk
	DHzve+s9On1CFkwj8yf5xiNxjvcG9NcCWhenSJuTo9LBg4ygEYSB4jGEcr1G+avrA50Y+iZGArYt1
	gy6qR3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hdz-0000000BFcT-41Bu;
	Thu, 19 Mar 2026 17:58:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hdw-0000000BFbb-3gLe;
	Thu, 19 Mar 2026 17:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943125;
	bh=HwTyo/5WYUr5YkScc9lyA3lElCIJ1FNPsB40BEMRe0k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BxHw+uAK7Mlff7qIcPlCXGqcieoUyWinVXZfcbb9rLr2ZtojOufM1qweP1VbTPJg9
	 U/QJ7ZFRfc0E/5dNXLWqodYZj9Qq0I55+gtgdLMl2BH0TEC+LWJAUJJeBpSisYywXb
	 H/gle1NsJGmn9iENz4Nohf34p4o8BlhRBfG8A74FUWTqTHmo1Fp40U89tQn2kT43FJ
	 k2UjYVVRNq9scpPQQQ30cjiV3JUsGCGpBJdluB+JM3sdWiiiKchlBqyAUWRe8RIqAA
	 Zz+lJ9INv3k4+DR9d0ZCGRfKY4XnQ8bECB+P+1vJIFGzbuuut2tegYMONiZyXF/x2A
	 UAT/r3ooWcNvg==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81F3117E01B1;
	Thu, 19 Mar 2026 18:58:42 +0100 (CET)
Message-ID: <658584073c66f5f3eca72bee2e2280327e803a22.camel@collabora.com>
Subject: Re: [PATCH v7 04/10] media: mediatek: vcodec: Refactor Decoder
 profile & level Handling
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
Date: Thu, 19 Mar 2026 13:58:39 -0400
In-Reply-To: <20260127024248.18406-5-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-/GspWsZFGaUupRr8a+jt"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_105849_093928_B2C41AF0 
X-CRM114-Status: GOOD (  17.43  )
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


--=-/GspWsZFGaUupRr8a+jt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This commit refactors the handling of decoder parameters for H264,
> H265, and VP9 codecs by introducing a new structure to standardize
> supported level and profile information. By leveraging this changes,

this changes -> this change

cheers,
Nicolas

> chipset-specific conditional logic in the codec configuration
> functions is significantly reduced.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 93 ++++------------=
---
> =C2=A02 files changed, 34 insertions(+), 75 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index bb293ada6fb2..f38b5dc4bb74 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -76,6 +76,16 @@ struct vdec_pic_info {
> =C2=A0	unsigned int reserved;
> =C2=A0};
> =C2=A0
> +/**
> + * struct mtk_vcodec_dec_params - decoder supported parameters
> + * @level: decoder supported vcodec level
> + * @profile: decoder supported vcodec profile
> + */
> +struct mtk_vcodec_dec_params {
> +	s64 level;
> +	s64 profile;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct mtk_vcodec_dec_pdata - compatible data for each IC
> =C2=A0 * @init_vdec_params: init vdec params
> @@ -96,6 +106,9 @@ struct vdec_pic_info {
> =C2=A0 * @is_subdev_supported: whether support parent-node architecture(s=
ubdev)
> =C2=A0 * @uses_stateless_api: whether the decoder uses the stateless API =
with requests
> =C2=A0 * @chip_name: platforms configuration values
> + * @h264_params: H264 decoder default supported params
> + * @h265_params: H265 decoder default supported params
> + * @vp9_params: VP9 decoder default supported params
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_pdata {
> =C2=A0	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -118,6 +131,9 @@ struct mtk_vcodec_dec_pdata {
> =C2=A0	bool is_subdev_supported;
> =C2=A0	bool uses_stateless_api;
> =C2=A0	unsigned int chip_name;
> +	struct mtk_vcodec_dec_params h264_params;
> +	struct mtk_vcodec_dec_params h265_params;
> +	struct mtk_vcodec_dec_params vp9_params;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index aba28d276bdf..a1f419202a24 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -549,106 +549,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_c=
trl_ops =3D {
> =C2=A0static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config =
*cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8192:
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
> -		break;
> -	case 8183:
> -	case 8186:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h264_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_confi=
g *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h264_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config =
*cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h265_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_confi=
g *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h265_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *=
cfg,
> =C2=A0					=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8192:
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> -		break;
> -	case 8186:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->vp9_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config=
 *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->vp9_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *=
cfg,

--=-/GspWsZFGaUupRr8a+jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw5TwAKCRDZQZRRKWBy
9FyUAP4sMXwt3Br3AkviE1yy7rNUYdsYuv79azZRuF+fODYIYQD/Q6QSRoULxKsh
TVAryWLpAii5TtJJoXx7f3Bi3SBqcgQ=
=TJFP
-----END PGP SIGNATURE-----

--=-/GspWsZFGaUupRr8a+jt--

