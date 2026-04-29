Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E59CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lm1+A0qDgefDwn4bp/M3ryUm2rKD42TYqLTCfsQDJ2U=; b=4izei2W0ZzPdiIhkjc31rh9WHI
	HR44wAT9Vvrq+/JD8jCw0bZ+eegNRWTPsrW5BKoCQIiVfWjG65VjpJBhbLZPScgAFqKJ0e/N3QT19
	FOb70kauTjB+epsSe0yUalTkD0K1VHYg7QNoSee6jpnjkZSeXXKy9FcniLAdpV41iUvmK2aSsnuKJ
	fOH7Z+eNw8IgVsH+erDtFB+uh/ssRXlbfSG7H2gGgb0+30TWTTDJYu89qJCWkGuXmlp5XoPqiFcFZ
	EEKO/f92LO1Fu6FRAjnuXluJKl6bElcq9TptSfmlo8uQQtLZYSNopvfOvQIHwdB8jc4Kr9TZ1muMY
	oNW7+RvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5LG-00000003hjF-44pK;
	Wed, 29 Apr 2026 13:52:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5LE-00000003hib-3hYG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:52:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A548C1C01;
	Wed, 29 Apr 2026 06:52:33 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42303FB90;
	Wed, 29 Apr 2026 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777470759; bh=s0tgitch6tjt2iSC+ew5SbhvP7lh6LqBU7/+wo85gzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HgLY0RjcX26UI051X7p0jTvCIxdqYVMTsc8814Yedfgp0bzVK7UFbv8tvL3cLRx6u
	 iDWC3D+nLEDNCb2TZLk5lDi5Udldgc4oVV5EETWkYfWURPnuXnXWyavWHFha+ew//E
	 2S5LwNp+WnBIoW+zr84x3BSUsI6BHHiVLKyfK5Og=
Message-ID: <382872b6-748b-41de-b3f5-728964bbd82a@arm.com>
Date: Wed, 29 Apr 2026 15:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] arm64: Move fixmap page tables to end of kernel
 image
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-27-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-27-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065240_971541_E6948D07 
X-CRM114-Status: GOOD (  17.14  )
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

On 27/04/2026 17:34, Ard Biesheuvel wrote:
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

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  arch/arm64/kernel/vmlinux.lds.S | 5 +++++
>  arch/arm64/mm/fixmap.c          | 7 ++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index e1ac876200a3..2dca18574619 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -353,6 +353,11 @@ SECTIONS
>  	__pi___bss_start = __bss_start;
>  
>  	. = ALIGN(PAGE_SIZE);
> +	.fixmap_pgdir : {
> +		__fixmap_pgdir_start = .;
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

