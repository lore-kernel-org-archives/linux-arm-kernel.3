Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C602CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOuLdi0z8Z/qMuOwgIUvaNnw3NKNQDIPVn5ufsOY4E8=; b=q5LnaQNHMdgmsiLBFpwjkCvNiV
	u7b82UMEaXXD+oJBnU+8mWty+EzitPRXVgCUszgQgW94oO+R1KXUdDczPfHxm1rz9IfYgrp/fuNYf
	seCVBpXo+OgOSI3io5FCuSyo5nuvH9uLRXsdlT76A6KXeio7AeY1t/x6w6XGtF8C+Di/flizmFTfv
	abhfD3nmUTBE5Gw5jhM6kVc5UGRy+1iNqqPWyABjbJxJKRwNUSPyaNT08RS69fUNVS6mlRjJYqRe6
	bLiMxFE/2fWkKoe9ZrRgApNvLdrkzZb1MonKhoIS0/xHOJyotQD1zt3s0upMMS4ff0IZOhEisRDnW
	rcqE+RBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIn3-0000000C3W9-2kDQ;
	Tue, 04 Nov 2025 15:17:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIn0-0000000C3Vi-0T3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:17:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 625C61CE0;
	Tue,  4 Nov 2025 07:17:32 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6FB63F66E;
	Tue,  4 Nov 2025 07:17:38 -0800 (PST)
Date: Tue, 4 Nov 2025 15:17:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64/mm: Ensure correct 48 bit PA gets into
 TTBRx_EL1
Message-ID: <aQoZDbuBJ_2YcsyP@J2N7QTR9R3.cambridge.arm.com>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
 <20251103052618.586763-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103052618.586763-5-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_071742_211676_50B40B75 
X-CRM114-Status: GOOD (  17.23  )
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

On Mon, Nov 03, 2025 at 05:26:16AM +0000, Anshuman Khandual wrote:
> Even though 48 bit PA representation in TTBRx_EL1 does not involve shifting
> partial bits like 52 bit variant does, they sill need to be masked properly
> for correctness. Hence mask 48 bit PA with TTBRx_EL1_BADDR_MASK.

There is no need for the address "to be masked properly for
correctness".

We added masking for 52-bit PAs due to the need to shuffle the bits
around. There is no need for that when using 48-bit PAs, since the
address must be below 2^48, and the address must be suitably aligned.

If any bits are set outside of this mask, that is a bug in the caller.

Mark.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/assembler.h | 1 +
>  arch/arm64/include/asm/pgtable.h   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 23be85d93348..d5eb09fc5f8a 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -609,6 +609,7 @@ alternative_endif
>  	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
>  #else
>  	mov	\ttbr, \phys
> +	and	\ttbr, \ttbr, #TTBRx_EL1_BADDR_MASK
>  #endif
>  	.endm
>  
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0944e296dd4a..c3110040c137 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1604,7 +1604,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  #ifdef CONFIG_ARM64_PA_BITS_52
>  #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
>  #else
> -#define phys_to_ttbr(addr)	(addr)
> +#define phys_to_ttbr(addr)	(addr & TTBRx_EL1_BADDR_MASK)
>  #endif
>  
>  /*
> -- 
> 2.30.2
> 

