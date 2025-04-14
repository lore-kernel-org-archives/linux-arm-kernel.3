Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D65C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXzWTUkG7jHHcY5HpXRDHsUc9O9nej7xLiqnNfpGop8=; b=MI6O8/WPjD2gaengJJMAPpLerb
	YLZnVpWC1rmTdHkWmYHfKtlKMQ7WwAi02FHxiSHcp3FgUNDieeIo/0DhyN28vzAMfJxDrE6EpM6ZF
	IX2uhEHnj4kgUtZaUtF7YwPVLlUkyQgZvxPiUGyZ5o7ZDhfGmDlEWDdqyYEdnwJGunHpmFXtQyKoS
	8/ROuFuJBBEMzAhMw8TVjauefMYIJ+sGkmAGjduQCJWV+KsDeVR37YBJekP6W+FylX3+D7nnaiJOh
	QUH915d6LoglE+kV7RWU7sPsd0z4ePt/vgF1pU3cK7aUG1jeasOu7BO+Hi1IRZ1wkcQ3JbWhDtqIn
	QuxrtyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Cdq-00000000jIA-2NXv;
	Mon, 14 Apr 2025 05:45:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Cby-00000000j4N-39Cp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 05:44:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9CDC1007;
	Sun, 13 Apr 2025 22:43:56 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E95443F66E;
	Sun, 13 Apr 2025 22:43:55 -0700 (PDT)
Message-ID: <095e8787-9c46-45e8-8db8-7df22a2decc8@arm.com>
Date: Mon, 14 Apr 2025 11:13:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-kernel@vger.kernel.org
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <CAMj1kXGn71CGqXCN2mWokZuq37bbEtnOKkrB=_dddp0dyPTndw@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAMj1kXGn71CGqXCN2mWokZuq37bbEtnOKkrB=_dddp0dyPTndw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_224403_082328_54E23CE3 
X-CRM114-Status: GOOD (  20.74  )
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



On 4/10/25 17:58, Ard Biesheuvel wrote:
> Hi Anshuman,
> 
> On Thu, 10 Apr 2025 at 09:40, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
>> as expected if those macro constants contain some 128 bit layout elements,
>> required for D128 page tables.
> 
> Could you elaborate?

Without this change in place, the following build error comes up.

arch/arm64/mm/proc.S: Assembler messages:
arch/arm64/mm/proc.S:539: Error: too many positional arguments
arch/arm64/mm/proc.S:541: Error: too many positional arguments
make[4]: *** [scripts/Makefile.build:335: arch/arm64/mm/proc.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:461: arch/arm64/mm] Error 2
make[3]: *** Waiting for unfinished jobs...

SYM_FUNC_START(__cpu_setup)
	..........................
	..........................
#define PTE_MAYBE_NG            0
#define PTE_MAYBE_SHARED        0

        mov_q   x0, PIE_E0		 (arch/arm64/mm/proc.S:539)
        msr     REG_PIRE0_EL1, x0
        mov_q   x0, PIE_E1		 (arch/arm64/mm/proc.S:541)
        msr     REG_PIR_EL1, x0

#undef PTE_MAYBE_NG
#undef PTE_MAYBE_SHARED
	..........................
	..........................

Please note the following PIE_E0 definition in D128 context.

#define PTE_PI_MASK     GENMASK_U128(118, 115)
#define PTE_PI_SHIFT    115

#define pte_pi_index(pte)       (((pte) & PTE_PI_MASK) >> PTE_PI_SHIFT)

#define PIE_E0  ( \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_R)   | \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_EXECONLY),      PIE_X_O) | \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX_O)  | \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX_O) | \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
        PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))

Where _PAGE_XXX definitions here might contain page flags beyond just 64
bits as well.

> 
>> Fix this problem via first loading up these
>> macro constants into a given memory location and then subsequently setting
>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>>
> 
> If this is necessary, we could also remove the PTE_MAYBE_xx override hack no?

Could you please elaborate ? Not sure if PTE_MAYBE_xx is the problem here.

> 
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v6.15-rc1
>>
>>  arch/arm64/kernel/head.S         | 3 +++
>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>>  arch/arm64/kernel/pi/pi.h        | 1 +
>>  arch/arm64/mm/mmu.c              | 1 +
>>  arch/arm64/mm/proc.S             | 5 +++--
>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> index 2ce73525de2c..4950d9cc638a 100644
>> --- a/arch/arm64/kernel/head.S
>> +++ b/arch/arm64/kernel/head.S
>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>>          * On return, the CPU will be ready for the MMU to be turned on and
>>          * the TCR will have been set.
>>          */
>> +       adr_l   x0, pir_data
>> +       bl      __pi_load_pir_data
>> +
>>         bl      __cpu_setup                     // initialise processor
>>         b       __primary_switch
>>  SYM_CODE_END(primary_entry)
>> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
>> index 81345f68f9fc..cd9d24e73046 100644
>> --- a/arch/arm64/kernel/pi/map_range.c
>> +++ b/arch/arm64/kernel/pi/map_range.c
>> @@ -103,3 +103,9 @@ asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
>>
>>         return ptep;
>>  }
>> +
>> +asmlinkage void __init load_pir_data(u64 pir_data[])
>> +{
>> +       pir_data[0] = PIE_E0;
>> +       pir_data[1] = PIE_E1;
>> +}
>> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
>> index c91e5e965cd3..ae61df4fdb77 100644
>> --- a/arch/arm64/kernel/pi/pi.h
>> +++ b/arch/arm64/kernel/pi/pi.h
>> @@ -34,3 +34,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>>  asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
>>
>>  asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
>> +asmlinkage void load_pir_data(u64 pir_data[]);
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..762e81ff4e85 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -58,6 +58,7 @@ static bool rodata_is_rw __ro_after_init = true;
>>   * with MMU turned off.
>>   */
>>  long __section(".mmuoff.data.write") __early_cpu_boot_status;
>> +unsigned long __section(".mmuoff.data.write") pir_data[2];
>>
>>  /*
>>   * Empty_zero_page is a special page that is used for zero-initialized data
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index fb30c8804f87..7dd28cf101c2 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -524,9 +524,10 @@ alternative_else_nop_endif
>>  #define PTE_MAYBE_NG           0
>>  #define PTE_MAYBE_SHARED       0
>>
>> -       mov_q   x0, PIE_E0
>> +       adr_l   x1, pir_data
>> +       ldr     x0, [x1, #0]
>>         msr     REG_PIRE0_EL1, x0
>> -       mov_q   x0, PIE_E1
>> +       ldr     x0, [x1, #8]
>>         msr     REG_PIR_EL1, x0
>>
>>  #undef PTE_MAYBE_NG
>> --
>> 2.25.1
>>

