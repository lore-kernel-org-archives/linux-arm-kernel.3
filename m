Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B110CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OQfaMO63VuoxYCGwCbKDFCxYqnQrnEU0U6YCwkAda8=; b=FJJOO2v99LYH4x9gd02Q/klf3v
	3TWmGNBYRzFceaO8NOGIOiyIqle1wLQLQaLrDfzbXRD2lvmG8+fRJrJY4vT3ij+GRpg0uHCGwHOzN
	F51G43/nzaYCiXzZLHEaLtFAizP3e2aR56//kpycHK+3XHYZcniCTiiBDWKQlqzr64VJ7cFic3t24
	nwR51QDahoUXF4OHUdgHowocpf3TevehOyXMInEynTG2bI0NeiCacX8JBIyH9xQ7RmmiddX5nC9IC
	WSXphwe3mZ2R+FnXWMRhbMWVfSOo2wODSr/KYHN8EpeHaPVeu3aBN5J1EC/d+FMktrXawWWPH4awl
	089vAjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdJp-000000021ZM-0SNp;
	Thu, 11 Sep 2025 09:10:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdJm-000000021YD-2uTB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:10:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38ED9153B;
	Thu, 11 Sep 2025 02:10:05 -0700 (PDT)
Received: from [10.57.70.14] (unknown [10.57.70.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 457633F694;
	Thu, 11 Sep 2025 02:10:11 -0700 (PDT)
Message-ID: <eb8bd2da-48be-4c4e-bf52-48ea1718e02b@arm.com>
Date: Thu, 11 Sep 2025 11:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Move KPTI helpers to mmu.c
To: Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>
References: <20250910104454.317067-1-kevin.brodsky@arm.com>
 <41f3227e-b945-4303-90b7-732affb0a101@arm.com>
 <CAMj1kXEmfCHpssFjn_+4ZjKCUaWPeiVwznCpGumTfz33k-rfkg@mail.gmail.com>
 <f8c268ce-798a-4d3a-bab2-16eea633f9db@arm.com>
 <CAMj1kXHDKGsaOn96zecba=-6Bib0SVYs=voMr5DLjWOn_qAqAQ@mail.gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <CAMj1kXHDKGsaOn96zecba=-6Bib0SVYs=voMr5DLjWOn_qAqAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_021014_857316_AC58CAD8 
X-CRM114-Status: GOOD (  15.74  )
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

On 11/09/2025 08:24, Ard Biesheuvel wrote:
> On Thu, 11 Sept 2025 at 08:18, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>>
>> On 11/09/25 11:38 AM, Ard Biesheuvel wrote:
>>> On Thu, 11 Sept 2025 at 07:13, Anshuman Khandual
>>> <anshuman.khandual@arm.com> wrote:
>>>>
>>>>
>>>> On 10/09/25 4:14 PM, Kevin Brodsky wrote:
>>>>> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
>>>>> mmu.c without matching declaration in a header; instead cpufeature.c
>>>>> makes its own declaration. This is clearly not pretty, and as commit
>>>>> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
>>>>> function signature") showed, it also makes it very easy for the
>>>>> prototypes to go out of sync.
>>>>>
>>>>> All this would be much simpler if kpti_install_ng_mappings() and
>>>>> associated functions lived in mmu.c, where they logically belong.
>>>>> This is what this patch does:
>>>>> - Move kpti_install_ng_mappings() and associated functions from
>>>>>   cpufeature.c to mmu.c, add a declaration to <asm/mmu.h>
>>>>> - Make create_kpti_ng_temp_pgd() a static function that simply calls
>>>>>   __create_pgd_mapping_locked() instead of aliasing it
>>>>> - Mark all these functions __init
>>>>> - Move __initdata after kpti_ng_temp_alloc (as suggested by
>>>>>   checkpatch)
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>>> Note: as things stand, create_kpti_ng_temp_pgd() could be removed,
>>>>> but a separate patch [1] will make use of it to add an
>>>>> assertion.
>>>>>
>>>>> [1] https://lore.kernel.org/all/20250813145607.1612234-3-chaitanyas.prakash@arm.com/
>>>>> ---
>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: Kees Cook <kees@kernel.org>,
>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
>>>>> ---
>>>>>  arch/arm64/include/asm/mmu.h   |   6 ++
>>>>>  arch/arm64/kernel/cpufeature.c |  97 ------------------------------
>>>>>  arch/arm64/mm/mmu.c            | 106 ++++++++++++++++++++++++++++++---
>>>>>  3 files changed, 103 insertions(+), 106 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>>>>> index 49f1a810df16..624edd6c4964 100644
>>>>> --- a/arch/arm64/include/asm/mmu.h
>>>>> +++ b/arch/arm64/include/asm/mmu.h
>>>>> @@ -104,5 +104,11 @@ static inline bool kaslr_requires_kpti(void)
>>>>>       return true;
>>>>>  }
>>>>>
>>>>> +#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>>>>> +void kpti_install_ng_mappings(void);
>>>> Could the declarations be moved here instead ?
>>> Why?
>> To avoid both typedef and external instance declaration in the C
>> code even though there is just a single call site in there.
> But why would we want to avoid those in the first place?
>
> Moving these into mmu.h pollutes the global namespace with
> declarations that must never be used outside of
> __kpti_install_ng_mappings() to begin with.

That makes sense to me - no need for these declarations to be in a
header as they're implementation details of
__kpti_install_ng_mappings(). What is more common is to have them at the
top-level in the .c file instead of inside a function, but I think
either way is fine.

- Kevin

