Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5893CCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3huswgNUf/BOHYyOt3fYAFM4vt9HaltyoTjrFBxGES4=; b=GqXzWMkSrUuEY0M+y7QbqwKe7Z
	qtsmo6J0mTQ2yPmKPyRp1yN/tqePW5rcIuQKAqp5SwSYwdaPHNC07PcGpmfO/AXDs9JSNuaNg8BLN
	papHTS73dD86xJ0ILXLt162oNdBTyl0OoN7Y37objNGCCfUd2cTJQFsm9tRo2/AmpV5mbvrhJTnce
	+m/UJA+KLO3Fbo5dpoYAGQGydZbfeQ7AjKUsrgxcNb4c9zm0ShUxUa57yLXqFvQyFB4WJBc71y/L8
	RsF8FAeLVI5KXLf3uPlojIDmL3ME8Cr/0L0+DeEgI+DvKla0p+GDruQdFDOzxzyk1U7LtBjjOxJso
	Hc5l42KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4xW-00000008FnG-01EH;
	Thu, 21 May 2026 15:05:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4xQ-00000008Fls-43bP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 458243AEC;
	Thu, 21 May 2026 08:05:00 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDC6C3F7B4;
	Thu, 21 May 2026 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779375905; bh=Q7O9TQ82OHo1p5kXqghd2ovKAQGxVssYtzqC81EqQEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFzIoCPEPcx3cVuWH0SZMeEuo77BiH520eb+dYLqeaDbD/oRUXkOuPqannRIsIY2W
	 PwaKHVrvBNC0I6regX8avJTj5BiGd1Aj6A7NJVA8/UCd9HTnM2lzMd5teeqs1Cvl3Y
	 Nf0BUfFMD37qrdrXDow+8UloD884B3iKyoK9quVk=
Date: Thu, 21 May 2026 16:05:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: will@kernel.org, akpm@linux-foundation.org, npiggin@gmail.com,
	aneesh.kumar@kernel.org, peterz@infradead.org,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH] arm64: tlb: Flush walk cache when unsharing PMD tables
Message-ID: <ag8fHYL-S26uO0yZ@arm.com>
References: <20260521073011.4121277-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521073011.4121277-1-zengheng@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080509_058817_EF01C20F 
X-CRM114-Status: GOOD (  20.61  )
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

+ David H.

On Thu, May 21, 2026 at 03:30:11PM +0800, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> When huge_pmd_unshare() is called to unshare a PMD table, the
> tlb_unshare_pmd_ptdesc() function sets tlb->unshared_tables=true
> but the aarch64 tlb_flush() only checked tlb->freed_tables to
> determine whether to use TLBF_NONE (vae1is, invalidates walk
> cache) or TLBF_NOWALKCACHE (vale1is, leaf-only).
> 
> This caused the stale PMD page table entry to remain in the walk cache
> after unshare, potentially leading to incorrect page table walks.
> 
> Fix by including unshared_tables in the check, so that when
> unsharing tables, TLBF_NONE is used and the walk cache is properly
> invalidated.
> 
> Here is the detailed distinction between vae1is and vale1is:
> 
> | Instruction Combination  | Actual Invalidation Scope                         |
> | ------------------------ | --------------------------------------------------|
> | `VAE1IS`  + TTL=`0`      | All entries at all levels (full invalidation)     |
> | `VAE1IS`  + TTL=`2` (L2) | Non-leaf at Level 0/1 + leaf at Level 2           |
> | `VALE1IS` + TTL=`0`      | Leaf entries at all levels (non-leaf not cleared) |
> | `VALE1IS` + TTL=`2` (L2) | Leaf entry at Level 2 only                        |
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

The fix looks fine but does it need:

Fixes: 8ce720d5bd91 ("mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather")
Cc: <stable@vger.kernel.org>

> ---
>  arch/arm64/include/asm/tlb.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index 10869d7731b8..751bd57bc3ba 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -53,7 +53,8 @@ static inline int tlb_get_level(struct mmu_gather *tlb)
>  static inline void tlb_flush(struct mmu_gather *tlb)
>  {
>  	struct vm_area_struct vma = TLB_FLUSH_VMA(tlb->mm, 0);
> -	tlbf_t flags = tlb->freed_tables ? TLBF_NONE : TLBF_NOWALKCACHE;
> +	tlbf_t flags = (tlb->freed_tables || tlb->unshared_tables) ?
> +			TLBF_NONE : TLBF_NOWALKCACHE;
>  	unsigned long stride = tlb_get_unmap_size(tlb);
>  	int tlb_level = tlb_get_level(tlb);
>  
> -- 
> 2.43.0

-- 
Catalin

