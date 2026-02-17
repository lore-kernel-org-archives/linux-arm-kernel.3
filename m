Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56E8E909DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kawQnjB8EO6sFXpUD9ZlFh1aobSe9fjCMuZ8EpWyxDs=; b=3NcHUmLemcqDKr6d2xI3tNG3SG
	SbRneJC5HnBGb/+l6TR5mOcVC/tTguCHhzs6w/UrVFoNpNb6CYnQ/NwragIQWJbmXP8QoGOaR3nL7
	ED66UXiretlMGBG0nd38nHPV9c6lByC5AIQvtmt/QKIkZ1trMQY17SHWrnDKcPDtjyvpp6sT3rAZN
	CzGWKfkbiAckU92pFrQXI5y3UGS4kNxsq5bYczl7k3xNNoSmXcVNQfeV+WxPWoCJD+A1dsjFZhbMM
	KFQhkyosSd88AtgedUefrBTtqLoXN8/5YKdcWoladTRRMoM+vJUjs14ebXDBbUZOfe4y2Vn/2LZ/g
	m7mdxljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOMh-00000008bV7-0Hqz;
	Tue, 17 Feb 2026 16:55:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOMe-00000008bUe-1hqE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:55:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D95051477;
	Tue, 17 Feb 2026 08:55:44 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 945B73F62B;
	Tue, 17 Feb 2026 08:55:49 -0800 (PST)
Date: Tue, 17 Feb 2026 16:55:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL
 single-step
Message-ID: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_085556_575184_556C2EAA 
X-CRM114-Status: GOOD (  22.73  )
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
Cc: catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, linux-arm-msm@vger.kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, mhiramat@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 07:08:54PM +0530, Khaja Hussain Shaik Khaji wrote:
> On arm64, non-emulatable kprobes instructions execute out-of-line (XOL)
> after returning from the initial debug exception. The XOL instruction
> runs in normal kernel context, while kprobe state is maintained per-CPU.

The XOL instruction runs in a context with all DAIF bits set (see
kprobes_save_local_irqflag() and kprobes_restore_local_irqflag()), so
not quite a regular kernel context.

> If the task is preempted or migrates during the XOL window, the subsequent
> SS-BRK exception may be handled on a different CPU, corrupting per-CPU
> kprobe state and preventing correct recovery.

I think we need a better explanation of this.

Since DAIF is masked, we won't take an IRQ to preempt during the actual
XOL execution.

AFAICT we *could* explicitly preempt/schedule in C code around the XOL
execution. However, AFAICT that'd equally apply to other architectures,
and on x86 they *removed* the preempt count manipulation in commit:

  2bbda764d720aaca ("kprobes/x86: Do not disable preempt on int3 path")

... so it looks like there's a wider potential problem here.

Can you please share an example failure that you have seen? .. and how
you triggered it (e.g. is this a plain kprobe, something with bpf, etc).

I reckon you could hack a warning something into schedule() (or
cond_resched(), etc) that detects when there's an active XOL slot, so
that we can get the full backtrace.

> Disable preemption across the XOL instruction and re-enable it in the
> SS-BRK handler to prevent migration until control returns to the kprobe
> handler.

This might work, but without some more detail I'm not certain this is
sufficient, and I believe other architectures are likely affected by the
same problem.

Thanks,
Mark.

> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 43a0361a8bf0..d8a70c456543 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -227,6 +227,14 @@ static void __kprobes setup_singlestep(struct kprobe *p,
>  
>  		kprobes_save_local_irqflag(kcb, regs);
>  		instruction_pointer_set(regs, slot);
> +
> +		/*
> +		 * Disable preemption across the out-of-line (XOL) instruction.
> +		 * The XOL instruction executes in normal kernel context and
> +		 * kprobe state is per-CPU.
> +		 */
> +		preempt_disable();
> +
>  	} else {
>  		/* insn simulation */
>  		arch_simulate_insn(p, regs);
> @@ -363,6 +371,11 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  		kprobes_restore_local_irqflag(kcb, regs);
>  		post_kprobe_handler(cur, kcb, regs);
>  
> +		/*
> +		 * Re-enable preemption after completing the XOL instruction.
> +		 */
> +		preempt_enable_no_resched();
> +
>  		return DBG_HOOK_HANDLED;
>  	}
>  
> -- 
> 2.34.1
> 

