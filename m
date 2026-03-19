Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8381091905
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oA4rOKB6nS9aFFMlSQslnNIxMAM0OBTYDUfK1PiIeoQ=; b=YEKyC7kzVsf3yTcvtccFsc36mg
	2Id+/0yMkXXdvkRT5nZaLFVsaYERZJ7Bin/cWG4z3hrUNDxSBhjW1u/tS9VDloaCbP+lg9kOwzEW9
	AArx2RVTiCiZ+FtQtQlgN7rZge7wVtcTvd4bJ2jpyeX2yvrzbiBYqysQYbg+Z0xPyN2VUKgmSlJuE
	TUbKYj8H5aV4RON6ARk0GT3vUfXF7c59GBu2Tp/1dmBk0ioepFhsXhLO6er7zWtYoM1Kbtokq3EqH
	JiuD1ez5AA1eqhCStVeMfwtNVAK7X5bdXmVXiflOYtB0drnFXj5NahcLPaqIC1AE0Lin/KJnwKTZi
	hZR7RRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hl0-0000000BGIH-1grh;
	Thu, 19 Mar 2026 18:06:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hkx-0000000BGHf-1LHH;
	Thu, 19 Mar 2026 18:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943559;
	bh=vgIomdEFLpCH/ayWCgPxi7rIPZPRA/uLntpDcg/oA6Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=b5EMQ616dun3Le9dLPr9o2OIVE8CMKpIbyDhPulHbDK036sEpVSbTySzL0wmlu8ge
	 lr64Xsbcagm5/8sPz1Y2c5jBnTG4pUGOQE1D826XX1uUpPTJd5JL0hTsj118MikWgc
	 5hwt29P85AeYn1s00eRHTJb8UqBwp744lch7cbaJnfvi0QaBbGcbRErZ8Bimjpb55/
	 Rj+6acv5q4scZ25v/Q3I8k4N6dxfvewxJMbrTEbBqNGb4JfKL52gzaZugAgTn44sVH
	 DPefnfADoSePS0Ww/DQC8qPGwkktJIlqOsQU+7gd0KCxdDVMEswMIr/avCB3XVHytH
	 oiUJcZX9bloEQ==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3676A17E127A;
	Thu, 19 Mar 2026 19:05:56 +0100 (CET)
Message-ID: <e49d7d5d2ae928e00486b1cfe8f255124d3958d8.camel@collabora.com>
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
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
Date: Thu, 19 Mar 2026 14:05:54 -0400
In-Reply-To: <20260127024248.18406-6-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-sy0z8PEWBL/CCb3Vp0df"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_110603_522942_2C25EBA0 
X-CRM114-Status: GOOD (  15.17  )
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


--=-sy0z8PEWBL/CCb3Vp0df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just to recap my expectations.

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This commit initializes codec profile & level for VDEC. It sets
> default values for H264, H265, and VP9 codecs across multiple
> chipset configurations.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 | 12 +++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84 ++++++++++++++++=
+++
> =C2=A02 files changed, 96 insertions(+)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> index 8ddb61670dc6..a47906b9d717 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8173,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index a1f419202a24..b571c4ed3f79 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8183,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0/* This platform data is used for one lat and one core architecture=
. */
> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pda=
ta =3D
> {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8188,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8192,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8195,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8196,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =3D {
> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdat=
a =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8186,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};

All of the above should be squashed into patch 04. Patch 04 should be moved
before any patches related to 8189.

> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata =3D {
> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pda=
ta =3D
> {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8189,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};

This hunk should be squashed with what is actually patch 03.

regards,
Nicolas

--=-sy0z8PEWBL/CCb3Vp0df
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw7AwAKCRDZQZRRKWBy
9PwGAP9rzgY7L9M1ieTU8Siy2SFrsV3eHnECJj+0oyYlyTmLPgD/afPtu/772SoD
pgdx2ZG6XqMN3qE5cvRAQHaBmhd/FgI=
=pxH0
-----END PGP SIGNATURE-----

--=-sy0z8PEWBL/CCb3Vp0df--

