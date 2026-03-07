Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF34FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 01:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzar5nNFlAv1Huoqo+I+k0T1XEOUIvMAuNiWgwlVg7Y=; b=Z4zdyKwIl4t1bnsvRQqD21iB2T
	+Jz1EQj4onU6+pG/3lmDdw+8276CxHIFgaWXz6Mf/OZ1zSNQ36h7r9JyVKqO1EsjQkjFP6DDzUS7j
	35c5ibN+yPwBJrEL8kPWGYFa+al8eHW1rsCz37BsPCaDATjmwo7DpZxVLx5tOfvdhOypcyZyKq0m1
	FQ19GKKqN/4UbxYwlb0P5srZ7Tq+AJXWWK/HINSeg6xGYEzkbjT8LDx931lb0GvGtlEbuQoOvzMMt
	cQFDU0ibnodNMqIVWTRIUB4F8+AmcSp7j4JuIPNAEt5ci3TuW0mn3j8JjaugGIKmvg6QAroX6b6bG
	NXR0GVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygTA-00000004m7Q-3DPt;
	Sat, 07 Mar 2026 01:28:40 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygT6-00000004m6S-3Lef
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 01:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772846912; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kzar5nNFlAv1Huoqo+I+k0T1XEOUIvMAuNiWgwlVg7Y=;
	b=aAuJR7XSCbY/gsKxSmIVhl/WGbt2EQhHKbCZXReNx+tSKAF03aIAZeuIqkZA3rwAYBZfCuqVIZETCL63xzNRaenWRmeBdePMQodsg4pbUZM37uiIaLNk3pmG0MEov3Jr6/MOjNnQfdHk6dNQVzG/Z8tpi7e6YRIUvuzWxM1c7oA=
Received: from 30.42.98.36(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-OMjm5_1772846909 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Mar 2026 09:28:30 +0800
Message-ID: <c607b6fd-a682-4400-a7fd-abe83152db10@linux.alibaba.com>
Date: Sat, 7 Mar 2026 09:28:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: mm: implement the architecture-specific
 test_and_clear_young_ptes()
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
 <7f891d42a720cc2e57862f3b79e4f774404f313c.1772778858.git.baolin.wang@linux.alibaba.com>
 <6305e05e-2911-42b0-b6f5-7fdde787b778@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <6305e05e-2911-42b0-b6f5-7fdde787b778@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_172837_731418_8159A02C 
X-CRM114-Status: GOOD (  14.84  )
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



On 3/6/26 10:47 PM, David Hildenbrand (Arm) wrote:
> On 3/6/26 07:43, Baolin Wang wrote:
>> Implement the Arm64 architecture-specific test_and_clear_young_ptes() to enable
>> batched checking of young flags, improving performance during large folio
>> reclamation when MGLRU is enabled.
>>
>> While we're at it, simplify ptep_test_and_clear_young() by calling
>> test_and_clear_young_ptes(). Since callers guarantee that PTEs are present
>> before calling these functions, we can use pte_cont() to check the CONT_PTE
>> flag instead of pte_valid_cont().
>>
>> Performance testing:
>> Enable MGLRU, then allocate 10G clean file-backed folios by mmap() in a memory
>> cgroup, and try to reclaim 8G file-backed folios via the memory.reclaim interface.
>> I can observe 60%+ performance improvement on my Arm64 32-core server (and about
>> 15% improvement on my X86 machine).
>>
>> W/o patchset:
>> real	0m0.470s
>> user	0m0.000s
>> sys	0m0.470s
>>
>> W/ patchset:
>> real	0m0.180s
>> user	0m0.001s
>> sys	0m0.179s
>>
>> Reviewed-by: Rik van Riel <riel@surriel.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index aa4b13da6371..ab451d20e4c5 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1812,16 +1812,22 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>>   	return __ptep_get_and_clear(mm, addr, ptep);
>>   }
>>   
>> +#define test_and_clear_young_ptes test_and_clear_young_ptes
>> +static inline int test_and_clear_young_ptes(struct vm_area_struct *vma,
>> +					    unsigned long addr, pte_t *ptep,
>> +					    unsigned int nr)
>> +{
>> +	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
>> +		return __ptep_test_and_clear_young(vma, addr, ptep);
>> +
>> +	return contpte_test_and_clear_young_ptes(vma, addr, ptep, nr);
>> +}
> 
> Thinking out loud, what would happen if

Good questions, I think the contpte_test_and_clear_young_ptes() takes 
that into account.

> (a) The range spans multiple possible cont ranges (like, 64 ptes).

The contpte_test_and_clear_young_ptes() will call 
contpte_align_addr_ptep() to align the range to cont‑block boundary, 
that means the range can span multiple cont blocks.

int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
					unsigned long addr, pte_t *ptep,
					unsigned int nr)
{
	unsigned long end = addr + nr * PAGE_SIZE;
	int young = 0;

	ptep = contpte_align_addr_ptep(&addr, &end, ptep, nr);
	for (; addr != end; ptep++, addr += PAGE_SIZE)
		young |= __ptep_test_and_clear_young(vma, addr, ptep);

	return young;
}

> 
> (b) The first pte is !pte_cont(), but some others in there are?

IMO they can’t be handled in a single batch. Since the folio_pte_batch() 
will group consecutive !cont PTEs into one batch and consecutive cont 
PTEs into another (assume all PTEs belong to a single large folio), 
because their PTE entries have different CONT bits.

Even if the callers do so, contpte_align_addr_ptep() will check the 
pte_cont() of the start and end address to align the range appropriately.

