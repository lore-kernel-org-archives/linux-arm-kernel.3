Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2DEE748FC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 01:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY7oetAkXk6EDYNEyscTKD195vWG9mtNfQ3sP9pZIoo=; b=xllXW71CH9FVkT
	PXgLup+G9+iurew1JdJoNVukkhP+8iam+SVZWdfAcpxWs+Bubk8PGY2D4WIhbb4hAY1tvTOnYg4AA
	eCfR3rpDGqWrrrpUgEhDXJfQFJckIH0HbYFry805r7Ce2+4/C0cv0W/87Vmn62IWFovIMlDaSCFur
	3Vt9fAczzcXK5HWoOJB9+D97cDyXk1weHeIfpNncyt88AUfnPlTRneVrMnXB7l1diuZmf464SFcar
	xMbJi+248aIKmT58CTHzBt1tORAY3zDgMQ6+YZfuFU0vYWsBcUxN8LZbWFKB4YSVEEoLeKUVos2sx
	x76J4P/4L1SBkNJ0Nqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDgv-0000000GHD5-1xPF;
	Wed, 24 Dec 2025 01:29:29 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDgt-0000000GHCe-1G0Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 01:29:28 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-888bd3bd639so68998456d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766539765; x=1767144565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY7oetAkXk6EDYNEyscTKD195vWG9mtNfQ3sP9pZIoo=;
        b=V3n2zOptyNi6dAKSYHDlIA/CzyMRme2gqmoCfzwBnXqHLykG8PS0947TMCEw5aSUvP
         RPNypePDH6Yr8tqD528mndZIu5HrBBAkecNe9PcxHMXn6r22GoCT2OXvX3PmUR80RDxu
         8FZgLBBzAUIQG1l2udQDCb2GFLRypZ2dM7NIS2g4bjCw1antqFRY2JRub/60EO5RqGeM
         ad9X0kbIpIcf2r04aC3sSL0tboCXPfAGjhlVD6ItGccJ2/V9pQZ2vEQJ3XazKARP0KjN
         7/a4guSmD15g9zbd5NsGL8/mblTDjYSNFLj9GCALp5BgigasoQ7hlyOFAfQ7wre8+XTM
         5KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766539765; x=1767144565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fY7oetAkXk6EDYNEyscTKD195vWG9mtNfQ3sP9pZIoo=;
        b=Yi3peGA3o2qQ/ZdQXP/yvIrS8Aevurq0jAy2PneHiOftEn/0pvOxK10JtUgGpwgjtQ
         J5Vgsdp50tCf/fs8mWVbueVFYeA/3WdykSlohWQyXtkAbrv0Jjs1LPwaIwRkW6A6y0Pc
         HIqI+wGK3ew5Mitenp/k+wcA90LhVG6sZkjcWMiM6HKbiaOtmnzWy8UnFPKbnrXX//mz
         fPm/78sJhxC/yHXSXS9Z/eNET2hM61tsDIg57q/5289UQkn7UvYDFSpQQ6W6hLfJI/Qn
         8lZZvAWW8ByN396Kxk+Tijsj6MlSzG+FM7itOGr3Z0agyME3RVwXFCLrtclxju7Qrc6O
         Ib4A==
X-Forwarded-Encrypted: i=1; AJvYcCX1keodfjMqTR7d3yZ2AcxOlht64Vae7Vp3rMkOW3Z9ozm2AE+n1xwZthI+8/Ut0xD30t3rS6dtl7VAuUY7Iyra@lists.infradead.org
X-Gm-Message-State: AOJu0YwiMUCw1SzemtLpE0h5CkLjPwxJOvqP+ZNzhRTcRK2DlCOhGcUn
	eGiXgCzfeJ0pIhzxOAh/sl6/jXcXXW6QcBM+tlHn1dbYzJx8s7Rs6WvSlQrXIwO2YV+idSWNDqI
	ZIVI/Y2Z8ZYA9beWwEYqGH7UFf+GD010=
X-Gm-Gg: AY/fxX7EDdm3BtZNQmvBXM42LBDSRIPZY40N10u62eNokIwq6D22IwZ/DJnGBqbT9/2
	VBfGWCY3h6J2QXesLR1rTA6bHvJ+YFTPZwLRO/3R88jsKLatt8d7XQSmkSqzDMh2EWOAi6rVLA9
	/WzacHrOH0sh1qcRSzDsS6MlPpPUkPZV9F++JyHWpXff/j0TLfzn2Ze8/egHpdmp5Mb3hOsk3Vw
	4SgfzYqJnR/CjPTZuhDg1SDliTX+Nfbw3mMiLaGjm2qAmrYXoBOWZQVmJaPpZgNjyitbg==
X-Google-Smtp-Source: AGHT+IEqanr28YSBOTX+Nbqh3KipT7oWDaRrm4vfSqEc2gNLOzwNiYOzGsbYOVFZRYgy+qI8NODGQG32DiQMP3byR7U=
X-Received: by 2002:a0c:fe4a:0:b0:888:4930:7988 with SMTP id
 6a1803df08f44-88d8453a11cmr183257436d6.35.1766539765063; Tue, 23 Dec 2025
 17:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20251221115523.GI13030@unreal> <20251221192458.1320-1-21cnbao@gmail.com>
 <20251222084921.GA13529@unreal> <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
 <20251223141424.GB11869@unreal>
In-Reply-To: <20251223141424.GB11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 24 Dec 2025 14:29:13 +1300
X-Gm-Features: AQt7F2riwb-u3bAOGTAJVBUOYvKKCghOt8XbZSdY6cf48c0vtLf1xqZXCdBK7SI
Message-ID: <CAGsJ_4x9YOT2kG0iWz_5NzRVt2iDN9YeUTknZ2MKg7SwmOGOqg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_172927_354250_02669270 
X-CRM114-Status: GOOD (  29.72  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 24, 2025 at 3:14=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Tue, Dec 23, 2025 at 01:02:55PM +1300, Barry Song wrote:
> > On Mon, Dec 22, 2025 at 9:49=E2=80=AFPM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > On Mon, Dec 22, 2025 at 03:24:58AM +0800, Barry Song wrote:
> > > > On Sun, Dec 21, 2025 at 7:55=E2=80=AFPM Leon Romanovsky <leon@kerne=
l.org> wrote:
> > > > [...]
> > > > > > +
> > > > >
> > > > > I'm wondering why you don't implement this batch=E2=80=91sync sup=
port inside the
> > > > > arch_sync_dma_*() functions. Doing so would minimize changes to t=
he generic
> > > > > kernel/dma/* code and reduce the amount of #ifdef=E2=80=91based s=
paghetti.
> > > > >
> > > >
> > > > There are two cases: mapping an sg list and mapping a single
> > > > buffer. The former can be batched with
> > > > arch_sync_dma_*_batch_add() and flushed via
> > > > arch_sync_dma_batch_flush(), while the latter requires all work to
> > > > be done inside arch_sync_dma_*(). Therefore,
> > > > arch_sync_dma_*() cannot always batch and flush.
> > >
> > > Probably in all cases you can call the _batch_ variant, followed by _=
flush_,
> > > even when handling a single page. This keeps the code consistent acro=
ss all
> > > paths. On platforms that do not support _batch_, the _flush_ operatio=
n will be
> > > a NOP anyway.
> >
> > We have a lot of code outside kernel/dma that also calls
> > arch_sync_dma_for_* such as arch/arm, arch/mips, drivers/xen,
> > I guess we don=E2=80=99t want to modify so many things?
>
> Aren't they using internal, arch specific, arch_sync_dma_for_* implementa=
tions?

for arch/arm, arch/mips, they are arch-specific implementations.
xen is an exception:

static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_add=
r,
                size_t size, enum dma_data_direction dir, unsigned long att=
rs)
{
        phys_addr_t paddr =3D xen_dma_to_phys(hwdev, dev_addr);
        struct io_tlb_pool *pool;

        BUG_ON(dir =3D=3D DMA_NONE);

        if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC=
)) {
                if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))))
                        arch_sync_dma_for_cpu(paddr, size, dir);
                else
                        xen_dma_sync_for_cpu(hwdev, dev_addr, size, dir);
        }

        /* NOTE: We use dev_addr here, not paddr! */
        pool =3D xen_swiotlb_find_pool(hwdev, dev_addr);
        if (pool)
                __swiotlb_tbl_unmap_single(hwdev, paddr, size, dir,
                                           attrs, pool);
}

>
> >
> > for kernel/dma, we have two "single" callers only:
> > kernel/dma/direct.h, kernel/dma/swiotlb.c.  and they looks quite
> > straightforward:
> >
> > static inline void dma_direct_sync_single_for_device(struct device *dev=
,
> >                 dma_addr_t addr, size_t size, enum dma_data_direction d=
ir)
> > {
> >         phys_addr_t paddr =3D dma_to_phys(dev, addr);
> >
> >         swiotlb_sync_single_for_device(dev, paddr, size, dir);
> >
> >         if (!dev_is_dma_coherent(dev))
> >                 arch_sync_dma_for_device(paddr, size, dir);
> > }
> >
> > I guess moving to arch_sync_dma_for_device_batch + flush
> > doesn=E2=80=99t really look much better, does it?
> >
> > >
> > > I would also rename arch_sync_dma_batch_flush() to arch_sync_dma_flus=
h().
> >
> > Sure.
> >
> > >
> > > You can also minimize changes in dma_direct_map_phys() too, by extend=
ing
> > > it's signature to provide if flush is needed or not.
> >
> > Yes. I have
> >
> > static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
> >                 phys_addr_t phys, size_t size, enum dma_data_direction =
dir,
> >                 unsigned long attrs, bool flush)
>
> My suggestion is to use it directly, without wrappers.
>
> >
> > and two wrappers:
> > static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> >                 phys_addr_t phys, size_t size, enum dma_data_direction =
dir,
> >                 unsigned long attrs)
> > {
> >         return __dma_direct_map_phys(dev, phys, size, dir, attrs, true)=
;
> > }
> >
> > static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *d=
ev,
> >                 phys_addr_t phys, size_t size, enum dma_data_direction =
dir,
> >                 unsigned long attrs)
> > {
> >         return __dma_direct_map_phys(dev, phys, size, dir, attrs, false=
);
> > }
> >
> > If you prefer exposing "flush" directly in dma_direct_map_phys()
> > and updating its callers with flush=3Dtrue, I think that=E2=80=99s fine=
.
>
> Yes
>

OK. Could you take a look at [1] and see if any further
improvements are needed before I send v2?

[1] https://lore.kernel.org/lkml/20251223023648.31614-1-21cnbao@gmail.com/

Thanks
Barry

