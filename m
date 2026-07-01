Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvOWmfkx36mnX9lZaLvMJfF/ThQGv9wnJlAijUC9Frs=; b=lHjas4he/NhZyrlC8ef3uEXuO7
	gZSXVV59UF+4dxkaGGnqIf/V2MxNqPLSW66U+RyHqmeocZqdageFf3exLDFFXWj5Kf1AG3gW8Zthy
	0sJDZtLB842MXLFU1ZrAq6MzOCMj/wN2Qt59ToKJ1CdotkGdgoK+LheUyONyRtFV7aUfmrP8gc16F
	kR9QJKtug3QOX4yRvpklbD7vGuyByYx0MGcqVujgunuz/RUpSE5NZIevhOfbUvCJVJfNJ0+Pf42I5
	X9RxwecD6qfsWO9yjuL9VjMwDzjYlVS07OQ8R/dDy+wfSuEs7SBfjGrj+g3M8UrjFr45J7jLYL+lS
	UyTcWYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbr-000000014Sp-1crj;
	Wed, 01 Jul 2026 08:47:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbq-000000014Qz-0RTg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jvOWmfkx36mnX9lZaLvMJfF/ThQGv9wnJlAijUC9Frs=; b=MKkbRRkeos4wdiwBKfvR4YtU2w
	2IRV6MoV6lFOvyeUJ+uF/IlCbSZsme7KQcUbRHctrKkwyCDoqLe+Tnvw/kWzA2B0KdKVm2KwU6jOS
	Vf3UWWNnDvKRUc9yvtFi+PVB7j4B/r80ZJMJ3zAAm/ki9ihi2RLkbZjsxmOP95sS4s3cdE9fWox9P
	RhHk4cBJFPMZhbVR2Hyipd3BTuY9y9eDLnzIIik7xIOduqGfc6f9MJv+nEzQ+/kLinIUvvEh75j5u
	H4/ddmXP3k2k7EpKj4fG5gF5JONMbk55iJTM9B4fcXgHBdV67RfyHcvq+H9jOnBOeoMvootNHCTMy
	GXjG59+w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqbn-00000002WbF-0JHs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:47:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D6822364;
	Wed,  1 Jul 2026 01:47:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DF533F85F;
	Wed,  1 Jul 2026 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782895668; bh=w3pBCXjVMeki7Wa4icahZC8zG9Ej/FE71V+26Ug4VuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oijyqhpiZolrj8beTQeecoSA0zspbl1mvtV57Ym/R4K+prPzDiGdBChIczbjcUaVV
	 WrH9IXcx+TGFctE2AL5iKqnbDmSN5YsUBHGNi/t0TPwAWvtSKU7gFST9T4r0jQRS0P
	 m2y/NYpIM86KyPvJ2VzEms1bntoWqq4kbJi9pZ6k=
Date: Wed, 1 Jul 2026 09:47:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Yiqi Sun <sunyiqixm@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com, kees@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit
 after ptrace
Message-ID: <akTUMn7AGet8ITcA@arm.com>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck>
 <akP8-ddTn9bhIDEW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akP8-ddTn9bhIDEW@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094751_475200_D88659C1 
X-CRM114-Status: GOOD (  32.03  )
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

On Tue, Jun 30, 2026 at 06:29:29PM +0100, Catalin Marinas wrote:
> I think we need to keep orig_x0 as our original arg0 throughout the
> kernel and just fix the tracer path to sync it on the syscall entry. It
> doesn't unclutter the code but it shouldn't break the ABI either (unless
> someone relied on the ptrace change x0 and not being noticed by
> seccomp). Something like below:
> 
> ----------------8<-----------------------------
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..cd21b301e154 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
>  		ret = report_syscall_entry(regs);
>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
> +		/*
> +		 * Keep orig_x0 authoritative so that seccomp (via
> +		 * syscall_get_arguments()), audit and the restart path all
> +		 * see the same first argument the syscall is dispatched with,
> +		 * even if it has been updated by a tracer. Skip this for
> +		 * NO_SYSCALL (set either by the user or the tracer) as
> +		 * regs[0] holds the return value (see the comment in
> +		 * el0_svc_common()). For compat, orig_r0 is provided directly
> +		 * through GPR index 17.
> +		 */
> +		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> +			regs->orig_x0 = regs->regs[0];
>  	}
>  
>  	/* Do the secure computing after ptrace; failures should be fast. */
> ----------------8<-----------------------------
> 
> If we want to change the ABI, we could do like riscv and only set the
> arguments via PTRACE_SET_SYSCALL_INFO while the GPR ptrace accesses
> whatever is in regs[0] - either the original arg or the return value. I
> think they changed this inadvertently in 2023 when they moved to the
> generic syscall.

Looking at some of the history, the ABI break on riscv was noticed, so
definitely not an option for us. I think the change would have looked
something like below. We could keep regs[0] match orig_x0 for entry but
it gets out of sync later, so still confusing for gdb/lldb/strace.

---------------8<----------------------
diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..c58ac8d25692 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -93,19 +93,12 @@ static inline void syscall_set_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 const unsigned long *args)
 {
-	regs->regs[0] = args[0];
+	regs->orig_x0 = args[0];
 	regs->regs[1] = args[1];
 	regs->regs[2] = args[2];
 	regs->regs[3] = args[3];
 	regs->regs[4] = args[4];
 	regs->regs[5] = args[5];
-
-	/*
-	 * Also copy the first argument into orig_x0
-	 * so that syscall_get_arguments() would return it
-	 * instead of the previous value.
-	 */
-	regs->orig_x0 = regs->regs[0];
 }
 
 /*
diff --git a/arch/arm64/include/asm/syscall_wrapper.h b/arch/arm64/include/asm/syscall_wrapper.h
index abb57bc54305..6b13d7c8ad95 100644
--- a/arch/arm64/include/asm/syscall_wrapper.h
+++ b/arch/arm64/include/asm/syscall_wrapper.h
@@ -12,7 +12,7 @@
 
 #define SC_ARM64_REGS_TO_ARGS(x, ...)				\
 	__MAP(x,__SC_ARGS					\
-	      ,,regs->regs[0],,regs->regs[1],,regs->regs[2]	\
+	      ,,regs->orig_x0,,regs->regs[1],,regs->regs[2]	\
 	      ,,regs->regs[3],,regs->regs[4],,regs->regs[5])
 
 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 358ddfbf1401..a80596531a5c 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -66,6 +66,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 
 	regs->orig_x0 = regs->regs[0];
 	regs->syscallno = scno;
+	syscall_set_return_value(current, regs, -ENOSYS, 0);
 
 	/*
 	 * BTI note:
@@ -111,8 +112,6 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 * setting the return value is unlikely to do anything sensible
 		 * anyway.
 		 */
-		if (scno == NO_SYSCALL)
-			syscall_set_return_value(current, regs, -ENOSYS, 0);
 		scno = syscall_trace_enter(regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;

-- 
Catalin

