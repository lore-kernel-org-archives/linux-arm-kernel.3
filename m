Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32A1C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iZjlILwChOISsAJVEVKLUW2l1J7VnFxZKvNh79ZzhY=; b=dd1UEGq3J/gHnQK93+UAxFKL2Y
	kkbLqdS3cSSNttR6g8n/NyokEAzbV8dWTl31CFQlSa+MDWpAtJqu3Yo7XKWRnJWgK2Gs6wzSKdk4q
	yKRDf8ul8PiW8EljyVKr+p9FUwj/AQCzgi1Cu695oU+PjH3qSYNK+wedBaoj/kGuPhLdBYMVf+YRM
	HoF9m9K5PuQsvoT2uSLpNTJ+m2KlMkZDXkoWWQma9fiD8O8uhX7iEYG+RBD+OV2bcbypVd/JyqsPJ
	7yrPYrA482GSdqef9KLqoVhc2v5xsRBnmev+P0t/Q9pz0GnaaFVlDvkPufL54OkAq6Y/4+xO9PI+l
	CZAKl4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8Jh-0000000G2f7-3NfP;
	Wed, 15 Jul 2026 22:43:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8Jf-0000000G2eR-2xXr;
	Wed, 15 Jul 2026 22:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784155375;
	bh=5otzStxY/gQBAUVuIRSogQQsbqBySRFnWWxlNF3kI0w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hsoSJJ7DwbqAQ5vfqC12sd+2OYZw7GLF14kB6Nw8pLPn/sPP9A+szeWxRQSN5ktXT
	 P1/AuB060+ZroJUKjOeThweMLjTwTK99Iwm10ANc7YBVNblPPxSrt47YQ9iq47hHHp
	 lXNrSHPynKqJ2CqAQ5lGjUcBlaQLz6ZOewwccuikzG3jEn5A4qNDo/ooUqEZedMn/X
	 sqBRb6Lrf4RjiTopk4NAF3gDTaYIQ8MfjOSrR3tZlPhTmsbGptjhkUJcDesVnGGS75
	 VwJvSDlLtAf7BnegIUCJ4AyPkY2xDV679ePI/1abIXOo1kLbJPn9TxAmlHU+jIFXPP
	 SCXauiGEwawsQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BBF317E0D7E;
	Thu, 16 Jul 2026 00:42:53 +0200 (CEST)
Message-ID: <bc9e8f84b27e72d2d8ac9d18d2add1a55affdada.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: v4l2-ctrls: validate HEVC EXT SPS RPS
 counts
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Bommarito <michael.bommarito@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 18:42:52 -0400
In-Reply-To: <20260527194737.1999409-3-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
	 <20260527194737.1999409-1-michael.bommarito@gmail.com>
	 <20260527194737.1999409-3-michael.bommarito@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-+qIqzNsQ1iNYY2ZGJeue"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_154259_941123_302E0A89 
X-CRM114-Status: GOOD (  17.30  )
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


--=-+qIqzNsQ1iNYY2ZGJeue
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 27 mai 2026 =C3=A0 15:47 -0400, Michael Bommarito a =C3=A9crit=
=C2=A0:
> The HEVC SPS control carries the short-term and long-term RPS counts
> that decoder drivers use to walk the matching EXT SPS dynamic arrays.
> Reject SPS values that exceed the HEVC limits of 64 short-term sets and
> 32 long-term references so drivers cannot later index beyond those
> controls.
>=20
> Also reject EXT SPS ST RPS entries whose negative or positive picture
> counts exceed the 16-entry arrays, or whose combined delta-POC count
> exceeds the HEVC DPB maximum.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Cc: stable@vger.kernel.org
> Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
> =C2=A01 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 6b375720e395c..a1d773e5de20c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -16,6 +16,9 @@
> =C2=A0
> =C2=A0static const union v4l2_ctrl_ptr ptr_null;
> =C2=A0
> +#define V4L2_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
> +#define V4L2_HEVC_MAX_LONG_TERM_REF_PICS_SPS	32
> +
> =C2=A0static void fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctr=
l,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 changes)
> =C2=A0{
> @@ -1213,6 +1216,10 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SPS:
> =C2=A0		p_hevc_sps =3D p;
> =C2=A0
> +		if (p_hevc_sps->num_short_term_ref_pic_sets >
> +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_MAX_SHORT_TERM_REF_PIC_SETS)
> +			return -EINVAL;
> +
> =C2=A0		if (!(p_hevc_sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED)) {
> =C2=A0			p_hevc_sps->pcm_sample_bit_depth_luma_minus1 =3D 0;
> =C2=A0			p_hevc_sps->pcm_sample_bit_depth_chroma_minus1 =3D 0;
> @@ -1223,6 +1230,9 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
> =C2=A0		if (!(p_hevc_sps->flags &
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_P=
ICS_PRESENT))
> =C2=A0			p_hevc_sps->num_long_term_ref_pics_sps =3D 0;
> +		else if (p_hevc_sps->num_long_term_ref_pics_sps >
> +			 V4L2_HEVC_MAX_LONG_TERM_REF_PICS_SPS)
> +			return -EINVAL;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_PPS:
> @@ -1267,6 +1277,11 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
> =C2=A0
> =C2=A0		if (p_hevc_st_rps->flags & ~V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_R=
EF_PIC_SET_PRED)
> =C2=A0			return -EINVAL;
> +		if (p_hevc_st_rps->num_negative_pics > 16 ||
> +		=C2=A0=C2=A0=C2=A0 p_hevc_st_rps->num_positive_pics > 16 ||
> +		=C2=A0=C2=A0=C2=A0 p_hevc_st_rps->num_negative_pics +
> +		=C2=A0=C2=A0=C2=A0 p_hevc_st_rps->num_positive_pics > 16)
> +			return -EINVAL;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:

--=-+qIqzNsQ1iNYY2ZGJeue
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgM7AAKCRDZQZRRKWBy
9CLwAQCzfhsadhxi2FhrkKM8eULKaGZqAJvx82wsbVaLtwgdWQD+MigbdDAHQRs6
zXUQAvyGGzFompZa6a7yNqW/w6xM4g0=
=awvS
-----END PGP SIGNATURE-----

--=-+qIqzNsQ1iNYY2ZGJeue--

