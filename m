Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26133E77378
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGe1Kg/Ewwa4AXdQbZdoUP/58mpe9Y5O7Uc0GbJIQbI=; b=EFTBX91lyNsMIK7tKcS7dS7MeB
	nCR3eVs/LMQQFRc/AeNeO2SFauXajtHzFjCC14pYr26GNFwZtdZEMpAPcLqwhmWVqmnpLCNXQetVd
	WZviUZ5yDzJgX4ADINyJkYGUJifdXacjdt88+l7MgVZCCOsOpRl9jw6TQodqU4ye9UQj0TQrpuV4g
	maUN5qiNFt1KoPa/tl8lfEWRLy3gfjL/ciiXauRPmokXM8MZHgvvzL1b5aAoV56sNS7bpvmtpksll
	ef1LnFvMMlFv5VBWMdEClSwGLZsFkH0iQ5A9UufTTP9T8WSEQfOGCj17ea5uGU44ivHmMmwZN9uP+
	ZBLetdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQTv-0000000H4Yc-3Tmn;
	Wed, 24 Dec 2025 15:08:55 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQTp-0000000H4VU-16QJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:08:53 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-65d132240acso2950095eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766588928; x=1767193728; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dGe1Kg/Ewwa4AXdQbZdoUP/58mpe9Y5O7Uc0GbJIQbI=;
        b=QbBCRVLswvMmgMhEQJfCk9n94k52e38qlO9dkgMoPToewPCnbI7BCWv6aF2VihgFRS
         vWmTCi/m7Lr4FYDEwyvFljVYm3ZdaU1agNN4xcp+etCM4A/jbi179jntmi93KEfTRI9t
         ZIHb0SgwJUtzrEUykvUfRknZVxG+P5UfjvW33pA9v5MVgGHKggMnselRwlAmK0Bqt/Sb
         MotrNLApZ+nWG0YSgOOUT0q/P5YHQMZnQcOaYVCHxLeVyLLvlnVnIej5lqC+05XMMVX+
         o4/jMO5lT9xTJZvrRh+z0gj6YYh9jA9cVwDm8IkfU/vZ2q9Qvs/gl2ZYUr/5hvijzyRb
         bVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588928; x=1767193728;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGe1Kg/Ewwa4AXdQbZdoUP/58mpe9Y5O7Uc0GbJIQbI=;
        b=m1X6QGMzYqsr6JGxYhyE3XcoVJthSpiQ2skQ4CpLnTqftEuN7SZL49XXQwCEhpDfu1
         QebCpGPNIG9h4qCyGJNb1Cgx7shqToRR7OcY2ylFospwG2KUIQ4ZsA3P15M/gAxuqlco
         SfVCWzEOqgrZLKgpXEtfzilyClcrdYCz46z2s6ZoaH2dQRUYywek/kTYl7ibbohxjkrS
         qDzmpGNyb0zO7ncPfNA2Ha0zKEJADw/HDGGehWKmdnsPcL2X8EGHJF52kH2XEy4dsTg7
         wRGUtuA5PLdKI3Jr54jO6Cn8FZs2yYqY4GkKfEp/NAqpGqFrw4VP1mzks0FuelgpKznw
         LAYA==
X-Forwarded-Encrypted: i=1; AJvYcCVndR8x1jjQV92ZJIdP92uwtZBIv2gQyekJRzA2FApLTlIKRpb6dWokSmLZXru8/3VgRv6f9i2XnCwVF3UyNYy0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0p+o7xXoGMj67u/up9M2QYrhZZPWgltdox4XqDeo5oGBx3+TU
	76n9U8tpn10pwUVi8ul0/sOfw/UxnMvjHQxyxZ4c+BlawsakVcDldVYlMpJ9XfEcXFaYmFLqZaG
	PZSgeB6w=
X-Gm-Gg: AY/fxX4L7teR2vZrTWVI1P/Tt2fJIhoBMUNJrb2CO+KAob/8etaF+27r5F8Sc6quOvQ
	jeQxb4sA/9LCNlpnKbkPi4IgKa/yLOwzWkilek8E+aT5WIBXcmztsp84D/Ecu4OTu+YbvbKq1eJ
	R7pYrgab6kk8QnC5MA3QowxMELDlLJlcaqBoRByiZ5sn6avLvdaXBBCc1CTE7RMaLOcABdSmwEK
	WHbjAMIHkMULBvEDykVgx6apkGQX8f2QnUGXKAdVXncOkoobBVYqZzPKp8rzGXQZkIgU4k8tkdq
	2uoOV8MZT2SDFXd1/vXJiH+1ZO8HVssR6QzL8KEbXu3NojfXfgJ6kz8r51eOL5/Q/dEMnsLV6IR
	5ezILQvcjQO73JHWUc7wrehKykgPPo8retH8K8NTFI7p9ulZgmLWbVOs0Qp5Qnn18i3J6xcwVpp
	UX0I9qemc9YgJ+3pQ2
X-Google-Smtp-Source: AGHT+IGOdP4bNjuz9Xy+2p3DsTDzLsDPb65a5Nil+bEYmD7FurogSj7bVj14d+sYewwSE7RZ5v7Z8A==
X-Received: by 2002:a05:622a:2b49:b0:4f1:cab1:9d3c with SMTP id d75a77b69052e-4f4abda9df8mr272131511cf.57.1766588436448;
        Wed, 24 Dec 2025 07:00:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62e1e7sm123162401cf.21.2025.12.24.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:00:35 -0800 (PST)
Message-ID: <7d9f41a8609fdae7631305585cab47fd45297c5c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 05/22] media: rockchip: rga: use stride for offset
 calculation
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
Date: Wed, 24 Dec 2025 10:00:34 -0500
In-Reply-To: <20251203-spu-rga3-v2-5-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-5-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-rHJMEXILUMoROeBsgJ5B"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_070852_585495_D5DCC3C9 
X-CRM114-Status: GOOD (  20.18  )
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


--=-rHJMEXILUMoROeBsgJ5B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Use the stride instead of the width for the offset calculation. This
> ensures that the bytesperline value doesn't need to match the width
> value of the image.
>=20
> Furthermore this patch removes the dependency on the uv_factor property
> and instead reuses the v4l2_format_info to determine the correct
> division factor.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
> =C2=A01 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index 730bdf98565a5..b5e6b1b527ca8 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -14,7 +14,6 @@
> =C2=A0#include <media/videobuf2-dma-sg.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> -#include "rga-hw.h"
> =C2=A0#include "rga.h"
> =C2=A0
> =C2=A0static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t m=
ax_desc,
> @@ -92,14 +91,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int get_plane_offset(struct rga_frame *f, int plane)
> +static int get_plane_offset(struct rga_frame *f,
> +			=C2=A0=C2=A0=C2=A0 const struct v4l2_format_info *info,
> +			=C2=A0=C2=A0=C2=A0 int plane)
> =C2=A0{
> +	u32 stride =3D f->pix.plane_fmt[0].bytesperline;
> +
> =C2=A0	if (plane =3D=3D 0)
> =C2=A0		return 0;
> =C2=A0	if (plane =3D=3D 1)
> -		return f->width * f->height;
> +		return stride * f->height;
> =C2=A0	if (plane =3D=3D 2)
> -		return f->width * f->height + (f->width * f->height / f->fmt->uv_facto=
r);
> +		return stride * f->height +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stride * f->height / info->hdiv =
/ info->vdiv);

This was the only user of uv_factor, please cleanup rga.h/rga.c. I see ther=
e is
also redudant x_div/y_div, with this similar code re-implemented in
rga_get_addr_offset(), can you check for v3 if we can cleanup some more ?

One thought though is that this code is already hidden inside v4l2-common,
perhaps you could just expose it, this ensure that we don't accidently have
different information when configuring the HW and communicating with the us=
er.

Nicolas

> =C2=A0
> =C2=A0	return -EINVAL;
> =C2=A0}
> @@ -145,7 +149,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	/* Fill the remaining planes */
> =C2=A0	info =3D v4l2_format_info(f->fmt->fourcc);
> =C2=A0	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] =3D get_plane_offset(f, i);
> +		offsets[i] =3D get_plane_offset(f, info, i);
> =C2=A0
> =C2=A0	rbuf->offset.y_off =3D offsets[0];
> =C2=A0	rbuf->offset.u_off =3D offsets[1];

--=-rHJMEXILUMoROeBsgJ5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwAEgAKCRDZQZRRKWBy
9NO5AQDtdSqseG94qsfu8XsdEZ4bOfZiTOs9HyX/19Fq1IgEnAEAhFdciooE5zhz
sU15mlCk3SHkGaBmmOl7z63Xkb4AnAo=
=7AqG
-----END PGP SIGNATURE-----

--=-rHJMEXILUMoROeBsgJ5B--

