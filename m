Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874D4D3E77A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gh23UAyksHCUzsRUF9JuL5g9bubGJqwcUdevrwgLSxA=; b=zHd49Lod/m+m+2p95gcbhrTiBH
	P+vw4dj1gMJFI+pxnSQtvMDSBKJHbrFaBZCikc1ujLe2Wruz70xS330Qhoc7jKFpUBeSgtrcGOIFS
	ytRIqjz/ggjzdw3Lk9duAkvwUWqVgD1/S+2uvgNg2xdCdF/wjYiE0x5kaIXWviGaQ6S+8c61cWcSk
	A5dOgAQSlbrN1ZhqA136cxr51xmZYb5cyRlLpiicWeyzSuMMo0eBcWkkt2GlQ4RIykEvYEQfTIfxw
	b7GamEirUNKiEHTEWUcNucJfPhInz4jw0ryT/1FF1+GcKtaw8QUUiIZp/Uda/7B11o+22R6b0EPyT
	k7mviIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQfJ-0000000FpSJ-0D8N;
	Wed, 10 Dec 2025 20:20:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQfF-0000000FpRf-2oZV;
	Wed, 10 Dec 2025 20:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765397995;
	bh=Z1Kt8aZIkI5Tlf50hh/PTJzThQxXe6Mg6zV0iqPoOTA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FS7LXlG/gnuUq/nRxAqqQBmBT5vc/RETKbcChZF1Lq+U9gOqbYhRYaV7A4doi4pXn
	 kirrSc5n8StZbr1xnTZryG2bJMEVo9qZedfmSp24XXc2P/rqq+2CZgmzXSDbuRFdlu
	 RwhyKD9lGEQBAncTYjEeIX3GmFsYZbhxgix2kac8L7reWR02O+VkBGOM6ZDbBOjJeR
	 qepyEWSm+iEpMv1XvV9qpxb+xtIMDzttGgwne3r3nshDt46/dKxBGvHevXI4Prn5je
	 CJihckrsCvYq0e7UjDgc1u/tM7c5PozJdtl794CPuRsJoWbBS86WQDdto0xfRqe7Fe
	 6wJigG6XeApbA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71E4B17E10F3;
	Wed, 10 Dec 2025 21:19:52 +0100 (CET)
Message-ID: <1e1eeec3f121697f914abee362ee657093fcf42b.camel@collabora.com>
Subject: Re: [PATCH v4 05/15] media: rkvdec: Use structs to represent the HW
 RPS
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
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:19:50 -0500
In-Reply-To: <20251022174508.284929-6-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-6-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-Lhn0+NaPrg56z5WYaKPR"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_121958_018763_ED9918FE 
X-CRM114-Status: GOOD (  19.30  )
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


--=-Lhn0+NaPrg56z5WYaKPR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 13:44 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> This is in preparation to add support for other variants of the decoder.
>=20
> Moving to struct representation is mainly to prepare for multicore
> support that is present in e.g. rk3588.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-h264.c=C2=A0=C2=A0=C2=A0 | 93 +=
++++++++++++++++--
> =C2=A01 file changed, 84 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-h264.c
> index 989379ae3a73..cb17dfcae5ca 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> @@ -19,7 +19,6 @@ extern const s8 rkvdec_h264_cabac_table[4][464][2];
> =C2=A0
> =C2=A0/* Size with u32 units. */
> =C2=A0#define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
> -#define RKV_RPS_SIZE			((128 + 128) / 4)
> =C2=A0#define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
> =C2=A0
> =C2=A0#define RKVDEC_NUM_REFLIST		3
> @@ -34,6 +33,40 @@ struct rkvdec_sps_pps_packet {
> =C2=A0	u32 info[8];
> =C2=A0};
> =C2=A0
> +struct rkvdec_rps_entry {
> +	u32 dpb_info0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off0:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off1:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off2:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off3:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off4:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off5:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off6:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off7:=C2=A0=C2=A0=C2=A0 1;
> +} __packed;
> +
> +struct rkvdec_rps {
> +	u16 frame_num[16];
> +	u32 reserved0;
> +	struct rkvdec_rps_entry entries[12];
> +	u32 reserved1[66];
> +} __packed;
> +
> =C2=A0struct rkvdec_ps_field {
> =C2=A0	u16 offset;
> =C2=A0	u8 len;
> @@ -94,7 +127,7 @@ struct rkvdec_ps_field {
> =C2=A0struct rkvdec_h264_priv_tbl {
> =C2=A0	s8 cabac_table[4][464][2];
> =C2=A0	struct rkvdec_h264_scaling_list scaling_list;
> -	u32 rps[RKV_RPS_SIZE];
> +	struct rkvdec_rps rps;
> =C2=A0	struct rkvdec_sps_pps_packet param_set[256];
> =C2=A0	u8 err_info[RKV_ERROR_INFO_SIZE];
> =C2=A0};
> @@ -260,6 +293,51 @@ static void lookup_ref_buf_idx(struct rkvdec_ctx *ct=
x,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static void set_dpb_info(struct rkvdec_rps_entry *entries,
> +			 u8 reflist,
> +			 u8 refnum,
> +			 u8 info,
> +			 bool bottom)
> +{
> +	struct rkvdec_rps_entry *entry =3D &entries[(reflist * 4) + refnum / 8]=
;
> +	u8 idx =3D refnum % 8;
> +
> +	switch (idx) {
> +	case 0:
> +		entry->dpb_info0 =3D info;
> +		entry->bottom_flag0 =3D bottom;
> +		break;
> +	case 1:
> +		entry->dpb_info1 =3D info;
> +		entry->bottom_flag1 =3D bottom;
> +		break;
> +	case 2:
> +		entry->dpb_info2 =3D info;
> +		entry->bottom_flag2 =3D bottom;
> +		break;
> +	case 3:
> +		entry->dpb_info3 =3D info;
> +		entry->bottom_flag3 =3D bottom;
> +		break;
> +	case 4:
> +		entry->dpb_info4 =3D info;
> +		entry->bottom_flag4 =3D bottom;
> +		break;
> +	case 5:
> +		entry->dpb_info5 =3D info;
> +		entry->bottom_flag5 =3D bottom;
> +		break;
> +	case 6:
> +		entry->dpb_info6 =3D info;
> +		entry->bottom_flag6 =3D bottom;
> +		break;
> +	case 7:
> +		entry->dpb_info7 =3D info;
> +		entry->bottom_flag7 =3D bottom;
> +		break;
> +	}
> +}
> +
> =C2=A0static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct v4l2_h264_reflist_builder *builder,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> @@ -269,11 +347,10 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> =C2=A0	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> =C2=A0	struct rkvdec_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> =C2=A0
> -	u32 *hw_rps =3D priv_tbl->rps;
> +	struct rkvdec_rps *hw_rps =3D &priv_tbl->rps;
> =C2=A0	u32 i, j;
> -	u16 *p =3D (u16 *)hw_rps;
> =C2=A0
> -	memset(hw_rps, 0, sizeof(priv_tbl->rps));
> +	memset(hw_rps, 0, sizeof(*hw_rps));
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Assign an invalid pic_num if DPB entry at that position is inac=
tive.
> @@ -285,7 +362,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> =C2=A0		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> =C2=A0			continue;
> =C2=A0
> -		p[i] =3D builder->refs[i].frame_num;
> +		hw_rps->frame_num[i] =3D builder->refs[i].frame_num;
> =C2=A0	}
> =C2=A0
> =C2=A0	for (j =3D 0; j < RKVDEC_NUM_REFLIST; j++) {
> @@ -312,9 +389,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> =C2=A0			dpb_valid =3D run->ref_buf[ref->index] !=3D NULL;
> =C2=A0			bottom =3D ref->fields =3D=3D V4L2_H264_BOTTOM_FIELD_REF;
> =C2=A0
> -			set_ps_field(hw_rps, DPB_INFO(i, j),
> -				=C2=A0=C2=A0=C2=A0=C2=A0 ref->index | dpb_valid << 4);
> -			set_ps_field(hw_rps, BOTTOM_FLAG(i, j), bottom);
> +			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bo=
ttom);
> =C2=A0		}
> =C2=A0	}
> =C2=A0}

--=-Lhn0+NaPrg56z5WYaKPR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnV5gAKCRDZQZRRKWBy
9HgUAP9MFE1Tk5ky30YEttWcBCUbQcjSa7t09snLCVavi5QxfwEAuzLiSVQzaPBP
r8aGdnCmJextyFHKP+kDrwNkzn3iYQk=
=naLu
-----END PGP SIGNATURE-----

--=-Lhn0+NaPrg56z5WYaKPR--

