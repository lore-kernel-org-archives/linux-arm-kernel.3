Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D48BCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU+ldOMCjsRLA5DXyuXG+eI9MaIuWf7QnLG8V1CkUEo=; b=vKdl8h2NZ5Lr9OPawFGg1fgPsM
	T4Gc3oXuoXv4SVV6B4ct1feBWkrLmww6TPG5CjROyvdDRKn0lKW0SPt8LSS7jDqzNFJzKxcmSojHD
	zLLpEhBg7+TjNzyY08lTZbNObQDr3k9U5RvkTa9o3/hPAu9pvF7XNCZssE9ERlcbLdu3U01/vv69k
	wf16bE0BkxN7Yje+d5Ts1+rZnvb5izlMhz2luZ7Spx4pcEC40KIHrq0P4IhUumbyIIaVUvyibZr7I
	ALHbBF1gEwMxFQiYMprXYtyX1l0MGTCHvKLBfPdxkkEnYuNnKNFAknhVzfpO7EJaJ4LaT9TuwUQK+
	/mnLskDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchC9-00000008yn1-3HQb;
	Thu, 25 Jun 2026 10:20:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchC7-00000008ymY-0CmD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qU+ldOMCjsRLA5DXyuXG+eI9MaIuWf7QnLG8V1CkUEo=; b=xHUtZbaz94S7pOeN9m19RvFy7e
	oPH7p4NBy8Iraw74eQ4HOMjRkh24gWDEg30OqF/q96HnI7EKNHZflN35SEz06o7YJUgMu2BkiEyFZ
	icOkQjUkPQvxeMCmsaAkn39XCk7jkGbd3QOPndCASIEdvVhDqecBnSeijNHJxzqPYXINMnJiu33Bh
	/6GudVDouZMbkFXQftyqhP9JpyE0t3oXRrNhGAkds/x3QmbJZTkJ2jS0qJ8s7bljHAtpQYHoYTM5q
	UbzmDc+2xiZ6FC4zugxGma+G7xGwsMaStYjkWTSasjFOEkD6AJZDOXtACnKlZzXYHCXWfFGhfE/k2
	RN5YwNIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43234)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wchBx-000000000mn-0rvY;
	Thu, 25 Jun 2026 11:20:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wchBt-000000001vm-30e6;
	Thu, 25 Jun 2026 11:20:13 +0100
Date: Thu, 25 Jun 2026 11:20:13 +0100
From: Russell King <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <aj0A3SjMhR24e8fP@shell.armlinux.org.uk>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
 <20260625085034.tvyGSmaP@linutronix.de>
 <ajzvcCve4LubjH9J@shell.armlinux.org.uk>
 <20260625093008.e5I4bh-_@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625093008.e5I4bh-_@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_032027_092099_58BCEE00 
X-CRM114-Status: GOOD (  31.50  )
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

On Thu, Jun 25, 2026 at 11:30:08AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-06-25 10:05:52 [+0100], Russell King wrote:
> > > for this but actual breakpoint handling might be broken or is it just
> > > me? But then your stack trace looks like mine so :/
> > 
> > ARM Linux doesn't use BKPT. BKPT was an instruction introduced by Arm
> > Ltd in ARMv5TE. Prior to this, we use a UDF instruction instead (we
> > had to pick something!) and gdb and other tools use that as a
> > breapoint.
> > 
> > Moreover, BKPT isn't guaranteed to trap to the kernel, especially when
> > there is a hardware debugger connected. In that case, DDI0100E states
> > that use of BKPT must be according to the instructions provided with
> > the hardware debugger. This makes BKPT unsuitable for use.
> 
> So you are saying this:
> 
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index e62cc4be5adf6..11ac69113eca2 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -595,6 +595,16 @@ do_bad(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  	return 1;
>  }
>  
> +static int do_debug_event(unsigned long addr, unsigned int fsr,
> +			  struct pt_regs *regs)
> +{
> +	if (!user_mode(regs))
> +		return 1;
> +	local_irq_enable();
> +	ptrace_break(regs);
> +	return 0;
> +}
> +
>  struct fsr_info {
>  	int	(*fn)(unsigned long addr, unsigned int fsr, struct pt_regs *regs);
>  	int	sig;
> diff --git a/arch/arm/mm/fsr-2level.c b/arch/arm/mm/fsr-2level.c
> index f2be95197265d..bfd718f64020c 100644
> --- a/arch/arm/mm/fsr-2level.c
> +++ b/arch/arm/mm/fsr-2level.c
> @@ -46,7 +46,7 @@ static struct fsr_info fsr_info[] = {
>  static struct fsr_info ifsr_info[] = {
>  	{ do_bad,		SIGBUS,  0,		"unknown 0"			   },
>  	{ do_bad,		SIGBUS,  0,		"unknown 1"			   },
> -	{ do_bad,		SIGBUS,  0,		"debug event"			   },
> +	{ do_debug_event,	SIGBUS,  0,		"debug event"			   },
>  	{ do_bad,		SIGSEGV, SEGV_ACCERR,	"section access flag fault"	   },
>  	{ do_bad,		SIGBUS,  0,		"unknown 4"			   },
>  	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"section translation fault"	   },
> diff --git a/arch/arm/mm/fsr-3level.c b/arch/arm/mm/fsr-3level.c
> index d0ae2963656a6..96c1d45d20d9e 100644
> --- a/arch/arm/mm/fsr-3level.c
> +++ b/arch/arm/mm/fsr-3level.c
> @@ -34,7 +34,7 @@ static struct fsr_info fsr_info[] = {
>  	{ do_bad,		SIGBUS,  0,		"synchronous parity error (translation table walk" },
>  	{ do_bad,		SIGBUS,  0,		"unknown 32"			},
>  	{ do_bad,		SIGBUS,  BUS_ADRALN,	"alignment fault"		},
> -	{ do_bad,		SIGBUS,  0,		"debug event"			},
> +	{ do_debug_event,	SIGBUS,  0,		"debug event"			},
>  	{ do_bad,		SIGBUS,  0,		"unknown 35"			},
>  	{ do_bad,		SIGBUS,  0,		"unknown 36"			},
>  	{ do_bad,		SIGBUS,  0,		"unknown 37"			},
> 
> is not worth doing it? With this I can my little testcase working.

No, it isn't, because if you enable PERF_EVENTS then BKPT breaks.
hw_breakpoint.c claims this vector.

Moreover, in older architectures, FSR=2 means "Terminal exception"
which is defined as "This indicates that an irrecoverable fault has
occurred. The circumstances under which this can happen (if at all)
are IMPLEMENTATION DEFINED." - from DDI0100E (which includes
ARMv5TE). In DDI0100F, this encoding was changed to "Debug exception".

Hence, the above can not be unconditional.

Then, we also have that FSR=2 is generated for a number of different
reasons (including hardware debug events) which may trigger.

Also a hardware debugger (e.g. connected via JTAG) could decide to
pass a BKPT exception on, and that could happen from the kernel. I
believe LLVM CFI uses BKPT (see LinusW's commit c3f89986fde7 ("ARM:
9391/2: hw_breakpoint: Handle CFI breakpoints")

BKPT is a total mess.

> That would be exc_int3() from arch/x86/kernel/traps.c.
> Besides doing "notify_die(DIE_INT3, "int3", regs, 0, X86_TRAP_BP, SIGTRAP);"
> 
> it does cond_local_irq_enable() which enables the interrupts if they
> were enabled by the "caller", sends the signal (SIGTRAP).

I'm happy with that approach as far as interrupts go, but we can't
change the behaviour for FSR=2 again, beyond fixing LinusW's
commit (which has recently been reported as a regression.)

Note that the change which makes this raise a SIGTRAP rather than
SIGBUS when PERF_EVENTS=y could _also_ be reported as a regression
that we would have to fix, and making FSR=2 raise a SIGTRAP now
could very well invite that regression to be reported.

Essentially, I don't think we can "fix" BKPT to always raise SIGTRAP.
The BKPT instruction is something the kernel has never _officially_
supported.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

