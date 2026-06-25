Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E61FCDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q53xKpSeJmpDx2AZ7+6vHYsZS2WekXI5H2SqxBWvloE=; b=Utv9d4elrWcjGb5+RyZlj+aZjY
	qWQpt2k83rox6ES/b+dlSmICpJ/qvuBnazgrq615k6RNc95eI5+41tBmi2Tus+TC8GT6DhZULc4ii
	zodRzpv2MzxKoDz1hXbXCOh+pXwQUxD3+EeiCP3NWHaMrgJSOSoW5mPTvH7Y2hvO7jwevGFfpE9rA
	cVxgoRQNsX7LF8HjMbCPVs9b1Lt6zuwjrw6iDiI++42R6zp9N5BSft11CINFI4dLp9HFHpXoInPmr
	sf6JFQ7een5EG0Gg6iIUeQ5YaJicTLlI8lEsggFNNFKV5+9Mmkry524J/CnZLJgIcRCBoyO+hnE1e
	HzDDL2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgPZ-00000008uQk-1raz;
	Thu, 25 Jun 2026 09:30:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgPX-00000008uQG-0pS6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:30:16 +0000
Date: Thu, 25 Jun 2026 11:30:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782379809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q53xKpSeJmpDx2AZ7+6vHYsZS2WekXI5H2SqxBWvloE=;
	b=rCnuEUZF8UFoIohoD8fIAgrFXP2+jZXhLGcomVa8zlnEyxpXIi99giPPBs6w/eYsyF8MDs
	RspfZHVnH1QrEsLdD7mhQTMrq8y8iKAjQxGS3QFmi7dcI+nGiRnQl6d2baIrtQU+EH6Bhx
	DrfwwyScEYF/koYYrAPF9vvvMHYUPnqqm0IzxYX5LneYyL4NF36oTyAKiRoFvD2bNzrPfX
	U003hWovc4hGhKsn9P0bzB6wlBKGjCEY4S1RCzLyqP3Sj0iI4eRjtct1wG0urskJQJOlQP
	giosOdOMVSVLNIxwj24hnzhiByymGmKaGmIyajoAiq7PLdsCzpV6ytmGnLqu+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782379809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q53xKpSeJmpDx2AZ7+6vHYsZS2WekXI5H2SqxBWvloE=;
	b=gOi/VdsRNjFKskHjwR2aPN1e3v9sUIJdMRHJohk5anvzfSLntMokBkfPdrSWQLeLZjqjVl
	a3DLrWSNt4bqMgBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Russell King <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260625093008.e5I4bh-_@linutronix.de>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
 <20260625085034.tvyGSmaP@linutronix.de>
 <ajzvcCve4LubjH9J@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajzvcCve4LubjH9J@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_023015_397935_1816B7DB 
X-CRM114-Status: GOOD (  27.32  )
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

On 2026-06-25 10:05:52 [+0100], Russell King wrote:
> > for this but actual breakpoint handling might be broken or is it just
> > me? But then your stack trace looks like mine so :/
> 
> ARM Linux doesn't use BKPT. BKPT was an instruction introduced by Arm
> Ltd in ARMv5TE. Prior to this, we use a UDF instruction instead (we
> had to pick something!) and gdb and other tools use that as a
> breapoint.
> 
> Moreover, BKPT isn't guaranteed to trap to the kernel, especially when
> there is a hardware debugger connected. In that case, DDI0100E states
> that use of BKPT must be according to the instructions provided with
> the hardware debugger. This makes BKPT unsuitable for use.

So you are saying this:

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index e62cc4be5adf6..11ac69113eca2 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -595,6 +595,16 @@ do_bad(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	return 1;
 }
 
+static int do_debug_event(unsigned long addr, unsigned int fsr,
+			  struct pt_regs *regs)
+{
+	if (!user_mode(regs))
+		return 1;
+	local_irq_enable();
+	ptrace_break(regs);
+	return 0;
+}
+
 struct fsr_info {
 	int	(*fn)(unsigned long addr, unsigned int fsr, struct pt_regs *regs);
 	int	sig;
diff --git a/arch/arm/mm/fsr-2level.c b/arch/arm/mm/fsr-2level.c
index f2be95197265d..bfd718f64020c 100644
--- a/arch/arm/mm/fsr-2level.c
+++ b/arch/arm/mm/fsr-2level.c
@@ -46,7 +46,7 @@ static struct fsr_info fsr_info[] = {
 static struct fsr_info ifsr_info[] = {
 	{ do_bad,		SIGBUS,  0,		"unknown 0"			   },
 	{ do_bad,		SIGBUS,  0,		"unknown 1"			   },
-	{ do_bad,		SIGBUS,  0,		"debug event"			   },
+	{ do_debug_event,	SIGBUS,  0,		"debug event"			   },
 	{ do_bad,		SIGSEGV, SEGV_ACCERR,	"section access flag fault"	   },
 	{ do_bad,		SIGBUS,  0,		"unknown 4"			   },
 	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"section translation fault"	   },
diff --git a/arch/arm/mm/fsr-3level.c b/arch/arm/mm/fsr-3level.c
index d0ae2963656a6..96c1d45d20d9e 100644
--- a/arch/arm/mm/fsr-3level.c
+++ b/arch/arm/mm/fsr-3level.c
@@ -34,7 +34,7 @@ static struct fsr_info fsr_info[] = {
 	{ do_bad,		SIGBUS,  0,		"synchronous parity error (translation table walk" },
 	{ do_bad,		SIGBUS,  0,		"unknown 32"			},
 	{ do_bad,		SIGBUS,  BUS_ADRALN,	"alignment fault"		},
-	{ do_bad,		SIGBUS,  0,		"debug event"			},
+	{ do_debug_event,	SIGBUS,  0,		"debug event"			},
 	{ do_bad,		SIGBUS,  0,		"unknown 35"			},
 	{ do_bad,		SIGBUS,  0,		"unknown 36"			},
 	{ do_bad,		SIGBUS,  0,		"unknown 37"			},

is not worth doing it? With this I can my little testcase working.

> Consequently, ARM Linux has not supported the use of BKPT - no code
> was added to support this instruction, hence why the kernel prints an
> Alert level message stating that the fault was unhandled.
> 
> In addition, when a hardware debugger is not being used, with the
> addition of hw_breakpoint.c, what userland sees in response depends on
> kernel configuration. If hw_breakpoint.c is not built (when PERF_EVENTS
> is disabled), then a SIGBUS signal will be raised. If it is built, and
> prior to a recent commit by LinusW, it will raise a SIGTRAP. After
> LinusW's commit, it won't raise a signal, but userspace will spin on
> the BKPT instruction.
> 
> The path we go through in the above case is very much an "oh damn,
> we aren't handling this exception, let's try to do something that
> might save the day".

Okay.

> Rather than throwing local_irq_enable() in random places, it would
> be better to do it earlier, but I would want to review what x86 does
> when it gets an exception that the kernel doesn't handle - not sure
> when I'll get around to doing that though.

That would be exc_int3() from arch/x86/kernel/traps.c.
Besides doing "notify_die(DIE_INT3, "int3", regs, 0, X86_TRAP_BP, SIGTRAP);"

it does cond_local_irq_enable() which enables the interrupts if they
were enabled by the "caller", sends the signal (SIGTRAP).

Sebastian

