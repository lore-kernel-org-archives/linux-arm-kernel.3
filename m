Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A3C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEZOZLPcRJxRfh24T0EJSIruoikP/SExaWOW/Kexfns=; b=A7gyuFk2cDw88j8v8DlHKdTu8f
	p3N1koUlq67elpHo4F15c6PFeIwqB+LGNq4hDtD3aVF3hMYL80UKAI1iwbHykFMAHo3/4jXocA7gH
	GHZxFay1TCKhnk2NUNx4qsEIp6urs/qzHLjkh0JywruHI4XqoGxkUavwumVrczdE2/HjFnuKqi0xr
	9VB0t4GgKuU2QmX+f+uwB05uDGCBvyKB/aBKHoxk8ZGm4fxoT2cgt8K4kYdUmQJMeOnr7Tlg5Gm41
	MdQE/cVPyx36Gn2GiRKFoxyIPEVwW+4ThpVAJvcfFwKPt9hvVq1ED+8f4CUmTrCcLBQ0IRvx9UHhS
	c+hk7UKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgbr-0000000Fx98-3TBt;
	Wed, 07 May 2025 15:22:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfvQ-0000000Fow4-0xQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CD4E5C5E0C;
	Wed,  7 May 2025 14:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE9CC4CEE2;
	Wed,  7 May 2025 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746628747;
	bh=M5CcSPuLYGfbJAZJVHYzupINnvinn+df+jpAgdSoM/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HO3jUvrfNNHpzFsaORsIObjB2euzGzEaqvlGLlNgZ8BcE3cwqSOf3xBj05jEyTKjL
	 1iRjHA1UKxPBVGtD+TtsLm3cny4Iq0U8SHu4m+DFV5EliODnN//7B0X7AO1kgn2j9o
	 mFkY0U4VD0rJUmyrziSn+FQraocfEruySNRZdyXoKsaQLpL6zP2S8pRhJC7jYIGAuW
	 1TjiYEH2FurJBI77g0/TQp/JtDNws0GkIykjnVVIOoDDeF+Ofq5I2y7eIQ/Krgbplc
	 wO34+j7xUnJyi2yeG8Ffl/IpaIGfsmxYNj2d7g/7GEYPbs9tKcDw1MPzfj3uGuMsPB
	 FxRNXLTykEVwA==
Date: Wed, 7 May 2025 15:39:01 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 03/20] arm64/fpsimd: signal: Clear PSTATE.SM when
 restoring FPSIMD frame only
Message-ID: <20250507143900.GB2475@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-4-mark.rutland@arm.com>
 <20250507124644.GA2227@willie-the-truck>
 <aBtnzhmqfdbs7hhT@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBtnzhmqfdbs7hhT@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073908_352315_31377A78 
X-CRM114-Status: GOOD (  22.16  )
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

On Wed, May 07, 2025 at 03:01:50PM +0100, Mark Rutland wrote:
> On Wed, May 07, 2025 at 01:46:45PM +0100, Will Deacon wrote:
> > On Tue, May 06, 2025 at 04:25:06PM +0100, Mark Rutland wrote:
> > > diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> > > index 48d3c0129dade..fdce1b856f498 100644
> > > --- a/arch/arm64/kernel/signal.c
> > > +++ b/arch/arm64/kernel/signal.c
> > > @@ -280,6 +280,7 @@ static int restore_fpsimd_context(struct user_ctxs *user)
> > >  	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
> > >  
> > >  	clear_thread_flag(TIF_SVE);
> > > +	current->thread.svcr &= ~SVCR_SM_MASK;
> > >  	current->thread.fp_type = FP_STATE_FPSIMD;
> > 
> > Hmm, I think we're preemptible here so do we need some compiler barriers
> > to make sure that the context-switching code doesn't see these fields in
> > an inconsistent state?
> 
> We avoid that problem by ensuring that the task's FPSIMD/SVE/SME state isn't
> live on any CPU for the duration of the signal code, such that it is safe to
> manipulate the saved state in preemptible context. Details below.
> 
> That was handled in one of the earlier patches in the arm64 for-next/sme-fixes
> branch, queded as commit:
> 
>   929fa99b1215966f ("arm64/fpsimd: signal: Always save+flush state early")
> 
> As of that commit, in setup_rt_frame() we call
> fpsimd_save_and_flush_current_state(), which does:
> 
>   get_cpu_fpsimd_context();
>   fpsimd_save_user_state();
>   fpsimd_flush_task_state(current);
>   put_cpu_fpsimd_context();
> 
> That ensures (in a premption-safe way) that the tasks state has been saved
> to memory, TIF_FOREIGN_FPSTATE is set, and that
> task->thread.fpsimd_cpu==NR_CPUS. Thus on context switch:
> 
> * When switching away from this task, fpsimd_thread_switch() sees
>   TIF_FOREIGN_FPSTATE is set, and doesn't manipulate the task's saved state.
> 
> * When switching to this task, fpsimd_thread_switch() doesn't find any existing
>   state bound on the CPU, and sets TIF_FOREIGN_FPSTATE, without manipulating
>   the task's saved state.
> 
> The task's state will only be relaoded onto the CPU when returning to
> userspace, via fpsimd_restore_current_state().
> 
> Note that we changed fpsimd_update_current_state() to modify the saved state
> without reloading it onto the CPU.

Thanks, that makes sense!

Will

