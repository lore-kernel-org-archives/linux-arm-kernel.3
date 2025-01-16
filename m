Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52278C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3Q/pSyt6LskeOYVDS4hEOcgp09UhsuwTgGj3csJ7ZY=; b=u3wVbdB5en/MsIgFqtOPliJ1Nd
	HZvMooaVIvSSCuMuUpjKUpXwUjsEwym6Fs4sW26iDeUNo+9ZmK3YLuHn96FHPEM3dcY+T74FKYVOm
	aNpdlSiZQ+TXm3N8QPeUiV3PMxAN+v8dwHaY2TrG07y4xlCaaFIZjorfOXpiwhkN1mmSxP+Je1Trp
	pPQvc2OWEYwxyJAo9E5PyOEjmr8rLetKWwqnxkrwQpynMkakovANtKciKiV9uNRnofNl11oiSk+Sd
	4uUBaxh+Ui+YqC9m6z5xyN0WHPBg7nMqEWRrWMLYlA3IB90Q4Ikhx4PP9i1+Lra37ZQaZ+Txcr+9b
	8brGLYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLIh-0000000EDvu-2vYF;
	Thu, 16 Jan 2025 08:32:27 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLHR-0000000EDeE-0nZF;
	Thu, 16 Jan 2025 08:31:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YYbdq5KvLz1xmdl;
	Thu, 16 Jan 2025 16:30:07 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 95AE81401E9;
	Thu, 16 Jan 2025 16:31:01 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jan 2025 16:31:00 +0800
Message-ID: <ba569e5a-0b91-4032-b8c2-3d8c236cd245@huawei.com>
Date: Thu, 16 Jan 2025 16:30:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] mm: Support tlbbatch flush for a range of PTEs
To: Barry Song <21cnbao@gmail.com>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>
CC: <baolin.wang@linux.alibaba.com>, <chrisl@kernel.org>, <david@redhat.com>,
	<ioworker0@gmail.com>, <kasong@tencent.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <lorenzo.stoakes@oracle.com>,
	<ryan.roberts@arm.com>, <v-songbaohua@oppo.com>, <x86@kernel.org>,
	<ying.huang@intel.com>, <zhengtangquan@oppo.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Shaoqin Huang <shahuang@redhat.com>,
	Gavin Shan <gshan@redhat.com>, Mark Rutland <mark.rutland@arm.com>, "Kirill
 A. Shutemov" <kirill.shutemov@linux.intel.com>, Yosry Ahmed
	<yosryahmed@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yicong Yang
	<yangyicong@hisilicon.com>, Will Deacon <will@kernel.org>
References: <20250115033808.40641-1-21cnbao@gmail.com>
 <20250115033808.40641-3-21cnbao@gmail.com>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20250115033808.40641-3-21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_003109_560623_0AFD99FB 
X-CRM114-Status: GOOD (  24.35  )
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



On 2025/1/15 11:38, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This patch lays the groundwork for supporting batch PTE unmapping in
> try_to_unmap_one(). It introduces range handling for TLB batch flushing,
> with the range currently set to the size of PAGE_SIZE.
> 
> The function __flush_tlb_range_nosync() is architecture-specific and is
> only used within arch/arm64. This function requires the mm structure
> instead of the vma structure. To allow its reuse by
> arch_tlbbatch_add_pending(), which operates with mm but not vma, this
> patch modifies the argument of __flush_tlb_range_nosync() to take mm
> as its parameter.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Shaoqin Huang <shahuang@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Lance Yang <ioworker0@gmail.com>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Acked-by: Will Deacon <will@kernel.org>
> ---
>   arch/arm64/include/asm/tlbflush.h | 25 +++++++++++++------------
>   arch/arm64/mm/contpte.c           |  2 +-
>   arch/riscv/include/asm/tlbflush.h |  5 +++--
>   arch/riscv/mm/tlbflush.c          |  5 +++--
>   arch/x86/include/asm/tlbflush.h   |  5 +++--
>   mm/rmap.c                         | 12 +++++++-----
>   6 files changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index bc94e036a26b..98fbc8df7cf3 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -322,13 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>   	return true;
>   }
>   
> -static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> -					     struct mm_struct *mm,
> -					     unsigned long uaddr)
> -{
> -	__flush_tlb_page_nosync(mm, uaddr);
> -}
> -
>   /*
>    * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
>    * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
> @@ -448,7 +441,7 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>   	return false;
>   }
>   
> -static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
> +static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>   				     unsigned long start, unsigned long end,
>   				     unsigned long stride, bool last_level,
>   				     int tlb_level)
> @@ -460,12 +453,12 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>   	pages = (end - start) >> PAGE_SHIFT;
>   
>   	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> -		flush_tlb_mm(vma->vm_mm);
> +		flush_tlb_mm(mm);
>   		return;
>   	}
>   
>   	dsb(ishst);
> -	asid = ASID(vma->vm_mm);
> +	asid = ASID(mm);
>   
>   	if (last_level)
>   		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
> @@ -474,7 +467,7 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>   		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
>   				     tlb_level, true, lpa2_is_enabled());
>   
> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
> +	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>   }
>   
>   static inline void __flush_tlb_range(struct vm_area_struct *vma,
> @@ -482,7 +475,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>   				     unsigned long stride, bool last_level,
>   				     int tlb_level)
>   {
> -	__flush_tlb_range_nosync(vma, start, end, stride,
> +	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
>   				 last_level, tlb_level);
>   	dsb(ish);
>   }
> @@ -533,6 +526,14 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>   	dsb(ish);
>   	isb();
>   }
> +
> +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +		struct mm_struct *mm,
> +		unsigned long start,
> +		unsigned long end)

Only one line for arguments, same for other functions，

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> +{
> +	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
> +}
>   #endif
>   
>   #endif
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 55107d27d3f8..bcac4f55f9c1 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -335,7 +335,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>   		 * eliding the trailing DSB applies here.
>   		 */
>   		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> -		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
> +		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
>   					 PAGE_SIZE, true, 3);
>   	}
>   
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 72e559934952..e4c533691a7d 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -60,8 +60,9 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   
>   bool arch_tlbbatch_should_defer(struct mm_struct *mm);
>   void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> -			       struct mm_struct *mm,
> -			       unsigned long uaddr);
> +		struct mm_struct *mm,
> +		unsigned long start,
> +		unsigned long end);
>   void arch_flush_tlb_batched_pending(struct mm_struct *mm);
>   void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>   
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 9b6e86ce3867..6d6e8e7cc576 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -186,8 +186,9 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>   }
>   
>   void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> -			       struct mm_struct *mm,
> -			       unsigned long uaddr)
> +		struct mm_struct *mm,
> +		unsigned long start,
> +		unsigned long end)
>   {
>   	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
>   }
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 69e79fff41b8..2b511972d008 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -278,8 +278,9 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>   }
>   
>   static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> -					     struct mm_struct *mm,
> -					     unsigned long uaddr)
> +		struct mm_struct *mm,
> +		unsigned long start,
> +		unsigned long end)
>   {
>   	inc_mm_tlb_gen(mm);
>   	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> diff --git a/mm/rmap.c b/mm/rmap.c
> index de6b8c34e98c..abeb9fcec384 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -672,7 +672,8 @@ void try_to_unmap_flush_dirty(void)
>   	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
>   
>   static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
> -				      unsigned long uaddr)
> +		unsigned long start,
> +		unsigned long end)
>   {
>   	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>   	int batch;
> @@ -681,7 +682,7 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
>   	if (!pte_accessible(mm, pteval))
>   		return;
>   
> -	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
> +	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, start, end);
>   	tlb_ubc->flush_required = true;
>   
>   	/*
> @@ -757,7 +758,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>   }
>   #else
>   static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
> -				      unsigned long uaddr)
> +		unsigned long start,
> +		unsigned long end)
>   {
>   }
>   
> @@ -1792,7 +1794,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				 */
>   				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>   
> -				set_tlb_ubc_flush_pending(mm, pteval, address);
> +				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
>   			} else {
>   				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>   			}
> @@ -2164,7 +2166,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   				 */
>   				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>   
> -				set_tlb_ubc_flush_pending(mm, pteval, address);
> +				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
>   			} else {
>   				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>   			}


