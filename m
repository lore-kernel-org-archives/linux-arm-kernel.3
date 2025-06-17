Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57BAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC2urmdi932bfVZW34Z6R4DXI4WJxCiZ6OdHegtaTBk=; b=yHcwIp65icvLqJSqDFjzAYazeT
	X0KY9m04VM6m1c1W6YAcGwqKE+NttdOkn7LiIP2nHlPX3h9Q4Qjf6bRJ3LBV4YEo445ToTg3w8jcv
	Mr5QyFUQ+VssiNzxZenvVO5lCFtGmScGf0cApV1+JQSpdS6OHlYQDpImWCGIWEjppp5BACOoZ0sfb
	9RzlW8UtvTx2iGB7dAgebohEXcnxJYBRN4atU1xiJbRvrAEKViBLsJ4FsY7HvkI1etlowA6Gzs5Ku
	EALu3TEvLGkdTWGh8W1aakaoYz0eGE58Qz1Q+upipv3cEY0d2OgIclupefwVOr+SwlKFCz2NclSve
	iAz30lKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRTa-00000006ZGy-34Yr;
	Tue, 17 Jun 2025 08:15:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRRE-00000006Yie-27E5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:13:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D8DC15A1;
	Tue, 17 Jun 2025 01:12:38 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31613F673;
	Tue, 17 Jun 2025 01:12:57 -0700 (PDT)
Message-ID: <f1876bc1-94f5-46d0-b51d-12537d979830@arm.com>
Date: Tue, 17 Jun 2025 09:12:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <5f7b0a4d-fb3f-43bc-9f2a-3951222cfff2@arm.com>
 <ec8a398c-727c-420a-9110-5362ce35f786@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ec8a398c-727c-420a-9110-5362ce35f786@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_011300_630565_F7882621 
X-CRM114-Status: GOOD (  22.14  )
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

On 17/06/2025 04:59, Dev Jain wrote:
> 
> On 17/06/25 8:24 am, Dev Jain wrote:
>>
>> On 16/06/25 11:37 pm, Ryan Roberts wrote:
>>> On 16/06/2025 11:33, Dev Jain wrote:
>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>> because an intermediate table may be removed, potentially causing the
>>>> ptdump code to dereference an invalid address. We want to be able to
>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>> between two different vm_structs; two vmalloc objects running this same
>>>> code path will point to different page tables, hence there is no race.
>>>>
>>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>>> 512 times again via pmd_free_pte_page().
>>>>
>>>> We implement the locking mechanism using static keys, since the chance
>>>> of a race is very small. Observe that the synchronization is needed
>>>> to avoid the following race:
>>>>
>>>> CPU1                            CPU2
>>>>                         take reference of PMD table
>>>> pud_clear()
>>>> pte_free_kernel()
>>>>                         walk freed PMD table
>>>>
>>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>>
>>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>>> we are safe. If not, then the patched-in read and write locks help us
>>>> avoid the race.
>>>>
>>>> To implement the mechanism, we need the static key access from mmu.c and
>>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>>> target in the Makefile, therefore we cannot initialize the key there, as
>>>> is being done, for example, in the static key implementation of
>>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>>> the jump_label mechanism. Declare the key there and define the key to false
>>>> in mmu.c.
>>>>
>>>> No issues were observed with mm-selftests. No issues were observed while
>>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>>> sysfs in a loop.
>>>>
>>>> v2->v3:
>>>>   - Use static key mechanism
>>>>
>>>> v1->v2:
>>>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>>     the lock 512 times again via pmd_free_pte_page()
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>>   arch/arm64/mm/ptdump.c              |  5 +++
>>>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>>>

[...]

>>>> +    pud_clear(pudp);
>>> How can this possibly be correct; you're clearing the pud without any
>>> synchronisation. So you could have this situation:
>>>
>>> CPU1 (vmalloc)            CPU2 (ptdump)
>>>
>>>                 static_branch_enable()
>>>                   mmap_write_lock()
>>>                     pud = pudp_get()
>>
>> When you do pudp_get(), you won't be dereferencing a NULL pointer.
>> pud_clear() will nullify the pud entry. So pudp_get() will boil
>> down to retrieving a NULL entry. Or, pudp_get() will retrieve an
>> entry pointing to the now isolated PMD table. Correct me if I am
>> wrong.
>>
>>> pud_free_pmd_page()
>>>    pud_clear()
>>>                     access the table pointed to by pud
>>>                     BANG!
> 
> I am also confused thoroughly now : ) This should not go bang as the
> 
> table pointed to by pud is still there, and our sequence guarantees that
> 
> if the ptdump walk is using the pmd table, then pud_free_pmd_page won't
> 
> free the PMD table yet.

You're right... I'm not sure what I was smoking last night. For some reason I
read the pXd_clear() as "free". This approach looks good to me - very clever!
And you even managed to ensure the WRITE_ONCE() in pXd_clear() doesn't get
reordered after taking the lock via the existing dsb in the tlb maintenance
operation - I like it!

I'll send a separate review with some nits, but I'm out today, so that might
have to wait until tomorrow.

Thanks, and sorry again for the noise!
Ryan


