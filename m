Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA812C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=; b=uJUI3BVm+yB+VCsj/zBHCUPqyn
	PQu+FKnd1P944aNlq/E0OO7KW+aT8n1CrEjq59Pk5+K66dAFTGaeIzZb9jaPXJEMLfApqxB2F75xh
	gDLqV9m/rKR7Z0lMJ1r2UXUdUWNfE2yIyJ62IqzaZolJhGpGoI10/DrJ7+rjdRDHr/uI3ZerE0iYE
	3Veb4Cb716r/6f47m1Tz0V/Jds1anLcNZCGqaZko/MgHv9VOgmMclz223TIh/tna+NIdY2h9SD4CQ
	PqbqR3uNdAIS6zjUt3OheNAbrts0L/aIz7UOoDBWhFIjfioL8Qo0s0MHZZNxK/sP0ZDxUG6JfyIQG
	xvNWCFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvDe-0000000AvMk-0odp;
	Tue, 27 May 2025 14:23:54 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvBU-0000000Av37-1arh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:21:41 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-72c13802133so872354a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748355699; x=1748960499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
        b=v+VawOpxbiATioJmREyKfpfbt7KjSulkwyo6Jiu6qawXgOL+1gaweILha+ci1YFU2K
         ru3g2Dyj51gCDEFNE0Rl32mE9pPXkm7B1rfbtrcSdZH6kPdgwWTEHWpTKePSCcApnMw6
         sFCApd7EQgq47ejkzzk/W/NvgCaGnzCPL/sh5IiTh9kfCIOAyWe0DSlzxaUDDrG6i6Bb
         pWMyre4aA4zHZRBuHXHV0lgzAW32bjqDbCqOgp3fGahJo7a6hfsV8KhE5mQ2qVbbHzNp
         qD5yoG3KjpPQ1fKtGd39xVvPAqSk9UQ/++GOIozq1861HzGDrhcTY4mXUnWxefiI9Bsl
         7yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355699; x=1748960499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
        b=psJFid4jOBWCumgCtDcRpQ1FWliWyiYlbC+kWkN5JLLFOOw3QiG/7rcHnEHPzZ6R+r
         kQ8QxbSbQ+FqFikBXd9iUK2yTxQHd7c88URWJ5L0EQ4ZqaRBhD/dok5uV3/SW63g32jz
         c0cdnIQxt4KoAI1Pjdg30vCM7qnLYe1bdt2XU9fozURXj0ERwkObgCheqjOgdz/mFBo4
         /ZvdhcNF+vpVst2R8nk61GmeBVqW83TaUhGgkdYkN1dPcjZ7Yyk7ml1je/4YgAuWbchB
         nlyyV+alWM+bzhwPGraN6LXtvYJhtNuM1wu6Tca7vizwHmqWzIkaBXMRcxYSPCjRF2y9
         R/wg==
X-Forwarded-Encrypted: i=1; AJvYcCVno4WgDulHQKxWhTNlPxGbeoVDxC86/MRNfoE7cQBAB/IQkmkfvXzDKwehX6akHN/lCRJS5LZkwxFAEcaUeTln@lists.infradead.org
X-Gm-Message-State: AOJu0YzJpw5WTXIDYZTq5G/zlIoFYk1+d67JkNCrp0Hf4TBaO5MSSeUT
	0UEezuX3G5xhd/1AdaK4Fbo+oPSnt1YRK6L3JE+h39vFR0SwsLREtPGbkUEnpR4Uncn+udXkoas
	olor4gSAg1RDtOhiE4JDbn7jJVy8SqZQc0T1Zo+ArBw==
X-Gm-Gg: ASbGnct0ikxMn0RTrE6ra/v6QVXaxYLo5QfxjXhbAoHfBZzpmK20He+bi/IXAdGnxVl
	+A39Ql8CZtlh7b+J0XZQlA0P7YnlIe+U6sRKV6rGaUnTMI5CFkH1Wb3nKSpAtLTXp7TS5efI7gp
	iXDm3Krvi7nu8OoVIv8JwQvz4YsJbpOJnPrg==
X-Google-Smtp-Source: AGHT+IHSldvXeMA/elq5GvdUeZXIE9U2qVSq25l+1UuvJ7nlZ4QemLu8hmu4wkxm84jlPfHrWshtHT5sVpyeKj3x5HU=
X-Received: by 2002:a05:6808:1b85:b0:402:ebf9:b770 with SMTP id
 5614622812f47-40646855c6dmr6484125b6e.28.1748355698671; Tue, 27 May 2025
 07:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org> <aDQWt5Ck1Bo01Z_4@sumit-X1>
 <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com> <aDQ1YR5jbcOFctty@sumit-X1>
In-Reply-To: <aDQ1YR5jbcOFctty@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:21:27 +0200
X-Gm-Features: AX0GCFufndHj8dMt0PaaB1DfiHys-ZIzTuXpul-y9wKknnwSsO_zDsCVnQgE3aw
Message-ID: <CAHUa44HUzfWXEdLeAVimDM0DTFaTbCa4SSTcy8YPhDjWHR352Q@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_072140_423874_A6ED795A 
X-CRM114-Status: GOOD (  30.62  )
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

On Mon, May 26, 2025 at 11:33=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Mon, May 26, 2025 at 11:21:47AM +0200, Jens Wiklander wrote:
> > On Mon, May 26, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM =
to
> > > > identify it as DMA memory. The allocated memory will later be lent =
to
> > > > the TEE to be used as protected memory.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++=
++--
> > > >  include/linux/tee_core.h |  5 +++
> > > >  2 files changed, 77 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index e1ed52ee0a16..92a6a35e1a1e 100644
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
> > > > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >       struct tee_shm *parent_shm =3D NULL;
> > > >       void *p =3D shm;
> > > >
> > > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > > +             struct tee_shm_dma_mem *dma_mem;
> > > > +
> > > > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem,=
 shm);
> > > > +             p =3D dma_mem;
> > > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page=
,
> > > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > >
> > > Although the kernel bot already found a randconfig issue, it looks li=
ke
> > > we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
> > >
> > > Also, I was thinking if we should rather add a new TEE subsystem
> > > specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used=
 to
> > > select whatever dependency is needed as well as act as a gating Kconf=
ig
> > > for relevant features.
> >
> > You mean something like this?
> >
> > --- a/drivers/tee/Kconfig
> > +++ b/drivers/tee/Kconfig
> > @@ -13,6 +13,14 @@ menuconfig TEE
> >
> >  if TEE
> >
> > +config TEE_DMABUF_HEAPS
> > +       bool
> > +       depends on HAS_DMA && DMABUF_HEAPS
>
> Yeah this looks fine to me but needs to be tested if DMA_CMA is a
> dependency here too.

Why? It can work without CMA for small allocations.

>
> > +
> > +config TEE_STATIC_PROTMEM_POOL
> > +       bool
> > +       depends on HAS_IOMEM && TEE_DMABUF_HEAPS
>
> The static and dynamic protected memory pools should get auto enabled if
> TEE_DMABUF_HEAPS is enabled since they are pre-requisite to provide the
> protected heaps support. Something like:
>
> +config TEE_STATIC_PROTMEM_POOL
> +       bool
> +       default y if TEE_DMABUF_HEAPS
> +       depends on HAS_IOMEM

Right, I'll update as needed.

Cheers,
Jens

