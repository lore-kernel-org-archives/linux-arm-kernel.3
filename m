Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A413FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=; b=nS+P5GgGjH1CiCSVfXI50U5sr+
	tEEKWw+/0yjuIEfJaA79fJhHbFwPcwElcXXaQbwuT++211FH9CXWog+QUu73/+rWZeYvzb//Uw9sZ
	DlkARdb/UslLA2Wb2vW0ZX/HK21K7SkjHxEoQR8pSjwhM7ajb7/Dt5CywnsFGeNLQJJhZqJgV+j+F
	FDuxzod2zadTuVFQAz0EOx1CmsA5lE6I4IvRuJIJIFvRYdlMRdK6Q6jJhoEOvOVJfdcGIQ6cI+Y6Y
	khXt+DRNuvq2nlOS2ZtZ9geRLBkvHxpzPtZimiK9Dy+IZbN5KElWA+XKYvT+6IywnwWoTzy9zu0BJ
	sWcjp3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCAL-0000000Amut-16sT;
	Tue, 06 May 2025 06:52:33 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCC8O-0000000AmXD-2ilB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 06:50:33 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2da3c572a0bso3003670fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746514231; x=1747119031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=;
        b=KWZJXcYt+R3zMCbjjfLEcx/OZWtY+wfGNV3xMZgTZWQDEjxho1GlBQebl/RNbr0NoB
         8JGoX7NpTNnZ/3++eBYSFCTx7VwMUe+aX0LKgJuqx4nrQ9sHhtCPiM3336izehAmd4St
         29rhTtV16f/BLyYmolFEzoOWCQzR8fRDWkSDuAYLiJYqCzVX6y9R5SKXjRkcJ1308HY9
         lFLxJgUIa80cWKyy+Ehq1xR9QhXPp3sgptXozgKV2j4IYsVuc5QHPHV9RBqi8Sk5QorK
         i+7wfN8rJs4dSch6UYXCQ6R1w2ISqtLeP4lCHfyZrj17BfbP1mYJFy/F+sBOzF0Pz5xi
         DuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746514231; x=1747119031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=;
        b=vDSKCbOHJM2ZaxyPAwfaYEqcS/OtIfxUvQAuTK/xrsqAfwRlMlJi3xZUCMkLBXctCr
         4oBqTMbrKdlrMLXmL8qzK2VPFp9/uSVvgRKZbl2GlPubu6VyUxZbxYUqYD28B1+gfYtU
         FVhCJ7K78MO8ZaXDV8uvCm+kgwgE4fx9eQ3pozRzxG15nKC5OyihiPTZDbobLI6Rn+7r
         pIxLF2wu+vli+//5sVhETBPQ0BMKgxUbzDfwPrSDJJ03H/lzfLZnXewubJF5N3A/nEL+
         OsAE/U7cEyyz/n2JdCx7EFCoOhrIaeV4VJqAIIWe69SbfWed9x1HGUyE4l1vYu8RN19L
         QnlA==
X-Forwarded-Encrypted: i=1; AJvYcCWE0iAy2Fo4oH/cZCi+4aO1t7G0ifJhvs+FvKBF9SIFQTiBJd81FV/sQrJT/0YK03mWnxXtMkzYIP56p0qSjOo9@lists.infradead.org
X-Gm-Message-State: AOJu0YwqAiru3YBdz+XTslaVL5fiEMg5nV5Gu0X+wJHHfvUTV3qafT0s
	kzityOuJhJc0m36GZeKaWhqzEltA/SKFQyGUBpaPbuYtavVtBPH9G2j8H/a74y0cx5ETGBPML4O
	ja3xc/Rik8WGR1Kz2LOfv/NDpDNmZw96fgP6Pug==
X-Gm-Gg: ASbGncuWLwnUCaZy3q0F02nVcbO96GCTjCeBcJ/rjrtWmz/mW5L5NWYBfxsD8z/LQcl
	d8D5uVr/IoV8No20A3B9d9L3rvv5VEzt9jY34ek+x1K/+5+BrPLxENdmIB8lNfJFaN25peW43yp
	DgRytHzkMXQUAHje+g7b4ymwM=
X-Google-Smtp-Source: AGHT+IHNm5GVjhXN3B45lmCfKthx/G+NZUk5+CRKyT+Ba0DNEGI76r0X6+RqWLQrptXlWXRbeCBTBu5IP8WF2QNe6QA=
X-Received: by 2002:a05:6870:a1a3:b0:2d4:e8fd:7ffb with SMTP id
 586e51a60fabf-2db3ccf9c7emr900510fac.1.1746514231320; Mon, 05 May 2025
 23:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-7-jens.wiklander@linaro.org> <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
In-Reply-To: <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 6 May 2025 08:50:20 +0200
X-Gm-Features: ATxdqUHZrVfop0JU0rG-vcdbXQsIPujzLICkuywbLk5p8m1md7a0mES_eJcPprM
Message-ID: <CAHUa44EQV5O+KZbE19-d-Z6Wu=HAQuGQmZe+mXZRpmdvRDbmSA@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] tee: implement protected DMA-heap
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
X-CRM114-CacheID: sfid-20250505_235032_847637_BC93E897 
X-CRM114-Status: GOOD (  28.64  )
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

On Fri, May 2, 2025 at 3:59=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Implement DMA heap for protected DMA-buf allocation in the TEE
> > subsystem.
> >
> > Restricted memory refers to memory buffers behind a hardware enforced
> > firewall. It is not accessible to the kernel during normal circumstance=
s
> > but rather only accessible to certain hardware IPs or CPUs executing in
> > higher or differently privileged mode than the kernel itself. This
> > interface allows to allocate and manage such protected memory buffers
> > via interaction with a TEE implementation.
> >
> > The protected memory is allocated for a specific use-case, like Secure
> > Video Playback, Trusted UI, or Secure Video Recording where certain
> > hardware devices can access the memory.
> >
> > The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
> > backend drivers needs to implement protected memory pool to manage the
> > protected memory.
>
> [...]> +static struct sg_table *
> > +tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                  enum dma_data_direction direction)
> > +{
> > +     struct tee_heap_attachment *a =3D attachment->priv;
> > +     int ret;
> > +
> > +     ret =3D dma_map_sgtable(attachment->dev, &a->table, direction,
> > +                           DMA_ATTR_SKIP_CPU_SYNC);
>
> If the memory is inaccessible to the kernel, what does this DMA mapping
> even mean? What happens when it tries to perform cache maintenance or
> bounce-buffering on inaccessible memory (which presumably doesn't even
> have a VA if it's not usable as normal kernel memory)?

Doesn't DMA_ATTR_SKIP_CPU_SYNC say that the kernel shouldn't perform
cache maintenance on the buffer since it's already in the device
domain? The device is expected to be permitted to access the memory.

>
> If we're simply housekeeping the TEE's resources on its behalf, and
> giving it back some token to tell it which resource to go do its thing
> with, then that's really not "DMA" as far as the kernel is concerned.

These buffers are supposed to be passed to devices that might be under
only partial control of the kernel.

>
> [...]
> > +static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
> > +                                     struct sg_table *sgt, size_t size=
,
> > +                                     size_t *offs)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +     phys_addr_t pa;
> > +     int ret;
> > +
> > +     pa =3D gen_pool_alloc(stp->gen_pool, size);
> > +     if (!pa)
> > +             return -ENOMEM;
> > +
> > +     ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > +     if (ret) {
> > +             gen_pool_free(stp->gen_pool, pa, size);
> > +             return ret;
> > +     }
> > +
> > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
>
> Where does "pa" come from here (i.e. what's the provenance of the
> initial "paddr" passed to tee_protmem_static_pool_alloc())? In general
> we can't call {phys,pfn}_to_page() an arbitrary addresses without
> checking pfn_valid() first. A bogus address might even crash
> __pfn_to_page() itself under CONFIG_SPARSEMEM.

That's a good point. Would it be enough to check the address with
pfn_valid() in tee_protmem_static_pool_alloc()?

I expect that the memory is normally carved out of DDR and made secure
or protected in a platform-specific way, either at boot with a static
carveout or dynamically after boot.

Thanks,
Jens


>
> Thanks,
> Robin.
>
> > +     *offs =3D pa - stp->pa_base;
> > +
> > +     return 0;
> > +}

