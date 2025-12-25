Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEF7E7AD44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vrFk5nKpLGAya0Z6/uOniymt2kUhqSE3u/qvWC/V48=; b=O4NLCG/awgSdM1FrBm+iKa/1d1
	4U4TT0l9/W9dpjKK4ox/1pQJOf2tl2YgF4f0ARvlpZ1TW+EU5rtWKcXsdaUxXadWhUm5q6jSQZVKh
	r6OWJWzMqP75f65y7+p+2vrWe7FxBSPHYV00fcpDNfGyiiOZz1ZGJs/Dnbxs5uNaDezo2vtjGaPHC
	MHe6sPzt/lJJIywcm1ivj8FJmVDz2uL8vGQ9Lt74RC/tIxO1EVFhcW6ggKRtqMoB6w/gpoMLFYGmq
	Z8GblGCU1wAfIdratQFCIgmiUafdB9F6Wd3gWldiULeZItCpZ7w0ZOW/09UsEo5stwD7GHayr/t+l
	sw9WQ6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYlaQ-00000000S8a-24PO;
	Thu, 25 Dec 2025 13:41:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYlaM-00000000S8E-2Brb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 13:40:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE69A42A88;
	Thu, 25 Dec 2025 13:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94B2C4CEF1;
	Thu, 25 Dec 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766670057;
	bh=Cl5woC73KHrjEBeL2aF9DwosspCyJ3c1bTfC42VEv70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnlPpqYPztADGcdZH/lfxWEsNuesvOZq5cGZEecWSSEv73GlIwBJgsHNSgcCUCfE9
	 h0zbezaZDC6W9Cul47/khotCLFUbvqPVGt5c+VMx2WPKpBy9nfCJYufCFwKfeIIrG/
	 u5UbfuLQzBpDqErNxrSBUq7B/S1NkK1XYbRgyjOnc8Mx9iJJVw23rfFpiuU9h9y0o3
	 stB+pOLDIlC9RcGXeGM/ZUW0yR0Huyuazm+gCX44FClrVZtHD9CCFGvjDNs+12y1Hi
	 wVqOoYUIbiy5QP42bSTsUriqEcHZpVgjkm6MzVRhlsSepWh8/O2jRo0G51Hr7pOZlC
	 X4iLItXouYnfA==
Date: Thu, 25 Dec 2025 15:40:52 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <20251225134052.GM11869@unreal>
References: <20251224085145.GF11869@unreal>
 <20251225054509.39917-1-21cnbao@gmail.com>
 <20251225123650.GJ11869@unreal>
 <CAGsJ_4zpWWLaynh1U4MKCS-N8tZ0tvE6tAmb0m+Pbf-kPsYQJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zpWWLaynh1U4MKCS-N8tZ0tvE6tAmb0m+Pbf-kPsYQJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_054058_804617_933D8117 
X-CRM114-Status: GOOD (  25.98  )
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

On Fri, Dec 26, 2025 at 02:31:42AM +1300, Barry Song wrote:
> On Fri, Dec 26, 2025 at 1:36 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Thu, Dec 25, 2025 at 06:45:09PM +1300, Barry Song wrote:
> > > > > >
> > > > >
> > > > > OK. Could you take a look at [1] and see if any further
> > > > > improvements are needed before I send v2?
> > > >
> > > > Everything looks ok, except these renames:
> > > > -                       arch_sync_dma_for_cpu(paddr, sg->length, dir);
> > > > +                       arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);
> > >
> > > Thanks!
> > > I'm happy to drop the rename as outlined below-feedback welcome :-)
> > >
> > > diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
> > > index dd2c8586a725..487fb7c355ed 100644
> > > --- a/arch/arm64/include/asm/cache.h
> > > +++ b/arch/arm64/include/asm/cache.h
> > > @@ -87,6 +87,12 @@ int cache_line_size(void);
> > >
> > >  #define dma_get_cache_alignment      cache_line_size
> > >
> > > +static inline void arch_sync_dma_flush(void)
> > > +{
> > > +     dsb(sy);
> > > +}
> > > +#define arch_sync_dma_flush arch_sync_dma_flush
> > > +
> > >  /* Compress a u64 MPIDR value into 32 bits. */
> > >  static inline u64 arch_compact_of_hwid(u64 id)
> > >  {
> > > diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> > > index b2b5792b2caa..ae1ae0280eef 100644
> > > --- a/arch/arm64/mm/dma-mapping.c
> > > +++ b/arch/arm64/mm/dma-mapping.c
> > > @@ -17,7 +17,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > >  {
> > >       unsigned long start = (unsigned long)phys_to_virt(paddr);
> > >
> > > -     dcache_clean_poc(start, start + size);
> > > +     dcache_clean_poc_nosync(start, start + size);
> > >  }
> > >
> > >  void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> > > @@ -28,7 +28,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> > >       if (dir == DMA_TO_DEVICE)
> > >               return;
> > >
> > > -     dcache_inval_poc(start, start + size);
> > > +     dcache_inval_poc_nosync(start, start + size);
> > >  }
> > >
> > >  void arch_dma_prep_coherent(struct page *page, size_t size)
> > > diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> > > index 4809204c674c..e7dd8a63b40e 100644
> > > --- a/include/linux/dma-map-ops.h
> > > +++ b/include/linux/dma-map-ops.h
> > > @@ -361,6 +361,12 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> > >  }
> > >  #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
> > >
> > > +#ifndef arch_sync_dma_flush
> >
> > You likely need to wrap this in "#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FLUSH"
> > as done in the surrounding code.
> 
> I've dropped the new Kconfig option and now rely on whether
> arch_sync_dma_flush() is provided by the architecture. If an arch
> does not define arch_sync_dma_flush() in its asm/cache.h, a no-op
> implementation is used instead.

I know.

> 
> Do you still prefer keeping a config option to match the surrounding
> code style?

I don't have a strong preference here. Go ahead and try your current
version and see how people respond.

> Note that on arm64, arch_sync_dma_flush() is already a
> static inline rather than an extern, so it is not strictly aligned
> with the others.
> Having both CONFIG_ARCH_HAS_SYNC_DMA_FLUSH and
> "#ifndef arch_sync_dma_flush" seems duplicated.
> 
> Another potential optimization would be to drop these options
> entirely and handle this via ifndefs, letting each architecture
> define the macros in asm/cache.h instead.
> 
> Whether arch implements arch_sync_dma_for_xx() as static inline or
> as external functions makes no difference.
> 
> - #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
> - void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,-
>                 enum dma_data_direction dir);
> - #else
> + #ifndef arch_sync_dma_for_cpu
> static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>                 enum dma_data_direction dir)
> {
> }
> #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
> 
> >
> > Thanks
> >
> > > +static inline void arch_sync_dma_flush(void)
> > > +{
> > > +}
> > > +#endif
> > > +
> > >  #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
> > >  void arch_sync_dma_for_cpu_all(void);
> > >  #else
> > >
> 
> Thanks
> Barry
> 

