Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E26FE77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBEsDivGSChJbJTvUd/3eII9rLd6uaabObDsuMpVJ6k=; b=dSR3HoZvrwtNzI+1jD2b4b8JlN
	sTXNtuRXO+BZueih2CfKXXMTRRnN/5TjuGIS+2+Gm0GkZ0T0XDXJcFaQCTt2fzR7gMYicUEKZ/eq9
	z49Nn4jS1JrX/Zn69Cynp/VSOMEBH9bE6bKFIjL3OTyTYByGJQS86Ll9H2iv+Wealf90f3YD3E0oC
	a+AwLnuD+LUAyiDUqSvpmHaMJ1CP2saovICUf+CfqyL4rX4hyrHdWkWvH+GQPFFtQdkJiUFi5ecF/
	uSgxUViwnQAOMqdz40UkRsUDCHE+nn/zLoM7AHdLwfPVk/p7wdPHHs3JwEZ2Vnbf1nFlqxjyHf3uo
	SEGsA3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQ9T-0000000H1ME-0Q4C;
	Wed, 24 Dec 2025 14:47:48 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQ9Q-0000000H1LD-2Bbb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 14:47:45 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b5ed9e7500so423822385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 06:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766587663; x=1767192463; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LBEsDivGSChJbJTvUd/3eII9rLd6uaabObDsuMpVJ6k=;
        b=iX5V6J6OsTRHow+XQLjdDSrKkHEx1cq002bSQPqSKYsjvIUJa9nZ30qDWyofZgZHl4
         AQd2wJdvWDOWyzpbQqoPWdd/TJoKpWOcJdALRYSuHpE1IJg5zxAvv2VmFL8WA5XTkw8r
         FE4OJtm7JHl2zXCkEq3rxM1je1+nbbjDaYPItj5gcB4Q8wtyuFMPGYaP/7yruUDHgRER
         9cZRpbl1ukFHqypsWvmd6s5T78CZHinlfxg84ixwPGAvNKMP+7ifHQnI9c6l8McPNMC5
         1c8yBF0pzG2BGc8afYYJAJxSohn8r5Y8jMXdMGyKko0uR6SH2Yw3YA0NNUaYyBMLNiqr
         72tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766587663; x=1767192463;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBEsDivGSChJbJTvUd/3eII9rLd6uaabObDsuMpVJ6k=;
        b=OL6V3fzGB7JNyqWrNEGMFNGXvpadWfffcVtkUee0A4JAG9bgYNa0SjiFX8fWYAj5XN
         2sW2V8AZiNaT1FudOllzt70W6QxSp7ktJ0U1BgBKfoLXCBy5Cs8mO2BSNZGf/m9s56Yq
         gnHamMVcim7lDKyZ/NwUyQ/GqH/Kplwcpvd47za51PUQjN5mYA4qJExfrB0hvyzFWoUO
         j+xcQzDdQS1V2rLMko+9tY/5ZOAjTYRYT8I5GGq0A9uLtFZECZvulGzDwcvwfDTV3fwV
         VxYuGSbi3cgRf1igWO+KZcZiwhlut9Jlj4tDkGmJnSnM5iBNlFO94Sx6DlyNV+IGToEY
         yWGg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Exb6r+nOz4B5d2/YB3GHMkcdXLK/A0/zPHPcdbFhIJASFhlcDkRAaSJt3U5gkMMmOvJxLIyyfmticwz3FOcH@lists.infradead.org
X-Gm-Message-State: AOJu0YxUE6BNEi2CrUl1S/1yyIzybSosuLBEKY/8CS8EFHRRHIPUjErH
	B0YAPKXjKz6XpDYM6pLvdm3YOdG+Y+RH1A2nuzrlqh9l2H6R3ETL/WDaxM60hVm2g2c=
X-Gm-Gg: AY/fxX71LOZd/uJ2h/Y/FYy3Eod7q0DnK4ba1exrB5exgxAydbYmoLPlbOhcewPtf1L
	eBG20t67thlHP70mDu0ZSQKJgSqe+oS+HO99VuaVtCvqqpTqRzz+Zagfuy5Dv/lkQiEEANRKVjx
	eFdp2ErhOS1KSNBbQbEfLYGT2qZCKB7awkWNbWRcCIKJnV0fC/cXP0ypd/4ZkmntQUFI6aN2MYQ
	AMdis1zqSNqJy3HD+7kBj6+ue8Ypk2tLSxRcqF5300I5PxKxwAbP+zjBgxrcvfS/PrIBYv+Yz2o
	I21xDxkAde11kUwb0jL8FUgaoYBWXDYDbY2diD1YLVlWArUi7PPDtESIacLpzBnN36k24SrVz0A
	lii9kYU1pKB29hrXdX4WmHiSnp5LcHUvsIgmL3V/eACdcvTIHijSaRPpgsvtvFLNV1bxzjFMfQ1
	RcLGWM3T0jt8OhfTfxV2PGyluGMVk=
X-Google-Smtp-Source: AGHT+IHkL5S7c322hOUPMSd0JRYhx3f5vqqmst0RYftiEEMVjDrbHdesJAI78R34ucxzMcZvnLJBFg==
X-Received: by 2002:a05:620a:17a7:b0:8b2:de6a:e3 with SMTP id af79cd13be357-8c09002815fmr2696981385a.81.1766587662056;
        Wed, 24 Dec 2025 06:47:42 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm1403379885a.45.2025.12.24.06.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:47:41 -0800 (PST)
Message-ID: <43c953bd75ad65f249cf71115bb87179b6ba3f47.camel@ndufresne.ca>
Subject: Re: [PATCH v2 03/22] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
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
Date: Wed, 24 Dec 2025 09:47:39 -0500
In-Reply-To: <20251203-spu-rga3-v2-3-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-3-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-mZ8PQwwqOQIytKI71eZq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_064744_585815_B949A3D6 
X-CRM114-Status: GOOD (  23.50  )
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


--=-mZ8PQwwqOQIytKI71eZq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
> specify a custom stride alignment in bytes. This is necessary for
> hardware like the Rockchip RGA3, which requires the stride value to be
> aligned to a 16 byte boundary.

                  byte -> bytes

You way aligned to bytes here ...


>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 34 ++++++++++++++++++++++++=
----------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A02 files changed, 28 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 2c7ac70c0f486..f86e7d7d29b8e 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -404,11 +404,12 @@ static inline unsigned int v4l2_format_block_height=
(const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_stride(const struct v4=
l2_format_info *info, int plane,
> -						=C2=A0=C2=A0=C2=A0 unsigned int width)
> +						=C2=A0=C2=A0=C2=A0 unsigned int width, u8 alignment)
> =C2=A0{
> =C2=A0	unsigned int hdiv =3D plane ? info->hdiv : 1;
> =C2=A0	unsigned int aligned_width =3D
> =C2=A0		ALIGN(width, v4l2_format_block_width(info, plane));
> +	aligned_width =3D ALIGN(aligned_width, alignment);

But you actually align the width, which can already be achieved using frmsi=
ze-
>step_width and v4l2_apply_frmsize_constraints(). It would make little sens=
e for
the step to not be a multiple of the block for tiled format, but it shows y=
ou
forgot to take into considering the fact that block_width has precedence he=
re,
since you can't split tiles.

If you go back to your original idea, stride alignment, remember that you c=
annot
break the block alignment. For non-mplane format, you also need to special =
case
subsampled planer format (3 planes) so that userspace can guess the subsequ=
ence
plane strides (which is done by dividing the luma plane stride by 2, and if=
 you
need 16 bytes alignment across all strides, then you need the luma plane to=
 be
32 bytes alignment). The mplane format don't have this requirement, since y=
ou
pass explicitly the stride of each planes, though, you may want to double i=
t
anyway for compatibility reason (small cost, big gain).

Nicolas

> =C2=A0
> =C2=A0	return DIV_ROUND_UP(aligned_width, hdiv) *
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp[plane] / info->bpp_=
div[plane];
> @@ -425,9 +426,10 @@ static inline unsigned int v4l2_format_plane_height(=
const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_size(const struct v4l2=
_format_info *info, int plane,
> -						=C2=A0 unsigned int width, unsigned int height)
> +						=C2=A0 unsigned int width, unsigned int height,
> +						=C2=A0 u8 stride_alignment)
> =C2=A0{
> -	return v4l2_format_plane_stride(info, plane, width) *
> +	return v4l2_format_plane_stride(info, plane, width, stride_alignment) *
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_format_plane_height(info=
, plane, height);
> =C2=A0}
> =C2=A0
> @@ -448,8 +450,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *=
height,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
> =C2=A0
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment)
> =C2=A0{
> =C2=A0	const struct v4l2_format_info *info;
> =C2=A0	struct v4l2_plane_pix_format *plane;
> @@ -466,23 +469,34 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt,
> =C2=A0
> =C2=A0	if (info->mem_planes =3D=3D 1) {
> =C2=A0		plane =3D &pixfmt->plane_fmt[0];
> -		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0		plane->sizeimage =3D 0;
> =C2=A0
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0			plane->sizeimage +=3D
> -				v4l2_format_plane_size(info, i, width, height);
> +				v4l2_format_plane_size(info, i, width, height,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0	} else {
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++) {
> =C2=A0			plane =3D &pixfmt->plane_fmt[i];
> =C2=A0			plane->bytesperline =3D
> -				v4l2_format_plane_stride(info, i, width);
> +				v4l2_format_plane_stride(info, i, width,
> +							 stride_alignment);
> =C2=A0			plane->sizeimage =3D plane->bytesperline *
> =C2=A0				v4l2_format_plane_height(info, i, height);
> =C2=A0		}
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
> +
> +int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> +			u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> +					=C2=A0=C2=A0 width, height, 1);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> =C2=A0
> =C2=A0int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelforma=
t,
> @@ -502,12 +516,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
> =C2=A0	pixfmt->width =3D width;
> =C2=A0	pixfmt->height =3D height;
> =C2=A0	pixfmt->pixelformat =3D pixelformat;
> -	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width, 1);
> =C2=A0	pixfmt->sizeimage =3D 0;
> =C2=A0
> =C2=A0	for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0		pixfmt->sizeimage +=3D
> -			v4l2_format_plane_size(info, i, width, height);
> +			v4l2_format_plane_size(info, i, width, height, 1);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 401d8506c24b5..edd416178c333 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -558,6 +558,10 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,=
 u32 pixelformat,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 u32 width, u32 height);
> =C2=A0int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 =
pixelformat,
> =C2=A0			u32 width, u32 height);
> +/* @stride_alignment is a power of 2 value in bytes */
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment);
> =C2=A0
> =C2=A0/**
> =C2=A0 * v4l2_get_link_freq - Get link rate from transmitter

--=-mZ8PQwwqOQIytKI71eZq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUv9CwAKCRDZQZRRKWBy
9GnoAP9k199P3pJOTxl16yVHL1ryd4uoElf1GW6VBr1Og/rjyAEAlxzgLGtwgB8C
GSr0/lkk8PfDbueJp3vtdCkiH0HR2wI=
=+slk
-----END PGP SIGNATURE-----

--=-mZ8PQwwqOQIytKI71eZq--

