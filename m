Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0498AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMugB9Ly/EBxjBPxGkSXBYRGXeFLadEtBLBo1ujwjno=; b=uF+ptW6x2xeR9jYwgtXQMUXGQ0
	38hlj6exl2sNDhjhxTnAeo+/iTMiRrxU/qIb8YeR1iqjwqk8tKiT37nvUKtJilpDbICS4I0MhbYnF
	hnxVuo4cF9h4F1Ylo2bTdv4YGOF58uQ/r1ldm2s7qEisM2S0v5SvUX7aXTs3tX5GkCWSAUmx6fJUv
	YK/P6S55E38Ro7RCaR8Xiec+lTtqBY8pIIYt5+4k1Ki6geyyDDgG0uvywe0Opi2aIbPUNGP7P5S26
	h/ZvLkOMf2RaK/yhbJ42W31loqzGot3/KmXXevj3wjLam7GVCdTUXl5qv73RQyw6onXv2i0SyLTA8
	cxeN4fAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tynzP-0000000Fwxa-0izB;
	Sun, 30 Mar 2025 08:25:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tynxe-0000000Fwsc-3Lvj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 08:24:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A7611007;
	Sun, 30 Mar 2025 01:24:09 -0700 (PDT)
Received: from [10.163.43.149] (unknown [10.163.43.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B252B3F58B;
	Sun, 30 Mar 2025 01:24:00 -0700 (PDT)
Message-ID: <b7be0b9c-89fa-470d-8f6d-7db6282b3c68@arm.com>
Date: Sun, 30 Mar 2025 13:53:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Mike Rapoport <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
 steven.price@arm.com, suzuki.poulose@arm.com, tianyaxiong@kylinos.cn,
 ardb@kernel.org, david@redhat.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org> <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <Z-jzouwNZwk8Ft-j@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_012406_932407_C6197857 
X-CRM114-Status: GOOD (  17.50  )
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



On 30/03/25 1:02 pm, Mike Rapoport wrote:
> On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
>> On 28/03/2025 18:50, Mike Rapoport wrote:
>>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>>
>>>                                                       for vmalloc mappings ^
>>>
>>> arm64 does not allow changing permissions to any VA address right now.
>>>
>>>> which does not support changing permissions for leaf mappings. This function
>>>> will change permissions until it encounters a leaf mapping, and will bail
>>>> out. To avoid this partial change, explicitly disallow changing permissions
>>>> for VM_ALLOW_HUGE_VMAP mappings.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>
>> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
> 
> We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
> if there was a code that plays permission games on these allocations, x86
> set_memory would blow up immediately, so I don't think Fixes: is needed
> here.

But I think x86 can handle this (split_large_page() in 
__change_page_attr()) ?

>   
>>>> ---
>>>>   arch/arm64/mm/pageattr.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>>> index 39fd1f7ff02a..8337c88eec69 100644
>>>> --- a/arch/arm64/mm/pageattr.c
>>>> +++ b/arch/arm64/mm/pageattr.c
>>>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>>   	 * we are operating on does not result in such splitting.
>>>>   	 *
>>>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>>>> -	 * Those are guaranteed to consist entirely of page mappings, and
>>>> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>>>
>>> I'd keep mention of page mappings in the comment, e.g
>>>
>>> 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>>> 	* mappings are updated and splitting is never needed.
>>>
>>> With this and changelog updates Ryan asked for
>>>
>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>
>>>
>>>>   	 * splitting is never needed.
>>>>   	 *
>>>>   	 * So check whether the [addr, addr + size) interval is entirely
>>>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>>   	area = find_vm_area((void *)addr);
>>>>   	if (!area ||
>>>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>>>> -	    !(area->flags & VM_ALLOC))
>>>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>>>   		return -EINVAL;
>>>>   
>>>>   	if (!numpages)
>>>> -- 
>>>> 2.30.2
>>>>
>>>
>>
> 


