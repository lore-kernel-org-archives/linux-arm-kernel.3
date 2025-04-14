Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC991C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWDCeS3uTxwMDqZWTzAomymNTDIToqE3PBoDQEn1vUw=; b=Dmu1zpm6bvSRAjJKx1xO3HZ0Wr
	u7C57riYOUi5fjkBX6iJg0rrlefftlmd2qr7BdFjV3lQrqSH8wRS0AVoeeGvlmi4JHtQALEHZzNDw
	FSNGmw4TLsgbESIwfzyTQGKCkndjGAxSBy+6mbLHMt8TNqGvPgopTcv2y5rtOJ89dYfoYJfxBob4o
	DiEvf+swBpOxjy730YwidHoVwRLAMtDBdIUiwbr0ZRwmQL8NW6szW/herhsrB+D9jtwFsn+w6LWc1
	7jjmlX+1lt4SMVduGNJDr7iN998a96NUThaJMy5LSXlNholw1yihOmtG1C5+K4/gjfyTUKCivLexk
	62IdIdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J0x-00000001xVG-1XsK;
	Mon, 14 Apr 2025 12:34:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Iyi-00000001x0z-456n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:31:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E671A1007;
	Mon, 14 Apr 2025 05:31:54 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 310C83F59E;
	Mon, 14 Apr 2025 05:31:55 -0700 (PDT)
Message-ID: <5d975762-7678-419f-8e2f-40547c079276@arm.com>
Date: Mon, 14 Apr 2025 13:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
 <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
 <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
 <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053157_099664_81BD1368 
X-CRM114-Status: GOOD (  20.08  )
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

On 14/04/2025 13:28, Ard Biesheuvel wrote:
> On Mon, 14 Apr 2025 at 14:04, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 14/04/2025 10:41, Ard Biesheuvel wrote:
>>> On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> On 10/04/2025 08:40, Anshuman Khandual wrote:
>>>>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
>>>>> as expected if those macro constants contain some 128 bit layout elements,
>>>>> required for D128 page tables. Fix this problem via first loading up these
>>>>> macro constants into a given memory location and then subsequently setting
>>>>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>>>>
>>>> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
>>>> of 128-bit types with shifting and masking, which the assembler can't do? It
>>>> would be good to spell this out.
>>>>
>>>>>
>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-kernel@vger.kernel.org
>>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> ---
>>>>> This patch applies on v6.15-rc1
>>>>>
>>>>>  arch/arm64/kernel/head.S         | 3 +++
>>>>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>>>>>  arch/arm64/kernel/pi/pi.h        | 1 +
>>>>>  arch/arm64/mm/mmu.c              | 1 +
>>>>>  arch/arm64/mm/proc.S             | 5 +++--
>>>>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>>>>> index 2ce73525de2c..4950d9cc638a 100644
>>>>> --- a/arch/arm64/kernel/head.S
>>>>> +++ b/arch/arm64/kernel/head.S
>>>>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>>>>>        * On return, the CPU will be ready for the MMU to be turned on and
>>>>>        * the TCR will have been set.
>>>>>        */
>>>>> +     adr_l   x0, pir_data
>>>>> +     bl      __pi_load_pir_data
>>>>
>>>> Using C code to pre-calculate the values into global variables that the assembly
>>>> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
>>>> can instead pre-calculate into asm-offsets.h? e.g. add the following to
>>>> asm-offsets.c:
>>>>
>>>> DEFINE(PIE_E0_ASM, PIE_E0);
>>>> DEFINE(PIE_E1_ASM, PIE_E1);
>>>>
>>>> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
>>>> pre-calculated values that you can then use in proc.S?
>>>>
>>>
>>> There is another issue, which is that mov_q tries to be smart, and
>>> emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
>>> directive evaluates the argument, which does not work with symbolic
>>> constants.
>>
>> I'm not quite understanding the detail here; what do you mean by "symbolic
>> constants"? asm-offsets.h will provide something like:
>>
>> #define PIE_E0_ASM 1234567890
>>
>> The current code is using a hash-define and that's working fine:
>>
>> mov_q   x0, PIE_E0
>>
>>
>> Won't the C preprocessor just substitute and everything will work out?
>>
> 
> Yeah, you're right. I was experimenting with something like
> 
> .set .Lpie_e0, PIE_E0_ASM
> mov_q xN, .Lpie_e0
> 
> where this problem does exist, but we can just use PIE_E0_ASM directly
> and things should work as expected.

Ahh great, sounds like this should be pretty simple then!



