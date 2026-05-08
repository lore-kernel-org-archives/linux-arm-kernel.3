Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F18BCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFSeEfGGNV+FW5uJAJBdqgcV9A/JyEddbEDCQvEiO6g=; b=q5Z3TTBowzBHbkzh+m49WZd0U8
	ox+5NI0z0K6AXbfmdeIbCnuegND4+EonTRemweggXRAFRHJY0pYRJi9WImCvVJQSsnTbhJftDwmQT
	J9rhbMQ1Yc+a/VOxGWwkHp53ClH1Dx4PSWE1T7Vknf5NbSN1QagGwUJfWrYQeigzwQ7o8gXON3ddO
	8rkt7K1S2TG6YaHCOL5ewOO1bXYLK+6SkS3UkVh1V3bWepJhSJGai1FJAJLFRVk+sz7OSfDKZW5qG
	TjcbdXtdqwbOGVSHAOhoc/7CrFwUkRzdfHQEMv7kj7V6Qs/urTkUVX02oaBojxv1VnNFdwkSiMvdD
	yM93Tkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM7f-00000006fHj-14Vc;
	Fri, 08 May 2026 14:24:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM7c-00000006fGo-45R2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:24:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AF261D34;
	Fri,  8 May 2026 07:23:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B0F3F763;
	Fri,  8 May 2026 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778250244; bh=ey7j9mUyY/5BkGE3ioQIxIOGQe6vQUDgNT0wSP5HSn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f//jqe4qjaix8EYoHr4nh8K0vmc4rWVJGmfLkqhRiuebd+7CkHcs6C+F+6HZ/DCMp
	 pDGLbbTUg61TmkBZW38vt1j5M0HcOXhMtiA9CnF790CtCAcwxA0wjVgpMKHEeBMZ7g
	 Sw+4jWoLAH+pQ9aRBO8wLrkRLWD4B3WQtFAV7/p4=
Date: Fri, 8 May 2026 15:24:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	ckennelly@google.com, dvyukov@google.com,
	linux-kernel@vger.kernel.org, mathias@mongodb.com,
	mathieu.desnoyers@efficios.com, ruanjinjie@huawei.com
Subject: Re: [PATCHv2] arm64/entry: Fix arm64-specific rseq brokenness
Message-ID: <af3yAVRI1M686cbu@arm.com>
References: <20260508142023.3268622-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508142023.3268622-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_072409_099845_37B572F2 
X-CRM114-Status: GOOD (  23.07  )
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

On Fri, May 08, 2026 at 03:20:23PM +0100, Mark Rutland wrote:
> Mathias Stearn reports that since v6.19, there are two big issues
> affecting rseq:
> 
> (1) On arm64 specifically, rseq critical sections aren't aborted when
>     they should be.
> 
> (2) The 'cpu_id_start' field is no longer written by the kernel in all
>     cases it used to be, including some cases where TCMalloc depends on
>     the kernel clobbering the field.
> 
> This patch fixes issue #1. This patch DOES NOT fix issue #2, which will
> need to be addressed by other patches.
> 
> The arm64-specific brokenness is a result of commits:
> 
>   2fc0e4b4126c ("rseq: Record interrupt from user space")
>   39a167560a61 ("rseq: Optimize event setting")
> 
> The first commit failed to add a call to rseq_note_user_irq_entry() on
> arm64. Thus arm64 never sets rseq_event::user_irq to record that it may
> be necessary to abort an active rseq critical section upon return to
> userspace. On its own, this commit had no functional impact as the value
> of rseq_event::user_irq was not consumed.
> 
> The second commit relied upon rseq_event::user_irq to determine whether
> or not to bother to perform rseq work when returning to userspace. As
> rseq_event::user_irq wasn't set on arm64, this work would be skipped,
> and consequently an active rseq critical section would not be aborted.
> 
> Fix this by giving arm64 syscall-specific entry/exit paths, and
> performing the relevant logic in syscall and non-syscall paths,
> including calling rseq_note_user_irq_entry() for non-syscall entry.
> 
> Currently arm64 cannot use syscall_enter_from_user_mode(),
> syscall_exit_to_user_mode(), and irqentry_exit_to_user_mode(), due to
> ordering constraints with exception masking, and risk of ABI breakage
> for syscall tracing/audit/etc. For the moment the entry/exit logic is
> left as arm64-specific, directly using enter_from_user_mode() and
> exit_to_user_mode(), but mirroring the generic code.
> 
> I intend to follow up with refactoring/cleanup, as we did for kernel
> mode entry paths in commit:
> 
>   041aa7a85390 ("entry: Split preemption from irqentry_exit_to_kernel_mode()")
> 
> ... which will allow arm64 to use the GENERIC_IRQ_ENTRY functions directly.
> 
> Fixes: 39a167560a61 ("rseq: Optimize event setting")
> Reported-by: Mathias Stearn <mathias@mongodb.com>
> Link: https://lore.kernel.org/regressions/CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com/
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Chris Kennelly <ckennelly@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

