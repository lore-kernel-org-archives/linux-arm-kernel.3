Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43059C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw+19QgTig547vlrS+uxRQwizoV5tRYynNxK33KnDkU=; b=DafD4X8pl2BdoLvPCKr3mU8Ion
	eiuMk0waqzWqCNJ6yz2K55Q0EqhFhgJjYxywVGVgkffP6XAbAtfviDT5vLpw8IBlSIyqbbxrKEWt0
	Sz/YqoeJAxJyMJ1anhpciSziBEtHj9eGCosdLqv2VNb0BcsJANIXdkZnYkTN1wehMD2T6o1XwDQqp
	p5P2YJUbQkF6kPGtiA4naSiuvQHlPn9a5iFBYlnsJQS2E8WziAC57+hewNgECNWa3OTJNrd14WYJe
	k02kpZeJ759cZMKczl+5E9/DIsr732JnqyzyW3K9dEHyqCFFF/p1OEe6jDr2XlmFbspUncF+Fk3Ql
	93PaN9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tremo-000000036v2-32nq;
	Mon, 10 Mar 2025 15:11:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdV5-00000002qBs-1h7W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:49:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0642D153B;
	Mon, 10 Mar 2025 06:49:08 -0700 (PDT)
Received: from [10.57.83.165] (unknown [10.57.83.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6738C3F673;
	Mon, 10 Mar 2025 06:48:55 -0700 (PDT)
Message-ID: <b1fb982a-4936-4c18-aaad-3e8e8f61bccc@arm.com>
Date: Mon, 10 Mar 2025 13:48:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Create level specific section mappings in
 map_range()
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
References: <20250310062812.216031-1-anshuman.khandual@arm.com>
 <Z87FFqV03Pd0-NXl@J2N7QTR9R3.cambridge.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z87FFqV03Pd0-NXl@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_064859_542927_3EDD76C3 
X-CRM114-Status: GOOD (  30.69  )
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

On 10/03/2025 10:55, Mark Rutland wrote:
> On Mon, Mar 10, 2025 at 11:58:12AM +0530, Anshuman Khandual wrote:
>> Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
>> section mapping at all page table levels except the last level. This works
>> fine as the section mapping masks are exactly the same (0x1UL) for all page
>> table levels.
>>
>> This will change in the future with D128 page tables that have unique skip
>> level values (SKL) required for creating section mapping at different page
>> table levels. Hence use page table level specific section mapping macros
>> instead of the common PMD_TYPE_SECT. While here also ensure that a section
>> mapping is only created on page table levels which could support that on a
>> given page size configuration otherwise fall back to create table entries.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v6.14-rc6
>>
>> Changes in V2:
>>
>> - Dropped PGD_TYPE_SECT macro and its instance from map_range()
>> - Create table entries on levels where section mapping is not possible
> 
> On the last version, there was talk of an extant bug:
> 
>   https://lore.kernel.org/all/5f1b36e2-6455-44d9-97b0-253aefd5024f@arm.com/
> 
> ... did that turn out to not be the case?

In the absence of Ard (or anyone else) telling me it's not a bug, then I'll
continue to assert that it is a bug, and should have a Fixes tag, and Cc stable.

> 
>>
>> Changes in V1:
>>
>> https://lore.kernel.org/all/20250303041834.2796751-1-anshuman.khandual@arm.com/
>>
>>  arch/arm64/kernel/pi/map_range.c | 38 +++++++++++++++++++++++++++++---
>>  1 file changed, 35 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
>> index 2b69e3beeef8..25a70c675c4d 100644
>> --- a/arch/arm64/kernel/pi/map_range.c
>> +++ b/arch/arm64/kernel/pi/map_range.c
>> @@ -11,6 +11,22 @@
>>  
>>  #include "pi.h"
>>  
>> +static bool sect_supported(int level)
> 
> What exactly is this function supposed to indicate?
> 
> Due to the 'default' case, it'll return true for level-3 tables where
> sections/blocks aren't possible, but pages are. So maybe this is just
> misnamed, and wants to be something like "leaf_supported()" ?

I always thought a "section" was (outdated?) linux terminology for a leaf
mapping at any level. For my understanding, I think you're saying it
specifically means a leaf mapping at any level other than the last level, so it
is actually equivalent to a "block" mapping in the Arm ARM?

Either way, the intended semantic for this function is "is it valid to create a
leaf mapping at the specified level?" where leaf = block or page.

Thanks,
Ryan

> 
>> +{
>> +	switch (level) {
>> +	case -1:
>> +		return false;
>> +	case 0:
>> +		if (IS_ENABLED(CONFIG_ARM64_16K_PAGES) ||
>> +		    IS_ENABLED(CONFIG_ARM64_64K_PAGES))
>> +			return false;
>> +		else
>> +			return true;
> 
> Surely:
> 
> 	case 0:
> 		return IS_ENABLED(CONFIG_ARM64_4K_PAGES);
> 
> ... though that's only the case when LPA2 is supported and TCR_ELx.DS is
> set.
> 
>> +	default:
>> +		return true;
> 
> As above, what is this supposed to return for level-3 tables where
> sections/blocks aren't possible?
> 
> Can we BUILD_BUG() for bogus levels?
> 
>> +	}
>> +}
>> +
>>  /**
>>   * map_range - Map a contiguous range of physical pages into virtual memory
>>   *
>> @@ -44,13 +60,29 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>>  	 * Set the right block/page bits for this level unless we are
>>  	 * clearing the mapping
>>  	 */
>> -	if (protval)
>> -		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
>> +	if (protval && sect_supported(level)) {
> 
> The existing code is trying to find the leaf prot for a given level of
> table, so as-is checking sect_supported() is at best misleading.
> 
> If we're going to do something different below based on
> sect_supported(), I reckon this should be moved into the path where
> sect_supported() returned true, maybe factored out into a helper for
> clarity.
> 
> Mark.
> 
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
>> +		default:
>> +			break;
>> +		}
>> +	}
>>  
>>  	while (start < end) {
>>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
>>  
>> -		if (level < 3 && (start | next | pa) & lmask) {
>> +		if ((level < 3 && (start | next | pa) & lmask) || !sect_supported(level)) {
>>  			/*
>>  			 * This chunk needs a finer grained mapping. Create a
>>  			 * table mapping if necessary and recurse.
>> -- 
>> 2.25.1
>>
>>


