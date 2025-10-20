Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD286CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h48VKldYNtXa/MN00+NnYPBXV8HoPhBppMeXQUpPGoA=; b=SCXHGkHIcK72U6iPtetJ75pZHA
	knbrEh7tZAGNkykxVE/E55Y8iiSKV9aDjLOeHvsi+SKvFX/gLBM6hQZEp5WbK36f4fKitEr0Lr4aN
	hh5kAT5bsLzWD+pSeklOcqGmjS5c7I5mL8dBmEofbm14EjeH6QpfK2j8dOrjLFaQp8AEkvgsUzOwF
	MY76P4gPCmx0+t5iVoUnB9k0+B+8ctt2UXrCdtJdgM9s2E15591hhST4xIiaVFtPjnvBVCrrZv0qF
	bDbLh6VC0EnAfc6vM0eRDDXBzaV0pzsw3wbmX6JSm6C+ExIeppprAgGzyeURjEyQZCC7Zf7fdmMdY
	1A++i4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfLX-0000000Bg97-3Ngn;
	Mon, 20 Oct 2025 02:10:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfLU-0000000Bg6d-1p8R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 02:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE071063;
	Sun, 19 Oct 2025 19:09:49 -0700 (PDT)
Received: from [10.163.38.187] (unknown [10.163.38.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 995013F7A6;
	Sun, 19 Oct 2025 19:09:54 -0700 (PDT)
Message-ID: <0e6d1f1f-a917-4e36-80de-03ba94c6d850@arm.com>
Date: Mon, 20 Oct 2025 07:39:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
To: Catalin Marinas <catalin.marinas@arm.com>,
 Huang Ying <ying.huang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Gavin Shan <gshan@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
 <aPKFmHg-FrkGJxWd@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aPKFmHg-FrkGJxWd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_191000_573087_58D21011 
X-CRM114-Status: GOOD (  27.64  )
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



On 17/10/25 11:36 PM, Catalin Marinas wrote:
> On Wed, Oct 15, 2025 at 10:37:12AM +0800, Huang Ying wrote:
>> Current pte_mkwrite_novma() makes PTE dirty unconditionally.  This may
>> mark some pages that are never written dirty wrongly.  For example,
>> do_swap_page() may map the exclusive pages with writable and clean PTEs
>> if the VMA is writable and the page fault is for read access.
>> However, current pte_mkwrite_novma() implementation always dirties the
>> PTE.  This may cause unnecessary disk writing if the pages are
>> never written before being reclaimed.
>>
>> So, change pte_mkwrite_novma() to clear the PTE_RDONLY bit only if the
>> PTE_DIRTY bit is set to make it possible to make the PTE writable and
>> clean.
>>
>> The current behavior was introduced in commit 73e86cb03cf2 ("arm64:
>> Move PTE_RDONLY bit handling out of set_pte_at()").  Before that,
>> pte_mkwrite() only sets the PTE_WRITE bit, while set_pte_at() only
>> clears the PTE_RDONLY bit if both the PTE_WRITE and the PTE_DIRTY bits
>> are set.
>>
>> To test the performance impact of the patch, on an arm64 server
>> machine, run 16 redis-server processes on socket 1 and 16
>> memtier_benchmark processes on socket 0 with mostly get
>> transactions (that is, redis-server will mostly read memory only).
>> The memory footprint of redis-server is larger than the available
>> memory, so swap out/in will be triggered.  Test results show that the
>> patch can avoid most swapping out because the pages are mostly clean.
>> And the benchmark throughput improves ~23.9% in the test.
>>
>> Fixes: 73e86cb03cf2 ("arm64: Move PTE_RDONLY bit handling out of set_pte_at()")
>> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Gavin Shan <gshan@redhat.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  arch/arm64/include/asm/pgtable.h | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index aa89c2e67ebc..0944e296dd4a 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -293,7 +293,8 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
>>  static inline pte_t pte_mkwrite_novma(pte_t pte)
>>  {
>>  	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>> -	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>> +	if (pte_sw_dirty(pte))
>> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>  	return pte;
>>  }
> 
> This seems to be the right thing. I recall years ago I grep'ed
> (obviously not hard enough) and most pte_mkwrite() places had a
> pte_mkdirty(). But I missed do_swap_page() and possibly others.
> 
> For this patch:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> I wonder whether we should also add (as a separate patch):
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 830107b6dd08..df1c552ef11c 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -101,6 +101,7 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
>  	WARN_ON(pte_dirty(pte_mkclean(pte_mkdirty(pte))));
>  	WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte, args->vma))));
>  	WARN_ON(pte_dirty(pte_wrprotect(pte_mkclean(pte))));
> +	WARN_ON(pte_dirty(pte_mkwrite_novma(pte_mkclean(pte))));
>  	WARN_ON(!pte_dirty(pte_wrprotect(pte_mkdirty(pte))));
>  }
> 
> For completeness, also (and maybe other combinations):
> 
> 	WARN_ON(!pte_write(pte_mkdirty(pte_mkwrite_novma(pte))));

Adding similar tests to pte_wrprotect().

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 830107b6dd08..573632ebf304 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -102,6 +102,11 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
        WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte, args->vma))));
        WARN_ON(pte_dirty(pte_wrprotect(pte_mkclean(pte))));
        WARN_ON(!pte_dirty(pte_wrprotect(pte_mkdirty(pte))));
+
+       WARN_ON(pte_dirty(pte_mkwrite_novma(pte_mkclean(pte))));
+       WARN_ON(!pte_write(pte_mkdirty(pte_mkwrite_novma(pte))));
+       WARN_ON(!pte_write(pte_mkwrite_novma(pte_wrprotect(pte))));
+       WARN_ON(pte_write(pte_wrprotect(pte_mkwrite_novma(pte))));
 }

 static void __init pte_advanced_tests(struct pgtable_debug_args *args)
@@ -195,6 +200,9 @@ static void __init pmd_basic_tests(struct pgtable_debug_args *args, int idx)
        WARN_ON(pmd_write(pmd_wrprotect(pmd_mkwrite(pmd, args->vma))));
        WARN_ON(pmd_dirty(pmd_wrprotect(pmd_mkclean(pmd))));
        WARN_ON(!pmd_dirty(pmd_wrprotect(pmd_mkdirty(pmd))));
+
+       WARN_ON(!pmd_write(pmd_mkwrite_novma(pmd_wrprotect(pmd))));
+       WARN_ON(pmd_write(pmd_wrprotect(pmd_mkwrite_novma(pmd))));
        /*
         * A huge page does not point to next level page table
         * entry. Hence this must qualify as pmd_bad().
> 
> I cc'ed linux-mm in case we missed anything. If nothing raised, I'll
> queue it next week.
> 
> Thanks.
> 


