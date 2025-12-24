Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A733E776F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcC2/wRdvVVn4EBbf9oNqdQI8h7Pk69qNBD1NEvRhAo=; b=MklB3/HvWxtY5Df8lCQilJMVle
	Ul7MyGg5LGSYtwZgodkTLQQKOwhopxk/feGPhV0VwpYsWNn+Y2DgSTgnbsqex80CAM6rG5VNMdO1T
	wPyPMBhC1Q7PxdMhn3HFs4KJ/8TjCIw+WgcjswD4cRbDasDjPvavc7DEXDjoG4qksEIalmYvv4s/x
	mD4G+rreV4upGfgreT8EetibB+fWp1DPmsVb3sfQm/TdfQrOtafciggXVS7iRseYbXi6gWG0djXOD
	LYcW+LPHldz307y8Ng13EC9nd8U6JpDrlrL+fpnp/l6ctqX5N5msKLuvBgdIrqDcsPArwUavcJzt2
	GjQRPp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUTr-0000000HM5S-1YTc;
	Wed, 24 Dec 2025 19:25:07 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUTn-0000000HM54-42Zb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:25:06 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso468421685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604302; x=1767209102; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EcC2/wRdvVVn4EBbf9oNqdQI8h7Pk69qNBD1NEvRhAo=;
        b=I+8hBTgaLfFvzyLvnjLBI3Nlq3Alg+alnzd4cPb62zoDA01WXxDoyQAXwHXivzqQu1
         SkJyt5ij391NC03u4DHNqCy6RWkOFQRzHiUb4hRCFts5vkDuOWJwp564jVOAZ8X4+3mv
         xlxL+K5sKJp/iaFhAE4dEHmTXzqWpyABHEDtjN6uxczEL3pjzWObg2azaGi+86lTf55c
         dPEn9R3LDf9eHASZVj6SgST3TSJNTYZC7ceKa3PR6JTcL9snpTkY7wgOo87wEHyMnZTb
         8WyBpjz2ebeJPt72nxUyB6ps+R5U+zCGD+Zb5coX6A0pIgOdjMiD+u+VecOuf5zB/1xN
         SRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604302; x=1767209102;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcC2/wRdvVVn4EBbf9oNqdQI8h7Pk69qNBD1NEvRhAo=;
        b=e1mTGVxq02DpAZY0/UyOeKzbxvw1+goFUt1D8MHR0RGMu+uaQtLXadDsc9CP+5k4nf
         6fs9qC4qQ8H6/9nPwrKhbIS7AFOKa/MoGJHVBNbi92hR6hf/bxHNkZElmu5w1FD1TS8w
         3qk9E3Pir9tG7vOf47k28FRu529KJYZcM8x9gcdpsLe/PPR4ZvsiJXvhrSwoNuki+jnG
         0lEvcfpTEYXQQUPg/aioSLL6sWE1FCClmYEuene9RZtPFYhwCV6TQd05bBBp2zLCjMHL
         +yAiXGSpmhryj2E6yEkxtSWgdmES9wEzt3ENWCg+2bOl9hZ3IysMU6naFYtuiw2F4KMD
         uX2A==
X-Forwarded-Encrypted: i=1; AJvYcCXFGMRPA8Oj9GLwTDJOu+0pyxt4RDkZ6us2re4vr7j1pDVZZz0+wY+eTi9/t/xSI7cLXEe5uud0Fv4NyrqCWS4a@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdu8HcdMuu4AFTmoeuXH5qG37r15ri8VnW6KSqRxJMdWC+lDrP
	ZNNf6FsalyNdmvH2NZAhilV7oeH6Rbp6fgEYvRmfqorOKB3jwMCaU+DvJBac5J7T/RI=
X-Gm-Gg: AY/fxX5vA68ty1Ej7JS7HIRs1nl0oyaQKQAw+OoExfM6LZOzfmBbA6MBpYBEiSAOlkC
	k/8BpHOKepfSnx/WXVs0zVjXAcErCr5CodJQ6XYWFcK12/pnKfVX9ltCKFi2IQsIVDQY620oyXx
	YdGzrnDMvDmx0NHfSwwcf8lDSSDFLyay3+fKT7ZcwNpxmv67bJFOmPDNf0l29qY7x781/Ju4MR7
	9wX16s4bJQtokwt0ldct6nAmHm/+NejMWLjatt3/Sq67YGAvbBz3AQ40VKlsTqJE05rzEKyySPd
	skoWVaPvt/Vr8mQgOleP0RN1+oPBA963nqR9KU2dpIYpQ9+cftUkjvbYxQ/w6YilPsKd3kMigNv
	VPZBLKitD6XLemH+3hpMVwSk9gO8OWoB4FFlb4u2u9AUiguyKJpi3VdF10TySwrHI15ywiAvMIj
	iETBXEm+W8NnzYLExa
X-Google-Smtp-Source: AGHT+IHz8XgMTn76ZHlPpnpvAj1H6/tJW+eqYOQ1q/VE3zGtKMA6q+I33ugOdqv7oLXVyELPXYLVCg==
X-Received: by 2002:a05:620a:831b:b0:8c1:7bc9:3aa5 with SMTP id af79cd13be357-8c17bc940d8mr713344385a.0.1766604302282;
        Wed, 24 Dec 2025 11:25:02 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783662sm1421044985a.5.2025.12.24.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:01 -0800 (PST)
Message-ID: <8d5952b87a1456b2b2203b6321888a16980d7a8b.camel@ndufresne.ca>
Subject: Re: [PATCH v4 3/3] media: amphion: Trigger source change if
 colorspace changed
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:24:59 -0500
In-Reply-To: <20251217030227.1546-4-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-4-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-e7Chkxp9Nxc1QldT920F"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_112504_026099_104BEB04 
X-CRM114-Status: GOOD (  17.85  )
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


--=-e7Chkxp9Nxc1QldT920F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> After encountering a colorspace change in the stream, the decoder
> sends a V4L2_EVENT_SOURCE_CHANGE event with changes set to
> V4L2_EVENT_SRC_CH_RESOLUTION.
>=20
> Then the client can detect and handle the colorspace change without any
> buffer reallocation
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0 | 61 =
+++++++++++++++--------
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c |=C2=A0 1 -
> =C2=A02 files changed, 40 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index f25dbcebdccf..beeaf75c76b4 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -950,7 +950,7 @@ static void vdec_stop_done(struct vpu_inst *inst)
> =C2=A0	vpu_inst_unlock(inst);
> =C2=A0}
> =C2=A0
> -static bool vdec_check_source_change(struct vpu_inst *inst)
> +static bool vdec_check_source_change(struct vpu_inst *inst, struct vpu_d=
ec_codec_info *hdr)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0	const struct vpu_format *sibling;
> @@ -962,26 +962,35 @@ static bool vdec_check_source_change(struct vpu_ins=
t *inst)
> =C2=A0		return false;
> =C2=A0
> =C2=A0	sibling =3D vpu_helper_find_sibling(inst, inst->cap_format.type, i=
nst->cap_format.pixfmt);
> -	if (sibling && vdec->codec_info.pixfmt =3D=3D sibling->pixfmt)
> -		vdec->codec_info.pixfmt =3D inst->cap_format.pixfmt;
> +	if (sibling && hdr->pixfmt =3D=3D sibling->pixfmt)
> +		hdr->pixfmt =3D inst->cap_format.pixfmt;
> =C2=A0
> =C2=A0	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))
> =C2=A0		return true;
> -	if (inst->cap_format.pixfmt !=3D vdec->codec_info.pixfmt)
> +	if (inst->cap_format.pixfmt !=3D hdr->pixfmt)
> =C2=A0		return true;
> -	if (inst->cap_format.width !=3D vdec->codec_info.decoded_width)
> +	if (inst->cap_format.width !=3D hdr->decoded_width)
> =C2=A0		return true;
> -	if (inst->cap_format.height !=3D vdec->codec_info.decoded_height)
> +	if (inst->cap_format.height !=3D hdr->decoded_height)
> =C2=A0		return true;
> =C2=A0	if (vpu_get_num_buffers(inst, inst->cap_format.type) < inst->min_b=
uffer_cap)
> =C2=A0		return true;
> -	if (inst->crop.left !=3D vdec->codec_info.offset_x)
> +	if (inst->crop.left !=3D hdr->offset_x)
> =C2=A0		return true;
> -	if (inst->crop.top !=3D vdec->codec_info.offset_y)
> +	if (inst->crop.top !=3D hdr->offset_y)
> =C2=A0		return true;
> -	if (inst->crop.width !=3D vdec->codec_info.width)
> +	if (inst->crop.width !=3D hdr->width)
> =C2=A0		return true;
> -	if (inst->crop.height !=3D vdec->codec_info.height)
> +	if (inst->crop.height !=3D hdr->height)
> +		return true;
> +	if (!hdr->progressive)
> +		return true;
> +
> +	if (vdec->seq_hdr_found &&
> +	=C2=A0=C2=A0=C2=A0 (hdr->color_primaries !=3D vdec->codec_info.color_pr=
imaries ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0 hdr->transfer_chars !=3D vdec->codec_info.tran=
sfer_chars ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0 hdr->matrix_coeffs !=3D vdec->codec_info.matri=
x_coeffs ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0 hdr->full_range !=3D vdec->codec_info.full_ran=
ge))
> =C2=A0		return true;
> =C2=A0
> =C2=A0	return false;
> @@ -1333,20 +1342,25 @@ static void vdec_event_seq_hdr(struct vpu_inst *i=
nst, struct vpu_dec_codec_info
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0
> =C2=A0	vpu_inst_lock(inst);
> -	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
> =C2=A0
> -	vpu_trace(inst->dev, "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d\n",
> +	vpu_trace(inst->dev,
> +		=C2=A0 "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d, colorspace: %d,=
 %d, %d, %d\n",
> =C2=A0		=C2=A0 inst->id,
> -		=C2=A0 vdec->codec_info.decoded_width,
> -		=C2=A0 vdec->codec_info.decoded_height,
> -		=C2=A0 vdec->codec_info.offset_x,
> -		=C2=A0 vdec->codec_info.offset_y,
> -		=C2=A0 vdec->codec_info.width,
> -		=C2=A0 vdec->codec_info.height,
> +		=C2=A0 hdr->decoded_width,
> +		=C2=A0 hdr->decoded_height,
> +		=C2=A0 hdr->offset_x,
> +		=C2=A0 hdr->offset_y,
> +		=C2=A0 hdr->width,
> +		=C2=A0 hdr->height,
> =C2=A0		=C2=A0 hdr->num_ref_frms,
> -		=C2=A0 hdr->num_dpb_frms);
> +		=C2=A0 hdr->num_dpb_frms,
> +		=C2=A0 hdr->color_primaries,
> +		=C2=A0 hdr->transfer_chars,
> +		=C2=A0 hdr->matrix_coeffs,
> +		=C2=A0 hdr->full_range);
> =C2=A0	inst->min_buffer_cap =3D hdr->num_ref_frms + hdr->num_dpb_frms;
> -	vdec->is_source_changed =3D vdec_check_source_change(inst);
> +	vdec->is_source_changed =3D vdec_check_source_change(inst, hdr);
> +	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
> =C2=A0	vdec_init_fmt(inst);
> =C2=A0	vdec_init_crop(inst);
> =C2=A0	vdec_init_mbi(inst);
> @@ -1375,7 +1389,12 @@ static void vdec_event_resolution_change(struct vp=
u_inst *inst)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0
> -	vpu_trace(inst->dev, "[%d]\n", inst->id);
> +	vpu_trace(inst->dev, "[%d] input : %d, decoded : %d, display : %d, sequ=
ence : %d\n",
> +		=C2=A0 inst->id,
> +		=C2=A0 vdec->params.frame_count,
> +		=C2=A0 vdec->decoded_frame_count,
> +		=C2=A0 vdec->display_frame_count,
> +		=C2=A0 vdec->sequence);
> =C2=A0	vpu_inst_lock(inst);
> =C2=A0	vdec->seq_tag =3D vdec->codec_info.tag;
> =C2=A0	vdec_clear_fs(&vdec->mbi);
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 47dff9a35bb4..121165a7184f 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -102,7 +102,6 @@ static int vpu_notify_eos(struct vpu_inst *inst)
> =C2=A0int vpu_notify_source_change(struct vpu_inst *inst)
> =C2=A0{
> =C2=A0	static const struct v4l2_event ev =3D {
> -		.id =3D 0,
> =C2=A0		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> =C2=A0		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION
> =C2=A0	};

--=-e7Chkxp9Nxc1QldT920F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw+DAAKCRDZQZRRKWBy
9CCgAQCJEcF67WbJCFUJ9LDCkCSQrAPnJ5AUlW1B1MtmPrdnyQD/bln376ZTtTKz
q3xQG4oYSaWKF3oR8duW1S5G/Fz0fwc=
=B805
-----END PGP SIGNATURE-----

--=-e7Chkxp9Nxc1QldT920F--

