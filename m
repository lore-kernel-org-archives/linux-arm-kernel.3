Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA12C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qup7p3iskqB0jQJHVdFjzUN18bwQ/sv/ETulvRRuKAo=; b=j70osDeBkUWylCF9B7cRNiA18x
	dK6FFJfZfwwYO7YU3tERfUd/GMP+oIEEUMAv1w5fX9jcn5IwkhEbaw426VP+rgwnAUzX4stSdIJ6p
	Sr+hYkjdmNNsNSA33ig349dkq8QRHQjHTblV5wmTp+gCJFeKrv3LE47adEO4aKpZCrfQuP5xwllxA
	zSa37XLqIdKZxxm4A+u8MfgtohEta4fvPZGtzj/XfodyS+RdwNPeBfLJvBdJtvpaV+1UEFX1skpuS
	NGI8BMeV3OwojO7H7AwQmdU25Vo+Sv7ol70iQdYdlszI5JOQvLuKjIcweWqZkaFXbdqDpC4tp+fj4
	0kxdJ5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Db-0000000804O-2LVG;
	Tue, 10 Jun 2025 20:05:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1yW-00000007Uiq-02An
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:37:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93BD714BF;
	Tue, 10 Jun 2025 09:37:03 -0700 (PDT)
Received: from [10.1.33.221] (XHFQ2J9959.cambridge.arm.com [10.1.33.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EE033F673;
	Tue, 10 Jun 2025 09:37:22 -0700 (PDT)
Message-ID: <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
Date: Tue, 10 Jun 2025 17:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com> <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
 <aEhKSq0zVaUJkomX@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aEhKSq0zVaUJkomX@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_093724_134865_49EC2C7C 
X-CRM114-Status: GOOD (  32.13  )
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

On 10/06/2025 16:07, Catalin Marinas wrote:
> On Tue, Jun 10, 2025 at 02:41:01PM +0100, Ryan Roberts wrote:
>> On 10/06/2025 13:00, Catalin Marinas wrote:
>>> On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
>>>> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
>>>> provided a quick fix to ensure that lazy_mmu_mode continues to work when
>>>> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
>>>> nest.
>>>>
>>>> The solution in that patch is the make the implementation tolerant to
>>>
>>> s/is the make/is to make/
>>>
>>>> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
>>>> exit becomes a nop. But this sacrifices the optimization opportunity for
>>>> the remainder of the outer user.
>>> [...]
>>>> I wonder if you might be willing to take this for v6.16? I think its a neater
>>>> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
>>>> lazy_mmu_mode to be nested") - which is already in Linus's master.
>>>>
>>>> To be clear, the current solution is safe, I just think this is much neater.
>>>
>>> Maybe better, though I wouldn't say much neater. One concern I have is
>>> about whether we'll get other such nesting in the future and we need to
>>> fix them in generic code. Here we control __kernel_map_pages() but we
>>> may not for other cases.
>>>
>>> Is it the fault of the arch code that uses apply_to_page_range() via
>>> __kernel_map_pages()? It feels like it shouldn't care about the lazy
>>> mode as that's some detail of the apply_to_page_range() implementation.
>>> Maybe this API should just allow nesting.
>>
>> I don't think it is possible to properly support nesting:
>>
>> enter_lazy_mmu
>>     for_each_pte {
>>         read/modify-write pte
>>
>>         alloc_page
>>             enter_lazy_mmu
>>                 make page valid
>>             exit_lazy_mmu
>>
>>         write_to_page
>>     }
>> exit_lazy_mmu
>>
>> This example only works because lazy_mmu doesn't support nesting. The "make page
>> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
>> page can be accessed in write_to_page. If nesting was supported, the inner
>> exit_lazy_mmu would become a nop and write_to_page would explode.
> 
> What I meant is for enter/exit_lazy_mmu to handle a kind of de-nesting
> themselves: enter_lazy_mmu would emit the barriers if already in lazy
> mode, clear pending (well, it doesn't need to do this but it may be
> easier to reason about in terms of flattening). exit_lazy_mmu also needs
> to emit the barriers but leave the lazy mode on if already on when last
> entered. This does need some API modifications to return the old mode on
> enter and get an argument for exit. But the correctness wouldn't be
> affected since exit_lazy_mmu still emits the barriers irrespective of
> the nesting level.

Ahh I see what you mean now; exit always emits barriers but only the last exit
clears TIF_LAZY_MMU.

I think that's much cleaner, but we are changing the API which needs changes to
all the arches and my attempt at [1] didn't really gain much enthusiasm.

> 
>> So the conclusion I eventually came to (after being nudged by Mike Rapoport at
>> [1]) is that this _is_ arm64's fault for creating a loop via
>> apply_to_page_range(). So I'm trying to fix this by breaking the loop.
>>
>> [1] https://lore.kernel.org/all/aDqz7H-oBo35FRXe@kernel.org/
> 
> If the only such loop is the arm64 code, fine by me to fix it this way.
> Your series above had 6 patches and I thought there's more to fix.

My previous attempt was, in hindsight, hideous. It seems to be the case that
only arm64 suffers this problem so let's just fix it here.

> 
>> We could alternatively use some per-cpu storage for a nest count, but that gets
>> ugly quite quickly I suspect.
> 
> Yeah, the thread flag is much nicer.
> 
>> But regardless, I'm not convinced the semantics of a properly nested
>> lazy_mmu are safe.
> 
> I think we can make them safe but there would be opposition from the mm
> people and it may not be trivial on x86. So, I'm fine with this arm64
> specific change:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Agreed, and thanks!


