Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cEkytVTh;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JeJjMLC7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yBDBfddaUvxfPKX7S3biSebLhWa78wPzWcZi2nvKfc4=; b=cEkytVThj4EILWK7xTplY4onLh
	fgwU0NTGMYU5IuYpaQTJMqngvuo32RSwxavc9lXjm8P1xBuxuuSMoZu/L50OpM+s2hGB27cGJ/aR3
	xIqUxsQB2Fx/fJPBkaw+1k7zwI7IhNAtHDfR7kBXD9birUJmPJFS+Mtrf9ZIYDjvL1iJHPRRPLz/t
	EpcKgSO/XW7j4RBeZBcEsWTGdL+9OunJ/F+cPaJbtixtNYr986zcOXYipFEQ7VdDqoGu7xLhUeX18
	kRFUPAQj335ze4leN//D7M1nLWnGGIonUbK8qduqA0q7QLszo7hQHesRpbgnTYzGm4Fg8CCSnQT+A
	9fAW7qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPVD-000000035S3-28Xi;
	Mon, 26 Oct 2026 18:32:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPVA-000000035RR-2kIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:32:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 426D415A1;
	Mon, 26 Oct 2026 11:32:46 -0700 (PDT)
Received: from arm.com (RQ4T19M611-7.cambridge.arm.com [10.0.144.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52D0E3F7B4;
	Mon, 26 Oct 2026 11:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793039569; bh=KyOTK+JHmlO+rcDJ12BHciVm13fsPWlRYD/5lfdsduk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeJjMLC7Y+Do9bszcjHu+F7V++WE6b4FSUWOc+6miEWnE6wx7ab8VGUpWBKoWZwQd
	 1VHo2IYXWh1soAcUMux5cYpkxT42ynzJmu7VJOZdoe2F5ukJtWee7fnPC2Wnect0eo
	 ZTz5Z100eZ85VG8/o7b9PL4ei0CSnJjaYhZ0al+8=
Date: Mon, 26 Oct 2026 18:32:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: will@kernel.org, mark.rutland@arm.com, oleg@redhat.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <at-czRUYRPRxi9dy@arm.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023110710.10145-1-zhaogongyi@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_113256_744569_D4A8A2D8 
X-CRM114-Status: GOOD (  21.16  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 07:07:10PM +0800, Zhao Gongyi wrote:
> PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
> which calls ptrace_stop() without siginfo. If the tracer writes
> NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
> NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
> WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.
> 
> Remove the warning and guard the syscall-exit-stop check against a
> missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
> syscall-exit-stops use either value depending on whether the tracer
> enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
> assignment to synchronize orig_x0 from x0.
> 
> Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> ---
> Changes since v1:
> - Remove the warning and early return, as suggested by Oleg.
> - Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.
> 
> v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com
> 
> Tested on arm64 KVM at af32da41b032 with this v2 applied.
> At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
> NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
> x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
> with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
> respectively). No kernel warnings occurred.
> 
>  arch/arm64/kernel/ptrace.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f743cbec1..22fb9eeed 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>  
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> -		return;

That's a slight semantic change since this function may now update
orig_x0 even when !info. However, I think it makes more sense as the aim
of commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0
on syscall entry") was to update orig_x0 in all cases other than
syscall-exit-stop. We can't have the latter with !info.

I'll wait for a couple of days to see if Will has any comments and queue
it.

Thanks.

-- 
Catalin

