Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06151D19515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F72CX9V5hj+asRoXJbBHvacK0QZ5HMjFt5a8nWQvEJY=; b=XVKlVt+7gliNu1RFJd6yKl0dUZ
	roW9PTakUYJC/zv8ZM9MhYroh58d+XFqMIpohT/VRKP3/krBVhNgVQyTfFfNtYK8m3/C1JIKlhGRd
	QMFANryitQbht04LdYewlw48CbhguxsefIOUvYjBh1jqkZXNX5JFFYGTLLxnKy2IrxUM1iAFBxYKf
	7vYfVhaw0JtMVEwB9anB0pxdilO1LVPIUA7ZirW7Szqf2g6khu6dvPnWdSAYlZt+tsmBkQiesyJ8N
	IFEDaUDyfn3VIT1RBB+/XlQxJJqPUthXSOAvZ1EQnR3tyHOCbzQ0+cH+/kEaRiwpgUWi0kG0JrWAB
	I5Yjn37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfaT-0000000DyVk-3gi2;
	Tue, 27 Jan 2026 09:42:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfaQ-0000000DyTw-3E2G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:42:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A34C339;
	Tue, 27 Jan 2026 01:42:06 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D870A3F632;
	Tue, 27 Jan 2026 01:42:10 -0800 (PST)
Message-ID: <823c6406-5b70-490d-a318-25ac48950ec6@arm.com>
Date: Tue, 27 Jan 2026 09:42:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] arm64: Move fixmap page tables to end of kernel
 image
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-14-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-14-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014214_864775_D91DD764 
X-CRM114-Status: GOOD (  16.95  )
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

On 26/01/2026 09:26, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Move the fixmap page tables out of the BSS section, and place them at
> the end of the image, right before the init_pg_dir section where some of
> the other statically allocated page tables live.
> 
> These page tables are currently the only data objects in vmlinux that
> are meant to be accessed via the kernel image's linear alias, and so
> placing them together allows the remainder of the data/bss section to be
> remapped read-only or unmapped entirely.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/kernel/vmlinux.lds.S | 5 +++++
>  arch/arm64/mm/fixmap.c          | 7 ++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index b2a093f5b3fc..c089b83308a5 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -335,6 +335,11 @@ SECTIONS
>  	__pi___bss_start = __bss_start;
>  
>  	. = ALIGN(PAGE_SIZE);
> +	.pgdir : {
> +		__pgdir_start = .;
> +		*(.fixmap_bss)
> +	}

Observing that this still gets zero-initialized:

	/* Clear BSS and the initial page tables */
	memset(__bss_start, 0, (char *)init_pg_end - (char *)__bss_start);

Thanks,
Ryan

> +
>  	__pi_init_pg_dir = .;
>  	. += INIT_DIR_SIZE;
>  	__pi_init_pg_end = .;
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c5c5425791da..b649ea1a46e4 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -31,9 +31,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
>  
>  #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
>  
> -static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
> -static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
> -static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
> +#define __fixmap_bss	__section(".fixmap_bss") __aligned(PAGE_SIZE)
> +static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __fixmap_bss;
> +static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
> +static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
>  
>  static inline pte_t *fixmap_pte(unsigned long addr)
>  {


