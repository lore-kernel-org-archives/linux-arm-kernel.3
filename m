Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DBFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzSTpIKrSE0AxoeE/LdI+HYaPdXvAVA2aXbl1zWyXWo=; b=c/szgSrX5vJYhAdaRE1bgJNjsE
	BMKkyWITgwLlGwSOt12wghvHU+2ETfkN7dijmaeCmMhQEgA9WrCkG2S5QIctL0mR1UMfixMRWHAcr
	n3qFEVq9mUezD1reR/E7kjsWc6lMb3ZSuEbpbiMD+ZK3rjEnhWSYyk6xFFeZxJE75azj9X7tvyNji
	4Oceyi6/ZU4K0CAwSLf8gFMF4harAokeYi8puBqm3eOaZVD0kbe2ji07PeOnecV8rKNuUB6O2xhYD
	/tkP+tBa63lhpD7dB79aPm2n6uEGwpfphY8v3w0Rjd5wpWJjY+BIYdAmKzPJIgQcItOtPbkWEE4Uh
	vCUaS1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHJM-00000009Y74-0YtU;
	Mon, 13 Jul 2026 14:07:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHJL-00000009Y6f-0e99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:07:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB18E411A7;
	Mon, 13 Jul 2026 14:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B38D1F000E9;
	Mon, 13 Jul 2026 14:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783951626;
	bh=xzSTpIKrSE0AxoeE/LdI+HYaPdXvAVA2aXbl1zWyXWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=apcjmxVijI1vpjkJv3XVSAhqiuNgvL+aGGnsWsRW6X93lf6OLHWTHl19Oa15s4Oka
	 5Egeat+Cc3odBxnqEyhp7XciHx00nY87zz0CeJvdSfDuf4afh2kXFy6sNurcxZwWff
	 Gpf3xr5D2l3eVjcT+VkW3eYolLMsX8GVKp/IIpg/9iZkEzwy+u2MGMLuktMe900L27
	 GWiwavS4UaIHTu640QzF02xo894qilMMCRjW6TXOrtl3Nk/ZWQ59sBWzhmfLfQDc7w
	 nfLm9lphBbhGPjvzLcYe8H9a9vGV1fkZsEdT88KIuFMOcIaqUkmg72AQvt5vjLk4tA
	 w7T+Qt0NdHWbQ==
Date: Mon, 13 Jul 2026 15:07:01 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, kees@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit
 after ptrace
Message-ID: <alTxBVLJmQ7-ZnSS@willie-the-truck>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck>
 <akP8-ddTn9bhIDEW@arm.com>
 <1610f167-1af0-4d20-877c-b362b9b49d94@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610f167-1af0-4d20-877c-b362b9b49d94@huawei.com>
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

On Mon, Jul 13, 2026 at 03:49:18PM +0800, Jinjie Ruan wrote:
> On 7/1/2026 1:29 AM, Catalin Marinas wrote:
> > I think we need to keep orig_x0 as our original arg0 throughout the
> > kernel and just fix the tracer path to sync it on the syscall entry. It
> > doesn't unclutter the code but it shouldn't break the ABI either (unless
> > someone relied on the ptrace change x0 and not being noticed by
> > seccomp). Something like below:
> > 
> > ----------------8<-----------------------------
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index 4d08598e2891..cd21b301e154 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
> >  		ret = report_syscall_entry(regs);
> >  		if (ret || (flags & _TIF_SYSCALL_EMU))
> >  			return NO_SYSCALL;
> > +		/*
> > +		 * Keep orig_x0 authoritative so that seccomp (via
> > +		 * syscall_get_arguments()), audit and the restart path all
> > +		 * see the same first argument the syscall is dispatched with,
> > +		 * even if it has been updated by a tracer. Skip this for
> > +		 * NO_SYSCALL (set either by the user or the tracer) as
> > +		 * regs[0] holds the return value (see the comment in
> > +		 * el0_svc_common()). For compat, orig_r0 is provided directly
> > +		 * through GPR index 17.
> > +		 */
> > +		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> > +			regs->orig_x0 = regs->regs[0];
> 
> Can we place this fix in report_syscall_entry()? The generic entry
> framework has already reserved the function
> arch_ptrace_report_syscall_permit_entry() for architecture-specific
> customization, so switching to it might be more convenient.

Hmm, your comment prompted me to look at this some more and now I'm
unsure that the seccomp handling is correct, even with the fix above.

If the seccomp filters return SECCOMP_RET_TRACE, we'll do another ptrace
exit but we won't re-sync orig_x0, so audit could see a stale value. So
I think we might need something like the diff below, which looks like it
might be a pain for the generic entry code.

Will

--->8

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..57e8c6714d44 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
        }
 }
 
+static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
+{
+       /*
+        * Keep orig_x0 authoritative so that seccomp (via
+        * syscall_get_arguments()), audit and the restart path all see the same
+        * first argument the syscall is dispatched with, even if it has been
+        * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
+        * or the tracer), as regs[0] holds the return value (see the comment in
+        * el0_svc_common()) and can be unwound using syscall_rollback().
+        * For compat tasks, orig_r0 is provided directly through GPR index 17.
+        */
+       if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
+               regs->orig_x0 = regs->regs[0];
+}
+
 int syscall_trace_enter(struct pt_regs *regs)
 {
        unsigned long flags = read_thread_flags();
@@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
                ret = report_syscall_entry(regs);
                if (ret || (flags & _TIF_SYSCALL_EMU))
                        return NO_SYSCALL;
+
+               /*
+                * Ensure ptrace changes to x0 are visible to seccomp
+                * ptrace exits (SECCOMP_RET_TRACE).
+                */
+               update_syscall_orig_x0_after_ptrace(regs);
        }
 
        /* Do the secure computing after ptrace; failures should be fast. */
        if (secure_computing() == -1)
                return NO_SYSCALL;
 
+       /* Ensure seccomp updates to x0 are visible to audit. */
+       update_syscall_orig_x0_after_ptrace(regs);
+
        if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
                trace_sys_enter(regs, regs->syscallno);
 


