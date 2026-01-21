Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A8C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuFdmIRnCWZxEyNL+CscDoyUzORtsrI8Gl99JqU3laE=; b=tDwZiJLKdo5WP0Q5HUri7TpoJX
	VDSL7cj9AJUaZt/hS/boQ65VrBUkgrHjzvyKvF8bvMfjAIfQID7wBwN/hbOnXOL+LWu/hfpXCOWJn
	7GrCyHVimouxJUU88Zfx//k6SmXzu5/DlrgEc3Nugt/mfwJnPRHhVa2ZodQyVtqInAduQGiaDy/KA
	7RpU/LEX08VReTMxzxUwZUe1piFnOkeiJ9N+nZ64WFdXRY57z38Imnc8vv/A9yfBL/x+uuyQaVodQ
	SO+ICPHNSBblzfrt5eQ4qadCk/DtskICWBQhgPOHTyVUa1FainwJC1ZGD8aOHgjLd8anGcbbOqOL0
	FDgLbb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibvq-00000005rh6-0rG8;
	Wed, 21 Jan 2026 17:23:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibvo-00000005rgw-2ilZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Jan 2026 17:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RuFdmIRnCWZxEyNL+CscDoyUzORtsrI8Gl99JqU3laE=; b=Su40VqxSKegsQo4gdqGxHUIWec
	kqvsum3dWGj8WF8Kn3rmP4amBPw7OD1bDkErEtpYrRnVcJd1nrsKqGZd0ps9b7pMK7AcY3+VYwYP1
	QbbTkPF5UU7lM5PZX3lL/mwpIdGjUrWvIN3rDFVQgCYmPh9FDBZzjHqcHVZ92e6gnEilJD4DkgP83
	3WW/xT458Gt07OP5VQWi1l4rxpIUBskoFxEqjOzuqd78/toLpE8qEJcOiRqmmUAlbMbxuzrQuTm4m
	fJFsGbKXIBbHGOsGiAO70Zr5JWTJZCZ9kEk/iZ3H/hlUIvY9TzeTexTTUvWzF8k2olnf4uN/QPzkY
	63Qi76uQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibvj-0000000GU8p-0pZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 17:23:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4087A1476;
	Wed, 21 Jan 2026 09:23:17 -0800 (PST)
Received: from [10.1.25.175] (XHFQ2J9959.cambridge.arm.com [10.1.25.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFAD03F632;
	Wed, 21 Jan 2026 09:23:22 -0800 (PST)
Message-ID: <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
Date: Wed, 21 Jan 2026 17:23:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aWZYXhrT6D2M-7-N@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_172343_609739_DE693094 
X-CRM114-Status: GOOD (  40.65  )
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

On 13/01/2026 14:36, Will Deacon wrote:
> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:	   94792 kB
>> DirectMap64K:	  134208 kB
>> DirectMap2M:	 1173504 kB
>> DirectMap32M:	 5636096 kB
>> DirectMap1G:	529530880 kB
>>
>> Although just the machines which support BBML2_NOABORT can split the
>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>> that the users have consistent view in order to avoid confusion.
>>
>> Although ptdump also can tell the direct map use, but it needs to dump
>> the whole kernel page table. It is costly and overkilling. It is also
>> in debugfs which may not be enabled by all distros. So showing direct
>> map use in /proc/meminfo seems more convenient and has less overhead.
>>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> v5: * Rebased to v6.19-rc4
>>     * Fixed the build error for !CONFIG_PROC_FS
>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>     * Used shorter name for the helpers and variables per Ryan
>>     * Fixed accounting for memory hotunplug
>> v3: * Fixed the over-accounting problems per Ryan
>>     * Introduced helpers for add/sub direct map use and #ifdef them with
>>       CONFIG_PROC_FS per Ryan
>>     * v3 is a fix patch on top of v2
>> v2: * Counted in size instead of the number of entries per Ryan
>>     * Removed shift array per Ryan
>>     * Use lower case "k" per Ryan
>>     * Fixed a couple of build warnings reported by kernel test robot
>>     * Fixed a couple of poential miscounts
>>
>>  arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 181 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8e1d80a7033e..422441c9a992 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -29,6 +29,7 @@
>>  #include <linux/mm_inline.h>
>>  #include <linux/pagewalk.h>
>>  #include <linux/stop_machine.h>
>> +#include <linux/proc_fs.h>
>>  
>>  #include <asm/barrier.h>
>>  #include <asm/cputype.h>
>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>  	dsb(ishst);
>>  }
>>  
>> +enum dm_type {
>> +	PTE,
>> +	CONT_PTE,
>> +	PMD,
>> +	CONT_PMD,
>> +	PUD,
>> +	NR_DM_TYPE,
>> +};
>> +
>> +#ifdef CONFIG_PROC_FS
>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>> +
>> +void arch_report_meminfo(struct seq_file *m)
>> +{
>> +	char *size[NR_DM_TYPE];
> 
> const?
> 
>> +
>> +#if defined(CONFIG_ARM64_4K_PAGES)
>> +	size[PTE] = "4k";
>> +	size[CONT_PTE] = "64k";
>> +	size[PMD] = "2M";
>> +	size[CONT_PMD] = "32M";
>> +	size[PUD] = "1G";
>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>> +	size[PTE] = "16k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "32M";
>> +	size[CONT_PMD] = "1G";
>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>> +	size[PTE] = "64k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "512M";
>> +	size[CONT_PMD] = "16G";
>> +#endif
>> +
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PTE], dm_meminfo[PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PTE],
>> +			dm_meminfo[CONT_PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PMD], dm_meminfo[PMD] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PMD],
>> +			dm_meminfo[CONT_PMD] >> 10);
>> +	if (pud_sect_supported())
>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PUD], dm_meminfo[PUD] >> 10);
> 
> This seems a bit brittle to me. If somebody adds support for l1 block
> mappings for !4k pages in future, they will forget to update this and
> we'll end up returning kernel stack in /proc/meminfo afaict.
> 
>> +static inline bool is_dm_addr(unsigned long addr)
>> +{
>> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>> +}
>> +
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] += size;
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] -= size;
>> +}
>> +#else
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +#endif
>> +
>>  static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>  		     phys_addr_t phys, pgprot_t prot)
>>  {
>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>  
>>  		init_pte(ptep, addr, next, phys, __prot);
>>  
>> +		if (pgprot_val(__prot) & PTE_CONT)
>> +			dm_meminfo_add(addr, (next - addr), CONT_PTE);
>> +		else
>> +			dm_meminfo_add(addr, (next - addr), PTE);
>> +
>>  		ptep += pte_index(next) - pte_index(addr);
>>  		phys += next - addr;
>>  	} while (addr = next, addr != end);
>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>  		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>  			pmd_set_huge(pmdp, phys, prot);
>>  
>> +			/*
>> +			 * It is possible to have mappings allow cont mapping
>> +			 * but disallow block mapping. For example,
>> +			 * map_entry_trampoline().
>> +			 * So we have to increase CONT_PMD and PMD size here
>> +			 * to avoid double counting.
>> +			 */
>> +			if (pgprot_val(prot) & PTE_CONT)
>> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
>> +			else
>> +				dm_meminfo_add(addr, (next - addr), PMD);
> 
> I don't understand the comment you're adding here. If somebody passes
> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
> level 3.
> 
> It also doesn't look you handle the error case properly when the mapping
> fails.
> 
>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>  				    unsigned long end, bool free_mapped,
>>  				    struct vmem_altmap *altmap)
>>  {
>> -	pte_t *ptep, pte;
>> +	pte_t pte;
>>  
>>  	do {
>> -		ptep = pte_offset_kernel(pmdp, addr);
>>  		pte = __ptep_get(ptep);
>>  		if (pte_none(pte))
>>  			continue;
>>  
>>  		WARN_ON(!pte_present(pte));
>>  		__pte_clear(&init_mm, addr, ptep);
>> +		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>  		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>  		if (free_mapped)
>>  			free_hotplug_page_range(pte_page(pte),
>>  						PAGE_SIZE, altmap);
> 
> Is the existing code correct for contiguous entries here? I'd have
> thought that we'd need to make the range non-contiguous before knocking
> out the TLB.

The Arm ARM has this, which makes me think you are probably correct:

IVNXYF:
The architecture does not require descriptors with the Contiguous bit set to 1
to be cached as a single TLB entry for the contiguous region. To avoid TLB
coherency issues, software is required to perform TLB maintenance on the entire
address region that results from using the Contiguous bit.

I've asked for clarification internally. But I think we should hoist out the tlb
flush regardless because it will be faster if we just invalidate a single range.
I can handle that as a separate patch if you like.


However, I think there may be another problem; IIUC, any old range of memory can
be hot-unplugged as long as it is section aligned. It doesn't have to be the
same range that was previously hot-plugged. But if the linear map is block
mapped, the range being unplugged may cover a partial block mapping.

For example, with 4K pages, the section size is 128M, so you could hot unmap
128M from a PUD leaf mapping (1G). What am I missing that means this doesn't go
bang?

This would have been an issue for the non-rodata-full config so predates the
work to split the linear map dynamically. I'm not really sure how to solve this
for systems without BBML2 but without non--rodata-full.

I must be misunderstanding something crucial here... I'll dig some more.

Thanks,
Ryan



> 
> Will


