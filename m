Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB69CC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPchf2uBHwNZKqG9XiRJ4TOmAbmoLNRq/6Bv0pr0qjM=; b=Ke3bjqXd4OikxKRewHi90hxhDG
	GxHZGS5Xos7tBGtqbUd3yRXWteBlxcTaCHa7iO0BW7gZgem7LvZv++M3/PP0SSqJT2AckkVHxKS9W
	XYlXNHfxWtXikWsOpx84U/3lLtcDB9di2hTSt+dyI0fvdYmY59o3OQ7Qjo79EtgVqw8wuuYf+EMnP
	XhZno1NLe9YBcqPuZ3ventgWMW7GYSGB3a87YP5M6pDUUi3RYOhTek/+ZAyIISG9REoEHOt7CyNTA
	f08T42sylc7juLkPVEGykEg2C8XKSU4/I040GIkHP14yb5kme7Wlkzjvjol0lrrwL1q4sdIQbTO8R
	eMpZZATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rZL-00000009adb-3bMs;
	Wed, 16 Sep 2026 15:29:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rZG-00000009abg-3Hb0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:29:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3DEE1516;
	Wed, 16 Sep 2026 08:28:57 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (unknown [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70DD63F86F;
	Wed, 16 Sep 2026 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789572541; bh=Tk/oV1RDmp/CGIbATSgjssjZIrJAg5EVOITLC/Nolfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RZmFFjdhnLqMIN4dSvn7FZPHQA3OYgOox//NEWGvj3m63GKde+702yDG6Mk6ZIZAM
	 ESxtcIPsTFG1fJ8KlRL6UUDCYDjWFplj713Hz1Uk8bsZ/jGCd/zZYnYE8ATyIO9HXd
	 84XZMcJiKc3Mm1Leg7x9KLFB0iyF2JPO50bpuBv4=
From: Leonardo Bras <leo.bras@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH v2] arm64: clear_page[s] using memset
Date: Wed, 16 Sep 2026 16:28:51 +0100
Message-ID: <aqq1sxdQNZ93oV9A@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082902_906381_D2CC2C3C 
X-CRM114-Status: GOOD (  30.24  )
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

On Wed, Sep 16, 2026 at 12:03:56PM +0200, Linus Walleij wrote:
> There is no need to try to second-guess the compiler when
> clearing memory. Just call memset() like everyone else.
> 
> Since memset() already has an architecture-local MOPS
> optimization, we do not need to do anything else to preserve
> the MOPS optimization.
> 
> While at it, implement the shorthand for directly calling
> the new prototype clear_pages() for larger page chunks.
> 
> No performance regressions can be seen, the fastpath
> benchmarks differences are in the noise.
> 
> Usama Anjum tested next-20260821 with one warm-up and three repeats
> in four sessions, for a total of 12 measured runs. The commands were:
> 
>   perf bench mem memset -k 1GB -f default -s 16GB
>   perf bench mem mmap -p 1GB -f demand -s 32GB -l 5
>   perf bench mem mmap -p 4KB -f demand -s 32GB -l 5
> 
> The results were:
> 
> aws-m7g.metal:
>   Benchmark    Base bytes/sec   Change with patch
>   memset 1GB   63932542232.12                1.92%
>   mmap 1GB     63272579168.03               -0.57%
>   mmap 4KB     49692830849.48               -1.11%
> 
> cesw-aarch64-ampereone-1s-a192-32x:
>   Benchmark    Base bytes/sec   Change with patch
>   memset 1GB   33895562998.71                0.25%
>   mmap 1GB     34338454210.17                1.16%
>   mmap 4KB     25687107580.90               -0.85%
> 
> Assisted-by: LLM
> Suggested-by: Will Deacon <will@kernel.org>
> Tested-by: Usama Anjum <usama.anjum@arm.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20260303-aarch64-clear-pages-v1-1-ad0c3ee9a555@kernel.org/
> Link: https://lore.kernel.org/linux-arm-kernel/67ab6c51-4511-46ab-931b-a4323551147a@arm.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - Rebased on v7.3-rc1
> - Include Usama Anjum's performance results and Tested-by tag.
> - Link to v1: https://lore.kernel.org/r/20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org
> ---
>  arch/arm64/include/asm/page.h    | 13 +++++++++-
>  arch/arm64/kernel/image-vars.h   |  1 -
>  arch/arm64/kvm/hyp/nvhe/Makefile |  2 +-
>  arch/arm64/lib/Makefile          |  2 +-
>  arch/arm64/lib/clear_page.S      | 53 ----------------------------------------
>  5 files changed, 14 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> index 58200de8a221..b2eaa63d9056 100644
> --- a/arch/arm64/include/asm/page.h
> +++ b/arch/arm64/include/asm/page.h
> @@ -13,6 +13,7 @@
>  #ifndef __ASSEMBLER__
>  
>  #include <linux/personality.h> /* for READ_IMPLIES_EXEC */
> +#include <linux/string.h> /* for memset() */
>  #include <linux/types.h> /* for gfp_t */
>  #include <asm/pgtable-types.h>
>  
> @@ -20,7 +21,17 @@ struct page;
>  struct vm_area_struct;
>  
>  extern void copy_page(void *to, const void *from);
> -extern void clear_page(void *to);
> +
> +static inline void clear_pages(void *addr, unsigned int npages)
> +{
> +	memset(addr, 0, npages * PAGE_SIZE);
> +}
> +#define clear_pages clear_pages
> +
> +static inline void clear_page(void *addr)
> +{
> +	clear_pages(addr, 1);
> +}
>  
>  void copy_user_highpage(struct page *to, struct page *from,
>  			unsigned long vaddr, struct vm_area_struct *vma);
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 14beb7b9d304..facda8137d9b 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -119,7 +119,6 @@ KVM_NVHE_ALIAS(__start___kvm_ex_table);
>  KVM_NVHE_ALIAS(__stop___kvm_ex_table);
>  
>  /* Position-independent library routines */
> -KVM_NVHE_ALIAS_HYP(clear_page, __pi_clear_page);
>  KVM_NVHE_ALIAS_HYP(copy_page, __pi_copy_page);
>  KVM_NVHE_ALIAS_HYP(memcpy, __pi_memcpy);
>  KVM_NVHE_ALIAS_HYP(memset, __pi_memset);
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index f57450ebcb49..2ed489bf544e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -17,7 +17,7 @@ ccflags-y += -fno-stack-protector	\
>  hostprogs := gen-hyprel
>  HOST_EXTRACFLAGS += -I$(objtree)/include
>  
> -lib-objs := clear_page.o copy_page.o memcpy.o memset.o tishift.o
> +lib-objs := copy_page.o memcpy.o memset.o tishift.o
>  lib-objs := $(addprefix ../../../lib/, $(lib-objs))
>  
>  CFLAGS_switch.nvhe.o += -Wno-override-init
> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> index b33e1ca4a781..38ffd359123c 100644
> --- a/arch/arm64/lib/Makefile
> +++ b/arch/arm64/lib/Makefile
> @@ -5,7 +5,7 @@ KCSAN_SANITIZE_delay.o := n
>  
>  lib-y		:= clear_user.o delay.o copy_from_user.o		\
>  		   copy_to_user.o copy_page.o				\
> -		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
> +		   csum.o insn.o memchr.o memcpy.o			\
>  		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
>  		   strnlen.o strchr.o strrchr.o tishift.o
>  
> diff --git a/arch/arm64/lib/clear_page.S b/arch/arm64/lib/clear_page.S
> deleted file mode 100644
> index bd6f7d5eb6eb..000000000000
> --- a/arch/arm64/lib/clear_page.S
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2012 ARM Ltd.
> - */
> -
> -#include <linux/linkage.h>
> -#include <linux/const.h>
> -#include <asm/assembler.h>
> -#include <asm/page.h>
> -
> -/*
> - * Clear page @dest
> - *
> - * Parameters:
> - *	x0 - dest
> - */
> -SYM_FUNC_START(__pi_clear_page)
> -#ifdef CONFIG_AS_HAS_MOPS
> -	.arch_extension mops
> -alternative_if_not ARM64_HAS_MOPS
> -	b	.Lno_mops
> -alternative_else_nop_endif
> -
> -	mov	x1, #PAGE_SIZE
> -	setpn	[x0]!, x1!, xzr
> -	setmn	[x0]!, x1!, xzr
> -	seten	[x0]!, x1!, xzr
> -	ret
> -.Lno_mops:
> -#endif
> -	mrs	x1, dczid_el0
> -	tbnz	x1, #4, 2f	/* Branch if DC ZVA is prohibited */
> -	and	w1, w1, #0xf
> -	mov	x2, #4
> -	lsl	x1, x2, x1
> -
> -1:	dc	zva, x0
> -	add	x0, x0, x1
> -	tst	x0, #(PAGE_SIZE - 1)
> -	b.ne	1b
> -	ret
> -
> -2:	stnp	xzr, xzr, [x0]
> -	stnp	xzr, xzr, [x0, #16]
> -	stnp	xzr, xzr, [x0, #32]
> -	stnp	xzr, xzr, [x0, #48]
> -	add	x0, x0, #64
> -	tst	x0, #(PAGE_SIZE - 1)
> -	b.ne	2b
> -	ret
> -SYM_FUNC_END(__pi_clear_page)
> -SYM_FUNC_ALIAS(clear_page, __pi_clear_page)
> -EXPORT_SYMBOL(clear_page)
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260305-aarch64-clear-pages-c-590dae98c333
> 
> Best regards,
> --  
> Linus Walleij <linusw@kernel.org>
> 
> 

Oh, cool!
You remove an in-kernel asm implementation to favor the standard memset(), 
which allows you to also have a batched clear_pages() version, which should 
also be a bit more optimized than the do-while loop running clear_page().

Last thing I would check is if there is any particular part of the current 
clear_page() that could have different behavior than the one in memset(), 
and if it would cause any kind of unexpected impact. 

Looking on that, I see that the memset() implementation uses setp, setm, 
sete, while the clear_page()'s uses setpn, setmn, setn for the case with 
MOPS. But then, reading into the docs, the instructions seem pretty much 
the same thing. 

The arguments seem the same idea, exept for clear_page() always being xzr 
instead of the memset value in xn, but should be the same thing.

The generic (no-MOPS) version is very different, though, which is expected 
as the purpose of clean_page() is a particular case of memset(). Was any 
test ran in machines without FEAT_MOPS?

Thanks!
Leo

