Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1F0FC5938
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvomYMDPYnCQaAEJsd+qBgN1s07N0NtAa73SG3ANUiw=; b=GWOJAI/NSS3LnaKyPWJchgAs4S
	7dFp/fzobb9fnbeGfMFwwfuvw6BAPSvWeGRaF3frSsD9PNQ1ANhK+j3gyuGQ+SU/rHR9tKm6xfSza
	pEJS8pMCxNmq3TprGz3PNEVVELSxVQlVKLel4wDKIcK0v5ZDsBSZbrLEzAAy35s41/qsHypFHP7F9
	Xs/WlPGqCqRIw78C/EXrsyDLMA4+RdxYr+tQtN3DFBOg/1jS7wnJJdNXcmfHzxMhH3+tadtfDuc9X
	hkE8scYjVFt+/YliP16keNml/aKQ7PSUyL5GYyrqlr/UP26RjRp5uIp+IobvBwifbdVFN6/92sNBt
	LjRYBGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZuq-0000000647h-1o4d;
	Thu, 26 Feb 2026 11:52:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZun-0000000647C-2S7F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:52:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D851516;
	Thu, 26 Feb 2026 03:52:11 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 416F83F62B;
	Thu, 26 Feb 2026 03:52:16 -0800 (PST)
Date: Thu, 26 Feb 2026 11:52:07 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Describe 52 bits PA folding into TTBRx_EL1
Message-ID: <aaAzz-YRC1C5UtQo@J2N7QTR9R3>
References: <20260226101135.1915529-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226101135.1915529-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_035221_751042_8BA5CE5D 
X-CRM114-Status: GOOD (  21.88  )
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

On Thu, Feb 26, 2026 at 10:11:35AM +0000, Anshuman Khandual wrote:
> A 52 bits physical address gets stored in TTBR_BADDR_MASK_52 in a folded
> manner. Shifting PA[51:0] right ward by '46' bits, aligns PA[51:48] into
> TTBRx_EL1[5:2] which gets ORed for the final TTBRx_EL1 encoding.
> 
> Define TTBR_BADDR_HIGH_52_PA_PIVOT which describes this inflection point,
> where this right shift is done thus bringing some clarity to this 52 bits
> PA address folding process in TTBRx_EL1.

TBH, I don't think this is adding much as-is. The phys_to_ttbr macros
are still inscrutable, even with '46' replaced with
'TTBR_BADDR_52_PA_PIVOT'.

As last time, I think this would be better with explcit bit
extraction/insertion, but I don't think it's necessary to actually
change this unless it's enabling something else in future (which it
doesn't seem to).

i.e. I think we should leave this as-is.

Mark.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This applies on v7.0-rc1
> 
> Earlier context can be found here.
> 
> https://lore.kernel.org/linux-arm-kernel/aRb8ezhQd0c0jp9G@J2N7QTR9R3/
> 
>  arch/arm64/include/asm/assembler.h     |  2 +-
>  arch/arm64/include/asm/pgtable-hwdef.h | 14 ++++++++++++++
>  arch/arm64/include/asm/pgtable.h       |  3 ++-
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index d3d46e5f7188..a68002dd4c0e 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -615,7 +615,7 @@ alternative_else_nop_endif
>   */
>  	.macro	phys_to_ttbr, ttbr, phys
>  #ifdef CONFIG_ARM64_PA_BITS_52
> -	orr	\ttbr, \phys, \phys, lsr #46
> +	orr	\ttbr, \phys, \phys, lsr #TTBR_BADDR_52_PA_PIVOT
>  	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
>  #else
>  	mov	\ttbr, \phys
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index d49180bb7cb3..21ca79f02a5d 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -284,6 +284,20 @@
>   * TTBR_ELx[1] is RES0 in this configuration.
>   */
>  #define TTBR_BADDR_MASK_52	GENMASK_ULL(47, 2)
> +
> +/*
> + * A 52 bit physical address gets stored in TTBR_BADDR_MASK_52 i.e
> + * GENMASK(47, 2) in a folded manner. Shifting PA[51:0] right ward
> + * by 46 bits aligns PA[51:48] into TTBRx_EL1[5:2] which gets ORed
> + * subsequently for the final TTBRx_EL1 encoding.
> + *
> + * 47                                              5          2  0
> + * +----------------------------------------------+-----------+--+
> + * |                      PA[47:X]                | PA[51:48] |  |
> + * +----------------------------------------------+-----------+--+
> + *
> + */
> +#define TTBR_BADDR_52_PA_PIVOT (51 - 5)
>  #endif
>  
>  #ifdef CONFIG_ARM64_VA_BITS_52
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b3e58735c49b..2f274c468d83 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1576,7 +1576,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
>  
>  #ifdef CONFIG_ARM64_PA_BITS_52
> -#define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
> +#define phys_to_ttbr(addr)	(((addr) | ((addr) >> TTBR_BADDR_52_PA_PIVOT)) & \
> +				 TTBR_BADDR_MASK_52)
>  #else
>  #define phys_to_ttbr(addr)	(addr)
>  #endif
> -- 
> 2.30.2
> 

