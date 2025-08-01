Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F3DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol3GtpiMM5QJ/cXIlKVDZAOq5nPw3ZNItLr/gjWoIRw=; b=tmlGyU9Os4rLitj0ROaaAd6g+S
	YewvWbadEc+R5Q0S6RfVac5C5EkWt0HfxDNQ5gKg/h/YD9tpCMAym8HaFLwwHVSiQhrXYpzx/Fz4a
	/FfGR4a4ACIc/EL7Pxhon02uc/nG0BTHpsOcVqPfykrohustI8oESL4xTBhCN7BisxD/W3o4CX4Xm
	j3691AQ/N7+fEDO/nj6swYLeZiEtXRqoUk/cRr4VZGpd2H/4rc9iLZoD1Qq3sY/YxYEtdJT0tlr4N
	D8Q+VCuH2Be+S+H1bZ8vJfLDqyMlYxERbKVOpYbSgl96Rypwx3oHz4IJVm/h0T12n9ck63lRYOlkz
	jGT7yTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoJG-00000005atP-3zLU;
	Fri, 01 Aug 2025 11:52:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnq4-00000005Y0X-2rZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 11:22:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C47931516;
	Fri,  1 Aug 2025 04:22:05 -0700 (PDT)
Received: from [10.57.54.55] (unknown [10.57.54.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 919B33F66E;
	Fri,  1 Aug 2025 04:22:12 -0700 (PDT)
Message-ID: <8d810d87-e6a5-42bf-83c5-ba3aaec1889f@arm.com>
Date: Fri, 1 Aug 2025 13:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
To: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com> <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
 <aEhKSq0zVaUJkomX@arm.com> <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
 <20250612145906.GB12912@willie-the-truck>
 <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_042216_823062_44529C55 
X-CRM114-Status: GOOD (  29.78  )
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

On 12/06/2025 18:00, Ryan Roberts wrote:
> On 12/06/2025 15:59, Will Deacon wrote:
>> On Tue, Jun 10, 2025 at 05:37:20PM +0100, Ryan Roberts wrote:
>>> On 10/06/2025 16:07, Catalin Marinas wrote:
>>>> On Tue, Jun 10, 2025 at 02:41:01PM +0100, Ryan Roberts wrote:
>>>>> On 10/06/2025 13:00, Catalin Marinas wrote:
>>>>>> On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
>>>>>>> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
>>>>>>> provided a quick fix to ensure that lazy_mmu_mode continues to work when
>>>>>>> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
>>>>>>> nest.
>>>>>>>
>>>>>>> The solution in that patch is the make the implementation tolerant to
>>>>>> s/is the make/is to make/
>>>>>>
>>>>>>> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
>>>>>>> exit becomes a nop. But this sacrifices the optimization opportunity for
>>>>>>> the remainder of the outer user.
>>>>>> [...]
>>>>>>> I wonder if you might be willing to take this for v6.16? I think its a neater
>>>>>>> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
>>>>>>> lazy_mmu_mode to be nested") - which is already in Linus's master.
>>>>>>>
>>>>>>> To be clear, the current solution is safe, I just think this is much neater.
>>>>>> Maybe better, though I wouldn't say much neater. One concern I have is
>>>>>> about whether we'll get other such nesting in the future and we need to
>>>>>> fix them in generic code. Here we control __kernel_map_pages() but we
>>>>>> may not for other cases.
>>>>>>
>>>>>> Is it the fault of the arch code that uses apply_to_page_range() via
>>>>>> __kernel_map_pages()? It feels like it shouldn't care about the lazy
>>>>>> mode as that's some detail of the apply_to_page_range() implementation.
>>>>>> Maybe this API should just allow nesting.
>>>>> I don't think it is possible to properly support nesting:
>>>>>
>>>>> enter_lazy_mmu
>>>>>     for_each_pte {
>>>>>         read/modify-write pte
>>>>>
>>>>>         alloc_page
>>>>>             enter_lazy_mmu
>>>>>                 make page valid
>>>>>             exit_lazy_mmu
>>>>>
>>>>>         write_to_page
>>>>>     }
>>>>> exit_lazy_mmu
>>>>>
>>>>> This example only works because lazy_mmu doesn't support nesting. The "make page
>>>>> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
>>>>> page can be accessed in write_to_page. If nesting was supported, the inner
>>>>> exit_lazy_mmu would become a nop and write_to_page would explode.
>>>> What I meant is for enter/exit_lazy_mmu to handle a kind of de-nesting
>>>> themselves: enter_lazy_mmu would emit the barriers if already in lazy
>>>> mode, clear pending (well, it doesn't need to do this but it may be
>>>> easier to reason about in terms of flattening). exit_lazy_mmu also needs
>>>> to emit the barriers but leave the lazy mode on if already on when last
>>>> entered. This does need some API modifications to return the old mode on
>>>> enter and get an argument for exit. But the correctness wouldn't be
>>>> affected since exit_lazy_mmu still emits the barriers irrespective of
>>>> the nesting level.
>>> Ahh I see what you mean now; exit always emits barriers but only the last exit
>>> clears TIF_LAZY_MMU.
>>>
>>> I think that's much cleaner, but we are changing the API which needs changes to
>>> all the arches and my attempt at [1] didn't really gain much enthusiasm.
>> To be honest, I don't think the proposal in this series is really
>> improving what we have. Either we support nested lazy mode or we don't;
>> having __kernel_map_pages() mess around with the lazy mmu state because
>> it somehow knows that set_memory_valid() is going to use it is fragile
>> and ugly.
>>
>> So I'm incined to leave the current code as-is, unless we can remove it
>> in favour of teaching the core code how to handle it instead.
> Yeah fair enough. I'm not going to have time to do the proper nesting support
> thing. But I'll see if I can find someone internally that I might be able to
> convince. If not, we'll just leave as is.

I've started working on supporting nesting as Catalin suggested above -
modifying the API so that enter() returns whether the call is nested,
and leave() takes the value returned by enter(). I've got it working
without too much trouble, there's a fair amount of churn at the call
sites but a trivial Coccinelle script can handle most of them.

This new approach will also help with protecting page tables with
kpkeys: lazy_mmu is very useful to write to POR_EL1 less often [1], but
this currently assumes that nesting doesn't occur. In fact the new API
should allow the old value of POR_EL1 to be returned by enter(), meaning
we wouldn't need to store it in a thread-local variable.

- Kevin

[1]
https://lore.kernel.org/linux-mm/20250411091631.954228-19-kevin.brodsky@arm.com/


