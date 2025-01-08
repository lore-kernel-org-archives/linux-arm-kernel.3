Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF01DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Mr6Dl3c90TC0ugCj5cSJ87+hbG6R2W9QdyHaN19dbQ=; b=KCGecMiNsJ+hUtpO5o9W95v2Nt
	2veMcD8Av5cSkOAE749jVX8jSko6uVXblEaOFOT+NOjaGEynGtD0Lu9XbFqgZylKtvMXnFaZGC3U2
	knYSP4HvFkrBgikHTVAbcwL/vp9sUaxldWVeGlS4ZY3I2TzhNDEgqBBMRjtKvR9xRykF8pu/qebIR
	9bH1g49B0GIb6LL0WjKPOL4Es4xQoy3JOWv9MWhSTfkSnp4TWdlmBXjGce9329ozOmKBKTrgDybn+
	0Ellrars39LprnQz9v2NJlvpBBnBh36r+JB8Kioy6adXZ3BzIdEchb1bwFhx2MbyU8oTPw9Y+MVl7
	YzlfAm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTCx-00000007xzA-0tsv;
	Wed, 08 Jan 2025 10:22:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT2P-00000007vhO-3KTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:11:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB47213D5;
	Wed,  8 Jan 2025 02:12:10 -0800 (PST)
Received: from [10.162.16.95] (a077893.blr.arm.com [10.162.16.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D1833F59E;
	Wed,  8 Jan 2025 02:11:37 -0800 (PST)
Message-ID: <fbb134e0-cfeb-4c6e-98b4-d945f95383db@arm.com>
Date: Wed, 8 Jan 2025 15:41:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Catalin Marinas <catalin.marinas@arm.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 stable@vger.kernel.org
References: <20250107074252.1062127-1-quic_zhenhuah@quicinc.com>
 <Z31--x4unDHRU5Zo@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z31--x4unDHRU5Zo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_021145_930634_551C2CA3 
X-CRM114-Status: GOOD (  29.69  )
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

On 1/8/25 00:52, Catalin Marinas wrote:
> On Tue, Jan 07, 2025 at 03:42:52PM +0800, Zhenhua Huang wrote:
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index e2739b69e11b..5e0f514de870 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -42,9 +42,11 @@
>>  #include <asm/pgalloc.h>
>>  #include <asm/kfence.h>
>>  
>> -#define NO_BLOCK_MAPPINGS	BIT(0)
>> -#define NO_CONT_MAPPINGS	BIT(1)
>> -#define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>> +#define NO_PMD_BLOCK_MAPPINGS	BIT(0)
>> +#define NO_PUD_BLOCK_MAPPINGS	BIT(1)  /* Hotplug case: do not want block mapping for PUD */
>> +#define NO_BLOCK_MAPPINGS (NO_PMD_BLOCK_MAPPINGS | NO_PUD_BLOCK_MAPPINGS)
> 
> Nit: please use a tab instead of space before (NO_PMD_...)
> 
>> +#define NO_CONT_MAPPINGS	BIT(2)
>> +#define NO_EXEC_MAPPINGS	BIT(3)	/* assumes FEAT_HPDS is not used */
>>  
>>  u64 kimage_voffset __ro_after_init;
>>  EXPORT_SYMBOL(kimage_voffset);
>> @@ -254,7 +256,7 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>  
>>  		/* try section mapping first */
>>  		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
>> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>> +		    (flags & NO_PMD_BLOCK_MAPPINGS) == 0) {
>>  			pmd_set_huge(pmdp, phys, prot);
>>  
>>  			/*
>> @@ -356,10 +358,11 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>  
>>  		/*
>>  		 * For 4K granule only, attempt to put down a 1GB block
>> +		 * Hotplug case: do not attempt 1GB block
>>  		 */
> 
> I don't think we need this comment added here. The hotplug case is a
> decision of the caller, so better to have the comment there.

Agreed.

> 
>>  		if (pud_sect_supported() &&
>>  		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
>> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>> +		   (flags & NO_PUD_BLOCK_MAPPINGS) == 0) {
>>  			pud_set_huge(pudp, phys, prot);
> 
> Nit: something wrong with the alignment here. I think the unmodified
> line after the 'if' one above was misaligned before your patch.
> 
>>  
>>  			/*
>> @@ -1175,9 +1178,21 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>  		struct vmem_altmap *altmap)
>>  {
>> +	unsigned long start_pfn;
>> +	struct mem_section *ms;
>> +
>>  	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>  
>> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +	start_pfn = page_to_pfn((struct page *)start);
>> +	ms = __pfn_to_section(start_pfn);
> 
> Hmm, it would have been better if the core code provided the start pfn
> as it does for vmemmap_populate_compound_pages() but I'm fine with
> deducting it from 'start'.

Right, that will require changing arguments in generic vmemmap_populate(). 

> 
>> +	/*
>> +	 * Hotplugged section does not support hugepages as
>> +	 * PMD_SIZE (hence PUD_SIZE) section mapping covers
>> +	 * struct page range that exceeds a SUBSECTION_SIZE
>> +	 * i.e 2MB - for all available base page sizes.
>> +	 */
>> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
>>  		return vmemmap_populate_basepages(start, end, node, altmap);
>>  	else
>>  		return vmemmap_populate_hugepages(start, end, node, altmap);
>> @@ -1339,9 +1354,25 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  		    struct mhp_params *params)
>>  {
>>  	int ret, flags = NO_EXEC_MAPPINGS;
>> +	unsigned long start_pfn = page_to_pfn((struct page *)start);
>> +	struct mem_section *ms = __pfn_to_section(start_pfn);
> 
> This looks wrong. 'start' here is a physical address, you want
> PFN_DOWN() instead.

Agreed.

> 
>>  
>>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>  
>> +	/* should not be invoked by early section */
>> +	WARN_ON(early_section(ms));
>> +
>> +	/*
>> +	 * 4K base page's PMD_SIZE matches SUBSECTION_SIZE i.e 2MB. Hence
>> +	 * PMD section mapping can be allowed, but only for 4K base pages.
>> +	 * Where as PMD_SIZE (hence PUD_SIZE) for other page sizes exceed
>> +	 * SUBSECTION_SIZE.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +		flags |= NO_PUD_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> 
> In theory we can allow contiguous PTE mappings but not PMD. You could
> probably do the same as a NO_BLOCK_MAPPINGS and split it into multiple
> components - NO_PTE_CONT_MAPPINGS and so on.

That's a good idea.

> 
>> +	else
>> +		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> 
> Similarly with 16K/64K pages we can allow contiguous PTEs as they all go
> up to 2MB blocks.
> 
> I think we should write the flags setup in a more readable way than
> trying to do mental maths on the possible combinations, something like:
> 
> 	flags = NO_PUD_BLOCK_MAPPINGS | NO_PMD_CONT_MAPPINGS;
> 	if (SUBSECTION_SHIFT < PMD_SHIFT)
> 		flags |= NO_PMD_BLOCK_MAPPINGS;
> 	if (SUBSECTION_SHIFT < CONT_PTE_SHIFT)
> 		flags |= NO_PTE_CONT_MAPPINGS;

Just wondering why not start with PUD level itself ? Although SUBSECTION_SHIFT
might never reach the PUD level but this will help keep the flags calculations
bit simple and ready for all future changes.

	flags = 0;
 	if (SUBSECTION_SHIFT < PUD_SHIFT)
 		flags |= NO_PUD_BLOCK_MAPPINGS;
 	if (SUBSECTION_SHIFT < CONT_PMD_SHIFT)
 		flags |= NO_PMD_CONT_MAPPINGS;

> 
> This way we don't care about the page size and should cover any changes
> to SUBSECTION_SHIFT making it smaller than 2MB.
> 
Agreed.

