Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5317C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ9QnmOxHh4CvZBFQXJjBlKANbistLk+5N+SYPX+l5g=; b=TsSsp0Oqj+yhGcLDWBEwZx7U+i
	3dAvERPJ265Cb54vi3AwD46R1fze28RJH2keDx3B1x/6F6FnJgZcMroHL+X5Msryaf5ZG14l0RYrV
	YzbZgXX1YllGUlaEslykcUb4Eye/LswcNXsR7ZUQubxFuzqP1JDEEBqXJYbScR3EFZ1X+XIB0BWDE
	BXPG6txp4zujyvO6j9eRQERsDjFAusPjDrfG/zpj6kke5lhwz6mh/m5Le1yyR6bSloHMOqCHHE6gq
	oB6467HDuvWfXdCxYrqMlXGtqqIhyUP48ZAhTO77oFeNyh88LEarp6fDgq0NDn1lR7bRyv0WmWSYQ
	M0n1V6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KYB-0000000BODC-3TTj;
	Tue, 01 Sep 2026 09:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KY9-0000000BOBt-1gP2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:13:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 714961AED;
	Tue,  1 Sep 2026 02:12:56 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A378B3F882;
	Tue,  1 Sep 2026 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788253980; bh=rbaRyeBPrLdcQyWyCt5ftES2mzcd8+vW5l8SUinEmKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KoOZ9kQRWDVapEe+PRSx3GlmHQ1bOERvE9n0m1uXbfY+3jf32r3ozjYgMTknTEt97
	 J/egV5OVx8vR+xZPEwrKRHP2kIWAR+pa3QkOiuluynTStRIM5QctxTFFnLmls1qM/2
	 Zr5IKtty+8ZaimKIu4wbd7BWz8iAesXqI/FfuOws=
Message-ID: <e98a0dd6-d834-402c-be1c-0b7e8737e7ad@arm.com>
Date: Tue, 1 Sep 2026 11:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/4] arm64: mm: Move fixmap intermediate page
 tables into .rodata
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
References: <20260827164409.3421848-6-ardb+git@google.com>
 <20260827164409.3421848-10-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-10-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_021301_487407_7B804EB4 
X-CRM114-Status: GOOD (  19.08  )
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

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The fixmap intermediate page tables are allocated statically, are
> installed into the kernel's page table hierarchy early during boot, and
> control a slice of the kernel's virtual address space that is not
> subject to KASLR randomization.
>
> Combined with the lack of randomization of the linear map, and the
> tendency of some Android bootloaders to place the kernel image at the
> base of DRAM in the physical space, the placement of these page tables
> produces a vulnerability that is comparatively easy to exploit.
>
> Avoid this, by moving these intermediate page tables into .rodata, so
> that they cannot be manipulated directly via the linear map.

Would be good to mention that this works thanks to the previous patches,
otherwise one would wonder why we didn't do this earlier :)

- Kevin

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/linkage.h | 1 +
>  arch/arm64/mm/fixmap.c           | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
> index d1f7a16729d2..00963e11ebf0 100644
> --- a/arch/arm64/include/asm/linkage.h
> +++ b/arch/arm64/include/asm/linkage.h
> @@ -45,6 +45,7 @@
>  
>  #define _THIS_IP_ ({ unsigned long __ip; asm volatile("adr %0, ." : "=r" (__ip)); __ip; })
>  
> +#define __rodata_pgtbl __section(".pgtbl.ro_after_init") __aligned(PAGE_SIZE)
>  #define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
>  
>  #endif
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index 3a8cf6de6a7d..ab0f9ba7b712 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -32,8 +32,8 @@ static_assert(NR_BM_PMD_TABLES == 1);
>  #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
>  
>  pte_t fixmap_bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
> -static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
> -static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
> +static pmd_t bm_pmd[PTRS_PER_PMD] __rodata_pgtbl;
> +static pud_t bm_pud[PTRS_PER_PUD] __rodata_pgtbl;
>  
>  const size_t fixmap_bm_pte_size = sizeof(fixmap_bm_pte);
>  

