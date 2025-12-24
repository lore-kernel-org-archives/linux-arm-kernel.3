Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051C4E77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0x8O2edEza1BNif20q/VV2jOJQ5YnvQ9lQ3v3htH5Y=; b=WaeWNOpbx0ETkY0R4cc1+GLUYV
	A1+W5rRLIfrHPKln+cEcn846QRRTvm+5qGHcJMhCQPd46rSAv91DlG9igKOakTpCQnfecAzsXCC6D
	DN92EmsD/W2iNxzY4cwISN31zvevLFGT6YOaz9uuYFIBqUdEn/4PB7ZCsqF74eWScBdssTG1z8BOo
	b4mO1h5Yg4C1Xv+8AGQK77EpdurmVPR7bX6ptNAJGjxd1rpHdfCNXqkI9BZv43GfQ2ui9Obt/7OaY
	eSa+Q/op5OwJppKvfVd3E2NYMaNSTCuPnSIsxdElJEjeVGoSrzMzgciTv7HQERhHzO/Y4n0uVBpEB
	RzV2W1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR7u-0000000H9a4-3LPb;
	Wed, 24 Dec 2025 15:50:14 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR7r-0000000H9ZA-2ASg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:50:13 +0000
Received: by mail-qv1-xf42.google.com with SMTP id 6a1803df08f44-88a2ad13c24so57442006d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766591410; x=1767196210; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t0x8O2edEza1BNif20q/VV2jOJQ5YnvQ9lQ3v3htH5Y=;
        b=ICnP47W1es3xSJhsNuV7fYdUR1qJAT0Rp5o6U1a8x09mzrjwtJLW1rSRaSAnoAfQ5g
         8t3l4Fata3Iia+oiClsqQglOUF/OUdL+ePak0FTaYnA9k31eZPkpH4vWzWnUoyG1/J0a
         yY4gMOFijUcffSxtI+AQr+CXwUIHY5ljpcKqWhUkNg6VcGNIHJZzeCKbioSTCb8UKIBs
         a6X6UdiokTSb/SHJhEYH4aKQ6dfWO6wQvywXhKDAcdhxRjfNftCfeWTnasiO8X5UdSJD
         ONpmhXTI8yH0qBF28MmD1T9ctgj9t1W+tFTEUILxGYXIAW7KAlHzNRR7cexqZ1kj3EzH
         MtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591410; x=1767196210;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0x8O2edEza1BNif20q/VV2jOJQ5YnvQ9lQ3v3htH5Y=;
        b=uOL03GliZ4YgDmyfRvgrCY2vHinmYq2WwCM32pgJhXnigr1kgI/4oYXpxt6e/6Jq8l
         lT+FHgUvHsaxPdv+rapfUEVV2Mc6O5uLNJ+Rd2LVUQYl8r25yhz1s+upHDaECrwVHnT1
         hOdkYJ4RtnSB00aIvtGo8KOIzr9BdKk4NB9HuIRJmgABrdwx5lwlLNYNOmARwFbFWqUw
         qHEemnNGSwI39QfhjLVfJlw5kn81grbm/eVGAm0xAKJoYsmqombuXUn9E9GOBsdCPI1M
         6SBrHdYry8yH8mHoILCZJ7OtiGkESfVz3VNBSwKI6D5pytcgTGa54Z8ji3s6oOzFpGtR
         nutQ==
X-Forwarded-Encrypted: i=1; AJvYcCWabj1keU7GmHraXyA/28LCK0i0Q6XA7avC9hcKVeVflujx5EhZN8CAqM1wsagqc8JgAa/xGBgWirh84bhTI7sk@lists.infradead.org
X-Gm-Message-State: AOJu0YzJecOxWU8QyvFc1uJEW82isX0TaPeVYQ6vTLwUAMrVUqq9uzQT
	ckRh5KWMNKtEWgT6o/Wr1KjZUEx3V6MuQQo7jS3uXlRhpknCUb+bdYQOA+yOuEzwTHkOiCcSF0n
	B3/l9GUAVFw==
X-Gm-Gg: AY/fxX5Ve3mRjhpigDsu08FBJzP1C6niFWDB0S1LUrPeHuqIqDm+bOkyEsjcDsVTR40
	sALNqhFhZanTAUmlP0REi40FAqNso9IcxCgYTN9W4FdVeWie9/f6Q8H1fjdF0hwb7czAc6QcIsx
	64EafGAdxzjmrF9E+1GsYMumSo7YQzGsg03MQdl9jsYAgUS2Lq/u9yDFo0ehodIa82MiQ8ifLUJ
	Z7PxrFIaMDo/UJACTF77I+WFKN1I87sDrIZEte0Mj1wZm4BQezL9bQX4YKJqgP3n/nYe9qFkBBO
	5xeUqav3AQ82zMbYi4KB2tCRo1aFYJVV9m8+aO+oMn0Z66WlbbGRInUfz8g2qaFgg1JTuYdze+m
	mhIFW8vjRtCCUOljdsWfaYdKTI9LtGrUZtHxLfs2yXVNABq/JwrAXNVmrnhs8ciUPX79yKdZwEn
	H2y9Tuc9JXKc4vKrW+
X-Google-Smtp-Source: AGHT+IEwy2rat5Kb5r98ykPzYiUU1sIbw+qVImMdGra60R50ykeHomj3EYI4RCKiCXlFe+tzbEaOIw==
X-Received: by 2002:a05:622a:1389:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4f4abcf6c6cmr239396931cf.15.1766591410071;
        Wed, 24 Dec 2025 07:50:10 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4da7c31a1sm44200731cf.5.2025.12.24.07.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:50:09 -0800 (PST)
Message-ID: <c5b6707e3e6748bf923aaf34db1ae231c7e121ad.camel@ndufresne.ca>
Subject: Re: [PATCH v2 14/22] media: rockchip: rga: support external iommus
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
Date: Wed, 24 Dec 2025 10:50:08 -0500
In-Reply-To: <20251203-spu-rga3-v2-14-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-14-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-nlUZf9Gs4Bb4RGq57lnq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075011_959159_29B78066 
X-CRM114-Status: GOOD (  25.94  )
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


--=-nlUZf9Gs4Bb4RGq57lnq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> In preparation for the RGA3 add support for external iommus. This is a
> transition step to just disable the RGA2 specific mmu table setup code.
>=20
> Currently a simple rga_hw struct field is used to set the internal iommu.
> But to handle the case of more sophisticated detection mechanisms
> (e.g. check for an iommu property in the device tree), it is abstracted
> by an inline function.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 46 ++++++++++++++++=
-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 11 +++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++++
> =C2=A04 files changed, 43 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index 8845e1f894f29..e8d1e2e579140 100644
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
> @@ -79,14 +80,16 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	struct rga_frame *f =3D rga_get_frame(ctx, vb->vb2_queue->type);
> =C2=A0	size_t n_desc =3D 0;
> =C2=A0
> -	n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> +	if (rga_has_internal_iommu(rga)) {
> +		n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);

n_desc is not used outside of this scope, perhap drop the definition with t=
he 0
init, and use:

		const size_t n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
	=09
> =C2=A0
> -	rbuf->n_desc =3D n_desc;
> -	rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> -					=C2=A0=C2=A0=C2=A0 rbuf->n_desc * sizeof(*rbuf->dma_desc),
> -					=C2=A0=C2=A0=C2=A0 &rbuf->dma_desc_pa, GFP_KERNEL);
> -	if (!rbuf->dma_desc)
> -		return -ENOMEM;
> +		rbuf->n_desc =3D n_desc;
> +		rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> +						=C2=A0=C2=A0=C2=A0 rbuf->n_desc * sizeof(*rbuf->dma_desc),
> +						=C2=A0=C2=A0=C2=A0 &rbuf->dma_desc_pa, GFP_KERNEL);
> +		if (!rbuf->dma_desc)
> +			return -ENOMEM;
> +	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -133,17 +136,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
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
> +						=C2=A0 vb2_dma_sg_plane_desc(vb, i));
> +			if (n_desc < 0) {
> +				v4l2_err(&ctx->rga->v4l2_dev,
> +					 "Failed to map video buffer to RGA\n");
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
> @@ -173,8 +180,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
> =C2=A0	struct rga_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
> -			=C2=A0 rbuf->dma_desc, rbuf->dma_desc_pa);
> +	if (rga_has_internal_iommu(rga))
> +		dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
> +				=C2=A0 rbuf->dma_desc, rbuf->dma_desc_pa);
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_buf_return_buffers(struct vb2_queue *q,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index fe6f518aedd4e..fb0389ae8e132 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -617,6 +617,7 @@ static struct rga_fmt formats[] =3D {
> =C2=A0
> =C2=A0const struct rga_hw rga2_hw =3D {
> =C2=A0	.card_type =3D "rga2",
> +	.has_internal_iommu =3D true,
> =C2=A0	.formats =3D formats,
> =C2=A0	.num_formats =3D ARRAY_SIZE(formats),
> =C2=A0	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index c9719c7bcfc1c..f28ec88c186fa 100644
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
> @@ -95,13 +96,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, stru=
ct vb2_queue *dst_vq)
> =C2=A0	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> =C2=A0	src_vq->drv_priv =3D ctx;
> =C2=A0	src_vq->ops =3D &rga_qops;
> -	src_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	src_vq->mem_ops =3D &vb2_dma_contig_memops;

That's a bit I'm less knowledgeable here, since I never used the sg_memops =
in
any of my work, but what is the consequence ? (appart from gaining external
iommu support)

> =C2=A0	src_vq->gfp_flags =3D __GFP_DMA32;
> =C2=A0	src_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
> =C2=A0	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> =C2=A0	src_vq->lock =3D &ctx->rga->mutex;
> =C2=A0	src_vq->dev =3D ctx->rga->v4l2_dev.dev;
> =C2=A0
> +	if (rga_has_internal_iommu(ctx->rga))
> +		src_vq->mem_ops =3D &vb2_dma_sg_memops;
> +
> =C2=A0	ret =3D vb2_queue_init(src_vq);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -110,13 +114,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, st=
ruct vb2_queue *dst_vq)
> =C2=A0	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> =C2=A0	dst_vq->ops =3D &rga_qops;
> -	dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->gfp_flags =3D __GFP_DMA32;
> =C2=A0	dst_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> =C2=A0	dst_vq->lock =3D &ctx->rga->mutex;
> =C2=A0	dst_vq->dev =3D ctx->rga->v4l2_dev.dev;
> =C2=A0
> +	if (rga_has_internal_iommu(ctx->rga))
> +		dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> +
> =C2=A0	return vb2_queue_init(dst_vq);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 772f7dff9a8e5..fc81bc5562792 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -148,6 +148,7 @@ static inline void rga_mod(struct rockchip_rga *rga, =
u32 reg, u32 val, u32 mask)
> =C2=A0
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> +	bool has_internal_iommu;
> =C2=A0	struct rga_fmt *formats;
> =C2=A0	u32 num_formats;
> =C2=A0	size_t cmdbuf_size;
> @@ -163,6 +164,11 @@ struct rga_hw {
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

--=-nlUZf9Gs4Bb4RGq57lnq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwLsAAKCRDZQZRRKWBy
9CgTAP0ZRX2VZlB0wowqAC2lQw5hPjPnmDeQ4SUGcd0ceWKR9QD/as0o8pUzWxwD
8/w+YOd/NEn5VtzklxpU0cIAfbY+Kgw=
=1Utz
-----END PGP SIGNATURE-----

--=-nlUZf9Gs4Bb4RGq57lnq--

