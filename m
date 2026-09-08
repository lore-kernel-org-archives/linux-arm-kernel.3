Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8C4C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkBgfYvdi7Dob2Y6rXedXnGpmu4vWCYkaHTOx3aX4+8=; b=yL2wBIsndKqWyfQm+m8Ruy4h++
	zVGjdlAkGUp0mi+2KKS05XqNvV/+bM3IsFc1AWci8YJQMNtaXOLLGClWHHiCBR3LqfZ/CcnGeKVHp
	9r+z5qLcN3OJUtzxQqWcIdMOIY1pyw5V7ZrSFXEoZOF4AvKYO/hyGsGSTDT5pvXv/m/cZmAyFI5m1
	Ev/umbgTMedX53HstZnUc/bdKrallQtk0HU1z5d915cIUmN06vxRCDimOHk4Bhuy1Vl5T3SPzqoif
	WefSo3G9CTAC8TfO6dUGgPPDVeeidETQ7ZbIpEUGtFyv9G0/E8dhMqCf6KZF7cC66bFRFle6tIE1x
	HPvneHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3w0H-00000009ASa-3i4n;
	Tue, 08 Sep 2026 13:36:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3w0G-00000009ASO-4A6G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:36:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14822601DB;
	Tue,  8 Sep 2026 13:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B716C1F00A3A;
	Tue,  8 Sep 2026 13:36:45 +0000 (UTC)
Date: Tue, 8 Sep 2026 14:36:39 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 19/19] arm64: smp: Harden parallel CPU bringup against
 broken PSCI firmware
Message-ID: <aqAPZ59D_tfN6wUQ@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-20-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907164024.17164-20-will@kernel.org>
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

On Mon, Sep 07, 2026 at 05:40:22PM +0100, Will Deacon wrote:
> Since firmware has occasionally been known to get things wrong, harden
> our parallel CPU bringup code against a PSCI implementation that passes
> the CPU_ON argument to an incorrect CPU.
> 
> The primary CPU writes the MPIDR of the incoming CPU to the end of its
> task stack and this is then checked against the MPIDR_EL1 register
> during early kernel entry. A mismatch is reported via the existing
> failure reporting mechanism and the CPU is not brought online.
> 
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/smp.h    |  4 +++-
>  arch/arm64/kernel/asm-offsets.c |  1 +
>  arch/arm64/kernel/head.S        | 39 ++++++++++++++++++++++++++++-----
>  arch/arm64/kernel/smp.c         | 11 ++++++++--
>  4 files changed, 46 insertions(+), 9 deletions(-)

[...]

> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index bec4bc1b12db..56deeb9673d6 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -192,11 +192,21 @@ SYM_CODE_END(preserve_boot_args)
>  	 * its location in the task stack. We reserve the entire pt_regs space
>  	 * for consistency with user tasks and kthreads.
>  	 */
> -	.macro	init_cpu_task tsk, tmp1, tmp2
> +	.macro	init_cpu_task tsk, tmp1, tmp2, check_mpidr=
>  	msr	sp_el0, \tsk
>  
>  	ldr	\tmp1, [\tsk, #TSK_STACK]
> -	add	sp, \tmp1, #THREAD_SIZE
> +	mov	sp, \tmp1
> +	.ifnb	\check_mpidr
> +	mov_q	\tmp1, MPIDR_HWID_BITMASK
> +	mrs	\tmp2, mpidr_el1
> +	and	\tmp2, \tmp2, \tmp1
> +	ldr	\tmp1, [sp]
> +	sub	\tmp1, \tmp1, \tmp2
> +	cbnz	\tmp1, __cpu_secondary_broken_psci_arg
> +	.endif
> +
> +	add	sp, sp, #THREAD_SIZE
>  	sub	sp, sp, #PT_REGS_SIZE
>  
>  	stp	xzr, xzr, [sp, #S_STACKFRAME]
> @@ -401,11 +411,12 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>  	cbnz	x2, 1f
>  	adr_l	x0, secondary_data
>  	ldr	x2, [x0, #CPU_BOOT_TASK]
> -	cbz	x2, __secondary_too_slow
> -
> -1:
>  	init_cpu_task x2, x1, x3
> -
> +	cbnz	x2, 2f
> +	b	__secondary_too_slow

Bah, Sashiko points out that this is too late, as x2 has already been
dereferenced on the non-PSCI 0.2+ path. I'll rework this for v2.

Will

