Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391ECCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZozcvEVmd2/Ia9jfGxVX87NHO5pAfULXrlh/BIC7RXA=; b=3M6fFggnH9Y43KBGR99kyDUBsA
	ULXmG7pWFFeHu7SGHIQGaD7k9uPGEqOKiMLv2kaY0GCbaUDLxuumrlN0v1Kcv4ftv8MUkdj/VCk89
	9iUWXlwmB/pJhEsW6sd90giZ/GIg+1s56GCbvD1jJPS3ZQo43r9qU+T0Tr1ad/iBYpsFzKLVdpnL8
	50jD4+3qAgrp0cgoluSydgW9vYYjOcaxg8OthNiJYyGdkv74p227+pj38DLgZRKEM+mGBg3u1MxJ+
	MYQOiqE8tE/aLnQf4m/GIUzFfYwR5Y4Dy1muI9OrPeTseg+/tNZHf90oI8R/dfT4X8mSSBuiO4Vfv
	l7PHKBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9jv-000000078hE-1r43;
	Sat, 30 Aug 2025 00:46:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1Vk-00000006KRa-2AXT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0147B45618
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 15:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CC7C4CEF9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756483170;
	bh=Agff60TXGLwvmuEaw2NavACUa3icjRtY009OwnBqb4M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XG10N3Q8tpMLS1Hcq1C/IzmUogL+ESq8V6vOyyQggn/Ird8T3VNm80D62LLqrKiME
	 JMGdOj3kAyZUutbtdfBq+ZK2rx2BQgK7dkz1daJ+poNcAoNpzhXzSH/OcwRmeG11Le
	 rcu2lziavXlgs2aErjUCoi9qvYl4CtYYFKoGG+q+aWLQWRH7pO3qEZFGumVNzCLSF1
	 i97MpiwfFW5cyUGIgmKM38Qpzlxm+6sSCC/1Hgk91Bul1x6R5UhITing3z4WReRoc/
	 LwvJAciyRr02Q7tikYlIWGrpdjBAddV3AhPB9HKXM6fRsTui3POIHPDQ2fCyELyBOy
	 1+ex7pPJ5exPQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so732723e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuMGxRP09z4uFTyuMBdEkYuE38ZpNozboId3H4FryASa+DPsTP0DPT8xNUkniAnxH3irjR1BFEzf5WDmua3exS@lists.infradead.org
X-Gm-Message-State: AOJu0YzJcYs3iGT031ISUymL+ZOa+wl9kp4zyEMoFGEX9u7ug1rUMAqr
	6zYTz6QkR+QgMh0kWwQGzTTQ6p5DfUaG9qXi/I6lm3fTo5lD9Rneq0eITlM5rSVhvT0nGUsgB2S
	79rYcLvQ3hozO1rc0W6Z/obrYK4R9Rqo=
X-Google-Smtp-Source: AGHT+IE2uJmqErNpiUH2MoiCA7htuRpojl7+qvai6M2fJo7xfFtC2Vhb8xTNG066MqaQxG+wtoJn5sGv94PkmkI03TM=
X-Received: by 2002:a05:6512:140d:b0:55f:6c72:b727 with SMTP id
 2adb3069b0e04-55f6c72ba9bmr358005e87.24.1756483169155; Fri, 29 Aug 2025
 08:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250829154913.work.943-kees@kernel.org>
In-Reply-To: <20250829154913.work.943-kees@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 29 Aug 2025 17:59:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEs5BiRo89FwnWfW1uR6d=F9yVw0dFb76Yt5Pyq8VtDWw@mail.gmail.com>
X-Gm-Features: Ac12FXzpjI0zTRoPfVkJGHhj0T6dAsq8Q5pBhlrd4fqSaz1jVC1vYe7nT4JL8S4
Message-ID: <CAMj1kXEs5BiRo89FwnWfW1uR6d=F9yVw0dFb76Yt5Pyq8VtDWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
 function signature
To: Kees Cook <kees@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Yue Haibing <yuehaibing@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Ryan Roberts <ryan.roberts@arm.com>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, James Morse <james.morse@arm.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
	Andrew Morton <akpm@linux-foundation.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	David Hildenbrand <david@redhat.com>, Zhenhua Huang <quic_zhenhuah@quicinc.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_085932_597279_0A1387BF 
X-CRM114-Status: GOOD (  24.22  )
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

On Fri, 29 Aug 2025 at 17:49, Kees Cook <kees@kernel.org> wrote:
>
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

Shouldn't this be

Fixes: c64f46ee1377 ("arm64: mm: use enum to identify pgtable level
instead of *_SHIFT")


> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


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
> +       TABLE_PTE,
> +       TABLE_PMD,
> +       TABLE_PUD,
> +       TABLE_P4D,
> +};
> +
>  typedef struct {
>         atomic64_t      id;
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
>                              phys_addr_t size, pgprot_t prot,
> -                            phys_addr_t (*pgtable_alloc)(int), int flags);
> +                            phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags);
>
>  static phys_addr_t __initdata kpti_ng_temp_alloc;
>
> -static phys_addr_t __init kpti_ng_pgd_alloc(int shift)
> +static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
>  {
>         kpti_ng_temp_alloc -= PAGE_SIZE;
>         return kpti_ng_temp_alloc;
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 34e5d78af076..183801520740 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -47,13 +47,6 @@
>  #define NO_CONT_MAPPINGS       BIT(1)
>  #define NO_EXEC_MAPPINGS       BIT(2)  /* assumes FEAT_HPDS is not used */
>
> -enum pgtable_type {
> -       TABLE_PTE,
> -       TABLE_PMD,
> -       TABLE_PUD,
> -       TABLE_P4D,
> -};
> -
>  u64 kimage_voffset __ro_after_init;
>  EXPORT_SYMBOL(kimage_voffset);
>
> --
> 2.34.1
>

