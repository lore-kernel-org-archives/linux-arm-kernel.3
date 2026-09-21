Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14804C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7znNeXgHNQuMnlCx6KpxREHOt8qDXTTPWARfe0tBfo=; b=lHiEGPGfYTWHPwqsZwI7/nsNzv
	7tXS1p3gOD4XednB2QXOK7KWsJBZ5Z7DQW/VXetFFdsysIdq8VXC5us6pNToNP68lU7By/sa2xSgn
	dfIb/yghAaF3K1bfgLjM+BprrsV+nmSf/ioWE4G5Ac4wwoW0oGS47lKH4Igs2yFij85JaWJD4dBhG
	TX15PGByF3qpRtWdaTLLoJJDJtCDCeao7OYxUCS5Q61zmu97rOQQ2Zz1aTC2lBBtTKwHMbDWFI8Wk
	jE1ambK+f3SK6SfuQyVXiNBcdMAM0HMfodCDAx3IE9ELQq8Dw/NcWSWjZQ6zgE29wI903UiO23T84
	OO5lQAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YwW-00000001Hu0-2kIJ;
	Mon, 21 Sep 2026 08:00:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YwT-00000001Hta-1i2L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:00:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D9E7143D;
	Mon, 21 Sep 2026 00:59:56 -0700 (PDT)
Received: from [10.57.83.12] (unknown [10.57.83.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC76C3F86F;
	Mon, 21 Sep 2026 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789977599; bh=uRgzAnJkCmIi+snQIbSmkHF+wLnwLOyY5X1yVPOvLlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oOow57TiAT2tB/NkK8hmGQp1DapcKPuzLjk1RccTkIyvjhT+W62/wiLiQQhfRtFKc
	 4KXMyKWVtD0nlgizdDb0ZyrNReJpgNSJDCbQsOVPjvF3xkgEDDT/Lgpbx6mFtal5hX
	 fPGGW5nNp3gYVFvgixCsuIVC77t3fq9WFJPKKwuc=
Message-ID: <3e3e8b33-cf24-4b09-a64c-f9b2bbe604e7@arm.com>
Date: Mon, 21 Sep 2026 08:59:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: use hw_pte_t for HW PTE pointers
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
 <20260914-pte0_arm-v1-1-bb53b663e396@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260914-pte0_arm-v1-1-bb53b663e396@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_010001_558351_B6D1119D 
X-CRM114-Status: GOOD (  19.55  )
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

On 14/09/2026 14:51, Muhammad Usama Anjum wrote:
> With pte_t * used for HW PTE pointers, the compiler cannot distinguish
> them from SW PTE value pointers. The generic HW PTE interfaces already
> use hw_pte_t *, so arm64 HW PTE pointers must use that type before
> ARCH_HAS_HW_PTE_T can make it distinct.
> 
> Convert HW PTE pointers to hw_pte_t *, retaining pte_t for SW PTE
> values. Helpers shared with PMD and PUD operations keep explicit casts
> because this series does not introduce distinct entry types for those
> levels.
> 
> arm64 still uses the hw_pte_t alias in this patch. The new pointer
> spelling therefore denotes the same type until the final opt-in.
> 
> Include linux/pgtable_types.h in pi.h to make hw_pte_t visible.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  arch/arm64/include/asm/hugetlb.h  |  19 ++---
>  arch/arm64/include/asm/pgalloc.h  |   2 +-
>  arch/arm64/include/asm/pgtable.h  | 143 ++++++++++++++++++++------------------
>  arch/arm64/include/asm/vmalloc.h  |   2 +-
>  arch/arm64/kernel/efi.c           |   3 +-
>  arch/arm64/kernel/pi/map_kernel.c |   4 +-
>  arch/arm64/kernel/pi/map_range.c  |   9 +--
>  arch/arm64/kernel/pi/pi.h         |   3 +-
>  arch/arm64/mm/contpte.c           |  49 +++++++------
>  arch/arm64/mm/fault.c             |   5 +-
>  arch/arm64/mm/fixmap.c            |   6 +-
>  arch/arm64/mm/hugetlbpage.c       |  48 +++++++------
>  arch/arm64/mm/kasan_init.c        |   4 +-
>  arch/arm64/mm/mmu.c               |  46 +++++++-----
>  arch/arm64/mm/pageattr.c          |   4 +-
>  arch/arm64/mm/trans_pgd.c         |   4 +-
>  16 files changed, 190 insertions(+), 161 deletions(-)
> 

[...]

> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index f66a0016dd02d..237a9136bc73b 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -35,7 +35,7 @@ static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
>  static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
>  static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
>  
> -static inline pte_t *fixmap_pte(unsigned long addr)
> +static inline hw_pte_t *fixmap_pte(unsigned long addr)
>  {
>  	return &bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];

How does this work, given you haven't yet converted bm_pte? You're returning a
pte_t* where you need a hw_pte_t*. Either the compiler is implicitly converting
(which would defeat the whole purpose of this series) or this patch doesn't
compile until you convert bm_pte later on (which I suspect is more likely).

>  }
> @@ -43,7 +43,7 @@ static inline pte_t *fixmap_pte(unsigned long addr)
>  static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
>  {
>  	pmd_t pmd = READ_ONCE(*pmdp);
> -	pte_t *ptep;
> +	hw_pte_t *ptep;
>  
>  	if (pmd_none(pmd)) {
>  		ptep = bm_pte[BM_PTE_TABLE_IDX(addr)];

Same problem here?

Thanks,
Ryan


