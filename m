Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD35AEB3655
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 02:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2mEdKwaynOPWZlFY7lYmhYDunrC0D6Hhh7ZFnGQH84=; b=BzoXnmktVfDzG1xCPXzTe2RmY/
	0OnNPF3ohQD8mYCC+N/cXh35H1PLEarTld6iO7BbbGf+s+xhCIAyV91SQTnhPf3PEe/BL+tFOGbbY
	aPGfpPj/Zd8pF7sj71ZK9zde2ss5X10l8UKIW6l6unQGZfAnbB4aq2QEtRfrqLWk4h0BZGQM9Iy5n
	jgMLR4khXuwyFaT1BmCcwTPgmDs2gwQ3KLYrXXIZ4IP+cBBXQ68e1LbgY9N0yUP9P+QCq3mTebGPD
	NKM8UvH4tIDesHLedoQZfQhylCJUA86j3Y9G44ybQIiJ+anaxRLLe0JwUpmiGwYQAJZPe4pJTWBaV
	M+kN6f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFcy-0000000EPYI-2sJW;
	Tue, 03 Mar 2026 02:36:52 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFcv-0000000EPXX-2CMl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 02:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772505402; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+2mEdKwaynOPWZlFY7lYmhYDunrC0D6Hhh7ZFnGQH84=;
	b=E07Mb63lF5IiiptW2+ujVT79Up2CddU35RKMWVOIxLsVeT21/zs9B+H78aaDVIQDyt0wMXgn3PfTc7o7SArJMHmeqCClv72IMgS1CpXUb2YwfOitIHAQBrvIWd+kDz+JRXg4A+8vBc5H2O2LagLO9ayX9ihHvsEkUdFQ5xXrtIw=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-89.pD_1772505397 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Mar 2026 10:36:38 +0800
Message-ID: <7b4266c8-f885-44fb-b39b-aee38625980c@linux.alibaba.com>
Date: Tue, 3 Mar 2026 10:36:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] mm: add a batched helper to clear the young flag
 for large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
 <589d743f4e048dc749002a7e1a1aec5d511c406b.1772185080.git.baolin.wang@linux.alibaba.com>
 <be90d12e-304a-4c26-984d-2410a8850293@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <be90d12e-304a-4c26-984d-2410a8850293@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_183649_732856_AAF56554 
X-CRM114-Status: GOOD (  15.81  )
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



On 3/2/26 5:07 PM, David Hildenbrand (Arm) wrote:
> On 2/27/26 10:44, Baolin Wang wrote:
>> Currently, MGLRU will call ptep_test_and_clear_young_notify() to check and
>> clear the young flag for each PTE sequentially, which is inefficient for
>> large folios reclamation.
>>
>> Moreover, on Arm64 architecture, which supports contiguous PTEs, the Arm64-
>> specific ptep_test_and_clear_young() already implements an optimization to
>> clear the young flags for PTEs within a contiguous range. However, this is not
>> sufficient. Similar to the Arm64 specific clear_flush_young_ptes(), we can
>> extend this to perform batched operations for the entire large folio (which
>> might exceed the contiguous range: CONT_PTE_SIZE).
>>
>> Thus, we can introduce a new batched helper: test_and_clear_young_ptes() and
>> its wrapper test_and_clear_young_ptes_notify() which are consistent with the
>> existing functions, to perform batched checking of the young flags for large
>> folios, which can help improve performance during large folio reclamation when
>> MGLRU is enabled. And it will be overridden by the architecture that implements
>> a more efficient batch operation in the following patches.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>   mm/internal.h           | 16 +++++++++++-----
>>   2 files changed, 49 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 776993d4567b..29bd9fd04e1e 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1103,6 +1103,44 @@ static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>   }
>>   #endif
>>   
>> +#ifndef test_and_clear_young_ptes
>> +/**
>> + * test_and_clear_young_ptes - Mark PTEs that map consecutive pages of the same
>> + *			       folio as old
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries to clear access bit.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_test_and_clear_young().
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>> + * some PTEs might be write-protected.
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>> + *
>> + * Returns: whether any PTE was young.
>> + */
>> +static inline int test_and_clear_young_ptes(struct vm_area_struct *vma,
>> +					    unsigned long addr, pte_t *ptep,
>> +					    unsigned int nr)
> 
> Two tabs ...

Ah, yes, not sure why I missed this one :(

> What happened to using a boolen as return type and for "int young"?
As I replied to you previously [1], I’d like to do this in a follow-up 
patchset that converts all functions that check the young flag. Does 
that sound OK to you?

[1] 
https://lore.kernel.org/all/32c538ce-6af8-48a8-86fc-d26ee253af54@linux.alibaba.com/

