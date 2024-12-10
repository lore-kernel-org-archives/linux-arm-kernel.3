Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D6AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzbNRT3o+dEpiXQX06IfgoG1/uk+8R3Rxbzx3WMcNq0=; b=ryzs0Z/KbXPSDbKQ+Cw8ivcswn
	FpbdNvT0wqIHo0+DFWLv7i/odZ3ALxbg6T0WyM0qa7JUlSjawksq1N2bPuHlUSkS5q6s7WKOKjZpY
	fuUCaB1vFY9wpJ4Iua6nCjN+c3T7N0bMYpxiUogV1tXB3oYUHdeyYgNhUAdSFgpRnNmK15FVPswF7
	t0ERH/kFu/K8n/PHxD50QXRVPNJ/5dIuGk/7Dhga3M5CNJX3vTNKyClYxCMemCmE7PhGGCKpx8nti
	amC7FvumpA5Htd4nzzy6pBfVa26k5NaKLzHPxhxLJJrvQV9Kzia91AimQwYwL0KR8Eum8KgUatme5
	eqcSaABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0Nh-0000000BahY-3wEc;
	Tue, 10 Dec 2024 13:34:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0Mf-0000000BadY-1BhO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:33:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EEFF106F;
	Tue, 10 Dec 2024 05:33:51 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A62DF3F58B;
	Tue, 10 Dec 2024 05:33:22 -0800 (PST)
Date: Tue, 10 Dec 2024 13:33:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aishwarya.tcv@arm.com, catalin.marinas@arm.com,
	kent.overstreet@linux.dev, will@kernel.org
Subject: Re: [PATCH] arm64: stacktrace: skip reporting LR at exception
 boundaries
Message-ID: <Z1hDHLbvNZDTDlTk@J2N7QTR9R3>
References: <20241209110351.1876804-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209110351.1876804-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_053325_406393_B1014B22 
X-CRM114-Status: GOOD (  24.79  )
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

Hi Catalin, Will,

Please disregard this patch for now -- there are some related issues
with unwinding distinct tasks, and I will send a new parch/series
shortly which will supersede this.

Mark.

On Mon, Dec 09, 2024 at 11:03:51AM +0000, Mark Rutland wrote:
> Recently the arm64 stacktrace code was modified to report the LR at
> exception boundaries, which interacts poorly with fgraph tracing. It is
> possible for the LR to contain the start address of return_to_handler()
> even when the LR is not live, and in such cases attempts to recover the
> return address via ftrace_graph_ret_addr() may fail, triggering a
> WARN_ON_ONCE() in kunwind_recover_return_address() and aborting the
> unwind. This has resulted in test failures and unexpected warnings, as
> reported by Aishwarya and Kent.
> 
> Handling unreliable LR values in these cases is likely to require some
> larger rework, so for the moment avoid this problem by restoring the old
> behaviour of skipping the LR at exception boundaries, as we did prior to
> commit:
> 
>   c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")
> 
> This commit is effectively a partial revert, keeping the structures and
> logic to explicitly identify exception boundaries while still skipping
> reporting of the LR. The logic to explicitly identify exception
> boundaries is still useful for general robustness and as a building
> block for future support for reliably stacktracing.
> 
> Fixes: c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/stacktrace.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> index caef85462acb6..4a08ad8158380 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -26,7 +26,6 @@ enum kunwind_source {
>  	KUNWIND_SOURCE_CALLER,
>  	KUNWIND_SOURCE_TASK,
>  	KUNWIND_SOURCE_REGS_PC,
> -	KUNWIND_SOURCE_REGS_LR,
>  };
>  
>  union unwind_flags {
> @@ -178,23 +177,8 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
>  	state->regs = regs;
>  	state->common.pc = regs->pc;
>  	state->common.fp = regs->regs[29];
> -	state->source = KUNWIND_SOURCE_REGS_PC;
> -	return 0;
> -}
> -
> -static __always_inline int
> -kunwind_next_regs_lr(struct kunwind_state *state)
> -{
> -	/*
> -	 * The stack for the regs was consumed by kunwind_next_regs_pc(), so we
> -	 * cannot consume that again here, but we know the regs are safe to
> -	 * access.
> -	 */
> -	state->common.pc = state->regs->regs[30];
> -	state->common.fp = state->regs->regs[29];
>  	state->regs = NULL;
> -	state->source = KUNWIND_SOURCE_REGS_LR;
> -
> +	state->source = KUNWIND_SOURCE_REGS_PC;
>  	return 0;
>  }
>  
> @@ -274,11 +258,8 @@ kunwind_next(struct kunwind_state *state)
>  	case KUNWIND_SOURCE_FRAME:
>  	case KUNWIND_SOURCE_CALLER:
>  	case KUNWIND_SOURCE_TASK:
> -	case KUNWIND_SOURCE_REGS_LR:
> -		err = kunwind_next_frame_record(state);
> -		break;
>  	case KUNWIND_SOURCE_REGS_PC:
> -		err = kunwind_next_regs_lr(state);
> +		err = kunwind_next_frame_record(state);
>  		break;
>  	default:
>  		err = -EINVAL;
> @@ -436,7 +417,6 @@ static const char *state_source_string(const struct kunwind_state *state)
>  	case KUNWIND_SOURCE_CALLER:	return "C";
>  	case KUNWIND_SOURCE_TASK:	return "T";
>  	case KUNWIND_SOURCE_REGS_PC:	return "P";
> -	case KUNWIND_SOURCE_REGS_LR:	return "L";
>  	default:			return "U";
>  	}
>  }
> -- 
> 2.30.2
> 

