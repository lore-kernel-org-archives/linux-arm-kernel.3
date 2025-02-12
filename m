Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB717C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYT8AXeHwSuOZw0yu7hG8Ej/uv+EEusdL0gi3kC7KOg=; b=VhX6OU7TH0ou2ApXg3ANXAcc5r
	4d1AfqHMv5FrTvg0HPH57k4rPraGL46cmvoKU1/DmdIhxUSpcVWddDEHiQmC5YKoMZ6jUzw+abjK4
	+pISbaFyMFs+JwH4JYkbAq9MvurKOFgVtdED9XvCoJtdYJElGDlZHHfY5uot5TA5vN73j2k258t61
	CQ6r2IBv5jSV0sKJFTrGOrIlELxD3NgDNI/mC4xia09H/CtKzbyw6fxY4H4lLEqRS4O2TNL6Atknu
	cLir5TADjPhC5ndVBDWRMPXxxuO18cJDeFMFbcOyKX9T4wDGkHN6t2hbq8D8EjObU9G5RZ4oRxoqY
	5ukP6qvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGPp-00000008IJK-1rGv;
	Wed, 12 Feb 2025 17:20:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGH5-00000008FuJ-4BXu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38FCFA40118;
	Wed, 12 Feb 2025 17:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F24C4CEDF;
	Wed, 12 Feb 2025 17:11:40 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:11:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
Message-ID: <Z6zWSXzKctkpyH7-@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209024257.3618492-5-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_091148_620470_B2228F11 
X-CRM114-Status: GOOD (  22.90  )
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

On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> Currently, many scenarios that can tolerate memory errors when copying page
> have been supported in the kernel[1~5], all of which are implemented by
> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> 
> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> 
> Add new helper copy_mc_page() which provide a page copy implementation with
> hardware memory error safe. The code logic of copy_mc_page() is the same as
> copy_page(), the main difference is that the ldp insn of copy_mc_page()
> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> main logic is extracted to copy_page_template.S. In addition, the fixup of
> MOPS insn is not considered at present.

Could we not add the exception table entry permanently but ignore the
exception table entry if it's not on the do_sea() path? That would save
some code duplication.

> diff --git a/arch/arm64/lib/copy_mc_page.S b/arch/arm64/lib/copy_mc_page.S
> new file mode 100644
> index 000000000000..51564828c30c
> --- /dev/null
> +++ b/arch/arm64/lib/copy_mc_page.S
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <linux/const.h>
> +#include <asm/assembler.h>
> +#include <asm/page.h>
> +#include <asm/cpufeature.h>
> +#include <asm/alternative.h>
> +#include <asm/asm-extable.h>
> +#include <asm/asm-uaccess.h>
> +
> +/*
> + * Copy a page from src to dest (both are page aligned) with memory error safe
> + *
> + * Parameters:
> + *	x0 - dest
> + *	x1 - src
> + * Returns:
> + * 	x0 - Return 0 if copy success, or -EFAULT if anything goes wrong
> + *	     while copying.
> + */
> +	.macro ldp1 reg1, reg2, ptr, val
> +	KERNEL_MEM_ERR(9998f, ldp \reg1, \reg2, [\ptr, \val])
> +	.endm
> +
> +SYM_FUNC_START(__pi_copy_mc_page)
> +#include "copy_page_template.S"
> +
> +	mov x0, #0
> +	ret
> +
> +9998:	mov x0, #-EFAULT
> +	ret
> +
> +SYM_FUNC_END(__pi_copy_mc_page)
> +SYM_FUNC_ALIAS(copy_mc_page, __pi_copy_mc_page)
> +EXPORT_SYMBOL(copy_mc_page)
[...]
> diff --git a/arch/arm64/lib/copy_page_template.S b/arch/arm64/lib/copy_page_template.S
> new file mode 100644
> index 000000000000..f96c7988c93d
> --- /dev/null
> +++ b/arch/arm64/lib/copy_page_template.S
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + */
> +
> +/*
> + * Copy a page from src to dest (both are page aligned)
> + *
> + * Parameters:
> + *	x0 - dest
> + *	x1 - src
> + */
> +
> +#ifdef CONFIG_AS_HAS_MOPS
> +	.arch_extension mops
> +alternative_if_not ARM64_HAS_MOPS
> +	b	.Lno_mops
> +alternative_else_nop_endif
> +
> +	mov	x2, #PAGE_SIZE
> +	cpypwn	[x0]!, [x1]!, x2!
> +	cpymwn	[x0]!, [x1]!, x2!
> +	cpyewn	[x0]!, [x1]!, x2!
> +	ret
> +.Lno_mops:
> +#endif
[...]

So if we have FEAT_MOPS, the machine check won't work?

Kristina is going to post MOPS support for the uaccess routines soon.
You can see how they are wired up and do something similar here.

But I'd prefer if we had the same code, only the exception table entry
treated differently. Similarly for the MTE tag copying.

-- 
Catalin

