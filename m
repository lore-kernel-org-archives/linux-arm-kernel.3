Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EE8E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asmkcQ/wm3Cy/mGLGCDAAH8u4aCdWeg/YQWDuNgYpK8=; b=TDbDQPkfHTk/vktfyY6ydP9PBM
	s+thjSKddApt3giTpse2g5bmXrAYAEA72NbnT3FIInZZRoK8v2iGUPBQI0NOJHrxLYvBOkDMVkhec
	yNTiH5iZQLiP3cnNPJv+vOHGL2wVELgUhPv+M/RrOFHguXDuoCj56kYbDBUgz10KO/er03tF+ZLLX
	ko5Byu8vwVe/hgbkMlzsq7f4HMuSW9Oxy1MPHmuk4PqG9xozX85JxdJI2JSpW2bCQ00VcRrMXRGrJ
	T6cu4joeWfYyguuwIMIyUHh5/nUsEpFwpgDIYVJG++a3mH1H8e+EXSvYTXL9oA6Jat08cuFjxozWL
	iovQbB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdmd-00000007yeH-3eiB;
	Mon, 09 Dec 2024 13:26:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdeZ-00000007w7z-2HGe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC15E5C5BBB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Dec 2024 13:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3898AC4CEE0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Dec 2024 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733750302;
	bh=IKpdyTxaL6MHQtXFHVt4rKA2u0Wimp9puiY3v89GaLE=;
	h=References:In-Reply-To:From:Date:Subject:Cc:From;
	b=b0MC7bdicccUdWj4HvtRFAm3v5BODcJAsqXp0HjMaRSaCz+m+lqx0XGgwCLyMmZYx
	 3PCIMg6FrdiyHC8agM3Hy62Z3813iP5O1Cd2d5F7BAgjIHyP17HBrPRNAN5xHM7QKp
	 hk+1lIbY6V3fPwotjtUj45r8aZBZ0p47kl1M/AARpk+qrHyon4SmFoPLKx9yXNmh3Z
	 8yuDqp/zV3o/2BHH1DrD92IbgObnTWjxzq+EW67ZTJDbCWSgcLC9wIGXXF2RpH5VXF
	 sUeBETRieXkd0JMj121y64BUa7/Zzap4Yc62kzzeMroJ1gEden+8AdYsq7aBEKokFG
	 pjP3TPVrdKuZA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3022c6155edso2747581fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 05:18:22 -0800 (PST)
X-Gm-Message-State: AOJu0YwzJcZkFB0G8Pk4GXRhXFKW3TTTL3xZ4Fz+6U+seIr4TCbR38/s
	Fa13AECca9amwxbL+9gl60BwRWhEJSHvYSCZNTA+cjCu8jJo/hjgbyGB4wfGjK3I7+IdTgPBkZG
	/qf06k2NChu9dDxrOp4edQ2OMFwA=
X-Received: by 2002:a05:651c:19a9:b0:300:33b1:f0e2 with SMTP id
 38308e7fff4ca-3022fb3859emt1236341fa.3.1733750300533; Mon, 09 Dec 2024
 05:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20241205150229.3510177-8-ardb+git@google.com> <20241205150229.3510177-9-ardb+git@google.com>
In-Reply-To: <20241205150229.3510177-9-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 9 Dec 2024 14:18:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFUVS_TdQb_Q_ta1BfSMUnAtB7zJpxDDtkFX6Q3tiUtcA@mail.gmail.com>
Message-ID: <CAMj1kXFUVS_TdQb_Q_ta1BfSMUnAtB7zJpxDDtkFX6Q3tiUtcA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64/mm: Reduce PA space to 48 bits when LPA2 is
 not enabled
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_051823_673048_C72764D4 
X-CRM114-Status: GOOD (  26.64  )
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

On Thu, 5 Dec 2024 at 16:03, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Currently, LPA2 kernel support implies support for up to 52 bits of
> physical addressing, and this is reflected in global definitions such as
> PHYS_MASK_SHIFT and MAX_PHYSMEM_BITS.
>
> This is potentially problematic, given that LPA2 hardware support is
> modeled as a CPU feature which can be overridden, and with LPA2 hardware
> support turned off, attempting to map physical regions with address bits
> [51:48] set (which may exist on LPA2 capable systems booting with
> arm64.nolva) will result in corrupted mappings with a truncated output
> address and bogus shareability attributes.
>
> This means that the accepted physical address range in the mapping
> routines should be at most 48 bits wide when LPA2 support is configured
> but not enabled at runtime.
>
> Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable-hwdef.h | 6 ------
>  arch/arm64/include/asm/pgtable-prot.h  | 7 +++++++
>  arch/arm64/include/asm/sparsemem.h     | 4 +++-
>  3 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index c78a988cca93..a9136cc551cc 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -222,12 +222,6 @@
>   */
>  #define S1_TABLE_AP            (_AT(pmdval_t, 3) << 61)
>
> -/*
> - * Highest possible physical address supported.
> - */
> -#define PHYS_MASK_SHIFT                (CONFIG_ARM64_PA_BITS)
> -#define PHYS_MASK              ((UL(1) << PHYS_MASK_SHIFT) - 1)
> -
>  #define TTBR_CNP_BIT           (UL(1) << 0)
>
>  /*
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 9f9cf13bbd95..a95f1f77bb39 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -81,6 +81,7 @@ extern unsigned long prot_ns_shared;
>  #define lpa2_is_enabled()      false
>  #define PTE_MAYBE_SHARED       PTE_SHARED
>  #define PMD_MAYBE_SHARED       PMD_SECT_S
> +#define PHYS_MASK_SHIFT                (CONFIG_ARM64_PA_BITS)
>  #else
>  static inline bool __pure lpa2_is_enabled(void)
>  {
> @@ -89,8 +90,14 @@ static inline bool __pure lpa2_is_enabled(void)
>
>  #define PTE_MAYBE_SHARED       (lpa2_is_enabled() ? 0 : PTE_SHARED)
>  #define PMD_MAYBE_SHARED       (lpa2_is_enabled() ? 0 : PMD_SECT_S)
> +#define PHYS_MASK_SHIFT                (lpa2_is_enabled() ? CONFIG_ARM64_PA_BITS : 48)
>  #endif
>
> +/*
> + * Highest possible physical address supported.
> + */
> +#define PHYS_MASK              ((UL(1) << PHYS_MASK_SHIFT) - 1)
> +
>  /*
>   * If we have userspace only BTI we don't want to mark kernel pages
>   * guarded even if the system does support BTI.
> diff --git a/arch/arm64/include/asm/sparsemem.h b/arch/arm64/include/asm/sparsemem.h
> index 8a8acc220371..035e0ca74e88 100644
> --- a/arch/arm64/include/asm/sparsemem.h
> +++ b/arch/arm64/include/asm/sparsemem.h
> @@ -5,7 +5,9 @@
>  #ifndef __ASM_SPARSEMEM_H
>  #define __ASM_SPARSEMEM_H
>
> -#define MAX_PHYSMEM_BITS       CONFIG_ARM64_PA_BITS
> +#include <asm/pgtable-prot.h>
> +
> +#define MAX_PHYSMEM_BITS       PHYS_MASK_SHIFT
>

This needs

--- a/arch/arm64/include/asm/sparsemem.h
+++ b/arch/arm64/include/asm/sparsemem.h
@@ -7,7 +7,8 @@

 #include <asm/pgtable-prot.h>

-#define MAX_PHYSMEM_BITS       PHYS_MASK_SHIFT
+#define MAX_PHYSMEM_BITS               PHYS_MASK_SHIFT
+#define MAX_POSSIBLE_PHYSMEM_BITS      (52)

 /*
  * Section size must be at least 512MB for 64K base

applied on top to make the ZSMALLOC code happy.

