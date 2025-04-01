Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DB9C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sCqoi2+dXPe214Qh2/irU3yim1lmhg8lbu3VkUkCRk=; b=i9A//noqwFlsLsMM98GPg7JY6v
	Gfaib8qwr+P9tGw5F6hZb5MqOl8TEjWdgJygmW4xYhP5L8xYkD1F3TICzbD0AKmBBMVoTHWBeMXnK
	mVayQyN8RkPhgfQCWM4DSSuGpMEJZk0qBfxU3fkVvrinhmnVndjSfE5Nc6vnHSFzxOeobQS7hJr8n
	UmCkQW6h+ZVA2c5HAnnO914z86ja/VeP2CaROEF5x5GM1fyWpFpMRaaRZE8AUr+EQOdQMRiUW2CHZ
	pJQ2AmQjEEHnBif2kGLeqdGhYjvBj5F7kNqIS2xsAFl7H9wiaZahbTpK9KyYpbrQFhyHHv3dLEPIi
	ZZ09r+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb1y-00000003LHp-0aNC;
	Tue, 01 Apr 2025 12:47:50 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzai0-00000003C2L-0Yek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:27:13 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2c81fffd523so1714269fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743510431; x=1744115231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sCqoi2+dXPe214Qh2/irU3yim1lmhg8lbu3VkUkCRk=;
        b=k2XEYHh+GJqaForNCL0lGi7X+f+aZSNPpd0JTQaRyaTKLGVY875HAu04iQ94xoZtzQ
         EDfRj0QgFdKRXw21fHVduUAJ/KgilTzAOlIpNSvm6xkx6Ap9TRg95benFbq/FexgfhPl
         lTxG14XCxMWLkirXx8fB8LHxF2L05BaqRQfzBIyrzB3gsCeulWEDc3uG1iyk0dLMHiou
         0W0BHmm9P5j5XEEkyEkpCniuEhyZ7YIIRc8x+J0dUxc4/IGmecnPF0/bdhJX3lnJOnG/
         M/U03V5wOqJwyrEE9/9yANZnmTk/5JRNOXxcYZdXYEesMHNAyw97/5/tgJlWQmQPIuNU
         xaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510431; x=1744115231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sCqoi2+dXPe214Qh2/irU3yim1lmhg8lbu3VkUkCRk=;
        b=MPos+zl67SDYFrHR3tJq17I4apIbOAJJEb38RjOCSRp5aEyZlDQ4vSdAPlSRww9Z7G
         ReLicR820xS25WXEhb9ebzfWjB0WTul8F22i2C/4No4Zm88dpjpGgGBfUeYBxNjeALqM
         IbfrpbAeKe7lBmhv4Jmz2wVnni6v8RS728LAwbQ1sESfLnl2Cvz8Se2NKlWn8eYlaHzi
         RoLCwS8FLxNfYeSGia6HzYQx8Ilx3u8Rdd+gaXb5pQdbV6OGPD5n6ku7XKwHy1XBWdCr
         EyYQaTg8PpdwQdroxQtGnHWWTL/1thSh79QQOKFX5ATysqAvnPF1DnSxmtAHtWN69nym
         Nr0A==
X-Forwarded-Encrypted: i=1; AJvYcCU8/6GXEen14xqDYuWP3Abo2FljTRDLBwS7V26d7f6TKbZICpLbSSo14kZrYkNcLs08oexo2S2jLWWu966ScOqh@lists.infradead.org
X-Gm-Message-State: AOJu0YwIb28UnnFxr+eVBsvMQgRPTfBvorDWUoXLQokYX1CAQRSmjbVB
	MOo9FrbAp4GlsNdGy8QN/uLvYqq+JEsGNdm3A+jDuGJypYfpB0zr+HZv0EaR4TFETXot2gnGRA/
	ZAcsNME4D2XjIlN7Y/A3GpHPZXzNJo0V2JrxMuw==
X-Gm-Gg: ASbGncv7pMZQdEKoY6KlxSEtbRrJeni2wtfKX04rjtHKYLhCiiXxDtRoaTshAJQibNs
	JjmbvpWO2CiPAASfyrjIeXy6h2n5+9hn1EfYsRPcObW6gvYbocsf9HBL9WJRjcKRs/vwDqYZVvI
	UIU/wCirrgWryQrAlb6+xZSlMX1W79fmfx9t2jGg==
X-Google-Smtp-Source: AGHT+IEgukiORr4SZjKbgRpiqVcotRwJmBe7YTtNBvIBuB03areMpUPGe3dEZLGjY/JgwKfG2LLes1zFXMHJJLCf0GQ=
X-Received: by 2002:a05:6871:3a11:b0:2c2:3a7f:e702 with SMTP id
 586e51a60fabf-2cbcf4ed1c0mr6236036fac.11.1743510430925; Tue, 01 Apr 2025
 05:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org> <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com> <Z-u8MWNVNy9lLbkK@sumit-X1>
In-Reply-To: <Z-u8MWNVNy9lLbkK@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 14:26:59 +0200
X-Gm-Features: AQ5f1JqpEmTnupXLsUS7i7QDnCB4PmN4PxsDBJJ9FxT6NqnXbZNKDY1Mpm4OmN8
Message-ID: <CAHUa44GGEypYfiVz5E1aBsZ0TOK0UoeDBVRYB8_dUYJLhrSyUg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory allocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: akpm@linux-foundation.org, david@redhat.com, rppt@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_052712_189721_79952468 
X-CRM114-Status: GOOD (  48.33  )
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

On Tue, Apr 1, 2025 at 12:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> + MM folks to seek guidance here.
>
> On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Tue, Mar 25, 2025 at 8:42=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > > > Add support in the OP-TEE backend driver dynamic restricted memory
> > > > allocation with FF-A.
> > > >
> > > > The restricted memory pools for dynamically allocated restrict memo=
ry
> > > > are instantiated when requested by user-space. This instantiation c=
an
> > > > fail if OP-TEE doesn't support the requested use-case of restricted
> > > > memory.
> > > >
> > > > Restricted memory pools based on a static carveout or dynamic alloc=
ation
> > > > can coexist for different use-cases. We use only dynamic allocation=
 with
> > > > FF-A.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/optee/Makefile        |   1 +
> > > >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > > >  drivers/tee/optee/optee_private.h |  13 +-
> > > >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++=
++++
> > > >  4 files changed, 483 insertions(+), 3 deletions(-)
> > > >  create mode 100644 drivers/tee/optee/rstmem.c
> > > >
>
> <snip>
>
> > > > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.=
c
> > > > new file mode 100644
> > > > index 000000000000..ea27769934d4
> > > > --- /dev/null
> > > > +++ b/drivers/tee/optee/rstmem.c
> > > > @@ -0,0 +1,329 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (c) 2025, Linaro Limited
> > > > + */
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > +
> > > > +#include <linux/errno.h>
> > > > +#include <linux/genalloc.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/tee_core.h>
> > > > +#include <linux/types.h>
> > > > +#include "optee_private.h"
> > > > +
> > > > +struct optee_rstmem_cma_pool {
> > > > +     struct tee_rstmem_pool pool;
> > > > +     struct gen_pool *gen_pool;
> > > > +     struct optee *optee;
> > > > +     size_t page_count;
> > > > +     u16 *end_points;
> > > > +     u_int end_point_count;
> > > > +     u_int align;
> > > > +     refcount_t refcount;
> > > > +     u32 use_case;
> > > > +     struct tee_shm *rstmem;
> > > > +     /* Protects when initializing and tearing down this struct */
> > > > +     struct mutex mutex;
> > > > +};
> > > > +
> > > > +static struct optee_rstmem_cma_pool *
> > > > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > > > +{
> > > > +     return container_of(pool, struct optee_rstmem_cma_pool, pool)=
;
> > > > +}
> > > > +
> > > > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     int rc;
> > > > +
> > > > +     rp->rstmem =3D tee_shm_alloc_cma_phys_mem(rp->optee->ctx, rp-=
>page_count,
> > > > +                                             rp->align);
> > > > +     if (IS_ERR(rp->rstmem)) {
> > > > +             rc =3D PTR_ERR(rp->rstmem);
> > > > +             goto err_null_rstmem;
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * TODO unmap the memory range since the physical memory will
> > > > +      * become inaccesible after the lend_rstmem() call.
> > > > +      */
> > >
> > > What's your plan for this TODO? I think we need a CMA allocator here
> > > which can allocate un-mapped memory such that any cache speculation
> > > won't lead to CPU hangs once the memory restriction comes into pictur=
e.
> >
> > What happens is platform-specific. For some platforms, it might be
> > enough to avoid explicit access. Yes, a CMA allocator with unmapped
> > memory or where memory can be unmapped is one option.
>
> Did you get a chance to enable real memory protection on RockPi board?

No, I don't think I have access to the needed documentation for the
board to set it up for relevant peripherals.

> This will atleast ensure that mapped restricted memory without explicit
> access works fine. Since otherwise once people start to enable real
> memory restriction in OP-TEE, there can be chances of random hang ups
> due to cache speculation.

A hypervisor in the normal world can also make the memory inaccessible
to the kernel. That shouldn't cause any hangups due to cache
speculation.

Cheers,
Jens

>
> MM folks,
>
> Basically what we are trying to achieve here is a "no-map" DT behaviour
> [1] which is rather dynamic in  nature. The use-case here is that a memor=
y
> block allocated from CMA can be marked restricted at runtime where we
> would like the Linux not being able to directly or indirectly (cache
> speculation) access it. Once memory restriction use-case has been
> completed, the memory block can be marked as normal and freed for
> further CMA allocation.
>
> It will be apprciated if you can guide us regarding the appropriate APIs
> to use for un-mapping/mamping CMA allocations for this use-case.
>
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema=
s/reserved-memory/reserved-memory.yaml#L79
>
> -Sumit
>
> >
> > >
> > > > +     rc =3D rp->optee->ops->lend_rstmem(rp->optee, rp->rstmem, rp-=
>end_points,
> > > > +                                      rp->end_point_count, rp->use=
_case);
> > > > +     if (rc)
> > > > +             goto err_put_shm;
> > > > +     rp->rstmem->flags |=3D TEE_SHM_DYNAMIC;
> > > > +
> > > > +     rp->gen_pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > > > +     if (!rp->gen_pool) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_reclaim;
> > > > +     }
> > > > +
> > > > +     rc =3D gen_pool_add(rp->gen_pool, rp->rstmem->paddr,
> > > > +                       rp->rstmem->size, -1);
> > > > +     if (rc)
> > > > +             goto err_free_pool;
> > > > +
> > > > +     refcount_set(&rp->refcount, 1);
> > > > +     return 0;
> > > > +
> > > > +err_free_pool:
> > > > +     gen_pool_destroy(rp->gen_pool);
> > > > +     rp->gen_pool =3D NULL;
> > > > +err_reclaim:
> > > > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > > > +err_put_shm:
> > > > +     tee_shm_put(rp->rstmem);
> > > > +err_null_rstmem:
> > > > +     rp->rstmem =3D NULL;
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +static int get_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     int rc =3D 0;
> > > > +
> > > > +     if (!refcount_inc_not_zero(&rp->refcount)) {
> > > > +             mutex_lock(&rp->mutex);
> > > > +             if (rp->gen_pool) {
> > > > +                     /*
> > > > +                      * Another thread has already initialized the=
 pool
> > > > +                      * before us, or the pool was just about to b=
e torn
> > > > +                      * down. Either way we only need to increase =
the
> > > > +                      * refcount and we're done.
> > > > +                      */
> > > > +                     refcount_inc(&rp->refcount);
> > > > +             } else {
> > > > +                     rc =3D init_cma_rstmem(rp);
> > > > +             }
> > > > +             mutex_unlock(&rp->mutex);
> > > > +     }
> > > > +
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +static void release_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     gen_pool_destroy(rp->gen_pool);
> > > > +     rp->gen_pool =3D NULL;
> > > > +
> > > > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > > > +     rp->rstmem->flags &=3D ~TEE_SHM_DYNAMIC;
> > > > +
> > > > +     WARN(refcount_read(&rp->rstmem->refcount) !=3D 1, "Unexpected=
 refcount");
> > > > +     tee_shm_put(rp->rstmem);
> > > > +     rp->rstmem =3D NULL;
> > > > +}
> > > > +
> > > > +static void put_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     if (refcount_dec_and_test(&rp->refcount)) {
> > > > +             mutex_lock(&rp->mutex);
> > > > +             if (rp->gen_pool)
> > > > +                     release_cma_rstmem(rp);
> > > > +             mutex_unlock(&rp->mutex);
> > > > +     }
> > > > +}
> > > > +
> > > > +static int rstmem_pool_op_cma_alloc(struct tee_rstmem_pool *pool,
> > > > +                                 struct sg_table *sgt, size_t size=
,
> > > > +                                 size_t *offs)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +     size_t sz =3D ALIGN(size, PAGE_SIZE);
> > > > +     phys_addr_t pa;
> > > > +     int rc;
> > > > +
> > > > +     rc =3D get_cma_rstmem(rp);
> > > > +     if (rc)
> > > > +             return rc;
> > > > +
> > > > +     pa =3D gen_pool_alloc(rp->gen_pool, sz);
> > > > +     if (!pa) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_put;
> > > > +     }
> > > > +
> > > > +     rc =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > > > +     if (rc)
> > > > +             goto err_free;
> > > > +
> > > > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
> > > > +     *offs =3D pa - rp->rstmem->paddr;
> > > > +
> > > > +     return 0;
> > > > +err_free:
> > > > +     gen_pool_free(rp->gen_pool, pa, size);
> > > > +err_put:
> > > > +     put_cma_rstmem(rp);
> > > > +
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +static void rstmem_pool_op_cma_free(struct tee_rstmem_pool *pool,
> > > > +                                 struct sg_table *sgt)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +     struct scatterlist *sg;
> > > > +     int i;
> > > > +
> > > > +     for_each_sgtable_sg(sgt, sg, i)
> > > > +             gen_pool_free(rp->gen_pool, sg_phys(sg), sg->length);
> > > > +     sg_free_table(sgt);
> > > > +     put_cma_rstmem(rp);
> > > > +}
> > > > +
> > > > +static int rstmem_pool_op_cma_update_shm(struct tee_rstmem_pool *p=
ool,
> > > > +                                      struct sg_table *sgt, size_t=
 offs,
> > > > +                                      struct tee_shm *shm,
> > > > +                                      struct tee_shm **parent_shm)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +
> > > > +     *parent_shm =3D rp->rstmem;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void pool_op_cma_destroy_pool(struct tee_rstmem_pool *pool)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +
> > > > +     mutex_destroy(&rp->mutex);
> > > > +     kfree(rp);
> > > > +}
> > > > +
> > > > +static struct tee_rstmem_pool_ops rstmem_pool_ops_cma =3D {
> > > > +     .alloc =3D rstmem_pool_op_cma_alloc,
> > > > +     .free =3D rstmem_pool_op_cma_free,
> > > > +     .update_shm =3D rstmem_pool_op_cma_update_shm,
> > > > +     .destroy_pool =3D pool_op_cma_destroy_pool,
> > > > +};
> > > > +
> > > > +static int get_rstmem_config(struct optee *optee, u32 use_case,
> > > > +                          size_t *min_size, u_int *min_align,
> > > > +                          u16 *end_points, u_int *ep_count)
> > >
> > > I guess this end points terminology is specific to FF-A ABI. Is there
> > > any relevance for this in the common APIs?
> >
> > Yes, endpoints are specific to FF-A ABI. The list of end-points must
> > be presented to FFA_MEM_LEND. We're relying on the secure world to
> > know which endpoints are needed for a specific use case.
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > +{
> > > > +     struct tee_param params[2] =3D {
> > > > +             [0] =3D {
> > > > +                     .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INO=
UT,
> > > > +                     .u.value.a =3D use_case,
> > > > +             },
> > > > +             [1] =3D {
> > > > +                     .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OU=
TPUT,
> > > > +             },
> > > > +     };
> > > > +     struct optee_shm_arg_entry *entry;
> > > > +     struct tee_shm *shm_param =3D NULL;
> > > > +     struct optee_msg_arg *msg_arg;
> > > > +     struct tee_shm *shm;
> > > > +     u_int offs;
> > > > +     int rc;
> > > > +
> > > > +     if (end_points && *ep_count) {
> > > > +             params[1].u.memref.size =3D *ep_count * sizeof(*end_p=
oints);
> > > > +             shm_param =3D tee_shm_alloc_priv_buf(optee->ctx,
> > > > +                                                params[1].u.memref=
.size);
> > > > +             if (IS_ERR(shm_param))
> > > > +                     return PTR_ERR(shm_param);
> > > > +             params[1].u.memref.shm =3D shm_param;
> > > > +     }
> > > > +
> > > > +     msg_arg =3D optee_get_msg_arg(optee->ctx, ARRAY_SIZE(params),=
 &entry,
> > > > +                                 &shm, &offs);
> > > > +     if (IS_ERR(msg_arg)) {
> > > > +             rc =3D PTR_ERR(msg_arg);
> > > > +             goto out_free_shm;
> > > > +     }
> > > > +     msg_arg->cmd =3D OPTEE_MSG_CMD_GET_RSTMEM_CONFIG;
> > > > +
> > > > +     rc =3D optee->ops->to_msg_param(optee, msg_arg->params,
> > > > +                                   ARRAY_SIZE(params), params,
> > > > +                                   false /*!update_out*/);
> > > > +     if (rc)
> > > > +             goto out_free_msg;
> > > > +
> > > > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, fa=
lse);
> > > > +     if (rc)
> > > > +             goto out_free_msg;
> > > > +     if (msg_arg->ret && msg_arg->ret !=3D TEEC_ERROR_SHORT_BUFFER=
) {
> > > > +             rc =3D -EINVAL;
> > > > +             goto out_free_msg;
> > > > +     }
> > > > +
> > > > +     rc =3D optee->ops->from_msg_param(optee, params, ARRAY_SIZE(p=
arams),
> > > > +                                     msg_arg->params, true /*updat=
e_out*/);
> > > > +     if (rc)
> > > > +             goto out_free_msg;
> > > > +
> > > > +     if (!msg_arg->ret && end_points &&
> > > > +         *ep_count < params[1].u.memref.size / sizeof(u16)) {
> > > > +             rc =3D -EINVAL;
> > > > +             goto out_free_msg;
> > > > +     }
> > > > +
> > > > +     *min_size =3D params[0].u.value.a;
> > > > +     *min_align =3D params[0].u.value.b;
> > > > +     *ep_count =3D params[1].u.memref.size / sizeof(u16);
> > > > +
> > > > +     if (msg_arg->ret =3D=3D TEEC_ERROR_SHORT_BUFFER) {
> > > > +             rc =3D -ENOSPC;
> > > > +             goto out_free_msg;
> > > > +     }
> > > > +
> > > > +     if (end_points)
> > > > +             memcpy(end_points, tee_shm_get_va(shm_param, 0),
> > > > +                    params[1].u.memref.size);
> > > > +
> > > > +out_free_msg:
> > > > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > > > +out_free_shm:
> > > > +     if (shm_param)
> > > > +             tee_shm_free(shm_param);
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +struct tee_rstmem_pool *optee_rstmem_alloc_cma_pool(struct optee *=
optee,
> > > > +                                                 enum tee_dma_heap=
_id id)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp;
> > > > +     u32 use_case =3D id;
> > > > +     size_t min_size;
> > > > +     int rc;
> > > > +
> > > > +     rp =3D kzalloc(sizeof(*rp), GFP_KERNEL);
> > > > +     if (!rp)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +     rp->use_case =3D use_case;
> > > > +
> > > > +     rc =3D get_rstmem_config(optee, use_case, &min_size, &rp->ali=
gn, NULL,
> > > > +                            &rp->end_point_count);
> > > > +     if (rc) {
> > > > +             if (rc !=3D -ENOSPC)
> > > > +                     goto err;
> > > > +             rp->end_points =3D kcalloc(rp->end_point_count,
> > > > +                                      sizeof(*rp->end_points), GFP=
_KERNEL);
> > > > +             if (!rp->end_points) {
> > > > +                     rc =3D -ENOMEM;
> > > > +                     goto err;
> > > > +             }
> > > > +             rc =3D get_rstmem_config(optee, use_case, &min_size, =
&rp->align,
> > > > +                                    rp->end_points, &rp->end_point=
_count);
> > > > +             if (rc)
> > > > +                     goto err_kfree_eps;
> > > > +     }
> > > > +
> > > > +     rp->pool.ops =3D &rstmem_pool_ops_cma;
> > > > +     rp->optee =3D optee;
> > > > +     rp->page_count =3D min_size / PAGE_SIZE;
> > > > +     mutex_init(&rp->mutex);
> > > > +
> > > > +     return &rp->pool;
> > > > +
> > > > +err_kfree_eps:
> > > > +     kfree(rp->end_points);
> > > > +err:
> > > > +     kfree(rp);
> > > > +     return ERR_PTR(rc);
> > > > +}
> > > > --
> > > > 2.43.0
> > > >

