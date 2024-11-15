Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE030D6DDF2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1dB6VfaEQ3l+zIBm42sU+yJRu+tjLplLeFlwyQT3Cg=; b=WotAViYuht6s8I0nmGKBEdXGBl
	xDWpp4nWnfWkPhDJUsXg7xGsN8w4LYGylwHiFXEhq866EVBrAGuMTqgo9+OCliA0Vb8QyY3I5ULB9
	onJDl/3jK/2z8PwGP0RlGX0gGlnf0pkvw86+w9oDLSd+zzPDMWcaKwNNTAte2Ngp4ZFIiU0+FJw7E
	boXGavt1U0XKg1C5qBk8YhDaQNJu1ZzNE+PnXmGnu8YXZq+/8QYJD3srU/mufIVOCWQnFcalIRtOi
	i9LhrNc5UEvZxFZgq7tW8jNECEzoiyuSg7uQs3HstfQBmIwaw1d1lwYMqg4WrzJfyFNMbpivkcBXO
	Oms7/WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuoe-00000002ZPy-0jq4;
	Fri, 15 Nov 2024 11:48:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuni-00000002ZHi-1jEh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 11:47:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C5C11476;
	Fri, 15 Nov 2024 03:48:15 -0800 (PST)
Received: from [10.163.46.21] (unknown [10.163.46.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8EAF3F6A8;
	Fri, 15 Nov 2024 03:47:41 -0800 (PST)
Message-ID: <84b7b8fb-8f84-4a36-8277-893cba1d6381@arm.com>
Date: Fri, 15 Nov 2024 17:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64/mm: Override PARange for !LPA2 and use it
 consistently
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <keescook@chromium.org>,
 stable@vger.kernel.org
References: <20241111083544.1845845-8-ardb+git@google.com>
 <20241111083544.1845845-10-ardb+git@google.com>
 <ea124997-8dee-457c-bef1-d5d829c84da3@arm.com>
 <CAMj1kXF1kYaiJmQXdvfSzGmgO78cechpm-JC=n3yGhRBXQF6nw@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAMj1kXF1kYaiJmQXdvfSzGmgO78cechpm-JC=n3yGhRBXQF6nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_034746_560755_459E9C28 
X-CRM114-Status: GOOD (  35.16  )
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



On 11/15/24 14:30, Ard Biesheuvel wrote:
> Hi Anshuman,
> 
> On Fri, 15 Nov 2024 at 07:05, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>> On 11/11/24 14:05, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> When FEAT_LPA{,2} are not implemented, the ID_AA64MMFR0_EL1.PARange and
>>> TCR.IPS values corresponding with 52-bit physical addressing are
>>> reserved.
>>>
>>> Setting the TCR.IPS field to 0b110 (52-bit physical addressing) has side
>>> effects, such as how the TTBRn_ELx.BADDR fields are interpreted, and so
>>> it is important that disabling FEAT_LPA2 (by overriding the
>>> ID_AA64MMFR0.TGran fields) also presents a PARange field consistent with
>>> that.
>>>
>>> So limit the field to 48 bits unless LPA2 is enabled, and update
>>> existing references to use the override consistently.
>>>
>>> Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>  arch/arm64/include/asm/assembler.h    | 5 +++++
>>>  arch/arm64/kernel/cpufeature.c        | 2 +-
>>>  arch/arm64/kernel/pi/idreg-override.c | 9 +++++++++
>>>  arch/arm64/kernel/pi/map_kernel.c     | 6 ++++++
>>>  arch/arm64/mm/init.c                  | 2 +-
>>>  5 files changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
>>> index 3d8d534a7a77..ad63457a05c5 100644
>>> --- a/arch/arm64/include/asm/assembler.h
>>> +++ b/arch/arm64/include/asm/assembler.h
>>> @@ -343,6 +343,11 @@ alternative_cb_end
>>>       // Narrow PARange to fit the PS field in TCR_ELx
>>>       ubfx    \tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
>>>       mov     \tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
>>> +#ifdef CONFIG_ARM64_LPA2
>>> +alternative_if_not ARM64_HAS_VA52
>>> +     mov     \tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
>>> +alternative_else_nop_endif
>>> +#endif
>>
>> I guess this will only take effect after cpu features have been finalized
>> but will not be applicable for __cpu_setup() during primary and secondary
>> cpu bring up during boot.
>>
> 
> It is the other way around, actually. This limit will always be

Right, missed the '_if_not' part.

> applied on primary boot, which is why IPS is updated again in
> set_ttbr0_for_lpa2() [below]. Before booting the secondaries (or other
> subsequent invocations of this code, e.g., in the resume path), this
> MOV will be NOPed out if LPA2 support is enabled.

Understood.

> 
> 
>>>       cmp     \tmp0, \tmp1
>>>       csel    \tmp0, \tmp1, \tmp0, hi
>>>       bfi     \tcr, \tmp0, \pos, #3
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index 37e4c02e0272..6f5137040ff6 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -3399,7 +3399,7 @@ static void verify_hyp_capabilities(void)
>>>               return;
>>>
>>>       safe_mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
>>> -     mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
>>> +     mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
>>
>> Small nit, should be renamed as safe_mmfr0 to be consistent with safe_mmfr1 ?
>>
> 
> safe_mmfr1 exists because there is also mmfr1 in the same scope. No
> such distinction exists for mmfr0, so I opted for keeping the name.

Fair enough.

> 
>>>       mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
>>>
>>>       /* Verify VMID bits */
>>> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
>>> index 22159251eb3a..c6b185b885f7 100644
>>> --- a/arch/arm64/kernel/pi/idreg-override.c
>>> +++ b/arch/arm64/kernel/pi/idreg-override.c
>>> @@ -83,6 +83,15 @@ static bool __init mmfr2_varange_filter(u64 val)
>>>               id_aa64mmfr0_override.val |=
>>>                       (ID_AA64MMFR0_EL1_TGRAN_LPA2 - 1) << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
>>>               id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
>>> +
>>> +             /*
>>> +              * Override PARange to 48 bits - the override will just be
>>> +              * ignored if the actual PARange is smaller, but this is
>>> +              * unlikely to be the case for LPA2 capable silicon.
>>> +              */
>>> +             id_aa64mmfr0_override.val |=
>>> +                     ID_AA64MMFR0_EL1_PARANGE_48 << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
>>> +             id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
>> Could these be used instead ?
>>
>> SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, PARANGE, 48)
>> ID_AA64MMFR0_EL1_PARANGE_MASK ?
>>
> 
> Yes, but 2 lines before, there is another occurrence of this idiom,
> and I did not want to deviate from that.
> 
> We could update both, or update the other one first in a separate
> patch, I suppose.

Sure, have your choice, don't have a strong view on either method.

> 
> 
>>
>>>       }
>>>  #endif
>>>       return true;
>>> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
>>> index f374a3e5a5fe..e57b043f324b 100644
>>> --- a/arch/arm64/kernel/pi/map_kernel.c
>>> +++ b/arch/arm64/kernel/pi/map_kernel.c
>>> @@ -136,6 +136,12 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
>>>  {
>>>       u64 sctlr = read_sysreg(sctlr_el1);
>>>       u64 tcr = read_sysreg(tcr_el1) | TCR_DS;
>>> +     u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
>>> +     u64 parange = cpuid_feature_extract_unsigned_field(mmfr0,
>>> +                                                        ID_AA64MMFR0_EL1_PARANGE_SHIFT);
>>> +
>>> +     tcr &= ~TCR_IPS_MASK;
>>
>> Could there be a different IPS value in TCR ? OR is this just a normal
>> clean up instead.
>>
> 
> As explained above, TCR.IPS will be capped at 48 bits up to this point.

Alright

> 
>>> +     tcr |= parange << TCR_IPS_SHIFT;
>>
>> Wondering if FIELD_PREP() could be used here.
>>
> 
> AIUI we'd end up with
> 
> tcr &= ~TCR_IPS_MASK;
> tcr |= FIELD_PREP(TCR_IPS_MASK, parange);
> 
> Is that really so much better?

Not really, can be left unchanged.

> 
> 
>>>
>>>       asm("   msr     sctlr_el1, %0           ;"
>>>           "   isb                             ;"
>>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>>> index d21f67d67cf5..4db9887b2aef 100644
>>> --- a/arch/arm64/mm/init.c
>>> +++ b/arch/arm64/mm/init.c
>>> @@ -280,7 +280,7 @@ void __init arm64_memblock_init(void)
>>>
>>>       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>>>               extern u16 memstart_offset_seed;
>>> -             u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
>>> +             u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
>>
>> Could this have a comment explaining the need for sanitized value ?
>>
> 
> Sure. Actually, it shouldn't make any difference here (unless we allow
> PARange to be narrowed even further, which might make sense if we care
> about enabling randomization of the linear map on systems where
> PARange is much larger than the size of the physical address space
> that is actually populated). However, for consistency, it is better to
> avoid the 52-bit PARange if LPA2 is disabled.

Got it, thanks for the explanation.

> 
> 
>>>               int parange = cpuid_feature_extract_unsigned_field(
>>>                                       mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
>>>               s64 range = linear_region_size -
>>
>> Otherwise LGTM.
> 
> Thanks!

