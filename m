Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276D2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv2bhPZva6gHXHw0NJH39PcDZGk29eqJhi4KHNncWvk=; b=oCY3LGAqSpjAniZuQFT4TThlTP
	A5PYMWHbZ5SMWw/FGREOVbW3Sl4C0V4Odff/E39UQ5VmAb95aKg/GU9MwA8YNlP2QTmpde5cvfPsW
	2tkvbEw8UY8/6aPB13hvmoILdh0VE5Dg2vJW7KsgbwOq4R4pS3waNbmxDIZLoxdS5c7MGp1Zfgvln
	QmfocY0k+TwQDcdMMU3Ei/N2VTqMhBcJNCr/VP/SPpv9gYTH8rMtLowXuGQSLivexH2KYJJJGjkta
	izOesJyAB0xwpvItl/1nwOpopsa3BHNRziJmMkSN33vHpASumv+2pAXE53EfxBuS6Z5guGpsqLqz/
	bJvK8rQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSJl-0000000DSPJ-2bPK;
	Fri, 07 Mar 2025 07:40:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSI7-0000000DSDP-1joI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 07:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95186A4553D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Mar 2025 07:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EECC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Mar 2025 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741333121;
	bh=WdtsW8w1jhMytWly8LCgYy5ZNoNyxkZv/YmFxZpcA6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GgnKYnOVWM6PnosKS3kGLhHqDc/TaZlRBV7NHXVYgb3Pt7DSdo2SktcQlQG2jrVeX
	 uiDT6h3/H++4AWehxTrPQLJ81EwyG5fkXH+LnDdzwpTokEeIi5GIz/bTWs+1gT1Znk
	 NY+22F98dio+4jbNZHwfKKPzt1eIob7wxl9zP1NBtNxc/OdlpzKgJmqd9ZN+8/7Sht
	 VtOdcPxp9Pq/egwVZmKJfXxSspx2NwgcDCmqKCvLB7GvPR96BeQvl9txJW09LgK07/
	 SMikoiOvB0vW1XaNE9pFY0dlh4NGu/TuWUSI3wJC7pvdsqJWZdIexggG9azm6DjpJy
	 y2EtmplHqzYLA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30ba92c846eso14145121fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 23:38:41 -0800 (PST)
X-Gm-Message-State: AOJu0YxlRXjLU18CzRkQ3qvn+YeBSJ71n9WjD6dCFJIqFyzDhaYggbsh
	m9jENFgqMvpvRq3KxKbb3CjKdNRXjxLzgJ0S9FA5zyHQfI6yKs2AsUHfu1Yws2ahSeLbW7S0gsJ
	IxxCukC+D62DcbDi+qPLI0eKRNA8=
X-Google-Smtp-Source: AGHT+IFbUQTds1cU+CA0Sm9N3ulGm4P4drIOSs85mNYjaLaNb//GZ5QL810vXtvFWi6vd4jxzPNHW2wO1PCy7PD1XBY=
X-Received: by 2002:a05:6512:3a84:b0:549:4e7b:dcf7 with SMTP id
 2adb3069b0e04-54990e2bc5fmr933581e87.3.1741333119619; Thu, 06 Mar 2025
 23:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20250307050851.4034393-1-anshuman.khandual@arm.com>
In-Reply-To: <20250307050851.4034393-1-anshuman.khandual@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 7 Mar 2025 08:38:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFufE9UPGMsqv1ARWm6SyUCcJL+m4F4mWa0jCyhJqf2Jg@mail.gmail.com>
X-Gm-Features: AQ5f1JriIKmYESFhu_hdqeBJJ4pUmzhqZbcCfIaI5Z54kn_AuewlUh9N2EpQZFI
Message-ID: <CAMj1kXFufE9UPGMsqv1ARWm6SyUCcJL+m4F4mWa0jCyhJqf2Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Define PTE_SHIFT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_233843_631472_0827E416 
X-CRM114-Status: GOOD (  31.36  )
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

Hi Anshuman,

On Fri, 7 Mar 2025 at 06:09, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> Address bytes shifted with a single 64 bit page table entry (any page table
> level) has been always hard coded as 3 (aka 2^3 = 8). Although intuitive it
> is not very readable or easy to reason about. Besides it is going to change
> with D128, where each 128 bit page table entry will shift address bytes by
> 4 (aka 2^4 = 16) instead.
>
> Let's just formalise this address bytes shift value into a new macro called
> PTE_SHIFT establishing a logical abstraction, thus improving readability as
> well. This does not cause any functional change.
>

I don't disagree with this goal, but PTE_SHIFT is really not the right
name. Given that PMD_SHIFT is the log2 of the area covered by a PMD,
PTE_SHIFT should be the log2 of the area covered by a PTE, and so
defining it to anything other than PAGE_SHIFT would be a mistake IMO.

Given that we are talking about the log2 of the size of the area
occupied by a descriptor, perhaps {PT}DESC_SIZE_ORDER would be a
better name?




> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kasan-dev@googlegroups.com
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.14-rc5
>
>  arch/arm64/Kconfig                      |  2 +-
>  arch/arm64/include/asm/kernel-pgtable.h |  3 ++-
>  arch/arm64/include/asm/pgtable-hwdef.h  | 26 +++++++++++++------------
>  arch/arm64/kernel/pi/map_range.c        |  2 +-
>  arch/arm64/mm/kasan_init.c              |  6 +++---
>  5 files changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 940343beb3d4..fd3303f2ccda 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -323,7 +323,7 @@ config ARCH_MMAP_RND_BITS_MIN
>         default 18
>
>  # max bits determined by the following formula:
> -#  VA_BITS - PAGE_SHIFT - 3
> +#  VA_BITS - PAGE_SHIFT - PTE_SHIFT
>  config ARCH_MMAP_RND_BITS_MAX
>         default 19 if ARM64_VA_BITS=36
>         default 24 if ARM64_VA_BITS=39
> diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
> index fd5a08450b12..7150a7a10f00 100644
> --- a/arch/arm64/include/asm/kernel-pgtable.h
> +++ b/arch/arm64/include/asm/kernel-pgtable.h
> @@ -49,7 +49,8 @@
>         (SPAN_NR_ENTRIES(vstart, vend, shift) + (add))
>
>  #define EARLY_LEVEL(lvl, lvls, vstart, vend, add)      \
> -       (lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * (PAGE_SHIFT - 3), add) : 0)
> +       (lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + \
> +       lvl * (PAGE_SHIFT - PTE_SHIFT), add) : 0)
>
>  #define EARLY_PAGES(lvls, vstart, vend, add) (1        /* PGDIR page */                                \
>         + EARLY_LEVEL(3, (lvls), (vstart), (vend), add) /* each entry needs a next level page table */  \
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index a9136cc551cc..43f98eac7653 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -7,40 +7,42 @@
>
>  #include <asm/memory.h>
>
> +#define PTE_SHIFT 3
> +
>  /*
>   * Number of page-table levels required to address 'va_bits' wide
>   * address, without section mapping. We resolve the top (va_bits - PAGE_SHIFT)
> - * bits with (PAGE_SHIFT - 3) bits at each page table level. Hence:
> + * bits with (PAGE_SHIFT - PTE_SHIFT) bits at each page table level. Hence:
>   *
> - *  levels = DIV_ROUND_UP((va_bits - PAGE_SHIFT), (PAGE_SHIFT - 3))
> + *  levels = DIV_ROUND_UP((va_bits - PAGE_SHIFT), (PAGE_SHIFT - PTE_SHIFT))
>   *
>   * where DIV_ROUND_UP(n, d) => (((n) + (d) - 1) / (d))
>   *
>   * We cannot include linux/kernel.h which defines DIV_ROUND_UP here
>   * due to build issues. So we open code DIV_ROUND_UP here:
>   *
> - *     ((((va_bits) - PAGE_SHIFT) + (PAGE_SHIFT - 3) - 1) / (PAGE_SHIFT - 3))
> + *     ((((va_bits) - PAGE_SHIFT) + (PAGE_SHIFT - PTE_SHIFT) - 1) / (PAGE_SHIFT - PTE_SHIFT))
>   *
>   * which gets simplified as :
>   */
> -#define ARM64_HW_PGTABLE_LEVELS(va_bits) (((va_bits) - 4) / (PAGE_SHIFT - 3))
> +#define ARM64_HW_PGTABLE_LEVELS(va_bits) (((va_bits) - PTE_SHIFT - 1) / (PAGE_SHIFT - PTE_SHIFT))
>
>  /*
>   * Size mapped by an entry at level n ( -1 <= n <= 3)
> - * We map (PAGE_SHIFT - 3) at all translation levels and PAGE_SHIFT bits
> + * We map (PAGE_SHIFT - PTE_SHIFT) at all translation levels and PAGE_SHIFT bits
>   * in the final page. The maximum number of translation levels supported by
>   * the architecture is 5. Hence, starting at level n, we have further
>   * ((4 - n) - 1) levels of translation excluding the offset within the page.
>   * So, the total number of bits mapped by an entry at level n is :
>   *
> - *  ((4 - n) - 1) * (PAGE_SHIFT - 3) + PAGE_SHIFT
> + *  ((4 - n) - 1) * (PAGE_SHIFT - PTE_SHIFT) + PAGE_SHIFT
>   *
>   * Rearranging it a bit we get :
> - *   (4 - n) * (PAGE_SHIFT - 3) + 3
> + *   (4 - n) * (PAGE_SHIFT - PTE_SHIFT) + PTE_SHIFT
>   */
> -#define ARM64_HW_PGTABLE_LEVEL_SHIFT(n)        ((PAGE_SHIFT - 3) * (4 - (n)) + 3)
> +#define ARM64_HW_PGTABLE_LEVEL_SHIFT(n)        ((PAGE_SHIFT - PTE_SHIFT) * (4 - (n)) + PTE_SHIFT)
>
> -#define PTRS_PER_PTE           (1 << (PAGE_SHIFT - 3))
> +#define PTRS_PER_PTE           (1 << (PAGE_SHIFT - PTE_SHIFT))
>
>  /*
>   * PMD_SHIFT determines the size a level 2 page table entry can map.
> @@ -49,7 +51,7 @@
>  #define PMD_SHIFT              ARM64_HW_PGTABLE_LEVEL_SHIFT(2)
>  #define PMD_SIZE               (_AC(1, UL) << PMD_SHIFT)
>  #define PMD_MASK               (~(PMD_SIZE-1))
> -#define PTRS_PER_PMD           (1 << (PAGE_SHIFT - 3))
> +#define PTRS_PER_PMD           (1 << (PAGE_SHIFT - PTE_SHIFT))
>  #endif
>
>  /*
> @@ -59,14 +61,14 @@
>  #define PUD_SHIFT              ARM64_HW_PGTABLE_LEVEL_SHIFT(1)
>  #define PUD_SIZE               (_AC(1, UL) << PUD_SHIFT)
>  #define PUD_MASK               (~(PUD_SIZE-1))
> -#define PTRS_PER_PUD           (1 << (PAGE_SHIFT - 3))
> +#define PTRS_PER_PUD           (1 << (PAGE_SHIFT - PTE_SHIFT))
>  #endif
>
>  #if CONFIG_PGTABLE_LEVELS > 4
>  #define P4D_SHIFT              ARM64_HW_PGTABLE_LEVEL_SHIFT(0)
>  #define P4D_SIZE               (_AC(1, UL) << P4D_SHIFT)
>  #define P4D_MASK               (~(P4D_SIZE-1))
> -#define PTRS_PER_P4D           (1 << (PAGE_SHIFT - 3))
> +#define PTRS_PER_P4D           (1 << (PAGE_SHIFT - PTE_SHIFT))
>  #endif
>
>  /*
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 2b69e3beeef8..3530a5427f57 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -31,7 +31,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>  {
>         u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 : U64_MAX;
>         pteval_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
> -       int lshift = (3 - level) * (PAGE_SHIFT - 3);
> +       int lshift = (3 - level) * (PAGE_SHIFT - PTE_SHIFT);
>         u64 lmask = (PAGE_SIZE << lshift) - 1;
>
>         start   &= PAGE_MASK;
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index b65a29440a0c..90548079b42e 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -190,7 +190,7 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
>   */
>  static bool __init root_level_aligned(u64 addr)
>  {
> -       int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 1) * (PAGE_SHIFT - 3);
> +       int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 1) * (PAGE_SHIFT - PTE_SHIFT);
>
>         return (addr % (PAGE_SIZE << shift)) == 0;
>  }
> @@ -245,7 +245,7 @@ static int __init root_level_idx(u64 addr)
>          */
>         u64 vabits = IS_ENABLED(CONFIG_ARM64_64K_PAGES) ? VA_BITS
>                                                         : vabits_actual;
> -       int shift = (ARM64_HW_PGTABLE_LEVELS(vabits) - 1) * (PAGE_SHIFT - 3);
> +       int shift = (ARM64_HW_PGTABLE_LEVELS(vabits) - 1) * (PAGE_SHIFT - PTE_SHIFT);
>
>         return (addr & ~_PAGE_OFFSET(vabits)) >> (shift + PAGE_SHIFT);
>  }
> @@ -269,7 +269,7 @@ static void __init clone_next_level(u64 addr, pgd_t *tmp_pg_dir, pud_t *pud)
>   */
>  static int __init next_level_idx(u64 addr)
>  {
> -       int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 2) * (PAGE_SHIFT - 3);
> +       int shift = (ARM64_HW_PGTABLE_LEVELS(vabits_actual) - 2) * (PAGE_SHIFT - PTE_SHIFT);
>
>         return (addr >> (shift + PAGE_SHIFT)) % PTRS_PER_PTE;
>  }
> --
> 2.30.2
>

