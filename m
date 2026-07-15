Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB887C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJRMVavXKsYTe80eRZtLYQwVngIGjT5OT9X370LluXc=; b=M4QgTSTDEP/r4KcPXXlu1jYV1M
	4+P9+v205Yv9OiSnqDZj0AU6T+rYZO+ZBXERXwCtpH2GJ1j3qYjlbe/PFuAyB1GyUabYjbV+L3kNf
	ngTrPf2mFhnfK+h+SRlAnB1f8fghvoxWO2G2vHj/yN0zlIoCFZthgSaBTqzvWrYFOe7AJUBKM4fLL
	bd0laKoKg96KFWTe1Y//dB0qWFf3xsv/mSnhBHY0bqBFG7WZeiHNwwiiIuRPEJmk9ljMKVAf4eHww
	0lhNupaFexAO/L1SSfgw7jEotLyeDeUB3yUFKtqa/2iUz0d/RQdnZPI4qxBMbW7mpQSdxbRDSzXiO
	T0pA2b9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxyM-0000000EbeY-0YPb;
	Wed, 15 Jul 2026 11:40:18 +0000
Received: from [113.46.200.221] (helo=canpmsgout06.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxyH-0000000Ebbj-43n7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:40:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KJRMVavXKsYTe80eRZtLYQwVngIGjT5OT9X370LluXc=;
	b=lDxNM4Ujf/jwPWfJQZ3bZzFBxRWgJNIWTXFL//aIKOiPLGlYC2ANkmNozESfnS/SJmfmJnUvm
	FXSqGXkFXUgLhWBo4H/JVTw0Ujzfgp10k7jRg/ujR0peSQH1Uzu6gUvfgiXXo1Ko3JNeVZU3r/C
	eUO4VWFPLskw8UoYjU9h5TU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h0YrM2BsRzRhQR;
	Wed, 15 Jul 2026 19:30:27 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 79F434057F;
	Wed, 15 Jul 2026 19:39:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jul 2026 19:39:43 +0800
Message-ID: <55b6734e-39b9-40bb-93ae-b869f17476d5@huawei.com>
Date: Wed, 15 Jul 2026 19:39:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>, Catalin Marinas
	<catalin.marinas@arm.com>
References: <20260714143600.23853-1-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260714143600.23853-1-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_044014_407997_D4A92059 
X-CRM114-Status: GOOD (  35.00  )
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



On 7/14/2026 10:35 PM, Will Deacon wrote:
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
> means that seccomp and audit can observe a stale value for the register
> compared to the argument that will be observed by the actual syscall.
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
>  arch/arm64/kernel/ptrace.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..57e8c6714d44 100644
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
> @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
>  		ret = report_syscall_entry(regs);
>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
> +
> +		/*
> +		 * Ensure ptrace changes to x0 are visible to seccomp
> +		 * ptrace exits (SECCOMP_RET_TRACE).
> +		 */

Hi, will,

After delving into the seccomp code, I believe the comments are not
quite accurate, I think SECCOMP_RET_TRACE not return to here.

maybe,

/*
 * Ensure ptrace changes to x0 during a regular syscall-enter-stop
 * (PTRACE_SYSCALL) are visible to subsequent seccomp and audit
 * checking.
 */

> +		update_syscall_orig_x0_after_ptrace(regs);
>  	}
>  
>  	/* Do the secure computing after ptrace; failures should be fast. */
>  	if (secure_computing() == -1)
>  		return NO_SYSCALL;
>  
> +	/* Ensure seccomp updates to x0 are visible to audit. */

This comment is also not quite accurate, it implies that Seccomp itself
(such as SECCOMP_RET_ERRNO) modifies x0, but in this scenario, the audit
is not executed, because __seccomp_filter() skip the syscall.

1279 >-------switch (action) {
1280 >-------case SECCOMP_RET_ERRNO:
1281 >------->-------/* Set low-order bits as an errno, capped at
MAX_ERRNO. */
1282 >------->-------if (data > MAX_ERRNO)
1283 >------->------->-------data = MAX_ERRNO;
1284 >------->-------syscall_set_return_value(current, current_pt_regs(),
1285 >------->------->------->------->------- -data, 0);
1286 >------->-------goto skip;
                   ^^^^^^^^^^^^^<- we skip the syscall if
SECCOMP_RET_ERRNO changes x0


Here what we actually need to synchronize is the tracer's modification
of x0 in the SECCOMP_RET_TRACE path, the SECCOMP_RET_TRACE logic
notifies the tracer, the tracer modifies x0 and modifies the system call
number to a legal value and so we can continue the latter audit.

1295    case SECCOMP_RET_TRACE:
1296        /* We've been put in this state by the ptracer already. */
1297        if (recheck_after_trace)
1298            return true;
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^  <- I think we return here.

1299
1300        /* ENOSYS these calls if there is no tracer attached. */
1301        if (!ptrace_event_enabled(current, PTRACE_EVENT_SECCOMP)) {
1302            syscall_set_return_value(current,
1303                         current_pt_regs(),
1304                         -ENOSYS, 0);
1305            goto skip;
1306        }
1307
1308        /* Allow the BPF to provide the event message */
1309        ptrace_event(PTRACE_EVENT_SECCOMP, data);
1310        /*
1311         * The delivery of a fatal signal during event
1312         * notification may silently skip tracer notification,
1313         * which could leave us with a potentially unmodified
1314         * syscall that the tracer would have liked to have
1315         * changed. Since the process is about to die, we just
1316         * force the syscall to be skipped and let the signal
1317         * kill the process and correctly handle any tracer exit
1318         * notifications.
1319         */
1320        if (fatal_signal_pending(current))
1321            goto skip;
1322        /* Check if the tracer forced the syscall to be skipped. */
1323        this_syscall = syscall_get_nr(current, current_pt_regs());
1324        if (this_syscall < 0)
1325            goto skip;
1326
1327        /*
1328         * Recheck the syscall, since it may have changed. This
1329         * intentionally uses a NULL struct seccomp_data to force
1330         * a reload of all registers. This does not goto skip since
1331         * a skip would have already been reported.
1332         */
1333        return __seccomp_filter(this_syscall, true);


maybe,

/*
 * Ensure tracer changes to x0 during SECCOMP_RET_TRACE processing
 * are visible to later trace and audit.
*/


Otherwsie, LGTM

Best reagards,
Jinjie

> +	update_syscall_orig_x0_after_ptrace(regs);
> +
>  	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>  		trace_sys_enter(regs, regs->syscallno);
>  


