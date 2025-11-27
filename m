Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D748D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzIcpE0mJhm+04C0xqKc4M5blIlxjtTY63a286pqLG0=; b=Fl2vA9QuM7puf/sDSChQQicjaJ
	YG5jt8GP+1gcz+MVsH6JxqfLJCh2uM2MExmtDYcudPm2O9ZE/8bGBAFmQqzeQoPQwDadeVUleQn0A
	Jo847cEGGRGhm6DFgO7Tufgjo/6WTR0UlFZw9aM7R9httSmmrWFVWeTa5h+cggoy0hbcyaioDn6kH
	TqIYmgEAwIsPNbuf1hxO/puDcw9bB1JNoR/1FAtE/HMGKqDxJwtf6Bv8Ir3yqH/+dNZKHY+xDcOlL
	MesZbACTNDrTvFeXpG11zUqw9JHgGxyQZhLaH/0ljxHQOqPlh8pavsaXYmK+GvjN67qgFvgHI1AkP
	HcsHNgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc3d-0000000Gg0P-0R5U;
	Thu, 27 Nov 2025 13:29:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc3a-0000000Gfz7-1HHx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 527A81713;
	Thu, 27 Nov 2025 05:29:02 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAFA23F66E;
	Thu, 27 Nov 2025 05:29:03 -0800 (PST)
Message-ID: <e769993b-b508-4f59-bc66-f6cb955375e5@arm.com>
Date: Thu, 27 Nov 2025 14:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/12] arm64: syscall: Rework el0_svc_common()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 charlie@rivosinc.com, akpm@linux-foundation.org, ldv@strace.io,
 macro@orcam.me.uk, deller@gmx.de, mark.rutland@arm.com, efault@gmx.de,
 song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
 <20251126071446.3234218-6-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126071446.3234218-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_052910_397619_3E5CD78F 
X-CRM114-Status: GOOD (  10.63  )
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

On 26/11/2025 08:14, Jinjie Ruan wrote:
> The generic syscall syscall_exit_work() has the following content:
>
> | audit_syscall_exit(regs)
> | trace_sys_exit(regs, ...)
> | ptrace_report_syscall_exit(regs, step)
>
> The generic syscall syscall_exit_to_user_mode_work() has
> the following form:
>
> | unsigned long work = READ_ONCE(current_thread_info()->syscall_work)
> | rseq_syscall()
> | if (unlikely(work & SYSCALL_WORK_EXIT))
> |	syscall_exit_work(regs, work)
>
> In preparation for moving arm64 over to the generic entry code,
> rework el0_svc_common() as below:
>
> - Rename syscall_trace_exit() to syscall_exit_work().
>
> - Add syscall_exit_to_user_mode_prepare() function to replace
>   the combination of read_thread_flags() and syscall_exit_work(),
>   also move the syscall exit check logic into it. Move has_syscall_work()
>   helper into asm/syscall.h for reuse.
>
> - As currently rseq_syscall() is always called and itself is controlled
>   by the CONFIG_DEBUG_RSEQ macro, so the CONFIG_DEBUG_RSEQ check
>   is removed.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

