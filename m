Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBDC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhDnYJp6idU/zB/vpIZI1eo8XyX+VQJ6y+dK4kTg7es=; b=Ec4Hidp9tvta59/xY8cUF8adE9
	2mmdGdxRxepuMUURbhMsa5Cw9kARiVaYSYB8nOnUOJ29lSc/Su2GXAGjxU05QbwpVgieeStZiF+3U
	O3+50PWvf/Pv8QfR9KCb0riTrmsZKwWnlsgQsatTe1ofo9CYug9bi/LMkvomV6+8yr3sTJTjr7oi4
	Mnvxo+SPb2lbYvsGFNwRr6wVK8t5x81a/bJn/Jmr0acP4GHAO4bnh1KthLo2qz6gA8+PhG90w+nQE
	NNy0A12eKqeyWicIb2qU2wFlqXLrrpvLEmfcoHFDov3xSsVHBbm6y3N5h9q/rBWEutVbvY0Wk0OD6
	WjK/K3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuG8-000000018Wj-3Fa2;
	Tue, 25 Aug 2026 16:44:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuG7-000000018Wd-174v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:44:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4234D60133;
	Tue, 25 Aug 2026 16:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216351F000E9;
	Tue, 25 Aug 2026 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676261;
	bh=HhDnYJp6idU/zB/vpIZI1eo8XyX+VQJ6y+dK4kTg7es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lc5N3dWni19ze5u+0uMkDDn2EcJBmW8KejCOvedJ1G3bvff6VjTKA++o4r2/zX4ah
	 pdXF7g5OKNCO26VzY76H8NWtdQ+AhxPhl2LKUn7KlfKzUOKR8d9/y0AhriYtro1GJA
	 1FhdvugucOPlDv6fTQ81FCQEQ3Q4ip4voc3N/T5lqkX8NhMXpmx2wtHePEjKcuhtRS
	 IW5CRx8ruYhDfNNkjRwTgkZVpIp3X0B22RVLoKfGV7lhe+RMqRl1zSTniq2G1cZ5Dp
	 j10p3MT+bnpNHHTLgz+knj6X6hsg14ZRrFXprL7IFZdoUAyfYpcjlOmugdUrxGN9nk
	 NncWc4mFC4qHw==
Date: Tue, 25 Aug 2026 17:44:14 +0100
From: Will Deacon <will@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
	ljs@kernel.org, usama.arif@linux.dev, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, rppt@kernel.org,
	ryan.roberts@arm.com, ziy@nvidia.com, baohua@kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v6 2/3] arm64/mm: add set_direct_map_ro_noflush()
Message-ID: <ao3GXvT2ltf89_rG@willie-the-truck>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-3-xueyuan.chen21@gmail.com>
 <c81ff923-800c-4ef4-b6e4-ec9f5eb1671f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c81ff923-800c-4ef4-b6e4-ec9f5eb1671f@kernel.org>
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

On Tue, Aug 25, 2026 at 05:52:20PM +0200, David Hildenbrand (Arm) wrote:
> On 7/30/26 11:06, Xueyuan Chen wrote:
> > Implement set_direct_map_ro_noflush() for arm64 with update_range_prot() on
> > the linear map, setting PTE_RDONLY and clearing PTE_WRITE. Keep the
> > existing can_set_direct_map() guard and leave TLB invalidation to the
> > caller.
> > 
> > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  arch/arm64/include/asm/set_memory.h |  2 ++
> >  arch/arm64/mm/pageattr.c            | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
> > index 90f61b17275e..7083260303c3 100644
> > --- a/arch/arm64/include/asm/set_memory.h
> > +++ b/arch/arm64/include/asm/set_memory.h
> > @@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
> >  int set_direct_map_invalid_noflush(struct page *page);
> >  int set_direct_map_default_noflush(struct page *page);
> >  int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
> > +int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
> > +#define set_direct_map_ro_noflush set_direct_map_ro_noflush
> >  bool kernel_page_present(struct page *page);
> >  
> >  int set_memory_encrypted(unsigned long addr, int numpages);
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index ce035e1b4eaf..c51236b61651 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -365,6 +365,16 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
> >  	return set_memory_valid(addr, nr, valid);
> >  }
> >  
> > +int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
> > +{
> > +	if (!can_set_direct_map())
> > +		return 0;
> > +
> > +	return update_range_prot((unsigned long)addr, PAGE_SIZE * nr_pages,
> > +				 __pgprot(PTE_RDONLY),
> > +				 __pgprot(PTE_WRITE));
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_PAGEALLOC
> >  /*
> >   * This is - apart from the return value - doing the same
> 
> We'll need an ACK from arm64 maintaines. To me this looks good.

I generally dislike deferring critical things like TLB invalidation to
the caller, so it would be good to see an example of a caller that really
needs that. The caller in patch 1 unconditionally  calls
flush_tlb_kernel_range() immediately after calling
set_direct_map_ro_noflush().

In fact, that means we have a pointless invalidation if
!can_set_direct_map(). See exhibit A :)

Will

