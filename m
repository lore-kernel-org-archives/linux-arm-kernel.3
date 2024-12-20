Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F832E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRihNoq2q5AAv7nZdG+oK1rY6NsmnXT7ogdCVCgl9J8=; b=YngjN6VkzJNFCy4kTGXlmfO/Wf
	HGovZGIBnIKWwCUNZAZHa/3pmB5plmsHaX39iV6+QD1dga8RS/BsfyUAHfX455x0ZOVm/rTzY2mfx
	lSL6a2ALWq3QlRTw7g5ScZM9ZWn3V+ATRUBvTyPFyVe0UhJOfVG85IILPmaz+to6XNcuwFT+7rP0s
	kWOcKVOobeXXWdc99DyovaVNfUyQ/uuCFmM2iMVMQhd4OPm5r13jJu6lwb0DHTCTPU6vY4nyF5dgt
	wSIxRB9ZBTk9JN4gwuT4i7BGfftd0kayJZ00StiK/DGcc2hxdu05x6Y/tDcz959Kl0QEINRYLda1M
	Q2/HJ4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmbw-00000006Gfy-1Ri4;
	Fri, 20 Dec 2024 23:40:48 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmad-00000006GWu-06Rq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 23:39:28 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3022484d4e4so27133901fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 15:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734737964; x=1735342764; darn=lists.infradead.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRihNoq2q5AAv7nZdG+oK1rY6NsmnXT7ogdCVCgl9J8=;
        b=aXcv9PQElZjCWVvnYJCKu0CYRbO1/+IGNi3oYpyVWGcVvjEdulmJHTPpCLfykChd+l
         72NO+JGbt3fEFxNmKVoX64siTbAddaXFusn+A+sNw+oOC8x74ngHt31LDTmSZzm5An8V
         U37rK11C517HO9ej/BevmgPDuZRcupL2NU/lOQYlDT5ny7ejapnAikqI01aUr66xQP+u
         Nqys7SxZpDPGAzGnm0bYjNBjE6DH/PGXEEgsdBr4vuBKrWiRQpkZCowfuquhpXW+sxx3
         eZX64/EeGlgc79OM1M1sTZZVUb5iT6E8Xm5HVt3vBK1OBZrE7YKVxvkcf8Q5T63T5reM
         Bhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734737964; x=1735342764;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hRihNoq2q5AAv7nZdG+oK1rY6NsmnXT7ogdCVCgl9J8=;
        b=g9Fn6+DBOC0M8jRN+PjQ1Y0ohvvR/nKx3gmiE32b7j696n2mYZEnocRBTXXpsMfrvd
         WcmKt/dOHMNa6lGUkup5V4ShGYbT23XbzZQo26fuHJVS/ykyx1JyZbyUOvL2usvrtb//
         eQ9rQu4hjfHTPfg8sz6709s63kucpGdrtORS58u8xbIGbmLnWFLd71NOBqbViUku0m6c
         UfL+9tstMUYJqCaju8C2uCGxpxlBafHLU1EhFsx/AtokFPl+H9kKaCY/dt0ChxXHten6
         jf/Pk4xdbA0/itvihBe1cMQEkDL/aSZ14nERCBVEX4CyE4n/0PNjlZ7cD2YYiBJ9ZS7s
         SMxA==
X-Forwarded-Encrypted: i=1; AJvYcCXKC9U8BbuStBV+bYiUcBWZwkJXkk9rWES2TXLc9zhJEYFPqG/b7Vjd+B1dscg84yLgnptCr9c1NbDwTH9V1BOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUXF2eNspj34h/kFMV/tKaotktxEtkAeXSb+Dhb92YfMOViWoh
	qptHT31bhQ1goVQkWQYNoW72TSzpoH49nEcrkrq/QfUTWkz/nhoX
X-Gm-Gg: ASbGncv7WAU1j7VklYnA0wCYitbmmq6eGVtlRNcmR+c1PWjvPZBarCBWHtUVSgtTZGB
	gcPt3hDTZNB8ug8puCGxuTkHENSaihHL8GDTOSXcGqkB3zgrmntFsHy+TIbt6YKLdKltQFCIeMM
	VPIuoCAKhjnisXTA8nrbLaO9rqiyo3rk4MF/hc/kK0BE/adxN/yW4xFpDpBk4BG68uqw38lT4sp
	iAKTmCD+ea6LVBBAdzOmEMIe4ZHrXtm1+6CjhbAcBNePS0xB54Q7gZK2nEDY5DaG3wCdy5z4NG+
	N34kVy40p9IXwWgDxwVMz7QKM7adYd/yrHesP4+LsQ==
X-Google-Smtp-Source: AGHT+IHZVAIf6MguoSUi7ORTEdYzj/ICksKZSrZnZz09WBFtONJXxpRXcaEmbQmLaimvZzOJTtYIrw==
X-Received: by 2002:a05:651c:2129:b0:302:4115:b69 with SMTP id 38308e7fff4ca-3046851f488mr17886951fa.8.1734737963867;
        Fri, 20 Dec 2024 15:39:23 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adab76bsm6334401fa.50.2024.12.20.15.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 15:39:21 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------mVfUhgVaC8Kwq0epPGn8TvkX"
Message-ID: <b20c861b-865a-4d77-bb22-98c4ba8ead16@gmail.com>
Date: Sat, 21 Dec 2024 00:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kees Cook <keescook@chromium.org>, Quentin Perret <qperret@google.com>
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-14-ardb+git@google.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20241212081841.2168124-14-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_153927_346870_2D69BF84 
X-CRM114-Status: GOOD (  36.13  )
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

This is a multi-part message in MIME format.
--------------mVfUhgVaC8Kwq0epPGn8TvkX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2024-12-12 09:18, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the maximum supported physical address space can be
> configured as either 48 bits or 52 bits. The only remaining difference
> between these in practice is that the former omits the masking and
> shifting required to construct TTBR and PTE values, which carry bits #48
> and higher disjoint from the rest of the physical address.
> 
> The overhead of performing these additional calculations is negligible,
> and so there is little reason to retain support for two different
> configurations, and we can simply support whatever the hardware
> supports.
> 

With this patch (32d053d6f5e92efd82349e7c481cba5a43dc1a22 in 
next-20241220), my Raspberry Pi 3 won't boot unless I set it to use 
52-bit virtual address space (i.e. neither 39 or 48 work with a 4 KiB 
page size), nothing appears on the serial console. I didn't see anyghing 
suspicious in the kernel log for the 52-bit case but I attached it as I 
don't exactly have much else.

I see that 52 bit physical address space previously depended on either 
64 KiB pages or 52 bit virtual address space, could that be related?

Please let me know if there's anything else you need.

Regards,
Klara Modin

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>   arch/arm64/Kconfig                     | 31 +-------------------
>   arch/arm64/include/asm/assembler.h     | 13 ++------
>   arch/arm64/include/asm/cpufeature.h    |  3 +-
>   arch/arm64/include/asm/kvm_pgtable.h   |  3 +-
>   arch/arm64/include/asm/pgtable-hwdef.h |  6 +---
>   arch/arm64/include/asm/pgtable-prot.h  |  4 +--
>   arch/arm64/include/asm/pgtable.h       | 11 +------
>   arch/arm64/include/asm/sysreg.h        |  6 ----
>   arch/arm64/mm/pgd.c                    |  9 +++---
>   arch/arm64/mm/proc.S                   |  2 --
>   scripts/gdb/linux/constants.py.in      |  1 -
>   tools/arch/arm64/include/asm/sysreg.h  |  6 ----
>   12 files changed, 14 insertions(+), 81 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c1ca21adddc1..7ebd0ba32a32 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1416,38 +1416,9 @@ config ARM64_VA_BITS
>   	default 48 if ARM64_VA_BITS_48
>   	default 52 if ARM64_VA_BITS_52
>   
> -choice
> -	prompt "Physical address space size"
> -	default ARM64_PA_BITS_48
> -	help
> -	  Choose the maximum physical address range that the kernel will
> -	  support.
> -
> -config ARM64_PA_BITS_48
> -	bool "48-bit"
> -	depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52
> -
> -config ARM64_PA_BITS_52
> -	bool "52-bit"
> -	depends on ARM64_64K_PAGES || ARM64_VA_BITS_52
> -	help
> -	  Enable support for a 52-bit physical address space, introduced as
> -	  part of the ARMv8.2-LPA extension.
> -
> -	  With this enabled, the kernel will also continue to work on CPUs that
> -	  do not support ARMv8.2-LPA, but with some added memory overhead (and
> -	  minor performance overhead).
> -
> -endchoice
> -
> -config ARM64_PA_BITS
> -	int
> -	default 48 if ARM64_PA_BITS_48
> -	default 52 if ARM64_PA_BITS_52
> -
>   config ARM64_LPA2
>   	def_bool y
> -	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
> +	depends on !ARM64_64K_PAGES
>   
>   choice
>   	prompt "Endianness"
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index ad63457a05c5..01a1e3c16283 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -342,14 +342,13 @@ alternative_cb_end
>   	mrs	\tmp0, ID_AA64MMFR0_EL1
>   	// Narrow PARange to fit the PS field in TCR_ELx
>   	ubfx	\tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
> -	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
>   #ifdef CONFIG_ARM64_LPA2
>   alternative_if_not ARM64_HAS_VA52
>   	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
> -alternative_else_nop_endif
> -#endif
>   	cmp	\tmp0, \tmp1
>   	csel	\tmp0, \tmp1, \tmp0, hi
> +alternative_else_nop_endif
> +#endif
>   	bfi	\tcr, \tmp0, \pos, #3
>   	.endm
>   
> @@ -599,21 +598,13 @@ alternative_endif
>    * 	ttbr:	returns the TTBR value
>    */
>   	.macro	phys_to_ttbr, ttbr, phys
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   	orr	\ttbr, \phys, \phys, lsr #46
>   	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
> -#else
> -	mov	\ttbr, \phys
> -#endif
>   	.endm
>   
>   	.macro	phys_to_pte, pte, phys
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   	orr	\pte, \phys, \phys, lsr #PTE_ADDR_HIGH_SHIFT
>   	and	\pte, \pte, #PHYS_TO_PTE_ADDR_MASK
> -#else
> -	mov	\pte, \phys
> -#endif
>   	.endm
>   
>   /*
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index b64e49bd9d10..ed327358e734 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -885,9 +885,8 @@ static inline u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
>   	 * However, by the "D10.1.4 Principles of the ID scheme
>   	 * for fields in ID registers", ARM DDI 0487C.a, any new
>   	 * value is guaranteed to be higher than what we know already.
> -	 * As a safe limit, we return the limit supported by the kernel.
>   	 */
> -	default: return CONFIG_ARM64_PA_BITS;
> +	default: return 52;
>   	}
>   }
>   
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index aab04097b505..525aef178cb4 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -30,8 +30,7 @@
>   
>   static inline u64 kvm_get_parange_max(void)
>   {
> -	if (kvm_lpa2_is_enabled() ||
> -	   (IS_ENABLED(CONFIG_ARM64_PA_BITS_52) && PAGE_SHIFT == 16))
> +	if (kvm_lpa2_is_enabled() || PAGE_SHIFT == 16)
>   		return ID_AA64MMFR0_EL1_PARANGE_52;
>   	else
>   		return ID_AA64MMFR0_EL1_PARANGE_48;
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index a9136cc551cc..9b34180042b2 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -176,7 +176,6 @@
>   #define PTE_SWBITS_MASK		_AT(pteval_t, (BIT(63) | GENMASK(58, 55)))
>   
>   #define PTE_ADDR_LOW		(((_AT(pteval_t, 1) << (50 - PAGE_SHIFT)) - 1) << PAGE_SHIFT)
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   #ifdef CONFIG_ARM64_64K_PAGES
>   #define PTE_ADDR_HIGH		(_AT(pteval_t, 0xf) << 12)
>   #define PTE_ADDR_HIGH_SHIFT	36
> @@ -186,7 +185,6 @@
>   #define PTE_ADDR_HIGH_SHIFT	42
>   #define PHYS_TO_PTE_ADDR_MASK	GENMASK_ULL(49, 8)
>   #endif
> -#endif
>   
>   /*
>    * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
> @@ -327,12 +325,10 @@
>   /*
>    * TTBR.
>    */
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   /*
> - * TTBR_ELx[1] is RES0 in this configuration.
> + * TTBR_ELx[1] is RES0 when using 52-bit physical addressing
>    */
>   #define TTBR_BADDR_MASK_52	GENMASK_ULL(47, 2)
> -#endif
>   
>   #ifdef CONFIG_ARM64_VA_BITS_52
>   /* Must be at least 64-byte aligned to prevent corruption of the TTBR */
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index a95f1f77bb39..b73acf25341f 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -81,7 +81,7 @@ extern unsigned long prot_ns_shared;
>   #define lpa2_is_enabled()	false
>   #define PTE_MAYBE_SHARED	PTE_SHARED
>   #define PMD_MAYBE_SHARED	PMD_SECT_S
> -#define PHYS_MASK_SHIFT		(CONFIG_ARM64_PA_BITS)
> +#define PHYS_MASK_SHIFT		(52)
>   #else
>   static inline bool __pure lpa2_is_enabled(void)
>   {
> @@ -90,7 +90,7 @@ static inline bool __pure lpa2_is_enabled(void)
>   
>   #define PTE_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PTE_SHARED)
>   #define PMD_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PMD_SECT_S)
> -#define PHYS_MASK_SHIFT		(lpa2_is_enabled() ? CONFIG_ARM64_PA_BITS : 48)
> +#define PHYS_MASK_SHIFT		(lpa2_is_enabled() ? 52 : 48)
>   #endif
>   
>   /*
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6986345b537a..ec8124d66b9c 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -69,10 +69,9 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>   	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
>   
>   /*
> - * Macros to convert between a physical address and its placement in a
> + * Helpers to convert between a physical address and its placement in a
>    * page table entry, taking care of 52-bit addresses.
>    */
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   static inline phys_addr_t __pte_to_phys(pte_t pte)
>   {
>   	pte_val(pte) &= ~PTE_MAYBE_SHARED;
> @@ -83,10 +82,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>   {
>   	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
>   }
> -#else
> -#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
> -#define __phys_to_pte_val(phys)	(phys)
> -#endif
>   
>   #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
>   #define pfn_pte(pfn,prot)	\
> @@ -1495,11 +1490,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>   	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>   #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
>   
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
> -#else
> -#define phys_to_ttbr(addr)	(addr)
> -#endif
>   
>   /*
>    * On arm64 without hardware Access Flag, copying from user will fail because
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index b8303a83c0bf..f902893ec903 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -916,12 +916,6 @@
>   #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2		0x3
>   #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_MAX		0x7
>   
> -#ifdef CONFIG_ARM64_PA_BITS_52
> -#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_52
> -#else
> -#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_48
> -#endif
> -
>   #if defined(CONFIG_ARM64_4K_PAGES)
>   #define ID_AA64MMFR0_EL1_TGRAN_SHIFT		ID_AA64MMFR0_EL1_TGRAN4_SHIFT
>   #define ID_AA64MMFR0_EL1_TGRAN_LPA2		ID_AA64MMFR0_EL1_TGRAN4_52_BIT
> diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
> index 0c501cabc238..8722ab6d4b1c 100644
> --- a/arch/arm64/mm/pgd.c
> +++ b/arch/arm64/mm/pgd.c
> @@ -48,20 +48,21 @@ void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>   
>   void __init pgtable_cache_init(void)
>   {
> +	unsigned int pgd_size = PGD_SIZE;
> +
>   	if (pgdir_is_page_size())
>   		return;
>   
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   	/*
>   	 * With 52-bit physical addresses, the architecture requires the
>   	 * top-level table to be aligned to at least 64 bytes.
>   	 */
> -	BUILD_BUG_ON(PGD_SIZE < 64);
> -#endif
> +	if (PHYS_MASK_SHIFT >= 52)
> +		pgd_size = max(pgd_size, 64);
>   
>   	/*
>   	 * Naturally aligned pgds required by the architecture.
>   	 */
> -	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_SIZE,
> +	pgd_cache = kmem_cache_create("pgd_cache", pgd_size, pgd_size,
>   				      SLAB_PANIC, NULL);
>   }
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index b8edc5765441..51ed0e9d0a0d 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -197,10 +197,8 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
>   
>   	.macro	pte_to_phys, phys, pte
>   	and	\phys, \pte, #PTE_ADDR_LOW
> -#ifdef CONFIG_ARM64_PA_BITS_52
>   	and	\pte, \pte, #PTE_ADDR_HIGH
>   	orr	\phys, \phys, \pte, lsl #PTE_ADDR_HIGH_SHIFT
> -#endif
>   	.endm
>   
>   	.macro	kpti_mk_tbl_ng, type, num_entries
> diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
> index fd6bd69c5096..05034c0b8fd7 100644
> --- a/scripts/gdb/linux/constants.py.in
> +++ b/scripts/gdb/linux/constants.py.in
> @@ -141,7 +141,6 @@ LX_CONFIG(CONFIG_ARM64_4K_PAGES)
>   LX_CONFIG(CONFIG_ARM64_16K_PAGES)
>   LX_CONFIG(CONFIG_ARM64_64K_PAGES)
>   if IS_BUILTIN(CONFIG_ARM64):
> -    LX_VALUE(CONFIG_ARM64_PA_BITS)
>       LX_VALUE(CONFIG_ARM64_VA_BITS)
>       LX_VALUE(CONFIG_PAGE_SHIFT)
>       LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
> diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
> index cd8420e8c3ad..daeecb1a5366 100644
> --- a/tools/arch/arm64/include/asm/sysreg.h
> +++ b/tools/arch/arm64/include/asm/sysreg.h
> @@ -574,12 +574,6 @@
>   #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_MIN		0x2
>   #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_MAX		0x7
>   
> -#ifdef CONFIG_ARM64_PA_BITS_52
> -#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_52
> -#else
> -#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_48
> -#endif
> -
>   #if defined(CONFIG_ARM64_4K_PAGES)
>   #define ID_AA64MMFR0_EL1_TGRAN_SHIFT		ID_AA64MMFR0_EL1_TGRAN4_SHIFT
>   #define ID_AA64MMFR0_EL1_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_EL1_TGRAN4_SUPPORTED_MIN

--------------mVfUhgVaC8Kwq0epPGn8TvkX
Content-Type: text/plain; charset=UTF-8; name="rpi3-no-boot-bisect"
Content-Disposition: attachment; filename="rpi3-no-boot-bisect"
Content-Transfer-Encoding: base64

IyBiYWQ6IFs4MTU1YjRlZjM0NjZmMGUyODllOGZjYzllNmU2MmYzZjRkY2VlYWMyXSBBZGQg
bGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyNDEyMjAKIyBnb29kOiBbOGZhYWJj
MDQxYTAwMTE0MDU2NGY3MThkYWJlMzc3NTNlODhiMzdmYV0gTWVyZ2UgdGFnICduZXQtNi4x
My1yYzQnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9uZXRkZXYvbmV0CmdpdCBiaXNlY3Qgc3RhcnQgJ25leHQvbWFzdGVyJyAnbmV4dC9zdGFi
bGUnCiMgYmFkOiBbZDcxMWQxYjM0OGExNTc0YTJjMjQ4NzI1MTIwNjdkMTkwYjYzZmQ2OF0g
TWVyZ2UgYnJhbmNoICdtYXN0ZXInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9ibHVldG9vdGgvYmx1ZXRvb3RoLW5leHQuZ2l0CmdpdCBiaXNl
Y3QgYmFkIGQ3MTFkMWIzNDhhMTU3NGEyYzI0ODcyNTEyMDY3ZDE5MGI2M2ZkNjgKIyBiYWQ6
IFszYWE2MDIyNjNlMDI1YmI0MmNhODc2NmExNmJjZWZmMjg3YThmMGVlXSBNZXJnZSBicmFu
Y2ggJ3h0ZW5zYS1mb3ItbmV4dCcgb2YgZ2l0Oi8vZ2l0aHViLmNvbS9qY212YmtiYy9saW51
eC14dGVuc2EuZ2l0CmdpdCBiaXNlY3QgYmFkIDNhYTYwMjI2M2UwMjViYjQyY2E4NzY2YTE2
YmNlZmYyODdhOGYwZWUKIyBnb29kOiBbYzQyNjJjZDczNGY4Njk1YjIxNzMzMmVkMmNhNzIz
N2E3ZTc1M2I2Ml0gTWVyZ2UgYnJhbmNoICdmb3ItbmV4dCcgb2YgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21hc2FoaXJveS9saW51eC1rYnVpbGQu
Z2l0CmdpdCBiaXNlY3QgZ29vZCBjNDI2MmNkNzM0Zjg2OTViMjE3MzMyZWQyY2E3MjM3YTdl
NzUzYjYyCiMgYmFkOiBbYTAzYzdjYjE4NWEwNjQ4ZDRmNjdmYjYzYWNmNGI5OGI2ZmU4ZDBm
N10gTWVyZ2UgYnJhbmNoICdmb3ItbmV4dCcgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L21lZGlhdGVrL2xpbnV4LmdpdApnaXQgYmlzZWN0IGJh
ZCBhMDNjN2NiMTg1YTA2NDhkNGY2N2ZiNjNhY2Y0Yjk4YjZmZThkMGY3CiMgYmFkOiBbMjA4
Njg4MDk0OGRjY2NlZDUxMTBlNDcyYTk5OTE1OTEzY2VjMWI4Yl0gTWVyZ2UgYnJhbmNoICdm
b3ItbmV4dCcgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2FtbG9naWMvbGludXguZ2l0CmdpdCBiaXNlY3QgYmFkIDIwODY4ODA5NDhkY2NjZWQ1
MTEwZTQ3MmE5OTkxNTkxM2NlYzFiOGIKIyBnb29kOiBbZTdiYjQ5ZTNmNjQzNWZmMzYxMWI4
M2Y3OGE2MWQzODdmMjRkODBmOF0gcGVyZiB4ODY6IERlZmluZSBhcmNoX2ZldGNoX2luc24g
aW4gTk9fQVVYVFJBQ0UgYnVpbGRzCmdpdCBiaXNlY3QgZ29vZCBlN2JiNDllM2Y2NDM1ZmYz
NjExYjgzZjc4YTYxZDM4N2YyNGQ4MGY4CiMgYmFkOiBbN2JkZDkwMmMxNjJkNTU3Njc4NTA5
NWEwZjg4ODVkZjg0YmI0NzJmNV0gTWVyZ2UgYnJhbmNoICdmb3ItbmV4dC9jb3JlJyBvZiBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXJtNjQvbGlu
dXgKZ2l0IGJpc2VjdCBiYWQgN2JkZDkwMmMxNjJkNTU3Njc4NTA5NWEwZjg4ODVkZjg0YmI0
NzJmNQojIGJhZDogW2Q2YWI2MzRmMWIzMjNkYjY2MzliOGI3NzZmNWQ5NWFlNzQ3YjM0MmFd
IE1lcmdlIGJyYW5jaGVzICdmb3ItbmV4dC9jcHVmZWF0dXJlJywgJ2Zvci1uZXh0L2RvY3Mn
LCAnZm9yLW5leHQvbWlzYycgYW5kICdmb3ItbmV4dC9tbScgaW50byBmb3ItbmV4dC9jb3Jl
CmdpdCBiaXNlY3QgYmFkIGQ2YWI2MzRmMWIzMjNkYjY2MzliOGI3NzZmNWQ5NWFlNzQ3YjM0
MmEKIyBiYWQ6IFszMmQwNTNkNmY1ZTkyZWZkODIzNDllN2M0ODFjYmE1YTQzZGMxYTIyXSBh
cm02NC9tbTogRHJvcCBjb25maWd1cmFibGUgNDgtYml0IHBoeXNpY2FsIGFkZHJlc3Mgc3Bh
Y2UgbGltaXQKZ2l0IGJpc2VjdCBiYWQgMzJkMDUzZDZmNWU5MmVmZDgyMzQ5ZTdjNDgxY2Jh
NWE0M2RjMWEyMgojIGdvb2Q6IFtmMGRhMTY5OTJhZWY3ZTI0NmIyZjNiYmExNDkyZTNhNTJj
MzhjYTBlXSBhcm02NC9rdm06IENvbmZpZ3VyZSBIWVAgVENSLlBTL0RTIGJhc2VkIG9uIGhv
c3Qgc3RhZ2UxCmdpdCBiaXNlY3QgZ29vZCBmMGRhMTY5OTJhZWY3ZTI0NmIyZjNiYmExNDky
ZTNhNTJjMzhjYTBlCiMgZ29vZDogWzkyYjY5MTlkN2ZiMjk2OTFhOGJjNWFjYTQ5MDQ0MDU2
NjgzNTQyY2FdIGFybTY0OiBLY29uZmlnOiBmb3JjZSBBUk02NF9QQU49eSB3aGVuIGVuYWJs
aW5nIFRUQlIwIHN3IFBBTgpnaXQgYmlzZWN0IGdvb2QgOTJiNjkxOWQ3ZmIyOTY5MWE4YmM1
YWNhNDkwNDQwNTY2ODM1NDJjYQojIGZpcnN0IGJhZCBjb21taXQ6IFszMmQwNTNkNmY1ZTky
ZWZkODIzNDllN2M0ODFjYmE1YTQzZGMxYTIyXSBhcm02NC9tbTogRHJvcCBjb25maWd1cmFi
bGUgNDgtYml0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgbGltaXQK
--------------mVfUhgVaC8Kwq0epPGn8TvkX
Content-Type: application/gzip; name="config.gz"
Content-Disposition: attachment; filename="config.gz"
Content-Transfer-Encoding: base64

H4sICKzUZWcAA2NvbmZpZwCcPF132ziu7/MrfDovuw/t+jvpuScPtETZHEuiKlJ2nBcdb+q2
OZMmvU7Smd5ffwFSHyRFKdmdh2kMgF8gAAIgqN9/+31EXp4fvx+f726P9/e/Rl9PD6fz8fn0
efTl7v70P6OQj1IuRzRk8gMQx3cPL3//63j+vpyPlh8msw/j9+fb2Wh7Oj+c7kfB48OXu68v
0P7u8eG3338LeBqxdRkE5Y7mgvG0lPRaXr07Hs+335bz9y8Pfz48/vXw/h57ff/95en+/dfb
29E/1qeH58fH0WT+YfphUv6YjqfzyWSyHP2Y/bMCjmrYO2MQJsp1EFz9qkHrduCryXw8HU8a
4pik6wY3rsFEqD7Sou0DQDXZdD5re4hDJF1FYUsKID+pgWiGygshjdmNL2djC4e9kx1hMVnF
tB1DN4vjXdK2/TiejBcGGwKSljFLt20rA1gKSSQLLNwGFklEUq655CUvZFbIfrxkNOwQSc5j
UYoiy3guy5zGubcDlsIUaAeV8jLLecRiWkZpSaQ0WmdkwwHeLHZ6UWNY/qnc89xY5qpgcShZ
QkuJXCsFTMaY4yanBHYtjTj8D0gENgUp/X20VkJ/P3o6Pb/8aOWWpUyWNN2VJIddZAmTV7Mp
kNez50mGc5ZUyNHd0+jh8Rl7aAn2NM95bqJqieABieslvXvnA5ekkNxZWilILA36kEakiKWa
pwe84UKmJKFX7/7x8Phw+mdDIA5ixzJDBioA/hvIuAvHlRKDlRkX7LpMPhW0oH5o21XLDSKD
TamwHpYEOReiTGjC8wOKAAk2ZuNC0JitPO1IAZapncOG7ChsFwykEDgLEhsrcqBq90GQRk8v
/3769fR8+t7u/pqmNGeBkjMQz5WxUhMlNnzfjyljuqOxH0+jiAaS4YSjqEy0PHroErbOQWdB
VIxl5iGgQOX2oG2CpqG/abBhWYtBSMgTwlIfrNwwmiPrDv6+WMa6iEQwRNr9KSBPksIGRzwP
wHZoPWTp2pCzjOSCVh01e24OHtJVsY6ERwBMqi29piCtMSV5CRYSBtwDo1Sfp4fPo8cvzl67
fSjbsesITY0OQEG3sJ+pFIZEobChFQOrui1XOSdhQIQcbO0jU5KrVSjICjWVXCgr5Vi5t9DA
P3jSljInwdZitYspWajOF6UJ8u776fzkUwa1OJ5SkGljzmC4NzdoHRIlnM3OATCDNfOQBZ4d
062qcZs2GhoVcey1pQrt6WzD1htUgYoZ5l53VtMY0yxy+E4BVP5hGhK1rXuSysactiSKV/DT
xyik6ghQ27RZTwUqSbwnBwGs9aytpqlnYFoAxBVplrNdi44id4QMjmKQNJujFXvsBTTSlVOa
ZBL4nVJ96hiSZ+DMkWr4jsdFKkl+8O5gRTWEK/NhdHiA88yWKbUXoAz/ksenP0fPsOWjI6zv
6fn4/DQ63t4+vjw83z18dSQZtYcEAYfpau1ohtoxcGBsNGqwZ3fQ4CiDYXVkSpUINmDvyG5t
m0gN3uxxWUIUuXGwrESIZ00AcOxW9mPK3cxwbcACoF8nzJUosxDSmBxUA88KFMW1PY6CMe5d
VCaYte1g5mvZC5lAl8svaW/YnsY8AeeZ4HF93qntzYNiJDw2CaSiBJw5J/hZ0mswPt71YgOh
W5icU60qM20YN4qHVY13m6D9pDYCe4FdiOPWIhoY1Z2g62AVMyFNO2UvrxGvrf7DOEO3jTrw
wFw0227gRAXr53U10XkEm7RhkbyaXJhwZHZCrk381FQ6lkqQhTSk1wPnrpZmdbjV+yVuv50+
v9yfzqMvp+Pzy/n0pLW0cuUg+EoyxUavtHhaW0a5ijIgbCgSUq4IhHKBJaat6V6hywmzK9KE
wIjxqoziQmw6AQgsdDK97IDlIaMczeyngsQWliVZzAIwzRFsNzg0vFhvrt693999/3F/d3v3
/P4LBNPP386PL1+/XS0axxsC0skYjzKS56CWK9CwUFgd9+LWGikk7MqaZyWHOCGKTdfzVQKb
e+6a+7hpwxuFp6nSd8OqQaRa8tUfJUb47aTWwJvMWEdG1rRUpoXmpgxrQuDnjudo5xMe+sQZ
AoTAstcKUO4mvuMz3lbduvMp9zmTdEWCbQejxNlgewuEcA58DWNtEWF5abdqlxOBk0fScM9C
ufGeaXDMGG0909eDJkkZsLAzzYyFwsO+PEyIL7iqmAv274bmnc42xZqCchjwDOIt+zSpQH5O
o0HCKVVUnQFCumMB7YCB2j586sWB5HaA2mlzF5wwEXjZ24wMcYOPuTzYNjREEkPeIWKGeAQO
2hZWoLUxfqtj3wRgkGz+Bi7kFgCZY/5OqdS/2wlvaLDNOKglurOS574oufIoCslruW7lCU/6
Hi0A/qskQW4IkvpNEpBTwQsIzIwEQh6W6xszcATACgBTCxLfJMQCXN84eO78nlu/b4Q0prPi
XJbNidc6sS1Yx4/ezTapaLLyqlO7XnS7aA7+WYL7aBlQngGI3VAcS4khzxMwfJa365IJ+MN3
8IYlz7MNSeEoyg1fwIZX+YF3fx3PD2Z+xkrDKGeyYOFkaaVmgAaMbUAzqTKr6JC0eO0EGRJp
N0/AhjOUUnNlAswApiHqAMYngAeBEuMGOBGsJ4w7uaAmJrNcCjOrZRw0NI5gD3OL1ysiwGNL
/HOJCohkjTngz9JMUtCMm5MUbJ2S2MzYqvmZABWemwCxgQPGOEKZIdPgJRe57XmEOyZozR5j
4dDJCs51ZhrfbZCYKiaolfxQhktBffacgB1Ah9/YidZvAx9j7mm0xSkdEsvo1DBwTOOoN4/Z
UPn3ocmAtKuEeaVBvZumFKNOlU0KRbmF1d1Bdjp/eTx/Pz7cnkb05+kB4gMCDmGAEQKE8a3b
b3fhMEwhQa7LHQoND7we5htHNGRe0kQdE5iHZhELnHSczl47kSSm6juR6vb09+lWhUC35+PT
N9NBrvc2J0JlNNBEtUPsEuSmyl4bIqTzXRabFcwlwdy6te8KCgrhzcTiBMIiycwgpX/iNYWd
RG+FI1madl/dXzROqINFJ7fBVcF+GelQa8/kBhPxhlYt5yszZWMlHFXPKttVZpJW4c3ch03C
LhYEOsGQIU/h5GMwmYSlV5PLIQJyfTWb+Ql0+tzoaPIGOuhvsmzcBQ7WRt2tAK1hnSS4sJo9
FdsM6xTHdE3iUrkUoJE7Ehf0avz359Px89j4rw0Ig21Is25HdaBnGWsDqDwPlcauhhJdso3r
OzdJUVEkHiiJ2SonsG8qf2Es2DSZW5qnNC4hUgBnjJr6GMHZQ0keH+B3aRnwbK2vhtSxK5wt
b0SvUPl+N8mrvNytUkNpBTmYJpMsBUbIAo50EoaY2FGhWAbuBglqU5fdH5/R5ICO3J9uq0vS
Rin1tUWApkV47bAmYDnfkH68KNJrNtA8zljq96I0PstinzujkKsgcXgCkOnlbGHalhoOTnHu
GmCHZBUMLGSVB4mQqwECmoPNHcAzifcaAwQxcXw3G0+vDykf2Aq8trhe9OO3s35cvJ5s+7Eb
Jgb2cEvxoPVnWbVFoSED7RkYAGIcPsCZZAenaT86vc4G2pLZAE/SLEj6sRlNBXiSvJ/iExjJ
fmxOSTy47hwsjCADewoiu8Vbs4Fdp0TKeEBs0AjGGGFG2XpIUWUymw6gD5h2CmjeTyLpOh8a
IMvDgcabIg0He9cEA1MsUpbhpWE/xQ7CELSFAxQQwMMxPCDt13gq9KNvgE+Js12VR+Ixt6bH
GbW+lwKDUzA6nc/H5+Por8fzn8czOIKfn0Y/746j52+n0fEevMKH4/Pdz9PT6Mv5+P2EVK3j
RhJwPmlJczi4igQM+XimMqyzS9crwbs6kmOCT91Vptqfd6nqji6ny9nkYz/2YhA7Hy/7sZOP
84tpL3Y2HV8s+rCTi/l0/LGztKbxfHExMK35bN7FQmSMUYQ6vAcJmzmMp/OLSe8cJvPJ5Xg+
HuC+yGhQVM4Lkb39TJaLxbSXTxPg/2x50YtezMYfp7OBWeQ0A5OC6Wlmn6NmN9P5fDIeX/To
gTXg9HJ5aVP2sGc5m04X/UNOFvMpcP/1jhbjy/mklz/T8WKyvOjdJRCyi/Gil33T5QI676AN
9klRpfUxIRtb12mdicyn3Z1o0cuLj8vJa1vwOj+mKPvL/gUv54tJV3N6xLK648Vb3N4OPy6X
035VnE0mF9OPvYoM0jufXRqpoYDsGMCb3qcz0wq42NlkPh/CLgawF/NF/7iz8WTSHVdeT9v2
pmWIij8gbCoa5Bi2ajwxsg/gUcUM44FGbJeT5Xh8OZ4OE00nSGT0hB4I3vtseW5YovHsVYqP
DsWnMALzPG6nPF4uhjuhk/HcmEm6Y+DnAWvyBByOIM1qQiPertyZlq2Ly0uLMeCnQMCBJSGN
x4EZUiatWor/7my0JW6+Vbc/oqthk2WFGjBvy/nrNDuig+dZv5LWJPPL7jRq3GL6WvOr+aUN
jzMyvbKvS4BwXdIUdshXPYAEMUNHsqIxdkRf/AQuJAAj59yaaYRIfLfdaa6uY9oYd8NlFhdq
aEOGCjOLn0IsLap0yLRpd4PSaw4LkOli7N0IQM3GvShUSl8Rz83VpM1EVPUROVZqOOGmLhSD
iL66fzRUd+8kBms+B1UtxoaEfI+ZhVinTayUKckJFn74i08qpFvs0RckN1kEJxPnQdZ5OTu8
iGkwSGB3IZh79e0QsASvXFXi8uChri9030TcdG0lCX3d9RKgi9fkeZCoSuPojKeTWJU5SYWu
5jX369pbkKO6V5dEqqqB5xC9gFzVaF0EUI0G/haNDdcwYZKtMeGEZ68EN34FI+tAXPL8YBpU
lQfGOjXPXbhjUMS+lHKVj0GG/BNGIknWa7zUC8O8JCvj+sKtut2qW8UNjbO60M0iLEnM1mkC
4o8udJH1GsrdJcwcTHwA67UCxDoK+nn5YTLCEv27ZwibXjCp281T68mD2pEoXFlpIYRnpkGD
HcddjwV62TxhgXDJB1CYzLfR5qE0NFVjOdPXl6PnqNkz7cwdzMesu78ZWKLefQXZxlqI1F0Q
nNPdRfRO0FjE7I17kskcr4g3nT2p4JUOODZS1CKf5Vxi0hLTmR0avENz8pwdXmkezjrwIGJl
SpWW5US9Q6BdGQlJlnfZ07t0gz3zN7KHJIW7L+a85y7bsGwIOLOm3Wn1DmlMa/GfiV7HT19J
9padsukqF3+cdYKGarBEdsIkDXJW2Dt7Y4UXb2Q81UbBGaG3tcOehGfNlaFu+fGt+sDdIzTb
0oP242aOOSOR7E6xdyA1mZ8f3yx6a9t+DbXsHCW7vhyYWqKgRcjLNGEec4Q1wGDrnYdEmGZV
NQx4x+6DJzwswDvN6RrLC/DA83hV6EmhGMKhiaUQBwHkzv1Ui4Zzq352Y1tEnsrMlj43RadL
rh9hYY8/MJFnXpgmoXpV1NavUDA0QhZGQRNA7HMVDRfFx0CqYLPFhQkzp2GNqK9wHv86nUff
jw/Hr6fvpwfPfEQBPoT5IKMCGOVXrf9eocQWQjS8M/dWuK/AXqPVROcVi9YMk1sjmVOA34JL
kZIMy/axCmigeyRFzth1OyYW3B1FcfXu/v8eG2ZnCfA6RC9ZMmm/Z0JUTKnhAdYQ+yIPoFjS
VNO2nneiCqlUNVZL4XfSk3JPtijoW1/ZYJY4/fbVhQEqiLfW1GpnVb+SMXi//wSmZQ8yTaOI
BYy2bwWG2ntY4lJws/oN4sTMcK+QdH1Ql56xY9XMvcq4EGzViR1MEl0z3HHwtUAa7dt0ep/o
1zX4FUXSUNSZdcSxz/cnQ2mxztuqGKohujQpgz/CnO1cT7cmWvNdGYMDQn3P6ywqcIiL3i4k
5Z72odQUykUxNryGw36pg7W5NajXNwrPdz+tYhXAgnEOGA5rr9fFtC+zrKRLt2ujql4ztWFx
dD7978vp4fbX6On2eG+9esBVg/35ZPMbIYoP+OaytCs3TbRbz94gkUMucxWiDo2wtVFH5y/V
9DZCzRKk59TzNmlsxdub8DSkMDFfvaCXHnBVlLqjr65b5TEKyXw1UxZ77UJDL0XNjR58s/Qe
fL3O3v21luUjaRZTyz0K3BdX4EafXQUAMs0YV04U1E26dBqVWUwkHFy23oggYzWRjYGgKwMT
lx/6CESQmBhLmzz6Y6I71s2fGiFBZt/jwG+vROLiCwjab5Q97hGSKjGBNSFXzmtlw3M8vf98
+gFT9TokTdpFFCtVfq9E1HQi6sQglragFzKAAgk3byK2bqXMHwW6EGRFrZpE/egcAs+Dv9Sw
Hk29xWtO0yJVKQ1MjgSBFWluIeJxR1aNGcwT0zzodDqozlQ1tK+nqEhVKU6pHnGDp/gHDdxH
uECWJoZnqUuxWP4pisladEupHDy07dK0L5gV9YbzrYMME6JcZrYueOEptgLfSp9T+qVtl0Ah
sTYWTX7hS9CBOZIqA6hLw7sEW/Bh3IryVs4gHNUvuXuQIcuBmXYtm7Fu/VBfyLwAov2GSVo9
mTL7wgc+6tMB6MPnbj8iQRepekvvbi3EKKCm6HZjfFIJV0nM0mFNJ0zroUFF581uIyj4lYDe
vjZ7iNop0RX+Dk4lrnFSPrhK+umJ2tnUlmGWzg1gm0o9I++ZFCWYl42KzLAwDoMULxrfsPWR
xOTmoPMkNFLp8c6+a00pBYkgjEmy62DjppbVhyBqErlhQpk/nrlMqU1CJR5o0ByKqn/9OYUe
XMiLrnes3oxVyVR80aFfpdffafCwVtBABUT9KEzgS9PL7jTpELZGs8Ko6pDeiMUYEoUkBhlz
5mNH4X3ReW/UDozmned1zWk3eK/SQb56ZxJLrj/O0jdeQ4AyYj6rAHj1LtnbDpOPTsdaINz3
8NWjCJOm502we/S8+h444ajURegFJy64PgNSvPTC4xCfaXnEXWtPsVY1715ZrJFYEO8TeYXX
ddAk9yoFIpOtejXXmXxYX83RAEvjDcugEkhCZfDxcQdaH68Rx5snvNOLSad7wSOJjAXzyvdp
I2G1fA1iG7OiBq/zWj4GWaXcTgc2rq0B97Q26rf7OjFJ2jJwbe3RNcPHROV8a6SuXgXHeOBI
fFC0fJViulh2SeqXv51dr4MZybMQ+atWEZMDt74PFKsvBQDn8VsbxsI5frCGrauMgnEdUPGg
whPHq6qwsynwqLQfaNka7XeaUAdcQfDB2hZtxnOrj1keRVYo3E/QvvXwk9QcHHo0g1Xigazv
JfO98aJpAOU2r5O1Jk27xOpLRXm58WHxIxGzaZ0mtv0lXecJCgz6aXnWzdIx5aZv3fWzXl/6
rZmt/WUo+5f5jKikaQAxXNePEJh6xpgQA2bXXbK/EjGMxVjEZ+n6nu3Zslc9NgL18RnVhkzp
l3aa1PNOn1ukY4Ik0d9csO/T6jVjcYOkJShe52DU389K4diPlJXuo6mEKIJTrA05dDgZ8N37
fx+fTp9Hf+qs+4/z45e7Kn/Ufo0HyKpehnZYkdVf86pfptUvhAZGsvZqrTa5WDP7iawB9j4H
rP3w5h58bti6LrqtjKmu1RKW+sh+OWSCpNRP13kL9UqI3igCKDC+XrRro6rz0/uml9uOlgKU
+OAnOKhMufvVl4ZOPwZeibXnsz0G1vnYVocEa9zX4A4MvThW7gKsAt/6h75xbuDk8Feo1xT4
aQUpY3+1DRLtV+Y7HA0ok0/uaNVLb4YfFgHT4n86YREGvOcxpEWV5cyXQNbTRxMRCXcqeO3E
M+L/yhES6I/k1RbQyQzpO6jj+fkOJWgkf/2wP67RXMPgW9T/5+zLmtzGnTy/SkU/bMxETP9b
JEWJmg0/QDwkWryKoI7yC6Nsq7srpuzyVJVnu/fTLxLgAZBIQL0d0baF/AHEmUgAecCFom4W
5DQqqfRiMz4uMCFZTh6v/idflBuai2s82TIWkvmjhfCvVo4+PaRrKZYvLYWuF9wpdZ4Bx9k/
kg8PW8TIoEdsk3uV3rv7Uj49ij2qyT+hhTNhmd0g0Ao8BdYP3XqzINrt3gCylHFbAaonIRSi
XhXPYMfCUhkBMFenw5grNII6pwZ6LL/wwes0kNEajQi0PgoE7yAOM3WQBDBXx9ZBE5CxgwQv
xSs10tE6SRC0SioG7ySBM/WSjLBUydZPU9Sso4yL1bZO8SVqXJ3mhWlfk5bVZltoN64xfHkZ
V5Z5UdnXk2kpWVaRbQHduHYMy8a8YiyL5YZ1YlwittVhXRi3ronJmxRXnmzrXHIHxSVOMYPE
/Yl871WfKTuFIUT+UYQ2HBi5o9eIw7hWxgjBKdPM9VmfdZYuH4W456uMVBVc0w222Orj6Hh8
Fv4zWH+yDHI7RmUdLsPEf12//Hx//Px85X6x77jjiHdJmtmmRZKDUrGsu9Ff9sxJvAIjYaYN
OSHHF3ZMbKt9VM8bfRK3a+qL19CTu+IIJHAGI513WYapqxX+wgcvDKNaMysVdyzX1Y6GdSqf
07tk8Mskd0QdTx1KYD3Kuzu/fnt5/Vt6a52/an6qylJ27nKW7z4/aX5q3WgKCt3XacHOtipk
6BoB6tXGyhHG/oYDhVY0RTNln/TmzWiGYKm3wTV8YfmPM+x1qmdoBtV3Ewb78Mv/fXv/+su0
AnzkxqK2R/0ZUAv2Erg21Kuvm/LR6e23BgXV/fb4/PzyZdBgg8opM+Gm78+/JVJ6dZlpcrgH
98twVfsh6DwoPj9+vuNVeXx/edXoGGZcu3F8aGG/2yYtdMdx7pgvj+tdLKmnSTkZFZgdPLF2
95ja4VCB4IA6xk7vHLo9hoe40Rsh8Opyh6Xa+jIiV3uDkyhR9AhE/dpD33HcD5L25If04PCR
/TFJsu7SnRdGxBvY1KhiW+serQY7JIkBjaZJjFnH8r31SDqxP+ASdWq9NENMLi933DXi7A0c
XuG51yVVyOi8qMt+VHu+fwEjMrAr7Zwa1WTq0UNUrS+j0/+wYVh7S1UjSs2P3Rjme15/6BLh
qQXyzDsnS4UXn6rR7ftdbTpYHnWwWQEDhc66agtTQHGvLBLELNC9UOjTmEQGrg7FlW+/2oZn
Hj7Z6hhEMuVxUOPgXW5Y/+5nwzXQmXNIyFVF2glPqsJKuEdtQQDiFlMfhiAS1f6BCoOkZupk
6UClCdOzVz6AcHsKeT4sF5uVUr9BDO16e7TTnk6XjoJNF/FcCO1U93fzK6mO2vndlqugheXC
pZuWi2kzsPHX6qTOK82PMGWRPXAaeBJMZFd5naMifv0P77NZzBjBdOoPPSuecJNCYR2TxwiY
/xMEd0oMavnAb7nnxDZJa8bfw/1RDiCi4IQOmQ4GAidDAYi7jQVz0jadPmxzpaOhNNZ/0lVc
yK1RRybMCtG4/lfo3CWhTnuO0aBw+sEdbAB7DSjuHKpXFpM/yGZ0XNeqegl3Ham/foz6LaRX
HzA9jQg9DnFuVx6iR8Sx5rNJvCF27rQ0uIp7xjrNBxuIcKvOdcSUR8w+dZ7iuZNC2ChS4Vef
faHlqmq6OoAyny5n1f3QFtsTpefgUy4/H04UvrvZNJMVxjchNpVQx4WsdVzAQ9QNlf7k+guy
vhBjSUnUhmwGySczGrOURuz8o4onHDuhs8B5rLYmoFXCeWWiExmz+qgqlHQJOsvSnoSJTz39
TLIDnfrEU/gBOIVjdVb3Sn0qP/HnOVeaS1L2x0meSZ3+hsQuYPFzuUTea3lqPKsQDIBQchPa
Qv1DPReEI/A4QL58ub693eUv35+YLDd5l4xIPvVk1YmAWN6ejh8yR7YnB7uIIdLOTjV5hMRY
k3aZpNHDFuTCuJjoIxZcSeAkeo83q7i+g+8EUKaeif1MxDioigcipY1SomM9xyKVdQYSntCW
pfQsylMgu7IVZvrFdklqYZKjpUJbGFPQ54wq7nM51s5ZyAkeZNkMOCg3aXL/p5UwDenCpoxM
uBreutq6PDba7ZeBqqJSCmO/22gfzhPBm3A1+QKk16TWGx/xmVEhPsMEcQeXK2zu6zzpC0Tb
HAvFKhfay9ujeakdaPrj1QMIruUhRZxliA+eGp2xINCOkVQbJVdS6r3CwUi1RO/onNNiqu+d
VNQFxGfdqAFVyEFwgXWst71V/0qBdPNXycXkW00yNE2TXJPzbBEMJbOBAx1I/cSG77B/7kzv
rQMmPG5lvZRBv6qjf/jly8/PT+PtA6TTdKdedEEiKdXfeeQrvhrY4K7UX93KAC2YREeZOJbl
BOHlmoLifkSiadesTOO9Mg74SjPi0tRmn87TaoVT00zv9Y4TT4gvOU6kmCAHRDHltcwDqtSb
pfH5SNXVCEUftxBfRMfeRH7ez7Ns3RKflI5Xskpzmrcn/Y2gqEi8W7XZed4aDWyfE72HTjEz
quyGgtKS5JYPsjHnCug6XYSqUVgwLDqeNlmmIq2b2HLB4DcLpLKcaG9qoLyqqUD3l9I0edDl
ZsddrmnIJI+80gvxDDrV5B6ShqXfb+Hhy+sV9vHfn8AtEhYVc8yvkyo6kka26CjQp6l6RutJ
EPmpo8ltVTO2YFmCjdYEOo0fZIDO4vsZsFm5uxFZ0kQ3KGCPXBT87CX1Q8KD27BjIftL6QIJ
3k6nix4FZyRkD5Vh4OhWewZVUHOf5QoZZiDjBfavDVPVDuWrDqtYw9+MyjYK5RUoU2jYIBS2
j2apys6UDxOwNtSFIlFQiSpnKbS95+rd5yqotNbzLwXEZtE2LSGEhx1Li1v6tWIs5YayCOK4
VEWlOtFHHXFNRzX94sC+UBCtV7Bk3MCmSb3ALZfSURhh4j5AAjVwtNMHSQNiOCmTh+ooeDxV
JMds4TbtDK5+n+A0077EyPfHstFPVAjEAkZ/ck/1aZqugiMM1YtEQBSnH5Q84XBqC9iau+jF
T17yQ2ECtBAFSoyjhdtedMJHbwBr2tOUgwlFWslIJ6VsoRxY/ecNW2UCsnJNuMSxnByEGDGt
umkqNGCxjhBDwMvAIKKrZ5D5ShH10MyLSQWBFB0r00fBX9fWXCvxUfT8mdg+wXfESXaVOG0Q
1h61w/VKl4Yh7cb8f1amUZc+tvr/Gl792UEZ3pVteFfY8K6Q4cU+OgwvWitdAbqBWM2EnGl1
Jh2GDI+p97VLboXu0ts6jXZ6vsJmCkgWGA1kCy2tjvTbNDsfIdEEGv2LdeYiXzBUmp/5qW4/
OGWkaIOF6yjK5WNquzshy1PC5Bgmy0LE0XpDMv0Wf3H1bvYzUul196s9k2b1vHnFtoiK6AMC
pHEcQ+19LUeMmyH4HV+59z+vP69P3//4rdO7ntzWdvh2jwR2GOgJEtetB0w172cAfqK+N0Jq
RH+hp9PEXEk61Tqf0Jv4Hj0PC8AW2fQ7erjFL/CAznZuc/nE2k07Wyewv2P9+uoRUY3fB/OR
uLfWgh62Vky4Lw/4ogXEvWU8QnCahE/iNrkXkOmtJ89LLB+3fHu/Nw9VlZqLn2pRaOYCdrPO
x2jqmKq/e9S1uadVSZqUXO9EU3IP6r7w4Zff/7v98vL1+vxLdwny/Pj29vT705fZrg45wgzi
Y9IUX+SA4HdjiEzTQZKzkXxEQmwM2RnjMwKEqY8RAoG0bd8wPJkAJAdNDIKFPof7c44wlkG0
MZ6H6Zny+91xjMOtblALsNGkZXZSXRFs2R5LuE2RtgplFRcnek6xKp40Tz/K5SDc8UzfsAZA
XiHPUSKIpv6Te6p7BuK9weup+BSC5MxjowD+tVtBGkq6rxt88IqQ6l5RKni0BgM2cIghmxCC
Y2J4CwTJikrhmGvZz0Wd8Bjf8mMQj1daX8T1GjhOqRQNokuliwbL7z4xtiphxN2o7uWCv41A
gGj60KrBFLf3CsvgYe+bOia58JqBdT4/i/Kz/OS98+79+vauERaqQzO5WRgE2VnOCUF+QpUm
BslrEmGdgshAW73YRJh0fqkxsTSBEI/6GT2RfbtkOCfUR+Vu5pzWcabcAIfJDqQxJU5FkfEk
rucAngH1besywryMM9AI5ybObB4hujU9PozBGVAX9LAti6NW26ZH1/H9MQVnUcJNSx3vou28
9lxVaPD8zSCtqk4iVbbbi9QJPpJnykGz6tcRkWye52Wc44uOc+Yk7Dt6kiJM2UMNoQ5BDQ4W
QqanDhpzt6A+/PLt6fvb++v1uf3zXVKjHqB5rHK/KT2L1SjRA0EYp4JrRFN22hB+pyW4Fqgs
LUYWdUhldiB+9x9UE9Oikh1GdKm7SrYYhaW+qaa/WzkUa5c02JoqbGKjCfUsrepUv0OHcbVv
MVPnItGv64qSvMLv0to00dN0L2T9tguqdGoMKMadWfWUILJ88+qcp02TuX4OlXYErpWmvhwP
SUJ3aCSA1mV5kt+24mbfAHB8ZBLaONf/efqCeLkk+VZSCRIuF0LJC1avescS27ScqN2xRH1f
hyGp5z7quXn905euInfloCczZDwKlTLhLF8rvZ6avJIVLvsUYbCuisMdBVxTacpivVlEJFOc
D1W1qECS1jnjsjGPETkckpOn12//5/H1evf88vj1+jp2ZHLmkX4UQ6Q+iY9fxApKdESuBSmr
ZIHBUP/1D798fv3y7Tf44/dvj1+W3tJb/Pr29enlX5+fvt9htC/P39rPzy+fUcDr49uPz9fX
179/PP2H9+s3EP5//fyv97/e716vf/x8BsX7v//19fMv+kqBF7gPv/z2/PT5t9+7/vhl3i4p
5oE8JloAhMvhDpK1c2nM0luq6Lbg87AQ5YzHaupQYRA2pmM5rIkMRB2QARXrp2FOAQMWHm61
te0A8alGHiAFAHhBV0wrlPA1jRrCbQihNFVi28tE8BzBnSHqyadjxn6QbZqlTSqXwdgPyIgS
j493uarrDL/b1A1naVR2ldelgTeUeWbZDJLrt4K3Kr4gEnVyADGJi7BzrmLoEeFjq2Sibbl7
mDeak7sIOfJ0YJ3IjyzcISY33dO/3sreQObsSvg0//l295WzVYV/5eWlQe7q+piKXcB7vYC5
T2FATLR26km7d3kuVUjU6PHLnzLPH5+EFMIgd5Vsk1MdyvHAuWrQ72HVjOUO3pTp32/v129w
L/3++vLMY05LOpopBOf+/ZFtQ9Xry/vLl5dndR/iDl75I3VYKkeUgQjKXjxocCcU6qX3Hi3W
Wa+bPNuKAHPXvD5+f/vx8vqu3xp5Ob2zn4Kq/j5VwDTevEJUNviBNJTJxLQ025YXI4byuFLz
ZiqI3l5YqB9r1o8mW1k1cWwpWshu2mmH9OM4KYDO487+K7/cnViul9dhBihLJ80v4rvbLbfF
0n7uhiLnk4o7e2epTV0qfo3+vyatWnylzNnhPNjtlFObsChPZauKCNxmqvu/7Ad5kAJGfs3A
28lPJuCDWJtsp2OYJGQcQu1a2ZXlLouH78zWSJykd/8W//V+/f72BPa+w+IfuuXf7+jPHzDw
48IBXzQxlVcKpJxITZkE3kyMlyek0UA3pcgM7lzdkJy2SQ2R9qLJl2pw4ZjHvWU4VamDr91G
NcQE2idQIEY+yToUsrRRs51JekCHrIOUMk40CRGSioKrN4HSjgfAUJsIiLPVgMN3rgU1eJdG
C+q6kMvtbGNF2tVHW5/Wts/d9Sb6lZDN/M62Qrte/8kU6uvF+BEEWc676B9zBgFG6kx40kXF
GLzzJ+fpehBO+8Gdm9r93fPX4/OXl2/f7nqRVvKIPjQGBynHJ84Z8jCcerIb0qF3Qzi4PUxY
PieCUJYOR47m+sfr4/SDcqUQwEzMHTnzsPwLJMBz3ujuFKNGahAPdTHeI3MLhQYx1ylBlQUi
Fcjuh1miMObSkg7l9qOSMPMNyNJmcaxYmiJslkkXnQ7CMsrbsyDAbbmSJhxQPChpUymS8Z4p
P+0one8z5Xa1c4dWQNS5LfIe/IkxM7w4xi9KaQeRU7nlpnDbHMy/GdVbs4+2wkKfVGu8fImA
71aHJoxOSJzyhvC+hOsI3Ys8lybgO7q+slX7OOlHcRl9YjxqthVB6iSiGk8KFY8rPEnocZMZ
lLViW9JYOJOnE+L+rETX4GkJ2dZ9uDslXeengVOEHrWKBp3pRq8Ayj9cstOjpmENqXeK6dOY
2N+4zj8lyBWhtNnXuntFGdbNRm0RyL2bDGlCrSqThOhaNb4JyCMrfIw8vX3RHb1I5Lv+pY2q
Ur+BsqN8/gAMQlODusoVcYCN4MZz6XLh6He+IsxKeoTbcsZd4FyuXwdVRDfBwiXIO1hKM3ez
WOjVZQXR1YdkpXFB2XxsGwbykYiuPWa7d9ZrM4RXdLO4aEH7PFx5vv45NqLOKtCTgK2znmnj
sPI0R96+BsKRwZDrkrIDOtvmoyTWzyYI9cz+gEBwR6q/AIZXTbbFIvFkTp1dKo8DKlyla3FN
RVf+ZslkWT0b7OlVggAKJD10pxuIELZjdpDI795m8jRPZzzVlfT8xkQlDnyXnJPLKljrtYw6
yMYLL3q9tgFwuSyNiDRq2mCzr2KqnzcdLI6dxWKiC9ALh2qT5/MyS6kHF03GyctBqYs85oGC
LA9aWekf6eNwr39S5EJm3dALOs+O8Narv/4+VaRIQ22jFfbVXUXQtEuZDz8Q4dZDHuaapBEP
/aR1wwIZpoGfIFH91dmUj70JafzCJ9FdlrAadlW7e//7x/Xu374+vf3Xf9y9P/64/sddGP3K
xvHfJada3V5NlWqH+1qk4g5aOVkbGqzPu5vLQlu6034GUWroOggiCBaYnxuAZOVuNzEqUgE0
BNWKafS/scOGWxFlmxJZ2fF+NoAqJAltiJT/aQFRiFBqh2Tplv1lwNSVrpjhEkht7qwnzxm8
XePFR3u83MnKUMRM/crVC5CdgAHCn17JYXbFnqfSoim6vIrMWhYRNkW4uKH5EGgG7I6kVpbG
kGh4DY3vedApg0ZSE2tPEjkJQZVVebI+NUQxoOa6rplHp2nKbyXP6ZIR5doArlaQsG9bUsfH
SK+NtUOUfasE0UEmuZ5/sFZRRGhgnQMLvtTeKDVHOXC5+r7JaO2Jj3xdUtBjR272TeecqcFJ
NvN7MNbygNjKxBDKZ6IE3PfT/oEtXom5n1mK/MGMnX6bOt3t4Clyr5uSooiJEkCSXsB3DC9L
yN1pegf5u/Uo34/0I5OyI18RBI6zn35JGr0Ip7HFZCQ6TJTAAWx9FE1KcMAlCNab1RYFbOuS
RCEcbjFAmPtLZ4nXgQHWl8vFRA+WrIOMgLWhgDANSYQ3MeQuqnB6RBiLMzQwDavsSFFydmnw
rEUTZ+3lTB7w7IzTx42zcJwQxeSkZjtFZqU7i50VEwT3rmk0RtzFZf8ZcBfw/kPqdodC4igl
TXxoQVUDw6RhHRtaxshluAePEg4+BCPqlnLMIBrD6wiGKNnJCORIFCHi0RK8RcWlasNtgw8A
Byz9tvlIHMcwUICzYsLCXS1M/KEJFh6e/z4kgWcoH+iLwEJfG+jG3q5jOKkcDPQiBjkNpZfh
QTcr+k0hp2E72Rdow05mF/0eC4cmtt2kIf7FqAq8wLBogN6EbC8wl7AMzPTV2kLfmGsQ+Q4+
JThit3ZxxCltIOI4Su/uK3Zsc3Rr+NO08g802Gz8XC+1VjTun44yrepTHjFhQsiokigHiYoK
R3Lm3tuAoFxkqwl9YbUi7/LC0marhFsTqWEOV/xMxpoQOnVASfhmifySJokxJxUck5+wc7Ug
0xB0MlNEERcgZdjEiCjF6Wl1v1w4GyMgWKyUuwkh6YCacf7z+f3px/P1LzX4RdffbX68zJrd
pfM+wQawx/SOQy7yS6KKyMHP3a4Xv6qQGkQvRm0vANEdozRZpZyVngXQTGvfzgZNGNvNg3wD
KSSNfsyBeCDniaSskKt4Ryii/AL0uskCB7nsHOn620igs/PKOrjoPDkBlf0/kdT7poLc6Kz1
l1wqZtM660D31NrDwijkovw45BKljeU3KplQhBrC/si6M8XpQMi3aa5rUpRvVsjddg+h9Wa9
wDu7gwQ2CFvHax/t9B6yYRBdPXfZyl3o+WUPKUCiDMy1AKEWucPrEHlI14FnLqVmh33K317M
Iwwuheh8KrHDe5v7K8SwiSMKd41c+AN5G2eHVM/veO46Z3vREZ+ncUXLwg2CAF+goetszJ3w
iRxrwxrlXXAJXI/tuqa1DrgDyfLUPLj3TGQ6nxHjDgDtqf72ti+AnUp854LP9LTam6pJ07iu
SYuZ3wLklK0sayDcb1wLhNyHjuMg00rwNa+N5VV+Vi5n4Fd7iouoBK9GOZMkEVr3uDaIxHvD
hROjbvRP1pzS7hFWH5I62zjIkxPLujrobwJJ7fuI7xiWy1no63IOC2910c96yObovEupfZKr
ZpSkWa9CfzG7+Nfk7W8MlEvBpb4NLH3uB6Gn1WF+bFLVNIul0YkIJZESRRbrUzo3P1vGhjRE
GqnC2kDA2CMAoq3u4U7uBX7010847gmXqg2r/GX3QGEptzufK5dZ6TauG+SmuifyEMOg1aYX
/c5pksa6HUn5dnegV4Q8NjEWjt6TItD+WhhoLk5beSYapqOz3riOiYaWuXF93TO/0vr+DkG9
pM5CB07YFDPDGxGVzrpS/kJ1ZCeiVFXwqrLkkunmu5yxJlMXaXXjXlT+qssmDthqPsZXg7Um
I6MAF1ONsDh844b6fu2oEU69XC4Y8YzsyUDZ2BpGlT5kP9uNY5vdbEWSrdK6c2LNo1rhnR3X
2umNUrVz5ri+fisGEsLDGSlASchjjlyHTw8RUVr6KXJcx6nPlnz8NjkuCuWVdLQkPFPkaMqD
jgOL0VeZzMNCnp9er8/g7JgR5TPdXPDpznNKBukGjD9hTeo10mRzsSFPSqN5hdLvP36+oy/S
E7NA/nPydiDSkgS07jor2PGLnCYCZxxyoncfC5CcNHV6OSgK1IJySk8ki9JEkHiVj2/X12dQ
3n7q9UpV3XJRYnmkMeYOTUA+lg8TgEKOT0LDT+omzLZOZDjED9ty8tjXpzFJrfJ9ZOlPQDou
MEKaw1b/hXt2NkJOzAoGEdYkjOusLJio8wZQrwK96smAzA6HrU7DdACoNqZKMjdnj/WtbUKy
Wjp6pRUZFCwdS6eLuWdpRR5grg4VjGfB5OSy9nz9NdUIqmrGtcyYIj43yH3YgAHdKGCaesFh
gFVpEXO3Q2YYJTk9Iu/fI6gpz+RM9PenI+pYHBDNz7HybMHrvYqMo5u7bVMewz3m0HxAXhrr
90JSwZODGbRFfAWMQ9dAUN1Uf1Yav/UgjMMQd4ISAzNzL3D7rD8oCQh3MIY4+hMA6D0a1vHU
e4NakxTx81Tn6XKmY8HZ5f7x9atQ/f+tvOvVYrpcNK7VkwlPgD8RZWtBB9vlQy5rNvFkdg6o
qDsvriZ6nzFdYUJVjOU0gBgVbm5NxdShpQxSbc0AwecQyJFjtKQdyeO5sU8nNOi6f3Atp9vw
xf755+Pr4xdwNzdq3HZfa+TAhCc53LpQtRDGRyKSFZWRPUCX1tIsjiuFsj8PxG3K9W2ku84i
vWyCtmrUkEBdQHVI1h8UBZ3VLKRab/oZWGgMAdn7DZ9eX58en6Xrd2nUSCbb0qiEwPUX09nY
JUsh6bjf9rLQ6vRJGZyV7y8IWE2lZOKWWIYlcPLWhkCTQLOBUGomhwqRCUXdHknNPh3oqL39
lYAsdRAeUCNSN3GZnpMC3NbU+jBzEpBbEnc2H0jvNtwHY6138qXUW+s9UEYwTu8Gnk+OF32/
JDRD64EznuH7jRsEujNYByoTdj4mTVLWY8iRl++/Ql6G5hOTq2eO8vr0M8AtWRkLR3dsm2Kc
WRtHkjRvpt/o10ALr93Tq/Ip+AD+Y4ocU+/lGCYdeQ5ye6pA9Nt0B4HJCH6v8YarNiFS4nyR
9Nyoc6w0/RZlZz9ED65HhGGBPLwPCGeV0jUie/QDIjasjw0B1UFjT3dQG6x7za6oFUkQ/90d
mS2FNqtshXBUWiRZfLFB2a/4wvgdO1/s0pBxZb0WZN99Va13+jDh4JPhzsOmzmYv2h2xEBrD
EZkW3Z+w2x1mCADWX2y31Ey+/SnsXlLlL/LUUHcR1tWFaz3Lj/5SOm8D+9rUbRJLAqdiRaPb
FDpVRc26TituxV5EGaJ4CtEZBGqbYzEp8m2nuCDugxO9cwe20Ys4oUpf9IncUwOTfHLEq+UI
3JKlp3tLkRCCk+u/k3It+LrY6e+3RuDco9FI41b1lnqGbKiQw9MIusALVa1/JRtRo/XotMgO
OsSqGn/PJkgIRi36zmWMIXvAHFNw4uwFoXc2MRMgxd2JG2pulmQ3I+xHy49Gkwg3Lo+7Wyt+
ACFRKGQI/Y1RdYN/KPzz6YduX4RspN4KeZv7cYwLzCmy+MJMtUMDyJEn2B6RNeHSWyBhcjpM
FZKNv9RNYhXxl7JUe1JaABMwfqCO9RMP6Dze1U2l5NklrDI9qzUOgtyazgcQCNvqiJJsV25H
h4NQyHCIAW8n44iOU0p4c/gMvlAEj7/7t28vb+/Pf99dv32+fv16/Xr3W4f6lUlPX1il/l2Z
gDrewJPhNQ5xfsznJInAcw1OB7UeRDFIdDo43uNeI6ZWBhMyO1JpvQVNYJKwqJQU57EahUii
Tbe+Pq0VXhnS4iNuL8eHMqVIECdGLMqcRClyN8HoJX4vBWQ24Yc2oaD64OGLj6Z5gxgIAFkI
P7NrC3Be8PqdCQ0M8xvNYeI9fn38wTnaXA+LD0JawjvCETFJ47OhcleO/paUN6Pclk1y/PSp
LSniAg9gDSlpyxg7DkiLmZkkr235/qdYll2LpAUzbY3B9wu6IuU5xafrdFLxxM5CEB8vDgKn
Akc0kCuf88LRT40vPgEBfmKBzLY4qaVzA6TU08polfLqBaZeMx0LiSac10qiHKSNYSXhJTV/
fOsc/oOPmmf2z2g+VtykjIv5ejENyBdhecZ2ubTQnoUYceR/80T16CvS23tNgzslUrQmJm4p
0eERLkLtPyXcxQjae0v91bkYm55lohB00wciHGJMXx/V8dEpOofxTkWxpVjZyACyI7rrTgeE
HSiDlK4WyLUjIAzHViAXbcK4kamhlxQ5EzLiBRQ+cOqM9SrkTw/FfV61O2OnkHzub5IvHkkO
0d2NQM2Pc7YPWXufT90ClG/8Kr6SJu4+ILXJ4pV7Qe4rIBeye/OpODg5kbIg1yN7vf9q1d0u
+znnPUKbuKJ3X56frt/f33S9AhnDLAVPmAd+7tLWQULxC1MbaLqOhpr8AY72wO3kTKiDeF1f
nl++/Nf8tADRAR0/CFjpaiRkJb27VeUBosV+/v0RHBEJmzfu7wsNJ/j+wqp5vWN7Jdvyvz6B
9z8mB/DqvP0Lq0h7OCky14SaRk3gVsib4ByLPC5NgEno6S8YJ7i8nL4N9Rris24eGieOAVL3
pkUubwMAYP8aEwaHsQNhqI7YZE0ni47GtqrKXejfRAfIeYOpC/aQ8CEA1WL9auxBEdksVnq+
2EPgiXa9QlRzBxAT6jy60L8sD6CBzVN0V+mxZRhniC+THlIfgoVejOwR3FmeEcBmOmLXOkCa
PNFz5wFxcXzkBraHdP4ydEyrQ2hOXj2pd/014x414xxvj293P56+f3l/fdZ57cIgw3xl46BY
0HYJPIAGuATq/N77jiuZ06gqCn2WtL6fas2JOY8ONj9ecSeAmp4RFxPKVceQ1J6cSWq38IZb
EBEm/dvjjx/s1MsroBHxec718iLsTbA6CMFy8j3ZV2F8URrN6aYjs2jGXAqUydGZVNtZqUkD
f+kfMeRu0B6ABaA2jwZ6ihXU7Ky/AObUrNyl4Ul3LODkfBus6Poy6Ugmsa2cWTUrdoqsE+6S
v9RvrWLuzOS2ycwK5RdJnniBLpp9zyCEiTmQR2yj0TtqMMy14W6Gp17/+sG2XN0cJFGBOAjg
o37JVkuEt4rJQpc+wqDFoJ/b2U2VMjKghYO8M40A19A//EYOuX4YAYimVQdIAh8xNOKApkpD
N3AW2jHQ9LHgA0k073tlnUasWk5+Ps2mhHHf62rEuLqLGNlxxDkPNhu9/x9NzQbZ2zJbGMdy
VnpdoL7mnjPRg9UNuP5cKACh5wWIYZEYrpSWVC8ZiwVVE2c59e7VP0TNmyj0GOnW1vS8olMl
oK5QTWae+/T0+v6TSa7GPYDsdnW8I9j1nuBuaDAjUTMmXiIxlzhdd5WksrJc2y5t/UVAAUiJ
rp9//vEHRI35+f70zMT067x1NCur6kGw55aw48AD5khlqOmRThG9W3Dso2MhZ93VvfBDzP24
KjLOmIyLCVMQ/LPB3kxlcNaE7gYxipRxebPCtBllGLipydBJoiJvqyDfjKwosY/dCBNJZaKL
PV7H4KqX+xFXztkio0TV5AVfhDlWgqgGje+PTKbRB6PvIMeqyh40WXk6eleogHrPk+NVZOVz
TxdoxDIecAAnw5MaOIgBbWMmjGgxW9IwKfChDc/uArm87iERddcI61Qg5g9xiH7q9pBOAxVM
Usw4JCJj326MnjNeYaL35W/vXXD8YsSwHcdZL5bmBnGQi5yl+toyULBB/Eb2mKwK1u7aCEG5
zfgd3nrzdxpvhVh1jJBw6axc/Ym/B/XOGHkPLFe+/oFU6oH1erO2gBhPQ7TWewgbt6Xjm3ub
YxCzWBnj+ubuBsza0y8cCePfUB8/sNfH3yArUMZglpM9pj4EjrlVNN96Sz2kn9M7ctzFYidC
LuIHZJlFSYqEBuxBdeMvkAu0odrNZumbexogK3PTALI2T+1jSJ0Fcqs+9HO02Wx8vbDat+m4
8xzkJic5xlnXhXkeLByl5R1mth/whP5pbK96chC6g4/vTI7SSYODU9ho7Tn6WkuQ5S0Q/blt
hOTOAgmKrGL0y13F6I8iCsZDXoMkjLPWTw0Js3GXFq+6UcN60I5Z3oSx1ZlhkFtMBWPzBMwx
lrHYN7Ya3x8JBGs68rCcfjGL5jHFU89WLxqyg6ilD+gRQs8yGe/h+BFxlDBgL2mbkKL3uKNZ
UgOyCyMiK9vJlMnjZ09rLpW5trAqQ1KZhyxkf4BXvbCqkRfICbCiehvTHhdR7Dg/IhxbRydr
J1j4er0EGRO4CfIEPIB8b+0jbkd7TEOb+Aixmsy4Xboj24cmbs8EVAzLGnte7vGZ7wSIxqaE
cRc2zHqFeCiREDqFm4EsFGwK3TTap/uVg7glGTDUWyD3GD0EfIkHC9c819JGawvdkz+GS1dX
RX6m+GQsmUFqx7XMO+5hD9G+GzBchDBzJ4FZox6hpzire2nAIdKWijGPgcCYh4ALyogwLWNc
5PilYCzDzTH2vly6iAStYm6oM3KS6zEg9juWXQ4wyJlGhqwWK3O7OAi5tFQwK7PkApiNtT4e
O9BZ285AlnUuQMhocGJg75uVjf0LjHUYVivP2n2rlSUyAcfc1H+W9ZeH3vJU+6iZSI+qvIWl
aU24QiT1AVFR1wssEz6v12zn0J9RRlErRO07umWTr8xFZLlFbGIAawkWFpBbJGEGMC+SLEfO
oRLAVknEolwC2Cpp4+C5jTXnG1slQR3BPHc4BtNFUzDm9lZhsMZuNmTM0sIQirBhLM7cLsCs
LZOkw1j3XIZj9bZ+bx1gemoSZjMNKjHFVNwXsxnz6dK0h5oc4sLywRFoqT0AaU7qxlxgGYZt
FVg7jL8IIoJFlWMGGUPuxmfbnOlwU53zTvScEOS3/dnlQg+i2wZ5KR8RNWre1yHYYdI8uRjC
wrQZwvvLhlhaEaH5K1Eesz3avKDiPJw/+c0xrnMDxkPugyTMCm7izc3Kabhc57eBLCxQwLae
Zcem4d5fWRgPx3jm6xzaNHRtEYbZHuq4QRRYb5joOnBvwCC3fQOGdXlgmYxpQTDNNRli4UwA
8cwVZhDPta2MKvIdS+c04doi8ezz0CLJNXnlWHg2h5hnPYdYKptXWFAuGWKT8hgE0R6QIL5j
ru6pAUdSRsg58NZrz3wJApjA0aumyJjNLRj3Boy5VRxi5jwMkq0DHwueo6BWmBXAiGLMYm++
TBKgeK970AV3ujlRDLG7JHB6BT6JtEX3GIgCnoLTFH1jelgXPc+I4Yr78M6qf/3tYXEe17u4
AP8U3TM1Kz0jD21OPyym4EmIwT65TOZpfezcXQkhluKqPac01nWLDEzg0pC7UbA0f8wCehHg
vwu5X9NlEW/XJMvKENUd6PPhtdIAje0EAFihtKgpiozUN0sDnDRG8gtQHaXZKCUmdXw/p0Tx
SU8YJ8pReE/RNW6qrSnfBHCdrR6pBQmdZx1EBLd/fXn8+uXlG6i+v357fNY9E4G27tpxdGVI
iMDzlRXaB6vHPjB44gNNo6iUXL30KTPzyIFQlGfyUB517oIGjLBk5+GauyjpkeYTPIIgmAKw
0tianH9qprA7h+xrbjjRVnXclTTr5vPj+5c/v778cVe9Xt+fvl1ffr7f7V5YP3x/Uft6KHQs
DKYiXuDMKd3IUsukGcozzQ0jRmj2mRCdK4mbMGkRlWcz9FOa1mANqAN1EP4cUwULXzN5OG1L
iUwayu6NyAxlR2dtTrjAgpghxqoPC9JW9zzU1LxfROdIURrL2QQlrgPJs1lwpNtfPz++Xb+O
8yF8fP2qTAOGqUJDhSj44y8pTbcTNy9al8iskkQLB8Ksftwi6/ef37+AQc08pkHfwiSaLXVI
E/4Q9QIKp4dNsFn6SGg4AFBvjYhtQKY59tbWZ0Yuc8HHm6gdcsXK85PGDdYL3BaQg8AjdQtu
UULEPHZE7bMwQqJsJNw5nb9ZaN3vc7Kk+SuXDMY3F11a56JB+UZIl262xENwAiaHmPf4kLAl
4m+Qq0zercCTENVqyA9k30WfciSIqZIc4iNdJbjitO08VS9Pd2QsYAUnZ8i1ExB3pInBLI22
O8Syjvdc6Hig+Gdqeo8xDlDlrlydk1Eg7tMVO1HxkZh2QHpPV4hSPJAPcY5p3QM5CKociyAx
0vG1zukrRFluAAQr3P9iN/ucpY9cc3eA9VrvjmMgMwY/7RuRbhh/AQj01yAjADmwDYA1ooIz
AALEI30HCDYLY9uDDaKcM9CRG6GRHmBdxzX0Zh3HUlVuMCFu1rMscZG4DuaBCBAGa7r4E/en
otdc5yzOSD2lFUSJxxxDAaRoLojnCaAyoQ5x1s6IVZj4jMfgI0gf1qwTceZaN8sA0XgSZFSb
riM7hv2sDv3GD3QqaZx6CC6TfYQnqZ5+xuSJJwFOKPxm5WDzh8ahVkig6XK9uph3WZr7yE0S
px4eAsYVcP5Mm7zSHRXFkHRWV0qOrPI2hpUICruIM2ggN2mb5YZpQrIcCYsANjrOAlEq5QY8
C0SfSxARiyReKQ4wcDABQB7fBoCL6Jj27WY9Y9j9O4SPPPpLX8GmUW/FNB0xnh6sLO3fIL0n
AcyCxwDSh00YIUt10fQh6DVCWU/C5ILmnC0XnkEOZYDVYmkRVMFt/9ozY7Lc8w38pQk9P9gY
evg+vxjmV1aG+4LsiP5OiQuudfqpLIhxAHqMSYo658HSIKowsueYZawOYvmI5y+mpaiAzXQa
1OU+Z6L82gnUIFoqDXn+kEDsLHDJj/qbWBm2Ckx8swFZy0THbMnFmSZ0VwtzN97zALYgN+It
YmeSRTbvSC0GGw9+30ANblu4/Muj3ubOArwfGof2viAVE8VxDl7T/GisMAfMPiG7W8MO1aPx
U2e9JU+TIRE1PRoRIij0qcwasov1hXDTOeGxkx4xzyEjHK5d+a3rrRm6S/02PsUF8gIxgpn8
v8P494iCK4MA2T0kVOR7G/2Uk0CdtrANdvbWPvIaJqH4mdsC6ha+FdWd9C04gzMMBYQFI1BA
LrIxTkC2khJS+J6PmHNMYBOD3Rlo6uFupIhDruUbAnTyEVW9EZjSbIM94Cuolbt29LL7CAPB
EXmZnoBsI8eNwmxzhQtTtqpnYuO+AbVCrLRGFBzAfWSTV1DrGxaN0WZ9AgsQiy0FFqyWtmZy
FKKPpaIC5DCvojCD3QkK0e1TUO4CE88nMMzCZNpliBGOBAsrh8n81hZUPharRQYFARIaRQVZ
eXxe3a839lnRrDx7P+Cm0ioIOXVPQNaOYiD7PAWQbXPiIGtv4kaTKgi59BlB4O9iiVx/Sagk
uCBytQw6fooxN/AS7MT4v7XyHIXopE5QG/NuUp0ll8pjck2I67A9YqHfaWTdOinaChN+Ea9+
UtYDqzlSarPE5PIJyDZ14cpng9i0KKg1ogOugqwzrm5WWHApFYRcIyggTHVWBt27DqKoK6Py
k5VdsKJWayuvhg+6yGFlRFE3r8hCd8esYqjj6CcA9fNgjVi0Sqhs50OIRhvsIXAWyKWiggrc
pY31ctRab483opqK+g4WHVmBrVw7g+Iw+64gYMgFlwpjO5pt4RivyyYw56aWoq51JrCpgx2k
MOtQnVDHfCNG59CnB4X60E9hHOq8TPIYqy0jcrcWWOAiOfM0ryaf8Avz+vjjz6cvb3OvkaSK
2fm0jju343IMBcGFVXfzpzSKlQMDOV6ilFYZ0THqqJZd7LOjYJ6CW081QiekC8PsXBepEciH
nHb1U4uLanJWUypSpKEmqU3YOOzq8ljAK3rGTvyLv37n/82hWxIeJtAF/28O5fXWfU503odf
fr5dX3/RtTWq2pxCdLGKfWL3wOYTokAjdU8ZCRc2E6+VElA4FlUr1HsklV36Sek0zuKw06rS
UZvjEFSSislz/XrHEL271HEqQbZkC674ZE2tGRFCbnJtsQ+M76rtFIAsJtz5KGhYx9iU6FtV
7rT17rXteInT2TbBZHoVlxnwwy+/f/56/Z9fxqWo7xD1YxAwq2WLM2ohAvPUr7I8yGIZjRNd
nQIdlc0btuSASeCzZQIV0SFsX40grolujckA0A6NtbBdnEOELJRG9+AraKAOXvCu37+8fL2+
3r283v15ff7B/gUxCBTdHChChLlYL5A4ET2EphnmBq2HFJeqbSKy2QR65j/DTSV2yb0cVnle
e8KmxBgkTil/H2Wh/nGUM0mSpa2GqSqgQ8k4PtHWTP6wmum0Q4LFcCLjsijxGCGKk3Uf96Xd
Vboo2h1LjAd/w9HT24/nx7/vqsfv1+dZz3BoS7ZN+7DwFpfLYrXWC10SGKrAdi7GcBC/rRIW
XCJ8WiwY4839ym+LxvP9DT6nulzHsiWsOh+bAjlRjNhtGbfbhB26HoK8JR/1cpkK36dwe+Gu
N/iUGMHN3lk4+dZzjulusXBbN7D1D891YrnOx7wtMltjFXiW6aWyER5vt7s2aYI1IphJyCyN
SHuIPL9xkAewEZzE6SUt2gOrR5vm7pYg9ydKjgdQbk4eFuuFu4xSd0W8ha1LmSzSIj6lR1B2
ivCVISB8DNv9JfAwuw8t1nFtozeCERlzhKYQ0e3A/tp4iEqeBptusGAAWjCmfYSAV7YFKaMD
B9/TNGhXr7wioYuizNgGGH9ka7ewdXSPrhbrzafQhv5IIPBZ+zHaeCufTeu9bUJ/jOBVHhzy
ECewrlmObthEzuOFj51OVXi98jD1jBF42LN607ahWBRsCZoWu37vP0SLzTpCDEyldRKTCMYn
aw6s/L3nLFd6N+zaLKyd+8gJEIdFUhbwo54VTRzuW7aNYg4HpAy7NtsuPP/eujIBuVv6yD2y
gqPnpYc54B2BOdkVhLs3j3wvXsUk2KxsDDgnRZNCLCmSLPz1OUZM/sYMBTswFlmwWAb7DLms
lcHnU0qZaN4WJ2/hIzZUKB55jpXw5YnAgPKdFXnvQtDIJYYePRPLTOgV5hhfj16trWx5Arex
OQm+WSC3/CO6zNI8vsDkhn8WR7YT6jWwpSx1SmO+JMqGsJ5E3tD0GUB3YGPNQCP4n23IjesH
69b3kNfmMQv7k9ASjsOn08VZJAtvWVh5GXIbbM31EKVMYKnzFZNEbItAQgfuDTUa0Bs3tu1/
MtpDbtUldFlsy7beMlYfIY+oI7h37sn+8gPnlFiFUSnDytvU91Z+NbgPXcVsk1pAxqW7JpVr
Y/26jL4b/4MqNgXxvEuI3DHPM0Tb9fLmHsuizQLxTqdtg5cQ264yoiNnFd1edsT689ZOYeg1
If+k3nti2+NU9D+YECvv4+KCPJYgGfJ/UPXgHzS0TNjMsqLj9FC2S+98ShzEsmvE7kldtdk9
4261Qy/2WSvwdOGtT+vofDt+6TVOFt+OXy2am+qTNoyTMKmBNuv1P0RbR1RGBxu9xowEL4uH
loQXf+WTg+1kxcFNtPR8D4TYm9DHjIlTTX3MHoTYgCipSNnA7zbbfJkUu14k+ySNMHfN0mE1
0uu3y92SV9b7BvpQkAqMqUE8Z420wJuobJuM1fJM91be1lQMHC3coGHbuK0POvDSy5vYyn44
uNo5VvFNGoXNuj3fX3Y2KULIkuWF9cdqaZVsRzRsvRvbyWCAn5qoRv0EjvhzGsUgnNP2TF3M
jcIIZ2JYFTP2c6mqhe+H7lS7qLt+m1xwyRdh2zqNdvHsvQBuXXqKckeWfn+/vv7++OV6t319
+vrH/CIRal8WcZuGxQpTHBM4toRBMxPuUA2XL/2BjyUVeGhTfkXasK82Kxex9pIgvuHKIGO1
AmEpa4KN4+pD46g4VD9uAlvdDDte8DNN14QVpt7HSztF4G80MtzI5/GOiIlGm6i6gPHZLm63
gb84eW2Cn5GLczY8meGgS9VWTeEtjeenmkRxW9FgZbwaGlAGYWkQwGbhKWRQChwyDTDFM4FJ
NwtE+66nYx7EBB04cLd0UFSzTwu4Ng1XHhspZ2EQZZuS7tMtETr4a0TtUwO8uURcppwAcbFM
BSJ+yDiQzZqsCr2lYbkzDJuPDqIo1SOSCvPI3CFosfLZbEAcp01A+OEXvlVFjktN2zPEKil3
TBohxQVuvG4CrjGF4BlwhZj2cWYAMbij09o3MdqooMbVygH5PqoCfznpisn+MWf+akknT7m7
kSnhcvp8yJLEC57p4TBmZ7BTigt4EAisPaQ14ktasNZZvC+1s+uw2ul1/oG8yx336FnPgIIn
bnXGQSNjiNRQZ6BLxhtxCTx/rb/26jFwwewgO5uMcZHZImOw63UZs0RWRY/JUybmeff6C+8e
VMcVKHMYMeJckcd5WeufFgdgs8Y0kCXI2vNxCaHKMPe1fKKkuVFWTOqSGi/4m71BOmnSiOK3
U7sjfutJacQER5xbcG83J/zLjFqrFdNdvcVFw/Uj2vtjWh9oL/clr4/frneff/7+O8S0Ht6O
uxISJfhfsm2Pp5jqO5ER40TPhBgJ3LngweUZgDoRN5FH6TkNj4jZEtQLeSxmpHTLuv/SLDHf
tAzSGcxg5DyG42iZ63d8qBwfQZ3rbkbsjGPHhKJs0kSJPtSraXClDX0pUXxKQ7Uc+kBZziyr
mdg8I4Rl9cBKJDMCWwS7eJulzWRkQVsp3RVtXEQpKfSVYPlBpSIpK6qUG8UJm4Nx1MoBOSE9
J6MKBjWQhhKm1cWyqyR9dlBekjLLjYV3e+iDqZ+wYUfULgvhmOnxy389P/3x5/vd/7oDlYrO
zkujWweX6WFGKO0GT9OnoPeVpbt9owAV9y0D4tBELnKcV0GYDrKM+hQE6qvQDCMUqzWZufHf
mW12lo+QCIwCsAhUCgrxOzKiwIIV8eiogFYeojQ9QencbEgQJin5F33r88rzFhu9tDGi0LBO
0kdOvrtYZ/o7nxG2jVYO4htC6sQ6vISFXkSSvjgdst4TmHlGDwFuIh6BQ8zwl+9vL8/Xu6+d
4CisHOeqntExz/nRnpaZfAkhJ4PG4zEv6IdgoafX5Zl+cP1hZdeMc2yPCVvxUsnj6p6TWcvZ
YRiuCMM4i2u+DeoYnCanCInVVjVjm/WD7Tt12cwKN2YYGGdDDjFoKWoHyNLbEscpd6W2hJky
7kREho7R9AgFjVRJPXfyg/tnq9WkKsxnCW2cRfPENA43fqCms10hLnZwep6V85HIEeb7lDYt
qiOoSyoal0AtKQWdUF2rugr0tVeydT7jkGzRQ0HAGVKeFqWiuFxwNyttSOqIfvBcOb1TkG7L
LGpJlU46oi7DNpmUdAJfJjTmxCktbDIeFZuNdXk4VtPqz+yHFSpkFh12IqAahc5VAB9nHaGQ
uzCLBkRUp6AkJ9M589hHv5KfX59e5AjhQ5rc1n1EwN0e19xlJ6xP8YfVclIJLHII1F/rJ43n
KkO1U1nCELN6OgXV75VwHse/yek5eEDT83XAdPRWJOEw7ltsEndaovde6eCTqUunNWVk7heP
kdozO0U3mWmkYspEPy6BMvxswOhLeMdH5+73l1cmGl2vb18eGT8KqyOcFbod4du3l+8S9OUH
mMG/abL8p+IMseu1hIKqZI34YpdAlJi7nxd0ZHsV4t1ZLgpznS5jqihFPONKqPiWWjHGwcR1
K+wSIme9HpTmF97C40XL642jNS8t3J+86agrIJhB+3TlOosbJkf28vL9jzc2Ebq5gdRKhema
iC8MoOfNod024YnqTks9iEYhYQdPYHKqc+IBUCZgDZHFp3jugJU2+dOX15fr8/XL++vLd9g8
WZLn3sGSfOQtkWX+vpm355rXp3PGaRoMCcamAEStKuucBzC8JYt9Ml+apNqRaRWmowO3koL7
DgIhf4zQhTLsuWK4WRueLEbmSo6Ot8ad9cyApi1AAiIet2UQ9oqtglbObXUD4C11W2OxKxWQ
4wTtXv9qM8NZq3dYOljkDgmC+awfIR4Wk2SELJGLfgniY9F+RsgKcwMvQxCH/xIEifs7QnwP
uYCUIL6tRVnorxDdvwFzDtZYaIEREniYE3gJg8b9kjALJMizUh0sOo9SH3MfbyM3sDV927Q0
RAIpyjuSnVWE1PMzxIRTxZhrJDDmOSgw5tEQGPP84ZilnTH0ONtSFjj/xvIM0YFknL+6GWf/
LjimtY0Rw/i3tBVwt5RlGwOGsewHHINFZVIwtnmzRANSSRAsVp4EwaKMyZDb+nB9y/RbupeL
fSdhOA+NjSlhsHhbMsTMWkLqe5n1S75ncFw2wC7uAvPA02MisnYte0408Wc7IYuXT2BiOskz
pmvM/4EEQeOUDZAAc5WiQMzrASAWps0hN5RinzEdzDYBd02+skhj+6kp4lRI5bPKsj+kURNA
JCjzUOTksmGbqHnDFiDLLspBno8YGCoo3yKicRCi3qFgNlggKOVrWExKpeJr3MW4Crylr2wS
RwcyTzvRC5aCaB5snFV7DqM2Sndpg7z09fgqzJ2VRWQCzDrYWLuD4zZ2ptTjbAsDcMHqtvIA
d0N53mKFe2mc4m4pj3Ue7utzBryhRB9M2Owg969bvspxN3x0hcaW7zHx1l0iplU9pj4EiF/d
AdH4KwuDBgjix0qGWKoLEMQP0AjZYI6mR8g9w5hXN901GWpBOICEJh1hf6ZJarm+6MCzG68p
LCdMGjFvZQJjHhP7NQmtw6XJn/+AozkeRFDC+JbDNmBWC/tlR4+7oV6ejwV9HDFL37LB0IZ4
FlEKIFjougGSthTxnN1jGkJd3yL9cwyiQyljMPVJBWMRuDkGi6qrYOxSOcOhHrxlzNoxdzXH
WBYwYIKFr1ejlUCrJaK1OmCYjLy0XLo0CdkE6xswiPfpAZOdPHdBohDVEJog09C1iyoy1raw
Bqzn3FoDtjCWt9eBo2+vhZ31yNgby43Ci2PZRRrqEddd6zWhRpA4QNpBlqu/Y8SYtUU45xjL
FcM5DzDDYBliOQVxiLkyALEwBQbBYh/JEMseCxDPzlk6mG38OczM6QFiOY4CxMLpOcTayzbe
yyFmdgmQwDopgoV9hXawG7pwYxE9OMQ6fzaWFQgQy4GHQ6xjtbHslADBwtLKEOtE3WCh4zvI
p8xDXYbK5zzMjeWAAd+q5mYbHLkqEMvxtVlhroZ7SEGOgWcRsADjW0YbMIGFdXEMFm5XwZgH
XGDMI140FTtLm7sHMIHlsrypCFjLIabDPSqrQCnyTAkb/xAJCadiT7dD68vN0EYL7bWzlKfP
SRHi4BJigYkAI95xdzWp9v8MiPcdRMBtwzIHQ71Cr9IOMOFFSyZ3xH0a9WpLo6IMS5SvMgGz
5S/PD0yAr+Ni1+y1X2LAmpw1XzmKEqXyOh2cwfnfj+uXp8fnO0bSPS1DDrIEhxLYd0Gx7cg9
OhgQNXKq5NQKM7gdqKn+6Mrp9Kg/1HDiETSbUPI2zg6I0YsgN2XVJvpTKgeku21cmBDhHlxe
GMgp+2WglzUlhsaH5RGLCQNktp5IluHFV3UZpYf4Ae/AkPsfxcmse5sU4odsFxiX5biHqo4R
yw2gs8m7KwtwXYJC4pyaOjrOCD6Q4AoTiTApyHr+xGnC+Binf2L9h1J3cb5NEW7D6UmNV2uX
lXVaGmb3vsyaWB/2m+cv2eji55IOsmOskzYEvMwauveUnkiG6OTxgppV4OETkfWRmUMcHvCR
PzzQEnHzBeRjyI3TUPqZZGwZG1oWn7kzGxxRh/pdAIiXlJRIGBTeLw9zTWgFkEJUXpza4LSP
ZIuEGgVqc06LvWFJHOKCpmw7MVQtC7lRFE5HrBMErShP+KrK4oYe4kadEDKdjSjsOerO1afC
j0rRyh0oyBQGen3Mt1lckcg1oXbsaGCin/dxnBk5UU7YbMzZusWHLmdTsjb0fE4ekoxQfLmA
4fm5rLPIVJE6FmwVLyVl4hYEysYRZcFkDwODy49Zk5qXdgGxo4oInwxFg6+foqkR9V2glrWJ
/1VgTBjXjIvi87SKCzZUiPgmAA3JHgpceqnYDo55feV0tjFxRyshzsjBNwM1WDVwzAXR2+VD
TT4ZFio3rMBbUIPlnYEJ1WUYEryHmIBiGoXOrQBOj3Nz/nSXEz5TcYhJhKJVHEcQSQtHNDHB
d2FGZQueScyIWaUQ44sqM2zUtWmHAC9ohBqELJqTuvlYPhg/waQwvIPY/kdjA7dmdCT2G6fu
2UaBd1Czr4+0yQnF9GP5Jg3Hk7ai+ssbjnATNofxNpyJSYQ7p2leGjZLthueZ2aIyjbO+ABK
hYoZe//TQwRHV3z1UrbdQlyto94XCj+rZBX+gTysXMyj3UCfXk/06tKaE56wEUmjX7dVolOx
npI4DYw9oJCZBRoj6E6uVaqfch184rx8+Pb0M/1XQCN68pUuqS31u+BIxs8HEkYIzLpDNKtw
uQ/TFqxZmbwszHdH4QTos6M8JLIpm6sBciE1A1u0yb4mkY9ZlbbbI50WVRR9WDcpmdQgDxHa
7sNIoUw/SoqCbXRhDJ4/OxPYuZ1B/vT25fr8/Pj9+vLzjQ9EZ2GijnXvYR+MflPaTD+VsC+k
RdrwnQXjm7wcxdIL6/hmN/0AS+Jn12PYZCniTqDHRSklWxizC+NPBcnQNdhnSKiezXQjR/nQ
7WII6bidBuWQ+/vYlPTIdp8CTH/YBv/B1XUhg+3ZMe+TcBsA1tQfHPWbucpWxpX48vYOVovv
ry/Pz2BAPb+84fNmtb4sFjA90FZdYGqbALENUF6OrrPYV0ZQSivHWV2MGCaneEvXMX/MVhua
BY65iDogqxX4NjOBGE1c8uUT6WgYAmGzfhc+P7696S7P+DxA3JADjQlmRaO1gwTqOcqnE79R
A7/zbxVs3/vPO97upmQCf3z39fqDsdK3OzAVC2l69/nn+902O8Cqb2l09+3x77vH57eXu8/X
u+/X69fr1//NSrsqReyvzz+4EdG3l9fr3dP3319UDtDhpvXrkg0WkjIK7uYw0U8pjTQkIfiq
7XEJE6UwIUHGpTTC9lIZxv6NiL0yikZRjVjNT2FIsEkZ9vGYV3Rf2j9LMnJElDNlWFnE+OlM
Bh5IjThukVHdPV7LBiS0j0dcsE7crlz1vVLe6cjgIgWWU/rt8Y+n73/oomtw3hCFgWHY+BnB
MJ3SeYjj4ctffz4+//rt5ev17svIUJEFzT09aQM5yZXhDCRCjmx8AziHHtItjOSquzyktPuS
b7Ui8NPj1z+u779FUO9XMFvnlX+9/vfPp9er2LkFpJei7t75er9+f/z8fP06bRMv37xoOaSp
wRw8TymN4diFhDbqmf1afb8bepvXZ+xdeeawc5ZqRjim9vb8+LQTsO59wwYz+PmUUCStQxAf
rLj64DmIiqEEMzw4yA3dY8r8Eui8Z8fmfWziUAII2ridVwbjlO0/XrGdXH9ZIKM6RpDrXykl
ZJxXMSbpdpCkiVI2HiUy7qeUIi6hJFBakXsrxlpKHO1u6qQe1yJXV3LjAsdFFORVlO9Ze33H
mLR9+qSV3oZRhhz1vtokCDwLVaRoK9Muo0CtsAwxBZcx5RY8TIbWEcjDpj3e0LHcrZQVVNI1
ptM3gQXIK5cMuxxvmUMFOeVaH1ASpspcb+Eh66Js0lWAaFFIsPuQII+vMuhIMjisWrlmFVbB
xSDHdDCSWFkmTeO6Jue0ZowJeRqU0Q/5ttS/5Eoo+3IMH7ZxDU5NbEBh025F5UXKRKxbCgvt
pV3gmqjNrcWdU7rfMtHO2mn0iAUTlse+sa6iYxWtg2SxRozD5CZYeexMzBjkAvX2ARG/4jxF
dKo6KmJDxc9i0bExroUTjXEJKIt3ZYO+iHGE4TTZ75jhwzpEXFAKGLxZ4OswjfCnJd5EUJcw
BZnjgDZPUu7hBoIIIk52eYPw9jBRsAjjU7qtCeZPmte3PJO6Tg0IOGIbbh4gMiY/hSfpBQKa
GiROcMCFeF0GwAPLjQ9+/An+TC743Noft/C36zsXndMbDqFpCP/w/DnX7mnLFaKfyDs8LQ4t
G7q4NvcLG7eSTjQP5CuSYltCHKuJy6YJCX776+VSuxirP/9+e/ry+HyXPf6tPwwVZSWuj8IY
cS7bHwQ8xMyQnwGzqX6CdA2MVEItYUeYNIb4UH2oYp0BKWSrwTcYPaeN/Myc55LXoupc0/ie
8RRNojg+KBnbLURw1ST1nqw8d6wZBTWzI0HEBMg6HX9xQZuHv9HoN8h9ywUglDPjtxKNyZPs
LyVsLyRzbyqsinmu6zyOiPZhqjaVJ7H1zs8alCquu0Z6lTVJPvseJ5UJqw+hiCCp4ho1FpAO
ww6sOd2H+m+B1kUR6pnJiErgb2TPG1F5mm1jctRdBEv9An7GJh1SzTo+0nMvIJ2OWw/Zy4F8
ZE01EKN9umITXncRA4Dwfj+fBXt6j8D/H2nX1tw2rqT/iipPM1WTM7ra0kMeKJKSuObNJCXL
fmFpbMXRjmO5ZPmcyf767QYIEgC7KW9tTU0SoT/ijgYa6EvlFsv+ICroU1XTC/MMxqSgb44a
1NaPOZdpbh6U60XOXdtGPmQfkGGU8dkDr++bMRCX+cIlKJVWCg0MkiKUHmQIaV0HBQHzDDeh
GDf61R1y6XhpvruK1YmaMwRDFTk48ag/nDBhuyTibtjvM4YfNYAxrJeVRLdljO1DA2AkC9kP
Wb8/GA8G9EYmIH44mAz7I85EUWDQ4yizvBo6vSErOudvpqbPGNM5AUA9dMYgRdBT15lZNdDJ
1XOcVWg6mo07OgbpjI1dRZ90ji7QJ9tt9bTYBWMdwzZNm3SUg4Ar5k6iBsy6cvAcdzAc533T
NMHIwvR/K9Iyf4lRxpkTo5yf3vCqfxVt6FOHgkwZn0+yezDWYMfIF65zNWFMWCUgdCczzk6t
nr2Tf3h6kI8Gi3A0YOzydIxl52UxEfFQ89fL4fXv3wa/i3NTtpz3KvW8j1eMZE3oAPR+a5Q7
fm+xoTmeRKkg7YKa3+eu+a4tl1O4zRgBStBBcOkY1Ryfve8ZJY5mPV+3emLxsnv/0dvBsbE4
nh5/dLNXpxgMGacIEpADT5l0sF/0/gxcpbuWfcaKtOY6XUszQz/q9B1LRZ9ydsWyI5fRiLMx
rIbv2locop/UrOH6bpkl61Tb/br7iAsBIwCxm7IOvBRnYEqqJ39xOjw/G08I+vO8vamrV3vL
na5BS2DjXiUFQ135cFyHkx5Hr51AM3Q3XTMUxy2CTVDcM2RT68MgKTUCsRhFzxzezvjE8947
y+5peEC8P38/vJwxmv3x9fvhufcb9uJ5d3ren3+nO1FI+TmGNeDa5EBvOgwxdeLAZWixX0jh
lP4QTV5ibgSL+xbnUTTpeNffQI0JL5qHn28ve26KS7ElmGMwavrqJIA/42DuxJRDTB92O00J
qP4I0wl4Vrgg7M+bJmKCdRjFpJVbJMBtyUTlyf7L6fzY/6IDgFgkK9f8qkq0vqorihBOVkRa
vIHTtZplkNA7qEA22gpEYBAXCyxsYdVapJtiUJ1sXVTo6eU68Evby7RZ62xDS8todoo1JUZb
fefM55MHn9FLbEB+8kC/8TeQ7ZR5NlMQL2edYugQxhxUg1zZEeosyOo+mk6YO0aFiZzt1Yw5
m2uY0WDEGBlqoOvrK8axggLFbjHqD6b0slKg7GbKBLKtEfnEHV1ofJCHg+GFfCSGsdS0QN0N
2wKku39Sd8EavRuY/oURE6DRZ0CfwTB+9+pRHQ8KxsZeQea3oyEt79drMs2vJrPu6ZyDhDdj
4kkozCJiHeDVMwNWH2PBq0G4wEUaZML4pNILYqJDKYgfgQTfvc6zDUAuzHWAMLJvA5lOGXP4
unsZJyQ13RuO+xPGRLIBAd8yaiu30zS4xF1xGjFSlgG5yPJGjCxnQLqHBSHj7roIyGUOzYgP
BmtldEHqoZtxjpCbiTa+OBeRHY67p5Hk892dBwxhOLjAoiI3vZ5RcrzYqtu+qnFyoET2iS3Y
y0fcQ75Zw0+sqRljqtf06pUV/lbUKH3ZnUGI/nm5qoPhha0OIFwgQR3COOjQd/nppFw4UcDY
72rIa+YOrIHAIr+wxJzZpf2HCzxWc4niZnBdMJHHm9U+LS50IEIunTkAwvipqCE5Ope7MBnS
iXthFSZp4dMXEgrxcB/fRmlrRh1fv4K8d2k+pWF/RN3J6/SBfTBGQtf7Rb1tFvCvS7si3kXM
Liysa+v9ThmP9PL96/vxdKmRyyT0FkFO2Xp6kVOZIhiBLetURlkAAO0wepBYyqAiWgwkSKvi
zonL+NgPc5OaLPSSUR85c2DyLD1GG9aJ5g4Oy5SyE8EMibcR7650tgFS6ScaEdyCKxCJtxwx
EMGfAyAz3tYiOKImWbmhrrDTcDTqY630ulZBDLgCK/L2Al0uiku5KFTKd7bHt12ESFth28to
yejMNBiSDAPDDkoOsqr1XT333JfD/vVs3h7k97GLPkzYsiKHlFEhfb5etO1sRH6LwIy7ld+J
dLKAdZUTUziQyijZ+FVkxC4YrwhcAXI/XGBjmFCcErTyHcagTeWCVwToe8DORwXMNXtGaykT
922z4AjAAqhISRoZ361jd5VoV4My2f5dRn68biXOMX6SeSNeUcSNFF9oFJlPSFpy6UZouOpT
1lo2nh+yjZc6VPGoTa7a0oBFKqfQJqloM55XJnBV0LfWpBbxWd6P38+91a+3/enrpvf8sX8/
U5aGl6BN8cvMv58zRpiwzn3TPYVaMYUDW4JhQVYllbxrEwxeuaAGDZg79LjnJ2a8URUmauOu
glttbuDP0jXuOdElULNFUN/D2Jsq8MAtcf/AOKQLen4v04B+U6e23qbPVhn0GhqfFxjghunY
hzhwL2AiPwydONnWMJqhrrOF4zLlKS6aRVfjGlE2Z4OKvnKAgbnhTTsFY5iljj4o8oG0QktW
/XJ8/Ft/M4Pietn++/60f33c957274fnV4OrY8aBy+hhITFPW47DlMeqzxXWZBdGN/3xlBGE
msZ0X7iZuNmY8QqnwVq3bm1I7kYB1a9AMFVYdFIw4YwYLBTjTc5EMZoGJoh5dTdBjNtDDeR6
rn/dv9i/CJsxV0E6LB/2+/2SiVWn120YpTkjOWowPEnC30uffvvXkFu0hOkeWev9XZ8W+Qyk
7oCWMMweHXKv4Bps49LCpQG52Jcbl5ZUNMjcux5ML9dnEWx9T+yyVAdhPsCSrweD0tuk2tSv
CAbzFr3l5OkcPX2Z66E6525c2tpCH6sQcPCPu4eMelxa3eVpEFfqhRovy48fJ2Qmti2VeOSU
so2RkmbJ3DeqnmeuOoM0PFhalVsvpWZ66W8K9EjnRCwiScLyLslunMyMcCrEnSxzijXA+/3p
ZKr15irIodPgRw0ZXA364j+jINgmFAAymA1NalUD4M79sRgQgylbvVZrtjlBOE+2ZkbRyjgg
VUmWQNUmU6Z99bZm5Qly2LBfRlA0nWclk1p06+gQyZo3e7JsTOtdTAmOMPXW8OdGe7uVaUb0
VJnUvGpK28P96/50eOwJYi/dPe/Fi3Mvt91CqELKdFmgEZ2db0NBF5CGoEMCarmjo0H1BzAU
m+u8M08J+T/l6jnV666K+XuhL+zSxTl9QR19FF2+56NUC8srcIt2C3RM6Dwwb9UGFB1sFnDc
Wy+pW5hkIeH2+FhXAyJxQSte4sTPsQu6iNayaElKiZWBfGne/zye92+n4yN5x+Sj2xd8VCYP
YcTHMtO3n+/PZH5plFfXBkuhiw8J9OWYALadezZFG0Vox2Bkhmj11GppDo34Lf/1ft7/7CWv
PffH4e333jsqbn2HGdZodwuw8/Pl+AzJGPJTb0dVOkUW9PnpuHt6PP7kPiTp0s/ANv2zCXR6
ezwFt61M1LXLOnDd6jKOvdTKXLtrqypcKkiU9P3jvw/n9w+uGRRZqsf8K9pyH7VogugLk+le
eDjvJXX+cXhBfZp6aCh9qaDwt8K5LSQUWRK2IgNXZX4+9ybzu9SNxpM+Zt+aRLcfuxcYPnZ8
Sbo+O13LiE58vD28HF7/4fKkqLXzoU9NavkIE/W848/d4bU1yQ1Ka45rVH3nRqkFPdQsSi+B
3TA293VJRWsuhpy2yOb6MepkbcbiQ03LpTkd1qT2gtObUc9UuuU2yRx5+huSrIhEF6ZC/F5k
/q1qevWztzzCmL0e9fNmRSqXyUa5Y05iz4+c2HDXpMNwZDCsLveKYWCx03KQ9Kk7dw2H+qV5
6rj6C4CeDeyCwca320PYzTSNl7pkRLn+tnAbrTv/n/Pj8VU5hCFylHBgfA4I5bQIWkFQ26+L
HrrT4XjYv9rSd1cVCnV3RozDkQqSFvFkwMQSqCBZMZ1djzoLyqPJpE89L1R0YaFlKDBGsGdn
9/apOg0H18MySiP6djsgJTVLfkWlUf4mFKky4HvhUgZ8SCdebzAZBCU2S9zLFgV9SkA6O55I
FEr2zCUN0k3WQa8UxElJs8W3g+y29wgst+2yDSjuKkhNrrfU1TWrBJxJZZx9G9jpm1Ebi1HO
C+2+DkopozyoNB01kQYEcEorsrIPKsMhfmpoeTrx7OpqWyYBPT9UWO+4oPJN4dgeCA9bwHak
Hm7N+1p9pE26FN2dWHfO9ckTLVOb3V1j94JiznmZZl4TGCTzjq1KUzaG2nFXmMMGlQI+fTJV
mCLNR5ZOotxnV/cgn/z1LjblZkZUflNKIBvTf3Vfuk4sNYHR0pNR4UccnNyQq4yGw7ZyOZaq
LA/wOrTe994q3QuDXeJF+00SO8LgFvMmD0+fyNNuiHg2L4skyzin/TrOa5XMgMqMFt51nHR4
cBnmhIwrT0SlW6ccTuNImBNfRmH3sSi1pmDX9JjnJYRFTpquktgvIy+6umJ0RhGYuH6YFJey
E8KVNIj+DKajlZVr2e5GFkAdDJlLenMpaB/igcN16DvbyNw95Ozen3C+7fBq/+fx9XCG2ag/
dml80kUr2A5J2XXpdS1oEU+LqecvsbPqkr0mi7cJkLAZ2Ruzl6/t+up5pX6Vj1nRBNgQ2kIg
UV4Kovq5H7Wbroaiowe1g7Q6cDmvT6fjwXBkBYfNLBFRGeDomQHzpu8E1Je6sDaPN17AeD/x
HOreTWnD6z9tpXeZGDr3ybqoKx7ufh0/zr3i15vp4UwHl3k4nJablL5rMZBJHPgYWoyrosKt
y3kCa9OPN/reZ1TG/C7TtP1Xd73zafeIvtmISZ0zhx+pnGIHLFEOZttZatcD6ZJThqEmeeFr
B36hsaVPR5EAlcl9d535ZZg4XhlEzpISJoTFEey5W7Gfy6fsj5fz4e1l/w/tBCFab0vHW17P
mOCpFT0fjMlXNiRbp2NIqZUC1Bs5UQdNTktMZ/h5wNwk52EQ0YcZ4YYS/h375oWji77RmQ0/
Sph30dR3GXfXjG2f623tQ1ajBGJKVNLe7/Cy70mercugruOufHxx8CpbHkOzwQkDzyl8mEJ4
GsxJr5tAC0Da107FUkFF9+owXy8W0hhMe9KQahClF2TQgaWp0QFy0LBkPOUBbVSS18FAGZc6
MxEJIOCWIDWLPC0StivJA5htbmgVL4hi+nOWTQLEGf/819wb6jnibxYMJUVzMRLGJ5DMdMGW
Jy0XOdtzidtBnBdZK1fF3IJQfqhXbzHkKyEbw2Vn9XrdnfheYpah0iqXIElKZhfgUwfQLZWV
BSrcuCA3sD6pAAEnc2t8a5rU+dJuReyEQCaIGxRt9js1rimoSqvWGApU6A8S6kU16HadFMYj
gkhADSNxuy74DmqFkG2SWF6gv11ERbmhX8wljbqXELm6hTZc6KpZDLDWcrHStAQXEgg9LXpS
4Mfak4u2OcEYwYZsTb8mFWN2SB7iBRSDopBOeOfcQ+1BCk3umGzxRETvCRpoC5NA9MUlYORD
ByYpzUo0HK286+4ef+h6uzAXFjllOVkR2vqBBp2fHotcLF1yW6kqISvkfc2S6E9v44mdpdlY
mpNMnoCg1OdYxNpbtEiqHDpvef+Y5H8unOJPf4t/gjRqll6vt8KYiFEO3xkpGxuCv9XLHwbO
S9FT83h0TdGDBF2A5X7x7cvh/TidTmZfB18o4LpYTE1+JoulhwZGxt7YDCLXX519IiWt9/3H
07H3neorfAc0ekIk3JjKeiJtE1WJzamlSa70zkpvbSr260i8gNF5iEjEjkZ/7UFhuoYRRHcV
hF7mUx4fb/ws1qttyRFFlLZ+UtuOJGydojBKl8mwuD2f0RKXCMEYSTEPpTe5PvNytV4C857r
FeKTRI8QqZEn+0o+qucwA+WGp5eIQQ2WwdKJi8C18pF/WSzbXwQbJ1OsVUmV7dlSL6QglwrW
UjA1OXKGjnv4Q4HjddAWPM0XezhHXfEfAgkDkLCHlI66zjuqw5PczInIzS2/XTv5ypitVYo8
vbTOfiZZblod+cLiw6CaJUYnC+mM3FUilqcEzu/LVgin1hcAFKVfzttECoGQFqa6vqiumbuq
pJapnf5g3ZXXhPCBiRrbAJgwq3WRD10VesgLjyx4LCIHzIWy3wMTlFxh/Wjue55P6bA18yBz
lpEfF3KqiEy/jbSTVYdEEAUxMD1OJIg61k/K027j7biTesVTM6JQxfTRDb6+74jf9X56g/oj
6O4m/zboD8d9C4ZzKbNk2JrE+0GvIKicwlapzHSlvSrtIYnbdZ3rmtZNGv6PSu1fvhA00S4x
pldjgoyvSZnv5En8TfeGeJ9v2NNVB//KElbO8wvUPbQYvCJaWwf+3gyt38ZFqEzB7ZYqC4lj
8/P8Tr9GkIhy0ErRCk1jxSPllZ1NCeFMRFFV3qV4LcKFJWPJYFhVqbrw5e/96XX/8q/j6fmL
1ST8LgqW7SCVJkhdHkDhc187cWR4pxib0ozsXOLordFRQFJ3JqTcqEB4MvJDBJkNVlF91l7a
jryk+hYnGgbXW9v1o9gT9AEaJ4AMnegXOyCL2z9bY11HebLLz+GEsfLDVJep83Wcpa79u1zq
jl+qNHQoVFkttmjm/IIUGCLMpLzJ5hOWgLcI6BM1Lx34H85dg09A0cdPGAbO53M1rouqCvNy
muunK/YYEjCEPBIOpbnXSBB7HP6AxvCMWWoJ5iKhOWmTuUkMdbumZoNucgo/1A5ACVxIVhJb
CRKbMW912vWI1oQ3Qde0YoEBmjIaIBaIfmCzQJ8q7hMV5xwXWiD65scCfabijOW7BaKPXxbo
M11wRduWWCDavt0AzUafyGn2mQGeMXZHJmj8iTpNGf9FCAryBCd8SfsIMLIZDD9TbUDxk8DJ
3YB6LtJrMrBXmCLw3aEQ/JxRiMsdwc8WheAHWCH49aQQ/KjV3XC5MYwFlgHhm3OTBNOSZtU1
mX4SR3LkuHjSZjxDK4Tro7vAC5C48NdMQJAalCVwHLpU2H0WwKbYXdzS8S9CMp8JWaUQIOqG
lsu5NiZeB/RjnNF9lxpVrLMbzloUMXgHSBK9kIlYEAeuFTyvogRJeXer39QYj3pSH37/+HE6
nH+1beMx4Iy+cPE3HPZu1xgngD95VuEqUfSEL/DKibkxqbKk78ow2q3v8YDqoYaANLUtvVWZ
QHXEsdtoSn3S9iI/F8pcwgqEu4bEl/r6ASBz2zeaCBCUMsXgXUzHKGScSDAlvlcVoyrLndFU
WyphrBuUOraqQIVYOZnnx9Cf+DjFvjtAvcWzVJ6sM6aZIsS2K7LBkI7yZN5dqTziQsXUkCKJ
knvm5kVhnDR1oMwLhaFqQsrEd6pB9w7jYKKps7NAFUAm+K5WGsgyyV1chkzAU03oiz1Ekyh8
wluyD8sB2jFJxQt0EJVk9fpBdRRimqnrkWYdOLoL0Tz69uVl9/qEdnx/4B9Px/+8/vFr93MH
v3ZPb4fXP9533/eQ4eHpj7/evn+RrORGCMC9H7vT0/4VdU4aliKVPPY/j6dfvcPr4XzYvRz+
Z4fUht+4rriNxrexEu+YRXDblpNSEoWho0GQMwzTOZy+tESiUD2ARclY0WgYJwxVhShmawLJ
spIYaYmruZTlC0VNdti4GKzZTtEDLpa7xqiBmb80GB5BJl+G6CGS6knNsH7vybuO3tPuvOu9
n08fj+eP096yzYFdQjEVegNYL7GJGHcUNdmyNfHurvSYPlF2o74We8DO124hxlTf/fgJWhvS
2Lth3c242yRKXck9/Xo7H3uPGLb1eOr92L+87U/aTBZgGOmlYedpJA/b6Yayi5bYhubBkkoj
gDdukK70mxGL0P5kZQRk0BLb0CxuVwPSSGAtkLdayNbE4Sp/k6Zt9E2atnPAC942FA5pINe0
863S2x+YChsmur4lE756Wqh4HYZkYruUVPzdShZ/ETNjXazgFKSv8orSjmmk3snJaSsffD/+
ejk8fv17/6v3KFDPp93bj1+tOZ3lTqsmXnu+wMkrW7jXs8FM+jNv94vvukQakRUk5g7RSt/N
gEBxxKrb1tnGH04mg5nxVMm0U5qdCcP1x8PbD8POv16KOVENvIxjHq8UIl7PA+79TyIyxkVO
RZ+HyR3j2001trk9tD92nbxgfD40gCs+a49s9kL83ZXtzcp5cGjOr3iQz+wMNT1LabMwBYjG
RNUgtTM8bb1KOvscztJtnz7KmtCYJ1LheP/6fP7x9Q12ov3p37i3VGThnxPjBpsub6qBR/dO
xZo+GdaTw2U8rlTDtwJRzBlSDg4VYt5eam7RZmguwb58d0508Qo+Z1zoVIPv399ljGZ/BQkz
OgxTzQznlI1RRd1SnHaVJuE9eqjVF/xnBkbqusNO2/tt93H+sX89Hx535/0T5CGYBJwEev85
nH/0du/vx8eDIOHx43eNV7T5wjJAP6afGTpV744hdKNWe5dUmh8HG2pN+LcBpb1ej/LKCegv
0Vv/hlwF/68Oq46U7z/273/0ng7P+/cz/AOHBGTBNu+dh87N/3Z2XMuNI8df0eO5yr5SWp3O
VfuAMCSxQqAQSEovKJ2WlrduJW0plNf+encYABN6QNkPGzjdEzChp7ungzqN/S1bRP7eXsos
jIRapOdC2SdhHooM5kjl+G94HnEhN3ZcMQMSDJ483K1FenIxc47tl6Sp8PTThVT86UTgB1fR
mV9YnIlk9OwjZBTD06i4Cjw6Mc4mFP5Rw7drGOscwm6eGOz0ghvyQmhj8Umtk9ejX+7/fQ+s
wNHL/uv709e7p3vgCP65v//z9S/e7gP8s1OJ0yLAzKmtk/bkOM0W/r6tk4vzvgZxv6kWVqyT
Q2PjD3h+RIL2asvPw329yKNWeV3mt5XwBZeB6L1jpdm7B8CrmYUZjV2GbzOGzRFCYF2eH4+e
3h//2L8cPWCYF1cpMPBQTdYna0ngSOt46YSLNCH62LsjZ1gUCtpnIMFVN8McAYbX75cMVQQK
fVbXN/NQ7abN5uqNYcxxGJkMek5n8avG8CgebuZ0cXl8fHJ8qVmAKZRKaC1opTq4PV9/3N3v
p4Qk3iKhlNRLEu8AkGXLERoUVkeM2jbYF8DAzW4kc1IXVRS2R6gqSaKrYjQBai0dgjQRgrCM
aWwqr4OJRelLZRozOAzBAGXG5P5+/x0XAy7RZJJZgDxE3x+eX+CafWTHXLSF++Xu5fHi3Cdh
dCfqkF6JTxzmh4UXT7gu30AMF4GzVYHyh6uOwEDls1BVuLvkLynO5icBbu8wAsp6cocjZLYa
AG1rLw8BB30AJfY5X5R4wtNkAMWmJ4QP9A5tSLyo1clBBOZcJ0by/9ng7pnbCoQB8xpxLAqV
zDIgEyLu1+PzWckQkZNQpMkJRYpa5WPhM8IuUbLVi9VhHQiRbyBhWD/U6R/81CKvMJDEcicZ
2kXNTVEofBCjRzS0OZqW0wCuuzjXOE0X22i7T8e/w0rjY1GWoEMgewNOCOurpLns13W2QSi2
IWH8Blde06ANwgidntMITknLnRTd09tKtsQXrbViiz903aLhBN27snVDlSLMgS6GrGP2a//y
hpGVYMfyxsQos3eohmY2DaRMM8Q4eWQbL5q2Gb4Pb9Dmc/oIhqtdW0fmlIZek6oyjYBJcPqT
sblpEK4wp17TysgD8/aBjx6+Kc5KHAMsb9kuhnss//bHy93Lv49ent/fvj2ZzkkYfzuqe3IH
MP1KosFFb2wWhA0ML256O2BoYnJlkKBDuA2QUsoEOKJFTSEPzH1mouSqDEBLhc45WW7rwqo6
DUhH8OmF6suuiOVo6PwoHZn+cfgNaI2ZFOtdsmIzyFotHAx87FlEGFWcvagzO3qobgNOKfDM
ZdWOb98aIyu1Qxu7Q5uvGd+D6zNw+1k8zoEPiVSgvE78+xIBy8XJ6SV8hQhkgb8Z5t+/kXgu
YO0Rm/kmsSEGBds5VHtUIs+3YOqafXAamJqR66qJm/999hsN5dZMS3OjnG3B1UWJSKIGQgNY
C+G+NXibaqqcYJCO1nrvSE4sTUbSu+LzeAQk4FRGVtqEbHMFNlzQbviYupEJYMvtRoWs7Xq7
6OxUHvnZqYM2jZcMqTGGQKLim0tn9EHEQDzrqcbQ4AfxQkK/i3ew3ziT1feI4M0slBkfbs64
Mw/ncpu/TbVgT45KmwnBaHbUGQ3L06VZ658eLqb5xqfEKIjiQcfx4nt0VeC3hSPgojsSSoy2
4uaWaYdTmt9Wpt+KUcq+UW75uViOqhnPpH4olHClRna3WOz+7neXF14ZxfpZ+7ggE0hl7Qpu
Tglgyl66tAHe0G+4zprE0mfr8iJL6iq/LaSXQ40SJ1+EioGlm+alX96aod4MQAyAUxGCAxEB
u9sAfhUoPxfLtQbOYWbIBCVqzTQsIF2kfVPllbUhzFI0ubsMgKBH82xFdR3dMINiSg5NlWTA
jxC/BggmD0chQcxQP1xke5xgWWrNF6aWApadbcxMBwAaHCPA8VkGQMDuLduVA6NUR9Ga7NhM
wQdpAMKiNK37tr84B9pmDwVmIY/IdWxFOjiB+Deq7dbDuCU45iOiUVf1kEL4AJaV8HpEQSgm
65gbDFssImZXjvaUhmCyzao2t90kuahPb8pIfgih5FxVhyHWOmBvWQC7KmjH2bPFC3FTOsWD
LSbKbVWVO3WqcvgeTOCytqEjyK+omd5a+ZXs8NvUS8flntyX7v9x9/79DTN7v317eH9+fz16
ZIOpu5f9HQhE/9n/3eCa0SoP+Lq+YAdEQ1k7QBp8UGKoecOZYPRxRW+zZUD6t5oKmDXaSGKk
LUSh5ULXts+X9oSgSnQ2XRUdmBj20KqIbAvUYeMs897ZA7Bv+9pejmtj1ZZ5ZW09/D13hZa5
7eqb5Lfo+G5IPvU1csBGF+hRbCYHT7PC+g0/FqlxcDDsWY3Pum1tEK8uaU4pirwpqRLXPpDb
TdoYVHsoXaoW8ydUi9QkhWYdyq/Qm9IblUJF5imm8kUFu14I7oHlYuwUxL/8eem0cPnT5L+b
pXOQOEQBGjhuI1NJSEWpWletVEbOqIs6KpT5vtEA9eTFnywGt9dh0yVPeeBOWFY5h3sAMBNF
0dayhjbh1qRyXYlunIuMYijbZqyDIodKf7x8e3r7kx4Svz7uXx98e3nSdlzRopmfpYvR+DJk
B41zRXbjfdxledpnkutkwg7JfV4tc7VBd01tUPdbEOO6y1T7eZzzQZfmtXBuGGWir6kecqry
KJDCjun/HFEwMShQoUQVboq4Qh2iqmtAtwJKYzX4s1F1XDXWC0xwJezK7NTqNonxKEa9x/Pj
j2/f9397+/aodVhsFHLP5S/+EnMb9tMOXKR4mZaYYwYWoO27XMUnp5bsNtXz7Ix9jHQb1Yu+
haNHVhmG4aTUHmHL8pqLJdmXGDi1SrtEpYF+BpYS7uWgqbSMjmLMfM8mshMfwcBq1rkoTa6j
Fe56YowQpY9bQylgQPOoxIg6Sd6lpoowhXslqbO1aVJE9KqHSSs/nx6fX5pnFTBhzTEMZSBR
G/pDc+aTgMk/RrUDdhWjJbZAFWamsgGmBckT7NoiahPJANBFoUH3VZnf+NPIDN8CuDOqQvc9
MrLSI0BNTcGlwFOxriiKmDdFutzsawO3aInxFQP2X+ZYtiq6Qhand+J4WCYDHzqjVtIcTcLT
/R/vDw9o85U9oaX4o84nOtDDCB9BmpumNtIJGoWj4T0/B38+/nkiYTVwzZiKXB+G5lcdhh02
gjnoWWhcArXQdxT+LawgO+UTghePxcdlxADJmTTnV3AGpnH4v4bP0BeMOSwCe1lKTeCV1Voa
S7M6NYcV1E1cRWKGLgTDf1vYXxgDp40aNHRYZcnnY2vj4mnv4iayUoVSwfw8JFzFBFDZEH7G
2ucEETfth7Yhp3vZv/3r+QX5jAnLilerWnqxq9UigbOITMJVgItA1LL5CCZvj1D+0RGKbll5
3tdtmYtfKY7ddPQxv2ikxsB/qF2rSoxl6O9vhJOcIFG6vIsZzRJJx9KQLw31WW3LUEj1KURW
slIB/ytCAlrXVGXoMY3HUFfkzxIQUibxnJC3O/f0myVjqPgWQ6QZNxr97r3Qalwczn1F21nz
RsAN50B6/QUYIPIsAKHeoN4EY2uGQwbq1Yi/wNUU8FlcAYd5hb4TYQaSL0Byp+qakPjbwJKl
GkuVqb+C8sRvCiNbmtPlJhCg2qn4gU44JbrQAwOCPJE280IfMOGE8GWJt6u0yOgIDLt5ubTE
UXZgRb+zdV0tMInDPFDT5hTDfgnsp1QjFKrWoK6RT10nAGbdbi1NnYuwOoSwcdVM2jeOof7L
mAn1etdQ9KjFzysrwMpaVKKgAtCJGUVtzH/8gu7/6SIUf2OwfUzrQzwVGhKfHB87GGVXDEfr
8+mnT8YYGA7LhQkQ4kDoqqEfdtIN+U4PSKRDJhML2gMNXLOuq6BJ+p2zu8KkH74ODfCPqucf
r389yp/v/3z/wQzd6u7pwc4OFGFOZGBTKzmKrwXHyNOdmrgABpJ+pWtp1APBqBYtki/UwqoW
ZrGSrDtp3dB50UEFiTRNLcZaQAqQDwT2K8ykAGyLTF+318ByAw+fBsypAY5HH3dHiTmW4LJH
jY94O8/PM7v+Az/99R2ZaJH3YNoaptAEDyeWl1pnOxB0npl4ol9ef3x7QocaGOjj+9v+Jxpu
79/uf/31V8OMka4cGgtlFRd0XUCKNmNYZ3HA47U1d3+jYUWrdoHUGnpn6zSxMyiHG9luGQk4
mGobdMvXo9o2KiBtMgJ9msc4OUhRW6FKpsmVmpPM9BSySa5WuMp9U6+w48laylfdDbt2/FBB
e2vspsXhppIm5U63UdZKW3PQFv4PW8zTNdTX9GQkcaCjos7ceCRwk2t1iR5t6F5N6tmZKb5i
Ch4gjoedq/VCZYFp0pzCAXgzx3hR+PHMsV1y93iEd1XrGSZaFCjkrU3m/0knkx4AwIaI8pmt
gCgH9wsigUAUaMtAQrJKypjxzjg9MeFqtxZwju2eJgT4H+IEOvN2EPVwLUbZHozzrZnySMm1
VqfUgiJlODowuFXVrnPmqls1ZNWSTzYglMlNW80RioRce3GChQ8lW3pDs+3FD6Q7dtRFEVId
gi7raL36EE6t2o2pjGGhRyujF8PMh4H9NmvRTt7jMzW4oGQd0A3a/jkoGK2atgdikmLMbSTR
FbmVCchtJzr1uFEYuOsW4SgzzEEG5T/NYOqv4WdR9zMEFPcxn99o9buKObKssmEeiSPzbfnU
r7MUeBval2rXZumc9kItAj7XQ0ok8Ri5nZvvPe3+9Q0vC2SSEky+efewN0d31ZWh6E+aVuIz
RoWRRr6wTla2MR7264eQOXq8hOPKnFdJtfGkF5BKoFhvr7VlloT4En2CfYmvjkgrcfNpx6qx
GgkD6aqW34XyqzSQpojqFbC6KxVQC3PL2SYUPV2xzWsYI55oDTAa4UuBWsJbYU5HVsd4r83c
LKb5SxBrkOP6+caYMbs4n+eQaNwrtXMD5tsIV3D82kBqIkJgo+wwHGhYOQPmd9swvOsCIZF4
AQMsg7U0aJnn6VhsnCyVXTSGIToi43SgshJTl7WysYLdzCKrC+DtZkbB6Qlm5iL8gsqzoYok
ghWZxchCZIcHiRsLtZOBOGqEI8ZIH23FoQ9EsxRCusCNnCPSSGbl3l/fjCfziXGxyr1APFz+
X8q8sdSBWAIA
--------------mVfUhgVaC8Kwq0epPGn8TvkX
Content-Type: application/gzip; name="dmesg-52-bit.log.gz"
Content-Disposition: attachment; filename="dmesg-52-bit.log.gz"
Content-Transfer-Encoding: base64

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
tP/ybzkeqVcLUQAA

--------------mVfUhgVaC8Kwq0epPGn8TvkX--

