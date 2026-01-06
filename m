Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18209CDC19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcvExUnctubiECIn5Jnaut7G/LPBf2bHqztqfwIri2U=; b=p7I1KDPM9IeNthvnU3/5YxQkmV
	FwtG5cyzSTNRkUmwdxqgGaCfsPTYzbXnXO16Eh6k8/QKML0dFrjVqyHfA+hZBey9eOFFEqPq5Pc8F
	VQMmVrPvJ2gIFHIkC1l3SE5mkS/vFPJ6cjnXlaGjZV9hHIkaS+VuQzW6oOtPwY9g/WaA8SDiXPvyE
	SbHwtNvX7yCQq94WNAKE5njOl79vFlwj2PcHkCqH1aOlgNqUQCtO6QlqFdeRd2D5BtkOKTTGZG0oL
	WidCnLhG5BtOm4krjAP849yT+hKJ5qoiQbuJW4t8F/MQEY49Ir8r2ngUIPiBn/bYj+CS3ozpSCpHL
	sHaYvqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd794-0000000D6Vc-3WRk;
	Tue, 06 Jan 2026 13:30:46 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd791-0000000D6Uc-1PRT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767706232; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=xcvExUnctubiECIn5Jnaut7G/LPBf2bHqztqfwIri2U=;
	b=l9Gfo9Mq7L+WQK0CKfkUjgd/+dXlgHnDdnVgqdz5xetQXEmI9oHVSJDB/L3qZWVlSyPj6C7mtw4QE1NrnuuGltBHtuKL7UoAnDYfUENohNUWrNyeKPp2XJ8vCNkEvBqlxXYK3+OIRxSQvkD0nIxde6hlFoHqd28IN8RNfQII0lw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WwVo1-K_1767706220 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 06 Jan 2026 21:30:29 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jianpeng Chang <jianpeng.chang.cn@windriver.com>,  will@kernel.org,
  ardb@kernel.org,  anshuman.khandual@arm.com,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after
 pte_mkwrite_novma() change
In-Reply-To: <aVgUPNzXHHIBhh5A@arm.com> (Catalin Marinas's message of "Fri, 2
	Jan 2026 18:53:48 +0000")
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
	<aVgUPNzXHHIBhh5A@arm.com>
Date: Tue, 06 Jan 2026 21:30:23 +0800
Message-ID: <87344ig974.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_053044_332544_F8DD95F3 
X-CRM114-Status: GOOD (  32.89  )
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

Hi, Catalin,

Sorry for late reply.

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Thu, Dec 04, 2025 at 02:27:22PM +0800, Jianpeng Chang wrote:
>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>> prevents unnecessary dirty page marking in normal memory management paths,
>> it breaks kexec on some platforms like NXP LS1043.
>> 
>> The issue occurs in the kexec code path:
>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>    writable copy of the linear mapping
>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>    are writable for the new kernel image copying
>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>> 4. When kexec tries to copy the new kernel image through the linear
>>    mapping, it fails on read-only pages, causing the system to hang
>>    after "Bye!"
>> 
>> The same issue affects hibernation which uses the same trans_pgd code path.
>> 
>> Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
>> ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
>> hibernation, making all pages in the temporary mapping writable regardless
>> of their dirty state. This preserves the original commit's optimization
>> for normal memory management while fixing the kexec/hibernation regression.
>> 
>> Using pte_mkdirty() causes redundant bit operations when the page is
>> already writable (redundant PTE_RDONLY clearing), but this is acceptable
>> since it's not a hot path and only affects kexec/hibernation scenarios.
>> 
>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
>> ---
>> v3: 
>>   - Add the description about pte_mkdirty in commit message
>>   - Note that the redundant bit operations in commit message
>>   - Fix the comments following the suggestions
>> v2: https://lore.kernel.org/all/20251202022707.2720933-1-jianpeng.chang.cn@windriver.com/
>>   - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>>   - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
>> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
>> 
>>  arch/arm64/mm/trans_pgd.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>> index 18543b603c77..766883780d2a 100644
>> --- a/arch/arm64/mm/trans_pgd.c
>> +++ b/arch/arm64/mm/trans_pgd.c
>> @@ -40,8 +40,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>  		 * Resume will overwrite areas that may be marked
>>  		 * read only (code, rodata). Clear the RDONLY bit from
>>  		 * the temporary mappings we use during restore.
>> +		 *
>> +		 * For both kexec and hibernation, writable accesses are required
>> +		 * for all pages in the linear map to copy over new kernel image.
>> +		 * Hence mark these pages dirty first via pte_mkdirty() to ensure
>> +		 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
>> +		 * required write access for the pages.
>>  		 */
>> -		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
>> +		__set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>>  	} else if (!pte_none(pte)) {
>>  		/*
>>  		 * debug_pagealloc will removed the PTE_VALID bit if
>> @@ -57,7 +63,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>  		 */
>>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>>  
>> -		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>> +		/*
>> +		 * For both kexec and hibernation, writable accesses are required
>> +		 * for all pages in the linear map to copy over new kernel image.
>> +		 * Hence mark these pages dirty first via pte_mkdirty() to ensure
>> +		 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
>> +		 * required write access for the pages.
>> +		 */
>> +		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>>  	}
>>  }
>
> Looking through the history, in 4.16 commit 41acec624087 ("arm64: kpti:
> Make use of nG dependent on arm64_kernel_unmapped_at_el0()") simplified
> PAGE_KERNEL to only depend on PROT_NORMAL. All correct so far with
> PAGE_KERNEL still having PTE_DIRTY.
>
> Later on in 5.4, commit aa57157be69f ("arm64: Ensure VM_WRITE|VM_SHARED
> ptes are clean by default") dropped PTE_DIRTY from PROT_NORMAL. This
> wasn't an issue even with DBM disabled as we don't set PTE_RDONLY, so
> it's considered pte_hw_dirty() anyway.

Regardless of the kexec issue, I think that it's reasonable to set
PTE_DIRTY if PTE_WRITE and !PTE_RDONLY.  It's more consistent.

> Huang's commit you mentioned changed the assumptions above, so
> pte_mkwrite() no longer makes a read-only (kernel) pte fully writeable.
> This is fine for user mappings (either trap or DBM will make it fully
> writeable) but not for kernel mappings.
>
> Your commit above should work but I wonder whether it's better to go
> back to having the kernel mappings marked dirty irrespective of their
> permission:
>
> --------------8<---------------------------
>
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 161e8660eddd..113c257d19c4 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -50,11 +50,11 @@
>
>  #define _PAGE_DEFAULT		(_PROT_DEFAULT | PTE_ATTRINDX(MT_NORMAL))
>
> -#define _PAGE_KERNEL		(PROT_NORMAL)
> -#define _PAGE_KERNEL_RO		((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY)
> -#define _PAGE_KERNEL_ROX	((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY)
> -#define _PAGE_KERNEL_EXEC	(PROT_NORMAL & ~PTE_PXN)
> -#define _PAGE_KERNEL_EXEC_CONT	((PROT_NORMAL & ~PTE_PXN) | PTE_CONT)
> +#define _PAGE_KERNEL		(PROT_NORMAL | PTE_DIRTY)
> +#define _PAGE_KERNEL_RO		((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY | PTE_DIRTY)
> +#define _PAGE_KERNEL_ROX	((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY | PTE_DIRTY)

IMHO, it appears not absolutely natural to make read-only kernel mapping
dirty unconditionally.  However it should work.  I have no strong
opinions here too.

> +#define _PAGE_KERNEL_EXEC	((PROT_NORMAL & ~PTE_PXN) | PTE_DIRTY)
> +#define _PAGE_KERNEL_EXEC_CONT	((PROT_NORMAL & ~PTE_PXN) | PTE_CONT | PTE_DIRTY)
>
>  #define _PAGE_SHARED		(_PAGE_DEFAULT | PTE_USER | PTE_RDONLY | PTE_NG | PTE_PXN | PTE_UXN | PTE_WRITE)
>  #define _PAGE_SHARED_EXEC	(_PAGE_DEFAULT | PTE_USER | PTE_RDONLY | PTE_NG | PTE_PXN | PTE_WRITE)
> --------------8<---------------------------

---
Best Regards,
Huang, Ying

