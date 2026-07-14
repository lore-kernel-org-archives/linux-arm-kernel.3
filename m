Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12306C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvENzWPT8BIDQ2LQGKoQLGSHRTQAQieNQdFR+KeOugA=; b=ODLLmq+sgq76PwHVhRywcVPXM2
	3lfvWo3q6186O3gghIuqXLKnBHC/3w50XKpT/MzBfOeUJS6jdFRmQAaYc8Jcw3eLDujNy2jvs91Sp
	UkU4CgliW4azdZKf5QQ+KSYzs/0Goczh5TwxkLhTiry0l/WbZWvnwPe2AmXYiqTSx+VYjNTvwQljn
	BSJ4AhJKO7HHHxpdWi7OEPyuVeWPlJAaolxMvJCirR+SP9S/WuQk2WHvTWlj1K1/dpj7P5TKCtQA/
	T0/nY/xd3asLxOPKnIbFS7vU/NufCk8ALqYjVH9fF4vY2ksLYHREZ5Er65rkPCIgLINmwQWEHraEA
	jRL2eCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdcr-0000000CFud-03UN;
	Tue, 14 Jul 2026 13:56:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdcq-0000000CFuJ-08Tq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:56:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7907B601ED;
	Tue, 14 Jul 2026 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944121F000E9;
	Tue, 14 Jul 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784037403;
	bh=XvENzWPT8BIDQ2LQGKoQLGSHRTQAQieNQdFR+KeOugA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAx4bJzNzAjHRolKxVz6IF1lmI9TASLuutiBBNHkPe5sZ9McOlDR4Qj/gFVCngBZR
	 lRwCP5p3vlfy7xy1BLW2kHfzOtclnZqUzKWma9XgCqhHuLccl8is2VUwfTxfqjnX5j
	 5RS6YEtJ24ya06dY0hovHhA/8FSNzN2xPYjZ4gY7o3Gksnr4Abn8nutlfvf0MujD3M
	 byRvi0qhNTqUg87wjdKdGsNRz8RI4058ZbsXI+yhhHPYG3FoQh6F9oYwMPw1YYFEh0
	 AKgJsOMO8byI6WY3WN06hRsmGj9jqGNJ7FzRgBU4ljUn0msiUS5U4sI9CdYxRPAvpD
	 3LBeONprKuCRg==
Date: Tue, 14 Jul 2026 14:56:37 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, kees@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit
 after ptrace
Message-ID: <alZAFWIe8MFuOTfB@willie-the-truck>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck>
 <akP8-ddTn9bhIDEW@arm.com>
 <1610f167-1af0-4d20-877c-b362b9b49d94@huawei.com>
 <alTxBVLJmQ7-ZnSS@willie-the-truck>
 <1d55c62e-7c08-4b2b-a009-b770c5ac13bc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d55c62e-7c08-4b2b-a009-b770c5ac13bc@huawei.com>
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

On Tue, Jul 14, 2026 at 11:20:20AM +0800, Jinjie Ruan wrote:
> 
> 
> On 7/13/2026 10:07 PM, Will Deacon wrote:
> > On Mon, Jul 13, 2026 at 03:49:18PM +0800, Jinjie Ruan wrote:
> >> On 7/1/2026 1:29 AM, Catalin Marinas wrote:
> >>> I think we need to keep orig_x0 as our original arg0 throughout the
> >>> kernel and just fix the tracer path to sync it on the syscall entry. It
> >>> doesn't unclutter the code but it shouldn't break the ABI either (unless
> >>> someone relied on the ptrace change x0 and not being noticed by
> >>> seccomp). Something like below:
> >>>
> >>> ----------------8<-----------------------------
> >>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> >>> index 4d08598e2891..cd21b301e154 100644
> >>> --- a/arch/arm64/kernel/ptrace.c
> >>> +++ b/arch/arm64/kernel/ptrace.c
> >>> @@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
> >>>  		ret = report_syscall_entry(regs);
> >>>  		if (ret || (flags & _TIF_SYSCALL_EMU))
> >>>  			return NO_SYSCALL;
> >>> +		/*
> >>> +		 * Keep orig_x0 authoritative so that seccomp (via
> >>> +		 * syscall_get_arguments()), audit and the restart path all
> >>> +		 * see the same first argument the syscall is dispatched with,
> >>> +		 * even if it has been updated by a tracer. Skip this for
> >>> +		 * NO_SYSCALL (set either by the user or the tracer) as
> >>> +		 * regs[0] holds the return value (see the comment in
> >>> +		 * el0_svc_common()). For compat, orig_r0 is provided directly
> >>> +		 * through GPR index 17.
> >>> +		 */
> >>> +		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> >>> +			regs->orig_x0 = regs->regs[0];
> >>
> >> Can we place this fix in report_syscall_entry()? The generic entry
> >> framework has already reserved the function
> >> arch_ptrace_report_syscall_permit_entry() for architecture-specific
> >> customization, so switching to it might be more convenient.
> > 
> > Hmm, your comment prompted me to look at this some more and now I'm
> > unsure that the seccomp handling is correct, even with the fix above.
> 
> Hi Will,
> 
> It seems that this issue can be reproduced itself and Catalin's patch
> can fix the original question.

I'm not disputing that it fixes the reported issue, but I don't think
it's complete.

> I used DeepSeek to help write the following test method and script,
> which can successfully reproduce the issue.

I also have similar testcases for this, thanks.

I'll send a patch shortly.

Will

