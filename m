Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DCACA5FFB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXPU57WcR75YcJ/pW45lwH9A6f/k0LxYXK/jf1YSvq8=; b=h1I8ncNFYcJ8JItmeJwfCo8QDs
	DxliGqWLc9JzCmJ3UVt0PFYiaAUogigwI9A9QyFn91gzNCC4O/9ZckgCSpXTb3er3P11v06FIkNBZ
	4T6R651a3YnFNKKjtC56vzkcnQ+uAaSAgXIreA6b5/46mGRcA/rDRfJ1Y5uQeZ9BmiBlP8XFxqLMv
	F7HL9KPQyR0kQjvDnMV5WORw05H3UqsUjGsVMKovBiUh2bjhd81J3Olvt5DavfTBu8LZgxx0GUoVn
	e4ctdCM7BOoUEp1ZgxdHwgSKtT2aV3fqbsNS40HMUA5qiCfKwNsuddi+bamTizfF2xrw1WQddaXi1
	vnlflUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjb6-00000001TBl-2DhI;
	Mon, 19 Jan 2026 07:22:48 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjb1-00000001TAm-3pYp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768807356; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JXPU57WcR75YcJ/pW45lwH9A6f/k0LxYXK/jf1YSvq8=;
	b=ZCxaBhNMhic+s3fEvM+upzL4xiQMhKKx9iWTlvSVoHzVF8zq5cSXvd+pc0Ttma9+l9MmoH3Nuyfo0z0ipJLa5ZwYK6M1+4kXYP7/3LxMnBO+QEYuPjgcaCsyFmmjSHnxgo9Ql0071Kq+t02JYg6MWUC6AT/klhUdRDrTrY2b2RA=
Received: from 30.74.144.151(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WxJbKuv_1768807346 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Jan 2026 15:22:27 +0800
Message-ID: <3bddd08d-ab25-4aea-a863-353cf143798e@linux.alibaba.com>
Date: Mon, 19 Jan 2026 15:22:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large
 folios
To: Dev Jain <dev.jain@arm.com>, Barry Song <21cnbao@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master>
 <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master>
 <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
 <CAGsJ_4yo-EE__1VzHqxE8ehDOFQuxqP9GXcskkeZ-WTTyz12_A@mail.gmail.com>
 <ccce0551-489a-4612-ab5d-2dd8a5cae66c@arm.com>
 <29634bee-18c6-42c2-ac7f-703d4dfed867@linux.alibaba.com>
 <6ed22a34-ce8a-4531-9776-b28e1a942450@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <6ed22a34-ce8a-4531-9776-b28e1a942450@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_232245_826968_7EB413C2 
X-CRM114-Status: GOOD (  33.21  )
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



On 1/19/26 2:36 PM, Dev Jain wrote:
> 
> On 19/01/26 11:20 am, Baolin Wang wrote:
>>
>>
>> On 1/18/26 1:46 PM, Dev Jain wrote:
>>>
>>> On 16/01/26 7:58 pm, Barry Song wrote:
>>>> On Fri, Jan 16, 2026 at 5:53 PM Dev Jain <dev.jain@arm.com> wrote:
>>>>>
>>>>> On 07/01/26 7:16 am, Wei Yang wrote:
>>>>>> On Wed, Jan 07, 2026 at 10:29:25AM +1300, Barry Song wrote:
>>>>>>> On Wed, Jan 7, 2026 at 2:22 AM Wei Yang <richard.weiyang@gmail.com>
>>>>>>> wrote:
>>>>>>>> On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
>>>>>>>>> Similar to folio_referenced_one(), we can apply batched unmapping
>>>>>>>>> for file
>>>>>>>>> large folios to optimize the performance of file folios reclamation.
>>>>>>>>>
>>>>>>>>> Barry previously implemented batched unmapping for lazyfree
>>>>>>>>> anonymous large
>>>>>>>>> folios[1] and did not further optimize anonymous large folios or
>>>>>>>>> file-backed
>>>>>>>>> large folios at that stage. As for file-backed large folios, the
>>>>>>>>> batched
>>>>>>>>> unmapping support is relatively straightforward, as we only need
>>>>>>>>> to clear
>>>>>>>>> the consecutive (present) PTE entries for file-backed large folios.
>>>>>>>>>
>>>>>>>>> Performance testing:
>>>>>>>>> Allocate 10G clean file-backed folios by mmap() in a memory
>>>>>>>>> cgroup, and try to
>>>>>>>>> reclaim 8G file-backed folios via the memory.reclaim interface. I
>>>>>>>>> can observe
>>>>>>>>> 75% performance improvement on my Arm64 32-core server (and 50%+
>>>>>>>>> improvement
>>>>>>>>> on my X86 machine) with this patch.
>>>>>>>>>
>>>>>>>>> W/o patch:
>>>>>>>>> real    0m1.018s
>>>>>>>>> user    0m0.000s
>>>>>>>>> sys     0m1.018s
>>>>>>>>>
>>>>>>>>> W/ patch:
>>>>>>>>> real   0m0.249s
>>>>>>>>> user   0m0.000s
>>>>>>>>> sys    0m0.249s
>>>>>>>>>
>>>>>>>>> [1]
>>>>>>>>> https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
>>>>>>>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>>>>>>> Acked-by: Barry Song <baohua@kernel.org>
>>>>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>>>>> ---
>>>>>>>>> mm/rmap.c | 7 ++++---
>>>>>>>>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>>>>> index 985ab0b085ba..e1d16003c514 100644
>>>>>>>>> --- a/mm/rmap.c
>>>>>>>>> +++ b/mm/rmap.c
>>>>>>>>> @@ -1863,9 +1863,10 @@ static inline unsigned int
>>>>>>>>> folio_unmap_pte_batch(struct folio *folio,
>>>>>>>>>         end_addr = pmd_addr_end(addr, vma->vm_end);
>>>>>>>>>         max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>>>>>>>>
>>>>>>>>> -      /* We only support lazyfree batching for now ... */
>>>>>>>>> -      if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>>>>>>>> +      /* We only support lazyfree or file folios batching for now
>>>>>>>>> ... */
>>>>>>>>> +      if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>>>>>>>>>                 return 1;
>>>>>>>>> +
>>>>>>>>>         if (pte_unused(pte))
>>>>>>>>>                 return 1;
>>>>>>>>>
>>>>>>>>> @@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio
>>>>>>>>> *folio, struct vm_area_struct *vma,
>>>>>>>>>                          *
>>>>>>>>>                          * See Documentation/mm/mmu_notifier.rst
>>>>>>>>>                          */
>>>>>>>>> -                      dec_mm_counter(mm, mm_counter_file(folio));
>>>>>>>>> +                      add_mm_counter(mm, mm_counter_file(folio),
>>>>>>>>> -nr_pages);
>>>>>>>>>                 }
>>>>>>>>> discard:
>>>>>>>>>                 if (unlikely(folio_test_hugetlb(folio))) {
>>>>>>>>> -- 
>>>>>>>>> 2.47.3
>>>>>>>>>
>>>>>>>> Hi, Baolin
>>>>>>>>
>>>>>>>> When reading your patch, I come up one small question.
>>>>>>>>
>>>>>>>> Current try_to_unmap_one() has following structure:
>>>>>>>>
>>>>>>>>       try_to_unmap_one()
>>>>>>>>           while (page_vma_mapped_walk(&pvmw)) {
>>>>>>>>               nr_pages = folio_unmap_pte_batch()
>>>>>>>>
>>>>>>>>               if (nr_pages = folio_nr_pages(folio))
>>>>>>>>                   goto walk_done;
>>>>>>>>           }
>>>>>>>>
>>>>>>>> I am thinking what if nr_pages > 1 but nr_pages != folio_nr_pages().
>>>>>>>>
>>>>>>>> If my understanding is correct, page_vma_mapped_walk() would start
>>>>>>>> from
>>>>>>>> (pvmw->address + PAGE_SIZE) in next iteration, but we have already
>>>>>>>> cleared to
>>>>>>>> (pvmw->address + nr_pages * PAGE_SIZE), right?
>>>>>>>>
>>>>>>>> Not sure my understanding is correct, if so do we have some reason
>>>>>>>> not to
>>>>>>>> skip the cleared range?
>>>>>>> I don’t quite understand your question. For nr_pages > 1 but not equal
>>>>>>> to nr_pages, page_vma_mapped_walk will skip the nr_pages - 1 PTEs
>>>>>>> inside.
>>>>>>>
>>>>>>> take a look:
>>>>>>>
>>>>>>> next_pte:
>>>>>>>                  do {
>>>>>>>                          pvmw->address += PAGE_SIZE;
>>>>>>>                          if (pvmw->address >= end)
>>>>>>>                                  return not_found(pvmw);
>>>>>>>                          /* Did we cross page table boundary? */
>>>>>>>                          if ((pvmw->address & (PMD_SIZE - PAGE_SIZE))
>>>>>>> == 0) {
>>>>>>>                                  if (pvmw->ptl) {
>>>>>>>                                          spin_unlock(pvmw->ptl);
>>>>>>>                                          pvmw->ptl = NULL;
>>>>>>>                                  }
>>>>>>>                                  pte_unmap(pvmw->pte);
>>>>>>>                                  pvmw->pte = NULL;
>>>>>>>                                  pvmw->flags |= PVMW_PGTABLE_CROSSED;
>>>>>>>                                  goto restart;
>>>>>>>                          }
>>>>>>>                          pvmw->pte++;
>>>>>>>                  } while (pte_none(ptep_get(pvmw->pte)));
>>>>>>>
>>>>>> Yes, we do it in page_vma_mapped_walk() now. Since they are
>>>>>> pte_none(), they
>>>>>> will be skipped.
>>>>>>
>>>>>> I mean maybe we can skip it in try_to_unmap_one(), for example:
>>>>>>
>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>> index 9e5bd4834481..ea1afec7c802 100644
>>>>>> --- a/mm/rmap.c
>>>>>> +++ b/mm/rmap.c
>>>>>> @@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio
>>>>>> *folio, struct vm_area_struct *vma,
>>>>>>                  */
>>>>>>                 if (nr_pages == folio_nr_pages(folio))
>>>>>>                         goto walk_done;
>>>>>> +             else {
>>>>>> +                     pvmw.address += PAGE_SIZE * (nr_pages - 1);
>>>>>> +                     pvmw.pte += nr_pages - 1;
>>>>>> +             }
>>>>>>                 continue;
>>>>>>    walk_abort:
>>>>>>                 ret = false;
>>>>> I am of the opinion that we should do something like this. In the
>>>>> internal pvmw code,
>>>> I am still not convinced that skipping PTEs in try_to_unmap_one()
>>>> is the right place. If we really want to skip certain PTEs early,
>>>> should we instead hint page_vma_mapped_walk()? That said, I don't
>>>> see much value in doing so, since in most cases nr is either 1 or
>>>> folio_nr_pages(folio).
>>>>
>>>>> we keep skipping ptes till the ptes are none. With my proposed
>>>>> uffd-fix [1], if the old
>>>>> ptes were uffd-wp armed, pte_install_uffd_wp_if_needed will convert
>>>>> all ptes from none
>>>>> to not none, and we will lose the batching effect. I also plan to
>>>>> extend support to
>>>>> anonymous folios (therefore generalizing for all types of memory)
>>>>> which will set a
>>>>> batch of ptes as swap, and the internal pvmw code won't be able to
>>>>> skip through the
>>>>> batch.
>>>> Thanks for catching this, Dev. I already filter out some of the more
>>>> complex cases, for example:
>>>> if (pte_unused(pte))
>>>>           return 1;
>>>>
>>>> Since the userfaultfd write-protection case is also a corner case,
>>>> could we filter it out as well?
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index c86f1135222b..6bb8ba6f046e 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1870,6 +1870,9 @@ static inline unsigned int
>>>> folio_unmap_pte_batch(struct folio *folio,
>>>>           if (pte_unused(pte))
>>>>                   return 1;
>>>>
>>>> +       if (userfaultfd_wp(vma))
>>>> +               return 1;
>>>> +
>>>>           return folio_pte_batch(folio, pvmw->pte, pte, max_nr);
>>>> }
>>>>
>>>> Just offering a second option — yours is probably better.
>>>
>>> No. This is not an edge case. This is a case which gets exposed by your
>>> work, and
>>> I believe that if you intend to get the file folio batching thingy in,
>>> then you
>>> need to fix the uffd stuff too.
>>
>> Barry’s point isn’t that this is an edge case. I think he means that uffd
>> is not a common performance-sensitive scenario in production. Also, we
>> typically fall back to per-page handling for uffd cases (see
>> finish_fault() and alloc_anon_folio()). So I perfer to follow Barry’s
>> suggestion and filter out the uffd cases until we have test case to show
>> performance improvement.
> 
> I am of the opinion that you are making the wrong analogy here. The
> per-page fault fidelity is *required* for uffd.
> 
> When you say you want to support file folio batched unmapping, I think it's
> inappropriate to say "let us refuse to
> 
> batch if the pte mapping the file folio is smeared with a particular bit
> and consider it a totally different case". Instead
> 
> of getting in folio (all memory types) batched unmapping in, we have
> already broken this to "lazyfree folio", then
> 
> "file folio", the remaining being "anon folio". Now you intend to break
> "file folio" to "file folio non uffd" and "file folio uffd".

At least for me, I think this is a reasonable approach: break a complex 
problem into smaller features and address them step by step (possibly by 
different contributors in the community). This makes it easier for 
reviewers to focus and discuss. You can see that batched unmapping for 
anonymous folios still has ongoing discussion.

As I mentioned, since uffd is not a common performance-sensitive 
scenario in production, we need to continue discussing whether we 
actually need to support batched unmapping for uffd, and support the 
decision with technical feedback and performance data. So I’d prefer to 
discuss it in a separate patch.

David and Lorenzo, what do you think?

