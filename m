Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65008C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rb0Ef+Nf1YtY4j4F8zC7NfH2dCUfsIn5CcdUB7JqlQ=; b=gWfoWL0yXw+fYiVvisSdvS1XW0
	qsNZyPm4E35q4hcZySQMtDRlarGUsblPmXTFU2dyyi2XmGTImWJi2Vx0tSYPKWbo3rNGxeFTCUGz7
	wKbwmHwMgSTBhnHmT6mmFQpSW9F3esDAvoBQwVuACnwTvGtMv09SvGkTcdtX7yZrInmrmlt88s9Ob
	s7O+ZD5g3rSYOSiNA20XCGXJUisMgzT1kjG5F7STQa/9bCGf1BwDaIOGQhdNunXbMAtCxbvn2F6Tv
	ZjYmHaTS0UxZDWstEibFYOfJNCflJ7GB+SDRjYOrBJcStZb0DjUs2MiOE5Hdf7pA7XZeMlRVUEu1H
	PHPPsh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecHC-0000000HZQG-089W;
	Tue, 30 Jun 2026 17:29:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecH8-0000000HZPT-3Pyn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:29:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25CEB302A;
	Tue, 30 Jun 2026 10:29:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C6AD3F66F;
	Tue, 30 Jun 2026 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782840571; bh=VKGtFUtXFPmQKOp08+8IbmZPIhctQgVXf8xxiHMm5/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvFvKd943Rdp80y1UjR8ZmfJoGd3tSimt2mogakWGvSBpqRBQeakJ0jV8BKGD3sG5
	 qpdkJfM8PYz3EJE0ipCzWHHzUSLmArqyj1vm3+bOp7MBgB+FrW4mV76U6hSn+5OpCF
	 uQwQyLnb81FafZRnW9zwWJGo2tAUd6YdQqy3K09w=
Date: Tue, 30 Jun 2026 18:29:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Yiqi Sun <sunyiqixm@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com, kees@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit
 after ptrace
Message-ID: <akP8-ddTn9bhIDEW@arm.com>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJuljttiQoki3sq@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102934_944385_060AC566 
X-CRM114-Status: GOOD (  52.31  )
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

Hi Will,

On Mon, Jun 29, 2026 at 02:09:42PM +0100, Will Deacon wrote:
> On Thu, Jun 25, 2026 at 06:45:02PM +0800, Yiqi Sun wrote:
> > On arm64, seccomp obtains syscall arguments via
> > syscall_get_arguments(), where arg0 is currently read from
> > regs->orig_x0. audit_syscall_entry() in syscall_trace_enter() also
> > takes arg0 from regs->orig_x0. However, the syscall wrapper consumes
> > live arguments from regs->regs[0..5].
> > 
> > A ptracer can modify x0 on syscall-enter stop before seccomp and audit
> > run, but cannot update orig_x0 through the native syscall-stop
> > interface. This can leave seccomp and audit checking stale arg0 while
> > the syscall executes with updated live x0.
> > 
> > Make both paths read arg0 from regs->regs[0], matching the actual
> > dispatch arguments and keeping seccomp and audit aligned after ptrace
> > updates.
> > 
> > Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
> > Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> > ---
> > Changes in v2:
> > - Also switch the arm64 audit entry path to use live x0
> > - Clarify the orig_x0 synchronization comment in syscall_set_arguments()
> > ---
> >  arch/arm64/include/asm/syscall.h | 7 +++----
> >  arch/arm64/kernel/ptrace.c       | 2 +-
> >  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> Sashiko has pointed out some issues with this patch that look legitimate
> to me:
> 
> https://sashiko.dev/#/patchset/2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com
> 
> Specifically, we don't appear to handle NO_SYSCALL properly and the
> syscall-exit stop is now going to see the return code instead of the
> syscall number.

Yes, good points from Sashiko.

> Looking at this more broadly, it looks like orig_x0 is used for three
> different cases:

At least the reported problem is real, the seccomp/audit code needs to
see the values the tracer modified and, IIUC, that's the behaviour x86
implements (it doesn't even clobber the arguments with the return
value). Unlike arm64, powerpc, arm32 expose orig_* to the ptrace
interface. We can't extend the user_pt_regs structure but we could
expose a new structure via ptrace.

> 1. syscall restarting:
> 			We restore from orig_x0, which should hold the
> 			original value passed by userspace.

Yes, we definitely need the orig_x0 since regs[0] was clobbered by the
return value.

> 2. syscall_get_arguments():
> 			This must work correctly vs syscall_set_arguments()
> 			(returning the latest set x0) but also
> 			syscall_get_return_value() (so we need to
> 			distinguish the return value and the argument
> 			somehow).

syscall_set_arguments() also updates orig_x0. W.r.t.
syscall_set_return_value(), it sets regs[0] which also matches what
syscall_get_return_value() reads. But yes, mismatch with the above.

> 3. syscall_rollback():
> 			Seccomp wants to restore the original values
> 			passed by userspace.

The "original values" comment is slightly misleading and just restoring
orig_x0 won't help with the other args anyway. x86 doesn't roll back any
arguments, it just uses the tracer's new values if they've been set via
syscall_trace_enter(). We do the same if the arguments are set via
syscall_set_arguments() since it updates orig_x0 but not if the tracer
did a gpr_set(). I don't think we can safely update orig_x0 via
gpr_set() since it has no idea whether it's in a syscall or not, may
mess up syscall restarting. Interestingly, riscv's SC_RISCV_REGS_TO_ARGS
uses orig_a0, a0 is always the return value even for gpr_get/set(). If
they want to change the syscall arguments, it's only possible via
PTRACE_SET_SYSCALL_INFO.

> So (1) and (3) look to require the same behaviour, but (2) wants
> something different because it needs to reflect changes made via
> syscall_set_arguments().
> 
> The bodge we have for (2) today is that syscall_set_arguments() updates
> orig_x0, but I think that breaks (1) and (2) which is the underlying
> problem you're facing here.

I think the reason (1) needs orig_x0 is because regs[0] was clobbered by
the return value. For (3), orig_x0 and regs[0] are mostly in sync on
this path other than the NO_SYSCALL case where el0_svc_common() sets
regs[0] to -ENOSYS early, before we even reach a tracer.

> I haven't yet figured out the right way to fix this, but I'd be interested
> to hear from others. I think the starting point would be removing orig_x0
> from syscall_{get,set}_arguments() altogether so that it accurately
> represents the initial value passed by userspace.

I thought this might be a cleaner way forward but it's pretty messed up.
Depending on when syscall_get_arguments() is called, it needs different
things: we have seccomp before syscall and regs[0] would do but also
collect_syscall() at the end of a syscall and regs[0] has been clobbered
with the return value.

I also looked at replacing orig_x0 (or its meaning) with a ret_x0 and
only update it on the ERET to user but it breaks the ABI since a tracer
may expect to see the syscall return value in regs[0] on the exit path.

I think we need to keep orig_x0 as our original arg0 throughout the
kernel and just fix the tracer path to sync it on the syscall entry. It
doesn't unclutter the code but it shouldn't break the ABI either (unless
someone relied on the ptrace change x0 and not being noticed by
seccomp). Something like below:

----------------8<-----------------------------
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..cd21b301e154 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
+		/*
+		 * Keep orig_x0 authoritative so that seccomp (via
+		 * syscall_get_arguments()), audit and the restart path all
+		 * see the same first argument the syscall is dispatched with,
+		 * even if it has been updated by a tracer. Skip this for
+		 * NO_SYSCALL (set either by the user or the tracer) as
+		 * regs[0] holds the return value (see the comment in
+		 * el0_svc_common()). For compat, orig_r0 is provided directly
+		 * through GPR index 17.
+		 */
+		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
+			regs->orig_x0 = regs->regs[0];
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
----------------8<-----------------------------

If we want to change the ABI, we could do like riscv and only set the
arguments via PTRACE_SET_SYSCALL_INFO while the GPR ptrace accesses
whatever is in regs[0] - either the original arg or the return value. I
think they changed this inadvertently in 2023 when they moved to the
generic syscall.

We could also introduce NT_ARM_ORIG_X0 but on its own it feels a bit
weird for a tracer to know when the kernel may use orig_x0 or regs[0].

So quick hack above if it works, otherwise we need to look into change
the ABI and hoping no-one notices ;).

-- 
Catalin

