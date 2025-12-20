Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C88DE668AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 00:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLPI+6y1Cd274pWyRLM4LL7VX9uNyq+alqBEtAEYrvI=; b=FclAdpFUDN6ca+Ztoe45kjFei2
	3OZztOhi7dTl/rH5JEi60KoeRD/OINTBTWkrUBU5BphpH/7WQCFOTTK/9Kz83oXiaNdPrNEl2DeSZ
	MxLN3TBSszWu+4ScFp5u2lzV5UwO2UcDJ57lbvU4J0RZHn16+1WsAZ0jijZLWoNa5y0bRMDr3Xk+V
	MrCJn5I6QAnjzwmGLVQ5Y/IPV33TQq/LsLAsvxp3gTv/P0RDvUmG6oCPDv8O5gkts3Fwtr++Owmyc
	pqTQeqvEir6jgMvv96LOf6zwcBnOe1yOWYNyKL295PHmvyy0/0hhMYheRjBlLumubLoFvmFOpcoIr
	t7ZF0lfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWl6B-0000000B8pP-0hNj;
	Sat, 20 Dec 2025 00:45:31 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWl69-0000000B8of-0uwo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 00:45:30 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7881b67da53so19837067b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 16:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766191528; x=1766796328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLPI+6y1Cd274pWyRLM4LL7VX9uNyq+alqBEtAEYrvI=;
        b=mRlX4hsY3xENxyxgk0ZuXgmcDT196gIZPmVOPcPkIaaKVG94wHo40/tViaoF4pV/5N
         M6sLkoQx3oYXdFMYTA//e3cWKqXFjxAR7PPU6bEsN82q29xZlASYYbx+y+m/YRKZOb/c
         gbcnplPQ1Fqbj9PZrO3vMH86YqPgA44YLY17YdQdcSPXDdc+y92Ai1jhIyoOHvwBUsvy
         sBbamgy0yfWi0jyP7XjNBGEUh/QCHh93wq1bNbUnAuire/QOCI2nNHcU4mexbTpm86rd
         XGskm3kwHExZlOgpFNVcNXBbyghIbajiVG7o7upbvwdidkOKNlMz66d5JNtOY+MkNfb7
         xAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766191528; x=1766796328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DLPI+6y1Cd274pWyRLM4LL7VX9uNyq+alqBEtAEYrvI=;
        b=YtRL3lFTYlqN7tR72UYcIWdcPaxxWaM+bUg+2plSQyh/qPy5objqCQ5mWVnLZOyAhg
         L+bz5gH4TuSw3nBipBMs77KhMzRxOrwEAJmg2UuvkTCXnc+hEEBEIkpHwwG6r8H2wB4x
         SxWTpBPPrwsUtftodDf45KJh3ooft6+aTfDz6IvSB6+bLeoSpSLOFiBp36kz4wBY1qYX
         QsKmGB/NTwMGKNEpN5UJsQZOXOeRTD1cFc7WHYbTyW+UwZkaEUB80niKotAGLsfFWjfW
         vdTfmVuzHxJaJBCt2abTlx+9HESXWmZvf3jgFR+1pBndZsvUU4LMfxPevYtEfX3Dfo5G
         D8ow==
X-Forwarded-Encrypted: i=1; AJvYcCX0/vvuOwl7+vi5p32ZAr8OAaJ81GHVbQWD9r2XXaxb6cRdNznUO2dN5AvE65FmsbFpWV+hoiyp8Y57I4hrMmPX@lists.infradead.org
X-Gm-Message-State: AOJu0YzDm0Hw2fk0eMGmiHXJXdguXCbKVJnxye4B+PXKCaiPYt8SI2jF
	DU1v0Hu9uwsQqvE0XiMPBEpyUYNa+kWerJu7BosRLEx9M3UuA9X67vAyznEauDnD7FQKt0wkJ7u
	c1QKeWJsofR64QcPHB47JMeMeF4XppQ4=
X-Gm-Gg: AY/fxX6OT4d4djqt5RqSw5r1l70smnXcQSjdgVwbKXkNi75kqo+eqQD1cMGeFU/rV/C
	CFGTbRQOOTZia09jd4Iel5dsozAL6fNLsBUShlGCLk0NiUsT45PzQPcCRjWZwYmJjUlLyaWbmCL
	vBzvzzbpAg0TGPECUfrLyCwrClNz+ATsf9CrPQwXeLv9IqZzkhSpZh4iZKs3XcHJ/OtUyp/egTy
	jQ7GpUTjgc3s5xkkAdSGdnVnoKcfrMoBCNlWrtWmAmkYAD0X49HrC6i3jrBf04kStO7SPtCEqKh
	ndYojUCNI3vBPy4cXNUxRpWZmn2/NazMSzL9AFc=
X-Google-Smtp-Source: AGHT+IGxV5Pk9FDKr/Lj9KKxcmNH7Vilqojhd5iNKpIgV73bbfC+PbBJ47gDiQQYvtv+vvVB4r13+qOWvY++J5PPenk=
X-Received: by 2002:a53:6912:0:b0:645:5d62:dd8 with SMTP id
 956f58d0204a3-6466a8f31a3mr2853787d50.50.1766191527647; Fri, 19 Dec 2025
 16:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com> <bdf5b4f9-d6f5-419d-9465-4f722bac06ef@arm.com>
In-Reply-To: <bdf5b4f9-d6f5-419d-9465-4f722bac06ef@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 19 Dec 2025 16:45:16 -0800
X-Gm-Features: AQt7F2qLOWDeNcNuYDcamhHFDHG6i6Fg_mD7kZv-_AbDieajS4u9bPacZVvQHto
Message-ID: <CAPaKu7So4BeEyUGSS3ZAHi+Z=Sh6Kpy_W8eEtX4UQs=__MpPEA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/panthor: Implement reading shader_present from nvmem
To: Steven Price <steven.price@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_164529_273688_5769F652 
X-CRM114-Status: GOOD (  32.39  )
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

On Fri, Dec 19, 2025 at 7:31=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 17/12/2025 17:03, Nicolas Frattaroli wrote:
> > On some platforms, notably MediaTek MT8196, the shader_present bitmask
> > in the Mali GPU register for it has cores enabled that may be faulty.
> > The true shader_present bitmask is found in an efuse instead.
> >
> > Implement reading shader_present from an nvmem cell if one is present,
> > falling back to the Mali register if it's absent. The error codes are
> > trickled up through to the probe function so that probe deferral works.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> [Although I really hope other vendors don't do this - the hardware is
> broken!]
>
> Although one NIT below if you respin for other reasons...
>
> > ---
> >  drivers/gpu/drm/panthor/panthor_hw.c | 63 ++++++++++++++++++++++++++++=
++++----
> >  1 file changed, 57 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/pan=
thor/panthor_hw.c
> > index 87ebb7ae42c4..eb44c8b108aa 100644
> > --- a/drivers/gpu/drm/panthor/panthor_hw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0 or MIT
> >  /* Copyright 2025 ARM Limited. All rights reserved. */
> >
> > +#include <linux/nvmem-consumer.h>
> >  #include <drm/drm_print.h>
> >
> >  #include "panthor_device.h"
> > @@ -109,7 +110,52 @@ static char *get_gpu_model_name(struct panthor_dev=
ice *ptdev)
> >       return "(Unknown Mali GPU)";
> >  }
> >
> > -static void panthor_gpu_info_init(struct panthor_device *ptdev)
> > +static int overload_shader_present(struct panthor_device *ptdev)
> > +{
> > +     struct device *dev =3D ptdev->base.dev;
> > +     struct nvmem_cell *cell =3D nvmem_cell_get(dev, "shader-present")=
;
> > +     ssize_t len;
> > +     void *buf;
> > +     int ret;
> > +
> > +     if (IS_ERR(cell)) {
> > +             /* On platforms without this cell, use the Mali register =
*/
> > +             if (PTR_ERR(cell) =3D=3D -ENOENT)
> > +                     return 0;
> > +
> > +             return dev_err_probe(dev, PTR_ERR(cell),
> > +                                  "Failed to get shader-present nvmem =
cell\n");
> > +     }
> > +
> > +     buf =3D nvmem_cell_read(cell, &len);
> > +     if (IS_ERR(buf)) {
> > +             ret =3D dev_err_probe(dev, PTR_ERR(buf),
> > +                                 "Failed to read shader-present nvmem =
cell\n");
> > +             goto err_put_cell;
> > +     }
> > +
> > +     if (!len || len > 8) {
> > +             ret =3D dev_err_probe(dev, -EINVAL, "shader-present cell =
can't be length %ld\n",
> > +                                 len);
> > +             goto err_free;
> > +     }
> > +
> > +     memcpy(&ptdev->gpu_info.shader_present, buf, len);
When len is 4, this is neither overriding nor masking. I might suggest
switching to nvmem_cell_read_variable_le_u64 for simplicity.

Either way, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>


> > +
> > +     kfree(buf);
> > +     nvmem_cell_put(cell);
> > +
> > +     return 0;
> > +
> > +err_free:
> > +     kfree(buf);
> > +err_put_cell:
> > +     nvmem_cell_put(cell);
> > +
> > +     return ret;
> > +}
>
> Rather than repeating the clean up, you can do something like:
>
> {
>         void *buf =3D NULL;
>         int ret =3D 0
>
>         if (IS_ERR(cell)) {
>                 ret =3D dev_err_probe(...);
>                 goto out;
>         }
>
>         buf =3D nvmem_cell_read();
>         if (IS_ERR(buf)) {
>                 ret =3D dev_err_probe(...);
>                 goto out;
>         }
>
>         if (!len || len > 8) {
>                 ret =3D dev_err_probe(...);
>                 goto out;
>         }
>
>         memcpy();
>
> out:
>         if (!IS_ERR(buf))
>                 kfree(buf);
>         if (!IS_ERR(cell))
>                 nvmem_cell_put(cell);
>
>         return ret;
> }
>
> That avoids mistakes when adding a new operation into the sequence. Or
> you can use the fancy new cleanup helpers, but that feels overkill here.
> But equally I'm ok if you leave the code as is - it's simple enough and
> the conversation can be done later if we need it.
>
> Thanks,
> Steve
>
> > +
> > +static int panthor_gpu_info_init(struct panthor_device *ptdev)
> >  {
> >       unsigned int i;
> >
> > @@ -143,13 +189,18 @@ static void panthor_gpu_info_init(struct panthor_=
device *ptdev)
> >               ptdev->gpu_info.tiler_present =3D gpu_read64(ptdev, GPU_T=
ILER_PRESENT);
> >               ptdev->gpu_info.l2_present =3D gpu_read64(ptdev, GPU_L2_P=
RESENT);
> >       }
> > +
> > +     return overload_shader_present(ptdev);
> >  }
> >
> > -static void panthor_hw_info_init(struct panthor_device *ptdev)
> > +static int panthor_hw_info_init(struct panthor_device *ptdev)
> >  {
> >       u32 major, minor, status;
> > +     int ret;
> >
> > -     panthor_gpu_info_init(ptdev);
> > +     ret =3D panthor_gpu_info_init(ptdev);
> > +     if (ret)
> > +             return ret;
> >
> >       major =3D GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> >       minor =3D GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> > @@ -172,6 +223,8 @@ static void panthor_hw_info_init(struct panthor_dev=
ice *ptdev)
> >                "shader_present=3D0x%0llx l2_present=3D0x%0llx tiler_pre=
sent=3D0x%0llx",
> >                ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_prese=
nt,
> >                ptdev->gpu_info.tiler_present);
> > +
> > +     return 0;
> >  }
> >
> >  static int panthor_hw_bind_device(struct panthor_device *ptdev)
> > @@ -218,7 +271,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
> >       if (ret)
> >               return ret;
> >
> > -     panthor_hw_info_init(ptdev);
> > -
> > -     return 0;
> > +     return panthor_hw_info_init(ptdev);
> >  }
> >
>

