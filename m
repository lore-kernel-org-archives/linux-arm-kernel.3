Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C43C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhao6CWHKt4YHjPOypkGd1HjwpRJ0pRhQmjxPcCYQbE=; b=i0+aEfrD4H0ibBmDYOSSBESjz3
	2e3ZQLwXEGNKUBYdXHnDL3K8Hm4meeO4+tobB29lHTFurZvmQCrbhk6kTGIssRuA+pNkXoC4ODxGA
	j1g4SNXCgHtvWOxjySFA91/4fLAWGcZNBw5mxtwuck3dPgR2/jhzUImTfmWwim0VYMwmu81DiM3ed
	NKetE1/UOR6P1zwY07B0XdtrN7dAlrwxG+pRbJ2ceYgjq0DG4yYRjw6hLP9lJfgm44ZF6edpXxlgp
	21fPaWh9Pq3l5ft9sjqY4mFslio6dqrTrSW/ZladwVulk/iLiCAsoCfl7KCfkmdHChoA25n5hJphR
	uWNFze2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPns6-0000000ELZI-156R;
	Thu, 12 Jun 2025 19:46:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkMI-0000000Dt8M-0TdZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:00:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D8F9153B;
	Thu, 12 Jun 2025 09:00:33 -0700 (PDT)
Received: from [10.57.84.35] (unknown [10.57.84.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C423F66E;
	Thu, 12 Jun 2025 09:00:52 -0700 (PDT)
Message-ID: <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
Date: Thu, 12 Jun 2025 17:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com> <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
 <aEhKSq0zVaUJkomX@arm.com> <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
 <20250612145906.GB12912@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250612145906.GB12912@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_090054_366989_2B07A1E7 
X-CRM114-Status: GOOD (  28.88  )
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

On 12/06/2025 15:59, Will Deacon wrote:
> On Tue, Jun 10, 2025 at 05:37:20PM +0100, Ryan Roberts wrote:
>> On 10/06/2025 16:07, Catalin Marinas wrote:
>>> On Tue, Jun 10, 2025 at 02:41:01PM +0100, Ryan Roberts wrote:
>>>> On 10/06/2025 13:00, Catalin Marinas wrote:
>>>>> On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
>>>>>> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
>>>>>> provided a quick fix to ensure that lazy_mmu_mode continues to work when
>>>>>> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
>>>>>> nest.
>>>>>>
>>>>>> The solution in that patch is the make the implementation tolerant to
>>>>>
>>>>> s/is the make/is to make/
>>>>>
>>>>>> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
>>>>>> exit becomes a nop. But this sacrifices the optimization opportunity for
>>>>>> the remainder of the outer user.
>>>>> [...]
>>>>>> I wonder if you might be willing to take this for v6.16? I think its a neater
>>>>>> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
>>>>>> lazy_mmu_mode to be nested") - which is already in Linus's master.
>>>>>>
>>>>>> To be clear, the current solution is safe, I just think this is much neater.
>>>>>
>>>>> Maybe better, though I wouldn't say much neater. One concern I have is
>>>>> about whether we'll get other such nesting in the future and we need to
>>>>> fix them in generic code. Here we control __kernel_map_pages() but we
>>>>> may not for other cases.
>>>>>
>>>>> Is it the fault of the arch code that uses apply_to_page_range() via
>>>>> __kernel_map_pages()? It feels like it shouldn't care about the lazy
>>>>> mode as that's some detail of the apply_to_page_range() implementation.
>>>>> Maybe this API should just allow nesting.
>>>>
>>>> I don't think it is possible to properly support nesting:
>>>>
>>>> enter_lazy_mmu
>>>>     for_each_pte {
>>>>         read/modify-write pte
>>>>
>>>>         alloc_page
>>>>             enter_lazy_mmu
>>>>                 make page valid
>>>>             exit_lazy_mmu
>>>>
>>>>         write_to_page
>>>>     }
>>>> exit_lazy_mmu
>>>>
>>>> This example only works because lazy_mmu doesn't support nesting. The "make page
>>>> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
>>>> page can be accessed in write_to_page. If nesting was supported, the inner
>>>> exit_lazy_mmu would become a nop and write_to_page would explode.
>>>
>>> What I meant is for enter/exit_lazy_mmu to handle a kind of de-nesting
>>> themselves: enter_lazy_mmu would emit the barriers if already in lazy
>>> mode, clear pending (well, it doesn't need to do this but it may be
>>> easier to reason about in terms of flattening). exit_lazy_mmu also needs
>>> to emit the barriers but leave the lazy mode on if already on when last
>>> entered. This does need some API modifications to return the old mode on
>>> enter and get an argument for exit. But the correctness wouldn't be
>>> affected since exit_lazy_mmu still emits the barriers irrespective of
>>> the nesting level.
>>
>> Ahh I see what you mean now; exit always emits barriers but only the last exit
>> clears TIF_LAZY_MMU.
>>
>> I think that's much cleaner, but we are changing the API which needs changes to
>> all the arches and my attempt at [1] didn't really gain much enthusiasm.
> 
> To be honest, I don't think the proposal in this series is really
> improving what we have. Either we support nested lazy mode or we don't;
> having __kernel_map_pages() mess around with the lazy mmu state because
> it somehow knows that set_memory_valid() is going to use it is fragile
> and ugly.
> 
> So I'm incined to leave the current code as-is, unless we can remove it
> in favour of teaching the core code how to handle it instead.

Yeah fair enough. I'm not going to have time to do the proper nesting support
thing. But I'll see if I can find someone internally that I might be able to
convince. If not, we'll just leave as is.

> 
> Cheers,
> 
> Will


