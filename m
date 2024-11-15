Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77598D6DDD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqeD3l07jXfQMy87hOHBt/BC/1oNLwK+qfXUUm7iCY0=; b=fCjjfKTPTLN5w081ZCa7BnAw6d
	MS5sWYO82cD4lZToL8hAsWzpPeIwhIO3lJ6JwzllqVFtglJq0Wn51W86MMMYpvKSBRSKqyJlR/cjn
	E9wpIpsIAbYgEAPqcK+OXq7WkLTz9+wUPRiAnSiui+h6CquRsjB0LGJaYkK1TtASyMJSiViyOiZzS
	l6SRuawsq4l5HEzNtTktrqmaEAMChgWYiI9YUfvwaBGBpL5XSqeJmiNvaGoXP85BKNTRafKWkWoKr
	GGC8gabOpGAcwZJpU587mHORrYmzRCUA8q5l56+XeNciMRGYg+7evcK8YbnWZjC52hERdffyr9SRs
	hegn/SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBoX3-00000001dIZ-1u6E;
	Fri, 15 Nov 2024 05:06:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBoW8-00000001dE9-0Ucy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 05:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5893015BF;
	Thu, 14 Nov 2024 21:05:40 -0800 (PST)
Received: from [10.163.45.151] (unknown [10.163.45.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11F8E3F66E;
	Thu, 14 Nov 2024 21:05:06 -0800 (PST)
Message-ID: <7d89e43a-1a8d-4bac-804b-eac1ed9d8d90@arm.com>
Date: Fri, 15 Nov 2024 10:35:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64/mm: Reduce PA space to 48 bits when LPA2 is not
 enabled
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <keescook@chromium.org>,
 stable@vger.kernel.org
References: <20241111083544.1845845-8-ardb+git@google.com>
 <20241111083544.1845845-9-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241111083544.1845845-9-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_210512_244179_5A99FC56 
X-CRM114-Status: GOOD (  20.67  )
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



On 11/11/24 14:05, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, LPA2 support implies support for up to 52 bits of physical
> addressing, and this is reflected in global definitions such as
> PHYS_MASK_SHIFT and MAX_PHYSMEM_BITS.
> 
> This is potentially problematic, given that LPA2 support is modeled as a
> CPU feature which can be overridden, and with LPA2 support turned off,
> attempting to map physical regions with address bits [51:48] set (which
> may exist on LPA2 capable systems booting with arm64.nolva) will result
> in corrupted mappings with a truncated output address and bogus
> shareability attributes.
> 
> This means that the accepted physical address range in the mapping
> routines should be at most 48 bits wide when LPA2 is supported but not
> enabled.
> 
> Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable-hwdef.h | 6 ------
>  arch/arm64/include/asm/pgtable-prot.h  | 7 +++++++
>  arch/arm64/include/asm/sparsemem.h     | 4 +++-
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index fd330c1db289..a970def932aa 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -218,12 +218,6 @@
>   */
>  #define S1_TABLE_AP		(_AT(pmdval_t, 3) << 61)
>  
> -/*
> - * Highest possible physical address supported.
> - */
> -#define PHYS_MASK_SHIFT		(CONFIG_ARM64_PA_BITS)
> -#define PHYS_MASK		((UL(1) << PHYS_MASK_SHIFT) - 1)
> -
>  #define TTBR_CNP_BIT		(UL(1) << 0)
>  
>  /*
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 9f9cf13bbd95..a95f1f77bb39 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -81,6 +81,7 @@ extern unsigned long prot_ns_shared;
>  #define lpa2_is_enabled()	false
>  #define PTE_MAYBE_SHARED	PTE_SHARED
>  #define PMD_MAYBE_SHARED	PMD_SECT_S
> +#define PHYS_MASK_SHIFT		(CONFIG_ARM64_PA_BITS)
>  #else
>  static inline bool __pure lpa2_is_enabled(void)
>  {
> @@ -89,8 +90,14 @@ static inline bool __pure lpa2_is_enabled(void)
>  
>  #define PTE_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PTE_SHARED)
>  #define PMD_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PMD_SECT_S)
> +#define PHYS_MASK_SHIFT		(lpa2_is_enabled() ? CONFIG_ARM64_PA_BITS : 48)
>  #endif
>  
> +/*
> + * Highest possible physical address supported.
> + */
> +#define PHYS_MASK		((UL(1) << PHYS_MASK_SHIFT) - 1)
> +
>  /*
>   * If we have userspace only BTI we don't want to mark kernel pages
>   * guarded even if the system does support BTI.
> diff --git a/arch/arm64/include/asm/sparsemem.h b/arch/arm64/include/asm/sparsemem.h
> index 8a8acc220371..035e0ca74e88 100644
> --- a/arch/arm64/include/asm/sparsemem.h
> +++ b/arch/arm64/include/asm/sparsemem.h
> @@ -5,7 +5,9 @@
>  #ifndef __ASM_SPARSEMEM_H
>  #define __ASM_SPARSEMEM_H
>  
> -#define MAX_PHYSMEM_BITS	CONFIG_ARM64_PA_BITS
> +#include <asm/pgtable-prot.h>
> +
> +#define MAX_PHYSMEM_BITS	PHYS_MASK_SHIFT
>  
>  /*
>   * Section size must be at least 512MB for 64K base

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

