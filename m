Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DB6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGIUDpOjLBglWb8WEnUCJJvOLNIyDF4znjZoN8YXDwM=; b=jgFnmRkYosWSo6/Gxbt4yQEQIN
	/yl6aBHB0FwNbHPo8J6iXQLU028YWKUD7BVI1+JTU2BjRPuB1XqyOYn+8LtLOwTC8fofmEur0kNH6
	oRYrRp0h2+DZuXyjGnpcOyIe2q34+b/Vge7OBl6gPZGnsoI54yqrBP67Af2c+wOv+vKaqpiTxxziD
	RZ8oNQ39tc67QRgR/xSHNp98cSdaSfP1TbAtlRS6FGJy6sFJhfUgaCz+G0q9OzTsx6fIWd3RU12xP
	tr6vQfYd5bn9bLncaWQcuRqRcUyXNpn/4nPx6pM0kC8Dd7PfcnJhPpwNqSxMDdoD012qIElQTsEkQ
	1iKxGaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traW5-00000002H4C-2kMi;
	Mon, 10 Mar 2025 10:37:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traRi-00000002GYg-3a0g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:33:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88F4E153B;
	Mon, 10 Mar 2025 03:33:29 -0700 (PDT)
Received: from [10.163.42.69] (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F0DB3F673;
	Mon, 10 Mar 2025 03:33:13 -0700 (PDT)
Message-ID: <68188aa1-8f80-4f91-beb5-9ddb0129a490@arm.com>
Date: Mon, 10 Mar 2025 16:03:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Define PTDESC_ORDER
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
References: <20250310040115.91298-1-anshuman.khandual@arm.com>
 <Z86-34-fgk7iskX_@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z86-34-fgk7iskX_@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_033318_986772_70797547 
X-CRM114-Status: GOOD (  15.04  )
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



On 3/10/25 15:58, Mark Rutland wrote:
> On Mon, Mar 10, 2025 at 09:31:15AM +0530, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
>> index fd5a08450b12..78c7e03a0e35 100644
>> --- a/arch/arm64/include/asm/kernel-pgtable.h
>> +++ b/arch/arm64/include/asm/kernel-pgtable.h
>> @@ -45,11 +45,14 @@
>>  #define SPAN_NR_ENTRIES(vstart, vend, shift) \
>>  	((((vend) - 1) >> (shift)) - ((vstart) >> (shift)) + 1)
>>  
>> -#define EARLY_ENTRIES(vstart, vend, shift, add) \
>> -	(SPAN_NR_ENTRIES(vstart, vend, shift) + (add))
>> +/* Number of VA bits resolved by a single translation table level */
>> +#define PTDESC_TABLE_SHIFT	(PAGE_SHIFT - PTDESC_ORDER)
> 
> To be clear, when I suggested adding PTDESC_TABLE_SHIFT, I expected that
> it would be used consistently in place of (PAGE_SHIFT - PTDESC_ORDER),
> and not only replacing that within the EARLY_ENTRIES() macro
> specifically.

I had that dilemma as well but alright, will respin this once more.

> 
> Mark.
> 
>> -#define EARLY_LEVEL(lvl, lvls, vstart, vend, add)	\
>> -	(lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * (PAGE_SHIFT - 3), add) : 0)
>> +#define EARLY_ENTRIES(lvl, vstart, vend) \
>> +	SPAN_NR_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * PTDESC_TABLE_SHIFT)
>> +
>> +#define EARLY_LEVEL(lvl, lvls, vstart, vend, add) \
>> +	((lvls) > (lvl) ? EARLY_ENTRIES(lvl, vstart, vend) + (add) : 0)
>>  
>>  #define EARLY_PAGES(lvls, vstart, vend, add) (1 	/* PGDIR page */				\
>>  	+ EARLY_LEVEL(3, (lvls), (vstart), (vend), add) /* each entry needs a next level page table */	\
>> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
>> index a9136cc551cc..3c544edc3968 100644
>> --- a/arch/arm64/include/asm/pgtable-hwdef.h
>> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
>> @@ -7,40 +7,43 @@
>>  
>>  #include <asm/memory.h>
>>  
>> +#define PTDESC_ORDER 3
>> +
>>  /*
>>   * Number of page-table levels required to address 'va_bits' wide
>>   * address, without section mapping. We resolve the top (va_bits - PAGE_SHIFT)
>> - * bits with (PAGE_SHIFT - 3) bits at each page table level. Hence:
>> + * bits with (PAGE_SHIFT - PTDESC_ORDER) bits at each page table level. Hence:
>>   *
>> - *  levels = DIV_ROUND_UP((va_bits - PAGE_SHIFT), (PAGE_SHIFT - 3))
>> + *  levels = DIV_ROUND_UP((va_bits - PAGE_SHIFT), (PAGE_SHIFT - PTDESC_ORDER))
>>   *
>>   * where DIV_ROUND_UP(n, d) => (((n) + (d) - 1) / (d))
>>   *
>>   * We cannot include linux/kernel.h which defines DIV_ROUND_UP here
>>   * due to build issues. So we open code DIV_ROUND_UP here:
>>   *
>> - *	((((va_bits) - PAGE_SHIFT) + (PAGE_SHIFT - 3) - 1) / (PAGE_SHIFT - 3))
>> + *	((((va_bits) - PAGE_SHIFT) + (PAGE_SHIFT - PTDESC_ORDER) - 1) / (PAGE_SHIFT - PTDESC_ORDER))
>>   *
>>   * which gets simplified as :
>>   */
>> -#define ARM64_HW_PGTABLE_LEVELS(va_bits) (((va_bits) - 4) / (PAGE_SHIFT - 3))
>> +#define ARM64_HW_PGTABLE_LEVELS(va_bits) \
>> +	(((va_bits) - PTDESC_ORDER - 1) / (PAGE_SHIFT - PTDESC_ORDER))
>>  
>>  /*
>>   * Size mapped by an entry at level n ( -1 <= n <= 3)
>> - * We map (PAGE_SHIFT - 3) at all translation levels and PAGE_SHIFT bits
>> + * We map (PAGE_SHIFT - PTDESC_ORDER) at all translation levels and PAGE_SHIFT bits
>>   * in the final page. The maximum number of translation levels supported by
>>   * the architecture is 5. Hence, starting at level n, we have further
>>   * ((4 - n) - 1) levels of translation excluding the offset within the page.
>>   * So, the total number of bits mapped by an entry at level n is :
>>   *
>> - *  ((4 - n) - 1) * (PAGE_SHIFT - 3) + PAGE_SHIFT
>> + *  ((4 - n) - 1) * (PAGE_SHIFT - PTDESC_ORDER) + PAGE_SHIFT
>>   *
>>   * Rearranging it a bit we get :
>> - *   (4 - n) * (PAGE_SHIFT - 3) + 3
>> + *   (4 - n) * (PAGE_SHIFT - PTDESC_ORDER) + PTDESC_ORDER
>>   */
>> -#define ARM64_HW_PGTABLE_LEVEL_SHIFT(n)	((PAGE_SHIFT - 3) * (4 - (n)) + 3)
>> +#define ARM64_HW_PGTABLE_LEVEL_SHIFT(n)	((PAGE_SHIFT - PTDESC_ORDER) * (4 - (n)) + PTDESC_ORDER)
>>  
>> -#define PTRS_PER_PTE		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_PTE		(1 << (PAGE_SHIFT - PTDESC_ORDER))
>>  
>>  /*
>>   * PMD_SHIFT determines the size a level 2 page table entry can map.
>> @@ -49,7 +52,7 @@
>>  #define PMD_SHIFT		ARM64_HW_PGTABLE_LEVEL_SHIFT(2)
>>  #define PMD_SIZE		(_AC(1, UL) << PMD_SHIFT)
>>  #define PMD_MASK		(~(PMD_SIZE-1))
>> -#define PTRS_PER_PMD		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_PMD		(1 << (PAGE_SHIFT - PTDESC_ORDER))
>>  #endif
>>  
>>  /*
>> @@ -59,14 +62,14 @@
>>  #define PUD_SHIFT		ARM64_HW_PGTABLE_LEVEL_SHIFT(1)
>>  #define PUD_SIZE		(_AC(1, UL) << PUD_SHIFT)
>>  #define PUD_MASK		(~(PUD_SIZE-1))
>> -#define PTRS_PER_PUD		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_PUD		(1 << (PAGE_SHIFT - PTDESC_ORDER))
>>  #endif
>>  
>>  #if CONFIG_PGTABLE_LEVELS > 4
>>  #define P4D_SHIFT		ARM64_HW_PGTABLE_LEVEL_SHIFT(0)
>>  #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
>>  #define P4D_MASK		(~(P4D_SIZE-1))
>> -#define PTRS_PER_P4D		(1 << (PAGE_SHIFT - 3))
>> +#define PTRS_PER_P4D		(1 << (PAGE_SHIFT - PTDESC_ORDER))
>>  #endif
>>  
>>  /*
>> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
>> index 2b69e3beeef8..f74335e13929 100644
>> --- a/arch/arm64/kernel/pi/map_range.c
>> +++ b/arch/arm64/kernel/pi/map_range.c
>> @@ -31,7 +31,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>>  {
>>  	u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 : U64_MAX;
>>  	pteval_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
>> -	int lshift = (3 - level) * (PAGE_SHIFT - 3);
>> +	int lshift = (3 - level) * (PAGE_SHIFT - PTDESC_ORDER);
>>  	u64 lmask = (PAGE_SIZE << lshift) - 1;
>>  
>>  	start	&= PAGE_MASK;
>> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
>> index b65a29440a0c..211821f80571 100644
>> --- a/arch/arm64/mm/kasan_init.c
>> +++ b/arch/arm64/mm/kasan_init.c
>> @@ -190,7 +190,7 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
>>   */
>>  static bool __init root_level_aligned(u64 addr)
>>  {
>> -	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 1) * (PAGE_SHIFT - 3);
>> +	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 1) * (PAGE_SHIFT - PTDESC_ORDER);
>>  
>>  	return (addr % (PAGE_SIZE << shift)) == 0;
>>  }
>> @@ -245,7 +245,7 @@ static int __init root_level_idx(u64 addr)
>>  	 */
>>  	u64 vabits = IS_ENABLED(CONFIG_ARM64_64K_PAGES) ? VA_BITS
>>  							: vabits_actual;
>> -	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits) - 1) * (PAGE_SHIFT - 3);
>> +	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits) - 1) * (PAGE_SHIFT - PTDESC_ORDER);
>>  
>>  	return (addr & ~_PAGE_OFFSET(vabits)) >> (shift + PAGE_SHIFT);
>>  }
>> @@ -269,7 +269,7 @@ static void __init clone_next_level(u64 addr, pgd_t *tmp_pg_dir, pud_t *pud)
>>   */
>>  static int __init next_level_idx(u64 addr)
>>  {
>> -	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 2) * (PAGE_SHIFT - 3);
>> +	int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 2) * (PAGE_SHIFT - PTDESC_ORDER);
>>  
>>  	return (addr >> (shift + PAGE_SHIFT)) % PTRS_PER_PTE;
>>  }
>> -- 
>> 2.25.1
>>

