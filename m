Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFBBC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dr0G0HPuVKXln/Mnb/5UY0SQE5MginO3Nb336jQ6YM=; b=iBi50bkbPkQnJpD2aV5vkGZ764
	8Qd+KoIa+ikkyFENV+FRg0+CA8JSlq8CarbKNGFDqm6SmISS+hxicxsz84kThn35mcFJS5jxqx3ZE
	t+cDFnx0aUIdQgUyTcyMUhv2crW5rCnrlfV/RF2+5CHRdfN4ZinxapplA4EquFYCBVYH00cU+5nUf
	GiCdsqEnwlUw1UijdsNYmczHL9+0i8up8ms5Hh8AKgg9psk7bRcezGnIDiYvHQBLmR5IholIVmvwK
	urofktJtchAz0k7Y9rJ84E3mk7SAzfqkw6F9p01uehajGHTxMBE44YO1QPXZJO7KVTh0f3xFqWNS9
	UfJU38jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEAy-0000000AU4t-3EDV;
	Thu, 03 Jul 2025 07:16:08 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXE8c-0000000ATs2-0CyK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 07:13:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-612033bb26cso656486eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 00:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751526820; x=1752131620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dr0G0HPuVKXln/Mnb/5UY0SQE5MginO3Nb336jQ6YM=;
        b=fb/n03gtgUW1yXkOyW4NPksF4xeL3bKcJiYiVHU4ytawd+k+6guwIEZDQRd/CSJ660
         k64swEs3sX8lZbJY1yNKLPsZrWdcqM8XnxaFhlrkVAZ5a10DXaIUVtdD/UXkRbE5UfPX
         ox8sbEh0jjNzo/WtaJMlFkZ9bnNuUBvqHK//VXfiWpk97zcD+TjhdEyHNnSoFDAr+1dB
         Jydb+DenQN+WSHAN/fKHBq5OL6F/3SXNqKl+yAQ4yQV9t8jbzIPg0RJ6KUZI/S2R6Uwg
         n/EFagrinclSyyQvr50vCz+23pE9QuBlLTlL5JmEwYcsbbOZ7KvGMuYzVGyWb953V8dq
         smJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751526820; x=1752131620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dr0G0HPuVKXln/Mnb/5UY0SQE5MginO3Nb336jQ6YM=;
        b=ntSvpOKnXudASNfmwG0vnPx5/GgpRHjq9Y9wMIrgYZPk0V0GfNn7xLXz836PoJqkOQ
         +8/4f4zFhZjv698oj1J3nxmdg/8aBcr6EKtdDan0zCKdPF0vFJeC6EPVTdqJWHKy8ojL
         CbrWLIH0CmzVTqFtpzpMowsxTDgj9+lxj/fKTQ6ORdAwoxB/xLtejJpmpgEMzprLw+EH
         QJ95IIBNuPjPPtHbC4UYq9pfX84mZeyrU1GJuNFXNcaItAVtFA4fCksFZqRAYyDAObqM
         GFt5jYHDNnswsc2lU9nuHL49uAoCKO3svv/fggdZDS9j9zNeSp3mmZcymUOn4s1kbhQq
         KzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo0y9nTVsLf8GirNynizKX9MVnNRytSTO9JW8BeZpnrKV07DlUomJHm/QNraiC3JUIuXJdHDMcfti4BACryBpW@lists.infradead.org
X-Gm-Message-State: AOJu0YyOqyh5THYI08Xu3GIkP8Cu6FCr+wlXdrAqdz1HVnrBMbubCjV6
	n1g69EWqp9iwjancgNQ1iF+CnOamqF8dKuWXCURZ9dObuk06F0KmXC9p6ebNLshaJxOQC9gUofU
	45zPfh7ypypNBOaq6bktCT9IajbmuktJAAQ5K3M95cg==
X-Gm-Gg: ASbGncuIld/9M3OnL+IetzHr866ye0x+6BMsNYFiMnSJACq3wH6nn4w1TaA7KpCo2j+
	Zf5Jv1+lSPKTNC0wIaCrR4CBZU+0EkErF+78npZM9DbViDIIyz1FbEAsIlGObESCJQdYGgikb/o
	VNOZu7bBgUJBKG3PA4iGLjT/xisVR9/gBph4oPfZ0LvD12
X-Google-Smtp-Source: AGHT+IGzumX+zMN3Zsc0frMnoZjTbrKq52LE81xJcdL6f0gu7EmyIA9p7bwSTX/LNs7SEM2NnBBBJP0kpnIk//vZz6Q=
X-Received: by 2002:a05:6820:198d:b0:611:e30a:fa1c with SMTP id
 006d021491bc7-61200f7034bmr3538676eaf.1.1751526820429; Thu, 03 Jul 2025
 00:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org> <aFFSWDiVsxA1CbCX@sumit-X1>
 <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com> <aGYi8QkgI3WyeN59@sumit-X1>
In-Reply-To: <aGYi8QkgI3WyeN59@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 3 Jul 2025 09:13:28 +0200
X-Gm-Features: Ac12FXzyoTs9Jn3XWoE-_WRgcRKkI1fV8anRZvH7Atzw9NHwCMp1fhg-J6G_50I
Message-ID: <CAHUa44EMtaSw9uMz5WNSMXSfYXwQ-1TwFjd=R1ZfCo02ir2cjw@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_001342_096674_CB01DA99 
X-CRM114-Status: GOOD (  34.49  )
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

On Thu, Jul 3, 2025 at 8:28=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Wed, Jun 18, 2025 at 09:03:00AM +0200, Jens Wiklander wrote:
> > On Tue, Jun 17, 2025 at 1:32=E2=80=AFPM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM =
to
> > > > identify it as DMA memory. The allocated memory will later be lent =
to
> > > > the TEE to be used as protected memory.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_shm.c    | 85 ++++++++++++++++++++++++++++++++++++=
+++-
> > > >  include/linux/tee_core.h |  5 +++
> > > >  2 files changed, 88 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index e63095e84644..60b0f3932cee 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -5,6 +5,8 @@
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-buf.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/highmem.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -13,9 +15,14 @@
> > > >  #include <linux/tee_core.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/uio.h>
> > > > -#include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +struct tee_shm_dma_mem {
> > > > +     struct tee_shm shm;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t page_=
count)
> > > >  {
> > > >       size_t n;
> > > > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >  {
> > > >       void *p =3D shm;
> > > >
> > > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > >
> > > nit: this config check can be merged into the above if check.
> >
> > No, because dma_free_pages() is only defined if
> > CONFIG_TEE_DMABUF_HEAPS is enabled.
>
> It looks like you misunderstood my above comment, I rather meant:
>
>         if (IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS) &&
>             (shm->flags & TEE_SHM_DMA_MEM))

That depends on the compiler optimizing away the call to
dma_free_pages() if CONFIG_TEE_DMABUF_HEAPS isn't defined. This is
normally the case, but if you compile for debugging, you may get
unresolved symbols.

Cheers,
Jens

>
> -Sumit
>
> >
> > >
> > > > +             struct tee_shm_dma_mem *dma_mem;
> > > > +
> > > > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem,=
 shm);
> > > > +             p =3D dma_mem;
> > > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page=
,
> > > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > > > +#endif
> > > > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> > >
> > > Do we need a similar config check for this flag too?
> >
> > No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are=
 defined.
> >
> > Cheers,
> > Jens
> >
> >
> > >
> > > With these addressed, feel free to add:
> > >
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > -Sumit
> > >
> > > >               struct tee_shm_dmabuf_ref *ref;
> > > >
> > > >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, =
shm);
> > > > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct =
tee_context *ctx, size_t size)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > > >
> > > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > > > +/**
> > > > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory =
object
> > > > + * @ctx:     Context that allocates the shared memory
> > > > + * @page_count:      Number of pages
> > > > + *
> > > > + * The allocated memory is expected to be lent (made inaccessible =
to the
> > > > + * kernel) to the TEE while it's used and returned (accessible to =
the
> > > > + * kernel again) before it's freed.
> > > > + *
> > > > + * This function should normally only be used internally in the TE=
E
> > > > + * drivers.
> > > > + *
> > > > + * @returns a pointer to 'struct tee_shm'
> > > > + */
> > > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > > +                                   size_t page_count)
> > > > +{
> > > > +     struct tee_device *teedev =3D ctx->teedev;
> > > > +     struct tee_shm_dma_mem *dma_mem;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +
> > > > +     if (!tee_device_get(teedev))
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     page =3D dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE=
,
> > > > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERN=
EL);
> > > > +     if (!page)
> > > > +             goto err_put_teedev;
> > > > +
> > > > +     dma_mem =3D kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > > > +     if (!dma_mem)
> > > > +             goto err_free_pages;
> > > > +
> > > > +     refcount_set(&dma_mem->shm.refcount, 1);
> > > > +     dma_mem->shm.ctx =3D ctx;
> > > > +     dma_mem->shm.paddr =3D page_to_phys(page);
> > > > +     dma_mem->dma_addr =3D dma_addr;
> > > > +     dma_mem->page =3D page;
> > > > +     dma_mem->shm.size =3D page_count * PAGE_SIZE;
> > > > +     dma_mem->shm.flags =3D TEE_SHM_DMA_MEM;
> > > > +
> > > > +     teedev_ctx_get(ctx);
> > > > +
> > > > +     return &dma_mem->shm;
> > > > +
> > > > +err_free_pages:
> > > > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dm=
a_addr,
> > > > +                    DMA_BIDIRECTIONAL);
> > > > +err_put_teedev:
> > > > +     tee_device_put(teedev);
> > > > +
> > > > +     return ERR_PTR(-ENOMEM);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > > +#else
> > > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > > +                                   size_t page_count)
> > > > +{
> > > > +     return ERR_PTR(-EINVAL);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > > +#endif
> > > > +
> > > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, siz=
e_t align,
> > > >                            int (*shm_register)(struct tee_context *=
ctx,
> > > >                                                struct tee_shm *shm,
> > > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > > index f17710196c4c..e46a53e753af 100644
> > > > --- a/include/linux/tee_core.h
> > > > +++ b/include/linux/tee_core.h
> > > > @@ -29,6 +29,8 @@
> > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool=
 */
> > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driv=
er */
> > > >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-bu=
f handle */
> > > > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated w=
ith */
> > > > +                                     /* dma_alloc_pages() */
> > > >
> > > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev=
);
> > > >   */
> > > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, si=
ze_t size);
> > > >
> > > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > > +                                   size_t page_count);
> > > > +
> > > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, siz=
e_t align,
> > > >                            int (*shm_register)(struct tee_context *=
ctx,
> > > >                                                struct tee_shm *shm,
> > > > --
> > > > 2.43.0
> > > >

