Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A450D2D8F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfjLESDE0GhoTCQW840zs2QuoDtqV/3LL0EvmWi0pa4=; b=LkEjPrUEP3vkFHXc5WvA7kRqPN
	nKVFsY6mQ4nOE2Yencj2d9XBMlbjyO2tL7EvhvLgRei72o5CQREzGk7UbxrrzA+J4SL6IALawhGXm
	T1xux6l8vegF/1Plolfwc97PwX5Y2ZtZ5eCK7I0f2WT4vjBxQxTwCCwxKLA9OLXlOIrSxbh0jUcEb
	L2eWnmTA4ysN9nGfxHc4GAWSLr/MXzGTGnN6C2EBcDwJFCQe3JS4fzASDg6JWkMsf9edbPidIH3+J
	lObujv2i7v+sUhn47SL5c1ds8tFdU6oJ5t3tudNv2yP5XCJR4RNstFGCjA1EgnTmb4ouxePS+oTHt
	K5ONmNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgUB-0000000E4Vr-1r1k;
	Tue, 27 Jan 2026 10:39:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgU9-0000000E4VM-0Iwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:39:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FB991595;
	Tue, 27 Jan 2026 02:39:41 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6B9D3F73F;
	Tue, 27 Jan 2026 02:39:45 -0800 (PST)
Message-ID: <1bd6e787-00af-4d4c-a882-a0b8fb7f6a2f@arm.com>
Date: Tue, 27 Jan 2026 10:39:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] arm64: mm: Don't abuse memblock NOMAP to check
 for overlaps
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-20-ardb+git@google.com>
 <d0f2df03-21da-473f-ab89-64a964c18f08@arm.com>
 <CAMj1kXGsedZnV7GJZqo6Yfb4mi6YpMCu=fnHOwDib8-OxBij2g@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXGsedZnV7GJZqo6Yfb4mi6YpMCu=fnHOwDib8-OxBij2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023949_271767_AA2491C7 
X-CRM114-Status: GOOD (  26.08  )
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

On 27/01/2026 10:27, Ard Biesheuvel wrote:
> On Tue, 27 Jan 2026 at 11:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 26/01/2026 09:26, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> Now that the DRAM mapping routines respect existing table mappings and
>>> contiguous block and page mappings, it is no longer needed to fiddle
>>> with the memblock tables to set and clear the NOMAP attribute. Instead,
>>> map the kernel text and rodata alias first, avoiding contiguous
>>> mappings, so that they will not be added later when mapping the
>>> memblocks.
>>
>> Should we do something similar for kfence? Currently we have
>> arm64_kfence_alloc_pool() which marks some memory NOMAP then
>> arm64_kfence_map_pool() which PTE-maps it and clears NOMAP. Presumably we could
>> rationalize into a single function that does it all, prior to mapping the bulk
>> of the linear map?
>>
> 
> Yeah, good point - I did not spot that but I will address it in the
> next revision.
> 
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>  arch/arm64/mm/mmu.c | 27 ++++++++------------
>>>  1 file changed, 10 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 80587cd47ce7..18415d4743bf 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1149,12 +1149,17 @@ static void __init map_mem(void)
>>>               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>
>>>       /*
>>> -      * Take care not to create a writable alias for the
>>> -      * read-only text and rodata sections of the kernel image.
>>> -      * So temporarily mark them as NOMAP to skip mappings in
>>> -      * the following for-loop
>>> +      * Map the linear alias of the [_text, __init_begin) interval
>>> +      * as non-executable now, and remove the write permission in
>>> +      * mark_linear_text_alias_ro() above (which will be called after
>>> +      * alternative patching has completed). This makes the contents
>>> +      * of the region accessible to subsystems such as hibernate,
>>> +      * but protects it from inadvertent modification or execution.
>>> +      * Note that contiguous mappings cannot be remapped in this way,
>>> +      * so we should avoid them here.
>>>        */
>>> -     memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
>>> +     __map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
>>> +                    flags | NO_CONT_MAPPINGS);
>>
>> So the reason to disallow cont mappings is because we need to modify the
>> permissions later? It _is_ safe to change permissions on a live contiguous
>> mapping in this way. That was clarified in the architecture a couple of years
>> back and we rely on it for contpte_wrprotect_ptes(); see comment there.
>>
> 
> OK, good to know - I was hoping to get your take on this ...
> 
>> I think we could relax this?
>>
> 
> OK, I suppose that means that we can drop the NO_CONT_MAPPINGS here,
> but we still need to map the kernel text/rodata alias initially to
> ensure that no block mappings are created that would need to broken
> down, right?

Yes, but...

I think your intent is that the multiple __map_memblock() calls are just
controlling the allowed leaf mapping sizes. It becomes problematic if the 2
calls use different permissions... which they do.

PAGE_KERNEL vs pgprot_tagged(PAGE_KERNEL).

Is it possible that the text/rodata section ends up tagged, which is not intended?

Thanks,
Ryan




