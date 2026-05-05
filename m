Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03857CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbfkSXfrmwt5mMJanO13HNjN5fnvoCpeGFun+icH0/k=; b=GgocF6wSOBvJMadqKLh9bJjq1s
	RY3njaPAW7Xnn2fwNwL7Y9bA++LUjQSCeNm/lXImUufV7WxqGX3Wf39+8KSo0BzD6KZML/eS2uCxk
	olXbUt1ZfHoQEsRwDakeAWqCiJEAYiHzWLx8vIF8eVzvAL75aMxglukfJaS8OsVqSUwoiHfMLNaAQ
	f6aN6Zj2dyFX8ENPHkMnpA7NssWXJuTzjJdZUveCb10NOsYT0F8TV7snt36HlUI4sJz1UPzGenykB
	bLBZu1sGDFXL3Yv5NxVjVYWgxY0xGKRiqg+SseQseDJBo7WFe0cNSB355F5ufhbiEZk9ok7Z5Pxrq
	WZs0jAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJDI-0000000Gzzc-0hDe;
	Tue, 05 May 2026 17:05:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJDG-0000000GzyX-1cpT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 17:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UbfkSXfrmwt5mMJanO13HNjN5fnvoCpeGFun+icH0/k=; b=nGQaHoIqzrpJBB4Ge0pUTTXZqy
	GFewkb8Kh6G+r+uMxGx6Q/LrkuJ2I+KsUbHoDek7T8G07uGMGACq9Cb4hd4bu8P07yaa7PtNfPbAU
	1ni++HIVo9yA8jebnyO24VoLYYE4kMPCfA7fPYpvG7I44rglZQu8fe050yQfY1xb4adNiEE3iAiy6
	xrpBCyV/oZUOMviA59HMFjowDGlxcMNuKkTZjIrLGfzlaiT/lgSBiD7W4UBucm6r0kUyovHkS7YAJ
	IFmLs22NZvwcUqcn2wz7xorAWVuPGS0xm2CVxICgR0adIoq34V5uy+EIffdrcpAIcMO+WK+hYE0c5
	eAelKQLA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJDD-0000000E6wo-0sjX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 17:05:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B36616A3;
	Tue,  5 May 2026 10:05:27 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C46333F836;
	Tue,  5 May 2026 10:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778000733; bh=KE6ttzAAl3wam+wCaSl3nO2l6iLsmJ6m4JvdVpqPHr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpdKuWxAheJLgHm3uMupfPJH0EzcY0RRnOLTCW+y/BsMrd11EcmXgC/K+I/4VqJTI
	 G6w1sj5tgm3GNF+v6yuKsVYVWoXOMuRAzsL6g5ZdI0qfDj+iclAGbb6aWccMBvh0jN
	 8XCPnw3jC2heW78r1bht+xmkrlG3iz3hhDDQzcDg=
Date: Tue, 5 May 2026 18:05:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/fpsimd: ptrace: zero target's fpsimd_state, not
 the tracer's
Message-ID: <afojVYiwkiHN43RW@J2N7QTR9R3.cambridge.arm.com>
References: <20260505-fix_ptrace-v1-1-36ac1f6d0bfb@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-fix_ptrace-v1-1-36ac1f6d0bfb@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_180535_559364_B35A8BC1 
X-CRM114-Status: GOOD (  27.11  )
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

Hi Breno,

On Tue, May 05, 2026 at 09:02:13AM -0700, Breno Leitao wrote:
> sve_set_common() is the backend for PTRACE_SETREGSET(NT_ARM_SVE) and
> PTRACE_SETREGSET(NT_ARM_SSVE). Every write in the function operates on
> the tracee (target) - except a single memset that uses current instead,
> zeroing the tracer's saved V0-V31 / FPSR / FPCR shadow on every ptrace
> SETREGSET call.

Sorry about this; this was my bad and definitely needs to be fixed.

> The memset is meant to give the tracee a defined zero register image
> before the user-supplied payload is copied in (for partial writes,
> header-only writes, and FPSIMD<->SVE format switches). Aiming it at
> current both denies the tracee that clean slate and silently corrupts
> the tracer.
> 
> Due to FPSIMD lazy save/restore the wipe only takes effect when the
> tracer's CPU FPSIMD binding is dropped after the memset; the next
> return to userspace then reloads V0-V31, FPSR and FPCR as zero. No
> signal is raised and ptrace() returns success.

You're right that the corruption of the tracer's state is often masked,
but I don't think the last paragraph describes the circumstances
entirely accurately (e.g. if the binding is lost *before* the memset(),
the issue can still occur).

I think it would be better to say:

  The corruption of the tracer's saved FPSIMD state is not always
  observable. Where the tracer's state is live on a CPU, this may reused
  without loading the corrupted state from memory, and will eventually
  be written back over the corrupted state. Where the tracer's state is
  saved in SVE_PT_REGS_SVE format, only the FPSR and FPCR are clobbered,
  and the effective copy of the vectors is in the task's sve_state.

> Reproducible on an arm64 kernel with SVE: a single-threaded tracer that
> loads a known pattern into V0-V31, issues PTRACE_SETREGSET(NT_ARM_SVE)
> on a child, and reads V0-V31 back observes them all zeroed within tens
> of thousands of iterations when a sibling thread keeps stealing the
> FPSIMD CPU binding.
> 
> Fixes: 316283f276eb ("arm64/fpsimd: ptrace: Consistently handle partial writes to NT_ARM_(S)SVE")
> Signed-off-by: Breno Leitao <leitao@debian.org>

This will need to be Cc'd to stable.

With the fixups above (which I assume Catalin or Will can handle):

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/ptrace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index ba5eab23fd900..4d08598e2891d 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -983,8 +983,8 @@ static int sve_set_common(struct task_struct *target,
>  	}
>  
>  	/* Always zero V regs, FPSR, and FPCR */
> -	memset(&current->thread.uw.fpsimd_state, 0,
> -	       sizeof(current->thread.uw.fpsimd_state));
> +	memset(&target->thread.uw.fpsimd_state, 0,
> +	       sizeof(target->thread.uw.fpsimd_state));
>  
>  	/* Registers: FPSIMD-only case */
>  
> 
> ---
> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> change-id: 20260505-fix_ptrace-1bcad595c09e
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

