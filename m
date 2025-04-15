Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63632C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 06:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9FICx0aqBy15iHkdSSq4APGf9DgQ+0M0zot8PPAQUk=; b=M5EGLM8e/wvRe6+Oa545Tb3yo2
	WUWhyHTLQA5uhqDfraIm2VaPsXWHG95aiK2HgIEBJmZ0YZlRCQs6P0z/4n9PFBueeufnMqABi9Zc1
	ZUh9rKJM2PNWoPwKN5AKsZlv5jx3ChEE/CTYqUrGK7YtTuxMW+k7B5mrdxGMBbHTILeSV+6/8GWuz
	2m6zNVtvqZ3yt2S+WGf58NQAk/qSjA+eslF5H51qoAElvFV8Z/C1LTLCb0EBZBjUX0bX8vgKs0giJ
	oF4kcFh1Gdi3KjH8VMua1rF4Nv+EEjwOOIvFjkQEreHg9BykqFCxfu1FnBAwDr9b/7iKiFHQ1x+Ui
	oTxbeVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Zo0-00000004g29-0e9E;
	Tue, 15 Apr 2025 06:30:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZmA-00000004fp7-2rBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:28:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D690315A1;
	Mon, 14 Apr 2025 23:28:03 -0700 (PDT)
Received: from [10.163.49.104] (unknown [10.163.49.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB4F13F694;
	Mon, 14 Apr 2025 23:28:02 -0700 (PDT)
Message-ID: <0eabad93-26ef-4452-bd89-17c153f483f3@arm.com>
Date: Tue, 15 Apr 2025 11:57:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
 <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
 <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
 <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
 <5d975762-7678-419f-8e2f-40547c079276@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <5d975762-7678-419f-8e2f-40547c079276@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_232806_814402_94E17084 
X-CRM114-Status: GOOD (  19.70  )
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



On 4/14/25 18:01, Ryan Roberts wrote:
> On 14/04/2025 13:28, Ard Biesheuvel wrote:
>> On Mon, 14 Apr 2025 at 14:04, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>
>>> On 14/04/2025 10:41, Ard Biesheuvel wrote:
>>>> On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>
>>>>> On 10/04/2025 08:40, Anshuman Khandual wrote:
>>>>>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
>>>>>> as expected if those macro constants contain some 128 bit layout elements,
>>>>>> required for D128 page tables. Fix this problem via first loading up these
>>>>>> macro constants into a given memory location and then subsequently setting
>>>>>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>>>>>
>>>>> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
>>>>> of 128-bit types with shifting and masking, which the assembler can't do? It
>>>>> would be good to spell this out.
>>>>>
>>>>>>
>>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>>> Cc: Will Deacon <will@kernel.org>
>>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>> ---
>>>>>> This patch applies on v6.15-rc1
>>>>>>
>>>>>>  arch/arm64/kernel/head.S         | 3 +++
>>>>>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>>>>>>  arch/arm64/kernel/pi/pi.h        | 1 +
>>>>>>  arch/arm64/mm/mmu.c              | 1 +
>>>>>>  arch/arm64/mm/proc.S             | 5 +++--
>>>>>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>>>>>> index 2ce73525de2c..4950d9cc638a 100644
>>>>>> --- a/arch/arm64/kernel/head.S
>>>>>> +++ b/arch/arm64/kernel/head.S
>>>>>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>>>>>>        * On return, the CPU will be ready for the MMU to be turned on and
>>>>>>        * the TCR will have been set.
>>>>>>        */
>>>>>> +     adr_l   x0, pir_data
>>>>>> +     bl      __pi_load_pir_data
>>>>>
>>>>> Using C code to pre-calculate the values into global variables that the assembly
>>>>> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
>>>>> can instead pre-calculate into asm-offsets.h? e.g. add the following to
>>>>> asm-offsets.c:
>>>>>
>>>>> DEFINE(PIE_E0_ASM, PIE_E0);
>>>>> DEFINE(PIE_E1_ASM, PIE_E1);
>>>>>
>>>>> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
>>>>> pre-calculated values that you can then use in proc.S?
>>>>>
>>>>
>>>> There is another issue, which is that mov_q tries to be smart, and
>>>> emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
>>>> directive evaluates the argument, which does not work with symbolic
>>>> constants.
>>>
>>> I'm not quite understanding the detail here; what do you mean by "symbolic
>>> constants"? asm-offsets.h will provide something like:
>>>
>>> #define PIE_E0_ASM 1234567890
>>>
>>> The current code is using a hash-define and that's working fine:
>>>
>>> mov_q   x0, PIE_E0
>>>
>>>
>>> Won't the C preprocessor just substitute and everything will work out?
>>>
>>
>> Yeah, you're right. I was experimenting with something like
>>
>> .set .Lpie_e0, PIE_E0_ASM
>> mov_q xN, .Lpie_e0
>>
>> where this problem does exist, but we can just use PIE_E0_ASM directly
>> and things should work as expected.
> 
> Ahh great, sounds like this should be pretty simple then!

Following change works both on current and with D128 page tables.

--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -182,5 +182,7 @@ int main(void)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   DEFINE(FTRACE_OPS_DIRECT_CALL,       offsetof(struct ftrace_ops, direct_call));
 #endif
+  DEFINE(PIE_E0_ASM, PIE_E0);
+  DEFINE(PIE_E1_ASM, PIE_E1);
   return 0;
 }
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 737c99d79833..f45494425d09 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -536,9 +536,9 @@ alternative_else_nop_endif
 #define PTE_MAYBE_NG           0
 #define PTE_MAYBE_SHARED       0
 
-       mov_q   x0, PIE_E0
+       mov_q   x0, PIE_E0_ASM
        msr     REG_PIRE0_EL1, x0
-       mov_q   x0, PIE_E1
+       mov_q   x0, PIE_E1_ASM
        msr     REG_PIR_EL1, x0
 
 #undef PTE_MAYBE_NG


