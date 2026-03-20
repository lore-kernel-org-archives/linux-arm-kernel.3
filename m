Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3560E1099B31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 18:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOImJrUkUKlV54kYlUoWr0DMizxiC/9V3pmZXpcZjrc=; b=hy40wtLSFdcBnCeYdCHn5h7vmj
	3v069D6ayNEWJbVpsPsnzbjQ4U/FiQoLqNqq8WhoAbT5GrDR8PlyvexJ1Ju6FSZhv2MOVDI7r0gSM
	ZBAZVqAFEgtjXtyOibygktLBwvRPFJOeEhAgKuOFf0GyFV8XTMsM1EiOGHSRPXhhOyEafPnGbYDD/
	tVsJ+YYRvFHa9xb0vBSEI3vpcEE7AMXGdIXFWz46PN6/G2bN/CCb2zmxkkSm8UnV6Zb3mHRFTe7zc
	c+HJrBUZz+L4s5Wpq+BU+oUlnIIjzdf0wUpph+FsJBJ0b9M1lOHMBZ4ZV1qNPr/iqhKbWQeUUGA+p
	73diSwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e9S-0000000DLCS-2QTi;
	Fri, 20 Mar 2026 18:00:50 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e98-0000000DLAZ-2yq9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 18:00:48 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-89c4468686dso23978456d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029629; x=1774634429; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dOImJrUkUKlV54kYlUoWr0DMizxiC/9V3pmZXpcZjrc=;
        b=nd+u+X9y9eT75CLhi7Ho73HupEnRVH0VKjSRYkmG4pS6KGOkiBTH8AYdjOIM2nfObb
         GScI/cjp9wPgx7mxIRunfZYSdRI+lP2u+oauI4mnNj1kOuPsMx+258de4/729QpTxVaW
         kFGwgV/TML68CksKaCTNC5vhubhfGYdWl3Dh7KHAFn2xvP7TK8JzmvsMz42JXKrH7wE+
         HQl0+VfYyEZ4XWC5zEHiVp2iwXmLlR5w+HcBFbsQWMYFymSriT1TsAlaTWfR38Wd8zhx
         xp99uhbItDUc2vFYiwffrNAGlSCy90L81+TnUOIV0qEn+Z54RtDBosQIo5G4BYw7g4ZC
         BdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029629; x=1774634429;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dOImJrUkUKlV54kYlUoWr0DMizxiC/9V3pmZXpcZjrc=;
        b=TSUv6/zbEa8KvzkbUDWwglvzhhORe6J4mKMvhKZ7gPzX+8fOV2mhHeBE74muV1Refq
         TjVuyfRG4uxUv4RIjUuSeNBQ3wU7yA9/84DFf3fQioFXX8rglkXZ8sOxqVM3bLjKjqnL
         qLphQNSZpx3rf+SnQsBmvmYJpyp2i76m7PtqsQ1NufTclICL8zHtdS7a/MYgGXfmXL2S
         WOPfZVHIWI3zj4l3nkhDFtCkRzvUHiQEcDEDI727Ky7RJkXX1rwYY4CzH5tW0i5SwD5z
         5NOHScQM92lSb9ucvJGq1avsqPhuWQgkeBZdaBtkk0CJHSHq9fXlExLymQUbXTDJGJtp
         fIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUm0eSYaYmzOodtvwYG9DLTxusVzz6V9oiCtF3F8UjjFNsRSLTL9O1pXAq3Xnm8OG30zjGJlt1CuviZOcBDe52f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpu8O+oAgeBB0gjKG0iJpRlmYnadRBASnbHvIUhHPSa93gEs9B
	GJ7K3YDfnNVfeU7EzILCT8o6ynRHdVtegrVbMlBIPYUzasB0cp+8H8LfA5F7beHAh7k=
X-Gm-Gg: ATEYQzzSA9eJVjqVai/fsRoMJfn4S60yffuK+53CSxOsI7j6FmP0FZ6ZtGZAMhFBR0r
	7jFv1YkvGKul8ezI47CSi5haLygZMvxGA23sQDl6LbhqBaN3COyrteBpc2Y1a1ejbSN4w2qWa+b
	A03ETkNpud8Q+RaWFykrGZzpxrbK76u+gJJlcVu9FfV9jfkiwV3cxwv4qk31V/WtVBunXhs7Axp
	jJGUGGWDzO0Njma30lB8ZMvWfR6j/u3Up8MUmpP4NI6pT+lGpCoDFedJe/z2n29InTuH8K6cfMl
	4TE3Zk/U7E+UOLu4y2n/kxx2QSVYCNbltwGV3lOa0mDw9AwXevp+5PasD60giGhsuge/Wwtvh9r
	p4V9PB9gwRIaTwdn+Fwz184sN5PqdKJ8Cjv05qkav7v9esm70Fge14ZkJ8/VVWKSJS7l6f34cRs
	rawYQeWSQkDzPaDKgEY2xtO8h6cOsMRqsZ261daeg=
X-Received: by 2002:a05:6214:4901:b0:89c:637a:6c6 with SMTP id 6a1803df08f44-89c859cbd8emr55207966d6.1.1774029629014;
        Fri, 20 Mar 2026 11:00:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c850f5fe4sm26026506d6.0.2026.03.20.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:00:28 -0700 (PDT)
Message-ID: <ec72d63c642542dc7a8689c429b497f72c68d000.camel@ndufresne.ca>
Subject: Re: [PATCH v3 21/27] media: rockchip: rga: remove size from
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
Date: Fri, 20 Mar 2026 14:00:25 -0400
In-Reply-To: <20260127-spu-rga3-v3-21-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-21-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GDTWC7SvKf3bxqpQNbJL"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_110030_892113_E74A8D9F 
X-CRM114-Status: GOOD (  19.21  )
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


--=-GDTWC7SvKf3bxqpQNbJL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> The size member is only used for the mmu page table mapping.
> Therefore avoid storing the value and instead only calculate it
> in place. This also avoids the calculation entirely when an external
> iommu is used.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

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
> index 4e82ca1a5e8d9..c0cc885ba58a8 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,6 +79,8 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	struct rga_frame *f =3D rga_get_frame(ctx, vb->vb2_queue->type);
> =C2=A0	size_t n_desc =3D 0;
> +	u32 size =3D 0;
> +	u8 i;
> =C2=A0
> =C2=A0	if (IS_ERR(f))
> =C2=A0		return PTR_ERR(f);
> @@ -86,7 +88,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	if (!rga_has_internal_iommu(rga))
> =C2=A0		return 0;
> =C2=A0
> -	n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> +	for (i =3D 0; i < f->pix.num_planes; i++)
> +		size +=3D f->pix.plane_fmt[i].sizeimage;
> +	n_desc =3D DIV_ROUND_UP(size, PAGE_SIZE);
> =C2=A0
> =C2=A0	rbuf->n_desc =3D n_desc;
> =C2=A0	rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b2ee59235d1e3..59463c7f26b6f 100644
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
> @@ -459,9 +458,6 @@ static int vidioc_s_fmt(struct file *file, void *priv=
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
> @@ -485,10 +481,10 @@ static int vidioc_s_fmt(struct file *file, void *pr=
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
> index 95fa7fd1c509a..2838fc7785f72 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -34,7 +34,6 @@ struct rga_frame {
> =C2=A0
> =C2=A0	/* Variables that can calculated once and reused */
> =C2=A0	u32 stride;
> -	u32 size;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_dma_desc {

--=-GDTWC7SvKf3bxqpQNbJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2LOQAKCRDZQZRRKWBy
9F3LAPwI3WnRibEc84bDS/7rFozW7TiB3JyYqH0VfP/vvwfGhQD/WMZ6ofBluvak
WKPGIwexm/UWVC6O9rorql75w7VrVgk=
=y8bZ
-----END PGP SIGNATURE-----

--=-GDTWC7SvKf3bxqpQNbJL--

