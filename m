Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5092EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7NWO4MaHzjzpRkAdjMECPXNWDOkrDG/YDPG0iv7Vnw=; b=MDGY/r2U/ES1GJRIfk7qHUs07W
	DGeytkdDrcU4MOAhGPKVv01a6DMjhhJxQUAHjcGLeLhckepGqdBYwIQ8uudFEnMJ9Hv/JV3M+Kndl
	MneaYlWzxsDj168bj686SE1A9HB/axVgB9la4GjlNVu6DG8VlGpoQ5lMKM16cVvGqh39hpIxf1uRj
	CjWIcuFo+++WBQNarjrwIRHXLyU2Aa+kEWw+RR231lXC/yB/abEIyaavy2pfdrv6y2T6LYYIC6TDh
	b9m3xA10uNrWXyVZFkfGF13zo+RDpyFtfxPKBi1iF7SWEa2vWtsPyRrSVPtHkStWCuOdaWMfyu9Vd
	saIgRoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVUU-00000000JSK-2iQQ;
	Mon, 23 Feb 2026 12:56:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVUR-00000000JRt-4AmK;
	Mon, 23 Feb 2026 12:56:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D8C6339;
	Mon, 23 Feb 2026 04:56:36 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C2103F62B;
	Mon, 23 Feb 2026 04:56:40 -0800 (PST)
Date: Mon, 23 Feb 2026 12:56:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZxOe_1XGX_gGOoK@J2N7QTR9R3>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220090922.1506-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_045644_166079_5451B167 
X-CRM114-Status: GOOD (  19.07  )
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

On Fri, Feb 20, 2026 at 05:09:22PM +0800, Jisheng Zhang wrote:
> Currently, on arm64 platforms, the handle_arch_irq is a pointer which
> is set during booting, and every irq processing needs to access it,
> so it sits in hot code path. We can use the runtime constant mechanism
> which was introduced by Linus to speed up its accessing.
> 
> Tested on Quad CA55 platform, the perf sched benchmark is improved
> by ~6.5%

That is a surprisingly large impact. :/

Does this meaningfully actually affect any real workload?

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 4 +++-
>  arch/arm64/kernel/irq.c          | 9 ++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 3625797e9ee8..46a4c012e15f 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -25,6 +25,7 @@
>  #include <asm/kprobes.h>
>  #include <asm/mmu.h>
>  #include <asm/processor.h>
> +#include <asm/runtime-const.h>
>  #include <asm/sdei.h>
>  #include <asm/stacktrace.h>
>  #include <asm/sysreg.h>
> @@ -139,7 +140,8 @@ static void do_interrupt_handler(struct pt_regs *regs,
>  	set_irq_regs(old_regs);
>  }
>  
> -extern void (*handle_arch_irq)(struct pt_regs *);
> +extern void (*_handle_arch_irq)(struct pt_regs *);
> +#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
>  extern void (*handle_arch_fiq)(struct pt_regs *);

We should treat handle_arch_irq and handle_arch_fiq the same way. Either
both get this, or neither do.

>  static void noinstr __panic_unhandled(struct pt_regs *regs, const char *vector,
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index 15dedb385b9e..30629c183606 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -23,6 +23,7 @@
>  #include <asm/daifflags.h>
>  #include <asm/exception.h>
>  #include <asm/numa.h>
> +#include <asm/runtime-const.h>
>  #include <asm/softirq_stack.h>
>  #include <asm/stacktrace.h>
>  #include <asm/vmap_stack.h>
> @@ -84,15 +85,17 @@ static void default_handle_fiq(struct pt_regs *regs)
>  	panic("FIQ taken without a root FIQ handler\n");
>  }
>  
> -void (*handle_arch_irq)(struct pt_regs *) __ro_after_init = default_handle_irq;
> +void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init = default_handle_irq;
> +#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)

This breaks the default case, since handle_arch_irq is initialized to a
bunch of garbage hex bytes (0x0123456789abcdef).

That means that if set_handle_irq() isn't called, an IRQ will result in
a call to that bogus address rather than default_handle_irq(), which'll
be more difficult to debug.

Mark.

>  void (*handle_arch_fiq)(struct pt_regs *) __ro_after_init = default_handle_fiq;
>  
>  int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
>  {
> -	if (handle_arch_irq != default_handle_irq)
> +	if (_handle_arch_irq != default_handle_irq)
>  		return -EBUSY;
>  
> -	handle_arch_irq = handle_irq;
> +	_handle_arch_irq = handle_irq;
> +	runtime_const_init(ptr, _handle_arch_irq);
>  	pr_info("Root IRQ handler: %ps\n", handle_irq);
>  	return 0;
>  }
> -- 
> 2.51.0
> 
> 

