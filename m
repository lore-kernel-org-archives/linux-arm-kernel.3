Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C58CD6CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asr4BOwImGHMGhCGPa+qMP8VPUAkfUmh4Wamxnyaxsg=; b=iqOlY+WX5vMBGcVjTUUkTuLHcb
	2j9LUEr5ip8haLwCuW1z+Qk30TUxcZ2Sm6fQTYEE/JKJxiqbx/t9nUZwd7vX2NqHkPIcA5+k/0iR4
	3yCQfML+Oswl+ybajKZcDfDur4UzqgqZInzAUXeJohuieaZ0OD5qEiUYUha4GPI1vOQLwQ2jvChex
	ODXn1/bKyhIhvAyFbJz590Hq4GFvtrcDfKTEIcPhgD7JxcrVusZUvd5wIX2oGHMQmLd21/GE9NH3E
	Kuhebud4xiQb59iTM8KtwFhoCwyVkOh2HhKAd70/9BC6/ALYIV0TgZohAO9PXE/4Szcf3iAywioXP
	X/xnHdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAPg-00000008H9B-3PdM;
	Fri, 23 Jan 2026 06:12:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAPd-00000008H8l-1WYE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:12:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC821476;
	Thu, 22 Jan 2026 22:12:41 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E60603F740;
	Thu, 22 Jan 2026 22:12:44 -0800 (PST)
Message-ID: <d5c7ed76-2b54-4c6e-961f-6ba1e4011467@arm.com>
Date: Fri, 23 Jan 2026 11:42:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: Move fixmap page tables to end of kernel image
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260119164747.1402434-6-ardb+git@google.com>
 <20260119164747.1402434-7-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260119164747.1402434-7-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_221253_465059_54800884 
X-CRM114-Status: GOOD (  15.76  )
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



On 19/01/26 10:17 PM, Ard Biesheuvel wrote:
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
> ---
>  arch/arm64/kernel/vmlinux.lds.S | 5 +++++
>  arch/arm64/mm/fixmap.c          | 7 ++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index ad6133b89e7a..df530e6f3e53 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -334,6 +334,11 @@ SECTIONS
>  	__pi___bss_start = __bss_start;
>  
>  	. = ALIGN(PAGE_SIZE);
> +	.pgdir : {
> +		__pgdir_start = .;

Does __fixmap_pgdir_start with an end marker __fixmap_pgdir_end sound better ?

> +		*(.fixmap_bss)
> +	}
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


