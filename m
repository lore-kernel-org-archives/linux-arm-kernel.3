Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10164606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DvRvTJJ5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JT20OMQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DsqUBkIa7Olvd6FTVJf/qEImpffvzM2i9AQMrT58Pf8=; b=DvRvTJJ55bwrJiA6i0I7o6C3aT
	W+QNkUZwn+F6FDauN4wVaz9wSdu1biKopL+G9XFGLjmTDmJiNEXiLvvibDF+IDrM+Y58b7jpeohn7
	zqDqI6PnY8bkf6CKIZFC1fqVDtc5zeOTJwSZ51160CwCRKiYgGGIDU3HD5n173KQPjzw0T+qKKINe
	mhyU5WNoImGBa3ceNue0e9jS4I3Ar7YMZk9j7LS3kF8CtNOO79x0QjNuy3FaStPPBYo7yuTnlCpqV
	EARd5p3Lxg62UCJpSGC+q1olUXW/YQQXjWjvmPV2sABGkWsxwk1NaVKNJziQ3PiZ8PcMRQM6XCflS
	QVs16czA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObF2-00000005VEK-3brj;
	Wed, 04 Nov 2026 13:41:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObF1-00000005VEE-2vFS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:41:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 746464163B;
	Wed,  4 Nov 2026 13:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0F91F000C1;
	Wed,  4 Nov 2026 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799687;
	bh=DsqUBkIa7Olvd6FTVJf/qEImpffvzM2i9AQMrT58Pf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JT20OMQfzen2gkICb9s6vngZ0xsFXQq5MlNq6Skcb+xj9wzC/iCl2g+QGbxcP5NOl
	 IGOYNVl5TlTBFFAX4U/NFcPTyG2gsE05k5bQkfWW0uunf4p+pagOugov4KaGmrXQGK
	 76Ap8MewNhhcIG6oGXpx4RdaU7Gvr5NO8u2kC1O9qfuyccQ8dIUBPSjhFcK5OusjME
	 kGXAPwzyYGyb8H1feJ1k4FlpwfTXxwkxcovpL4mFWnekhw0Zd+5cu88Xjbgldz0aPf
	 Mw8iLWTUGMmDgJc/gaYGgbRKY2Xi420o4PDMxWZthB7FHROvtAN7j2oTd9cQ1qdf6b
	 5HFAFGCD1mTMA==
Date: Wed, 4 Nov 2026 13:41:22 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, mark.rutland@arm.com,
	oleg@redhat.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <aus2Aq12Z-PKvoW7@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-czRUYRPRxi9dy@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 06:32:45PM +0000, Catalin Marinas wrote:
> On Fri, Oct 23, 2026 at 07:07:10PM +0800, Zhao Gongyi wrote:
> > PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
> > which calls ptrace_stop() without siginfo. If the tracer writes
> > NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
> > NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
> > WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.

I can't quite get my head around what it means to set NT_ARM_SYSTEM_CALL
in this context. Suddenly, in_syscall() will return true, which has
implications for things like signal handling that seem bizarre if we're
not actually in a syscall. Should we be avoiding this situation to start
with?

> > Remove the warning and guard the syscall-exit-stop check against a
> > missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
> > syscall-exit-stops use either value depending on whether the tracer
> > enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
> > assignment to synchronize orig_x0 from x0.
> > 
> > Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> > ---
> > Changes since v1:
> > - Remove the warning and early return, as suggested by Oleg.
> > - Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.
> > 
> > v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com
> > 
> > Tested on arm64 KVM at af32da41b032 with this v2 applied.
> > At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
> > NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
> > x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
> > with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
> > respectively). No kernel warnings occurred.
> > 
> >  arch/arm64/kernel/ptrace.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f743cbec1..22fb9eeed 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	if (regs->syscallno == NO_SYSCALL)
> >  		return;
> >  
> > -	/* We should only be called when target is in a ptrace stop */
> > -	if (WARN_ON_ONCE(!info))
> > -		return;
> 
> That's a slight semantic change since this function may now update
> orig_x0 even when !info. However, I think it makes more sense as the aim
> of commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0
> on syscall entry") was to update orig_x0 in all cases other than
> syscall-exit-stop. We can't have the latter with !info.
> 
> I'll wait for a couple of days to see if Will has any comments and queue
> it.

I was trying to limit the scope of this hack as much as possible, so I
think I'd prefer the early return tbh (i.e. just drop the WARN_ON_ONCE()
and update the comment).

Will

