Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9387C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I0cmPavFVWH+xTCnfDDOUhHYdgvBD+Uf4QFJV/B8C8=; b=kOBOtc6VAoRcK+5QhuxR2XmZUO
	jMumQaC2n2zBmiMRh2FjG0fdWaiG2Ojc9f2LUeKNsmuId4p+86lzzqLazoF3myWXl8FRBYbV43YaF
	SksByZFauTQENcZUnn57l2WGPoCt6iIzNRUnE0RHXf9UnV/oRA4t89QPlcyuH63dUCJY2cGT7Y51J
	GwiYTyOTOs3L08KRS1C6DZrbaIbaYBn8NzfMRF3pP+uxppq8zdLqDXTv5m8drkqVRm8WFv4cokyDi
	WfJ0wY7eCP6ViJCQjrRgGMCCLth8zBCVGqCJlYfObgHLkxT1HQwKj5mQzvTmUGX/QvGSwsAErh6n1
	BuCI4mcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EeI-00000000zwj-3JiM;
	Mon, 14 Apr 2025 07:54:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EcR-00000000zip-04vc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 07:52:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01E621007;
	Mon, 14 Apr 2025 00:52:34 -0700 (PDT)
Received: from [10.57.88.7] (unknown [10.57.88.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CAA83F694;
	Mon, 14 Apr 2025 00:52:33 -0700 (PDT)
Message-ID: <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
Date: Mon, 14 Apr 2025 08:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250410074024.1545768-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_005239_111896_A1D46675 
X-CRM114-Status: GOOD (  24.07  )
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

On 10/04/2025 08:40, Anshuman Khandual wrote:
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> required for D128 page tables. Fix this problem via first loading up these
> macro constants into a given memory location and then subsequently setting
> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.

From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
of 128-bit types with shifting and masking, which the assembler can't do? It
would be good to spell this out.

> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc1
> 
>  arch/arm64/kernel/head.S         | 3 +++
>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>  arch/arm64/kernel/pi/pi.h        | 1 +
>  arch/arm64/mm/mmu.c              | 1 +
>  arch/arm64/mm/proc.S             | 5 +++--
>  5 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 2ce73525de2c..4950d9cc638a 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>  	 * On return, the CPU will be ready for the MMU to be turned on and
>  	 * the TCR will have been set.
>  	 */
> +	adr_l	x0, pir_data
> +	bl      __pi_load_pir_data

Using C code to pre-calculate the values into global variables that the assembly
code then loads and stuffs into the PIR registers feels hacky. I wonder if we
can instead pre-calculate into asm-offsets.h? e.g. add the following to
asm-offsets.c:

DEFINE(PIE_E0_ASM, PIE_E0);
DEFINE(PIE_E1_ASM, PIE_E1);

Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
pre-calculated values that you can then use in proc.S?

Or if that doesn't work for some reason, is it possible to store to the PIR
registers directly from the C code?

Thanks,
Ryan

> +
>  	bl	__cpu_setup			// initialise processor
>  	b	__primary_switch
>  SYM_CODE_END(primary_entry)
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 81345f68f9fc..cd9d24e73046 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -103,3 +103,9 @@ asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
>  
>  	return ptep;
>  }
> +
> +asmlinkage void __init load_pir_data(u64 pir_data[])
> +{
> +	pir_data[0] = PIE_E0;
> +	pir_data[1] = PIE_E1;
> +}
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index c91e5e965cd3..ae61df4fdb77 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -34,3 +34,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>  asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
>  
>  asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
> +asmlinkage void load_pir_data(u64 pir_data[]);
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..762e81ff4e85 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -58,6 +58,7 @@ static bool rodata_is_rw __ro_after_init = true;
>   * with MMU turned off.
>   */
>  long __section(".mmuoff.data.write") __early_cpu_boot_status;
> +unsigned long __section(".mmuoff.data.write") pir_data[2];
>  
>  /*
>   * Empty_zero_page is a special page that is used for zero-initialized data
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index fb30c8804f87..7dd28cf101c2 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -524,9 +524,10 @@ alternative_else_nop_endif
>  #define PTE_MAYBE_NG		0
>  #define PTE_MAYBE_SHARED	0
>  
> -	mov_q	x0, PIE_E0
> +	adr_l	x1, pir_data
> +	ldr	x0, [x1, #0]
>  	msr	REG_PIRE0_EL1, x0
> -	mov_q	x0, PIE_E1
> +	ldr	x0, [x1, #8]
>  	msr	REG_PIR_EL1, x0
>  
>  #undef PTE_MAYBE_NG


