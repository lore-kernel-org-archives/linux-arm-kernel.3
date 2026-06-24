Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1645CDE003
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG17DtnFrwmF7X1dc4UrC8gEnq47GoL1xsU5PnmYQSg=; b=l2W9msNnN26+bV
	n5/rM8u9P/cBgK9CbVGzOjdyJQMLvlPUsqcklsX2RnbGoanbyI/g6Iw9+UAw7Suek8squb1IXoMbu
	Mldhj2EI0nUFyS9vDcYXeTgR4mzqeMg1vEvNW1XYBPY8GNZpkARS4eI+PlVoJqMrcWzn4byMUihQk
	6T/dK9NZyzMd6MsVALH2o73wqMjw6u48i5QHxxj7cqjku5D5rMjQ1H/6SdZdfVhBzZZj2B/2r0kag
	lfkFFADrvs7hVkSefFccyHMFQf2SONz7YE1zjWNMMePs8VVpw+oqQAi7CBuWbDvDTzqT60lmV31hE
	T+P/nDdJ9vIYNutNS/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNvk-00000007qeQ-3XlJ;
	Wed, 24 Jun 2026 13:46:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNvi-00000007qdu-1TDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:46:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5CF826A4;
	Wed, 24 Jun 2026 06:46:08 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9002F3F905;
	Wed, 24 Jun 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782308773; bh=pG17DtnFrwmF7X1dc4UrC8gEnq47GoL1xsU5PnmYQSg=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=RK78GmT2xEkugTDp7HmM54IrK0gehW5TGtL6dgvFCapOumPrp01DSfWMNs4+vkUSw
	 VPbbcp5bQWWcv4yTDkZ7ivQeFScx8c7UzYC+yAM0wZUyDtVMGmjKgJPyG38W9aPWvH
	 X66GO0RljZBBkJa1iZsLggIJisfko+kMMDGYIsBg=
Message-ID: <581b3f1c-2411-4551-9e35-35f18eccb86f@arm.com>
Date: Wed, 24 Jun 2026 14:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 06/11] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-7-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064614_432156_E248B040 
X-CRM114-Status: GOOD (  14.83  )
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

On 11/05/2026 10:20, Jinjie Ruan wrote:

> Move the rseq_syscall() check earlier in the syscall exit path to ensure
> it operates on the original instruction pointer (regs->pc) before any
> potential modification by a tracer.
>
> [Background]
> When CONFIG_DEBUG_RSEQ is enabled, rseq_syscall() verifies that a system
> call was not executed within an rseq critical section by examining
> regs->pc. If a violation is detected, it triggers a SIGSEGV.
>
> [Problem]
> Currently, arm64 invokes rseq_syscall() after report_syscall_exit().
> However, during report_syscall_exit(), a ptrace tracer can modify the
> task's instruction pointer via PTRACE_SETREGS. This leads to an
> inconsistency where rseq may analyze a post-trace PC instead of the
> actual PC at the time of syscall exit.
>
> [Why this matters]
> The rseq check is intended to validate the execution context of the
> syscall itself. Analyzing a tracer-modified PC can lead to incorrect
> detection or missed violations. Moving the check earlier ensures rseq
> sees the authentic state of the task.
>
> [Alignment]
> This change aligns arm64 with:
> - Generic entry, which calls rseq_syscall() first.
> - arm32 implementation, which also performs the check before audit.
>
> [Impact]
> There is no functional change to signal delivery; SIGSEGV will still be
> processed in arm64_exit_to_user_mode() at the end of the exit path.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

