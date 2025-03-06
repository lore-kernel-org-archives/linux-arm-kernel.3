Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zrtirWA0Ivt8C3z7wsYvGm1S+y6BVQT/ee6oPma804=; b=Bnh1t4DaQq1XWfiJOEeg5f7E4i
	A1EvotttjCqIq3xYVM3fu87vyjnsGHHjAYAmjIbxj7beU/41r3qLKs/E1Fb3piO9rOXw7niEJf9VD
	xcUQhW+sM23YfMjAY7gFrZ37ls9T3FevDTEzoRKipwzsQqodiNPcQoX2UhOMFGde+55UxT5kOM4kV
	63J4cOMLqbOq7Z8eqEN621/QYDfqDIJL+bbQVnwkUlkYtpHOI0dB5HbkAlXSpP4JnQYm0+vMYYAWF
	fsqE5V9NnOVgocCdn6DIP5xu6LP8XUX8ahvITSmyfJQUM3Yn/1WwDxC6O74kBWOk2flZjXUH5Fnh4
	t4KklG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq24k-00000009wC9-13Xu;
	Thu, 06 Mar 2025 03:39:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq238-00000009w4Z-1RtX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 03:37:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02BF91007;
	Wed,  5 Mar 2025 19:37:40 -0800 (PST)
Received: from [10.163.39.177] (unknown [10.163.39.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84A9E3F66E;
	Wed,  5 Mar 2025 19:37:24 -0800 (PST)
Message-ID: <e0c2841b-3776-4d78-9514-b03ada39c739@arm.com>
Date: Thu, 6 Mar 2025 09:07:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Create level specific section mappings in
 map_range()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
References: <20250303041834.2796751-1-anshuman.khandual@arm.com>
 <0fe6f3b2-1011-4418-bc19-612a3b98c78d@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <0fe6f3b2-1011-4418-bc19-612a3b98c78d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_193730_503945_F79BF304 
X-CRM114-Status: GOOD (  23.86  )
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



On 3/4/25 21:51, Ryan Roberts wrote:
> On 03/03/2025 04:18, Anshuman Khandual wrote:
>> Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
>> section mapping at all page table levels except the last level. This works
>> fine as the section mapping masks are exactly the same (0x1UL) for all page
>> table levels.
>>
>> This will change in the future with D128 page tables that have unique skip
>> level values (SKL) required for creating section mapping at different page
>> table levels. Hence use page table level specific section mapping macros
>> instead of the common PMD_TYPE_SECT.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on 6.14-rc5
>>
>> PGD_TYPE_SECT for level -1 section map handling has been added for 4K
>> base pages with 52 bit VA configuration that has 5 page table levels.
>> In such cases (CONFIG_PGTABLE_LEVELS = 5) early_map_kernel() can call
>> map_range() eventually with -1 (i.e 4 - CONFIG_PGTABLE_LEVELS) as the
>> root_level.
> 
> Table Table D8-16 on page D8-6459 of ARM DDI 0487 L.a says that block mappings
> at level -1 are not permitted for 4K pages; only levels 0-3 support leaf
> mappings. Similarly for 16K, table D8-26 says only levels 1-3 permit leaf
> mappings. And for 64K, table D8-35 says only levels 1-3 permit leaf mappings.

Then seems like the current code is actually wrong because PMD_TYPE_SECT
is being set at all levels (except level 3) regardless of the configured
page size ?

> 
> So I don't think PGD_TYPE_SECT is the right solution. Perhaps we need to
> explicitly force the unsupported levels to be table entries even if the
> alignment is correct?

Just wondering - something like the following will work instead ? Tested
on both 4K and 64K page sizes.

--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -26,6 +26,21 @@
  * @va_offset:         Offset between a physical page and its current mapping
  *                     in the VA space
  */
+static bool sect_supported(int level)
+{
+       switch(level) {
+       case -1:
+               return false;
+       case 0:
+               if(IS_ENABLED(CONFIG_ARM64_16K_PAGES) ||
+                  IS_ENABLED(CONFIG_ARM64_64K_PAGES))
+                       return false;
+               fallthrough;
+       default:
+               return true;
+       }
+}
+
 void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
                      int level, pte_t *tbl, bool may_use_cont, u64 va_offset)
 {
@@ -44,13 +59,30 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
         * Set the right block/page bits for this level unless we are
         * clearing the mapping
         */
-       if (protval)
-               protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
+       if (protval && sect_supported(level)) {
+               switch (level) {
+               case 3:
+                       protval |= PTE_TYPE_PAGE;
+                       break;
+               case 2:
+                       protval |= PMD_TYPE_SECT;
+                       break;
+               case 1:
+                       protval |= PUD_TYPE_SECT;
+                       break;
+               case 0:
+                       protval |= P4D_TYPE_SECT;
+                       break;
+               default:
+                       break;
+               }
+       }
 
        while (start < end) {
                u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
 
-               if (level < 3 && (start | next | pa) & lmask) {
+               if ((level < 3 && (start | next | pa) & lmask) ||
+                    !sect_supported(level)){
                        /*
                         * This chunk needs a finer grained mapping. Create a
                         * table mapping if necessary and recurse.

> 
> Thanks,
> Ryan
> 
>>
>>  arch/arm64/include/asm/pgtable-hwdef.h |  1 +
>>  arch/arm64/kernel/pi/map_range.c       | 23 +++++++++++++++++++++--
>>  2 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
>> index a9136cc551cc..fd0a82e8878c 100644
>> --- a/arch/arm64/include/asm/pgtable-hwdef.h
>> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
>> @@ -99,6 +99,7 @@
>>  #define PGD_TYPE_TABLE		(_AT(pgdval_t, 3) << 0)
>>  #define PGD_TABLE_BIT		(_AT(pgdval_t, 1) << 1)
>>  #define PGD_TYPE_MASK		(_AT(pgdval_t, 3) << 0)
>> +#define PGD_TYPE_SECT		(_AT(pgdval_t, 1) << 0)
>>  #define PGD_TABLE_AF		(_AT(pgdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
>>  #define PGD_TABLE_PXN		(_AT(pgdval_t, 1) << 59)
>>  #define PGD_TABLE_UXN		(_AT(pgdval_t, 1) << 60)
>> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
>> index 2b69e3beeef8..9ea869f5745f 100644
>> --- a/arch/arm64/kernel/pi/map_range.c
>> +++ b/arch/arm64/kernel/pi/map_range.c
>> @@ -44,8 +44,27 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>>  	 * Set the right block/page bits for this level unless we are
>>  	 * clearing the mapping
>>  	 */
>> -	if (protval)
>> -		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
>> +	if (protval) {
>> +		switch (level) {
>> +		case 3:
>> +			protval |= PTE_TYPE_PAGE;
>> +			break;
>> +		case 2:
>> +			protval |= PMD_TYPE_SECT;
>> +			break;
>> +		case 1:
>> +			protval |= PUD_TYPE_SECT;
>> +			break;
>> +		case 0:
>> +			protval |= P4D_TYPE_SECT;
>> +			break;
>> +		case -1:
>> +			protval |= PGD_TYPE_SECT;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +	}
>>  
>>  	while (start < end) {
>>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
> 

