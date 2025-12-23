Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B89E6F090
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiNTAkOZy7BhXOEIP77b/uS+ZQ/icj7oqV235hFSnIM=; b=MkcSybXYHQ/D4yWxo/bbVrq9eo
	1tk55f5TtHYme0S2QZYfn832rAvGXcaK6bOrjqpOV50L1ba5YR/SYG0eftVnJr2rrZkSJ7+v9Sizx
	sJaJu/9ls5Peal4HmczaV+yuXRs8dDJuKPm+/8PbZchbjo9NFLagdnQf2DnQQJgrqNxqWvRzY3PGP
	QgLrhIrPRrLJue5hOvGL3IfpN8Ct4ER9ABy1TRLfkBruPngNUq6HuIned+/SZShx72InhpXsRM/Pa
	Ci4eJU4XamhxQ3V+myHBXh48dU08cHuHIRS+EzSIljC45V2bTj2qTSP2FlR4+VzMXG/JPVKbaqx5q
	mu0fj/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39m-0000000FaoE-0SPo;
	Tue, 23 Dec 2025 14:14:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39i-0000000Fam9-2ysu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 025356013A;
	Tue, 23 Dec 2025 14:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC75FC113D0;
	Tue, 23 Dec 2025 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499269;
	bh=E/rqi5UOKsGwhDL3sEb/cVF5Ms1UenOxGJcOAHotpcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oa5+4tbHWG8rUffUclYbuA3LzfmVRLAAJhiPIkDkBifa4Zkh2TDNWcCDHzfztG45E
	 5uQshF1CiNf6DYGRnXzRov+rGOk7sNtWxpy5i1kvlGwLDxjDf9j74Md7OLJW0+E28v
	 9b4qdC5U4PuGN3tN38I9Bqf+V1GOy+RRKBKlmNbfMbZ2uXAe4S3+ubI0ervajJzVNP
	 UrMydCxlMoZfKLnvVLLIv1Vf9Ucc8S9Pnd1tsa1czmiEqbOYpenkENfQgSWY5BtPnD
	 Z0ifhd4wudWzl6EuITrwKH6wTo5c2krn6Uin80OQEJjCQYtBOn8+O+Ls5f+kRMMnLc
	 1TqiWYX4tbnxQ==
Date: Tue, 23 Dec 2025 16:14:24 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <20251223141424.GB11869@unreal>
References: <20251221115523.GI13030@unreal>
 <20251221192458.1320-1-21cnbao@gmail.com>
 <20251222084921.GA13529@unreal>
 <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
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

On Tue, Dec 23, 2025 at 01:02:55PM +1300, Barry Song wrote:
> On Mon, Dec 22, 2025 at 9:49 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Mon, Dec 22, 2025 at 03:24:58AM +0800, Barry Song wrote:
> > > On Sun, Dec 21, 2025 at 7:55 PM Leon Romanovsky <leon@kernel.org> wrote:
> > > [...]
> > > > > +
> > > >
> > > > I'm wondering why you don't implement this batch‑sync support inside the
> > > > arch_sync_dma_*() functions. Doing so would minimize changes to the generic
> > > > kernel/dma/* code and reduce the amount of #ifdef‑based spaghetti.
> > > >
> > >
> > > There are two cases: mapping an sg list and mapping a single
> > > buffer. The former can be batched with
> > > arch_sync_dma_*_batch_add() and flushed via
> > > arch_sync_dma_batch_flush(), while the latter requires all work to
> > > be done inside arch_sync_dma_*(). Therefore,
> > > arch_sync_dma_*() cannot always batch and flush.
> >
> > Probably in all cases you can call the _batch_ variant, followed by _flush_,
> > even when handling a single page. This keeps the code consistent across all
> > paths. On platforms that do not support _batch_, the _flush_ operation will be
> > a NOP anyway.
> 
> We have a lot of code outside kernel/dma that also calls
> arch_sync_dma_for_* such as arch/arm, arch/mips, drivers/xen,
> I guess we don’t want to modify so many things?

Aren't they using internal, arch specific, arch_sync_dma_for_* implementations?

> 
> for kernel/dma, we have two "single" callers only:
> kernel/dma/direct.h, kernel/dma/swiotlb.c.  and they looks quite
> straightforward:
> 
> static inline void dma_direct_sync_single_for_device(struct device *dev,
>                 dma_addr_t addr, size_t size, enum dma_data_direction dir)
> {
>         phys_addr_t paddr = dma_to_phys(dev, addr);
> 
>         swiotlb_sync_single_for_device(dev, paddr, size, dir);
> 
>         if (!dev_is_dma_coherent(dev))
>                 arch_sync_dma_for_device(paddr, size, dir);
> }
> 
> I guess moving to arch_sync_dma_for_device_batch + flush
> doesn’t really look much better, does it?
> 
> >
> > I would also rename arch_sync_dma_batch_flush() to arch_sync_dma_flush().
> 
> Sure.
> 
> >
> > You can also minimize changes in dma_direct_map_phys() too, by extending
> > it's signature to provide if flush is needed or not.
> 
> Yes. I have
> 
> static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
>                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
>                 unsigned long attrs, bool flush)

My suggestion is to use it directly, without wrappers.

> 
> and two wrappers:
> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
>                 unsigned long attrs)
> {
>         return __dma_direct_map_phys(dev, phys, size, dir, attrs, true);
> }
> 
> static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
>                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
>                 unsigned long attrs)
> {
>         return __dma_direct_map_phys(dev, phys, size, dir, attrs, false);
> }
> 
> If you prefer exposing "flush" directly in dma_direct_map_phys()
> and updating its callers with flush=true, I think that’s fine.

Yes

> 
> It could be also true for dma_direct_sync_single_for_device().
> 
> >
> > dma_direct_map_phys(....) -> dma_direct_map_phys(...., bool flush):
> >
> > static inline dma_addr_t dma_direct_map_phys(...., bool flush)
> > {
> >         ....
> >
> >         if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
> >             !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
> >         {
> >                 arch_sync_dma_for_device(phys, size, dir);
> >                 if (flush)
> >                         arch_sync_dma_flush();
> >         }
> > }
> >
> 
> Thanks
> Barry
> 

