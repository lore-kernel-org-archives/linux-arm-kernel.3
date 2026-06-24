Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038B7CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vQQSRz7zTrSnXaHuai6nRBd9Jqxhl+XBqkIboWniPA=; b=XmTXbTaw90scnS
	u/FT3D+xVHmwd6MX4ID/U3MZseW1t8Ocix0BYR3KwogfdL4v3Ut9uB9TJ3sOnBVo5Kr8c09zgaXSa
	0I8tcq719UsbcLqzyA3CyAtx391GaSpY9stnY2YnJdT2ZUli8rmGREBSJgCnaJVbEvfZ30ZDrL6d9
	DyKKSevNOGnulcHInYwqMsz/nmUvOwfO7pUP1ui0O0DCmvCyjVRV+u2M2kSeQ9dn+8sPXdm/+lhVN
	1RQH2p5pvCEcX3/vQ7xS8tr+YxDPYTU3zblS0EXanLgR+9zxp8pzs/GoWl0nDXaojTauZpk+wUOMW
	pKOlXSfpLSkvrCp1acDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOz6-00000007wjR-0DLZ;
	Wed, 24 Jun 2026 14:53:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOz3-00000007wit-47cQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 14:53:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AD212938;
	Wed, 24 Jun 2026 07:53:40 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F3A23F62B;
	Wed, 24 Jun 2026 07:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782312824; bh=VKjN0gNxqpZoqnuGUfnm3VobutF020Ybxl/mWwfDqos=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Znz1thJ9AMZxOoNBNzNYFWGyPt1LN3PHgw4womnrdqXUodZcEjyh/os+kuSLRJ+D/
	 +i45x5YAytdO/kY1WT5oHWd7F5efPW/mp5DlMajJpA7hnM1NMmcur+mIXfGPG4Arpd
	 SXkMhyVcZBoVKK8aRtuWQywLofMrG1a3qzV0541o=
Message-ID: <073a55f2-54ff-4770-8457-bef164261a87@arm.com>
Date: Wed, 24 Jun 2026 15:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 08/11] arm64/ptrace: Define and use
 _TIF_SYSCALL_EXIT_WORK
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-9-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_075346_121847_15FB2F3B 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/05/2026 10:21, Jinjie Ruan wrote:
> Introduce _TIF_SYSCALL_EXIT_WORK to filter out entry-only flags
> during the syscall exit path. This aligns arm64 with the generic
> entry framework's SYSCALL_WORK_EXIT semantics.
>
> [Rationale]
> The current syscall exit path uses _TIF_SYSCALL_WORK to decide whether
> to invoke syscall_exit_work(). However, _TIF_SYSCALL_WORK includes
> flags that are only relevant during syscall entry:
>
> 1. _TIF_SECCOMP: Seccomp filtering (__secure_computing) only runs
>    on entry. There is no seccomp callback for syscall exit.
>
> 2. _TIF_SYSCALL_EMU: In PTRACE_SYSEMU mode, the syscall is
>    intercepted and skipped on entry. Since the syscall is never
>    executed, reporting a syscall exit stop is unnecessary.
>
> [Changes]
> - Define _TIF_SYSCALL_EXIT_WORK: A new mask containing only flags
>    requiring exit processing: _TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT,
>    and _TIF_SYSCALL_TRACEPOINT.
>
> - Update exit path: Use _TIF_SYSCALL_EXIT_WORK in
>    syscall_exit_to_user_mode_work() to avoid redundant calls to
>    audit and ptrace reporting when only entry-flags are set.
>
> - Cleanup: Remove the has_syscall_work() helper as it is no longer
>    needed. Direct flag comparison is now used to distinguish between
>    entry and exit work requirements.
>
> [Impact]
> audit_syscall_exit() and report_syscall_exit() will no longer be
> triggered for seccomp-only or emu-only syscalls. This matches the
> generic entry behavior and improves efficiency by skipping unnecessary
> exit processing.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Definitely not related to this series, but it feels like this brings us
quite close to being able to switch to generic TIF flags as well :
only TIF_FOREIGN_PSTATE and TIF_MTE_ASYNC_FAULT
would need to be moved to the upper 16 bits,
with TIF_RESTORE_SIGMASK and TIF_MEMDIE freeing two slots there.

Not sure how important the bit number changes would be and if any
of the extra generic bits require any arch support (TIF_POLLING_NRFLAG,
TIF_USER_RETURN_NOTIFY, TIF_RSEQ, TIF_HRTIMER_REARM)...

But again, just thinking out loud !
Thanks,
Ada


