Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6EEC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBhxaGgNjA37rFka6DmFsDUeF2nq5c9Khk7gfBsLM70=; b=j+q1YnzVjqqnkxMn4zwFAe7ofK
	nx7jxp73zl0HNf3SsxWtUO68p5Oxi0fZJZ5w2FmAa8YW6+jIaD0y0gfbC0VNVFPNuvzEJ3QZrNaNq
	LCmzPEalEfgMDEqiBUsgiGLAPngZULabv7IIpitTbh7O2AuZWP4qHsi9YqiteG/qxXjup3RSJ8NS6
	tzt8I5xBDCKCc+ZfsraH4jm9rbhHEFsFarZttMWGBrTztr+ZUqWv2KAZ/SV7MIU247tbZ2uGJC+BJ
	1+M7GFHKWd1784oYVj67/ouFiDWjypJ7+UrVTh7bFldlhJFGQrdccMOh1nywn1FEsOqzPmThNXRPp
	sCLVZGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU2y-00000009SzT-3XhG;
	Wed, 25 Jun 2025 17:36:32 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPMJ-00000008dvR-1mhW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:36:12 +0000
Message-ID: <c9168877-9d66-4963-b4a7-f0095ba2760f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750854955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBhxaGgNjA37rFka6DmFsDUeF2nq5c9Khk7gfBsLM70=;
	b=wgPth1dxQCRD0V3ed0dRj9oL9K1dKtEq8pPfSmknpZbvJKt1zMt+3QNhkKNfMfZLceO8Qz
	cPxPaRoBL8WCkPE1QYq1+gDJ6MBR7/n0ZwmoPuZBokr0YeUZSOSOzHn8u4cZN1bumaSLjB
	Pe1sgLMQ9jKHyZ+aeQC6qLoBmCS1cY8=
Date: Wed, 25 Jun 2025 20:35:37 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>, Barry Song <21cnbao@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_053611_600683_815E8CA6 
X-CRM114-Status: GOOD (  15.85  )
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



On 2025/6/25 20:25, David Hildenbrand wrote:
> On 25.06.25 14:20, Lance Yang wrote:
>>
>>
>> On 2025/6/25 20:09, David Hildenbrand wrote:
>>>>
>>>> Somehow, I feel we could combine your cleanup code—which handles a 
>>>> batch
>>>> size of "nr" between 1 and nr_pages—with the
>>>> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.
>>>
>>> Yeah, that's what I was suggesting. It would have to be part of the
>>> cleanup I think.
>>>
>>> I'm still wondering if there is a case where
>>>
>>> if (nr_pages == folio_nr_pages(folio))
>>>       goto walk_done;
>>>
>>> would be wrong when dealing with small folios.
>>>
>>>> In practice, this would let us skip almost all unnecessary checks,
>>>> except for a few rare corner cases.
>>>>
>>>> For those corner cases where "nr" truly falls between 1 and nr_pages,
>>>> we can just leave them as-is—performing the redundant check inside
>>>> page_vma_mapped_walk().
>>>
>>> I mean, batching mapcount+refcount updates etc. is always a win. If we
>>> end up doing some unnecessary pte_none() checks, that might be
>>> suboptimal but mostly noise in contrast to the other stuff we will
>>> optimize out 🙂
>>>
>>> Agreed that if we can easily avoid these pte_none() checks, we should do
>>> that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes 
>>> sense.
>>
>> Hmm... I have a question about the reference counting here ...
>>
>>         if (vma->vm_flags & VM_LOCKED)
>>             mlock_drain_local();
>>         folio_put(folio);
>>         /* We have already batched the entire folio */
>>
>> Does anyone else still hold a reference to this folio after folio_put()?
> 
> The caller of the unmap operation should better hold a reference :)

Ah, you're right. I should have realized that :(

Thanks,
Lance

> 
> Also, I am not sure why we don't perform a
> 
> folio_put_refs(folio, nr_pages);
> 
> ... :)
> 


