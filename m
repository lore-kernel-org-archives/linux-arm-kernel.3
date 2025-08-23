Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEE7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 00:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBWpk9pMFHao0No417vuFErr71wabiTatKoA7g+XDV0=; b=CfkfWVppjUc/hIPYBHSAlBA1/8
	I80Qf8RHHwXaoH2L/I+DgKb/g0vb5VbED9/hxFvzlLpUPxOGqKaGY2XMCr+aJrsciAltNM7FTAAQW
	hdQL1tkJTdHo785vu65aavx1aoJrTg4Dt7sjj28IqxwEvwmdtTvGLv6aURB2+giF18NtvQAAEuvsK
	tBB6rGfczmspJYcd4VTVzpT/6Ce2anS+TqTINZAvUiDXbEymnMOh0wZjali8OG78o7ULpKvfBc46o
	R/HHKT0g//53mjn5Nt00mRhBE0oJrcwLa7nxjynofSuA6isyVQqG20WUloAlIf975uV0eGPhBbGPv
	KGYhaHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upyAq-00000005TSW-0hoQ;
	Sun, 24 Aug 2025 00:01:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upy7G-00000005TAn-0Qmq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 23:57:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c763484ccdso415806f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 16:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755993464; x=1756598264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBWpk9pMFHao0No417vuFErr71wabiTatKoA7g+XDV0=;
        b=kU2MIRDk27DG9GGo4W0N19Yz8JeLq/WDrPwW3sa34RX66+1yRoR0QnmUi9jM26qXWB
         rdIAcPDogzvc7mtNeJV9flrk3GwEPLkOyEWTH57SbmpnuoI8znNnN+9rZIkeGghvczYP
         MEaf6XLGRb/wTdHFtSWkq3fQwbNd4TzgBqgbSPGHt7zkSj/MnsOffDBottKrxZmxyVyR
         W7eAdnCdC6jBNXTJG4xb9VgIkiT70Nwy3mjwxYB8LDBVh95B6700PkcAZiEz4msbbMNt
         LJIEk/2/V8QW2j4LMhFcqH364Vz8PDU7i8jitngEvoG59IeBP+UZr2GjMVFJo9BLkc7c
         7vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755993464; x=1756598264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBWpk9pMFHao0No417vuFErr71wabiTatKoA7g+XDV0=;
        b=uzXUEXpB1TKQf8tZ+KrUQf8704e3Uh52SZmjSy8tmEdTswf9RG8oYq+dFTSiSlB9Me
         i3+QD2EtH35S7ZkdM8OVmk85wk0T1urlOhBOmIL2nUffpFZN8P2DbbdO/quCXj2VW2yX
         yEwTfRxP6tqcfCzuVxIFDURm8ANYOvCXNNVv+1A9Hkvmcnm3uiEdGgLO5QgCk3TTZkuV
         zhMR4Icg5jtHEgoiohm0uWAhoK1jtK+9p9xGNmSW45NbYivXNG1DU5m3DRD8oLljqQ17
         GS+rxHl4KNanMXH3uY4rk5X8M083SiKRAYh5uA4161tiMPG0nN6mqQ7PdP4MSqqfPX68
         mudA==
X-Forwarded-Encrypted: i=1; AJvYcCW0iLmpmZm4mCJzLV+kP6KjP2i8YSEOEPCgTFvA7urMvrdQUU6z5rofVh62qJVauOI9HHvr2Ysn2DR8IN8jyh0U@lists.infradead.org
X-Gm-Message-State: AOJu0YzQgJM0ff7PcDIYieTN1XFFAkXsnPajAHGxYyTuVVInrE5A1Lip
	nEp/hyu63NNLXUnviJwjkQBjY26S8Ne/ObsKCM5L12zOIOfHFn0AMkeCFef8vPpOx8HfMJzx+Bj
	E3lHQwogCaApNeAa7azv7YOq0tGLkIEQ=
X-Gm-Gg: ASbGncv7ijIiwHSjRG97XQUbfm8ULmNwaoC8End/dGri0MiAeGzQH+8YOaUp0JJ0Ku0
	vRsEdnJhFHIR9Dc3gFwNSbwo7he0IhPVIDc3xKMdUqEYWY/OXqOze7jnfPptGNNVFO+jKrp0hOP
	bYeIfJnx1/ppyOM4uIg3AGCGnrmpI3rGG18LJ2xlB+VunNVJ2ZSMcDm+IPHHO7hQtMHouUGjD29
	yO9Wn4lc5Gzj7FgvBaDT+WmEacPtFIo1roJMpymu3amggt2MMx121S173NQXkBhcnJS2N/8
X-Google-Smtp-Source: AGHT+IFhc1jFZKivVpya3fI65qV0tE23a94OokTjPmFW6yC9nw0tHu2XPxdVBbt2o30eV+v4k6RZOzXJ8kN4RTgDs2E=
X-Received: by 2002:a05:6000:2382:b0:3c7:9b1b:e28f with SMTP id
 ffacd0b85a97d-3c79b1be80emr2333564f8f.21.1755993464377; Sat, 23 Aug 2025
 16:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041538.467514-1-CFSworks@gmail.com> <20250822041538.467514-4-CFSworks@gmail.com>
In-Reply-To: <20250822041538.467514-4-CFSworks@gmail.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sat, 23 Aug 2025 16:57:33 -0700
X-Gm-Features: Ac12FXyQwqcUP-Y4py5hdYIVFsjstDj9Mv1n8N0f45wLrnmAeiZZw0lCwsMGrF8
Message-ID: <CAH5Ym4gOV_BJYuMgt+FgRE0WKJ9udnubv=Opw02hb14SGKTUow@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: mm: Represent physical memory with phys_addr_t
 and resource_size_t
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_165746_147868_D7CBEF38 
X-CRM114-Status: GOOD (  34.11  )
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

On Thu, Aug 21, 2025 at 9:19=E2=80=AFPM Sam Edwards <cfsworks@gmail.com> wr=
ote:
>
> This is a type-correctness cleanup to MMU/boot code that replaces
> several instances of void * and u64 with phys_addr_t (to represent
> addresses) and resource_size_t (to represent sizes) to emphasize that
> the code in question concerns physical memory specifically.
>
> The rationale for this change is to improve clarity and readability in
> a few modules that handle both types (physical and virtual) of address
> and differentiation is essential.
>
> I have left u64 in cases where the address may be either physical or
> virtual, where the address is exclusively virtual but used in heavy
> pointer arithmetic, and in cases I may have overlooked. I do not
> necessarily consider u64 the ideal type in those situations, but it
> avoids breaking existing semantics in this cleanup.
>
> This patch provably has no effect at runtime: I have verified that
> .text of vmlinux is identical after this change.
>
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---
>  arch/arm64/kernel/pi/map_kernel.c | 26 +++++++++++++-------------
>  arch/arm64/kernel/pi/map_range.c  | 20 ++++++++++++--------
>  arch/arm64/kernel/pi/pi.h         |  9 +++++----
>  arch/arm64/mm/init.c              |  6 +++---
>  arch/arm64/mm/mmu.c               | 17 +++++++++--------
>  5 files changed, 42 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map=
_kernel.c
> index 5dc4107b5a7f..deb15074d289 100644
> --- a/arch/arm64/kernel/pi/map_kernel.c
> +++ b/arch/arm64/kernel/pi/map_kernel.c
> @@ -18,9 +18,9 @@
>
>  extern const u8 __eh_frame_start[], __eh_frame_end[];
>
> -extern void idmap_cpu_replace_ttbr1(void *pgdir);
> +extern void idmap_cpu_replace_ttbr1(phys_addr_t pgdir);
>
> -static void __init map_segment(pgd_t *pg_dir, u64 *pgd, u64 va_offset,
> +static void __init map_segment(pgd_t *pg_dir, phys_addr_t *pgd, u64 va_o=
ffset,
>                                void *start, void *end, pgprot_t prot,
>                                bool may_use_cont, int root_level)
>  {
> @@ -40,7 +40,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_=
offset, int root_level)
>  {
>         bool enable_scs =3D IS_ENABLED(CONFIG_UNWIND_PATCH_PAC_INTO_SCS);
>         bool twopass =3D IS_ENABLED(CONFIG_RELOCATABLE);
> -       u64 pgdp =3D (u64)init_pg_dir + PAGE_SIZE;
> +       phys_addr_t pgdp =3D (phys_addr_t)init_pg_dir + PAGE_SIZE;
>         pgprot_t text_prot =3D PAGE_KERNEL_ROX;
>         pgprot_t data_prot =3D PAGE_KERNEL;
>         pgprot_t prot;
> @@ -90,7 +90,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_=
offset, int root_level)
>                     true, root_level);
>         dsb(ishst);
>
> -       idmap_cpu_replace_ttbr1(init_pg_dir);
> +       idmap_cpu_replace_ttbr1((phys_addr_t)init_pg_dir);
>
>         if (twopass) {
>                 if (IS_ENABLED(CONFIG_RELOCATABLE))
> @@ -129,10 +129,10 @@ static void __init map_kernel(u64 kaslr_offset, u64=
 va_offset, int root_level)
>         /* Copy the root page table to its final location */
>         memcpy((void *)swapper_pg_dir + va_offset, init_pg_dir, PAGE_SIZE=
);
>         dsb(ishst);
> -       idmap_cpu_replace_ttbr1(swapper_pg_dir);
> +       idmap_cpu_replace_ttbr1((phys_addr_t)swapper_pg_dir);
>  }
>
> -static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttb=
r)
> +static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(phys_ad=
dr_t ttbr)
>  {
>         u64 sctlr =3D read_sysreg(sctlr_el1);
>         u64 tcr =3D read_sysreg(tcr_el1) | TCR_DS;
> @@ -172,7 +172,7 @@ static void __init remap_idmap_for_lpa2(void)
>          */
>         create_init_idmap(init_pg_dir, mask);
>         dsb(ishst);
> -       set_ttbr0_for_lpa2((u64)init_pg_dir);
> +       set_ttbr0_for_lpa2((phys_addr_t)init_pg_dir);
>
>         /*
>          * Recreate the initial ID map with the same granularity as befor=
e.
> @@ -185,17 +185,17 @@ static void __init remap_idmap_for_lpa2(void)
>         dsb(ishst);
>
>         /* switch back to the updated initial ID map */
> -       set_ttbr0_for_lpa2((u64)init_idmap_pg_dir);
> +       set_ttbr0_for_lpa2((phys_addr_t)init_idmap_pg_dir);
>
>         /* wipe the temporary ID map from memory */
>         memset(init_pg_dir, 0, (char *)init_pg_end - (char *)init_pg_dir)=
;
>  }
>
> -static void *__init map_fdt(u64 fdt)
> +static void *__init map_fdt(phys_addr_t fdt)
>  {
>         static u8 ptes[INIT_IDMAP_FDT_SIZE] __initdata __aligned(PAGE_SIZ=
E);
> -       u64 efdt =3D fdt + MAX_FDT_SIZE;
> -       u64 ptep =3D (u64)ptes;
> +       phys_addr_t efdt =3D fdt + MAX_FDT_SIZE;
> +       phys_addr_t ptep =3D (phys_addr_t)ptes; /* Stack is idmapped */

This comment is inaccurate: `ptes` is static. I've noted this to fix in V2.

>
>         /*
>          * Map up to MAX_FDT_SIZE bytes, but avoid overlap with
> @@ -232,7 +232,7 @@ static bool __init ng_mappings_allowed(void)
>         return true;
>  }
>
> -asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
> +asmlinkage void __init early_map_kernel(u64 boot_status, phys_addr_t fdt=
)
>  {
>         static char const chosen_str[] __initconst =3D "/chosen";
>         u64 va_base, pa_base =3D (u64)&_text;
> @@ -240,7 +240,7 @@ asmlinkage void __init early_map_kernel(u64 boot_stat=
us, void *fdt)
>         int root_level =3D 4 - CONFIG_PGTABLE_LEVELS;
>         int va_bits =3D VA_BITS;
>         int chosen;
> -       void *fdt_mapped =3D map_fdt((u64)fdt);
> +       void *fdt_mapped =3D map_fdt(fdt);
>
>         /* Clear BSS and the initial page tables */
>         memset(__bss_start, 0, (char *)init_pg_end - (char *)__bss_start)=
;
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_=
range.c
> index 7982788e7b9a..de52cd85c691 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -26,8 +26,9 @@
>   * @va_offset:         Offset between a physical page and its current ma=
pping
>   *                     in the VA space
>   */
> -void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t pro=
t,
> -                     int level, pte_t *tbl, bool may_use_cont, u64 va_of=
fset)
> +void __init map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t =
pa,
> +                     pgprot_t prot, int level, pte_t *tbl, bool may_use_=
cont,
> +                     u64 va_offset)
>  {
>         u64 cmask =3D (level =3D=3D 3) ? CONT_PTE_SIZE - 1 : U64_MAX;
>         ptdesc_t protval =3D pgprot_val(prot) & ~PTE_TYPE_MASK;
> @@ -87,19 +88,22 @@ void __init map_range(u64 *pte, u64 start, u64 end, u=
64 pa, pgprot_t prot,
>         }
>  }
>
> -asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, ptdesc_t clrmask)
> +asmlinkage phys_addr_t __init create_init_idmap(pgd_t *pg_dir, ptdesc_t =
clrmask)
>  {
> -       u64 ptep =3D (u64)pg_dir + PAGE_SIZE;
> +       phys_addr_t ptep =3D (phys_addr_t)pg_dir + PAGE_SIZE; /* MMU is o=
ff */
>         pgprot_t text_prot =3D PAGE_KERNEL_ROX;
>         pgprot_t data_prot =3D PAGE_KERNEL;
>
>         pgprot_val(text_prot) &=3D ~clrmask;
>         pgprot_val(data_prot) &=3D ~clrmask;
>
> -       map_range(&ptep, (u64)_stext, (u64)__initdata_begin, (u64)_stext,
> -                 text_prot, IDMAP_ROOT_LEVEL, (pte_t *)pg_dir, false, 0)=
;
> -       map_range(&ptep, (u64)__initdata_begin, (u64)_end, (u64)__initdat=
a_begin,
> -                 data_prot, IDMAP_ROOT_LEVEL, (pte_t *)pg_dir, false, 0)=
;
> +       /* MMU is off; pointer casts to phys_addr_t are safe */
> +       map_range(&ptep, (u64)_stext, (u64)__initdata_begin,
> +                 (phys_addr_t)_stext, text_prot, IDMAP_ROOT_LEVEL,
> +                 (pte_t *)pg_dir, false, 0);
> +       map_range(&ptep, (u64)__initdata_begin, (u64)_end,
> +                 (phys_addr_t)__initdata_begin, data_prot, IDMAP_ROOT_LE=
VEL,
> +                 (pte_t *)pg_dir, false, 0);
>
>         return ptep;
>  }
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index 46cafee7829f..08ef9f80456b 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -29,9 +29,10 @@ u64 kaslr_early_init(void *fdt, int chosen);
>  void relocate_kernel(u64 offset);
>  int scs_patch(const u8 eh_frame[], int size);
>
> -void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
> -              int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
> +void map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa,
> +              pgprot_t prot, int level, pte_t *tbl, bool may_use_cont,
> +              u64 va_offset);
>
> -asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
> +asmlinkage void early_map_kernel(u64 boot_status, phys_addr_t fdt);
>
> -asmlinkage u64 create_init_idmap(pgd_t *pgd, ptdesc_t clrmask);
> +asmlinkage phys_addr_t create_init_idmap(pgd_t *pgd, ptdesc_t clrmask);
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index ea84a61ed508..70c2ca813c18 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -243,7 +243,7 @@ void __init arm64_memblock_init(void)
>          */
>         if (memory_limit !=3D PHYS_ADDR_MAX) {
>                 memblock_mem_limit_remove_map(memory_limit);
> -               memblock_add(__pa_symbol(_text), (u64)(_end - _text));
> +               memblock_add(__pa_symbol(_text), (resource_size_t)(_end -=
 _text));
>         }
>
>         if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
> @@ -252,8 +252,8 @@ void __init arm64_memblock_init(void)
>                  * initrd to become inaccessible via the linear mapping.
>                  * Otherwise, this is a no-op
>                  */
> -               u64 base =3D phys_initrd_start & PAGE_MASK;
> -               u64 size =3D PAGE_ALIGN(phys_initrd_start + phys_initrd_s=
ize) - base;
> +               phys_addr_t base =3D phys_initrd_start & PAGE_MASK;
> +               resource_size_t size =3D PAGE_ALIGN(phys_initrd_start + p=
hys_initrd_size) - base;
>
>                 /*
>                  * We can only add back the initrd memory if we don't end=
 up
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 34e5d78af076..de463040582c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -794,17 +794,18 @@ static void __init declare_kernel_vmas(void)
>         declare_vma(&vmlinux_seg[4], _data, _end, 0);
>  }
>
> -void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
> -                   int level, pte_t *tbl, bool may_use_cont, u64 va_offs=
et);
> +void __pi_map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa=
,
> +                   pgprot_t prot, int level, pte_t *tbl, bool may_use_co=
nt,
> +                   u64 va_offset);
>
>  static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) _=
_ro_after_init,
>           kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __r=
o_after_init;
>
>  static void __init create_idmap(void)
>  {
> -       u64 start =3D __pa_symbol(__idmap_text_start);
> -       u64 end   =3D __pa_symbol(__idmap_text_end);
> -       u64 ptep  =3D __pa_symbol(idmap_ptes);
> +       phys_addr_t start =3D __pa_symbol(__idmap_text_start);
> +       phys_addr_t end   =3D __pa_symbol(__idmap_text_end);
> +       phys_addr_t ptep  =3D __pa_symbol(idmap_ptes);
>
>         __pi_map_range(&ptep, start, end, start, PAGE_KERNEL_ROX,
>                        IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
> @@ -812,7 +813,7 @@ static void __init create_idmap(void)
>
>         if (IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0) && !arm64_use_ng_mappi=
ngs) {
>                 extern u32 __idmap_kpti_flag;
> -               u64 pa =3D __pa_symbol(&__idmap_kpti_flag);
> +               phys_addr_t pa =3D __pa_symbol(&__idmap_kpti_flag);
>
>                 /*
>                  * The KPTI G-to-nG conversion code needs a read-write ma=
pping
> @@ -1331,8 +1332,8 @@ static void __remove_pgd_mapping(pgd_t *pgdir, unsi=
gned long start, u64 size)
>  struct range arch_get_mappable_range(void)
>  {
>         struct range mhp_range;
> -       u64 start_linear_pa =3D __pa(_PAGE_OFFSET(vabits_actual));
> -       u64 end_linear_pa =3D __pa(PAGE_END - 1);
> +       phys_addr_t start_linear_pa =3D __pa(_PAGE_OFFSET(vabits_actual))=
;
> +       phys_addr_t end_linear_pa =3D __pa(PAGE_END - 1);
>
>         if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>                 /*
> --
> 2.49.1
>

