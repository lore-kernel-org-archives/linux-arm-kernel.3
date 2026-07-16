Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AADC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 02:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBPsq3oZXwhpSh2XrVu878yUmmYOIRjytvCJ/xaqJJ0=; b=fyjdJxIoGb9qM6kW6wS/zJcllA
	iiXR0xZwgBAoixFOtpGLDW9OLNUL4IJ6mlh0+8hDhtAzBRD/A1oxoUWtI2IM6rq70Vlg/fE+Y46jc
	0QvAVJrIyPSMeU55sO0AqDKpEGzrXeciTPPtd8qRcXe+FKZTHzdQvQe6TgdjX+MQfo/cRkscMvY02
	fPALfeLxSlZVeglI/nPanvaoAyFzW/p5t/eA4cGhugmDNY2ct2XzWgItxvJ3mqpdXF2QGXyTiaklX
	OdgweQ0JenfnPGThRczNlTpC4ccf0gBszfC6obHEMVmkPtL2LTrqro6Rb1KOHO+eQFg49YhJKFvIn
	3MbnR01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBo2-0000000GGoS-30HN;
	Thu, 16 Jul 2026 02:26:34 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBnz-0000000GGna-0Nj4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 02:26:32 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8eeb4508f29so62557626d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 19:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784168790; x=1784773590; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBPsq3oZXwhpSh2XrVu878yUmmYOIRjytvCJ/xaqJJ0=;
        b=oG4X/YvLI2pRB+IvD2Wb7cHRJDb2eYKj5tRuvoIGinVYRx3Vtv5dPL7jqG/revvsAZ
         +R71QBadrh4oiR69xjeupZFA7twHJH+B6xEfEjG2k8JOxrzaNR5PoWFRD927nCgmeuZT
         NQS9YDLfyDOIlu8GrNtQ/eBBx8oBlNHfHIe1Kw0iOqSs4taSBXf8fxIOf0BUiQrAvZQr
         luW1IFTFzLVJKK30QFpAMTQMdyRJKR+yDqukSEx3As+NE8/KTzhx3GxOKPTGsGKNZ6kh
         oI8cn275E0hPs6+R4Zyrl+y9vWg0n6g8g1xhgGAVBX3LVooW0dWIuLhrYdZkZReIWNhg
         bvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784168790; x=1784773590;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBPsq3oZXwhpSh2XrVu878yUmmYOIRjytvCJ/xaqJJ0=;
        b=DfCI9NJnCfPtPt0V+a8kiIX6aAYXC1wBFaBdhTFzetHoiz81rfblmKD1hRD2jc1/Vt
         poqGSnPFbcjz+ldzTr4PSuTFZmf9Lk4Q3AVbVDJBo713b9fiSQ2Xc8FBWIvR+q9TMOII
         ZaDe7K+0bNdKxPf5RBV/wpSoLlR4kbV5jJQz1FAOz7JcB+cAsMYARYjsRtabgiHI7fGJ
         TFOxOwN/Aesvrx6/Lby/EOwIZ74e1fY45sfgSLanC5YAwObAfMarJdUvirMAaupnoJ8K
         qFifPQPK1aKuTjnJtYQsYG9YwiJI92QK4XxCZTa7M2uYn7EanShOY/rVimZTcR+IcrVy
         9lfg==
X-Forwarded-Encrypted: i=1; AHgh+RoS22eCQlHrOE8zdP1FUmsAFIn7yri9EI6Iiq2VrDv2yfc0cp14Dtx4yx/M9q3VUrzexAmqh1nt4xGHOa9oXmz4@lists.infradead.org
X-Gm-Message-State: AOJu0YxvdOcQUfMpjIZsgyoaH3Kpg7XI9HDQXJBYw+cFFlKk4TBEKARs
	0HeyBfOjbfACrmED2sX9e8QZWGLYKGdepeB9h7x2tBqLK1e/uNK5YEwN+5FQ/pYq7ex1vN5V2xX
	SZuVlxJpQXg==
X-Gm-Gg: AfdE7cn01ksablyx6CuDNjTdG1Q4HK0FUPlHFRuR54b7xRwYLKULCEyMUdg7XpbmuQH
	EZD/VEVY3jQ+YDU/DdWLTrCv9+LMA1bmbIm9gTDeN2/YR908lkCQTk6kP9LzWWJRZXrSXSLNdLY
	XXwqXCg3exyCRKuoBGF2HlruOGjMKtutDP34UM9dysTuw1nxpJCNgrlGN0MEUBp9U8LAIRv5coc
	3zQGuZpsN0cVyprh0LAI96U3JmhCAa3Ld65R47/i8ptK/97rm0BnSVhF2rj7lxYGso56nuXvbX5
	iM4ueCXYyeKVw9B+RNdbixc1wA5359a2yQrBwH1T7LSgzH8FUyFn4mwA6CVb/g8Z068Cyn/0dgk
	BofEss72PHdnhYi4FuAJsN3ODlayLZMb67vmbbiwsbN6+cbczmk+iGP2ayNR42ZdxmmLe+3Po27
	n5np3+aZE=
X-Received: by 2002:a05:6214:5005:b0:8ec:235c:7a66 with SMTP id 6a1803df08f44-90758d0d3c0mr59599196d6.27.1784168789618;
        Wed, 15 Jul 2026 19:26:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c06e1sm206619606d6.14.2026.07.15.19.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:26:28 -0700 (PDT)
Message-ID: <95a47297c80c78345510cb5c09d9614841dcdb7a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: use DIV_ROUND_UP() for CTB counts
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hiroki Nakajima <3na7nanana@gmail.com>, detlev.casanova@collabora.com, 
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 22:26:27 -0400
In-Reply-To: <20260712072652.2881919-1-3na7nanana@gmail.com>
References: <20260712072652.2881919-1-3na7nanana@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-bNkDQXvvPI7fGSpXPcBO"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_192631_149652_6A752581 
X-CRM114-Status: GOOD (  15.95  )
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


--=-bNkDQXvvPI7fGSpXPcBO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 12 juillet 2026 =C3=A0 16:26 +0900, Hiroki Nakajima a =C3=A9cri=
t=C2=A0:
> Use DIV_ROUND_UP() when computing HEVC coding tree block counts
> instead of open-coding the same rounding expression. This keeps the
> rounding intent explicit without changing behavior.
>=20
> Found using a Coccinelle rule generated from the DIV_ROUND_UP() macro
> definition.
>=20
> Signed-off-by: Hiroki Nakajima <3na7nanana@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c=C2=A0 | 8 =
++++----
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=C2=A0 | 8 =
++++----
> =C2=A03 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index 87abf93dfd5e..ff3942f91c5d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -258,9 +258,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0		for (i =3D 0; i <=3D pps->num_tile_rows_minus1; i++)
> =C2=A0			WRITE_PPS(pps->row_height_minus1[i], ROW_HEIGHT(i));
> =C2=A0	} else {
> -		WRITE_PPS(((sps->pic_width_in_luma_samples + ctb_size_y - 1)
> / ctb_size_y) - 1,
> +		WRITE_PPS(DIV_ROUND_UP(sps->pic_width_in_luma_samples,
> ctb_size_y) - 1,
> =C2=A0			=C2=A0 COLUMN_WIDTH(0));
> -		WRITE_PPS(((sps->pic_height_in_luma_samples + ctb_size_y - 1)
> / ctb_size_y) - 1,
> +		WRITE_PPS(DIV_ROUND_UP(sps->pic_height_in_luma_samples,
> ctb_size_y) - 1,
> =C2=A0			=C2=A0 ROW_HEIGHT(0));
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> index fe6414a17551..d07c74679552 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> @@ -261,8 +261,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	memset(row_height, 0, sizeof(row_height));
> =C2=A0
> =C2=A0	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_si=
ze +
> log2_min_cb_size);
> -	pic_in_cts_width =3D (width + max_cu_width - 1) / max_cu_width;
> -	pic_in_cts_height =3D (height + max_cu_width - 1) / max_cu_width;
> +	pic_in_cts_width =3D DIV_ROUND_UP(width, max_cu_width);
> +	pic_in_cts_height =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0
> =C2=A0	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
> =C2=A0		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
> @@ -275,8 +275,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0						=C2=A0 column_width, row_height);
> =C2=A0		}
> =C2=A0	} else {
> -		column_width[0] =3D (width + max_cu_width - 1) / max_cu_width;
> -		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> +		column_width[0] =3D DIV_ROUND_UP(width, max_cu_width);
> +		row_height[0] =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < 20; i++) {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 3575338a531a..3462d995d4cf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -287,8 +287,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	memset(row_height, 0, sizeof(row_height));
> =C2=A0
> =C2=A0	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_si=
ze +
> log2_min_cb_size);
> -	pic_in_cts_width =3D (width + max_cu_width - 1) / max_cu_width;
> -	pic_in_cts_height =3D (height + max_cu_width - 1) / max_cu_width;
> +	pic_in_cts_width =3D DIV_ROUND_UP(width, max_cu_width);
> +	pic_in_cts_height =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0
> =C2=A0	if (tiles_enabled) {
> =C2=A0		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
> @@ -301,8 +301,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0						=C2=A0 column_width, row_height);
> =C2=A0		}
> =C2=A0	} else {
> -		column_width[0] =3D (width + max_cu_width - 1) / max_cu_width;
> -		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> +		column_width[0] =3D DIV_ROUND_UP(width, max_cu_width);
> +		row_height[0] =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < 20; i++)

--=-bNkDQXvvPI7fGSpXPcBO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalhBVAAKCRDZQZRRKWBy
9FbPAQDvknjU5MBUBlBk+2NOWC1I7Q9Cjqj2M0AnwCfQTfkg5wD/Trt36/37q2Ks
fllOCGSBF7ly4N7X+HlKSf5YFnqQqgI=
=3mvY
-----END PGP SIGNATURE-----

--=-bNkDQXvvPI7fGSpXPcBO--

