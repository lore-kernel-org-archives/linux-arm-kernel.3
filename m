Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B211EC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbYd9FuqMkzuNqD0GESnzrsyIx7SqDa0f5YDVufyOvQ=; b=ZkwH5U3qkx4DoZQKRNIbsVZdun
	Sp4tNGEdi6paZ8irUmUo4xRVyHagpZTHgqTKymphPs9FfuTC3fxc6We9GBEOLPPKrBXtoBeNiQCYF
	zSuBp4qR1aqeFpqLfMrFAd7zY9AW5modIZeEvWNnP7mOJkTBMuHilar6WRGb0rq9FyOl2BSrm4i0b
	kLzMcEsLHdBwDABhQa/KICoAyUb/JwVXjeYYTYLb4BtbSTrUlbD6UCiPLd8kWjkhIX8mX15sI/OeH
	eHkns9j6pa5wOhxoFsM16jg9R4bOcU4nfaZnBHjmZOq1zVaoAdB/YW6TrMO5weNtk4WVUTEvRuagr
	GLmq7amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykY-00000004AYr-1MB1;
	Mon, 17 Feb 2025 10:53:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxca-00000003xtQ-2bne
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:41:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAC5C152B;
	Mon, 17 Feb 2025 01:41:16 -0800 (PST)
Received: from [10.1.38.151] (XHFQ2J9959.cambridge.arm.com [10.1.38.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0823F6A8;
	Mon, 17 Feb 2025 01:40:54 -0800 (PST)
Message-ID: <9c7929f4-d024-4919-9b38-8cae05cc6fcf@arm.com>
Date: Mon, 17 Feb 2025 09:40:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/16] arm64/mm: Defer barriers when updating kernel
 mappings
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-17-ryan.roberts@arm.com>
 <9bc5527e-16f4-45cc-aced-55b1ace6c143@arm.com>
 <a5d66063-c3a0-46fc-ab88-21ae2448c9f0@arm.com>
 <0052097e-2284-4f9e-b37c-2ca2de527667@arm.com>
 <43d852bb-ab5f-40be-b188-166c57ab795c@arm.com>
 <77dfb8ae-2a57-4d76-a3d2-8a486dd9721b@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <77dfb8ae-2a57-4d76-a3d2-8a486dd9721b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_014100_759187_628C5E9A 
X-CRM114-Status: GOOD (  24.34  )
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

On 17/02/2025 04:48, Anshuman Khandual wrote:
> 
> 
> On 2/13/25 15:08, Ryan Roberts wrote:
>> On 13/02/2025 05:30, Anshuman Khandual wrote:
>>>
>>>
>>> On 2/10/25 16:42, Ryan Roberts wrote:
>>>> On 10/02/2025 08:03, Anshuman Khandual wrote:
>>>>>
>>>>>
>>>>> On 2/5/25 20:39, Ryan Roberts wrote:
>>>>>> Because the kernel can't tolerate page faults for kernel mappings, when
>>>>>> setting a valid, kernel space pte (or pmd/pud/p4d/pgd), it emits a
>>>>>> dsb(ishst) to ensure that the store to the pgtable is observed by the
>>>>>> table walker immediately. Additionally it emits an isb() to ensure that
>>>>>> any already speculatively determined invalid mapping fault gets
>>>>>> canceled.> 
>>>>>> We can improve the performance of vmalloc operations by batching these
>>>>>> barriers until the end of a set up entry updates. The newly added
>>>>>> arch_update_kernel_mappings_begin() / arch_update_kernel_mappings_end()
>>>>>> provide the required hooks.
>>>>>>
>>>>>> vmalloc improves by up to 30% as a result.
>>>>>>
>>>>>> Two new TIF_ flags are created; TIF_KMAP_UPDATE_ACTIVE tells us if we
>>>>>> are in the batch mode and can therefore defer any barriers until the end
>>>>>> of the batch. TIF_KMAP_UPDATE_PENDING tells us if barriers are queued to
>>>>>> be emited at the end of the batch.
>>>>>
>>>>> Why cannot this be achieved with a single TIF_KMAP_UPDATE_ACTIVE which is
>>>>> set in __begin(), cleared in __end() and saved across a __switch_to().
>>>>
>>>> So unconditionally emit the barriers in _end(), and emit them in __switch_to()
>>>> if TIF_KMAP_UPDATE_ACTIVE is set?
>>>
>>> Right.
>>>
>>>>
>>>> I guess if calling _begin() then you are definitely going to be setting at least
>>>> 1 PTE. So you can definitely emit the barriers unconditionally. I was trying to
>>>> protect against the case where you get pre-empted (potentially multiple times)
>>>> while in the loop. The TIF_KMAP_UPDATE_PENDING flag ensures you only emit the
>>>> barriers when you definitely need to. Without it, you would have to emit on
>>>> every pre-emption even if no more PTEs got set.
>>>>
>>>> But I suspect this is a premature optimization. Probably it will never occur. So
>>>
>>> Agreed.
>>
>> Having done this simplification, I've just noticed that one of the
>> arch_update_kernel_mappings_begin/end callsites is __apply_to_page_range() which
>> gets called for user space mappings as well as kernel mappings. So actually with
>> the simplification I'll be emitting barriers even when only user space mappings
>> were touched.
> 
> Right, that will not be desirable.
> 
>>
>> I think there are a couple of options to fix this:
>>
>> - Revert to the 2 flag approach. For the user space case, I'll get to _end() and
>> notice that no barriers are queued so will emit nothing.
>>
>> - Only set TIF_KMAP_UPDATE_ACTIVE if the address range passed to _begin() is a
>> kernel address range. I guess that's just a case of checking if the MSB is set
>> in "end"?
>>
>> - pass mm to _begin() and only set TIF_KMAP_UPDATE_ACTIVE if mm == &init_mm. I
>> guess this should be the same as option 2.
>>
>> I'm leaning towards option 2. But I have a niggling feeling that my proposed
>> check isn't quite correct. What do you think?
> 
> Option 2 and 3 looks better than the two flags approach proposed earlier. But is
> not option 3 bit more simplistic than option 2 ? Does getting struct mm argument
> into these function create more code churn ?

Actually looking at this again, I think the best thing is that when called in
the context of __apply_to_page_range(), we will only call
arch_update_kernel_mappings_[begin|end]() if mm == &init_mm. The function is
explicitly for "kernel mappings" so it doesn't make sense to call it for user
mappings.

Looking at the current implementations of arch_sync_kernel_mappings() they are
filtering on kernel addresses anyway, so this should be safe.

Thanks,
Ryan



