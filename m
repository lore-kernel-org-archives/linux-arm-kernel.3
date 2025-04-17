Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA93C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXtCkVWf/lGZq7P30Z9apGYWJxlW0XjAmZPvD8L/k1A=; b=nLdLGkmp0gkGNnG5s+0mTnCkmX
	8RALGJy41X4DRvdMCZroRVM1Bz4V3lejZRL+RG25yzveQiWZWDjgOHz7oln7/43jloMGPWpar+hO6
	MuaWhqfMWwyMU/hqJG2qdAcEn39NcOZh4SkwbqmtReEDMNjas3CgqK/KzazQ+vD8lYNO4bqWDGPBs
	z++4QZVmbJCWXlxnXeVXoOeEEUdv88SGE4rZm7k/2Y3YU1acd60HxwjYBGiRlfvcjEQydhPzDUxee
	HjO5nMWufMuSJOidkoDdo+3ZysWUTjOim4e7s35o8+VeNOpg16Bmpyj74oJORlX+hIcpM4R4zh+bB
	7bs95Cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LLe-0000000CPMZ-148B;
	Thu, 17 Apr 2025 09:15:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L9E-0000000CN0t-3i9L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 09:03:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1DAB1516;
	Thu, 17 Apr 2025 02:02:58 -0700 (PDT)
Received: from [10.163.48.140] (unknown [10.163.48.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B3C13F59E;
	Thu, 17 Apr 2025 02:02:57 -0700 (PDT)
Message-ID: <ac7b1117-76cc-4eac-8975-f0dc3cbbe398@arm.com>
Date: Thu, 17 Apr 2025 14:32:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting
 ARCH_MMAP_RND_BITS_MAX
To: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ssradjacoumar@google.com,
 chromeos-krk-upstreaming@google.com
References: <20250403183638.3386628-1-korneld@google.com>
 <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
 <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
 <6f1af7bf-a354-4b90-bf82-edc8cc6e71fe@arm.com>
 <CACF_fq=yFLUO2P0qrZFizUJe8J2FGYUK7w3DykKL3x7_R87UQA@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CACF_fq=yFLUO2P0qrZFizUJe8J2FGYUK7w3DykKL3x7_R87UQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_020305_011206_F16A9B7F 
X-CRM114-Status: GOOD (  23.73  )
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



On 4/17/25 13:38, Kornel Dulęba wrote:
> On Thu, Apr 17, 2025 at 7:15 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>>
>>
>> On 4/4/25 22:16, Kornel Dulęba wrote:
>>> On Thu, Apr 3, 2025 at 11:46 PM Anshuman Khandual
>>> <anshuman.khandual@arm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/4/25 00:06, Kornel Dulęba wrote:
>>>>> When the 52-bit virtual addressing was enabled the select like
>>>>> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
>>>>> Because of that the rnd max bits would be set to the default value of
>>>>> 18 when ARM64_VA_BITS=52.
>>>>> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
>>>>> be used if 48-bit addressing was used. That's because the 52-bit
>>>>> addressing is used only if the caller provides a hint to mmap, with a
>>>>> fallback to 48-bit addressing.
>>>>
>>>> Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
>>>> bits VA in case the user does request for 52 bit VA via mmap() hint and
>>>> the HW supports it ?
>>>
>>> Two reasons really.
>>> 1. The whole behavior is controlled through a global knob -
>>> /proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
>>> bound for the value that can be set to that knob.
>>> So we have a single setting for all processes. Some might want 52 bit
>>> addressing, others will stick with 48.
>>> 2. Quoting the documentation for this knob:
>>>
>>> """
>>> mmap_rnd_bits
>>> This value can be used to select the number of bits to use to
>>> determine the random offset to the base address of vma regions
>>> resulting from mmap allocations on architectures which support tuning
>>> address space randomization. This value will be bounded by the
>>> architecture’s minimum and maximum supported values.
>>> """
>>>
>>> I suppose that it's legal for some calls to mmap from the same process
>>> to request a 52 bit VA, while other calls will want only 48 bits.
>>> Because of that the random offset can't be larger than what would work
>>> for the 48 bit case.
>>
>> Agreed but should not this rationale also be added in the commit
>> message as well ?
> 
> Sure, I will update this in v2.
>>
>>
>>>
>>>>
>>>>>
>>>>> Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
>>
>> Correct commit to be attributed for this fix.
> 
> What commit would you like me to point at? I selected b6d00d47e81a,
> because it introduced "ARM64_VA_BITS=52".
> Looking at git blame, ARCH_MMAP_RND_BITS_MAX logic was introduced back
> in 2016 in 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS"),
> which is before "ARM64_VA_BITS=52" was a thing.
> I suppose that there's also 3cb7e662a930 ("arm64: Kconfig: Fix
> indentation and add comments"), but that's just some whitespace
> adjustments.

It was just a statement confirming that the commit ID chosen here in
this patch is the right one indeed. Apologies for the confusion.

> 
>>
>>
>>>>> Signed-off-by: Kornel Dulęba <korneld@google.com>
>>>>> ---
>>>>>  arch/arm64/Kconfig | 6 +++---
>>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>>>> index 748c34dc953c..38e0bac567f5 100644
>>>>> --- a/arch/arm64/Kconfig
>>>>> +++ b/arch/arm64/Kconfig
>>>>> @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
>>>>>       default 24 if ARM64_VA_BITS=39
>>>>>       default 27 if ARM64_VA_BITS=42
>>>>>       default 30 if ARM64_VA_BITS=47
>>>>> -     default 29 if ARM64_VA_BITS=48 && ARM64_64K_PAGES
>>>>> -     default 31 if ARM64_VA_BITS=48 && ARM64_16K_PAGES
>>>>> -     default 33 if ARM64_VA_BITS=48
>>>>> +     default 29 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
>>>>> +     default 31 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
>>>>> +     default 33 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
>>>>>       default 14 if ARM64_64K_PAGES
>>>>>       default 16 if ARM64_16K_PAGES
>>>>>       default 18
>>
>> Otherwise LGTM.
>>
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

