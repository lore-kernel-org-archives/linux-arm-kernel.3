Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F82C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8RE5AQTCdjm7akY4pO6Ryha071bkHMwWKOqBisoBF4=; b=GoZm7Dx+NL467Bx224ZPe3E79s
	HBIroABYm4nU9vgbGmQ9SMYxgXRXq/x3oUP74ZBb6yKAQ8RZIehOPrsfk3Q+7VPsLJh50z85/qZb1
	xVd09dY0AX8rvbtL1RgXkHdUDoy4+jnlkPGRxqesxNHZhDmabjL9So9mbSotuzvCgvTE06v7WhQUk
	Dbnos8hxLAS2dYh2hB6mXMgaYf9Bj471WVB5FLQtdCom680rOWcl3GtSD0QHNFyRBEscPZKJg1pHc
	1GyCjL2tNVrn7WCH++aE5+mViKsoxeSNswt3tHlErYqJO2ngqF/nCiPaWs9akO3Ck2IRyZMgMO1Ba
	qkohVj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmiC-00000006etL-43Do;
	Mon, 20 Jul 2026 12:03:08 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmi9-00000006esf-3Ezi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:03:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U8RE5AQTCdjm7akY4pO6Ryha071bkHMwWKOqBisoBF4=;
	b=Y+69WgpM5CB/BQWXTT288Qa1eixwtLzwuo7AgPYFBZXreSCvd+JNnUZpR2ReLruPh2Ydi0kLD
	v5h1+XBFT6RjYyXExfbeh24taLW3r7mFA+lDy8ACnOivzdqXTvGjI3vIblX/IolJAM25eXtUPJz
	0+uBObqHbNJ+6zhLdlW0XTc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h3f6p4L6xz1cyQQ;
	Mon, 20 Jul 2026 19:53:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AA32A40586;
	Mon, 20 Jul 2026 20:02:58 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Jul 2026 20:02:58 +0800
Message-ID: <63270b68-3f4b-40a1-b806-28639a7ca7fc@huawei.com>
Date: Mon, 20 Jul 2026 20:02:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: ptrace: Keep 'orig_x0' in-sync with x0 on
 syscall entry
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>
References: <20260717182758.17111-1-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260717182758.17111-1-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_050306_171875_8D6FF39D 
X-CRM114-Status: GOOD (  27.33  )
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



On 7/18/2026 2:27 AM, Will Deacon wrote:
> Commit e057b9477232 ("arm64: syscall: Ensure saved x0 is kept in-sync
> with tracer updates") attempted to resolve a long-standing issue with
> syscall entry tracing, where a tracer is able to manipulate the first
> syscall argument without being subjected to seccomp or audit checking.
> 
> Unfortunately, that fix was incomplete [1], as it failed to update
> 'orig_x0' between a tracer updating x0 during a seccomp ptrace exit
> (SECCOMP_RET_TRACE) and the seccomp filter being re-evaluated.
> 
> Rather than add hooks to the core seccomp code, instead move the
> synchronisation code into the ptrace GPR and syscall setting code so
> that 'orig_x0' is kept up to date with x0 whenever we're stopped on the
> syscall entry path.
> 
> Cc: Kees Cook <kees@kernel.org>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Link: https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org [1]
> Reported-by: Yiqi Sun <sunyiqixm@gmail.com>
> Link: https://lore.kernel.org/all/20260529065444.1336608-1-sunyiqixm@gmail.com/
> Fixes: e057b9477232 ("arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates")
> Fixes: a5cd110cb836 ("arm64/ptrace: run seccomp after ptrace")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/ptrace.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> v2: https://lore.kernel.org/r/20260716120640.6590-1-will@kernel.org
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..2b716fa11c02 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -560,6 +560,42 @@ static int gpr_get(struct task_struct *target,
>  	return membuf_write(&to, uregs, sizeof(*uregs));
>  }
>  
> +static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> +{
> +	struct pt_regs *regs = task_pt_regs(target);
> +	struct kernel_siginfo *info = target->last_siginfo;
> +
> +	/* We should only be called when target is in a ptrace stop */
> +	if (WARN_ON_ONCE(!info))
> +		return;
> +
> +	/*
> +	 * Skip the update for NO_SYSCALL (set either by the user or the
> +	 * tracer), as regs[0] holds the return value (see the comment in
> +	 * el0_svc_common()) and can be unwound using syscall_rollback().
> +	 */
> +	if (regs->syscallno == NO_SYSCALL)
> +		return;
> +
> +	/*
> +	 * For compat tasks, orig_r0 is provided directly through GPR index
> +	 * 17.
> +	 */
> +	if (is_compat_thread(task_thread_info(target)))
> +		return;
> +
> +	/*
> +	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> +	 * return value of the system call.
> +	 */
> +	if ((info->si_code & ~0x80) == SIGTRAP &&
> +	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> +		return;
> +	}
> +
> +	regs->orig_x0 = regs->regs[0];
> +}
> +
>  static int gpr_set(struct task_struct *target, const struct user_regset *regset,
>  		   unsigned int pos, unsigned int count,
>  		   const void *kbuf, const void __user *ubuf)
> @@ -575,6 +611,14 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
>  		return -EINVAL;
>  
>  	task_pt_regs(target)->user_regs = newregs;
> +
> +	/*
> +	 * Keep orig_x0 authoritative so that seccomp (via
> +	 * syscall_get_arguments()), audit and the restart path all see the same
> +	 * first argument the syscall is dispatched with, even if it has been
> +	 * updated by a tracer.
> +	 */
> +	update_syscall_orig_x0_after_ptrace(target);

Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	return 0;
>  }
>  
> @@ -753,6 +797,12 @@ static int system_call_set(struct task_struct *target,
>  		return ret;
>  
>  	task_pt_regs(target)->syscallno = syscallno;
> +
> +	/*
> +	 * Re-sync orig_x0 in case the syscall number has been changed
> +	 * from NO_SYSCALL.
> +	 */
> +	update_syscall_orig_x0_after_ptrace(target);
>  	return ret;
>  }
>  


