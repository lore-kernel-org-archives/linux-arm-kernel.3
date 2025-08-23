Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4042DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 22:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhKK60gWO6BrmrBPGObik3lUBLuk9EYf+E73fTQXjzo=; b=r0MWLqx0Og0WUjko5iWiR/ce21
	MQl6RAbHB9GxCEtEfNnwz2EIo/ZO6wJYNHx8UCSE+q8FIuYFXzLQ8XZw1j8dgni/g1Fh80RnzfGgu
	avMUltn+DCc17+afQWJDijtG07Rwr5gKPcQkCYlDLdZIaR+dbCaXIwhVpTv1KQkeT0tt4w1qme5Aw
	44JPglnePp8rpksobiuJ12VIxOBTYiBOfghBa9vGXE/VZCkxXV0zTarkeYgzpNIR59sB5jUlGhzx2
	DWjLGjDHwj5jkSZDMWrmPAdhBIbR+6MjqSbzygbcq1nb0Sr3Kjpt4WsSoMS71ixNa5o6n+OUc6Bi6
	B4TQ+K9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upwj1-00000005KEm-0HiV;
	Sat, 23 Aug 2025 22:28:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upwgM-00000005K8u-2LVI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 22:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FE2144B7D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 22:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E98C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755987952;
	bh=o4tfWUnrvWW45XkZjNc1uODnZaubDv7GA3aKCYWJF4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EW5gCCJTK7w2G0x+G3zywZXedzHj9/qQI1rjhYF+wvNvopXKT7P6FrAkAuFi8cKmj
	 I8lTL32lfQ1nqgO2elnEwFep+tvlWkgW9UKFfD4dS9yXpxgdG1G8jVF0JZI3girzc2
	 MeIT2aesP36eC+S/Z1eSvm1YW7ebomNsH4l71ZUldiy+VOABv4pjqsr/A5zJYwI5HS
	 XJlIgElipnkM9PuxuJlRJNNKwJl34n6/PwfEDiorLfkAUbxNJvt7UJawH3gCyEDzr9
	 TAQA6OlARepjOpflztscbknBTiySWrM7ZSlzOxgyzp5GwK5xLmJz3RB9eyNW1sUBbC
	 fa0AsZsHGo/Aw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f3ec52a42so420272e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 15:25:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2KSaCqKT85NhVkeGaVftX1oY9U8XWqHWwt3BhGjVCgADWCeU96klYfhcPzFBTZK+dDVzRAjvdmNwYrJo6RydN@lists.infradead.org
X-Gm-Message-State: AOJu0YyoCCBtO3jxgYQnNFOec6J5sGV+9iFCOGWP+CSiBfphdDAYKA2r
	8CzERBdIBiU1FeBCkILYINKDLD98/y4IhuB5RUhESM6ltT+tWqzMfAn4IzKJRA3nVg2e9l6OcxU
	1VdzMDW1DtdkRDT9lMjMuhI/qLZcwppo=
X-Google-Smtp-Source: AGHT+IEAJZ5I9jytEZddwlocNfvIS6Y8INNTtScihMjxLZcdUP+pDu2NWjNEprTyR8UYHe48zmc40UAAKEbPmo50WKc=
X-Received: by 2002:a05:6512:6284:b0:55a:5122:91ea with SMTP id
 2adb3069b0e04-55f0ccce7e5mr2161677e87.34.1755987950359; Sat, 23 Aug 2025
 15:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041526.467434-1-CFSworks@gmail.com>
In-Reply-To: <20250822041526.467434-1-CFSworks@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 24 Aug 2025 08:25:39 +1000
X-Gmail-Original-Message-ID: <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
X-Gm-Features: Ac12FXx4h-esqmUyLXFQpc9yLkNC9WcNoc6ief3rZx4PjW95nKGNarPk-LBLvw8
Message-ID: <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
To: Sam Edwards <cfsworks@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Baruch Siach <baruch@tkos.co.il>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_152554_642536_2338EAA7 
X-CRM114-Status: GOOD (  30.64  )
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

Hi Sam,

On Fri, 22 Aug 2025 at 14:15, Sam Edwards <cfsworks@gmail.com> wrote:
>
> In early boot, Linux creates identity virtual->physical address mappings
> so that it can enable the MMU before full memory management is ready.
> To ensure some available physical memory to back these structures,
> vmlinux.lds reserves some space (and defines marker symbols) in the
> middle of the kernel image. However, because they are defined outside of
> PROGBITS sections, they aren't pre-initialized -- at least as far as ELF
> is concerned.
>
> In the typical case, this isn't actually a problem: the boot image is
> prepared with objcopy, which zero-fills the gaps, so these structures
> are incidentally zero-initialized (an all-zeroes entry is considered
> absent, so zero-initialization is appropriate).
>
> However, that is just a happy accident: the `vmlinux` ELF output
> authoritatively represents the state of memory at entry. If the ELF
> says a region of memory isn't initialized, we must treat it as
> uninitialized. Indeed, certain bootloaders (e.g. Broadcom CFE) ingest
> the ELF directly -- sidestepping the objcopy-produced image entirely --
> and therefore do not initialize the gaps. This results in the early boot
> code crashing when it attempts to create identity mappings.
>
> Therefore, add boot-time zero-initialization for the following:
> - __pi_init_idmap_pg_dir..__pi_init_idmap_pg_end
> - idmap_pg_dir
> - reserved_pg_dir

I don't think this is the right approach.

If the ELF representation is inaccurate, it should be fixed, and this
should be achievable without impacting the binary image at all.

> - tramp_pg_dir # Already done, but this patch corrects the size
>

What is wrong with the size?

> Note, swapper_pg_dir is already initialized (by copy from idmap_pg_dir)
> before use, so this patch does not need to address it.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---
>  arch/arm64/kernel/head.S | 12 ++++++++++++
>  arch/arm64/mm/mmu.c      |  3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index ca04b338cb0d..0c3be11d0006 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -86,6 +86,18 @@ SYM_CODE_START(primary_entry)
>         bl      record_mmu_state
>         bl      preserve_boot_args
>
> +       adrp    x0, reserved_pg_dir
> +       add     x1, x0, #PAGE_SIZE
> +0:     str     xzr, [x0], 8
> +       cmp     x0, x1
> +       b.lo    0b
> +
> +       adrp    x0, __pi_init_idmap_pg_dir
> +       adrp    x1, __pi_init_idmap_pg_end
> +1:     str     xzr, [x0], 8
> +       cmp     x0, x1
> +       b.lo    1b
> +
>         adrp    x1, early_init_stack
>         mov     sp, x1
>         mov     x29, xzr
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 34e5d78af076..aaf823565a65 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -761,7 +761,7 @@ static int __init map_entry_trampoline(void)
>         pgprot_val(prot) &= ~PTE_NG;
>
>         /* Map only the text into the trampoline page table */
> -       memset(tramp_pg_dir, 0, PGD_SIZE);
> +       memset(tramp_pg_dir, 0, PAGE_SIZE);
>         __create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
>                              entry_tramp_text_size(), prot,
>                              pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
> @@ -806,6 +806,7 @@ static void __init create_idmap(void)
>         u64 end   = __pa_symbol(__idmap_text_end);
>         u64 ptep  = __pa_symbol(idmap_ptes);
>
> +       memset(idmap_pg_dir, 0, PAGE_SIZE);
>         __pi_map_range(&ptep, start, end, start, PAGE_KERNEL_ROX,
>                        IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>                        __phys_to_virt(ptep) - ptep);
> --
> 2.49.1
>

