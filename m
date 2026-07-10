Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A751C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBK9AacDnbTsnuUMGD7T7akUwYMUN/24UadcmEy16x8=; b=AqiEALSVKT8tHV7BZ2ddaiaE5d
	dgK6eTi3ZZlxK0atRUMprbAz6zxUVg6iiq4dgWMwMD8/loX0ghWB9BmAhthiHT+84NUm0vsQfI0ib
	FAYOF715Zfyk+4PJDDPpcN19lu28e4cgWt/3+Mn8MG7zUUpoNdWp4vaAjavOZE23Z0FBkQZGhoNQW
	/nCs6YLQnZvbRLU75ohejacVBO8+Ucraebxp+2SzngyWseh4K2jY9ySHc45p/c+YeMrDXl/FhZVow
	XYvQOiTD8XhvJV5A92/eTpeBFhi1cIwHQZtCAgrFAKlj8MjbuYRFZN8AAIWAnjhpvg62PZWldh40E
	VZq5Xx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBqf-000000053Hy-0HfS;
	Fri, 10 Jul 2026 14:05:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBqd-000000053Hb-1HOI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:04:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5190160051;
	Fri, 10 Jul 2026 14:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697271F000E9;
	Fri, 10 Jul 2026 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692298;
	bh=XBK9AacDnbTsnuUMGD7T7akUwYMUN/24UadcmEy16x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nMT8QzCYJIItCuOEETrk7GxZsyxsClWsdS04nWkrmhYnVgKJOLt9iBEjnq1YdP6IL
	 vqWUZpKlNiQQ4IGpoDTZK7bcm7DDkAXCLXlAFq8hbKCFQ3nNZlq9Nfejo0LfV5qnPz
	 8/Wn5D5vV+b+5j28wFhXL/wyTHnA5jfaWUYQv60oueba11C1d2pGrArDNrRckBVKMJ
	 jExIL33GH7o7aPZIr6d/aHuaCJnoQLiG5ogU8rgENm2CrUul9Hb4h66sW08zoInM5r
	 RGfRnLdmlpln96Q1AedEJkW2k/JBZHKb3up6zl5TxNPT/TF2mF/46lwyz8RHpTZJmt
	 uI5x+lxrh/0ug==
Date: Fri, 10 Jul 2026 15:04:52 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yiqi Sun <sunyiqixm@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com, kees@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit
 after ptrace
Message-ID: <alD8BPgSKxHEeydu@willie-the-truck>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck>
 <akP8-ddTn9bhIDEW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akP8-ddTn9bhIDEW@arm.com>
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

Hi Catalin,

Thanks for helping with this.

On Tue, Jun 30, 2026 at 06:29:29PM +0100, Catalin Marinas wrote:
> On Mon, Jun 29, 2026 at 02:09:42PM +0100, Will Deacon wrote:
> > Looking at this more broadly, it looks like orig_x0 is used for three
> > different cases:
> 
> At least the reported problem is real, the seccomp/audit code needs to
> see the values the tracer modified and, IIUC, that's the behaviour x86
> implements (it doesn't even clobber the arguments with the return
> value). Unlike arm64, powerpc, arm32 expose orig_* to the ptrace
> interface. We can't extend the user_pt_regs structure but we could
> expose a new structure via ptrace.
> 
> > 1. syscall restarting:
> > 			We restore from orig_x0, which should hold the
> > 			original value passed by userspace.
> 
> Yes, we definitely need the orig_x0 since regs[0] was clobbered by the
> return value.
> 
> > 2. syscall_get_arguments():
> > 			This must work correctly vs syscall_set_arguments()
> > 			(returning the latest set x0) but also
> > 			syscall_get_return_value() (so we need to
> > 			distinguish the return value and the argument
> > 			somehow).
> 
> syscall_set_arguments() also updates orig_x0. W.r.t.
> syscall_set_return_value(), it sets regs[0] which also matches what
> syscall_get_return_value() reads. But yes, mismatch with the above.
> 
> > 3. syscall_rollback():
> > 			Seccomp wants to restore the original values
> > 			passed by userspace.
> 
> The "original values" comment is slightly misleading and just restoring
> orig_x0 won't help with the other args anyway. x86 doesn't roll back any
> arguments, it just uses the tracer's new values if they've been set via
> syscall_trace_enter().

Ah yes, that makes sense. I got thrown by the comment in
include/asm-generic/syscall.h because it makes it sound like we need to
rewind everything to the initial state from userspace.

> > I haven't yet figured out the right way to fix this, but I'd be interested
> > to hear from others. I think the starting point would be removing orig_x0
> > from syscall_{get,set}_arguments() altogether so that it accurately
> > represents the initial value passed by userspace.
> 
> I thought this might be a cleaner way forward but it's pretty messed up.
> Depending on when syscall_get_arguments() is called, it needs different
> things: we have seccomp before syscall and regs[0] would do but also
> collect_syscall() at the end of a syscall and regs[0] has been clobbered
> with the return value.

Urgh, collect_syscall() really gets in the way here. I *think* all the
other callers of syscall_get_arguments() happen on the entry path (i.e.
before we've clobbered regs[0] with the return value), which would mean
we could avoid touching orig_x0 in syscall.h, but collect_syscall() is
driven from /proc/pid/syscall so it can hit the syscall exit path too.
I wondered about setting syscallno to NO_SYSCALL earlier (i.e. before
setting the return value), but I think that breaks syscall restarting.

> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..cd21b301e154 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
>  		ret = report_syscall_entry(regs);
>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
> +		/*
> +		 * Keep orig_x0 authoritative so that seccomp (via
> +		 * syscall_get_arguments()), audit and the restart path all
> +		 * see the same first argument the syscall is dispatched with,
> +		 * even if it has been updated by a tracer. Skip this for
> +		 * NO_SYSCALL (set either by the user or the tracer) as
> +		 * regs[0] holds the return value (see the comment in
> +		 * el0_svc_common()). For compat, orig_r0 is provided directly
> +		 * through GPR index 17.
> +		 */
> +		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> +			regs->orig_x0 = regs->regs[0];

I think that's correct. I'll spin a proper patch...

Cheers,

Will

