Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4915C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9HxsLhEOzgl5aD/u0/vw4rHVE6jYyLWcEXHOWo6FFw=; b=gZOE+NOvqIuuiDFsXuZa9WS1s4
	nmGj1L8srLgrKoW9p8bOLseYkCrgZx1y/HEYcnZ10DVxqxRaLSldIpNrRwS2rflh8yCAakxJnIptm
	sFmeOdIONegbYP4vFhmc4QXej3jUosEExW5qKm6RMtYPw9+qRLyKThs1+tI5Vv8DUlHNkklVFa2hK
	zgiXb+1NxuaymtYhpcvfxki8XIUFRmlCEjnGpYoiP/OtTXLPAaYvYZqMDS51Y2cdaqQxDuMJJvrzq
	/CJ61kr9fzHDlHG4sCsHWLbCTnFmtkCSIGXUkeAyLOb/H/Y817gcmyMOPu5ztmr5a8dsyeMWigBfX
	F3jI/WhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBkC-0000000Ehjj-3a0Z;
	Mon, 29 Jun 2026 13:09:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBkC-0000000EhjZ-0y7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:09:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B513600D8;
	Mon, 29 Jun 2026 13:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDB81F000E9;
	Mon, 29 Jun 2026 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738587;
	bh=T9HxsLhEOzgl5aD/u0/vw4rHVE6jYyLWcEXHOWo6FFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/Ztvf6UexSw1+UOerIV6ZQJkwEctoZljwLa0n0PtNmZLtJGLqwDrDwUNXtohNrY7
	 ChCIej1/wAocpupVqmSqvlNQZscTWo6kLcv2JyaZ7fCl+EXtAB1wQbhPHpSLdP/g9t
	 sEREy8jpWYfuP/Q4mBgU7coUc8BtuXAL/KIhFqLcBU8yKG4C31q79WFSkoS2NqnKHo
	 lXKeMZkt3En9zGcGDRa9mW/+ykNspYyOI1rOegIbm0T9Hnej+3pHGmJqMRntCrrKNC
	 FXdotB0aDpY2yEvjvztDz2qnKic06JQTYbYbVC7+ClDQGW9YoU4psQ/zrDdWWvjC0w
	 uxLTMCHEayglw==
Date: Mon, 29 Jun 2026 14:09:42 +0100
From: Will Deacon <will@kernel.org>
To: Yiqi Sun <sunyiqixm@gmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com, kees@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit
 after ptrace
Message-ID: <akJuljttiQoki3sq@willie-the-truck>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
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

Hi Yiqi,

On Thu, Jun 25, 2026 at 06:45:02PM +0800, Yiqi Sun wrote:
> On arm64, seccomp obtains syscall arguments via
> syscall_get_arguments(), where arg0 is currently read from
> regs->orig_x0. audit_syscall_entry() in syscall_trace_enter() also
> takes arg0 from regs->orig_x0. However, the syscall wrapper consumes
> live arguments from regs->regs[0..5].
> 
> A ptracer can modify x0 on syscall-enter stop before seccomp and audit
> run, but cannot update orig_x0 through the native syscall-stop
> interface. This can leave seccomp and audit checking stale arg0 while
> the syscall executes with updated live x0.
> 
> Make both paths read arg0 from regs->regs[0], matching the actual
> dispatch arguments and keeping seccomp and audit aligned after ptrace
> updates.
> 
> Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
> Changes in v2:
> - Also switch the arm64 audit entry path to use live x0
> - Clarify the orig_x0 synchronization comment in syscall_set_arguments()
> ---
>  arch/arm64/include/asm/syscall.h | 7 +++----
>  arch/arm64/kernel/ptrace.c       | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)

Sashiko has pointed out some issues with this patch that look legitimate
to me:

https://sashiko.dev/#/patchset/2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com

Specifically, we don't appear to handle NO_SYSCALL properly and the
syscall-exit stop is now going to see the return code instead of the
syscall number.

Looking at this more broadly, it looks like orig_x0 is used for three
different cases:


1. syscall restarting:
			We restore from orig_x0, which should hold the
			original value passed by userspace.

2. syscall_get_arguments():
			This must work correctly vs syscall_set_arguments()
			(returning the latest set x0) but also
			syscall_get_return_value() (so we need to
			distinguish the return value and the argument
			somehow).

3. syscall_rollback():
			Seccomp wants to restore the original values
			passed by userspace.


So (1) and (3) look to require the same behaviour, but (2) wants
something different because it needs to reflect changes made via
syscall_set_arguments().

The bodge we have for (2) today is that syscall_set_arguments() updates
orig_x0, but I think that breaks (1) and (2) which is the underlying
problem you're facing here.

I haven't yet figured out the right way to fix this, but I'd be interested
to hear from others. I think the starting point would be removing orig_x0
from syscall_{get,set}_arguments() altogether so that it accurately
represents the initial value passed by userspace.

Will

