Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB6C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2x9VvFeZH+5m63/63NPDxLx/XeomdGyh7hBWt48jt+E=; b=o5f7kOwUCLnf/umLuoKxkXQm0s
	SChIzgZkvULpDauHSTWtgLXDNvIbhnr5fhnLAC4yiuukoPKZticxtVQHIPOUOBQ2RQRveby9ytCvj
	GOKRx0lYV5/sAqaGVtP5Td/rLAUUuRphUlpbGKtEGdBkh5UWEdTpljAqZ+lhw+dUR5K2inIMowKz0
	G0sVT5TFfgtUMUhuBh6K9c7R9+4/95/mLwFwoUOsgzAlR14EtQaDbXPEIDtB/JSfBgBHbs1QjiJQu
	FgCKJoMI/oF7GK7IjxumRukLsFDMX8pSDvBAPh+/WhqkQRsZCH6UvSlFzZnmtDrj8yQbQWnby0Wy0
	a2u+0aiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKeM-0000000HBOs-12fM;
	Thu, 16 Jul 2026 11:53:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKeK-0000000HBOV-2Anb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:53:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5672C60054;
	Thu, 16 Jul 2026 11:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D34F1F000E9;
	Thu, 16 Jul 2026 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784202786;
	bh=2x9VvFeZH+5m63/63NPDxLx/XeomdGyh7hBWt48jt+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f0Gho2KWi1Qp53KAxtdOSxMBxOI0xr9ZYuJKgoiERBLYHFOC01JhfcQEJpmA3kuSi
	 OPUUhd/0kHvMUfM+Zi6qqngGY9u9jKEBnLlCgNOnxbfSLrVYfaCo1qvRy+XvAsJBOk
	 eLo9cPpYMedjJuxC34HNbyNDRdbuHQJNZklZpp6yNkU1QOzXmgtfsrPykvYNUQaJfE
	 OAwpGufN//lpT8fxULdNh5d88zNLx3a1k9RiDKM4jqZ5Z5sL9FKQ+6fIAo+D6wUzgV
	 KIPxYFT3ruDPpagSneI9ZZ9En5jH07QvFHRnE7ivP599HidT8R23CBtwJ9+fm2cRZx
	 YFWHadQPF/NGQ==
Date: Thu, 16 Jul 2026 12:53:01 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <aljGHQW92uz1HAwI@willie-the-truck>
References: <20260714143600.23853-1-will@kernel.org>
 <ac39d21e-8800-4c4e-885e-4baf7af2a106@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac39d21e-8800-4c4e-885e-4baf7af2a106@huawei.com>
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

On Thu, Jul 16, 2026 at 10:57:34AM +0800, Jinjie Ruan wrote:
> On 7/14/2026 10:35 PM, Will Deacon wrote:
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index 4d08598e2891..57e8c6714d44 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
> >  	}
> >  }
> >  
> > +static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
> > +{
> > +	/*
> > +	 * Keep orig_x0 authoritative so that seccomp (via
> > +	 * syscall_get_arguments()), audit and the restart path all see the same
> > +	 * first argument the syscall is dispatched with, even if it has been
> > +	 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
> > +	 * or the tracer), as regs[0] holds the return value (see the comment in
> > +	 * el0_svc_common()) and can be unwound using syscall_rollback().
> > +	 * For compat tasks, orig_r0 is provided directly through GPR index 17.
> > +	 */
> > +	if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> > +		regs->orig_x0 = regs->regs[0];
> > +}
> > +
> >  int syscall_trace_enter(struct pt_regs *regs)
> >  {
> >  	unsigned long flags = read_thread_flags();
> > @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
> >  		ret = report_syscall_entry(regs);
> >  		if (ret || (flags & _TIF_SYSCALL_EMU))
> >  			return NO_SYSCALL;
> > +
> > +		/*
> > +		 * Ensure ptrace changes to x0 are visible to seccomp
> > +		 * ptrace exits (SECCOMP_RET_TRACE).
> > +		 */
> > +		update_syscall_orig_x0_after_ptrace(regs);
> >  	}
> >  
> >  	/* Do the secure computing after ptrace; failures should be fast. */
> >  	if (secure_computing() == -1)
> >  		return NO_SYSCALL;
> >  
> > +	/* Ensure seccomp updates to x0 are visible to audit. */
> > +	update_syscall_orig_x0_after_ptrace(regs);
> 
> I think unconditionally updating orig_x0 here is unnecessary, we could
> Expand seccomp check in place as below the same as generic entry.

Let's leave any micro-optimisations for later, please. We're going to
need to backport this fix _way_ back, so I've been trying to keep it as
simple as possible. You're also going to end up replacing all of this
with the generic entry code, anyway.

I'll send a v2 with the comment changes shortly, then hopefully I can
send it as a fix for stable.

Thanks,

Will

