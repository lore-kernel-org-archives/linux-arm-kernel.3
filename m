Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B57E75426
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTc73pncA9MmwXWsw9rT3RA3qICdgHgA5h7y0GSAYUw=; b=EvPvRGT/6OHGcIgVQVtviccjNm
	K9zhaJFNK5xdRGPs/0nv6+2Bl2QgwLA3apx0xE+gaHVgCrW+fJLUwji67Q84Rtk8OqVqP5Eiqkzby
	flAvNSqy+KsYZZC2xmXjKmGARQkQd3j27OT7c6zSVIcf9El84nwJy32O951h7JPowPhz+MfNndpFB
	f0/nLl90Dur4gs8YTwl6dejPs4iMFBJ9pBNdcYSN4beiBfs/hwgUT0aIWAHOH+mdghkrpLQspCGjL
	ou6jn2yxb76FTA82eRDQxrfTzQI/7rCyXmXg6+hBYU7qsgMJZTyEh8exriXg2fJFaxzw4bdyUAVi7
	DrDvahMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKb3-0000000GawJ-44jy;
	Wed, 24 Dec 2025 08:51:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKb1-0000000Gavy-20vI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 08:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34A1C4065F;
	Wed, 24 Dec 2025 08:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70182C4CEFB;
	Wed, 24 Dec 2025 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766566310;
	bh=osSxWKMQD1SgL//TLq1RgpcwAQn0OsX+KRWVMJlqULg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLcHgzvP8JL0/4YUAZblAESLRj8ckRBbAl6beqd2xmIL5og/6jq39IzHDHuYc7L0y
	 YuYhr7L41FjQGESGxB0dLUk70bWTCx99yMhFzPlPzEbK8/ujVO42Gy3z45iKIQOo5O
	 bWMuOey2+VqcvC9TG8QQ2qxwwX6ynq8qjkLlrX4EJV1QOpL23eW7d5J92zq5ejysxt
	 jPrE3Vql6KWGObuuBbFIaQTk6EpRSffs2+/soqS4/7jjZDDV883yiAyMPT1bDQNP8p
	 qxnJBSPlKC/iywgFCCuBVCndQu/0xtdd748K5cViHcnwU0zP0sClYg32/U01UkPXuI
	 APRrfRDrMujRQ==
Date: Wed, 24 Dec 2025 10:51:45 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <20251224085145.GF11869@unreal>
References: <20251221115523.GI13030@unreal>
 <20251221192458.1320-1-21cnbao@gmail.com>
 <20251222084921.GA13529@unreal>
 <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
 <20251223141424.GB11869@unreal>
 <CAGsJ_4x9YOT2kG0iWz_5NzRVt2iDN9YeUTknZ2MKg7SwmOGOqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4x9YOT2kG0iWz_5NzRVt2iDN9YeUTknZ2MKg7SwmOGOqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_005151_562737_3FEACEC7 
X-CRM114-Status: GOOD (  31.37  )
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

On Wed, Dec 24, 2025 at 02:29:13PM +1300, Barry Song wrote:
> On Wed, Dec 24, 2025 at 3:14 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Tue, Dec 23, 2025 at 01:02:55PM +1300, Barry Song wrote:
> > > On Mon, Dec 22, 2025 at 9:49 PM Leon Romanovsky <leon@kernel.org> wrote:
> > > >
> > > > On Mon, Dec 22, 2025 at 03:24:58AM +0800, Barry Song wrote:
> > > > > On Sun, Dec 21, 2025 at 7:55 PM Leon Romanovsky <leon@kernel.org> wrote:
> > > > > [...]
> > > > > > > +
> > > > > >
> > > > > > I'm wondering why you don't implement this batch‑sync support inside the
> > > > > > arch_sync_dma_*() functions. Doing so would minimize changes to the generic
> > > > > > kernel/dma/* code and reduce the amount of #ifdef‑based spaghetti.
> > > > > >
> > > > >
> > > > > There are two cases: mapping an sg list and mapping a single
> > > > > buffer. The former can be batched with
> > > > > arch_sync_dma_*_batch_add() and flushed via
> > > > > arch_sync_dma_batch_flush(), while the latter requires all work to
> > > > > be done inside arch_sync_dma_*(). Therefore,
> > > > > arch_sync_dma_*() cannot always batch and flush.
> > > >
> > > > Probably in all cases you can call the _batch_ variant, followed by _flush_,
> > > > even when handling a single page. This keeps the code consistent across all
> > > > paths. On platforms that do not support _batch_, the _flush_ operation will be
> > > > a NOP anyway.
> > >
> > > We have a lot of code outside kernel/dma that also calls
> > > arch_sync_dma_for_* such as arch/arm, arch/mips, drivers/xen,
> > > I guess we don’t want to modify so many things?
> >
> > Aren't they using internal, arch specific, arch_sync_dma_for_* implementations?
> 
> for arch/arm, arch/mips, they are arch-specific implementations.
> xen is an exception:

Right, and this is the only location outside of kernel/dma where you need to
invoke arch_sync_dma_flush().

> 
> static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
>                 size_t size, enum dma_data_direction dir, unsigned long attrs)
> {
>         phys_addr_t paddr = xen_dma_to_phys(hwdev, dev_addr);
>         struct io_tlb_pool *pool;
> 
>         BUG_ON(dir == DMA_NONE);
> 
>         if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
>                 if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))))
>                         arch_sync_dma_for_cpu(paddr, size, dir);
>                 else
>                         xen_dma_sync_for_cpu(hwdev, dev_addr, size, dir);
>         }
> 
>         /* NOTE: We use dev_addr here, not paddr! */
>         pool = xen_swiotlb_find_pool(hwdev, dev_addr);
>         if (pool)
>                 __swiotlb_tbl_unmap_single(hwdev, paddr, size, dir,
>                                            attrs, pool);
> }
> 
> >
> > >
> > > for kernel/dma, we have two "single" callers only:
> > > kernel/dma/direct.h, kernel/dma/swiotlb.c.  and they looks quite
> > > straightforward:
> > >
> > > static inline void dma_direct_sync_single_for_device(struct device *dev,
> > >                 dma_addr_t addr, size_t size, enum dma_data_direction dir)
> > > {
> > >         phys_addr_t paddr = dma_to_phys(dev, addr);
> > >
> > >         swiotlb_sync_single_for_device(dev, paddr, size, dir);
> > >
> > >         if (!dev_is_dma_coherent(dev))
> > >                 arch_sync_dma_for_device(paddr, size, dir);
> > > }
> > >
> > > I guess moving to arch_sync_dma_for_device_batch + flush
> > > doesn’t really look much better, does it?
> > >
> > > >
> > > > I would also rename arch_sync_dma_batch_flush() to arch_sync_dma_flush().
> > >
> > > Sure.
> > >
> > > >
> > > > You can also minimize changes in dma_direct_map_phys() too, by extending
> > > > it's signature to provide if flush is needed or not.
> > >
> > > Yes. I have
> > >
> > > static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
> > >                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
> > >                 unsigned long attrs, bool flush)
> >
> > My suggestion is to use it directly, without wrappers.
> >
> > >
> > > and two wrappers:
> > > static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> > >                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
> > >                 unsigned long attrs)
> > > {
> > >         return __dma_direct_map_phys(dev, phys, size, dir, attrs, true);
> > > }
> > >
> > > static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
> > >                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
> > >                 unsigned long attrs)
> > > {
> > >         return __dma_direct_map_phys(dev, phys, size, dir, attrs, false);
> > > }
> > >
> > > If you prefer exposing "flush" directly in dma_direct_map_phys()
> > > and updating its callers with flush=true, I think that’s fine.
> >
> > Yes
> >
> 
> OK. Could you take a look at [1] and see if any further
> improvements are needed before I send v2?

Everything looks ok, except these renames:
-			arch_sync_dma_for_cpu(paddr, sg->length, dir);
+			arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);

Thanks

> 
> [1] https://lore.kernel.org/lkml/20251223023648.31614-1-21cnbao@gmail.com/
> 
> Thanks
> Barry
> 

