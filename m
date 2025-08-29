Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B741DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwTinAx2gv27VFL7trYYZazMk+NMyS0q0/yvDNsfVdU=; b=AlcAtd6pnt7neGNbMNcCbpt8M7
	mYG5ol8bTLjOUJII4s50bPXCIM6VUuMZoMyRv8dHVA8GKvf89YaNLPRnyWRmk3lOOmWmsCRT0bIfJ
	NkINUZRP2bFhmpg0RQXaXuTxzWtcZcXFK8XUd27oreBOiTkfOJLGi4d9XITyFeYZRXe0HfNEtDaIP
	ZsR9ag/noLfLE8Cn4EJc5EfmwwNBUGxGkhsdhnUxy8xn6NazaBPJZLS6RnNkuRI4gLA65VJZkmPcm
	uOwVHk/6wITwcGlQsjcNmv4aI4zy94J1H901n2Dzc/OdTWDMcD4YKduyxNH44bkRQEUkc0H/dg1Qm
	sZXQTrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9k7-000000078uN-2Dkh;
	Sat, 30 Aug 2025 00:46:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1cX-00000006Lo2-0y5J
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 16:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MwTinAx2gv27VFL7trYYZazMk+NMyS0q0/yvDNsfVdU=; b=SLLamnEDkWPCQNbeJe/Mr0aTpi
	vv6B50nyuJWrC52voGyFf7UQDteaselnt30DYMSNbk0jGSXR9T2kjc/vi2jx9jj6Rqt7IXShJg5VQ
	mMS5oDR8zY3CNTa9CBb2E4dUaEAO3gIcOwaXJfwq+qy8e36TJwY4DSgbWuji9TPSzYRRTvuSws0CD
	JgzOahkGpZWiHpT7A6q7MfxIIi3VxI29sfS9N9K1KFZivtLK/96OWjS2iJCW1cL5BbGgPPBdym8En
	KC+McZdbPdR8QNGIwzkRsl5yzYvu1TSMT+mgTLcgNdfla7XeUMMkqPESPQkg3UQH636YE5UE/73t5
	W6YPymdQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1cT-00000003DEe-3zCJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:06:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2AD41BD0;
	Fri, 29 Aug 2025 09:06:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DB823F778;
	Fri, 29 Aug 2025 09:06:23 -0700 (PDT)
Date: Fri, 29 Aug 2025 17:06:17 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Kees Cook <kees@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yue Haibing <yuehaibing@huawei.com>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Joey Gouly <joey.gouly@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	James Morse <james.morse@arm.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dev Jain <dev.jain@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
 function signature
Message-ID: <aLHP-TG3a1Im3kpa@J2N7QTR9R3>
References: <20250829154913.work.943-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829154913.work.943-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_170630_439764_3966D9A7 
X-CRM114-Status: GOOD (  23.70  )
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

On Fri, Aug 29, 2025 at 08:49:21AM -0700, Kees Cook wrote:
> Seen during KPTI initialization:
> 
>   CFI failure at create_kpti_ng_temp_pgd+0x124/0xce8 (target: kpti_ng_pgd_alloc+0x0/0x14; expected type: 0xd61b88b6)
> 
> The call site is alloc_init_pud() at arch/arm64/mm/mmu.c:
> 
>   pud_phys = pgtable_alloc(TABLE_PUD);
> 
> alloc_init_pud() has the prototype:
> 
>   static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>                              phys_addr_t phys, pgprot_t prot,
>                              phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>                              int flags)
> 
> where the pgtable_alloc() prototype is declared.
> 
> The target (kpti_ng_pgd_alloc) is used in arch/arm64/kernel/cpufeature.c:
> 
>   create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc), KPTI_NG_TEMP_VA,
>                           PAGE_SIZE, PAGE_KERNEL, kpti_ng_pgd_alloc, 0);
> 
> which is an alias for __create_pgd_mapping_locked() with prototype:
> 
>   extern __alias(__create_pgd_mapping_locked)
>   void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys,
>                                unsigned long virt,
>                                phys_addr_t size, pgprot_t prot,
>                                phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>                                int flags);
> 
> __create_pgd_mapping_locked() passes the function pointer down:
> 
>   __create_pgd_mapping_locked() -> alloc_init_p4d() -> alloc_init_pud()
> 
> But the target function (kpti_ng_pgd_alloc) has the wrong signature:
> 
>   static phys_addr_t __init kpti_ng_pgd_alloc(int shift);
> 
> The "int" should be "enum pgtable_type".
> 
> To make "enum pgtable_type" available to cpufeature.c, move
> enum pgtable_type definition from arch/arm64/mm/mmu.c to
> arch/arm64/include/asm/mmu.h.
> 
> Adjust kpti_ng_pgd_alloc to use "enum pgtable_type" instead of "int".
> The function behavior remains identical (parameter is unused).
> 
> Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enabled")

That doesn't look right; that commit is from June 2022, and we only
introduced enum pgtable_type in May 2025 in commit:

  c64f46ee13779616 ("arm64: mm: use enum to identify pgtable level instead of *_SHIFT")

... which landed in v6.16.

AFAICT, that's the commit which broke things.

The actual fix looks fine, though I suspect we should move more of this
logic into mmu.c.

Mark.

> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Yue Haibing <yuehaibing@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> ---
>  arch/arm64/include/asm/mmu.h   | 7 +++++++
>  arch/arm64/kernel/cpufeature.c | 5 +++--
>  arch/arm64/mm/mmu.c            | 7 -------
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 6e8aa8e72601..49f1a810df16 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -17,6 +17,13 @@
>  #include <linux/refcount.h>
>  #include <asm/cpufeature.h>
>  
> +enum pgtable_type {
> +	TABLE_PTE,
> +	TABLE_PMD,
> +	TABLE_PUD,
> +	TABLE_P4D,
> +};
> +
>  typedef struct {
>  	atomic64_t	id;
>  #ifdef CONFIG_COMPAT
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9ad065f15f1d..e49d142a281f 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -84,6 +84,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/insn.h>
>  #include <asm/kvm_host.h>
> +#include <asm/mmu.h>
>  #include <asm/mmu_context.h>
>  #include <asm/mte.h>
>  #include <asm/hypervisor.h>
> @@ -1945,11 +1946,11 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
>  extern
>  void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>  			     phys_addr_t size, pgprot_t prot,
> -			     phys_addr_t (*pgtable_alloc)(int), int flags);
> +			     phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags);
>  
>  static phys_addr_t __initdata kpti_ng_temp_alloc;
>  
> -static phys_addr_t __init kpti_ng_pgd_alloc(int shift)
> +static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
>  {
>  	kpti_ng_temp_alloc -= PAGE_SIZE;
>  	return kpti_ng_temp_alloc;
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 34e5d78af076..183801520740 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -47,13 +47,6 @@
>  #define NO_CONT_MAPPINGS	BIT(1)
>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>  
> -enum pgtable_type {
> -	TABLE_PTE,
> -	TABLE_PMD,
> -	TABLE_PUD,
> -	TABLE_P4D,
> -};
> -
>  u64 kimage_voffset __ro_after_init;
>  EXPORT_SYMBOL(kimage_voffset);
>  
> -- 
> 2.34.1
> 

