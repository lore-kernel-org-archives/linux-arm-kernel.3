Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC35EC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hah8xMwtrntwfJmxq5xanQiqWRLwCEWuJJkLlImKYlo=; b=302rHZ/ZIyTkD/JurPi5xGWjJr
	g/lrkgy5w4Dpy3pBn7M42Zv1PhGadcHrLhXzM+0msrFWe86snJ5M1w+/ZHwaHE2y6bXqJSLM910bD
	wMa7ILKay8/Hyku1Y1qJwAPwKl98KZNGXVuBKVMcFxNG8gJc8eAt+X3+qj/pxf5vLyI5vs/l8WGw0
	djkTBooqXy3gmjpEPB+KOslWE8SwVYLNg7JN1BErB0CsC9V2R612wRnW+9hKQASpr6TkojBVfWiP5
	3mgLamUuPtmilcS0STuhOy/7lyAmMCm/Is1//n7B29EFHiiYA584y8w7PohJzLupc8X3u+vFyKlVb
	ik0DS+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcon-00000009yWW-14oi;
	Wed, 09 Jul 2025 21:59:09 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa0u-00000009au4-0ahQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:59:29 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-7048d8fec46so9144176d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752087566; x=1752692366; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hah8xMwtrntwfJmxq5xanQiqWRLwCEWuJJkLlImKYlo=;
        b=t06IUoYp4gFk9xb5RLnObvNAeRPc7+UgiEPYZSm6uwzU9iyT0xv8hkNCIAyqR/xQlC
         A3hyk5LoBJtfV+s3kCJY3uQHAw1dNCKdS9ytODs9ehs4VaqwTMMiG+ravUzffZNbmQlF
         Dlaq2ppdab5N1ode/EVgdnq+Y/qMtDTXYQyXNak4bFrEH/F+E0c6Jx3yxczkXAD71Xtt
         R7EccSFaDimf4NdTU6b1rr+2jIypc04nI56hBNbgu2TpmuUqjlT4qSb/Wjk16p3ZIH7A
         fTjUM9MxcHQMcm8G5oJe+0M5vn3yTaKspnJ3Uq59TcCJqcuKytr20LyVZgSOsgvJH4wJ
         RK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752087566; x=1752692366;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hah8xMwtrntwfJmxq5xanQiqWRLwCEWuJJkLlImKYlo=;
        b=ejSgkDRh9hzuK7QFTwiGMwqX0PUvG+SlPduRPEw+QwB4PT7BYP7F5OXdgVCuESFxxl
         hmA5YKenzSjRBjFJF617jj4Tbbv39iR1MRblsxu0W5nwkk6WMpy8NbUGiNoF1WnQSr+j
         sicUccxZZNIL6Y2S5oOGIjuyOptFGDMtmj5THJhfnfq4k5MdJxmdkoj93yIqk5pWmC+Q
         hNB8lNqJVlMIZFp8aTBx3QjHNjJuWnyYV8E1LkUtJEH3gEt61iBBfbxy/4DAT6o7l4oX
         giXcTdUy43lMa32bMMoARl0SvGFtUTsVtn2qHhbzDOKZ0mXA8aNJxXvE21OKcCf62yYX
         YPlw==
X-Forwarded-Encrypted: i=1; AJvYcCVFkKnt2oo6mRRpIaCTED18HG0O9rOxE3zQNYJIYWMQagwWLRR36TgZgv0R8FS+5A9AYg+HJa4GXcvr5C7bdtWw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1dlrkIcVKBvUMNyo627Wn466tsfB3PP7JdiPw5buPewqJX/So
	cNQv/sLrevqxVnvD59C20wZ1kyF9LunCMKs8+oy0955KlkL2pM0HXTrEcSYoQea0qiM=
X-Gm-Gg: ASbGncvnjXDUW+cqrCUW80ywsOmJbSzzXd45QxQN9Fzv15viQ+DYfg14kxz/71s5a4n
	+jDB9bqLsTKaej1cfP4Vh1WY90SQW16jZEchz6l3Emw0xsgNH9+5s3/SQCsM74+ojOSsWNEnD2I
	esUpz8z97/fZo0MoT0TePetosUFy1LNiu2hvMI+qCJs7tulJdP+el4BpRLeT4MBlyB6YOrejU4L
	Ufu3LkLO78fW01KQxhzOc0JST6BPwcNnqmS+JuWOQ5Gg5zebDqyRI6wgw1QkP9D1TqztOKgpbnP
	6pWZPMpaPHZy45Vo+j+8J2kf5tbLUcuDog74w/xNY4yRfwwniJQAOLprw3bvmpv8BXrlzb3lCvf
	VtQ==
X-Google-Smtp-Source: AGHT+IEsmXyVdEbnWdXGnl0jejitKG8pR37Z+42TY6cq1R1SWQIVZRAxicjh2OAHwFA4l3xkXwgkCA==
X-Received: by 2002:a05:6214:5f82:b0:704:886b:72dc with SMTP id 6a1803df08f44-704959cbf6emr8146366d6.2.1752087566238;
        Wed, 09 Jul 2025 11:59:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc7407sm96838676d6.8.2025.07.09.11.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 11:59:25 -0700 (PDT)
Message-ID: <b45e0cabadac5d2d9dbdc467b1c29f8eaae72c9c.camel@ndufresne.ca>
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner	 <heiko@sntech.de>, Dan Scally
 <dan.scally@ideasonboard.com>, Sakari Ailus	 <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Jul 2025 14:59:23 -0400
In-Reply-To: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
	 <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qC+6NnOKYiwDd0VA7yXp"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_115928_264932_EC149A3C 
X-CRM114-Status: GOOD (  39.00  )
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


--=-qC+6NnOKYiwDd0VA7yXp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 08 juillet 2025 =C3=A0 12:40 +0200, Jacopo Mondi a =C3=A9crit=C2=
=A0:
> Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
>=20
> The header defines two types that all drivers that use the extensible
> parameters format for ISP configuration shall use to build their own
> parameters format.
>=20
> The newly introduce type v4l2_params_block represent the
> header to be prepend to each ISP configuration block and the
> v4l2_params_buffer type represent the base type for the configuration
> parameters buffer.
>=20
> The newly introduced header is not meant to be used directly by
> applications which should instead use the platform-specific ones.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++
> =C2=A0include/uapi/linux/media/v4l2-extensible-params.h | 106 +++++++++++=
+++++++++++
> =C2=A02 files changed, 112 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca1394=
6ea28bd80134cb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
> =C2=A0F:	drivers/media/i2c/vd56g3.c
> =C2=A0F:	drivers/media/i2c/vgxy61.c
> =C2=A0
> +V4L2 EXTENSIBLE PARAMETERS FORMAT
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	include/uapi/linux/media/v4l2-extensible-params.h
> +
> =C2=A0VF610 NAND DRIVER
> =C2=A0M:	Stefan Agner <stefan@agner.ch>
> =C2=A0L:	linux-mtd@lists.infradead.org
> diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/=
uapi/linux/media/v4l2-extensible-params.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9be=
fde5c0dee601cfb
> --- /dev/null
> +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) =
*/
> +/*
> + * Video4Linux2 extensible configuration parameters base types
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef _UAPI_V4L2_PARAMS_H_
> +#define _UAPI_V4L2_PARAMS_H_
> +
> +#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> +/*
> + * Note: each ISP driver exposes a different uAPI, where the types layou=
t
> + * match (more or less strictly) the hardware registers layout.
> + *
> + * This file defines the base types on which each ISP driver can impleme=
nt its
> + * own types that define its uAPI.
> + *
> + * This file is not meant to be included directly by applications which =
shall
> + * instead only include the ISP-specific implementation.
> + */
> +#error "This file should not be included directly by applications"
> +#endif
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct v4l2_params_block - V4L2 extensible parameters block header
> + *
> + * This structure represents the common part of all the ISP configuratio=
n
> + * blocks. Each parameters block shall embed an instance of this structu=
re type
> + * as its first member, followed by the block-specific configuration dat=
a. The
> + * driver inspects this common header to discern the block type and its =
size and
> + * properly handle the block content by casting it to the correct block-=
specific
> + * type.
> + *
> + * The @type field is one of the values enumerated by each platform-spec=
ific ISP
> + * block types which specifies how the data should be interpreted by the=
 driver.
> + * The @size field specifies the size of the parameters block and is use=
d by the
> + * driver for validation purposes.
> + *
> + * The @flags field is a bitmask of platform-specific control flags.
> + *
> + * Userspace shall never use this type directly but use the platform spe=
cific
> + * one with the associated data types.
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> + *
> + * @type: The parameters block type (platform-specific)
> + * @flags: A bitmask of block flags (platform-specific)
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct v4l2_params_block {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> + *
> + * This struct contains the configuration parameters of the ISP algorith=
ms,
> + * serialized by userspace into a data buffer. Each configuration parame=
ter
> + * block is represented by a block-specific structure which contains a
> + * :c:type:`v4l2_params_block` entry as first member. Userspace populate=
s
> + * the @data buffer with configuration parameters for the blocks that it=
 intends
> + * to configure. As a consequence, the data buffer effective size change=
s
> + * according to the number of ISP blocks that userspace intends to confi=
gure and
> + * is set by userspace in the @data_size field.
> + *
> + * The parameters buffer is versioned by the @version field to allow mod=
ifying
> + * and extending its definition. Userspace shall populate the @version f=
ield to
> + * inform the driver about the version it intends to use. The driver wil=
l parse
> + * and handle the @data buffer according to the data layout specific to =
the
> + * indicated version and return an error if the desired version is not
> + * supported.
> + *
> + * For each ISP block that userspace wants to configure, a block-specifi=
c
> + * structure is appended to the @data buffer, one after the other withou=
t gaps
> + * in between nor overlaps. Userspace shall populate the @data_size fiel=
d with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * Each ISP driver using the extensible parameters format shall define a
> + * type which is type-convertible to this one, with the difference that =
the
> + * @data member shall actually a memory buffer of platform-specific size=
 and

There is some word(s) missing here, "shall actually <> a memory buffer".

Nicolas

>=20
> + * not a pointer.
> + *
> + * Userspace shall never use this type directly but use the platform spe=
cific
> + * one with the associated data types.
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> + *
> + * @version: The parameters buffer version (platform-specific)
> + * @data_size: The configuration data effective size, excluding this hea=
der
> + * @data: The configuration data
> + */
> +struct v4l2_params_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[];
> +};
> +
> +#endif /* _UAPI_V4L2_PARAMS_H_ */

--=-qC+6NnOKYiwDd0VA7yXp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG68DAAKCRDZQZRRKWBy
9N4QAQDuYZURTpzmoJglyeKORvbV7cP8/jDhLqozIEG7DMDUPAD9GBadfAg5f3J/
wIhi7od+eQPA7nxYjDzWzOxYbIsriAE=
=qXwV
-----END PGP SIGNATURE-----

--=-qC+6NnOKYiwDd0VA7yXp--

