Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CA71099B32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWkKoVAEpPTbhlQcGao02ZYKop/ZGqIz8O7PUwO5+Xk=; b=BVxf8lqrUNT3foKEW9qpi17jMi
	JbEaLfrS0gXrLhOxmyzDz6/t6bJDezb3AH/bmQUxGmfBCORl6G+kem2zWfaXVMlqe0kwKrOzJaxNG
	crldJZFd/5Yd02A7QEp+bnA7xkGvVFeVMM3NhM0CuYq0iUi3hzY8DcPyVLFv0mQSihbkhggJTFd0x
	SU2U/JPksSvmmSczxNu9Yw/4pCiKQY07gom0M8cZzjZeafFltSGVSKMua7Eqf/iGFJ/GOrdezZmfV
	sCyGIOfkz+6b/0PdiFQywxo56GHMkpqAamzLTSpkqMzGtTKAQMx5tIbEu6egSHKek6f+XE/lQV2fe
	XmBziz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e7o-0000000DL1t-11KR;
	Fri, 20 Mar 2026 17:59:08 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e7l-0000000DL16-2Vby
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:59:06 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cfc40e4158so190082985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029544; x=1774634344; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DWkKoVAEpPTbhlQcGao02ZYKop/ZGqIz8O7PUwO5+Xk=;
        b=iswrOe3PGMyz9D6fkPxjBguthEGLR256Yg1KRd4Dadg2EKk4ryBo9KXsiH4qkVWclQ
         KAgukkV4jUzkxE6ArDC0Cr2GDEWyk4JclqsPg1vSoYviAU3byikcMjlpr5utQp4Am4PP
         E+DSvWKPn/b6Klm0m9pozmgV67K7B7oHELJTzdiiY3DlITpi5hAeC+F0ZmWCX5DTjzw9
         leLYzj1qEXPFTZo5VU6AhN8IGa+KJSZ0xq+UIDLI8viYxNfvJ2u5wNzzUVNJsCENgM72
         AdhXLUMc76o+gPsrWEObDKyLQzmeBIaPAnKDSCX4gXeaTkLf0TY+h/rAmnrC41poqN9r
         DJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029544; x=1774634344;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DWkKoVAEpPTbhlQcGao02ZYKop/ZGqIz8O7PUwO5+Xk=;
        b=nn8xmZnnEPqVvZm3NXed++RZSGbdzrZsa6oqQr/BYUgJu/WlvWiAay/24hsuK6bNkx
         1jDlEffNDY6DImj+rcz1z7Ak+jy2KnY73S+5T9zxEP6kVvoFJvsj2Um+KRifEnOq82h4
         Xs26/ujo7iuSsxZWbUZGge9WS1wCSAMcXVYhqZ6T1ShKwg+Quyggzut5eri5Ez5K5VQi
         yXok8ehJz4ugZ4A1Kh5DmUW008qXNnvyEThIH/M53e799tNu26GTi1Iq82jQQ7/w2u3W
         MdyccImTSTWrW4wx9+LGiFt7zYhUoarbCNnvEZSlC9DYebW+R0UdAJYlSRd5D5Ih1APv
         C0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEug18+WTbcrsi/i+0Z4hICJfT7q1G697LZsXz3ycRcruTHqb4ZG7L9W5/ERyLPctq+WOKSaBuA7evzR09nNrR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpeybe3LxcRTmHS2/uE/r4Fu7z2Gn1rhbxFpugSpwmZsPaD93s
	O94I6xp8ONDtfqaTgs4io04YfusxPdgHbVUX1BL7cuspT/i5iXsAmCSq9wO1UnxjisSzkoZoHxg
	rqYLOEGOL2g==
X-Gm-Gg: ATEYQzzkgZIjpFOUtzNWGiFQNP4R1GsPz5K7T9oaoKrw7LKZ7DLcjmhCEwrv9dwLFKp
	8eVOL6MqBLS7YZfBCdaoBhIEqSiYfof/j/S5VDBqr9MU5injWJ9Il+7xNaoHFlTQGjr27Y7ujnr
	qYRnj6FP0SJYSuGcjpsZfDhCxECGdb0BaxUqnE1/R2Ig8MkKPoWEHNKx1Sgx6gc/8AfCmGa1j8n
	w+mO72S1x0x9MkrN4oHVFqK+09fxxJfoIlAOCxzjqh6RH6yBwMMUvWNbyijGeeMu3hODPHKTHQY
	L4kAlYjEtisoAR9fzXkdG9hnmuU6CqobSZwGZeMjdR8cDtMUQC0L8yPjJTNYKh8fKou/GpKvrae
	YNWeHQjetwi3dUMV+a0QA0En6R60WzTlCi65l4pFTlIK5LR2JfXqcTXZ8BPwyfKE3nvbaGDDzbe
	l+sTO9iLEcw3zYFQRvVu8P9eWvJWHa
X-Received: by 2002:a05:620a:4110:b0:8cf:c77f:f4e2 with SMTP id af79cd13be357-8cfc7f86b0cmr579713085a.67.1774029544140;
        Fri, 20 Mar 2026 10:59:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90e2d27sm233119785a.43.2026.03.20.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:59:03 -0700 (PDT)
Message-ID: <46d7ccd7500771bf66f830040b3e306785866ea8.camel@ndufresne.ca>
Subject: Re: [PATCH v3 19/27] media: rockchip: rga: support external iommus
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
Date: Fri, 20 Mar 2026 13:59:02 -0400
In-Reply-To: <20260127-spu-rga3-v3-19-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-19-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GSvc32jDQd071V5aC8lf"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_105905_659973_FA3558A4 
X-CRM114-Status: GOOD (  24.62  )
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


--=-GSvc32jDQd071V5aC8lf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> In preparation for the RGA3 add support for external iommus. This is a
> transition step to just disable the RGA2 specific mmu table setup code.
>=20
> Currently a simple rga_hw struct field is used to set the internal iommu.
> But to handle the case of more sophisticated detection mechanisms
> (e.g. check for an iommu property in the device tree), it is abstracted
> by an inline function.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 31 ++++++++++++++++=
++--------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 11 ++++++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++++++
> =C2=A04 files changed, 37 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c
> b/drivers/media/platform/rockchip/rga/rga-buf.c
> index bc349d0a46365..4e82ca1a5e8d9 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> =C2=A0#include "rga.h"
> @@ -82,6 +83,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	if (IS_ERR(f))
> =C2=A0		return PTR_ERR(f);
> =C2=A0
> +	if (!rga_has_internal_iommu(rga))
> +		return 0;
> +
> =C2=A0	n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> =C2=A0
> =C2=A0	rbuf->n_desc =3D n_desc;
> @@ -136,17 +140,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	for (i =3D 0; i < vb->num_planes; i++) {
> =C2=A0		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
> =C2=A0
> -		/* Create local MMU table for RGA */
> -		n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
> -					=C2=A0 rbuf->n_desc - curr_desc,
> -					=C2=A0 vb2_dma_sg_plane_desc(vb, i));
> -		if (n_desc < 0) {
> -			v4l2_err(&ctx->rga->v4l2_dev,
> -				 "Failed to map video buffer to RGA\n");
> -			return n_desc;
> +		if (rga_has_internal_iommu(ctx->rga)) {
> +			/* Create local MMU table for RGA */
> +			n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
> +						=C2=A0 rbuf->n_desc - curr_desc,
> +						=C2=A0 vb2_dma_sg_plane_desc(vb,
> i));
> +			if (n_desc < 0) {
> +				v4l2_err(&ctx->rga->v4l2_dev,
> +					 "Failed to map video buffer to
> RGA\n");
> +				return n_desc;
> +			}
> +			dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> +			curr_desc +=3D n_desc;
> +		} else {
> +			dma_addrs[i] =3D vb2_dma_contig_plane_dma_addr(vb, i);
> =C2=A0		}
> -		dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> -		curr_desc +=3D n_desc;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Fill the remaining planes */
> @@ -176,6 +184,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
> =C2=A0	struct rga_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> +	if (!rga_has_internal_iommu(rga))
> +		return;
> +
> =C2=A0	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc)=
,
> =C2=A0			=C2=A0 rbuf->dma_desc, rbuf->dma_desc_pa);
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index bf4a86a640ec5..2013b59701d12 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -577,6 +577,7 @@ static struct rga_fmt formats[] =3D {
> =C2=A0
> =C2=A0const struct rga_hw rga2_hw =3D {
> =C2=A0	.card_type =3D "rga2",
> +	.has_internal_iommu =3D true,
> =C2=A0	.formats =3D formats,
> =C2=A0	.num_formats =3D ARRAY_SIZE(formats),
> =C2=A0	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index f33e2288dab6f..b13ff8d7c572c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> =C2=A0#include "rga.h"
> @@ -95,7 +96,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struc=
t
> vb2_queue *dst_vq)
> =C2=A0	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> =C2=A0	src_vq->drv_priv =3D ctx;
> =C2=A0	src_vq->ops =3D &rga_qops;
> -	src_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	if (rga_has_internal_iommu(ctx->rga))
> +		src_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	else
> +		src_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	src_vq->gfp_flags =3D __GFP_DMA32;
> =C2=A0	src_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
> =C2=A0	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> @@ -110,7 +114,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, str=
uct
> vb2_queue *dst_vq)
> =C2=A0	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> =C2=A0	dst_vq->ops =3D &rga_qops;
> -	dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	if (rga_has_internal_iommu(ctx->rga))
> +		dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	else
> +		dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->gfp_flags =3D __GFP_DMA32;
> =C2=A0	dst_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 025b1df594e9a..95fa7fd1c509a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -146,6 +146,7 @@ static inline void rga_mod(struct rockchip_rga *rga, =
u32
> reg, u32 val, u32 mask)
> =C2=A0
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> +	bool has_internal_iommu;
> =C2=A0	struct rga_fmt *formats;
> =C2=A0	u32 num_formats;
> =C2=A0	size_t cmdbuf_size;
> @@ -161,6 +162,11 @@ struct rga_hw {
> =C2=A0	void (*get_version)(struct rockchip_rga *rga);
> =C2=A0};
> =C2=A0
> +static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga=
)
> +{
> +	return rga->hw->has_internal_iommu;
> +}
> +
> =C2=A0extern const struct rga_hw rga2_hw;
> =C2=A0
> =C2=A0#endif

--=-GSvc32jDQd071V5aC8lf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2K5gAKCRDZQZRRKWBy
9BfxAP9HitbV0tE91+TsUII6EawZfO2n00kNhSwOcuYpTi+2HgD/YMHoY2wU9gZ2
za+IWdj6j8GuSEbo6yXP/lEI/rjmEgk=
=xHfo
-----END PGP SIGNATURE-----

--=-GSvc32jDQd071V5aC8lf--

