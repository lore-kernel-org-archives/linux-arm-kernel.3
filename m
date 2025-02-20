Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A82C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6jS8MEY+D88VnG9tXqcd3WDFk43EgZ52jUsbQnwRsI=; b=n0SjSLeRzHh8ImUjgEgfAAfoEb
	yjzCLE20xhGzwRuMC3C0cmp3Cw7aFti3B8Np9SpBsxWBHadgw8xuaDhUlSUogO5SfvhOuMedW3RBF
	CnGs8eWny6bCU4a9+1ute7NwdwaMlRTWnBnDWN35vm4iUHx1OBpLl7mtAhOmfr/z4xUABuTXb6MEM
	B5zbaG8sW6vSuobBmkmSI92dhzQCa1o4Q++sq5lABGWNSMlQn3uvyMu7wpusYqGJSvhrSq+xrZbQP
	FVKihQZCr1UgbkrvLFvg0xBqphh0sRnzpizWXFDWfPP0NbPLvRRjDEhjrILJRZzJAM6A32p8xHbB3
	fV6y0G6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAU9-00000002ApL-00N7;
	Thu, 20 Feb 2025 17:37:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAPC-000000029fV-3YJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:32:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38f22fe8762so625678f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740072729; x=1740677529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6jS8MEY+D88VnG9tXqcd3WDFk43EgZ52jUsbQnwRsI=;
        b=GMGgh9/3Kgkl5b1JVFqUkaS0gGExNS98hxxGScYJufdZkFpqiLIUQuqpU8+y7k+f9f
         WHB5QE6OVLRUSeXzE6GugQFIayG1nOIU4HQvXyr60fUMlreOFlGecLJE3zGYmuNFPsxQ
         zwXhLkMDjvFznOxlryr8ccC31iOB9jl8x1XrTfBqyge0x5lVPQIUXMKnk1wZgTtMLKRX
         1LZMyBCJ84XvEVkEExGGcSQV98m6U/Y7kIbf2xkzaU/37GqjgV0wjCfZt+4MC0ivD7B8
         PHjJdyhg37E4w3tRPfCaSuXYSRnoxVoa3ArQ5zkFdGAWuzFNRxQ5rubxCGFpiwUeeN1y
         oQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072729; x=1740677529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6jS8MEY+D88VnG9tXqcd3WDFk43EgZ52jUsbQnwRsI=;
        b=uUbu5NizWjoQwPcGNHgo9K6OUY0bmfg0KQVlQsHzglh8iZaV+soWpM5DI9jG9oOy7/
         zlBcv0UDD4xbXwX6b0R9h8QYt0waOs2juWugMtIlcHS4KR0nvvHg2UlR43hIqmCgRDt9
         qK1SOEmcRGCuH4B4Y8BpyqicHMli3SbfB5QybIycjD/tpAAMmvrtzIqpnu3qq70izkOn
         GRkhKUU8ztvv/nvp9+OHc3ic2ZXzeTs8ytJ2a3erYliChHNsR2nV4V/kT69mlW5WApLN
         f/vlQLC54WanZ1HDbT0lph/HzQWMabANStIXOwgHI1mxIIZ9EBsC2BU77W+Gg4e7gfSs
         BgZA==
X-Forwarded-Encrypted: i=1; AJvYcCXndYIZ1jCcr8a9X3v0u9/VQeuiOjBJZDGYaMRrgYkBXGM0yNANayPH0OYVPMEPDv6isnYCYbUBFV9bGj7mGzeE@lists.infradead.org
X-Gm-Message-State: AOJu0YxfmNSJ32oMxzsvAVi9P1ocAJW2miLCnO1oJRkessGrX1P1ZwhS
	XARo5PlBz3WUFTt4ZZL98rBs3NDEnB5lmbSJpl9HSg+Yyr4yfI6p
X-Gm-Gg: ASbGncsQYLm6hmdINodr9JrWBMPTtx+Uk/+EZJDIooAOxYX4r03zyoWoUD6RmIN8Gfu
	94dluwppUvvM6szZ07bOoVbBgo2wCUJEpC0D/fCYqdXdx5GUT5gfpGx0JQOyrhHqY0j14cfFQ9q
	UCDfwk5fXElSsm19fOzm/EP7FFBW/KLYWNNMpSAXHsNz1zln78RZJNpSu2F4vHP4Terl7ovdi4D
	2vF3DphMvHGqY4VhIovthSyyPyft0/G8Us+X09Dvt2/5486DNVzb/v0XVR6FtDidZmwAM9XUw6U
	8lhE5e17DZ/mEKfUh0VhgjC0D9D3ElmU6jZ7U6QyIcpr2Vt9haw+s5NP03SJTaxaBn4=
X-Google-Smtp-Source: AGHT+IEmIjNfOM1Uf7unXfDeC/Ot5X58yHhojufcRFY2OsqvS+TdcSrLSNUpCTBWvCPIRnU35ZMDxg==
X-Received: by 2002:adf:f3c9:0:b0:38f:2b59:3f78 with SMTP id ffacd0b85a97d-38f6f0ac5a3mr72051f8f.45.1740072728735;
        Thu, 20 Feb 2025 09:32:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7fe6sm20837371f8f.86.2025.02.20.09.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:32:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-sunxi <linux-sunxi@lists.linux.dev>,
 Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 linux-staging <linux-staging@lists.linux.dev>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] media: cedrus: Add JPEG decoder
Date: Thu, 20 Feb 2025 18:32:06 +0100
Message-ID: <6107096.alqRGMn8q6@jernej-laptop>
In-Reply-To: <195004ca004.ef71c4611135398.5819587479420404546@collabora.com>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
 <20240731164422.206503-3-linkmauve@linkmauve.fr>
 <195004ca004.ef71c4611135398.5819587479420404546@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_093210_898159_1F6FB8C1 
X-CRM114-Status: GOOD (  36.54  )
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

Hi Sebastian,

Dne =C4=8Detrtek, 13. februar 2025 ob 18:12:56 Srednjeevropski standardni =
=C4=8Das je Sebastian Fricke napisal(a):
> Hey Emmanuel,
>=20
> first of all sorry for taking that long to reply to your patches ...
>=20
> I notice that there has been no movement on this so I wonder how we shoul=
d proceed with this patch, our CI shows at least that you have some style i=
ssues on the patches (https://gitlab.freedesktop.org/linux-media/users/seba=
stianfricke/-/jobs/71044070) and I would like to have a reviewer first befo=
re I can think about merging this.
>=20
> For a start can you rebase this patch series and apply the required fixes=
 to make our CI happy and then we have to look for a reviewer as this is a =
new driver and I don't want to solely rely on my opinion as I am not well v=
ersed in the Cedrus driver.

I would usually review such contribution, but since I'm co-author, there is=
 a conflict of interests. You can ask Paul Kocialkowski.

Best regards,
Jernej

>=20
> Regards,
> Sebastian
>=20
>  ---- On Wed, 31 Jul 2024 18:44:12 +0200  Emmanuel Gil Peyrot <linkmauve@=
linkmauve.fr> wrote ---=20
>  > Basically all Cedrus variants support JPEG decoding. Add code for it.
>  >=20
>  > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>  > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>  > ---
>  >  drivers/staging/media/sunxi/cedrus/Kconfig    |   1 +
>  >  drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
>  >  drivers/staging/media/sunxi/cedrus/cedrus.h   |   5 +
>  >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   2 +
>  >  .../staging/media/sunxi/cedrus/cedrus_jpeg.c  | 352 ++++++++++++++++++
>  >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  16 +
>  >  .../staging/media/sunxi/cedrus/cedrus_video.c |   9 +
>  >  7 files changed, 386 insertions(+), 1 deletion(-)
>  >  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c
>  >=20
>  > diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/stag=
ing/media/sunxi/cedrus/Kconfig
>  > index cb07a343c9c2..5683519aead0 100644
>  > --- a/drivers/staging/media/sunxi/cedrus/Kconfig
>  > +++ b/drivers/staging/media/sunxi/cedrus/Kconfig
>  > @@ -9,6 +9,7 @@ config VIDEO_SUNXI_CEDRUS
>  >      select SUNXI_SRAM
>  >      select VIDEOBUF2_DMA_CONTIG
>  >      select V4L2_MEM2MEM_DEV
>  > +    select V4L2_JPEG_HELPER
>  >      help
>  >        Support for the VPU found in Allwinner SoCs, also known as the =
Cedar
>  >        video engine.
>  > diff --git a/drivers/staging/media/sunxi/cedrus/Makefile b/drivers/sta=
ging/media/sunxi/cedrus/Makefile
>  > index a647b3690bf8..fa3e949e0788 100644
>  > --- a/drivers/staging/media/sunxi/cedrus/Makefile
>  > +++ b/drivers/staging/media/sunxi/cedrus/Makefile
>  > @@ -3,4 +3,4 @@ obj-$(CONFIG_VIDEO_SUNXI_CEDRUS) +=3D sunxi-cedrus.o
>  > =20
>  >  sunxi-cedrus-y =3D cedrus.o cedrus_video.o cedrus_hw.o cedrus_dec.o \
>  >           cedrus_mpeg2.o cedrus_h264.o cedrus_h265.o \
>  > -         cedrus_vp8.o
>  > +         cedrus_vp8.o cedrus_jpeg.o
>  > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus.h
>  > index 522c184e2afc..555f8d124d47 100644
>  > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
>  > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
>  > @@ -34,6 +34,7 @@
>  >  #define CEDRUS_CAPABILITY_MPEG2_DEC    BIT(3)
>  >  #define CEDRUS_CAPABILITY_VP8_DEC    BIT(4)
>  >  #define CEDRUS_CAPABILITY_H265_10_DEC    BIT(5)
>  > +#define CEDRUS_CAPABILITY_JPEG_DEC    BIT(6)
>  > =20
>  >  enum cedrus_irq_status {
>  >      CEDRUS_IRQ_NONE,
>  > @@ -152,6 +153,9 @@ struct cedrus_ctx {
>  >              u8        *entropy_probs_buf;
>  >              dma_addr_t    entropy_probs_buf_dma;
>  >          } vp8;
>  > +        struct {
>  > +            unsigned int    subsampling;
>  > +        } jpeg;
>  >      } codec;
>  >  };
>  > =20
>  > @@ -201,6 +205,7 @@ extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
>  >  extern struct cedrus_dec_ops cedrus_dec_ops_h264;
>  >  extern struct cedrus_dec_ops cedrus_dec_ops_h265;
>  >  extern struct cedrus_dec_ops cedrus_dec_ops_vp8;
>  > +extern struct cedrus_dec_ops cedrus_dec_ops_jpeg;
>  > =20
>  >  static inline void cedrus_write(struct cedrus_dev *dev, u32 reg, u32 =
val)
>  >  {
>  > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_hw.c
>  > index 582b6cb796ea..e237f7d66f7e 100644
>  > --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>  > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>  > @@ -43,7 +43,9 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  >      reg |=3D VE_MODE_DDR_MODE_BW_128;
>  > =20
>  >      switch (ctx->src_fmt.pixelformat) {
>  > +    /* MPEG2 and JPEG both use the same decoding mode bit. */
>  >      case V4L2_PIX_FMT_MPEG2_SLICE:
>  > +    case V4L2_PIX_FMT_JPEG:
>  >          reg |=3D VE_MODE_DEC_MPEG;
>  >          break;
>  > =20
>  > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_jpeg.c
>  > new file mode 100644
>  > index 000000000000..1e8978ebf9dd
>  > --- /dev/null
>  > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c
>  > @@ -0,0 +1,352 @@
>  > +// SPDX-License-Identifier: GPL-2.0
>  > +/*
>  > + * Cedrus VPU driver
>  > + *
>  > + * Copyright (C) 2022 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>  > + */
>  > +
>  > +#include <media/videobuf2-dma-contig.h>
>  > +#include <media/v4l2-jpeg.h>
>  > +
>  > +#include "cedrus.h"
>  > +#include "cedrus_hw.h"
>  > +#include "cedrus_regs.h"
>  > +
>  > +static enum cedrus_irq_status cedrus_jpeg_irq_status(struct cedrus_ct=
x *ctx)
>  > +{
>  > +    struct cedrus_dev *dev =3D ctx->dev;
>  > +    u32 reg;
>  > +
>  > +    reg =3D cedrus_read(dev, VE_DEC_MPEG_STATUS);
>  > +    reg &=3D VE_DEC_MPEG_STATUS_CHECK_MASK;
>  > +
>  > +    if (!reg)
>  > +        return CEDRUS_IRQ_NONE;
>  > +
>  > +    if (reg & VE_DEC_MPEG_STATUS_CHECK_ERROR)
>  > +        return CEDRUS_IRQ_ERROR;
>  > +
>  > +    return CEDRUS_IRQ_OK;
>  > +}
>  > +
>  > +static void cedrus_jpeg_irq_clear(struct cedrus_ctx *ctx)
>  > +{
>  > +    struct cedrus_dev *dev =3D ctx->dev;
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_STATUS, VE_DEC_MPEG_STATUS_CHECK_MA=
SK);
>  > +}
>  > +
>  > +static void cedrus_jpeg_irq_disable(struct cedrus_ctx *ctx)
>  > +{
>  > +    struct cedrus_dev *dev =3D ctx->dev;
>  > +    u32 reg =3D cedrus_read(dev, VE_DEC_MPEG_CTRL);
>  > +
>  > +    reg &=3D ~VE_DEC_MPEG_CTRL_IRQ_MASK;
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
>  > +}
>  > +
>  > +static int cedrus_write_table_header(struct cedrus_dev *dev,
>  > +                                     struct v4l2_jpeg_reference *tabl=
e)
>  > +{
>  > +    u16 start_codes[16], code;
>  > +    u8 offsets[16], *ptr;
>  > +    unsigned int count;
>  > +    u32 *ptr32;
>  > +    int i;
>  > +
>  > +    ptr =3D table->start;
>  > +    if (!ptr)
>  > +        return -EINVAL;
>  > +
>  > +    count =3D 0;
>  > +    code =3D 0;
>  > +    for (i =3D 0; i < 16; i++) {
>  > +        offsets[i] =3D count;
>  > +        start_codes[i] =3D code;
>  > +        count +=3D ptr[i];
>  > +        code +=3D ptr[i];
>  > +        code *=3D 2;
>  > +    }
>  > +
>  > +    for (i =3D 15; i >=3D 0 && !ptr[i]; i--)
>  > +        start_codes[i] =3D 0xffff;
>  > +
>  > +    ptr32 =3D (u32*)start_codes;
>  > +    for (i =3D 0; i < 8; i++)
>  > +        cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, ptr32[i]);
>  > +
>  > +    ptr32 =3D (u32*)offsets;
>  > +    for (i =3D 0; i < 4; i++)
>  > +        cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, ptr32[i]);
>  > +
>  > +    for (i =3D 0; i < 4; i++)
>  > +        cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, 0);
>  > +
>  > +    return 0;
>  > +}
>  > +
>  > +static int cedrus_jpeg_write_dh_tables(struct cedrus_dev *dev,
>  > +                                       struct v4l2_jpeg_header *hdr)
>  > +{
>  > +    struct v4l2_jpeg_reference *tables[4], *table;
>  > +    struct v4l2_jpeg_scan_component_spec *comp;
>  > +    unsigned int i, j, ret;
>  > +    size_t length;
>  > +    u32 *ptr, val;
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_OFFSET, 0);
>  > +
>  > +    j =3D 0;
>  > +    for (i =3D 0; i < 2; i++) {
>  > +        comp =3D &hdr->scan->component[i];
>  > +
>  > +        tables[j++] =3D &hdr->huffman_tables[comp->dc_entropy_coding_=
table_selector];
>  > +        tables[j++] =3D &hdr->huffman_tables[comp->ac_entropy_coding_=
table_selector + 2];
>  > +    }
>  > +
>  > +    for (i =3D 0; i < 4; i++) {
>  > +        ret =3D cedrus_write_table_header(dev, tables[i]);
>  > +        if (ret)
>  > +            return ret;
>  > +    }
>  > +
>  > +    for (i =3D 0; i < 192; i++)
>  > +        cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, 0);
>  > +
>  > +    for (i =3D 0; i < 4; i++) {
>  > +        table =3D tables[i];
>  > +        ptr =3D (u32*)&table->start[16];
>  > +        length =3D table->length - 16;
>  > +
>  > +        for (j =3D 0; j < length / 4; j++)
>  > +            cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, ptr[j]);
>  > +
>  > +        if (length & 3) {
>  > +            val =3D 0;
>  > +            for (j =3D 0; j < (length & 3); j++)
>  > +                val =3D (val << 8) | table->start[15 + length - j];
>  > +            cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, val);
>  > +        }
>  > +
>  > +        for (j =3D 0; j < 64 - DIV_ROUND_UP(length, 4); j++)
>  > +            cedrus_write(dev, VE_DEC_MPEG_SRAM_RW_DATA, 0);
>  > +    }
>  > +
>  > +    return 0;
>  > +}
>  > +
>  > +static int cedrus_write_quantization_matrix(struct cedrus_dev *dev, u=
32 flags,
>  > +                                            struct v4l2_jpeg_referenc=
e *table)
>  > +{
>  > +    const u8 *matrix;
>  > +    u32 reg, val;
>  > +    int i;
>  > +
>  > +    matrix =3D table->start;
>  > +    if (!matrix)
>  > +        return -EINVAL;
>  > +
>  > +    for (i =3D 0; i < 64; i++) {
>  > +        /* determine if values are 8 or 16 bits */
>  > +        val =3D *matrix++;
>  > +        if (table->length > 64)
>  > +            val =3D (val << 8) | *matrix++;
>  > +
>  > +        reg =3D VE_DEC_MPEG_IQMINPUT_WEIGHT(i, val);
>  > +        reg |=3D flags;
>  > +
>  > +        cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
>  > +    }
>  > +
>  > +    return 0;
>  > +}
>  > +
>  > +static int cedrus_jpeg_setup(struct cedrus_ctx *ctx, struct cedrus_ru=
n *run)
>  > +{
>  > +    struct cedrus_dev *dev =3D ctx->dev;
>  > +    dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
>  > +    struct v4l2_jpeg_scan_header scan_header;
>  > +    struct v4l2_jpeg_reference quantization_tables[4] =3D { };
>  > +    struct v4l2_jpeg_reference huffman_tables[4] =3D { };
>  > +    struct v4l2_jpeg_header header =3D {
>  > +        .scan =3D &scan_header,
>  > +        .quantization_tables =3D quantization_tables,
>  > +        .huffman_tables =3D huffman_tables,
>  > +    };
>  > +    struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
>  > +    struct v4l2_jpeg_frame_component_spec *components;
>  > +    u32 reg, subsampling;
>  > +    unsigned long size;
>  > +    int ret, index;
>  > +    u8 hmax, vmax;
>  > +    u16 width, height;
>  > +
>  > +    size =3D vb2_get_plane_payload(src_buf, 0);
>  > +    ret =3D v4l2_jpeg_parse_header(vb2_plane_vaddr(src_buf, 0), size,=
 &header);
>  > +    if (ret < 0) {
>  > +        v4l2_err(&dev->v4l2_dev,
>  > +                 "failed to parse JPEG header: %d\n", ret);
>  > +        return -EINVAL;
>  > +    }
>  > +
>  > +    width =3D header.frame.width;
>  > +    height =3D header.frame.height;
>  > +    if (width > 2048 || height > 2048) {
>  > +        v4l2_err(&dev->v4l2_dev,
>  > +                 "unsupported JPEG of resolution %ux%u (max 2048x2048=
)\n",
>  > +                 width, height);
>  > +        return -EINVAL;
>  > +    }
>  > +
>  > +    if (header.frame.precision !=3D 8) {
>  > +        v4l2_err(&dev->v4l2_dev,
>  > +                 "unsupported JPEG with %u bits of precision (8 requi=
red)\n",
>  > +                 header.frame.precision);
>  > +        return -EINVAL;
>  > +    }
>  > +
>  > +    if (header.frame.num_components !=3D 3) {
>  > +        v4l2_err(&dev->v4l2_dev,
>  > +                 "unsupported JPEG with %u components (3 required)\n",
>  > +                 header.frame.num_components);
>  > +        return -EINVAL;
>  > +    }
>  > +
>  > +    components =3D header.frame.component;
>  > +    index =3D components[0].horizontal_sampling_factor << 20 |
>  > +        components[0].vertical_sampling_factor << 16 |
>  > +        components[1].horizontal_sampling_factor << 12 |
>  > +        components[1].vertical_sampling_factor << 8 |
>  > +        components[2].horizontal_sampling_factor << 4 |
>  > +        components[2].vertical_sampling_factor;
>  > +
>  > +    switch (index) {
>  > +    case 0x221111:
>  > +        subsampling =3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_420;
>  > +        break;
>  > +    case 0x211111:
>  > +        subsampling =3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422;
>  > +        break;
>  > +    case 0x111111:
>  > +        subsampling =3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_444;
>  > +        break;
>  > +    case 0x121111:
>  > +        subsampling =3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422T;
>  > +        break;
>  > +    default:
>  > +        v4l2_err(&dev->v4l2_dev, "unsupported subsampling %d\n", inde=
x);
>  > +        return -EINVAL;
>  > +    }
>  > +
>  > +    ctx->codec.jpeg.subsampling =3D subsampling;
>  > +
>  > +    /* Activate MPEG engine and select JPEG subengine. */
>  > +    cedrus_engine_enable(ctx);
>  > +
>  > +    reg =3D VE_DEC_MPEG_TRIGGER_JPEG | subsampling;
>  > +    cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
>  > +
>  > +    /* Set restart interval. */
>  > +    cedrus_write(dev, VE_DEC_MPEG_JPEG_RES_INT, header.restart_interv=
al);
>  > +
>  > +    /* Set resolution in blocks. */
>  > +    hmax =3D components[0].horizontal_sampling_factor;
>  > +    vmax =3D components[0].vertical_sampling_factor;
>  > +    for (index =3D 1; index < 3; index++) {
>  > +        if (hmax < components[index].horizontal_sampling_factor)
>  > +            hmax =3D components[index].horizontal_sampling_factor;
>  > +        if (vmax < components[index].vertical_sampling_factor)
>  > +            vmax =3D components[index].vertical_sampling_factor;
>  > +    }
>  > +
>  > +    reg =3D VE_DEC_MPEG_JPEG_SIZE_WIDTH(DIV_ROUND_UP(width, 8 * hmax)=
);
>  > +    reg |=3D VE_DEC_MPEG_JPEG_SIZE_HEIGHT(DIV_ROUND_UP(height, 8 * vm=
ax));
>  > +    cedrus_write(dev, VE_DEC_MPEG_JPEG_SIZE, reg);
>  > +
>  > +    /* Set intra quantisation matrix. */
>  > +    index =3D components[0].quantization_table_selector;
>  > +    ret =3D cedrus_write_quantization_matrix(dev,
>  > +                                           VE_DEC_MPEG_IQMINPUT_FLAG_=
INTRA,
>  > +                                           &quantization_tables[index=
]);
>  > +    if (ret)
>  > +        return ret;
>  > +
>  > +    /* Set non-intra quantisation matrix. */
>  > +    index =3D components[1].quantization_table_selector;
>  > +    ret =3D cedrus_write_quantization_matrix(dev,
>  > +                                           VE_DEC_MPEG_IQMINPUT_FLAG_=
NON_INTRA,
>  > +                                           &quantization_tables[index=
]);
>  > +    if (ret)
>  > +        return ret;
>  > +
>  > +    /* Set Diffie-Huffman tables. */
>  > +    ret =3D cedrus_jpeg_write_dh_tables(dev, &header);
>  > +    if (ret)
>  > +        return ret;
>  > +
>  > +    /* Destination luma and chroma buffers. */
>  > +
>  > +    dst_luma_addr =3D cedrus_dst_buf_addr(ctx, &run->dst->vb2_buf, 0);
>  > +    dst_chroma_addr =3D cedrus_dst_buf_addr(ctx, &run->dst->vb2_buf, =
1);
>  > +
>  > +    /* JPEG outputs to rotation/scale down output buffers */
>  > +    cedrus_write(dev, VE_DEC_MPEG_ROT_LUMA, dst_luma_addr);
>  > +    cedrus_write(dev, VE_DEC_MPEG_ROT_CHROMA, dst_chroma_addr);
>  > +
>  > +    /* Disable rotation and scaling. */
>  > +    cedrus_write(dev, VE_DEC_MPEG_SD_ROT_DBLK_CTL, 0);
>  > +
>  > +    /* Source offset and length in bits. */
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_VLD_OFFSET, 8 * header.ecs_offset);
>  > +
>  > +    reg =3D size * 8;
>  > +    cedrus_write(dev, VE_DEC_MPEG_VLD_LEN, reg);
>  > +
>  > +    /* Source beginning and end addresses. */
>  > +
>  > +    src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
>  > +
>  > +    reg =3D VE_DEC_MPEG_VLD_ADDR_BASE(src_buf_addr);
>  > +    reg |=3D VE_DEC_MPEG_VLD_ADDR_VALID_PIC_DATA;
>  > +    reg |=3D VE_DEC_MPEG_VLD_ADDR_LAST_PIC_DATA;
>  > +    reg |=3D VE_DEC_MPEG_VLD_ADDR_FIRST_PIC_DATA;
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_VLD_ADDR, reg);
>  > +
>  > +    reg =3D src_buf_addr + size;
>  > +    cedrus_write(dev, VE_DEC_MPEG_VLD_END_ADDR, reg);
>  > +
>  > +    /* Enable appropriate interrupts and components. */
>  > +
>  > +    reg =3D VE_DEC_MPEG_CTRL_IRQ_MASK;
>  > +    if (subsampling =3D=3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422 ||
>  > +        subsampling =3D=3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422T ||
>  > +        subsampling =3D=3D VE_DEC_MPEG_TRIGGER_CHROMA_FMT_444)
>  > +        reg |=3D VE_DEC_MPEG_CTRL_JPEG_FORCE_420;
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
>  > +
>  > +    return 0;
>  > +}
>  > +
>  > +static void cedrus_jpeg_trigger(struct cedrus_ctx *ctx)
>  > +{
>  > +    struct cedrus_dev *dev =3D ctx->dev;
>  > +    u32 reg;
>  > +
>  > +    /* Trigger JPEG engine. */
>  > +    reg =3D VE_DEC_MPEG_TRIGGER_HW_JPEG_VLD | VE_DEC_MPEG_TRIGGER_JPE=
G;
>  > +    reg |=3D ctx->codec.jpeg.subsampling;
>  > +
>  > +    cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
>  > +}
>  > +
>  > +struct cedrus_dec_ops cedrus_dec_ops_jpeg =3D {
>  > +    .irq_clear   =3D cedrus_jpeg_irq_clear,
>  > +    .irq_disable =3D cedrus_jpeg_irq_disable,
>  > +    .irq_status  =3D cedrus_jpeg_irq_status,
>  > +    .setup       =3D cedrus_jpeg_setup,
>  > +    .trigger     =3D cedrus_jpeg_trigger,
>  > +};
>  > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/driver=
s/staging/media/sunxi/cedrus/cedrus_regs.h
>  > index 3acc05e0fb54..cb8b4bb4f44e 100644
>  > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>  > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>  > @@ -144,6 +144,7 @@
>  > =20
>  >  #define VE_DEC_MPEG_CTRL_MC_CACHE_EN        BIT(31)
>  >  #define VE_DEC_MPEG_CTRL_SW_VLD            BIT(27)
>  > +#define VE_DEC_MPEG_CTRL_JPEG_FORCE_420        BIT(18)
>  >  #define VE_DEC_MPEG_CTRL_SW_IQ_IS        BIT(17)
>  >  #define VE_DEC_MPEG_CTRL_QP_AC_DC_OUT_EN    BIT(14)
>  >  #define VE_DEC_MPEG_CTRL_ROTATE_SCALE_OUT_EN    BIT(8)
>  > @@ -165,6 +166,7 @@
>  >  #define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422    (0x02 << 27)
>  >  #define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_444    (0x03 << 27)
>  >  #define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_422T    (0x04 << 27)
>  > +#define VE_DEC_MPEG_TRIGGER_CHROMA_FMT_400    (0x05 << 27)
>  > =20
>  >  #define VE_DEC_MPEG_TRIGGER_MPEG1        (0x01 << 24)
>  >  #define VE_DEC_MPEG_TRIGGER_MPEG2        (0x02 << 24)
>  > @@ -255,10 +257,24 @@
>  >  #define VE_DEC_MPEG_IQMINPUT_WEIGHT(i, v) \
>  >      (SHIFT_AND_MASK_BITS(i, 13, 8) | SHIFT_AND_MASK_BITS(v, 7, 0))
>  > =20
>  > +#define VE_DEC_MPEG_JPEG_SIZE            (VE_ENGINE_DEC_MPEG + 0xb8)
>  > +
>  > +#define VE_DEC_MPEG_JPEG_SIZE_WIDTH(w) \
>  > +    SHIFT_AND_MASK_BITS((w) - 1, 10, 0)
>  > +#define VE_DEC_MPEG_JPEG_SIZE_HEIGHT(h) \
>  > +    SHIFT_AND_MASK_BITS((h) - 1, 26, 16)
>  > +
>  > +#define VE_DEC_MPEG_JPEG_MCU            (VE_ENGINE_DEC_MPEG + 0xbc)
>  > +#define VE_DEC_MPEG_JPEG_RES_INT        (VE_ENGINE_DEC_MPEG + 0xc0)
>  >  #define VE_DEC_MPEG_ERROR            (VE_ENGINE_DEC_MPEG + 0xc4)
>  >  #define VE_DEC_MPEG_CRTMBADDR            (VE_ENGINE_DEC_MPEG + 0xc8)
>  >  #define VE_DEC_MPEG_ROT_LUMA            (VE_ENGINE_DEC_MPEG + 0xcc)
>  >  #define VE_DEC_MPEG_ROT_CHROMA            (VE_ENGINE_DEC_MPEG + 0xd0)
>  > +#define VE_DEC_MPEG_SD_ROT_DBLK_CTL        (VE_ENGINE_DEC_MPEG + 0xd4)
>  > +#define VE_DEC_MPEG_JPEG_MCU_START        (VE_ENGINE_DEC_MPEG + 0xd8)
>  > +#define VE_DEC_MPEG_JPEG_MCU_END        (VE_ENGINE_DEC_MPEG + 0xdc)
>  > +#define VE_DEC_MPEG_SRAM_RW_OFFSET        (VE_ENGINE_DEC_MPEG + 0xe0)
>  > +#define VE_DEC_MPEG_SRAM_RW_DATA        (VE_ENGINE_DEC_MPEG + 0xe4)
>  > =20
>  >  #define VE_DEC_H265_DEC_NAL_HDR            (VE_ENGINE_DEC_H265 + 0x00)
>  > =20
>  > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drive=
rs/staging/media/sunxi/cedrus/cedrus_video.c
>  > index b00feaf4072c..7205c2315bc5 100644
>  > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>  > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>  > @@ -55,6 +55,11 @@ static struct cedrus_format cedrus_formats[] =3D {
>  >          .directions    =3D CEDRUS_DECODE_SRC,
>  >          .capabilities    =3D CEDRUS_CAPABILITY_VP8_DEC,
>  >      },
>  > +    {
>  > +        .pixelformat    =3D V4L2_PIX_FMT_JPEG,
>  > +        .directions    =3D CEDRUS_DECODE_SRC,
>  > +        .capabilities    =3D CEDRUS_CAPABILITY_JPEG_DEC,
>  > +    },
>  >      {
>  >          .pixelformat    =3D V4L2_PIX_FMT_NV12,
>  >          .directions    =3D CEDRUS_DECODE_DST,
>  > @@ -118,6 +123,7 @@ void cedrus_prepare_format(struct v4l2_pix_format =
*pix_fmt)
>  >      case V4L2_PIX_FMT_H264_SLICE:
>  >      case V4L2_PIX_FMT_HEVC_SLICE:
>  >      case V4L2_PIX_FMT_VP8_FRAME:
>  > +    case V4L2_PIX_FMT_JPEG:
>  >          /* Zero bytes per line for encoded source. */
>  >          bytesperline =3D 0;
>  >          /* Choose some minimum size since this can't be 0 */
>  > @@ -350,6 +356,9 @@ static int cedrus_s_fmt_vid_out_p(struct cedrus_ct=
x *ctx,
>  >      case V4L2_PIX_FMT_VP8_FRAME:
>  >          ctx->current_codec =3D &cedrus_dec_ops_vp8;
>  >          break;
>  > +    case V4L2_PIX_FMT_JPEG:
>  > +        ctx->current_codec =3D &cedrus_dec_ops_jpeg;
>  > +        break;
>  >      }
>  > =20
>  >      /* Propagate format information to capture. */
>=20
>=20





