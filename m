Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2F4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 04:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTEBKh9m3DSxJ6Hq5DJGf4poghBQYd3LemNf8I+sa1M=; b=YKcUFqYIh5F1aqgZj/WNo5nhFU
	etZ9JiaYvp7+A24wqnJsZ/vTYDLhRxQ1Zss4BPaZ/WFXf58Ss8Ff3zjbQVU6ciTzYzJigwRaIXIAF
	htrcAHgz7quQEKWFp7k7Q1mf04JhOZNqsZxPhtmg3q5Jn85xiiyUagfud90FKkvLiLf6JHBitQH2a
	g2wAEDVfiZgGiXlBg6wn9EC8LJ5J9G5pRr77DHv5VwxwcyzUSJL0PY4NcB/gNmbuIPq2CI2k82UG5
	XWT+F4QjoP3lVOVFCLnM5ZYeXg19BnIdTcxWOREBSA2CQ4nlLDFv7x3gU3wTJJ7ZoCdhmhgghbmAn
	fp6z7efQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTc-0000000E985-2A2C;
	Mon, 18 May 2026 04:21:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTW-0000000E92u-3Eco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 04:21:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 872331F91;
	Sun, 17 May 2026 21:20:57 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE6C03F632;
	Sun, 17 May 2026 21:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779078062; bh=7qEOG0EubcCTb2hX+beWzGRWlPEKLWITmG0O/s/Mou0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gAd+bc7hPx4rXAAfzhgvWv0NVb0WQZj0dnh1zz6CJhO+MMhFx9HSMYpw4pGV117Qv
	 9X4uGnyFUsyUUKEuoEpsDeBHeqqWy8rjvwqAIZQDHaiK1ixvJs5/G5+cB8yFORDGHj
	 +vPHi4aBHLfqfSwX2F5KEZ0tOqRuupWfwC5xSWb0=
Message-ID: <50e91f4f-f44f-4457-aa44-abd877e5e241@arm.com>
Date: Mon, 18 May 2026 09:50:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 00/14] arm64/mm: Enable 128 bit page table entries
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <agRF7FXwCvp4Ec3h@lucifer>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <agRF7FXwCvp4Ec3h@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_212107_076584_FFE9302C 
X-CRM114-Status: GOOD (  24.65  )
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



On 13/05/26 3:09 PM, Lorenzo Stoakes wrote:
> -cc my previous kernel address
> 
> Hi Anshuman,
> 
> Sorry to be a pain, but I'm using ljs@kernel.org now for my kernel mail, so
> I am at risk of missing stuff sent to my @oracle.com address (I changed
> things around to make managing the... rather large quantities of mail I get
> a bit easier :)
> 
> Hence I missed this previously, can you send future revisions to
> ljs@kernel.org? Thanks!

Sure, will do.

> 
> Cheers, Lorenzo
> 
> On Wed, May 13, 2026 at 10:15:33AM +0530, Anshuman Khandual wrote:
>> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
>> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
>> So with this feature arm64 platforms could have two different translation
>> systems, VMSAv8-64 and VMSAv9-128 could selectively be enabled.
>>
>> FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
>> and virtual address range while also expanding available room for more MMU
>> management feature bits both for HW and SW.
>>
>> This series has been split into two parts. Generic MM changes followed by
>> arm64 platform changes, finally enabling D128 with a new config ARM64_D128.
>>
>> READ_ONCE() on page table entries get routed via level specific pxdp_get()
>> helpers which platforms could then override when required. These accessors
>> on arm64 platform help in ensuring page table accesses are performed in an
>> atomic manner while reading 128 bit page table entries.
>>
>> All ARM64_VA_BITS and ARM64_PA_BITS combinations for all page sizes are now
>> supported both on D64 and D128 translation regimes. Although new 56 bits VA
>> space is not yet supported. Similarly FEAT_D128 skip level is not supported
>> currently.
>>
>> Basic page table geometry has also been changed with D128 as there are fewer
>> entries per level. Please refer to the following table for leaf entry sizes.
>>
>>                     D64              D128
>> ------------------------------------------------
>> | PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
>> -----------------------------|-----------------|
>> |     4K    |    2M  |  1G   |    1M  |  256M  |
>> |    16K    |   32M  | 64G   |   16M  |   16G  |
>> |    64K    |  512M  |  4T   |  256M  |    1T  |
>> ------------------------------------------------
>>
>>                          D64                        D128
>> --------------------------------------------------------------------
>> | PAGE_SIZE |   CONT_PTE  |  CONT_PMD  |   CONT_PTE  |   CONT_PMD  |
>> --------------------------|------------|-------------|--------------
>> |     4K    |     64K     |     32M    |     64K     |      16M    |
>> |    16K    |      2M     |      1G    |      1M     |     256M    |
>> |    64K    |      2M     |     16G    |      1M     |      16G    |
>> --------------------------------------------------------------------
>>
>> From arm64 kernel features perspective KVM, KASAN and UNMAP_KERNEL_AT_EL0
>> are currently not supported as well.
>>
>> This series applies on v7.1-rc3 and there are no apparent problems while
>> running MM kselftests with and without CONFIG_ARM64_D128. Besides this has
>> been built tested on other platform such as x86, powerpc, riscv, arm and
>> s390 etc.
>>
>> Changes in RFC V2:
>>
>> - Dropped some patches that were merged upstream and rebased on v7.1-rc3
>> - Moved pxdval_t definition inside generic page table header per Mike
>> - Restored print format in __print_bad_page_map_pgtable() per Usama
>> - Renamed __PRIpte as __PRIpxx per David
>> - Dropped _once from pgprot_[read|write]() callbacks per Mike
>> - Moved back all helpers back from arch/arm64/mm/mmu.c into the header
>> - Renamed all ptdesc_ instances as pxxval_ instead
>> - Moved arm64 pgtable header READ_ONCE() replacements later in the series
>> - Updated commit message for the 5-level fixmap change per David
>> - Updated ARM64_CONT_[PTE|PMD]_SHIFT both for 16K and 64K base pages
>> - Added abstraction for tlbi_op
>> - Adopted TLBIP implementation to recent TLB flush changes
>> - Updated all commit messages as required and suggested
>>
>> Changes in RFC V1:
>>
>> https://lore.kernel.org/linux-arm-kernel/20260224051153.3150613-2-anshuman.khandual@arm.com/
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Linu Cherian <linu.cherian@arm.com>
>> Cc: Usama Arif <usama.arif@linux.dev>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
>>
>> Anshuman Khandual (13):
>>   mm: Abstract printing of pxd_val()
>>   mm: Add read-write accessors for vm_page_prot
>>   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
>>   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
>>   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
>>   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
>>   arm64/mm: Route all pgtable reads via pxxval_get()
>>   arm64/mm: Route all pgtable writes via pxxval_set()
>>   arm64/mm: Route all pgtable atomics to central helpers
>>   arm64/mm: Abstract printing of pxd_val()
>>   arm64/mm: Override read-write accessors for vm_page_prot
>>   arm64/mm: Enable fixmap with 5 level page table
>>   arm64/mm: Add initial support for FEAT_D128 page tables
>>
>> Linu Cherian (1):
>>   arm64/mm: Add an abstraction level for tlbi_op
>>
>>  arch/arm64/Kconfig                     |  51 +++++++-
>>  arch/arm64/Makefile                    |   4 +
>>  arch/arm64/include/asm/assembler.h     |   4 +-
>>  arch/arm64/include/asm/el2_setup.h     |   9 ++
>>  arch/arm64/include/asm/pgtable-hwdef.h | 137 ++++++++++++++++++++
>>  arch/arm64/include/asm/pgtable-prot.h  |  18 ++-
>>  arch/arm64/include/asm/pgtable-types.h |  12 ++
>>  arch/arm64/include/asm/pgtable.h       | 169 ++++++++++++++++++++-----
>>  arch/arm64/include/asm/smp.h           |   1 +
>>  arch/arm64/include/asm/tlbflush.h      | 138 ++++++++++++++------
>>  arch/arm64/kernel/head.S               |  12 ++
>>  arch/arm64/mm/fault.c                  |  20 +--
>>  arch/arm64/mm/fixmap.c                 |  24 +++-
>>  arch/arm64/mm/hugetlbpage.c            |  10 +-
>>  arch/arm64/mm/kasan_init.c             |  14 +-
>>  arch/arm64/mm/mmu.c                    |  65 +++++-----
>>  arch/arm64/mm/pageattr.c               |   8 +-
>>  arch/arm64/mm/proc.S                   |  25 +++-
>>  arch/arm64/mm/trans_pgd.c              |  14 +-
>>  include/linux/pgtable.h                |  25 ++++
>>  mm/huge_memory.c                       |   4 +-
>>  mm/memory.c                            |  25 ++--
>>  mm/migrate.c                           |   2 +-
>>  mm/mmap.c                              |   2 +-
>>  24 files changed, 624 insertions(+), 169 deletions(-)
>>
>> --
>> 2.43.0
>>


