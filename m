Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3503EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kotFhbD7slCynrPZmEZb+bzmgA9fbaP3j/x5K5YUavo=; b=3yGK98UCR/vNPgu9sOhsVfteUs
	lrZUfaTClFypsRtZzCbClzI+23yMuMEfMyWI/diZfxjd1uhfEVj4xvqHQfhbLPsdUi6xtwUxMFQle
	CC4rleNxqBf8k9O+im6sq3OSAFPZ0hG6ZcoUifCdrPK70yWyn+WH+cOUcLQpbxCid7snwFYJTc3He
	XV1Y0xWQ7nS4JvmNJb6ZtG/F1E4riTEIzdCGa/2X7KR52WT07kcmMalE3yRKSqXmQ1T8tM64B3nsW
	LPgmsqDGQ6tC59UOBq5YnE4/k82PHy7rQbKvJ0kBFwX0JhP7CX2uVqrbum0FVjYi6lWUOKw7ExF4g
	XCuIB53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKyza-00000000YN0-4AXM;
	Fri, 30 May 2025 12:37:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKyxS-00000000YDu-1jD7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 12:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B447443C6;
	Fri, 30 May 2025 12:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B697C4CEE9;
	Fri, 30 May 2025 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608533;
	bh=ssTBq1hnRKFWeYNHahYmURnTBykROGxk7IhvzIj6zSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibTYds5oHy71GpvqRKYKhl7QbdfMCJ8rZgwuC+JgUtutTq9xmKUjDYyM7SpQOhnWX
	 43/C6b5cKYALcAENNiFdXH40W3lq0R05X6JQzdFbHf/0IDVtYUnBOprYgxrmQdQB3o
	 MSu8vJ3AswFJpY12+Ne8UFpM2jSXQTxMbHfyCTPpfBalzSJVDMi37h5QoKl0Oamh2Q
	 fvE/QDST/ygc20cS76zL9979qO2HSttovfdRNCDOEi7X2DrYbSK119DFMFwjl2UDHi
	 d5GrnnLG8h03RIqzKIkv8Y8UXtmaqlSfBHfwwTVG1NygFOdB5/gia6G+8yiwSxD7D9
	 fblFqOy65X/nA==
Date: Fri, 30 May 2025 13:35:27 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
Message-ID: <20250530123527.GA30463@willie-the-truck>
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_053534_496160_E0FDC8E2 
X-CRM114-Status: GOOD (  29.16  )
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

On Fri, May 30, 2025 at 12:50:40PM +0100, Ryan Roberts wrote:
> On 30/05/2025 10:14, Dev Jain wrote:
> > 
> > On 30/05/25 2:10 pm, Ryan Roberts wrote:
> >> On 30/05/2025 09:20, Dev Jain wrote:
> >>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> >>> because an intermediate table may be removed, potentially causing the
> >>> ptdump code to dereference an invalid address. We want to be able to
> >>> analyze block vs page mappings for kernel mappings with ptdump, so to
> >>> enable vmalloc-huge with ptdump, synchronize between page table removal in
> >>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> >>> use mmap_read_lock and not write lock because we don't need to synchronize
> >>> between two different vm_structs; two vmalloc objects running this same
> >>> code path will point to different page tables, hence there is no race.
> > 
> > My "correction" from race->no problem was incorrect after all :) There will
> > be no race too since the vm_struct object has exclusive access to whatever
> > table it is clearing.
> > 
> >>>
> >>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>> ---
> >>>   arch/arm64/include/asm/vmalloc.h | 6 ++----
> >>>   arch/arm64/mm/mmu.c              | 7 +++++++
> >>>   2 files changed, 9 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> >>> index 38fafffe699f..28b7173d8693 100644
> >>> --- a/arch/arm64/include/asm/vmalloc.h
> >>> +++ b/arch/arm64/include/asm/vmalloc.h
> >>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
> >>>       /*
> >>>        * SW table walks can't handle removal of intermediate entries.
> >>>        */
> >>> -    return pud_sect_supported() &&
> >>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> >>> +    return pud_sect_supported();
> >>>   }
> >>>     #define arch_vmap_pmd_supported arch_vmap_pmd_supported
> >>>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
> >>>   {
> >>> -    /* See arch_vmap_pud_supported() */
> >>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> >>> +    return true;
> >>>   }
> >>>     #endif
> >>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>> index ea6695d53fb9..798cebd9e147 100644
> >>> --- a/arch/arm64/mm/mmu.c
> >>> +++ b/arch/arm64/mm/mmu.c
> >>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>       }
> >>>         table = pte_offset_kernel(pmdp, addr);
> >>> +
> >>> +    /* Synchronize against ptdump_walk_pgd() */
> >>> +    mmap_read_lock(&init_mm);
> >>>       pmd_clear(pmdp);
> >>> +    mmap_read_unlock(&init_mm);
> >> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
> >> exclusive with any read_lock holders) for the duration of the table walk, so it
> >> will either consistently see the pgtables before or after this removal. It will
> >> never disappear during the walk, correct?
> >>
> >> I guess there is a risk of this showing up as contention with other init_mm
> >> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
> >> are called sufficiently rarely that the risk is very small. Let's fix any perf
> >> problem if/when we see it.
> > 
> > We can avoid all of that by my initial approach - to wrap the lock around
> > CONFIG_PTDUMP_DEBUGFS.
> > I don't have a strong opinion, just putting it out there.
> 
> (I wrote then failed to send earlier):
> 
> It's ugly though. Personally I'd prefer to keep it simple unless we have clear
> evidence that its needed. I was just laying out my justification for not needing
> to doing the conditional wrapping in this comment.

I really don't think we should be adding unconditional locking overhead
to core mm routines purely to facilitate a rarely used debug option.

Instead, can we either adopt something like the RCU-like walk used by
fast GUP or stick the locking behind a static key that's only enabled
when a ptdump walk is in progress (a bit like how
hugetlb_vmemmap_optimize_folio() manipulates hugetlb_optimize_vmemmap_key)?

Will

