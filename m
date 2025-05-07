Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A4EC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrlXZo01prC22dTCYl07TMyccN27sMKPpn0zdVJqFv4=; b=AWOYOJtMqYgSK/NUgD5uMyafDv
	Pp2TLuIA0ml3kE0XtXF8OVUv/tN88TKdDVMKyD1GysVnWFaoQoMDj34b7evUuF0g0mgLOT7Ge/mfh
	22KSsmqIB+wIHfgbw1nbWcY92RN4i6zeXbvurQE7lAjbOJl4xn/aURRZf3N1pVHARrB1ZwIUDo7iU
	UD69rnYZabprRqxDka6eKHVkCc8U/Dc55WTlBbr+na2DxnauEOd7Adx2T7tR7oJqarLOQQ1d8Z9Y8
	Ip/Iy9My2XwY9UOiPxTZ9kiE9RsAqDjd0SN2qghGXt1grnKvUlbti1nUMcvsebG59+C194LT7cv8X
	AeWeUdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfxR-0000000FpSs-13sO;
	Wed, 07 May 2025 14:41:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfLw-0000000FgY1-1zTs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:02:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1F5D339;
	Wed,  7 May 2025 07:02:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD6373F5A1;
	Wed,  7 May 2025 07:02:25 -0700 (PDT)
Date: Wed, 7 May 2025 15:01:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 03/20] arm64/fpsimd: signal: Clear PSTATE.SM when
 restoring FPSIMD frame only
Message-ID: <aBtnzhmqfdbs7hhT@J2N7QTR9R3>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-4-mark.rutland@arm.com>
 <20250507124644.GA2227@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507124644.GA2227@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_070228_553844_2B3D1A2E 
X-CRM114-Status: GOOD (  15.79  )
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

On Wed, May 07, 2025 at 01:46:45PM +0100, Will Deacon wrote:
> On Tue, May 06, 2025 at 04:25:06PM +0100, Mark Rutland wrote:
> > diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> > index 48d3c0129dade..fdce1b856f498 100644
> > --- a/arch/arm64/kernel/signal.c
> > +++ b/arch/arm64/kernel/signal.c
> > @@ -280,6 +280,7 @@ static int restore_fpsimd_context(struct user_ctxs *user)
> >  	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
> >  
> >  	clear_thread_flag(TIF_SVE);
> > +	current->thread.svcr &= ~SVCR_SM_MASK;
> >  	current->thread.fp_type = FP_STATE_FPSIMD;
> 
> Hmm, I think we're preemptible here so do we need some compiler barriers
> to make sure that the context-switching code doesn't see these fields in
> an inconsistent state?

We avoid that problem by ensuring that the task's FPSIMD/SVE/SME state isn't
live on any CPU for the duration of the signal code, such that it is safe to
manipulate the saved state in preemptible context. Details below.

That was handled in one of the earlier patches in the arm64 for-next/sme-fixes
branch, queded as commit:

  929fa99b1215966f ("arm64/fpsimd: signal: Always save+flush state early")

As of that commit, in setup_rt_frame() we call
fpsimd_save_and_flush_current_state(), which does:

  get_cpu_fpsimd_context();
  fpsimd_save_user_state();
  fpsimd_flush_task_state(current);
  put_cpu_fpsimd_context();

That ensures (in a premption-safe way) that the tasks state has been saved
to memory, TIF_FOREIGN_FPSTATE is set, and that
task->thread.fpsimd_cpu==NR_CPUS. Thus on context switch:

* When switching away from this task, fpsimd_thread_switch() sees
  TIF_FOREIGN_FPSTATE is set, and doesn't manipulate the task's saved state.

* When switching to this task, fpsimd_thread_switch() doesn't find any existing
  state bound on the CPU, and sets TIF_FOREIGN_FPSTATE, without manipulating
  the task's saved state.

The task's state will only be relaoded onto the CPU when returning to
userspace, via fpsimd_restore_current_state().

Note that we changed fpsimd_update_current_state() to modify the saved state
without reloading it onto the CPU.

Mark.

