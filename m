Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39C5C369AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eu5NUNbQVNqdSmKdZEpdlRzsSURWP2fgVScBGBwoik=; b=e417GkRODziauan/cREfHiE3VO
	ynigXTZb2lM1E+gv/WZEinkXnUp2rBNibj4jMcPTUGc0wHCucjn5dlUr1ngO6atjeRyCgVWnqX9pJ
	Mgqkni6TC38A+k51Q0FEH2XFkcQaM8FNAAszrXIhr/8y5GQZEqq41JtfWLnM8dihDpyY3WOgxo/GQ
	c8ubnKVw2Z+CynksSEQs77FnI99FjWev3kuQj3eec0L/JtACLPT0juwzA/eDNwWvZHSsvMxTEZ+9X
	BsW76LtAi77FrGTvPMnAi7zdW6sOf7TqtX7KI1DW32E3e0dSYrJf2KWlIS4k5FzNBVPsX0Om5XLM/
	XE0GpUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r5U-0000000AVY9-32lk;
	Thu, 10 Apr 2025 12:32:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r1Y-0000000AUuz-0stb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B48BA4A7D3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 12:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94E8C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744288130;
	bh=iEhF+6QmLMHUflVLwYD9cgRRfXhpcFOE6WZAlFOppwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G5of8+wlTS4I2n7QLMKGq8q5/sanyZ8PjAYjH9/Wk3uyAz/0rIAbkyJWGCuXcaOIk
	 qmeItDsLQs5slG301DkJTl/3eQY0L5bMOx/ZtaW2IVLXByx1QNgQX8XqOnStE3OlPg
	 +BW1lq9quTp+zKRrFi1WP+scywb6iOv2KYxR+3SUQxU5qHPIifBy6UYIMCbGzsGb+i
	 EX7gjtyIRALZl2q5eDqYgYuDQ/aQX/cLVNpoZbN0jCeM3PzHN80JXbBYwo7lBtFN3r
	 jTA0+Em62XEqdF91XYEUk5XTfAQBWBhbEtBmFQSRtkYctY1YlPv0gWLD4IvS9PD/O9
	 Jd3px9bkz+xNg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54ac9d57173so2038160e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 05:28:50 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzp8A3btyhUTcJHK7TxaeNszYZI8PeZz2TUW9mMuDB+eRvEz0Dy
	CuEdxHwCCcFNwltHt45KtbGpJDkrQw47DuKIhlcLrc+7Q9ZgI2xDMTTbjPTW/S+QWfucAgIQOZ2
	pXQgtsvoMnvn+PVv5++F+pu+VuDI=
X-Google-Smtp-Source: AGHT+IEk6+pEv1KhjsN+b2LVfZiOU1+lMkalIlqJouC1Hrv7mXEHGQrdk/bizME+BN/G20yuxVH9e+ceAqLyXH7BawM=
X-Received: by 2002:a05:6512:10d5:b0:549:90ac:cca2 with SMTP id
 2adb3069b0e04-54ce2cb7f96mr912096e87.1.1744288129259; Thu, 10 Apr 2025
 05:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
In-Reply-To: <20250410074024.1545768-1-anshuman.khandual@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 10 Apr 2025 14:28:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGn71CGqXCN2mWokZuq37bbEtnOKkrB=_dddp0dyPTndw@mail.gmail.com>
X-Gm-Features: ATxdqUHgOJV_vjYP4l3C17rNPu2Dtq-En5ozAQwkRwj8d_BpPMRORfCZolLuaaI
Message-ID: <CAMj1kXGn71CGqXCN2mWokZuq37bbEtnOKkrB=_dddp0dyPTndw@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_052852_379631_BA361135 
X-CRM114-Status: GOOD (  23.21  )
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

On Thu, 10 Apr 2025 at 09:40, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> required for D128 page tables.

Could you elaborate?

> Fix this problem via first loading up these
> macro constants into a given memory location and then subsequently setting
> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>

If this is necessary, we could also remove the PTE_MAYBE_xx override hack no?

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc1
>
>  arch/arm64/kernel/head.S         | 3 +++
>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>  arch/arm64/kernel/pi/pi.h        | 1 +
>  arch/arm64/mm/mmu.c              | 1 +
>  arch/arm64/mm/proc.S             | 5 +++--
>  5 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 2ce73525de2c..4950d9cc638a 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>          * On return, the CPU will be ready for the MMU to be turned on and
>          * the TCR will have been set.
>          */
> +       adr_l   x0, pir_data
> +       bl      __pi_load_pir_data
> +
>         bl      __cpu_setup                     // initialise processor
>         b       __primary_switch
>  SYM_CODE_END(primary_entry)
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 81345f68f9fc..cd9d24e73046 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -103,3 +103,9 @@ asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
>
>         return ptep;
>  }
> +
> +asmlinkage void __init load_pir_data(u64 pir_data[])
> +{
> +       pir_data[0] = PIE_E0;
> +       pir_data[1] = PIE_E1;
> +}
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index c91e5e965cd3..ae61df4fdb77 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -34,3 +34,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>  asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
>
>  asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
> +asmlinkage void load_pir_data(u64 pir_data[]);
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..762e81ff4e85 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -58,6 +58,7 @@ static bool rodata_is_rw __ro_after_init = true;
>   * with MMU turned off.
>   */
>  long __section(".mmuoff.data.write") __early_cpu_boot_status;
> +unsigned long __section(".mmuoff.data.write") pir_data[2];
>
>  /*
>   * Empty_zero_page is a special page that is used for zero-initialized data
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index fb30c8804f87..7dd28cf101c2 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -524,9 +524,10 @@ alternative_else_nop_endif
>  #define PTE_MAYBE_NG           0
>  #define PTE_MAYBE_SHARED       0
>
> -       mov_q   x0, PIE_E0
> +       adr_l   x1, pir_data
> +       ldr     x0, [x1, #0]
>         msr     REG_PIRE0_EL1, x0
> -       mov_q   x0, PIE_E1
> +       ldr     x0, [x1, #8]
>         msr     REG_PIR_EL1, x0
>
>  #undef PTE_MAYBE_NG
> --
> 2.25.1
>

