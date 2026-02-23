Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39CCEA4FBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vA5UOpm3q2+AO9sD6crc4wqaZSe1Osa8Q9jsyvZpLY=; b=uJLkADccHc7hOE1N3D+meW64QI
	ryEEut5EHhdLZPBUZNh92wsa2WZ5tfARVvvS6QGIOKhrQ+3T+2BuLQVBenKjUSxjQcucr9iP8H+T+
	J+sF1TWhreawA7dpvVL4IHejQlLg9f7UzIJYA6TN8gY3FFvMsFMsddtTzB8AvAoQmrxdeQDcwfdCB
	0iG/17rcj8GV4toNutctju70Gq7Y904wQRvXxu3gEedy98wR02RUd8ckIzgmvPeIJpHwrrl7hEo45
	vEeBehWBgyMnbHo+ZOthLxz2gtqrkJ7Cbul6c3Tm1gc10rVE9LYvuafijkUFXU9BM1XnFpPyfWssS
	yBuVeh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVoY-00000000LIf-3syY;
	Mon, 23 Feb 2026 13:17:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVoW-00000000LI1-2ii6;
	Mon, 23 Feb 2026 13:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D1A543E29;
	Mon, 23 Feb 2026 13:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3506DC116C6;
	Mon, 23 Feb 2026 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771852647;
	bh=Gdqiq6jhk1akgvEa8JTZ01N6RvxkZkAoBZ5gq9Mj20A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9yaNaGYQHZdU1J+8dALnlTUYIEnZB81u2l83VVV/QParVAAsU6RGdvZ4BakIuv32
	 eOlNm/0r/UFwfKVyuZzwdKP8U6QfZHU3eiFXtKhIWsFcveTE7VpRQmLamLgjTyP3qV
	 4RDOddLAb8a+K8msBjq9r+dCYNfbescImkRdeP6y6WHGRieGIUBIV7K8yDKP27C7Fx
	 au27EEK4XKzllxoLwgSQG/+iVveLb6dm/8bHs0m9eVQrfxnJUKIG52tyT66MarVVqm
	 J1vNAyOy6uIC32RNGT2dJxGQDjzcgM0Ahv/xhvXSVkiN9Pz0TLvJumy089N7loZVa7
	 GwdxTlSlByXjw==
Date: Mon, 23 Feb 2026 20:58:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <aZxPDBLpTm4yHQWY@xhacker>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-4-jszhang@kernel.org>
 <aZxOe_1XGX_gGOoK@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZxOe_1XGX_gGOoK@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_051728_725067_25362AD6 
X-CRM114-Status: GOOD (  25.76  )
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

On Mon, Feb 23, 2026 at 12:56:27PM +0000, Mark Rutland wrote:
> On Fri, Feb 20, 2026 at 05:09:22PM +0800, Jisheng Zhang wrote:
> > Currently, on arm64 platforms, the handle_arch_irq is a pointer which
> > is set during booting, and every irq processing needs to access it,
> > so it sits in hot code path. We can use the runtime constant mechanism
> > which was introduced by Linus to speed up its accessing.
> > 
> > Tested on Quad CA55 platform, the perf sched benchmark is improved
> > by ~6.5%
> 
> That is a surprisingly large impact. :/
> 
> Does this meaningfully actually affect any real workload?

all irqs' processing is improved to this extent. The perf sched
bench(an existing and good benchmark to measure IPI) is used to
show how much will be the improvement.

> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/arm64/kernel/entry-common.c | 4 +++-
> >  arch/arm64/kernel/irq.c          | 9 ++++++---
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> > index 3625797e9ee8..46a4c012e15f 100644
> > --- a/arch/arm64/kernel/entry-common.c
> > +++ b/arch/arm64/kernel/entry-common.c
> > @@ -25,6 +25,7 @@
> >  #include <asm/kprobes.h>
> >  #include <asm/mmu.h>
> >  #include <asm/processor.h>
> > +#include <asm/runtime-const.h>
> >  #include <asm/sdei.h>
> >  #include <asm/stacktrace.h>
> >  #include <asm/sysreg.h>
> > @@ -139,7 +140,8 @@ static void do_interrupt_handler(struct pt_regs *regs,
> >  	set_irq_regs(old_regs);
> >  }
> >  
> > -extern void (*handle_arch_irq)(struct pt_regs *);
> > +extern void (*_handle_arch_irq)(struct pt_regs *);
> > +#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
> >  extern void (*handle_arch_fiq)(struct pt_regs *);
> 
> We should treat handle_arch_irq and handle_arch_fiq the same way. Either
> both get this, or neither do.
> 
> >  static void noinstr __panic_unhandled(struct pt_regs *regs, const char *vector,
> > diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> > index 15dedb385b9e..30629c183606 100644
> > --- a/arch/arm64/kernel/irq.c
> > +++ b/arch/arm64/kernel/irq.c
> > @@ -23,6 +23,7 @@
> >  #include <asm/daifflags.h>
> >  #include <asm/exception.h>
> >  #include <asm/numa.h>
> > +#include <asm/runtime-const.h>
> >  #include <asm/softirq_stack.h>
> >  #include <asm/stacktrace.h>
> >  #include <asm/vmap_stack.h>
> > @@ -84,15 +85,17 @@ static void default_handle_fiq(struct pt_regs *regs)
> >  	panic("FIQ taken without a root FIQ handler\n");
> >  }
> >  
> > -void (*handle_arch_irq)(struct pt_regs *) __ro_after_init = default_handle_irq;
> > +void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init = default_handle_irq;
> > +#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
> 
> This breaks the default case, since handle_arch_irq is initialized to a
> bunch of garbage hex bytes (0x0123456789abcdef).
> 
> That means that if set_handle_irq() isn't called, an IRQ will result in
> a call to that bogus address rather than default_handle_irq(), which'll
> be more difficult to debug.

Oops, you're right. If runtime constants is chosen, I will address this
comment. While Thomas suggested static call instead. I found you
concerned with the arm64's static call implementation 5 years ago, I
mentioned this in another email a few seconds ago. Could you plz comment
the thread?

> 
> Mark.
> 
> >  void (*handle_arch_fiq)(struct pt_regs *) __ro_after_init = default_handle_fiq;
> >  
> >  int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
> >  {
> > -	if (handle_arch_irq != default_handle_irq)
> > +	if (_handle_arch_irq != default_handle_irq)
> >  		return -EBUSY;
> >  
> > -	handle_arch_irq = handle_irq;
> > +	_handle_arch_irq = handle_irq;
> > +	runtime_const_init(ptr, _handle_arch_irq);
> >  	pr_info("Root IRQ handler: %ps\n", handle_irq);
> >  	return 0;
> >  }
> > -- 
> > 2.51.0
> > 
> > 

