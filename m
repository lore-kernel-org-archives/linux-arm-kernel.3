Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AFCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PW/zV8hdZwQ5B1gG66+eoSBi9mJalrIDKsEMvtwborY=; b=LulRcelszemvFqscbamhoX7we2
	iiC2+UGiprsNPz05t939G3j2xsK26kYUzcfQAsNgWj3xHAF/3xJ5EvKKwO0CF/5sJyihBSldG0b2H
	g6urFQPpM4mjf/qlcoWdvUw5C7dcv+F6JMoJdjyes23MvyyuniHq6WRb8l4lRvWRc1TI8pJOG54MT
	vC0qxEhpv/xwzibtc3x6Cbc313bugcsK2mWQvapnUP1Ycmi0qx2PEAygY3MkeE0xmja8B0XFX/KqT
	rG3h9DTKkNwftUOOmM6CpzedGV7+NSa8CDfpf6lsx+2XNIjValep2SHxBCdeOiTEaX8r57LUdY/U8
	9JFMoISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmubG-0000000HIOs-16G6;
	Tue, 25 Feb 2025 13:03:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu6d-0000000HDe9-2UB9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:32:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA16152B;
	Tue, 25 Feb 2025 04:32:23 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32AEF3F6A8;
	Tue, 25 Feb 2025 04:32:06 -0800 (PST)
Date: Tue, 25 Feb 2025 12:32:03 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Explicit cast conversions to correct data type
Message-ID: <Z724Q1ofM1GvKquV@J2N7QTR9R3>
References: <20250219035646.536707-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219035646.536707-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_043211_672878_CEA58339 
X-CRM114-Status: GOOD (  23.11  )
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

On Wed, Feb 19, 2025 at 09:26:46AM +0530, Anshuman Khandual wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
> and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
> respectively as expected. But otherwise without this config being enabled,
> they are defined as macros and their return types are implicit.
> 
> Until now this has worked out correctly as both pte_t and phys_addr_t data
> types have been 64 bits. But with the introduction of 128 bit page tables,
> pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
> conversions, which leads to compiler warnings.

Does 128-bit page table not imply 52-bit PAs?

> Fix the warnings by explicitly casting to the correct type after doing the
> conversion.

I think it would be simpler and clearer if we replaced the macros with
functions, such that __pte_to_phys() and __phys_to_pte_val() are
*always* functions.

That way it's easier to compar the CONFIG_ARM64_PA_BITS_52=y and
CONFIG_ARM64_PA_BITS_52=n versions, and the types are always explciit
for inputs and outputs, so there'd be less room for error and the
compiler can warn us of type safety issues in any configuration.

That and we can delete the comment block immediately above at the same
time.

Mark.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.14-rc3
> 
>  arch/arm64/include/asm/pgtable.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0b2a2ad1b9e8..1da2421c9a15 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -84,8 +84,8 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>  	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
>  }
>  #else
> -#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
> -#define __phys_to_pte_val(phys)	(phys)
> +#define __pte_to_phys(pte)	((phys_addr_t)(pte_val(pte) & PTE_ADDR_LOW))
> +#define __phys_to_pte_val(phys)	((pteval_t)(phys))
>  #endif
>  
>  #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
> -- 
> 2.25.1
> 
> 

