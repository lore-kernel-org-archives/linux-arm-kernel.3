Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB6AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLiuMRtcmExZlAb2vPZafFZMyEqiWSdyJ2XHpTWjryU=; b=yypfrcyQVFxuquO4fsjCUXzDZt
	GkHYVxhFpEQgEdkogH5ovj4zk9i5RfxoRj40Brr1V/Bim4MQBaJZem9hES2RTue0vknJVhN44g9TG
	Zwa7SftHu83IU/qQFemsmrWYGO1i/YCkLychfk9ecQTxg1mNhvE+9Rm3NLwtsOyW+h3tvqmZhRJAu
	03w9qL5xNME2RbZpWu5ydMnYO/tBdpX5oB6KO/Eo6VJfyP9+ThLZqYDvQ7WERp0KbXg9CZMXXMkzZ
	dJ3LRhmLRns9HRgkBOrne6N+fcZZjEnEZXDEgVSQoKm3zW4iE0VQiWvUBGEBNBnKaDJX4+byTeK74
	eaEq6hxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBqJ-0000000FF92-03nT;
	Fri, 27 Jun 2025 16:22:23 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB1U-0000000F6jB-42XV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:29:54 +0000
Message-ID: <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751038189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLiuMRtcmExZlAb2vPZafFZMyEqiWSdyJ2XHpTWjryU=;
	b=jojdp3aJ6B+Xgwpz/k6+OhYLJXmPgXf95Us1PNv0bB6R1+gv6FBAjoT2fm5yhc9bnqacrM
	dJgOVT4u5v1BYJtWnvmK5l8QzMJqxt7gFKd8YtXf0nkUr4H7+W/qnhtPH/Z0E7K4fZlxiG
	YH3Sa6PrtnlBPZ17rz56nOlQAruaDLA=
Date: Fri, 27 Jun 2025 23:29:11 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
 <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
 <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
 <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082953_167637_59C40F05 
X-CRM114-Status: GOOD (  22.55  )
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



On 2025/6/27 18:13, David Hildenbrand wrote:
> On 27.06.25 09:36, Barry Song wrote:
>> On Fri, Jun 27, 2025 at 7:15 PM Lance Yang <lance.yang@linux.dev> wrote:
>>>
>>>
>>>
>>> On 2025/6/27 14:55, Barry Song wrote:
>>>> On Fri, Jun 27, 2025 at 6:52 PM Barry Song <21cnbao@gmail.com> wrote:
>>>>>
>>>>> On Fri, Jun 27, 2025 at 6:23 PM Lance Yang <ioworker0@gmail.com> 
>>>>> wrote:
>>>>>>
>>>>>> From: Lance Yang <lance.yang@linux.dev>
>>>>>>
>>>>>> As pointed out by David[1], the batched unmap logic in 
>>>>>> try_to_unmap_one()
>>>>>> can read past the end of a PTE table if a large folio is mapped 
>>>>>> starting at
>>>>>> the last entry of that table. It would be quite rare in practice, as
>>>>>> MADV_FREE typically splits the large folio ;)
>>>>>>
>>>>>> So let's fix the potential out-of-bounds read by refactoring the 
>>>>>> logic into
>>>>>> a new helper, folio_unmap_pte_batch().
>>>>>>
>>>>>> The new helper now correctly calculates the safe number of pages 
>>>>>> to scan by
>>>>>> limiting the operation to the boundaries of the current VMA and 
>>>>>> the PTE
>>>>>> table.
>>>>>>
>>>>>> In addition, the "all-or-nothing" batching restriction is removed to
>>>>>> support partial batches. The reference counting is also cleaned up 
>>>>>> to use
>>>>>> folio_put_refs().
>>>>>>
>>>>>> [1] https://lore.kernel.org/linux-mm/ 
>>>>>> a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>>>>>
>>>>>
>>>>> What about ?
>>>>>
>>>>> As pointed out by David[1], the batched unmap logic in 
>>>>> try_to_unmap_one()
>>>>> may read past the end of a PTE table when a large folio spans 
>>>>> across two PMDs,
>>>>> particularly after being remapped with mremap(). This patch fixes the
>>>>> potential out-of-bounds access by capping the batch at vm_end and 
>>>>> the PMD
>>>>> boundary.
>>>>>
>>>>> It also refactors the logic into a new helper, 
>>>>> folio_unmap_pte_batch(),
>>>>> which supports batching between 1 and folio_nr_pages. This improves 
>>>>> code
>>>>> clarity. Note that such cases are rare in practice, as MADV_FREE 
>>>>> typically
>>>>> splits large folios.
>>>>
>>>> Sorry, I meant that MADV_FREE typically splits large folios if the 
>>>> specified
>>>> range doesn't cover the entire folio.
>>>
>>> Hmm... I got it wrong as well :( It's the partial coverage that triggers
>>> the split.
>>>
>>> how about this revised version:
>>>
>>> As pointed out by David[1], the batched unmap logic in 
>>> try_to_unmap_one()
>>> may read past the end of a PTE table when a large folio spans across two
>>> PMDs, particularly after being remapped with mremap(). This patch fixes
>>> the potential out-of-bounds access by capping the batch at vm_end and 
>>> the
>>> PMD boundary.
>>>
>>> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
>>> which supports batching between 1 and folio_nr_pages. This improves code
>>> clarity. Note that such boundary-straddling cases are rare in 
>>> practice, as
>>> MADV_FREE will typically split a large folio if the advice range does 
>>> not
>>> cover the entire folio.
>>
>> I assume the out-of-bounds access must be fixed, even though it is very
>> unlikely. It might occur after a large folio is marked with MADV_FREE and
>> then remapped to an unaligned address, potentially crossing two PTE 
>> tables.
> 
> Right. If it can be triggered from userspace, it doesn't matter how 
> likely/common/whatever it is. It must be fixed.

Agreed. It must be fixed regardless of how rare the scenario is ;)

> 
>>
>> A batch size between 2 and nr_pages - 1 is practically rare, as we 
>> typically
>> split large folios when MADV_FREE does not cover the entire folio range.
>> Cases where a batch of size 2 or nr_pages - 1 occurs may only happen if a
>> large folio is partially unmapped after being marked MADV_FREE, which is
>> quite an unusual pattern in userspace.
> 
> I think the point is rather "Simplify the code by not special-casing for 
> completely mapped folios, there is no real reason why we cannot batch 
> ranges that don't cover the complete folio.".

Yeah. That makes the code cleaner and more generic, as there is no
strong reason to special-case for fully mapped folios ;)

Based on that, I think we're on the same page now. I'd like to post
the following commit message for the next version:

```
As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
may read past the end of a PTE table when a large folio's PTE mappings
are not fully contained within a single page table.

While this scenario might be rare, an issue triggerable from userspace must
be fixed regardless of its likelihood. This patch fixes the out-of-bounds
access by refactoring the logic into a new helper, folio_unmap_pte_batch().

The new helper correctly calculates the safe batch size by capping the
scan at both the VMA and PMD boundaries. To simplify the code, it also
supports partial batching (i.e., any number of pages from 1 up to the
calculated safe maximum), as there is no strong reason to special-case
for fully mapped folios.
```

So, wdyt?

Thanks,
Lance





