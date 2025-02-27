Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E5C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SHX7NMYeoLzVBIsKX0yAvnsNefMfisYDEOKF3Y6h4o=; b=v5DEbv4AN0xmBHJaJWy31DpQT6
	h4hTGgXlaugbkOZPjPNJTNBicNZVPWW5CzXWWEyKLkAuCXoni2ukB9f4uT41CSoqY53/rAz2hqjX+
	CDpD8KoJhyWyO4HbCEYJJtfMWudq0xgPhoJltAyB+VuXJFl/kRJlUfyE+AOdlFPmQ197N2563t4Y0
	QZtZBVTP3W8yIVyJyRHG7TohXtpCFJBY9V5quXyaqtE98GbEqi2pk0ZQWfuC7vulxDmb+zMvSIUAv
	nvGmiopwzj7YHAgkyocJjNQtGnfDwgVfqznBbYBMJwlkbU+KSfjf8ZuU7j6bENkiRaLifxYDqXoJz
	Rn365ZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZqV-00000006ny4-14fv;
	Thu, 27 Feb 2025 09:06:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZox-00000006njs-1x32
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:04:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BD812BCA;
	Thu, 27 Feb 2025 01:04:56 -0800 (PST)
Received: from [10.57.85.134] (unknown [10.57.85.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D0733F6A8;
	Thu, 27 Feb 2025 01:04:39 -0800 (PST)
Message-ID: <668b7132-0acd-4c2d-9b33-10339d5b3dad@arm.com>
Date: Thu, 27 Feb 2025 09:04:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Convert __pte_to_phys() and
 __phys_to_pte_val() as functions
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
References: <20250227022412.2015835-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250227022412.2015835-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_010443_550671_EEBBB6C9 
X-CRM114-Status: GOOD (  19.07  )
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

On 27/02/2025 02:24, Anshuman Khandual wrote:
> When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
> and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
> respectively as expected. But otherwise without this config being enabled,
> they are defined as macros and their return types are implicit.
> 
> Until now this has worked out correctly as both pte_t and phys_addr_t data
> types have been 64 bits. But with the introduction of 128 bit page tables,
> pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
> conversions, which leads to compiler warnings.
> 
> Fix these warnings by converting __pte_to_phys() and __phys_to_pte_val()
> as functions instead where the return types are handled explicitly.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> This patch applies on v6.14-rc3
> 
> Changes in V2:
> 
> - Changed the helper macros as functions instead per Mark
> - Dropped irrelevant (now) in-code comments per Mark
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20250219035646.536707-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/include/asm/pgtable.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0b2a2ad1b9e8..4ebfa60ea5c6 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -68,10 +68,6 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>  #define pte_ERROR(e)	\
>  	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
>  
> -/*
> - * Macros to convert between a physical address and its placement in a
> - * page table entry, taking care of 52-bit addresses.
> - */
>  #ifdef CONFIG_ARM64_PA_BITS_52
>  static inline phys_addr_t __pte_to_phys(pte_t pte)
>  {
> @@ -84,8 +80,15 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>  	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
>  }
>  #else
> -#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
> -#define __phys_to_pte_val(phys)	(phys)
> +static inline phys_addr_t __pte_to_phys(pte_t pte)
> +{
> +	return pte_val(pte) & PTE_ADDR_LOW;
> +}
> +
> +static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
> +{
> +	return phys;
> +}
>  #endif
>  
>  #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)


