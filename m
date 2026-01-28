Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC0ED25B78
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaX5SeYr04yx21vpaaJjMPXh3qprvCKzJ7wFPeNCJgI=; b=2xYCID3f+68uSVgCBomn/l2PjP
	x9P8PLnHeNxULi6su+5sJ8mllhuOo+0b40NnWl96kKrDxr57G+ia544U1QRRITS6oxsR6HTJoJC+6
	hS+ejxxtLdJqAEr+Qhk3w9IQ1bM6LXgsMT7eu90RSMauLR3cCKUSyCwF4v+EKzU9rluGK+6DsbKaD
	NCtidSrkmWzPitta1CFA1gzEpdAPb1XJYoDZnFjo7DR1oNjF4VIoQvxAkyQS3vagSC1AIelkSFooq
	V3CmiCNqUNw4bpfCktd0vRNEmfsIq16xBT5/AWbYcSVqdc/4DhI95Hlj1RrFaoHdLhH0ECREGQT4F
	ueAFlD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5ga-0000000G55X-36Fm;
	Wed, 28 Jan 2026 13:34:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5gX-0000000G53Q-3eJk;
	Wed, 28 Jan 2026 13:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769607254;
	bh=1L8+cvPFAK/AEvCUscuKOHEOR6RJuiCSEiAsXVI1H90=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gofiouF7rsOgVmjUjqsXH9V1DNDGf725nLNSthN1euiqd5cBZLhy47w3dSFDP7a1/
	 Ju4RjRcGJBCcodRGwoffxMbEliSBLTrltOhMzAyXz/1ucrwZ71Zx+cnPqZPjdiL664
	 rLjwst7JuayceZI/34RSFqmVOyfGb8/HM6t6pA5ogdYQA8y1jf+WxxfrgNOH1c2Q5T
	 197bVLhka1pmk8oxJVBzIJT3siG47zVgtG0tLIlCQ9sqCpWieeTdTEHusURwON9fNL
	 gksLXTw2bqvtooGRRUhMAO/yBf+dMHEVrJcWDuxHLXnr6eCqsJumnCPYLUTI4v/G7b
	 B8WNYHTW3Qrxg==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D24F517E01E7;
	Wed, 28 Jan 2026 14:34:11 +0100 (CET)
Message-ID: <e87868a6209d18595bf90bc20633ea300330ba28.camel@collabora.com>
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 George Sun =?UTF-8?Q?=28=E5=AD=99=E6=9E=97=29?=	 <George.Sun@mediatek.com>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=	
 <tiffany.lin@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,  "hverkuil@xs4all.nl"	
 <hverkuil@xs4all.nl>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=	 <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  Irui Wang
 =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?=	 <Irui.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"	
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "arnd@arndb.de"	 <arnd@arndb.de>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=	
 <Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, 
 "neil.armstrong@linaro.org"
	 <neil.armstrong@linaro.org>, Yilong Zhou
 =?UTF-8?Q?=28=E5=91=A8=E6=98=93=E9=BE=99=29?=
	 <Yilong.Zhou@mediatek.com>
Date: Wed, 28 Jan 2026 08:34:09 -0500
In-Reply-To: <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
		 <20260127024248.18406-6-kyrie.wu@mediatek.com>
		 <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
	 <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-FOrviNbeQ1Mf1Othbhwt"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_053418_128627_7424E3DE 
X-CRM114-Status: GOOD (  29.10  )
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


--=-FOrviNbeQ1Mf1Othbhwt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 28 janvier 2026 =C3=A0 07:45 +0000, Kyrie Wu (=E5=90=B4=E6=99=
=97) a =C3=A9crit=C2=A0:
> On Tue, 2026-01-27 at 13:07 +0100, AngeloGioacchino Del Regno wrote:
> > Il 27/01/26 03:42, Kyrie Wu ha scritto:
> > > This commit initializes codec profile & level for VDEC. It sets
> > > default values for H264, H265, and VP9 codecs across multiple
> > > chipset configurations.
> > >=20
> >=20
> > The previous patch "Refactor decoder profile and level handling" will
> > break the
> > driver if this patch is not also applied at the same time.
> >=20
> > The change looks good, but you should squash 05/10 in 04/10, and
> > assign the params
> > that you're adding here along with the refactoring, so that you get
> > one single
> > patch that, if applied, doesn't break anything as it doesn't depend
> > on additional
> > (future, as this is number 5) patch.
> >=20
> > Please squash
> >=20
> > Cheers,
> > Angelo
>=20
> Dear Angelo,
>=20
> The 04/10 and 05/10 were designed in one patch in v6,
> but Nicolas thought that refactor patch and configuration
> were two different changes, should separate them in this
> comments:=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20251202074038.31=
73-5-kyrie.wu@mediatek.com/
>=20
> In my mind, refactor profile and level setting and assign
> former ICs' parameters could merge into same patch. The
> configuration of MT8189 should split to another one, because
> it is a new setting.

I had assumed you'd be able to refactor without breaking it. Give me enough=
 time
to read again the patches since I don't remember all the details.

Nicolas

>=20
> Do you agree with my opinion? I look forward to your further reply.
>=20
> Thanks.
>=20
> Regards,
> Kyrie.
>=20
>=20
> >=20
> > > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > > ---
> > > =C2=A0 .../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 | 12 +++
> > > =C2=A0 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84
> > > +++++++++++++++++++
> > > =C2=A0 2 files changed, 96 insertions(+)
> > >=20
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > index 8ddb61670dc6..a47906b9d717 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8173_pdata =3D {
> > > =C2=A0=C2=A0	.is_subdev_supported =3D false,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8173,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > index a1f419202a24..b571c4ed3f79 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8183_pdata =3D {
> > > =C2=A0=C2=A0	.is_subdev_supported =3D false,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8183,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 /* This platform data is used for one lat and one core
> > > architecture. */
> > > @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8188_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8188,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8192,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8195,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8196,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =
=3D {
> > > @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8186_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8186,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata =3D {
> > > @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8189_pdata =3D {
> > > =C2=A0=C2=A0	.is_subdev_supported =3D true,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8189,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> >=20
> >=20

--=-FOrviNbeQ1Mf1Othbhwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXoQUQAKCRDZQZRRKWBy
9LcnAP4up5SULcFsY+6zYREYvzrK+KAbnNX5JtmUVqMTj4R/1AEAlqI+PRyEBoxB
KIF5bgVcbw5kaSZ/+UkJe169HlU7xAo=
=q5Vk
-----END PGP SIGNATURE-----

--=-FOrviNbeQ1Mf1Othbhwt--

