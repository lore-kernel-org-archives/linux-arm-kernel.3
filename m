Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C4DCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwxSrQJom/8+piGZQ0dmbiXuzRTCjKP4HndRUD3YqCs=; b=fJUrUzhQDGE1Z87JXdUv/vUlDC
	0PuD395qMuhMWNogVPvUzMV3U3VBd/rtfMiE5szhQlfiTfmXxhzjGzPv1eEWTln+hcV9Xb4jSqncE
	gAB7MP/XwFHISeTePlNOfv1oX7vBB4DfEZCt2eh34nDArTBk1A3GKkq07gJkY6H5ASA7SztYDU24B
	nwZmD4Ld0uMsMIdC2E43P81qWv+oqwrhih25VPJp/l57e0ueDS78jvaIZ/glkjkFJ2/1yB0nbkM/o
	woiWipxz8Q11p/uwT0nqxPJKwoLIGOQPnRlameYdIXwnL62iQ1/sFfNE2HBMzW5umA0I0Xip7L/rc
	aPow/v6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZo0-0000000BBqN-1lrO;
	Fri, 02 Oct 2026 09:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZnx-0000000BBq2-2OCZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:43:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9058A497;
	Fri,  2 Oct 2026 02:43:44 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 948943F86F;
	Fri,  2 Oct 2026 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790934228; bh=bIlBGTbE6NoUAOiXsN6aRXwqWjVDbHnZ0+fxNYTuTGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fixO7Oy2bsG6sTQ1wi7KjtqwK3C14qSLwNZX3cDr1fYuHSdXkjcNVXzBFfW4DIqXB
	 6i7cyA4MCbeAiEQ/LtYpwcHgAi1mddIuVno7/HOUUNokK3V/gA32fjncacVbo44tYa
	 rR2t9dY+4iHbyj7jH/hRWTcrhVGxFOrr9z+h3bQQ=
Date: Fri, 2 Oct 2026 10:43:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, rmikey@meta.com, kas@kernel.org,
	usama.arif@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/sve: Don't zero the SVE state buffer when the
 SVE state is live
Message-ID: <ar98zc8h7UkIR6yc@J2N7QTR9R3.cambridge.arm.com>
References: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_024349_689573_9375813E 
X-CRM114-Status: GOOD (  25.69  )
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

On Tue, Sep 15, 2026 at 03:51:05AM -0700, Breno Leitao wrote:
> Currently do_sve_acc() always zeroes current->thread.sve_state. This is
> not necessary in the common case, and avoiding the zeroing has a
> measurable impact on some benchmarks.
> 
> In the common case where the task is not preempted and its state is not
> altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
> is clear. In such cases, only the live register values matter, and the
> in-memory copy is stale regardless of whether it is saved in
> FP_STATE_FPSIMD format or FP_STATE_SVE format.
> 
> It is worth skipping the zeroing because the SVE state is discarded on
> syscall entry, so userspace that mixes SVE and syscalls re-traps
> constantly. A fleet profile of arm64 hosts running services whose
> memset() is SVE shows the memset under do_sve_acc() accounting for 29%
> of the trap handling cost.
> 
> Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
> performance governor) with perf bench sched pipe pinned to one CPU, and
> SVE operation on write, so that each loop also takes an SVE access trap.
> 
> 	* -0.99% kernel instructions
> 	* -1.38% kernel cycles
> 	* -1.12% wall clock
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Avoiding the memset in the fast path makes sense to me, and I believe
this is sound, so:

Acked-by: Mark Rutlame <mark.rutland@arm.com>

Mark.

> ---
> Changes in v2:
> - Rewrote the commit message using Mark's suggested wording: what
>   matters is that the in-memory copy is stale whenever the state is
>   live, not the format it was last saved in
> - Link to v1:
>   https://patch.msgid.link/20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org
> ---
>  arch/arm64/kernel/fpsimd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e7f1682a3059b..324c9799b0511 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1316,7 +1316,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  		return;
>  	}
>  
> -	sve_alloc(current, true);
> +	sve_alloc(current, false);
>  	if (!current->thread.sve_state) {
>  		force_sig(SIGKILL);
>  		return;
> @@ -1341,6 +1341,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  		sve_flush_live();
>  		fpsimd_bind_task_to_cpu();
>  	} else {
> +		memset(current->thread.sve_state, 0, sve_state_size(current));
>  		fpsimd_to_sve(current);
>  		current->thread.fp_type = FP_STATE_SVE;
>  		fpsimd_flush_task_state(current);
> 
> ---
> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
> change-id: 20260911-b4-arm64-sve-acc-memset-3425ad567857
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

