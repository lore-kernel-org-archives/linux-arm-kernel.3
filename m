Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49664C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5199GC69OdVHFe2ZYfzY6fpsLwmA9JkeWcsxv1LcTI=; b=vyB6JEb+YAoy2hk7SHBLeKnyOt
	R95rYFyaH5m19O/Qxv5LMLD6iTTfAExyVmPCPozFlviUvLgesnZg9yqmMKQJ9+8PMUazz6zzKLtUK
	0IwO+ismZZSJL9CmBDXQk7ibJF4kWsq0gc2EKA/cNd7x4xpZw6iUu9n71vzqVUBD+VJIPjKNmEJeI
	p15CrVGqRLchmRYGeyBWxTY9yPmeEkd8dgqnAWLbbLL+O+MaofCxhvzO5EPbzb0Xf8d5YlcharLLm
	jP0zQEUqhjMnai4V1eQBA7X2/UO2QgHJy1ohOLsgqChmycLgNFeQ4nfnkU5ggsdFOs6AMCJh+3DO/
	gIdR4xGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzTb-0000000Euc8-0nzZ;
	Wed, 15 Jul 2026 13:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzTX-0000000Eubq-1zFF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:16:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2FE142D6D;
	Wed, 15 Jul 2026 13:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698F41F00A3A;
	Wed, 15 Jul 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121394;
	bh=H5199GC69OdVHFe2ZYfzY6fpsLwmA9JkeWcsxv1LcTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S3pNjOURqGtTxDulVO2+hJDkGcGs+SKhp6y212/7Smgi7QJiv1nlFsXAST08kDsoU
	 51JU+oWdGguVOS78WsY87DFYH3jPiO16V9+JOMXmh2Oc5uwdhSstL6qbqGYAOnzwb0
	 3XY70YI/6MRtyzQtInoxrxq+cuQQDY2YRlCFaRIs6mrec69yy1jOekBb8EMvDUkpFX
	 cbEoKBk6FjCiXmP4Cu9lcAjW16UNtgGlrQ+eAFNz+pbyOVOQnXfwWUGYZ+CGYEXkf5
	 EqMBb9p9TAHCzYTKHowQ/NWXqKOTkTgmY4sFvhEqVoQh1xCpqrmTYUSgGkxPXNPFG5
	 7eWxQZ0ajdiOA==
Date: Wed, 15 Jul 2026 14:16:29 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <aleILaiTXssk066q@willie-the-truck>
References: <20260714143600.23853-1-will@kernel.org>
 <55b6734e-39b9-40bb-93ae-b869f17476d5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55b6734e-39b9-40bb-93ae-b869f17476d5@huawei.com>
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

Hi Jinjie,

Thank you for having a look at this. We're nearly there!

On Wed, Jul 15, 2026 at 07:39:43PM +0800, Jinjie Ruan wrote:
> On 7/14/2026 10:35 PM, Will Deacon wrote:
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index 4d08598e2891..57e8c6714d44 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
> >  		ret = report_syscall_entry(regs);
> >  		if (ret || (flags & _TIF_SYSCALL_EMU))
> >  			return NO_SYSCALL;
> > +
> > +		/*
> > +		 * Ensure ptrace changes to x0 are visible to seccomp
> > +		 * ptrace exits (SECCOMP_RET_TRACE).
> > +		 */
> 
> After delving into the seccomp code, I believe the comments are not
> quite accurate, I think SECCOMP_RET_TRACE not return to here.
> 
> maybe,
> 
> /*
>  * Ensure ptrace changes to x0 during a regular syscall-enter-stop
>  * (PTRACE_SYSCALL) are visible to subsequent seccomp and audit
>  * checking.
>  */

Yes, that's better. Seccomp BPF filters will get passed whatever comes
back from syscall_get_arguments(), so mentioning SECCOMP_RET_TRACE is
confusing here.

> > +		update_syscall_orig_x0_after_ptrace(regs);
> >  	}
> >  
> >  	/* Do the secure computing after ptrace; failures should be fast. */
> >  	if (secure_computing() == -1)
> >  		return NO_SYSCALL;
> >  
> > +	/* Ensure seccomp updates to x0 are visible to audit. */
> 
> This comment is also not quite accurate, it implies that Seccomp itself
> (such as SECCOMP_RET_ERRNO) modifies x0, but in this scenario, the audit
> is not executed, because __seccomp_filter() skip the syscall.
> 
> 1279 >-------switch (action) {
> 1280 >-------case SECCOMP_RET_ERRNO:
> 1281 >------->-------/* Set low-order bits as an errno, capped at
> MAX_ERRNO. */
> 1282 >------->-------if (data > MAX_ERRNO)
> 1283 >------->------->-------data = MAX_ERRNO;
> 1284 >------->-------syscall_set_return_value(current, current_pt_regs(),
> 1285 >------->------->------->------->------- -data, 0);
> 1286 >------->-------goto skip;
>                    ^^^^^^^^^^^^^<- we skip the syscall if
> SECCOMP_RET_ERRNO changes x0
> 
> 
> Here what we actually need to synchronize is the tracer's modification
> of x0 in the SECCOMP_RET_TRACE path, the SECCOMP_RET_TRACE logic
> notifies the tracer, the tracer modifies x0 and modifies the system call
> number to a legal value and so we can continue the latter audit.

Right, the 'SECCOMP_RET_TRACE' example should be in _this_ comment, not
the previous one.

> /*
>  * Ensure tracer changes to x0 during SECCOMP_RET_TRACE processing
>  * are visible to later trace and audit.
> */

I'll tweak that, as I don't think the tracing part matters (it doesn't
see orig_x0 afaict) and I'd like to be very clear that this is down
to the secure_computing() call. So it becomes:

  /*
   * Ensure tracer changes to x0 during seccomp ptrace exit processing
   * (SECCOMP_RET_TRACE) are visible to audit.
   */

Will

