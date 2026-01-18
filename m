Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3240BC98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 21:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYYxd4tqCi8l89aZHiK/UBdTWSc77z7Y0jNX9tpFvRI=; b=4LiL8m0/gKj9C44JFMASlu77Jd
	C5Xx682D4KQG69MOpy9IQxVPa3RKv4Qc5uHz3gqPnkLu0bm8X21PLlHA9V3wrt570SuQoroEX4DUt
	m96dZlhth/1V8kHPTk4kAja1sclzxPNYul6WkiDgxrM+q/UodHCQKSJ5wyGIV0Z//OnAqNfOBttb5
	6Cv4Ygrz24hq+pvDJ0ZrQ8SuE3y5Cp+MXMH0xFnfErBUAiZPXgtW4U0ShBAdaB+F03K1dh/dq6GL8
	4hF9MSpJxl8y+IsGMkhKbzJ4G44tueNEU+UPriOqv71YHfEtI8ri6w6ha64PQtIvpG5JsXLcmrRrV
	MVeaXriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhaly-000000013h6-48C7;
	Sun, 18 Jan 2026 21:57:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhalv-000000013gi-43jI;
	Sun, 18 Jan 2026 21:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768773440;
	bh=SkoDb3XsdPpTEIo43TlFFcbIq9dvFL3Zt2nSK5wZs/k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lonf9www44IfHE6Qzysbz11D9Q3NJ7nLg73IuZ08XSJkv7B1dpnINi1gLfqib5Omx
	 uD6NQsdE6dMd9F/2oxf130d99OxFzqmkp0IijICaYdZsMLgdAHOUgOPpqombrAen0j
	 jKjg0crS3Uu9gJcC20wUkRzUVlqB2B7Kha7/f9C6+GY4K703XIWiFM39AC4H8JTxDN
	 DSx6K2B1QfHg+LuFG49bOvY7TMiEgYDMulzeTRl+0cVo544mhdGOSf6D+sfAQByoZz
	 Iwn6hYOm3TXPA7JVyhmLhYHXhxyMM4jrMAWwagsG3Zas3ZWIIXd906y6RGWi5X6gv9
	 ou+LzTnHauYkg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EF8017E0222;
	Sun, 18 Jan 2026 22:57:17 +0100 (CET)
Message-ID: <9a579e2269a1f038e3b32fbf060211717b7a557a.camel@collabora.com>
Subject: Re: [PATCH v8 03/17] media: visl: Add HEVC short and long term RPS
 sets
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Jonas Karlman	 <jonas@kwiboo.se>, Diederik de Haas
 <didi.debian@cknow.org>
Date: Sun, 18 Jan 2026 16:57:15 -0500
In-Reply-To: <20260109161538.1294449-4-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-4-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-kVootli7QnlYJLgUtppV"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_135724_170268_96509FB4 
X-CRM114-Status: GOOD (  13.68  )
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


--=-kVootli7QnlYJLgUtppV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Log the recently added v4l2 controls to set HEVC short and long term RPS
> sets with 2 new ftrace entries.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/test-drivers/visl/visl-dec.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 +++
> =C2=A0drivers/media/test-drivers/visl/visl-dec.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +
> =C2=A0.../media/test-drivers/visl/visl-trace-hevc.h | 59 ++++++++++++++++=
+++
> =C2=A03 files changed, 69 insertions(+)
>=20
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/t=
est-drivers/visl/visl-dec.c
> index d90b79de8384..6bbf93757047 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -547,6 +547,9 @@ static void visl_trace_ctrls(struct visl_ctx *ctx, st=
ruct visl_run *run)
> =C2=A0			trace_v4l2_hevc_dpb_entry(&run->hevc.dpram->dpb[i]);
> =C2=A0
> =C2=A0		trace_v4l2_hevc_pred_weight_table(&run->hevc.spram->pred_weight_t=
able);
> +		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(run->hevc.rps_lt);
> +		trace_v4l2_ctrl_hevc_ext_sps_st_rps(run->hevc.rps_st);
> +
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_AV1:
> =C2=A0		trace_v4l2_ctrl_av1_sequence(run->av1.seq);
> @@ -611,6 +614,10 @@ void visl_device_run(void *priv)
> =C2=A0		run.hevc.spram =3D visl_find_control_data(ctx, V4L2_CID_STATELESS=
_HEVC_SLICE_PARAMS);
> =C2=A0		run.hevc.sm =3D visl_find_control_data(ctx, V4L2_CID_STATELESS_HE=
VC_SCALING_MATRIX);
> =C2=A0		run.hevc.dpram =3D visl_find_control_data(ctx, V4L2_CID_STATELESS=
_HEVC_DECODE_PARAMS);
> +		run.hevc.rps_lt =3D visl_find_control_data(ctx,
> +							 V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
> +		run.hevc.rps_st =3D visl_find_control_data(ctx,
> +							 V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_AV1:
> =C2=A0		run.av1.seq =3D visl_find_control_data(ctx, V4L2_CID_STATELESS_AV=
1_SEQUENCE);
> diff --git a/drivers/media/test-drivers/visl/visl-dec.h b/drivers/media/t=
est-drivers/visl/visl-dec.h
> index c2c2ef3a8798..6e7562e555bb 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.h
> +++ b/drivers/media/test-drivers/visl/visl-dec.h
> @@ -7,6 +7,7 @@
> =C2=A0#ifndef _VISL_DEC_H_
> =C2=A0#define _VISL_DEC_H_
> =C2=A0
> +#include "linux/v4l2-controls.h"
> =C2=A0#include "visl.h"
> =C2=A0
> =C2=A0struct visl_fwht_run {
> @@ -43,6 +44,8 @@ struct visl_hevc_run {
> =C2=A0	const struct v4l2_ctrl_hevc_slice_params *spram;
> =C2=A0	const struct v4l2_ctrl_hevc_scaling_matrix *sm;
> =C2=A0	const struct v4l2_ctrl_hevc_decode_params *dpram;
> +	const struct v4l2_ctrl_hevc_ext_sps_lt_rps *rps_lt;
> +	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_st;
> =C2=A0};
> =C2=A0
> =C2=A0struct visl_av1_run {
> diff --git a/drivers/media/test-drivers/visl/visl-trace-hevc.h b/drivers/=
media/test-drivers/visl/visl-trace-hevc.h
> index 837b8ec12e97..963914c463db 100644
> --- a/drivers/media/test-drivers/visl/visl-trace-hevc.h
> +++ b/drivers/media/test-drivers/visl/visl-trace-hevc.h
> @@ -1,4 +1,5 @@
> =C2=A0/* SPDX-License-Identifier: GPL-2.0+ */
> +#include "linux/v4l2-controls.h"
> =C2=A0#if !defined(_VISL_TRACE_HEVC_H_) || defined(TRACE_HEADER_MULTI_REA=
D)
> =C2=A0#define _VISL_TRACE_HEVC_H_
> =C2=A0
> @@ -343,6 +344,54 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmp=
l,
> =C2=A0	))
> =C2=A0);
> =C2=A0
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> +	TP_ARGS(lt),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, l=
t)),
> +	TP_fast_assign(__entry->lt =3D *lt),
> +	TP_printk("\nflags %s\n"
> +		=C2=A0 "lt_ref_pic_poc_lsb_sps %x\n",
> +		=C2=A0 __print_flags(__entry->lt.flags, "|",
> +		=C2=A0 {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
> +		=C2=A0 ),
> +		=C2=A0 __entry->lt.lt_ref_pic_poc_lsb_sps
> +	)
> +)
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> +	TP_ARGS(st),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, s=
t)),
> +	TP_fast_assign(__entry->st =3D *st),
> +	TP_printk("\nflags %s\n"
> +		=C2=A0 "delta_idx_minus1: %u\n"
> +		=C2=A0 "delta_rps_sign: %u\n"
> +		=C2=A0 "abs_delta_rps_minus1: %u\n"
> +		=C2=A0 "num_negative_pics: %u\n"
> +		=C2=A0 "num_positive_pics: %u\n"
> +		=C2=A0 "used_by_curr_pic: %08x\n"
> +		=C2=A0 "use_delta_flag: %08x\n"
> +		=C2=A0 "delta_poc_s0_minus1: %s\n"
> +		=C2=A0 "delta_poc_s1_minus1: %s\n",
> +		=C2=A0 __print_flags(__entry->st.flags, "|",
> +		=C2=A0 {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_R=
EF_PIC_SET_PRED"}
> +		=C2=A0 ),
> +		=C2=A0 __entry->st.delta_idx_minus1,
> +		=C2=A0 __entry->st.delta_rps_sign,
> +		=C2=A0 __entry->st.abs_delta_rps_minus1,
> +		=C2=A0 __entry->st.num_negative_pics,
> +		=C2=A0 __entry->st.num_positive_pics,
> +		=C2=A0 __entry->st.used_by_curr_pic,
> +		=C2=A0 __entry->st.use_delta_flag,
> +		=C2=A0 __print_array(__entry->st.delta_poc_s0_minus1,
> +				ARRAY_SIZE(__entry->st.delta_poc_s0_minus1),
> +				sizeof(__entry->st.delta_poc_s0_minus1[0])),
> +		=C2=A0 __print_array(__entry->st.delta_poc_s1_minus1,
> +				ARRAY_SIZE(__entry->st.delta_poc_s1_minus1),
> +				sizeof(__entry->st.delta_poc_s1_minus1[0]))
> +	)
> +)
> +
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
> =C2=A0	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> @@ -391,6 +440,16 @@ DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2=
_ctrl_hevc_decode_params,
> =C2=A0	TP_ARGS(d)
> =C2=A0);
> =C2=A0
> +DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext_sps_=
lt_rps,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> +	TP_ARGS(lt)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext_sps_=
st_rps,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> +	TP_ARGS(st)
> +);
> +
> =C2=A0DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
> =C2=A0	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> =C2=A0	TP_ARGS(e)

--=-kVootli7QnlYJLgUtppV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1XOwAKCRDZQZRRKWBy
9PvjAP4mmVlS0S0FlhUxKz3/pGk0KFqABCa5V5n9+A8acMhFWQEA1hj1S6gjbtbE
oHOqNjHoSW/Bopo+as+AvPD1ppBCQg4=
=l77h
-----END PGP SIGNATURE-----

--=-kVootli7QnlYJLgUtppV--

