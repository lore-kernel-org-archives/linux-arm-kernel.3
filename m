Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF539CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH0z2W4yhgf/tO2JKbxj0lz1C+rTr91+0P7YFlO3hzg=; b=KlVyHpzLd2PvLJs8UjtmnWHmHo
	MEqs/HmCaEKSGCca6OZtD4KyIW4oYx/EpbYQBUIrkjVcZSmiC4WSuF0xm/kQyk4P5N4Aq1p4h/nWX
	2sVIeh9E1cf9OgIuYraz31ynfmgsjjGPy3jryptu1siLJzzZGcCW0qbHw5894hu5+IJxqwtaWMxKO
	8XUNLSK4SghQqfoD+N4zbOs2Jy+KJE+H8liYo/1aQqZCy3K2gQ2O+a+SIuAngWKew6hANsMCuGyYv
	yvUi15ivVksFNyG7yY4EdS4P4+oFa2tgcvZCcYFPPxSYqYq3HzCPhIo3zaQoWrw0DMmRFdPY2cQ9J
	+NR6A1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsZK-00000006x9c-3Cpw;
	Fri, 29 May 2026 08:27:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsZI-00000006x9I-1bz8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2265201B;
	Fri, 29 May 2026 01:27:41 -0700 (PDT)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F36E3F632;
	Fri, 29 May 2026 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780043266; bh=vGqKwtowp8PNMRvBO7niOdxzr80Af+Ycpil33LSytq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sZLc3D9chfT7SLPciBg3CzU4tEgQd2MgnitSwynPVzMJkASztCzaS8U6eG48NlXUj
	 NjlYJAnCst9GC7POcH6vB4eJQPJcLzWDvzqPHQrCfUmthlePWs5wgYHTV4sko2IV+Z
	 aIr2mh8cXNbx5h2aQZIulPua6F09KFpwA+oUzHNk=
Message-ID: <2a6f9f05-ac57-4ef8-9328-74cc8ccfea16@arm.com>
Date: Fri, 29 May 2026 10:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] arm64: Move fixmap and kasan page tables to end
 of kernel image
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-26-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260526175846.2694125-26-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_012748_504635_254A58CB 
X-CRM114-Status: GOOD (  21.12  )
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

On 26/05/2026 19:58, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Move the fixmap and kasan page tables out of the BSS section, and place
> them at the end of the image, right before the init_pg_dir section where
> some of the other statically allocated page tables live.
>
> These page tables are currently the only data objects in vmlinux that
> are meant to be accessed via the kernel image's linear alias, and so
> placing them together allows the remainder of the data/bss section to be
> remapped read-only or unmapped entirely.
>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/mmu.h    | 2 ++
>  arch/arm64/kernel/vmlinux.lds.S | 8 +++++++-
>  arch/arm64/mm/fixmap.c          | 6 +++---
>  arch/arm64/mm/kasan_init.c      | 2 +-
>  4 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 5e1211c540ab..fb95754f2876 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -13,6 +13,8 @@
>  
>  #ifndef __ASSEMBLER__
>  
> +#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
> +
>  #include <linux/refcount.h>
>  #include <asm/cpufeature.h>
>  
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index e1ac876200a3..2b0ebfb30c63 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -349,9 +349,15 @@ SECTIONS
>  	_edata = .;
>  
>  	/* start of zero-init region */
> -	BSS_SECTION(SBSS_ALIGN, 0, 0)
> +	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
>  	__pi___bss_start = __bss_start;
>  
> +	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
> +	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {

Do we actually need the NOLOAD type here?

Aside from that:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> +		*(.pgdir.bss)
> +	}
> +	ASSERT(ADDR(.pgdir.bss) == __bss_stop, ".pgdir.bss must follow BSS")
> +
>  	. = ALIGN(PAGE_SIZE);
>  	__pi_init_pg_dir = .;
>  	. += INIT_DIR_SIZE;
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c5c5425791da..1a3bbd67dd76 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -31,9 +31,9 @@ static_assert(NR_BM_PMD_TABLES == 1);
>  
>  #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
>  
> -static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
> -static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
> -static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
> +static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __pgtbl_bss;
> +static pmd_t bm_pmd[PTRS_PER_PMD] __pgtbl_bss __maybe_unused;
> +static pud_t bm_pud[PTRS_PER_PUD] __pgtbl_bss __maybe_unused;
>  
>  static inline pte_t *fixmap_pte(unsigned long addr)
>  {
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index abeb81bf6ebd..dbf22cae82ee 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -214,7 +214,7 @@ asmlinkage void __init kasan_early_init(void)
>  		 * shadow pud_t[]/p4d_t[], which could end up getting corrupted
>  		 * when the linear region is mapped.
>  		 */
> -		static pte_t tbl[PTRS_PER_PTE] __page_aligned_bss;
> +		static pte_t tbl[PTRS_PER_PTE] __pgtbl_bss;
>  		pgd_t *pgdp = pgd_offset_k(KASAN_SHADOW_START);
>  
>  		set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));

