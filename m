Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5306CE7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2psI/aP141t9WJvg+/Adc2m4sAlYqZvtnAn83waLW1A=; b=vVRfTjFYyDp9jBetO1u2EyL9FY
	j5C3AEcJNKdK3AnWXIo16lv1Nfi8AaWnypSuP/W8sguP7Ndf7fYD2aSYpb63Xr33jL3KexXBrJCR4
	DNRgWBXr+XYpGnLxTnioqpiYAyHUIrnzBtHecHarVR53/KxPIzPh7jT08wXglwitj7mYiwfVjSaxg
	oOPQQEf6dyGx0B60idPXoeM1KadJPXJuUfAAu+K8mC2WA7GBVmuR8IQJIRiFsFUkAjbfpZi9TN9qR
	a4hTJvR56kUhZ85bJEb0oZq81pxapj8fCoNGHF2byLnjLMXqDW8z+xwr35AtI7DAcQjIbV+jEIztB
	mkSSZ+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRCI-0000000HAFo-2xvf;
	Wed, 24 Dec 2025 15:54:46 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRCB-0000000HADD-1ty1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:54:45 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-88a35a00506so34285736d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766591678; x=1767196478; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2psI/aP141t9WJvg+/Adc2m4sAlYqZvtnAn83waLW1A=;
        b=XB/w+rEUwRBS0TTRScmVGb8g4zJeoozQ3Tj1e/FgLbTg7iSjgwZijCzE2ojVVfMYW8
         eNtHFxBpQ/njDp/WONnx8JHyIOX8vVq8u+6s2+ubQ4zhxmSiQTr7I9HbY8gSFmFAk058
         PXA2a2N732edAdfaAQncN+XKaGv7fc6BD2hjDNSXeCkIS6Eirrl46e+1pul5img3v26L
         OQhvtJLuxhTWJ0+3BhkZXkUPKP4B32PhjcjQOANzHRNQNIgBSkCpOAqxcVikRVLedTiq
         BgBxf7bLQs1vGDRz5uFP5AhWbj1pbG0CFJhGVbZlvmmSQ3XgWi2mXCzjbIcpGqjLTr0b
         w/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591678; x=1767196478;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2psI/aP141t9WJvg+/Adc2m4sAlYqZvtnAn83waLW1A=;
        b=STBcz9e5CxialV+X5zHvNyR32sDKmZJduWMcLKxpLwjnaBnnyDZZTmk1GgmhRAQzbj
         QEKhgL+IUkAudaC/Kub0kcNPoztw9YIUxL/fQcQK2QVCJuuNYBtN2uPJ9FKyryANdWtt
         M6OcDcQedfBWrxAcMMwAhlX6he6aRTWsfEmRcIvinz8SovJO7ocdpQcgVL4r0AkRKTHh
         DsLg418D/yddQ2F63q8k8Z0cR0WhA1IfJdO4OGNn+hPHb6iG+eZQAQKOiTQUuNJntG5O
         T6zTjm/Bm6LaWzTL0QdINyDVpRKRPNsULmisWv2tggNBu/sQwQcuOqGZCCJXPIja2Vfe
         rumw==
X-Forwarded-Encrypted: i=1; AJvYcCXqURcTXsncem1HQkigI8UFFDcvWsj5aLQrT7YVw5H2Kgzf22XvokKJPKNAOPTb1INzkBMMFGTRcgthQH7flbUl@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqNxmWhk5SuaskmnZo7ER4RGawNyJ5WbIBCLk0dvFgRcpTReC
	b9K9t8NLxAff5KFEnxMvu03V8Snk26c1RV0r27XeQuGnh+N/QMq/9hFV8iOGsS4sUdA=
X-Gm-Gg: AY/fxX4bcRieKB+VgSdTzw2SUgbNaER2jmyq2Qj4zdYOxDWv6LuU44FrHotX8L9WQOv
	CWo4x6Ie1Cm6f7hK2GFzlogi44E4F3lSv0dBKlOCSRHfl36qBXbS2pkhK2ZZxsmGsdqNJMRqmkn
	XXPN7VE53rP/gnFITH/QnuidROerIayPfGMZzWrO677U5G8v/0daRXU3psz+hARG1Kl49JL1t+z
	eez5PkgdfqC+Gi0Z3rvy47AKuqhwMJNsSCmBQzSZ9Cb53BDmK5BOKeEOHALnqYJUnZEs2n/DPH4
	Q9yV+7v8N79K16Jbjem+TSpqNm/7Vt/yKo2cVsjVRRYB6gaKsnCdQ2sqPzVvZvaKDN7NaWN9HqP
	K8KxbhCzlwLN12hqcR8ve5aV7PCDgNRGaiHJnnUS7evrfmQryE+iuC5xVLWdk0dA/SUgBrBvro4
	/yISAod52nxrcSJnlo
X-Google-Smtp-Source: AGHT+IFedl+Q8MBCrfyVIi5r/7wpFkhmE319oxOmZ6vllizWd7jQjQ9oQPtTNc+Zn0Eoas5UOmjdHQ==
X-Received: by 2002:a05:6214:240f:b0:88a:449d:73d7 with SMTP id 6a1803df08f44-88d82339423mr299817076d6.28.1766591678130;
        Wed, 24 Dec 2025 07:54:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9759f164sm128316756d6.24.2025.12.24.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:54:37 -0800 (PST)
Message-ID: <7c25b77adbadf5f325ce15996ff609c893a1e7b8.camel@ndufresne.ca>
Subject: Re: [PATCH v2 16/22] media: rockchip: rga: remove size from
 rga_frame
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Wed, 24 Dec 2025 10:54:36 -0500
In-Reply-To: <20251203-spu-rga3-v2-16-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-16-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-iHp+SZRXdImhT9S7j5MC"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075439_519121_469A02A2 
X-CRM114-Status: GOOD (  20.76  )
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


--=-iHp+SZRXdImhT9S7j5MC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> The size member is only used for the mmu page table mapping.
> Therefore avoid storing the value and instead only calculate it
> in place. This also avoids the calculation entirely when an external
> iommu is used.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 6 +++++-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 8 ++------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1 -
> =C2=A03 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index e8d1e2e579140..8de6b9c3fd615 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,9 +79,13 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	struct rga_frame *f =3D rga_get_frame(ctx, vb->vb2_queue->type);
> =C2=A0	size_t n_desc =3D 0;
> +	u32 size =3D 0;
> +	u8 i;

Move in it the scope it is being used.

> =C2=A0
> =C2=A0	if (rga_has_internal_iommu(rga)) {

though, after looking more attentively, this function is a no-op when the i=
s an
external iommu. Using an early return would make this so much clearer, and =
you
can then drop the indent.

	if (rga_has_internal_iommu(rga))
		return 0;

Perhaps a comment to be applied on patch 14 though.

> -		n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> +		for (i =3D 0; i < f->pix.num_planes; i++)
> +			size +=3D f->pix.plane_fmt[i].sizeimage;
> +		n_desc =3D DIV_ROUND_UP(size, PAGE_SIZE);
> =C2=A0
> =C2=A0		rbuf->n_desc =3D n_desc;
> =C2=A0		rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 1bfc4021f4a7b..0d7b0bcac950e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -221,7 +221,6 @@ static int rga_open(struct file *file)
> =C2=A0	};
> =C2=A0
> =C2=A0	def_frame.stride =3D (def_width * def_frame.fmt->depth) >> 3;
> -	def_frame.size =3D def_frame.stride * def_height;
> =C2=A0
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> @@ -428,9 +427,6 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm =3D rga_get_frame(ctx, f->type);
> =C2=A0	if (IS_ERR(frm))
> =C2=A0		return PTR_ERR(frm);
> -	frm->size =3D 0;
> -	for (i =3D 0; i < pix_fmt->num_planes; i++)
> -		frm->size +=3D pix_fmt->plane_fmt[i].sizeimage;
> =C2=A0	frm->fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> @@ -443,10 +439,10 @@ static int vidioc_s_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0	frm->pix =3D *pix_fmt;
> =C2=A0
> =C2=A0	v4l2_dbg(debug, 1, &rga->v4l2_dev,
> -		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
> +		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
> =C2=A0		=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
> =C2=A0		=C2=A0 &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
> -		=C2=A0 frm->stride, frm->size);
> +		=C2=A0 frm->stride);
> =C2=A0
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++) {
> =C2=A0		v4l2_dbg(debug, 1, &rga->v4l2_dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index fc81bc5562792..466d568b9e614 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -37,7 +37,6 @@ struct rga_frame {
> =C2=A0
> =C2=A0	/* Variables that can calculated once and reused */
> =C2=A0	u32 stride;
> -	u32 size;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_dma_desc {

--=-iHp+SZRXdImhT9S7j5MC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwMvAAKCRDZQZRRKWBy
9MazAP9SPSZieUXA48LDd5tOkCfcSw+tIQ3exEWQZqU4r0gOYQD+NnIkcgsXCMtT
DnOj2pkPBBxXjYYajH29kpn5EGDkJwM=
=AGpj
-----END PGP SIGNATURE-----

--=-iHp+SZRXdImhT9S7j5MC--

