Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3203AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUIpcEC4TM+kELVJUpyhpFBd8j2jrm6anGOOdFHUNyE=; b=23mmk/D5Trx0aA1MihAV8syFix
	4+TTROS7/SIn/dYeHyozDOUxNCswyLpGvy+fk1y1Wqz4S5O+V7xLLTqGauEJJiwowa9oQpZUO207H
	wGg3fccnvB0PBn0sx/0Ms5jEp5PDzBRFp8D6XL8EI7eA9RP8MVgWu6muqOEWMimfydckYK3Pgbot9
	hHdTeSxzi5JBD0uV+naOYZdYZ7tIy6mvvR1erUl/l+VrlSAKs5vvTRIq1YoEfu5S9/1fvuVNyDlLB
	R+A0dAHTSaze21iHI9bUuCMxkXrAbyqOGpA/BKXJnoU3xTlCWBuXpC9rL7fb6ADxXlKHgk4X/+blF
	avWBg4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTvE-0000000DhTd-1PEa;
	Fri, 07 Mar 2025 09:23:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTtA-0000000Dgj7-1i6B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:21:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 451521477;
	Fri,  7 Mar 2025 01:21:16 -0800 (PST)
Received: from [10.162.42.6] (a077893.blr.arm.com [10.162.42.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03DC93F66E;
	Fri,  7 Mar 2025 01:20:59 -0800 (PST)
Message-ID: <c3dddb6f-dce1-45a6-b5f1-1fd247c510ab@arm.com>
Date: Fri, 7 Mar 2025 14:50:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Define PTE_SHIFT
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
References: <20250307050851.4034393-1-anshuman.khandual@arm.com>
 <17931f83-7142-4ca6-8bfe-466ec53b6e2c@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <17931f83-7142-4ca6-8bfe-466ec53b6e2c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_012104_545549_8A1889E5 
X-CRM114-Status: GOOD (  22.12  )
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



On 3/7/25 14:37, Ryan Roberts wrote:
> On 07/03/2025 05:08, Anshuman Khandual wrote:
>> Address bytes shifted with a single 64 bit page table entry (any page table
>> level) has been always hard coded as 3 (aka 2^3 = 8). Although intuitive it
>> is not very readable or easy to reason about. Besides it is going to change
>> with D128, where each 128 bit page table entry will shift address bytes by
>> 4 (aka 2^4 = 16) instead.
>>
>> Let's just formalise this address bytes shift value into a new macro called
>> PTE_SHIFT establishing a logical abstraction, thus improving readability as
>> well. This does not cause any functional change.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
>> Cc: Alexander Potapenko <glider@google.com>
>> Cc: Andrey Konovalov <andreyknvl@gmail.com>
>> Cc: Dmitry Vyukov <dvyukov@google.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kasan-dev@googlegroups.com
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> 
> +1 for PTDESC_ORDER

Alright.

> 
> Implementation looks good to me so:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks !

> 
> one nit below.
> 
>> ---
>> This patch applies on v6.14-rc5
>>
>>  arch/arm64/Kconfig                      |  2 +-
>>  arch/arm64/include/asm/kernel-pgtable.h |  3 ++-
>>  arch/arm64/include/asm/pgtable-hwdef.h  | 26 +++++++++++++------------
>>  arch/arm64/kernel/pi/map_range.c        |  2 +-
>>  arch/arm64/mm/kasan_init.c              |  6 +++---
>>  5 files changed, 21 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 940343beb3d4..fd3303f2ccda 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -323,7 +323,7 @@ config ARCH_MMAP_RND_BITS_MIN
>>  	default 18
>>  
>>  # max bits determined by the following formula:
>> -#  VA_BITS - PAGE_SHIFT - 3
>> +#  VA_BITS - PAGE_SHIFT - PTE_SHIFT
>>  config ARCH_MMAP_RND_BITS_MAX
>>  	default 19 if ARM64_VA_BITS=36
>>  	default 24 if ARM64_VA_BITS=39
>> diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
>> index fd5a08450b12..7150a7a10f00 100644
>> --- a/arch/arm64/include/asm/kernel-pgtable.h
>> +++ b/arch/arm64/include/asm/kernel-pgtable.h
>> @@ -49,7 +49,8 @@
>>  	(SPAN_NR_ENTRIES(vstart, vend, shift) + (add))
>>  
>>  #define EARLY_LEVEL(lvl, lvls, vstart, vend, add)	\
>> -	(lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * (PAGE_SHIFT - 3), add) : 0)
>> +	(lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + \
>> +	lvl * (PAGE_SHIFT - PTE_SHIFT), add) : 0)
> 
> nit: not sure what style guide says, but I would indent this continuation an
> extra level.

IIUC - An indentation is not normally required with a line continuation although
the starting letter should match the starting letter in the line above but after
the '(' (if any).

> 
> Thanks,
> Ryan
> 
>>  
>>  #define EARLY_PAGES(lvls, vstart, vend, add) (1 	/* PGDIR page */				\
>>  	+ EARLY_LEVEL(3, (lvls), (vstart), (vend), add) /* each entry needs a next level page table */	\
>> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
>> index a9136cc551cc..43f98eac7653 100644
>> --- a/arch/arm64/include/asm/pgtable-hwdef.h
>> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
>> @@ -7,40 +7,42 @@
>>  
>>  #include <asm/memory.h>
>>  
>> +#define PTE_SHIFT 3
>> +
>>  /*
>>   * Number of page-table levels required to address 'va_bits' wide
>>   * address, without section mapping. We resolve the top (va_bits - PAGE_SHIFT)
>> - * bits with (PAGE_SHIFT - 3) bits at each page table level. Hence:
>> + * bits with (PAGE_SHIFT - PTE_SHIFT) bits at each page table level. Hence:
>>   *
>> - *  levels = DIV_ROUND_UP((va_bits - PAGE_SHIFT), (PAGE_SHIFT - 3))
>> + *  levels = DIV_ROUND_UP((va_bits - PAGE_SHIFT), (PAGE_SHIFT - PTE_SHIFT))
>>   *
>>   * where DIV_ROUND_UP(n, d) => (((n) + (d) - 1) / (d))
>>   *
>>   * We cannot include linux/kernel.h which defines DIV_ROUND_UP here
>>   * due to build issues. So we open code DIV_ROUND_UP here:
>>   *
>> - *	((((va_bits) - PAGE_SHIFT) + (PAGE_SHIFT - 3) - 1) / (PAGE_SHIFT - 3))
>> + *	((((va_bits) - PAGE_SHIFT) + (PAGE_SHIFT - PTE_SHIFT) - 1) / (PAGE_SHIFT - PTE_SHIFT))
>>   *
>>   * which gets simplified as :
>>   */
>> -#define ARM64_HW_PGTABLE_LEVELS(va_bits) (((va_bits) - 4) / (PAGE_SHIFT - 3))
>> +#define ARM64_HW_PGTABLE_LEVELS(va_bits) (((va_bits) - PTE_SHIFT - 1) / (PAGE_SHIFT - PTE_SHIFT))
>>  
>>  /*
>>   * Size mapped by an entry at level n ( -1 <= n <= 3)
>> - * We map (PAGE_SHIFT - 3) at all translation levels and PAGE_SHIFT bits
>> + * We map (PAGE_SHIFT - PTE_SHIFT) at all translation levels and PAGE_SHIFT bits
>>   * in the final page. The maximum number of translation levels supported by
>>   * the architecture is 5. Hence, starting at level n, we have further
>>   * ((4 - n) - 1) levels of translation excluding the offset within the page.
>>   * So, the total number of bits mapped by an entry at level n is :
>>   *
>> - *  ((4 - n) - 1) * (PAGE_SHIFT - 3) + PAGE_SHIFT
>> + *  ((4 - n) - 1) * (PAGE_SHIFT - PTE_SHIFT) + PAGE_SHIFT
>>   *
>>   * Rearranging it a bit we get :
>> - *   (4 - n) * (PAGE_SHIFT - 3) + 3
>> + *   (4 - n) * (PAGE_SHIFT - PTE_SHIFT) + PTE_SHIFT
>>   */
>> -#define ARM64_HW_PGTABLE_LEVEL_SHIFT(n)	((PAGE_SHIFT - 3) * (4 - (n)) + 3)
>> +#define ARM64_HW_PGTABLE_LEVEL_SHIFT(n)	((PAGE_SHIFT - PTE_SHIFT) * (4 - (n)) + PTE_SHIFT)
>>  
>> -#define PTRS_PER_PTE		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_PTE		(1 << (PAGE_SHIFT - PTE_SHIFT))
>>  
>>  /*
>>   * PMD_SHIFT determines the size a level 2 page table entry can map.
>> @@ -49,7 +51,7 @@
>>  #define PMD_SHIFT		ARM64_HW_PGTABLE_LEVEL_SHIFT(2)
>>  #define PMD_SIZE		(_AC(1, UL) << PMD_SHIFT)
>>  #define PMD_MASK		(~(PMD_SIZE-1))
>> -#define PTRS_PER_PMD		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_PMD		(1 << (PAGE_SHIFT - PTE_SHIFT))
>>  #endif
>>  
>>  /*
>> @@ -59,14 +61,14 @@
>>  #define PUD_SHIFT		ARM64_HW_PGTABLE_LEVEL_SHIFT(1)
>>  #define PUD_SIZE		(_AC(1, UL) << PUD_SHIFT)
>>  #define PUD_MASK		(~(PUD_SIZE-1))
>> -#define PTRS_PER_PUD		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_PUD		(1 << (PAGE_SHIFT - PTE_SHIFT))
>>  #endif
>>  
>>  #if CONFIG_PGTABLE_LEVELS > 4
>>  #define P4D_SHIFT		ARM64_HW_PGTABLE_LEVEL_SHIFT(0)
>>  #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
>>  #define P4D_MASK		(~(P4D_SIZE-1))
>> -#define PTRS_PER_P4D		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_P4D		(1 << (PAGE_SHIFT - PTE_SHIFT))
>>  #endif
>>  
>>  /*
>> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
>> index 2b69e3beeef8..3530a5427f57 100644
>> --- a/arch/arm64/kernel/pi/map_range.c
>> +++ b/arch/arm64/kernel/pi/map_range.c
>> @@ -31,7 +31,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>>  {
>>  	u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 : U64_MAX;
>>  	pteval_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
>> -	int lshift = (3 - level) * (PAGE_SHIFT - 3);
>> +	int lshift = (3 - level) * (PAGE_SHIFT - PTE_SHIFT);
>>  	u64 lmask = (PAGE_SIZE << lshift) - 1;
>>  
>>  	start	&= PAGE_MASK;
>> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
>> index b65a29440a0c..90548079b42e 100644
>> --- a/arch/arm64/mm/kasan_init.c
>> +++ b/arch/arm64/mm/kasan_init.c
>> @@ -190,7 +190,7 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
>>   */
>>  static bool __init root_level_aligned(u64 addr)
>>  {
>> -	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 1) * (PAGE_SHIFT - 3);
>> +	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 1) * (PAGE_SHIFT - PTE_SHIFT);
>>  
>>  	return (addr % (PAGE_SIZE << shift)) == 0;
>>  }
>> @@ -245,7 +245,7 @@ static int __init root_level_idx(u64 addr)
>>  	 */
>>  	u64 vabits = IS_ENABLED(CONFIG_ARM64_64K_PAGES) ? VA_BITS
>>  							: vabits_actual;
>> -	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits) - 1) * (PAGE_SHIFT - 3);
>> +	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits) - 1) * (PAGE_SHIFT - PTE_SHIFT);
>>  
>>  	return (addr & ~_PAGE_OFFSET(vabits)) >> (shift + PAGE_SHIFT);
>>  }
>> @@ -269,7 +269,7 @@ static void __init clone_next_level(u64 addr, pgd_t *tmp_pg_dir, pud_t *pud)
>>   */
>>  static int __init next_level_idx(u64 addr)
>>  {
>> -	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 2) * (PAGE_SHIFT - 3);
>> +	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 2) * (PAGE_SHIFT - PTE_SHIFT);
>>  
>>  	return (addr >> (shift + PAGE_SHIFT)) % PTRS_PER_PTE;
>>  }
> 

