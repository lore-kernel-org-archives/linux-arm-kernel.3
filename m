Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F021C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1+I9oAT2GKmfFvO1KGrOu3B12dW4RJJI8mhhbyQJI4=; b=vA+zNF48F8tQ1R78XYcZXq/hMv
	KqHfwdq6FZ6TGNjVqELGho6ljpnhMXrW6LL4b2B8v+aU0AXX7GNS4CrB7zuYcsWQsRx2bTTHr2Dq7
	Az3xUnzCOIIn7vpsY3eMRO01w+4fd+2iOACeOJrF1ja7Big6YZcD08kzvl2kdZf0iOdsIRlSTUgk8
	d4nWTRWZVEppNNzjlbByvMsGVlbDfpf9GlwqZvh7sXUoGCgFZkKsH3m9f9887OIa+Bfwxjg7xa1I3
	VNquUtjH+bUnkHTwh8TsEAdmvh8r70/5hLMxUxKm19g4oQ+1CAzoXUVGW5ZZCI00ZSGXK9L8dYA2R
	aoeuvHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLCj-0000000HG4I-1b7V;
	Thu, 16 Jul 2026 12:28:41 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLCe-0000000HG0o-3VRR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:28:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=u1+I9oAT2GKmfFvO1KGrOu3B12dW4RJJI8mhhbyQJI4=;
	b=6ZTP5tGWLe0WcsF+pN221kNiLcHSPmfSkv99Gcbcj2t9RoTV1f5MACEwp3EqNr8pqwZ+p2SrA
	ixmKd8bwGfGvB2im7+ZxDesMOEhQxyAeQRAE6z8Hn3YOLx9LGnjYmDtuDXYr+LD/h4nCPEvYbUc
	S/j6bXR6eeHZNhYzdJT4sYk=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h1Bt31yCCz1prKd;
	Thu, 16 Jul 2026 20:19:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D75540537;
	Thu, 16 Jul 2026 20:28:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jul 2026 20:28:27 +0800
Message-ID: <da9c9d13-f23d-4e93-b4cc-9aae56fc678a@huawei.com>
Date: Thu, 16 Jul 2026 20:28:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>, Catalin Marinas
	<catalin.marinas@arm.com>
References: <20260716120640.6590-1-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260716120640.6590-1-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_052837_536826_29664ABF 
X-CRM114-Status: GOOD (  29.23  )
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



On 7/16/2026 8:06 PM, Will Deacon wrote:
> When seccomp support was originally added to arm64 in a1ae65b21941
> ("arm64: add seccomp support"), seccomp was erroneously called _before_
> the ptrace syscall-enter-stop and therefore the tracer could trivially
> manipulate the syscall register state after the seccomp check had
> passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
> seccomp after ptrace") by moving the seccomp check after the tracer has
> run. Unfortunately, a decade later, that fix has been reported to be
> incomplete.
> 
> On arm64, both the first argument to a syscall and its eventual return
> value are allocated to register x0. In order to facilitate syscall
> restarting and querying of syscall arguments on the syscall exit path,
> the original value of x0 is stashed in 'struct pt_regs::orig_x0' early
> during the syscall entry path and is returned for the first argument by
> syscall_get_arguments(). Unlike 32-bit Arm, this stashed value is not
> directly exposed via ptrace() and so changes to register x0 made by the
> tracer on a syscall-enter-stop are not reflected in 'orig_x0'. This
> means that seccomp, syscall tracepoints and audit can observe a stale
> value for the register compared to the argument that will be observed by
> the actual syscall.
> 
> Re-sync 'orig_x0' from x0 on the syscall entry path following a
> potential ptrace stop (i.e. PTRACE_EVENTMSG_SYSCALL_ENTRY or
> SECCOMP_RET_TRACE). This behaviour is limited to native tasks (because
> compat tasks expose 'orig_r0' to ptrace) where the syscall is not being
> skipped (because x0 is updated to hold the return value of -ENOSYS in
> that case).
> 
> Cc: Kees Cook <kees@kernel.org>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Yiqi Sun <sunyiqixm@gmail.com>
> Link: https://lore.kernel.org/all/20260529065444.1336608-1-sunyiqixm@gmail.com/
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: a5cd110cb836 ("arm64/ptrace: run seccomp after ptrace")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> Changes since v1 (https://lore.kernel.org/r/20260714143600.23853-1-will@kernel.org):
>   * Reworded and expanded comments and commit message per Jinjie's
>     feedback
> 
>  arch/arm64/kernel/ptrace.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..390c9b2bd966 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
>  	}
>  }
>  
> +static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
> +{
> +	/*
> +	 * Keep orig_x0 authoritative so that seccomp (via
> +	 * syscall_get_arguments()), audit and the restart path all see the same
> +	 * first argument the syscall is dispatched with, even if it has been
> +	 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
> +	 * or the tracer), as regs[0] holds the return value (see the comment in
> +	 * el0_svc_common()) and can be unwound using syscall_rollback().
> +	 * For compat tasks, orig_r0 is provided directly through GPR index 17.
> +	 */
> +	if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> +		regs->orig_x0 = regs->regs[0];
> +}
> +
>  int syscall_trace_enter(struct pt_regs *regs)
>  {
>  	unsigned long flags = read_thread_flags();
> @@ -2417,12 +2432,26 @@ int syscall_trace_enter(struct pt_regs *regs)
>  		ret = report_syscall_entry(regs);
>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
> +
> +		/*
> +		 * Ensure ptrace changes to x0 during a regular
> +		 * syscall-enter-stop (PTRACE_SYSCALL) are visible to
> +		 * subsequent seccomp checks, tracepoints and audit.
> +		 */
> +		update_syscall_orig_x0_after_ptrace(regs);
>  	}
>  
>  	/* Do the secure computing after ptrace; failures should be fast. */
>  	if (secure_computing() == -1)
>  		return NO_SYSCALL;
>  
> +	/*
> +	 * Ensure tracer changes to x0 during seccomp ptrace exit
> +	 * processing (SECCOMP_RET_TRACE) are visible to tracepoints and
> +	 * audit.
> +	 */
> +	update_syscall_orig_x0_after_ptrace(regs);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>  		trace_sys_enter(regs, regs->syscallno);
>  


