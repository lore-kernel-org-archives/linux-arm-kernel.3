Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7343C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSOdXtZie0Ln5Udf8Es34lYhiKAo6B/bX9lQKn9I0Xo=; b=BeJ9vcEszwY9Zu6XpS2j4nRyKq
	LdHkm3XleBE/JYvgLoBKQEKFU+Fm177Jan8plhMXn2gcBmVyPUACWdn03NY7nQoqz6t6BbkYpzCYe
	eXy1J0N2spFbAhv2qxR1P40dMeXEl7ocBA0kznv1Wzhqwahjpx1y2mmvoKBPp5HWotw3JtEgEnLm4
	AKgWAMX5ZKRY54AqoLGH90d8LqborhyLqmjmN69PtXUfV4wF9lCiei2NA7+FZ0rrl7+d8/yK9T5mJ
	ah5+QPQvoz+ZdciR1Znt6oCIEn/1xTntNuVhFzBFn1+qK00s0S3DEkKO0Lp8gHPu9G96CRWjmQrIZ
	yvm5LOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uLV-0000000Dml5-2PE6;
	Thu, 24 Apr 2025 11:02:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tUI-0000000DcB3-0K24
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:07:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D4481063;
	Thu, 24 Apr 2025 03:07:14 -0700 (PDT)
Received: from [10.57.83.110] (unknown [10.57.83.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4790A3F66E;
	Thu, 24 Apr 2025 03:07:18 -0700 (PDT)
Message-ID: <fbba5d43-d740-401a-b5c5-9dfc222db5c4@arm.com>
Date: Thu, 24 Apr 2025 11:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250416035604.2717188-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250416035604.2717188-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030722_218764_987C4237 
X-CRM114-Status: GOOD (  24.32  )
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

On 16/04/2025 04:56, Anshuman Khandual wrote:
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> that are required for D128 page tables. The primary issue is that for D128,
> PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
> which the assembler can't accommodate.
> 
> Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
> based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.
> 
> While here also move PTE_MAYBE_NG/PTE_MAYBE_SHARED assembly overrides into
> arch/arm64/kernel/asm-offsets.c to ensure PIRE0_EL1/PIR_EL1 are calculated
> in assembly without arm64_use_ng_mappings and lpa2_is_enabled() symbols
> being accessible. Also move the corresponding comment as well.
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
> This patch applies on v6.15-rc2
> 
> Changes in V2:
> 
> - Added asm-offsets.c based PIE_E0_ASM and PIE_E1_ASM symbols as per Ard
> - Moved PTE_MAYBE_NG and PTE_MAYBE_SHARED overrides inside asm-offsets.c
>   along with the corresponding comment as per Ard
> 
> Changes in V1:
> 
> https://lore.kernel.org/linux-arm-kernel/20250410074024.1545768-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/kernel/asm-offsets.c | 16 ++++++++++++++++
>  arch/arm64/mm/proc.S            | 19 ++-----------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
> index eb1a840e4110..5b99a78f6882 100644
> --- a/arch/arm64/kernel/asm-offsets.c
> +++ b/arch/arm64/kernel/asm-offsets.c
> @@ -182,5 +182,21 @@ int main(void)
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>    DEFINE(FTRACE_OPS_DIRECT_CALL,	offsetof(struct ftrace_ops, direct_call));
>  #endif
> +	/*
> +	 * The PROT_* macros describing the various memory types may resolve to
> +	 * C expressions if they include the PTE_MAYBE_* macros, and so they
> +	 * can only be used from C code. The PIE_E* constants below are also
> +	 * defined in terms of those macros, but will mask out those
> +	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
> +	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
> +	 */
> +#undef PTE_MAYBE_NG
> +#define PTE_MAYBE_NG		0
> +
> +#undef PTE_MAYBE_SHARED
> +#define PTE_MAYBE_SHARED	0

My toolchain at least is smart enough to figure out that the bits of interest in
PIE_E1 are all contstant so it works without this hack.

I'd prefer to drop this hack on that basis. Or if there are issues with other
toolchains that mean we need to keep it, I think the wording of the comment
should be changed since we are now in C code so the "can only be used from C
code" bit doesn't really make sense.

Thanks,
Ryan

> +
> +  DEFINE(PIE_E0_ASM, PIE_E0);
> +  DEFINE(PIE_E1_ASM, PIE_E1);
>    return 0;
>  }
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index fb30c8804f87..80d470aa469d 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -512,26 +512,11 @@ alternative_else_nop_endif
>  	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
>  	cbz	x1, .Lskip_indirection
>  
> -	/*
> -	 * The PROT_* macros describing the various memory types may resolve to
> -	 * C expressions if they include the PTE_MAYBE_* macros, and so they
> -	 * can only be used from C code. The PIE_E* constants below are also
> -	 * defined in terms of those macros, but will mask out those
> -	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
> -	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
> -	 */
> -
> -#define PTE_MAYBE_NG		0
> -#define PTE_MAYBE_SHARED	0
> -
> -	mov_q	x0, PIE_E0
> +	mov_q	x0, PIE_E0_ASM
>  	msr	REG_PIRE0_EL1, x0
> -	mov_q	x0, PIE_E1
> +	mov_q	x0, PIE_E1_ASM
>  	msr	REG_PIR_EL1, x0
>  
> -#undef PTE_MAYBE_NG
> -#undef PTE_MAYBE_SHARED
> -
>  	orr	tcr2, tcr2, TCR2_EL1_PIE
>  	msr	REG_TCR2_EL1, x0
>  


