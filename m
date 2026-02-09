Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A344FE7E0AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBI+jRRyuRr+QajwiPV5bCA0PKZRJLu20S4RKTSvJt4=; b=MrtdYM9dFJRXPyK0OcUlUtSdyy
	p2ETAtMVSFNbRwDeHMCMvkCcbETwy2AiNSnEjOGJDqoHBY2nXasOZRq3PeXpBTEoyovu0dKrtvxUQ
	pe2XXRkoo/sg3CYM1dWRI2jSgbygti330DVHZeY8O4IkBLfwF0MFqShT0zs5ULHqHyBPWZorHACN4
	g54cWh6LsV9k9sYJIyqBOnawBf5GWudfNomD22dGZHpUF7UfOJDS2Q7FjijqUygNROIcBYcabNTa5
	KcY2Npu7kUmKVB+7xD9ftKl3Q/yBCqobGUia+1lwga+gp/QdvDWojqC/qcMbxsCG6fMK8PTKqQ3bS
	jMp45lLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNna-0000000FA7h-0K7Z;
	Mon, 09 Feb 2026 09:43:18 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNnW-0000000FA7I-1XbQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770630190; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UBI+jRRyuRr+QajwiPV5bCA0PKZRJLu20S4RKTSvJt4=;
	b=HCkCStdbsRexAMVZkbvjIP2FuTJbOC3tM2BZmVEZl0XnyRfgfRUbKlDYBt1OIY8Tu5kybMHPAh6jAtWyukf3kpWcZwrB7/qY/vjrJ6SSowK4gTSVKTCKqpm5C4s0gduxGJZoBDygdqaHUkKd6bhD/xBVboob2CGWhwqsh2EKhXE=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WyqXdyS_1770630184 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 17:43:05 +0800
Message-ID: <ddedb72a-d24f-48bc-88b2-f6f99f3d45ad@linux.alibaba.com>
Date: Mon, 9 Feb 2026 17:43:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large
 folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <46d0b6bf-db7e-418f-a497-983db4d4d786@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <46d0b6bf-db7e-418f-a497-983db4d4d786@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_014314_831977_0A69DCC2 
X-CRM114-Status: GOOD (  16.52  )
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



On 2/9/26 5:38 PM, David Hildenbrand (Arm) wrote:
> On 12/26/25 07:07, Baolin Wang wrote:
>> Similar to folio_referenced_one(), we can apply batched unmapping for 
>> file
>> large folios to optimize the performance of file folios reclamation.
>>
>> Barry previously implemented batched unmapping for lazyfree anonymous 
>> large
>> folios[1] and did not further optimize anonymous large folios or file- 
>> backed
>> large folios at that stage. As for file-backed large folios, the batched
>> unmapping support is relatively straightforward, as we only need to clear
>> the consecutive (present) PTE entries for file-backed large folios.
>>
>> Performance testing:
>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, 
>> and try to
>> reclaim 8G file-backed folios via the memory.reclaim interface. I can 
>> observe
>> 75% performance improvement on my Arm64 32-core server (and 50%+ 
>> improvement
>> on my X86 machine) with this patch.
>>
>> W/o patch:
>> real    0m1.018s
>> user    0m0.000s
>> sys     0m1.018s
>>
>> W/ patch:
>> real    0m0.249s
>> user    0m0.000s
>> sys    0m0.249s
>>
>> [1] https://lore.kernel.org/ 
>> all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Acked-by: Barry Song <baohua@kernel.org>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/rmap.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 985ab0b085ba..e1d16003c514 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1863,9 +1863,10 @@ static inline unsigned int 
>> folio_unmap_pte_batch(struct folio *folio,
>>       end_addr = pmd_addr_end(addr, vma->vm_end);
>>       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>> -    /* We only support lazyfree batching for now ... */
>> -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> +    /* We only support lazyfree or file folios batching for now ... */
>> +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>>           return 1;
> 
> Right, the anon folio handling would require a bit more work in the
> 
> 
>      } else if (folio_test_anon(folio)) {
> 
> branch.
> 
> Do you intend to tackle that one as well?
 >> I'll reply to the fixup.

I'm not sure whether Barry has time to continue this work. If he does 
not, I can take over. Barry?

