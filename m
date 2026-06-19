Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B2CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2shzPwH02GzeAm1HaM4r3qbFbXKwpyKGG4nj4wIXZo=; b=pLWZi/18qGOENl+TBf6zSkqqGf
	oIiahTOzPk+XUjofBwjvXk/jZlkSDkc6f/WJtl3UwTR4M2682nPYMPNUvxDRDfbf0kMUok/zfBTG9
	9uVBy34JeY10sucoGnE35fuczVyzFkeKKlmE7zPUb/U1CzOlfvy48LkOdE0gWgaSh1M5DqMMYf6Cd
	mFBFRDsifii0InilfSxkxmKhFrozIXCgGRdenbUZuOivYFWQZLnFZsUg/Pt2048OAA7/kwfT+F8/C
	vBAHkRvZ+ib/d5OUevFeWX99l1ibtCuO+xfvVFl7r0RdsBWaWS960k9R5UOr2HhN2SqepY+kbasRT
	foUqPCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabj6-00000002kfq-1Su2;
	Fri, 19 Jun 2026 16:05:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabj5-00000002kfk-0hXG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:05:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34A6D601E1;
	Fri, 19 Jun 2026 16:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30E21F000E9;
	Fri, 19 Jun 2026 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781885149;
	bh=X2shzPwH02GzeAm1HaM4r3qbFbXKwpyKGG4nj4wIXZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A0big/Lpttf9pHiCucSIylvS6ZzrhQPLaePLgIjbLA7VPHL+sJTBUo8JZzMxS+hNx
	 evhJMwziwnBLkz7zxiEDsvyCM+oYHTzqp8X9WNC4tJvn4a+z0JnZot0qa3g4eN/sAp
	 XFeFKAVGu/Rxz7+3s8Q4Je3NCh9ebooF//2npFS6FTWHU3slPw28+Y57kEjh5p4bvE
	 rLyLZKYnVD+j86aABxFsPukUJK/0/prbn99WW3i56XzFmFNEFaFd2ppBf0tF7KDoYY
	 5HZdO7TJXtqVl/FwF1vQD7ADcVcOPFO8H1NkZ/Ya/APu5wkUOlLVlKUYD9Zf2I2oZa
	 vgyMSJlWUhvIw==
Date: Fri, 19 Jun 2026 17:05:44 +0100
From: Will Deacon <will@kernel.org>
To: Yiqi Sun <sunyiqixm@gmail.com>
Cc: catalin.marinas@arm.com, kees@kernel.org, keno@juliacomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	luis.machado@linaro.org, mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk, ruanjinjie@huawei.com
Subject: Re: Re: [PATCH] fix: arm64: syscall: use live x0 for
 syscall_get_arguments() arg0
Message-ID: <ajVo2CIw8oikcKV5@willie-the-truck>
References: <ah1-fmV1VcN3cKto@willie-the-truck>
 <20260603090730.16960-1-sunyiqixm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603090730.16960-1-sunyiqixm@gmail.com>
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

On Wed, Jun 03, 2026 at 05:07:30PM +0800, Yiqi Sun wrote:
> On Mon, 1 Jun 2026 13:43:42 +0100, Well wrote:
> > On Fri, May 29, 2026 at 02:54:44PM +0800, Yiqi Sun wrote:
> > > On arm64, seccomp obtains syscall arguments via syscall_get_arguments(),
> > > where arg0 is currently read from regs->orig_x0. However, the syscall
> > > wrapper consumes live arguments from regs->regs[0..5].
> > > 
> > > A ptracer can modify x0 on syscall-enter stop before seccomp runs,
> > > but cannot update orig_x0 through that interface. This can
> > > leave seccomp checking stale arg0 while the syscall executes with updated
> > > live x0, allowing seccomp bypass when filters depend on arg0.
> > > 
> > > Make syscall_get_arguments() read arg0 from regs->regs[0], matching the
> > > actual dispatch arguments and removing this desynchronization.
> > > 
> > > Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
> > > Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> > > ---
> > >  arch/arm64/include/asm/syscall.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> > > index 5e4c7fc44f73..4bdb4d3ce2b4 100644
> > > --- a/arch/arm64/include/asm/syscall.h
> > > +++ b/arch/arm64/include/asm/syscall.h
> > > @@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
> > >  					 struct pt_regs *regs,
> > >  					 unsigned long *args)
> > >  {
> > > -	args[0] = regs->orig_x0;
> > > +	args[0] = regs->regs[0];
> > >  	args[1] = regs->regs[1];
> > >  	args[2] = regs->regs[2];
> > >  	args[3] = regs->regs[3];
> > > -- 
> > > 2.34.1
> > 
> > Hrm, this looks like a long-standing issue and I'm pretty nervous about
> > changing it :/
> > 
> > How did you spot it?
> 
> I share your concern here, and I’m trying to be very careful with any
> behavior change.
> 
> I spotted this while comparing seccomp+ptrace ordering across arches.
> I had previously looked at x86/x86_64 (including the seccomp/ptrace
> ordering fix from more than 10 years ago), and then checked whether
> other arches like arm64 had the same issue.
> 
> > A quick look at the code suggests we have a similar issue with
> > audit_syscall_entry(), so if we take your patch here then it will silently
> > introduce a behavioural change to this guy:
> > 
> > https://lore.kernel.org/all/20260320102620.1336796-5-ruanjinjie@huawei.com/
> > 
> > I also notice that the compat ptrace interface allows 'orig_x0' to be
> > set -- could that cause issues with things like syscall_rollback()?
> > Will
> 
> You are right that on arm64, audit_syscall_entry() still takes arg0
> from orig_x0, so taking only this seccomp fix would diverge seccomp
> and audit semantics.
> 
> I also checked syscall_rollback(): on arm64 it restores regs[0] from
> orig_x0, and orig_x0 is captured at syscall entry before the ptrace
> syscall-stop hook. So rollback normally returns to the syscall-entry
> state (i.e. pre-ptrace argument value), which does not look like a new
> security issue by itself. compat ptrace can explicitly write orig_x0,
> but that is existing tracer-controlled behavior and does not, by itself,
> cross a new security boundary introduced by this patch.
> 
> If you agree, I can send a follow-up later so seccomp/audit stay consistent.

Yes, please send a v2 that fixes audit at the same time.

Will

