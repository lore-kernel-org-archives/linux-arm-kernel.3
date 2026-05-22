Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0790CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LteskIZGW5UeixZjAmhFHMTgcIbn328EvJysr5BwE5w=; b=FAAY6/Nxr5HXmERVqPO744HrX3
	Vcyjy/0wrTzLG5AbAAYn1o9m5V1icC6K9XbgtlAZ7XuZTu7MY5WMFuhe+mHmH0gH1tbxXtCIt2hy6
	zARyD7yi26hhr/QjAT4MbTc1ybcK+7Vywe9/gm0V4c24Gzyk2vZ/UKrGAWzb4LYdFx+aZCN5ov/3M
	RUEZugr1XxTbDDodjwZUokuQYZ1mrNW/DTgjKVK1QErlFKCt5D3mA5y4WzNj4jquimBVFGg0IbUpx
	armQ3ZWPOFFjatpqDcK0XcOHMJkEDnX070oOFhKUMFdxhWz7QdyuOe+OWr/fEgFtRulqUXbFl6FOr
	fZ1YWpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsi-0000000ASSM-368v;
	Fri, 22 May 2026 10:13:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsf-0000000ASP1-0mVc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:13:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC0471C0A;
	Fri, 22 May 2026 03:13:18 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653EE3F85F;
	Fri, 22 May 2026 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779444803; bh=DNbpyntwF+hMLXGYG7QS6XgYK9N3tC6rW9pSIUZL2UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnPzawxVOZEsilVN+FrmjqG+d5EGMvtws0WvCEFdP0vTh8WmzqaQCT20F6/XSKi4Y
	 M4M+vtYWNuQY8ZNHie4OyF0sEuGltPkBQhiJ7hC+28iuovNettd25yWTfGENWI6CMX
	 oC5xoSsmgStsFj6eIQ7W50kH7UNJLX8uN3r3m4GE=
Date: Fri, 22 May 2026 11:13:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: yezhenyu2@huawei.com, zhurui3@huawei.com, will@kernel.org,
	akpm@linux-foundation.org, npiggin@gmail.com,
	aneesh.kumar@kernel.org, peterz@infradead.org,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, David Hildenbrand <david@kernel.org>,
	zengheng4@huawei.com
Subject: Re: [PATCH] arm64: tlb: Flush walk cache when unsharing PMD tables
Message-ID: <ahAsPU00ZTTJV3Ye@arm.com>
References: <20260521073011.4121277-1-zengheng@huaweicloud.com>
 <ag8fHYL-S26uO0yZ@arm.com>
 <ag8hmZ3kjtJINyIT@arm.com>
 <b7098272-a348-d918-774a-d5d2645fc7f4@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7098272-a348-d918-774a-d5d2645fc7f4@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031325_572319_C3179002 
X-CRM114-Status: GOOD (  29.67  )
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

On Fri, May 22, 2026 at 01:32:07PM +0800, Zeng Heng wrote:
> On 2026/5/21 23:15, Catalin Marinas wrote:
> > On Thu, May 21, 2026 at 04:05:07PM +0100, Catalin Marinas wrote:
> > > On Thu, May 21, 2026 at 03:30:11PM +0800, Zeng Heng wrote:
> > > > From: Zeng Heng <zengheng4@huawei.com>
> > > > 
> > > > When huge_pmd_unshare() is called to unshare a PMD table, the
> > > > tlb_unshare_pmd_ptdesc() function sets tlb->unshared_tables=true
> > > > but the aarch64 tlb_flush() only checked tlb->freed_tables to
> > > > determine whether to use TLBF_NONE (vae1is, invalidates walk
> > > > cache) or TLBF_NOWALKCACHE (vale1is, leaf-only).
> > > > 
> > > > This caused the stale PMD page table entry to remain in the walk cache
> > > > after unshare, potentially leading to incorrect page table walks.
> > > > 
> > > > Fix by including unshared_tables in the check, so that when
> > > > unsharing tables, TLBF_NONE is used and the walk cache is properly
> > > > invalidated.
> > > > 
> > > > Here is the detailed distinction between vae1is and vale1is:
> > > > 
> > > > | Instruction Combination  | Actual Invalidation Scope                         |
> > > > | ------------------------ | --------------------------------------------------|
> > > > | `VAE1IS`  + TTL=`0`      | All entries at all levels (full invalidation)     |
> > > > | `VAE1IS`  + TTL=`2` (L2) | Non-leaf at Level 0/1 + leaf at Level 2           |
> > > > | `VALE1IS` + TTL=`0`      | Leaf entries at all levels (non-leaf not cleared) |
> > > > | `VALE1IS` + TTL=`2` (L2) | Leaf entry at Level 2 only                        |
> > > > 
> > > > Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > > The fix looks fine but does it need:
> > > 
> > > Fixes: 8ce720d5bd91 ("mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather")
> > > Cc: <stable@vger.kernel.org>
> > > 
> > > > ---
> > > >   arch/arm64/include/asm/tlb.h | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> > > > index 10869d7731b8..751bd57bc3ba 100644
> > > > --- a/arch/arm64/include/asm/tlb.h
> > > > +++ b/arch/arm64/include/asm/tlb.h
> > > > @@ -53,7 +53,8 @@ static inline int tlb_get_level(struct mmu_gather *tlb)
> > > >   static inline void tlb_flush(struct mmu_gather *tlb)
> > > >   {
> > > >   	struct vm_area_struct vma = TLB_FLUSH_VMA(tlb->mm, 0);
> > > > -	tlbf_t flags = tlb->freed_tables ? TLBF_NONE : TLBF_NOWALKCACHE;
> > > > +	tlbf_t flags = (tlb->freed_tables || tlb->unshared_tables) ?
> > > > +			TLBF_NONE : TLBF_NOWALKCACHE;
> > > >   	unsigned long stride = tlb_get_unmap_size(tlb);
> > > >   	int tlb_level = tlb_get_level(tlb);
> > Do we need this as well?
> 
> The proposed fix has been validated against the issue scenarios and
> works as expected.
> 
> Per the ARM Architecture Reference Manual, whether only the last-level
> page table entry is invalidated is determined by the instruction used
> (vale1is for leaf entry only, vae1is for walk cache including leaf entry and
> non-leaf entry), rather than the TTL field. The TTL field merely specifies
> which level the leaf entry belongs to.

Ah, yes, you are right. The TTL is still 2 in this case for a huge pmd,
we just want the walk cache leading to it to be invalidated. So no need
for the additional tlb_get_level().

Thanks.

-- 
Catalin

