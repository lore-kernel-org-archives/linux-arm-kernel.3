Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED13F44847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GER4xHgLGns38jWtowZ0gJ7BvlMHw/222rnapSfS/kI=; b=gjke9a1381nINrxreFRJRXJJPG
	gzmCMynh+tWv1ToPFZSWGslItBjB5lTHuWUpDQ7gaN5ezTnCgSAsNvRTB0kNpGl8As5Mk0/ezgaUk
	6JYOLdezHnfkHPBJZ3Z34Q5uK6NVTRoXAAW+0qwD+zxqP0BRclTQk8jpKtjJ0P7C+kF5YQGAqqF7f
	NtLZKadCDqCIHmIbXcpcSnXqJUuQwF7pEaNHZGiZLAd5TjKuWF7QF6RteMLQS7/Z0J0Cw5d4oNjLM
	kLmK/gNpAm7CUao2X+p50L/FgB2YYULn0Y7C9ZN2hYIWkEK756Te1o/blH/DwaU9DUamZJpFI+M82
	yi4nPXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAgG-0000000C85w-37q1;
	Fri, 10 Apr 2026 12:09:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAgE-0000000C85b-1FQo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C018740435;
	Fri, 10 Apr 2026 12:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE98C19421;
	Fri, 10 Apr 2026 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775822985;
	bh=8B5+h0VW42uxjhAf0RKBdHcq3WANP/cWnjE7s0YZbCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E49TwUSIcjCG2v/CF+UPOG626mS7V3qlEclw+f9dVjnazSOA7umhbnag6s4FiWnMW
	 y3wsPP9bIoigaTofv3ZqXLPyTGC/XKQ/5OwTmVpdDUkJr+NjSMyU0rqsDg3S2H73jU
	 FokBoE4CFk/w6PPgw8aRTUWEUuSeLp4VQB/N8cJq0bg2jwLtPJT3J0yO0rMmHBF6jR
	 Fc+uXLTgcSL7zhGmmGCMmu/4ygb16gyc7A0BEOjfoTytWL8eR46T50MC6nCV5KhYSu
	 uDCEf46wRMy/daaLTI35H8apR8/7oFPTcyY5mmfwvbjuZwwCPsjonaq7j4vBJiOSvq
	 T36ekGDU2KQrw==
Date: Fri, 10 Apr 2026 13:09:41 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 4/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <adjohQBfrHVc1HIh@willie-the-truck>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
 <20260407102848.2266988-5-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407102848.2266988-5-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_050946_399102_057E3D80 
X-CRM114-Status: GOOD (  21.78  )
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

On Tue, Apr 07, 2026 at 11:28:44AM +0100, Catalin Marinas wrote:
> C1-Pro acknowledges DVMSync messages before completing the SME/CME
> memory accesses. Work around this by issuing an IPI to the affected CPUs
> if they are running in EL0 with SME enabled.
> 
> Note that we avoid the local DSB in the IPI handler as the kernel runs
> with SCTLR_EL1.IESB=1. This is sufficient to complete SME memory
> accesses at EL0 on taking an exception to EL1. On the return to user
> path, no barrier is necessary either. See the comment in
> sme_set_active() and the more detailed explanation in the link below.
> 
> To avoid a potential IPI flood from malicious applications (e.g.
> madvise(MADV_PAGEOUT) in a tight loop), track where a process is active
> via mm_cpumask() and only interrupt those CPUs.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/r/ablEXwhfKyJW1i7l@J2N7QTR9R3
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 +
>  arch/arm64/Kconfig                          | 12 ++++
>  arch/arm64/include/asm/cpucaps.h            |  2 +
>  arch/arm64/include/asm/fpsimd.h             | 21 ++++++
>  arch/arm64/include/asm/tlbbatch.h           | 10 ++-
>  arch/arm64/include/asm/tlbflush.h           | 72 ++++++++++++++++++-
>  arch/arm64/kernel/cpu_errata.c              | 30 ++++++++
>  arch/arm64/kernel/entry-common.c            |  3 +
>  arch/arm64/kernel/fpsimd.c                  | 79 +++++++++++++++++++++
>  arch/arm64/kernel/process.c                 | 36 ++++++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  11 files changed, 264 insertions(+), 4 deletions(-)

[...]

> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 489554931231..4c328b7c79ba 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -26,6 +26,7 @@
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
> +#include <linux/cpumask.h>
>  #include <linux/cpu.h>
>  #include <linux/elfcore.h>
>  #include <linux/pm.h>
> @@ -339,8 +340,41 @@ void flush_thread(void)
>  	flush_gcs();
>  }
>  
> +#ifdef CONFIG_ARM64_ERRATUM_4193714
> +
> +static void arch_dup_tlbbatch_mask(struct task_struct *dst)
> +{
> +	/*
> +	 * Clear the inherited cpumask with memset() to cover both cases where
> +	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
> +	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
> +	 */
> +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
> +		memset(&dst->tlb_ubc.arch.cpumask, 0,
> +		       sizeof(dst->tlb_ubc.arch.cpumask));

nit: use cpumask_clear() instead?

Will

