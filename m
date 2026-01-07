Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880DACF6BF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irE4wdTNuGIHnnFsC0xlCTe5CnrzyeBcSYWPnoMRuV8=; b=u8dTxiNDc4QdO7Eo3jKQITak8n
	7pQBBgKpmNLLbNhljfgVpS7FQRz3sS79mQhpDx/sgX+1vEBUrX3uzpooKy6mCNGhAexDK2jDZTl7X
	oKSBxu5zInNiZiLXjGva2VDXXaC3kCe/vatApFLyAQhs5oSKJwKcrSo2WYvoxYxSAK1uzwvgGiv1y
	BqTqyLFNKvI5NvQpC5pzjwbZmMuHXjxkpFnJiJcAo7un1t7PzuIEOEBF7RSEFgKvMoAUyXLvEqv3F
	eTF9ZZodq83jnTUcQpkVHvgZ0hCQUufqKE9Yeausok1lIHuS7ytQAveI2R3eIJhQELJL/1Swhm6t2
	gnQ+Mw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdON4-0000000EKUI-2Ke2;
	Wed, 07 Jan 2026 07:54:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdON1-0000000EKTU-3Nxu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8392405D3;
	Wed,  7 Jan 2026 07:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366ADC4CEF7;
	Wed,  7 Jan 2026 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767772458;
	bh=IJfaPCj/Ro7N4LJzkmqwZpte1m5fLCvqEg3Yi9qSa/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JegFElB4jfM6lIyqKfOUEJmukL5QcBuXQQCS1oWKX/mXqRH1La+ORK7qxKkRK97t1
	 UpXoiQVQFSfboQKHgYUuMFwg/5O3Rd81m1mG1lk7kajHvCCddaxg9zzvFJFzoCL5M9
	 DB6ldMtJc38E38hDgUAxRo6vz9wGXGEZncuXsCbDdWtoTWUNsvsd4MSZexskkOMrAG
	 lmjCcWVP9uN1Gd7GSKAeLe0jYdbbdrZESH7yo63D9W5zhX9y49sK2mWwfo/1mCDcpC
	 q+MP/ZYycMVhRnWG5yZ04253/4EDluvRHL7pltvITIR6/dH3lj7namEjrQJew9TpUd
	 W2sBYSB/ZcG2Q==
Date: Wed, 7 Jan 2026 09:54:14 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
Message-ID: <20260107075414.GA11783@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal>
 <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal>
 <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
 <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
 <CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_235419_893364_4356668C 
X-CRM114-Status: GOOD (  37.06  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, Robin Murphy <robin.murphy@arm.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 07, 2026 at 08:47:36AM +1300, Barry Song wrote:
> On Wed, Jan 7, 2026 at 8:12 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2026-01-06 6:41 pm, Barry Song wrote:
> > > On Mon, Dec 29, 2025 at 3:50 AM Leon Romanovsky <leon@kernel.org> wrote:
> > >>
> > >> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> > >>> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> wrote:
> > >>>>
> > >>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > >>>>> From: Barry Song <baohua@kernel.org>
> > >>>>>
> > >>>>> Instead of performing a flush per SG entry, issue all cache
> > >>>>> operations first and then flush once. This ultimately benefits
> > >>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> > >>>>>
> > >>>>> Cc: Leon Romanovsky <leon@kernel.org>
> > >>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
> > >>>>> Cc: Will Deacon <will@kernel.org>
> > >>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > >>>>> Cc: Robin Murphy <robin.murphy@arm.com>
> > >>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > >>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
> > >>>>> Cc: Marc Zyngier <maz@kernel.org>
> > >>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > >>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> > >>>>> Cc: Suren Baghdasaryan <surenb@google.com>
> > >>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > >>>>> Signed-off-by: Barry Song <baohua@kernel.org>
> > >>>>> ---
> > >>>>>   kernel/dma/direct.c | 14 +++++++-------
> > >>>>>   1 file changed, 7 insertions(+), 7 deletions(-)
> > >>>>
> > >>>> <...>
> > >>>>
> > >>>>> -             if (!dev_is_dma_coherent(dev)) {
> > >>>>> +             if (!dev_is_dma_coherent(dev))
> > >>>>>                        arch_sync_dma_for_device(paddr, sg->length,
> > >>>>>                                        dir);
> > >>>>> -                     arch_sync_dma_flush();
> > >>>>> -             }
> > >>>>>        }
> > >>>>> +     if (!dev_is_dma_coherent(dev))
> > >>>>> +             arch_sync_dma_flush();
> > >>>>
> > >>>> This patch should be squashed into the previous one. You introduced
> > >>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
> > >>>
> > >>> Hi Leon,
> > >>>
> > >>> The previous patch replaces all arch_sync_dma_for_* calls with
> > >>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> > >>> functional change. The subsequent patches then implement the
> > >>> actual batching. I feel this is a better approach for reviewing
> > >>> each change independently. Otherwise, the previous patch would
> > >>> be too large.
> > >>
> > >> Don't worry about it. Your patches are small enough.
> > >
> > > My hardware does not require a bounce buffer, but I am concerned that
> > > this patch may be incorrect for systems that do require one.
> > >
> > > Now it is:
> > >
> > > void dma_direct_sync_sg_for_cpu(struct device *dev,
> > >                  struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> > > {
> > >          struct scatterlist *sg;
> > >          int i;
> > >
> > >          for_each_sg(sgl, sg, nents, i) {
> > >                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> > >
> > >                  if (!dev_is_dma_coherent(dev))
> > >                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> > >
> > >                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> > >
> > >                  if (dir == DMA_FROM_DEVICE)
> > >                          arch_dma_mark_clean(paddr, sg->length);
> > >          }
> > >
> > >          if (!dev_is_dma_coherent(dev)) {
> > >                  arch_sync_dma_flush();
> > >                  arch_sync_dma_for_cpu_all();
> > >          }
> > > }
> > >
> > > Should we call swiotlb_sync_single_for_cpu() and
> > > arch_dma_mark_clean() after the flush to ensure the CPU sees the
> > > latest data and that the memcpy is correct? I mean:
> >
> > Yes, this and the equivalents in the later patches are broken for all
> > the sync_for_cpu and unmap paths which may end up bouncing (beware some
> > of them get a bit fiddly) - any cache maintenance *must* be completed
> > before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 thing,
> > and appears to be entirely dead now.
> 
> Thanks, Robin. Personally, I would prefer an approach like the one below—
> that is, not optimizing the bounce buffer cases, as they are already slow
> due to hardware limitations with memcpy, and optimizing them would make
> the code quite messy.
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 550a1a13148d..a4840f7e8722 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>         for_each_sg(sgl, sg, nents, i) {
>                 phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
> -               if (!dev_is_dma_coherent(dev))
> +               if (!dev_is_dma_coherent(dev)) {
>                         arch_sync_dma_for_cpu(paddr, sg->length, dir);
> +                       if (unlikely(dev->dma_io_tlb_mem))
> +                               arch_sync_dma_flush();
> +               }
> 
>                 swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
> I’d like to check with you, Leon, and Marek on your views about this.

I agree with your point that the non‑SWIOTLB path is the performant one and
should be preferred. My concern is that you are accessing the
dma_io_tlb_mem variable directly from direct.c, which looks like a layer
violation.

You likely need to introduce an is_swiotlb_something() helper for this.

BTW, please send a v3 instead of posting incremental follow‑ups.
It's hard to track the changes across multiple small additions.

Thanks.
> 
> Thanks
> Barry

