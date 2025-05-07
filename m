Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A85C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=; b=Gy58NHuvlKoDfWL6g7sNEsVjoW
	BFEDNdieJ6lj3YFuKfi/H5FN08HvNazJW8OsFXk1HUtQgF8J4jQqPaHkk0jTFHk+mUC3WspW/jUBB
	AAxxJq8Yrafbt2PscNtRH5wK7O4U5oxttmEw5py+DEBDh6MJRrXPaxmTvh0O75lVtDVSgEyHYczqg
	exUqVIOhigoPrR665Yf5Pb/8Ko+wlkj6n7g64BE1dPCI+Q07oVqKQ74+n1nGvKGH6JR6nzD9OofE7
	3k3zZZgPPSyAZRnBLnqrkGmiKl2FuD8zmvrhstpxMacog6AbvuGXI5dlAshNnGopw0vo07N0jM+h5
	GLne7gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXO-0000000GJRr-3ylW;
	Wed, 07 May 2025 17:26:30 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChh9-0000000GAld-0hpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:32:32 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3f9832f798aso93024b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746635550; x=1747240350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=;
        b=woZ9yFx4Bebk5Wuzv/8HocDAiiM+QwjSojtymf7Kmz+pvvd3ZKi+0YDGIbl834784L
         IU7wCKhwQfxdY19mbrjoH+Od1VL8yekgksPuiawRNeIdPUfN20cyQZBfZ6MuQPOfqHaa
         XKxS52uZ6HtDaikyzE0xvCev8s27y+q9Y5qNzcoOQF+QN9ih3+sG8wiLXNq/xSJGvzwB
         wV/rkpXe6x5zlwJ0urREwzHG4BKvA6NKGZoxEwn3LcggdC1MnEWNtX63NeoCWBfZi+zK
         0K939yV+fOhX9CUJ2SVDPxpFXTUgGlM5Hdr326LdREK+YQwDwlJD93ZpD/rSY5nOecRQ
         m9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635550; x=1747240350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=;
        b=nZ0HaAQv1Gv/d8bw8XIhp0aYU/S/Ml2brPBoTrVZGR4c+MoJ/vIS0SyNQM7py4zadE
         i+I3TYhnsfFbi86wpjgD0DZCtm2T8gF+yNwYZ2Ahzwt4LYbnEFMF4qyTJ1PH2HSsiZK2
         +nFjILnh3SIRTpCZszOVkTy7CW1SU2u51xP0Cv++TPVpeQ41fP7bv5n2mxODZvJVpv3R
         //wWbr8I504TSaxs/w3atWQ63AkLxJQetcLQwyqgj3mW3xJI9zQlEvUe6pZWFhXkVBHE
         UH1iiKl9AK37BZUpC0N9dvzBRUme3hM+7/K8TclHna0I55J9kxMhLCy6wUA9atFHhpEB
         0Cbg==
X-Forwarded-Encrypted: i=1; AJvYcCUIUBmEsFbRMhxDgUMVYoh/gshXdl9Kuzojo9L9X5ZFgNeZWnKloBFmrkrwHDVY5KNeMaCDK4MgaR0/CLuA5hls@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7HYVL58Yc+JExvhpupR9LlSkwn+H+05BB+wshih8nBOVPEmfv
	ZJ8QMxqZFzdGRv4069UPpV1xoGe8Sdm9mo/Sf+pqWTiSru4zlUaWD6mtZEWq0DRs+VNzuewiipY
	cRupYfn7j69MHfFlkR0/QX+swO/YI1dlqRKZTX6sC8FmGvuF8GmU=
X-Gm-Gg: ASbGncshiilmujg/DPUlomqboj3K+EFTPBnqWaEG0QSFZkDZTbNQdWZyRNI/wjMzm1K
	U3Nok9muSFaFxQ4QGzwSnSB1UWnkXm7SpUDOMS6AiE4MBJrHw4J/QEMcT+IikCDVyq/l572qlbN
	6LiLta6315+lDURCZo6M1uoho=
X-Google-Smtp-Source: AGHT+IFydqe8XP7ZbsEI4FJ7nHMo2qb0FBj+wx8QFnVlqVGZ0YgAt35WAhs9j3CQ76LLi08wMmQjhHHbpx9s0MvBOTg=
X-Received: by 2002:a05:6820:180a:b0:603:f191:a93c with SMTP id
 006d021491bc7-60828d3a917mr2866969eaf.6.1746635539868; Wed, 07 May 2025
 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-12-jens.wiklander@linaro.org> <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
In-Reply-To: <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 May 2025 18:32:08 +0200
X-Gm-Features: ATxdqUElU24AIG1nJsrzoZKKB0gEXwhwftpouBsM_UdwgzzPM34h3I_iZz1EmXw
Message-ID: <CAHUa44HEPF3w=b2O-4DcRUBgF4rJUUze8zy48_g_FCQ5Y34U6A@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_093231_213336_22755149 
X-CRM114-Status: GOOD (  31.90  )
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

Hi,

On Fri, May 2, 2025 at 5:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
> > from the default CMA pool. The memory is represented by a tee_shm objec=
t
> > using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
> > from CMA.
>
> If and when it's possible to dynamically delegate any old kernel memory
> to the TEE, it's far from clear why that should involve poking around in
> CMA internals...
>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++-=
-
> >   include/linux/tee_core.h |  4 +++
> >   2 files changed, 57 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e1ed52ee0a16..faaa0a87bb18 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -3,8 +3,11 @@
> >    * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
> >    */
> >   #include <linux/anon_inodes.h>
> > +#include <linux/cma.h>
> >   #include <linux/device.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/highmem.h>
> >   #include <linux/idr.h>
> >   #include <linux/io.h>
> >   #include <linux/mm.h>
> > @@ -13,7 +16,6 @@
> >   #include <linux/tee_core.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/uio.h>
> > -#include <linux/highmem.h>
> >   #include "tee_private.h"
> >
> >   static void shm_put_kernel_pages(struct page **pages, size_t page_cou=
nt)
> > @@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >       struct tee_shm *parent_shm =3D NULL;
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_CMA_BUF) {
> > +#if IS_ENABLED(CONFIG_CMA)
> > +             struct page *page =3D phys_to_page(shm->paddr);
> > +             struct cma *cma =3D dev_get_cma_area(&shm->ctx->teedev->d=
ev);
>
> If you want dma_contiguous_default_area as the commit message implies,
> use dma_contiguous_default_area. Appearing to support per-device CMA
> pools but relying on the device not having one is pretty yucky.
>
> But again, why? If you want page-backed DMA-able memory, with all the
> other assumptions being made here, you may as well just rely on
> dma_alloc_pages(DMA_ATTR_SKIP_CPU_SYNC) doing what you want, while also
> being potentially more flexible for !CMA and non-invasive. Or at the
> very least, could the TEE delegation not be composed on top of the
> existing CMA heap allocator?

Thanks for suggesting dma_alloc_pages(). I'll use that in the next
version of the patch set.

Cheers,
Jens

>
> Thanks,
> Robin.
>
> > +
> > +             cma_release(cma, page, shm->size / PAGE_SIZE);
> > +#endif
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >   }
> >   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> > +                                        size_t page_count, size_t alig=
n)
> > +{
> > +#if IS_ENABLED(CONFIG_CMA)
> > +     struct tee_device *teedev =3D ctx->teedev;
> > +     struct cma *cma =3D dev_get_cma_area(&teedev->dev);
> > +     struct tee_shm *shm;
> > +     struct page *page;
> > +
> > +     if (!tee_device_get(teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     page =3D cma_alloc(cma, page_count, align, true/*no_warn*/);
> > +     if (!page)
> > +             goto err_put_teedev;
> > +
> > +     shm =3D kzalloc(sizeof(*shm), GFP_KERNEL);
> > +     if (!shm)
> > +             goto err_cma_crelease;
> > +
> > +     refcount_set(&shm->refcount, 1);
> > +     shm->ctx =3D ctx;
> > +     shm->paddr =3D page_to_phys(page);
> > +     shm->size =3D page_count * PAGE_SIZE;
> > +     shm->flags =3D TEE_SHM_CMA_BUF;
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     return shm;
> > +
> > +err_cma_crelease:
> > +     cma_release(cma, page, page_count);
> > +err_put_teedev:
> > +     tee_device_put(teedev);
> > +
> > +     return ERR_PTR(-ENOMEM);
> > +#else
> > +     return ERR_PTR(-EINVAL);
> > +#endif
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
> > +
> >   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t=
 align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 02c07f661349..3a4e1b00fcc7 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -29,6 +29,7 @@
> >   #define TEE_SHM_POOL                BIT(2)  /* Memory allocated from =
pool */
> >   #define TEE_SHM_PRIV                BIT(3)  /* Memory private to TEE =
driver */
> >   #define TEE_SHM_DMA_BUF             BIT(4)  /* Memory with dma-buf ha=
ndle */
> > +#define TEE_SHM_CMA_BUF              BIT(5)  /* CMA allocated memory *=
/
> >
> >   #define TEE_DEVICE_FLAG_REGISTERED  0x1
> >   #define TEE_MAX_DEV_NAME_LEN                32
> > @@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >    */
> >   struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_=
t size);
> >
> > +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> > +                                        size_t page_count, size_t alig=
n);
> > +
> >   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t=
 align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,

