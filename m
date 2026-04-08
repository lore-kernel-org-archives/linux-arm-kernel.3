Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90788FD5F79
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBBz0zyElyyPo220s38wUtaWriXRZkSB7Kq8OmzU/UE=; b=PSOPYi18FM06fMwQCQ7lXfxqcA
	DJU7YjpPMO24MnP/Cqav0xkr1FWocFTJK0JNaZc/5lVYMMYZLZ/2Wko7isRv9jL+njY5N70yv2QEz
	eoodpSZchJoU91VbE1bNp/9sWwIELNATmIhyRoIQ2r6bXu1B5OioKNAet5vbO/PkV9x7d9UXn5H9P
	7AcO1mF/R8Lh1jHH8j0zkn36iOGDm/xznCveLWj3i5XUHGl3bmm1KKLIyFrskznq4kPKxWGkyg1Ta
	HmBYnZpnVU0Z1iiH7btnME3fPiqSdRgaaQRx5ef/lSMZX9pURQE/aaHWsAWt454BlTFac2yGXeSF7
	8t2SNINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQzn-00000008jtf-2ipI;
	Wed, 08 Apr 2026 11:22:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQzk-00000008jtA-2Cxp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:22:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21B9A3161;
	Wed,  8 Apr 2026 04:22:45 -0700 (PDT)
Received: from [10.164.148.132] (unknown [10.164.148.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7DA3F641;
	Wed,  8 Apr 2026 04:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775647370; bh=nzIVrbeTrgeSzO5p1iI/QcfcAw0k0mqxMISChqAnbUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PPEhc8ivtH5b4J6aQHGJ6gK2qKV/d8CQBYCgbAcl99z1Iq3rO6mpIphCnlPABwMaX
	 GyEuSZ5QgyisBODqeYaDaIdmj24qpQMoUZtOnyBzd2E5ZgdeMGvFFaZh/dDAeBSY8W
	 Zj/Um9JYKwkF+CS9ETGFcWCesSiKaYaqarimpT4w=
Message-ID: <0805d765-31af-49a0-acb4-8a72843f1213@arm.com>
Date: Wed, 8 Apr 2026 16:52:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-6-baohua@kernel.org>
 <b297383a-731c-4efa-95b7-0f198b098d11@arm.com>
 <CAGsJ_4xCtFe=5ofj4FW6cqu-fgR+K9BM7FPZRdAWOGP3YKtNzQ@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4xCtFe=5ofj4FW6cqu-fgR+K9BM7FPZRdAWOGP3YKtNzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_042252_732294_5DD08B8F 
X-CRM114-Status: GOOD (  34.98  )
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



On 08/04/26 10:42 am, Barry Song wrote:
> On Wed, Apr 8, 2026 at 12:20 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
>>> In many cases, the pages passed to vmap() may include high-order
>>> pages allocated with __GFP_COMP flags. For example, the systemheap
>>> often allocates pages in descending order: order 8, then 4, then 0.
>>> Currently, vmap() iterates over every page individually—even pages
>>> inside a high-order block are handled one by one.
>>>
>>> This patch detects high-order pages and maps them as a single
>>> contiguous block whenever possible.
>>>
>>> An alternative would be to implement a new API, vmap_sg(), but that
>>> change seems to be large in scope.
>>>
>>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>>> ---
>>
>> Coincidentally, I was working on the same thing :)
> 
> Interesting, thanks — at least I’ve got one good reviewer :-)
> 
>>
>> We have a usecase regarding Arm TRBE and SPE aux buffers.
>>
>> I'll take a look at your patches later, but my implementation is the
> 
> Yes. Please.
> 
> 
>> following, if you have any comments. I have squashed the patches into
>> a single diff.
> 
> Thanks very much, Dev. What you’ve done is quite similar to
> patches 5/8 and 6/8, although the code differs somewhat.
> 
>>
>>
>>
>> From ccb9670a52b7f50b1f1e07b579a1316f76b84811 Mon Sep 17 00:00:00 2001
>> From: Dev Jain <dev.jain@arm.com>
>> Date: Thu, 26 Feb 2026 16:21:29 +0530
>> Subject: [PATCH] arm64/perf: map AUX buffer with large pages
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  .../hwtracing/coresight/coresight-etm-perf.c  |  3 +-
>>  drivers/hwtracing/coresight/coresight-trbe.c  |  3 +-
>>  drivers/perf/arm_spe_pmu.c                    |  5 +-
>>  mm/vmalloc.c                                  | 86 ++++++++++++++++---
>>  4 files changed, 79 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 72017dcc3b7f1..e90a430af86bb 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -984,7 +984,8 @@ int __init etm_perf_init(void)
>>
>>         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
>>                                            PERF_PMU_CAP_ITRACE |
>> -                                          PERF_PMU_CAP_AUX_PAUSE);
>> +                                          PERF_PMU_CAP_AUX_PAUSE |
>> +                                          PERF_PMU_CAP_AUX_PREFER_LARGE);
>>
>>         etm_pmu.attr_groups             = etm_pmu_attr_groups;
>>         etm_pmu.task_ctx_nr             = perf_sw_context;
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
>> index 1511f8eb95afb..74e6ad891e236 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -760,7 +760,8 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>>         for (i = 0; i < nr_pages; i++)
>>                 pglist[i] = virt_to_page(pages[i]);
>>
>> -       buf->trbe_base = (unsigned long)vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
>> +       buf->trbe_base = (unsigned long)vmap(pglist, nr_pages,
>> +                        VM_MAP | VM_ALLOW_HUGE_VMAP, PAGE_KERNEL);
>>         if (!buf->trbe_base) {
>>                 kfree(pglist);
>>                 kfree(buf);
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index dbd0da1116390..90c349fd66b2c 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -1027,7 +1027,7 @@ static void *arm_spe_pmu_setup_aux(struct perf_event *event, void **pages,
>>         for (i = 0; i < nr_pages; ++i)
>>                 pglist[i] = virt_to_page(pages[i]);
>>
>> -       buf->base = vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
>> +       buf->base = vmap(pglist, nr_pages, VM_MAP | VM_ALLOW_HUGE_VMAP, PAGE_KERNEL);
>>         if (!buf->base)
>>                 goto out_free_pglist;
>>
>> @@ -1064,7 +1064,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
>>         spe_pmu->pmu = (struct pmu) {
>>                 .module = THIS_MODULE,
>>                 .parent         = &spe_pmu->pdev->dev,
>> -               .capabilities   = PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>> +               .capabilities   = PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE |
>> +                                 PERF_PMU_CAP_AUX_PREFER_LARGE,
>>                 .attr_groups    = arm_spe_pmu_attr_groups,
>>                 /*
>>                  * We hitch a ride on the software context here, so that
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 61caa55a44027..8482463d41203 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -660,14 +660,14 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
>>  {
>>         unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
>> -
>> +       unsigned long step = 1UL << (page_shift - PAGE_SHIFT);
>>         WARN_ON(page_shift < PAGE_SHIFT);
>>
>>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>>                         page_shift == PAGE_SHIFT)
>>                 return vmap_small_pages_range_noflush(addr, end, prot, pages);
>>
>> -       for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>> +       for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
>>                 int err;
>>
>>                 err = vmap_range_noflush(addr, addr + (1UL << page_shift),
>> @@ -678,8 +678,9 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>
>>                 addr += 1UL << page_shift;
>>         }
>> -
>> -       return 0;
>> +       if (IS_ALIGNED(nr, step))
>> +               return 0;
>> +       return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
>>  }
>>
>>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>> @@ -3514,6 +3515,50 @@ void vunmap(const void *addr)
>>  }
>>  EXPORT_SYMBOL(vunmap);
>>
>> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
>> +{
>> +       if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
>> +               return PMD_SHIFT;
>> +
>> +       return arch_vmap_pte_supported_shift(size);
>> +}
>> +
>> +static inline int __vmap_huge(struct page **pages, pgprot_t prot,
>> +               unsigned long addr, unsigned int count)
>> +{
>> +       unsigned int i = 0;
>> +       unsigned int shift;
>> +       unsigned long nr;
>> +
>> +       while (i < count) {
>> +               nr = num_pages_contiguous(pages + i, count - i);
>> +               shift = vm_shift(prot, nr << PAGE_SHIFT);
>> +               if (vmap_pages_range(addr, addr + (nr << PAGE_SHIFT),
>> +                                    pgprot_nx(prot), pages + i, shift) < 0) {
>> +                       return 1;
>> +               }
> 
> One observation on my side is that the performance gain is somewhat
> offset by page table zigzagging caused by what you are doing here -
> iterating each mem segment by vmap_pages_range() .

I recall having observed this problem half an year back, and I wrote
code similar to what you did with patch 3 - but I didn't observe any
performance improvement. I think that was because I was testing
vmalloc - most of the cost there lies in the page allocation.

So looks like this indeed is a benefit for vmap.

> 
> In patch 3/8, I enhanced vmap_small_pages_range_noflush() to
> avoid repeated pgd → p4d → pud → pmd → pte traversals for page
> shifts other than PAGE_SHIFT. This improves performance for
> vmalloc as well as vmap(). Then, in patch 7/8, I adopt the new
> vmap_small_pages_range_noflush() and eliminate the iteration.
> 
>> +               i += nr;
>> +               addr += (nr << PAGE_SHIFT);
>> +       }
>> +       return 0;
>> +}
>> +
>> +static unsigned long max_contiguous_stride_order(struct page **pages,
>> +               pgprot_t prot, unsigned int count)
>> +{
>> +       unsigned long max_shift = PAGE_SHIFT;
>> +       unsigned int i = 0;
>> +
>> +       while (i < count) {
>> +               unsigned long nr = num_pages_contiguous(pages + i, count - i);
>> +               unsigned long shift = vm_shift(prot, nr << PAGE_SHIFT);
>> +
>> +               max_shift = max(max_shift, shift);
>> +               i += nr;
>> +       }
>> +       return max_shift;
>> +}
>> +
>>  /**
>>   * vmap - map an array of pages into virtually contiguous space
>>   * @pages: array of page pointers
>> @@ -3552,15 +3597,32 @@ void *vmap(struct page **pages, unsigned int count,
>>                 return NULL;
>>
>>         size = (unsigned long)count << PAGE_SHIFT;
>> -       area = get_vm_area_caller(size, flags, __builtin_return_address(0));
>> +       if (flags & VM_ALLOW_HUGE_VMAP) {
>> +               /* determine from page array, the max alignment */
>> +               unsigned long max_shift = max_contiguous_stride_order(pages, prot, count);
>> +
>> +               area = __get_vm_area_node(size, 1 << max_shift, max_shift, flags,
>> +                                         VMALLOC_START, VMALLOC_END, NUMA_NO_NODE,
>> +                                         GFP_KERNEL, __builtin_return_address(0));
>> +       } else {
>> +               area = get_vm_area_caller(size, flags, __builtin_return_address(0));
>> +       }
>>         if (!area)
>>                 return NULL;
>>
>>         addr = (unsigned long)area->addr;
>> -       if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
>> -                               pages, PAGE_SHIFT) < 0) {
>> -               vunmap(area->addr);
>> -               return NULL;
>> +
>> +       if (flags & VM_ALLOW_HUGE_VMAP) {
>> +               if (__vmap_huge(pages, prot, addr, count)) {
>> +                       vunmap(area->addr);
>> +                       return NULL;
>> +               }
>> +       } else {
>> +               if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
>> +                                       pages, PAGE_SHIFT) < 0) {
>> +                       vunmap(area->addr);
>> +                       return NULL;
>> +               }
>>         }
>>
>>         if (flags & VM_MAP_PUT_PAGES) {
>> @@ -4011,11 +4073,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>>                  * their allocations due to apply_to_page_range not
>>                  * supporting them.
>>                  */
>> -
>> -               if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
>> -                       shift = PMD_SHIFT;
>> -               else
>> -                       shift = arch_vmap_pte_supported_shift(size);
>> +               shift = vm_shift(prot, size);
> 
> What I actually did is different. In patches 1/8 and 2/8, I
> extended the arm64 levels to support N * CONT_PTE, and let the
> final PTE mapping use the maximum possible batch after avoiding
> zigzag. This further improves all orders greater than CONT_PTE.
> 
> Thanks
> Barry


