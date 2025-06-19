Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27BCC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+pZP+19Ajtdn1g1OGRU6xbvIde5rK18gy0tP10hAfw=; b=mkvAiHGBvmUbaru7s8zxxi/TBS
	CVJmuO/xypqrH5N2hk6x9sugWrEThGdFllqYE4OvR0mZtJBNfl/Py0zqvDmxABd1qRnnBvu/Sdjrr
	u29/FUw+5Kijh98UK2UiOxuja6HoNW3l2G0gvgY1peq+FzlwOk2BckBIqqSbSJLwt15Q2M1ugadar
	mZKi8Mmy1jEvl20sCcsKU3svxY1im/LSRHdJoSzP6YU5MXjnheGeGXAGaMVOKBfVIvGsVkUQUQDip
	x0rvdt4UjvRN86SAidNIZxMLLDJ369xXPKhOcsERABjdGKjGAG6mRQ5MJJDYT3y2fpwBqgsnlBGlI
	uqeZ/skA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAfB-0000000CQxU-3DKk;
	Thu, 19 Jun 2025 08:30:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA7T-0000000CMZ1-1iWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:55:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68ECB106F;
	Thu, 19 Jun 2025 00:55:12 -0700 (PDT)
Received: from [10.163.35.214] (unknown [10.163.35.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C8DD3F66E;
	Thu, 19 Jun 2025 00:55:30 -0700 (PDT)
Message-ID: <fb86e753-95c0-41bd-b8f6-ebc810cd8a94@arm.com>
Date: Thu, 19 Jun 2025 13:25:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/ptdump: Ensure memory hotplug is prevented during
 ptdump_check_wx()
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250609041214.285664-1-anshuman.khandual@arm.com>
 <20250612145808.GA12912@willie-the-truck>
 <5c22c792-0648-4ced-b0ed-86882610b4be@arm.com>
 <20250618113635.GA20157@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250618113635.GA20157@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_005535_543546_2C6C4FE6 
X-CRM114-Status: GOOD (  18.00  )
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



On 18/06/25 5:06 PM, Will Deacon wrote:
> On Fri, Jun 13, 2025 at 10:39:02AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 12/06/25 8:28 PM, Will Deacon wrote:
>>> On Mon, Jun 09, 2025 at 05:12:14AM +0100, Anshuman Khandual wrote:
>>>> The arm64 page table dump code can race with concurrent modification of the
>>>> kernel page tables. When a leaf entries are modified concurrently, the dump
>>>> code may log stale or inconsistent information for a VA range, but this is
>>>> otherwise not harmful.
>>>>
>>>> When intermediate levels of table are freed, the dump code will continue to
>>>> use memory which has been freed and potentially reallocated for another
>>>> purpose. In such cases, the dump code may dereference bogus addresses,
>>>> leading to a number of potential problems.
>>>>
>>>> This problem was fixed for ptdump_show() earlier via commit 'bf2b59f60ee1
>>>> ("arm64/mm: Hold memory hotplug lock while walking for kernel page table
>>>> dump")' but a same was missed for ptdump_check_wx() which faced the race
>>>> condition as well. Let's just take the memory hotplug lock while executing
>>>> ptdump_check_wx().
>>>
>>> How do other architectures (e.g. x86) handle this? I don't see any usage
>>> of {get,put}_online_mems() over there. Should this be moved into the core
>>> code?
>>
>> Memory hot remove on arm64 unmaps kernel linear and vmemmap mapping while
>> also freeing page table pages if those become empty. Although this might
>> not be true for all other architectures, which might just unmap affected
>> kernel regions but does not tear down the kernel page table.
> 
> ... that sounds like something we should be able to give a definitive
> answer to?

Agreed.

arch_remove_memory() is the primary arch callback which does the unmapping
and also tearing down of the required kernel page table regions i.e linear
and vmemmap mapping . These are the call paths that reach platform specific
memory removal via arch_remove_memory().

A) ZONE_DEVICE

devm_memremap_pages()
    devm_memremap_pages_release()
        devm_memunmap_pages()
            memunmap_pages()
                arch_remove_memory()

B) Normal DRAM

echo 1 > /sys/devices/system/memory/memoryX/offline

memory_subsys_offline()
    device_offline()
        memory_offline()
            offline_memory_block()
                remove_memory()
                    __remove_memory()
                        arch_remove_memory()

Currently there are six platforms which enable ARCH_ENABLE_MEMORY_HOTREMOVE
thus implementing arch_remove_memory(). Core memory hot removal process does
not have any set expectations from these callbacks. So platforms are free to
implement unmap and page table tearing down operation as deemed necessary.

ARCH_ENABLE_MEMORY_HOTREMOVE - arm64, loongarch, powerpc, riscv, s390, x86
ARCH_HAS_PTDUMP              - arm64, powerpc, riscv, s390, x86

In summary all the platforms that support memory hot remove and ptdump do
try and free the unmapped regions of the page table when possible. Hence
they are indeed exposed to possible race with ptdump walk.

But as mentioned earlier the callback arch_remove_memory() does not have to
tear down the page tables. Unless there are objections from other platforms,
standard memory hotplug lock could indeed be taken during all generic ptdump
walk paths. 

arm64
=====
    arch_remove_memory()
        __remove_pages()
            sparse_remove_section()
                section_deactivate()
                    depopulate_section_memmap()
                    free_map_bootmem()
                        vmemmap_free()              /* vmemap mapping */
                            unmap_hotplug_range()   /* Unmap */
                            free_empty_tables()     /* Tear down */

        __remove_pgd_mapping()
            __remove_pgd_mapping()                  /* linear Mapping */
                unmap_hotplug_range()               /* Unmap */
                free_empty_tables()                 /* Tear down */

powerpc
=======
    arch_remove_memory()
        __remove_pages()
            sparse_remove_section()
                    section_deactivate()
                        depopulate_section_memmap()
                            vmemmap_free()
                                __vmemmap_free()            /* Hash */
                                radix__vmemmap_free()       /* Radix */

        arch_remove_linear_mapping()
            remove_section_mapping()
                hash__remove_section_mapping()              /* Hash */
                radix__remove_section_mapping()             /* Radix */
    
riscv
=====
    arch_remove_memory()
        __remove_pages()
            sparse_remove_section()
                    section_deactivate()
                        depopulate_section_memmap()
                            vmemmap_free()
                                remove_pgd_mapping()

        remove_linear_mapping()
            remove_pgd_mapping()
    
remove_pgd_mapping() recursively calls remove_pxd_mapping() and
free_pxd_table() when applicable.

s390
=====
    arch_remove_memory()
        __remove_pages()
            sparse_remove_section()
                section_deactivate()
                    depopulate_section_memmap()
                        vmemmap_free()
                            remove_pagetable()
                                modify_pagetable()
        
        vmem_remove_mapping()
            vmem_remove_range()
                remove_pagetable() 
                        modify_pagetable()

modify_pagetable() on s390 does try to tear down the page table
when possible.
 
x86
===
    arch_remove_memory()
        __remove_pages()
            sparse_remove_section()
                section_deactivate()
                    depopulate_section_memmap()
                    free_map_bootmem()
                        vmemmap_free()              /* vmemap mapping */
                            remove_pagetable()

        kernel_physical_mapping_remove()            /* linear Mapping */
            remove_pagetable()

remove_pagetable() on x86 calls remove_pxd_table() followed up call
with free_pxd_table() which does tear down the page table as well
and hence exposed to race with PTDUMP which scans over the entire
kernel page table.

