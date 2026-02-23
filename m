Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9282FEC1102
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/UdccdOPw2qxBCwj6KhDGjSZJvcj6TaII/elDalAFI=; b=eVLlD1fTYYuY/P
	28YIFK+S9TzZ6f/7QEYKm6KlCgDE3WW0qBMn+PzyrNjUXU0yXDs1EHDWdCGibqsDMLKiy2lMXcj84
	JX1+w1RJDUHPplJfGZ8gBv2+zQh+tR+BjtTU6iSs/86k3Kp5D86NGmAEJrtzw5q0RIveXbwuNT0v6
	n4ftggk7R4FjbIuAfIzcwlkgEDuGR1rjNcCbY/hd7/PWx6Cn98xKLL+jkKsyv+IwHd0BOb/XDKzUA
	deMZ3V5SaX/5PquhOMpKne0c74y2slJtQXTolAqfknsh9vh2D2S7vOPO13xX6taci15gaX+iDHnu4
	SZA3sKL4L1JN5VX+qvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYSz-00000000ddv-0om8;
	Mon, 23 Feb 2026 16:07:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYSx-00000000ddm-2VF6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D2B960097;
	Mon, 23 Feb 2026 16:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2B8C116C6;
	Mon, 23 Feb 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862842;
	bh=GhLl9ZdRY3Y1jLozygGmR/YnOTlmDerWjkfwo8L9yVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hL029ylaeQv8chZx1V/BoKCDPp1HXx7Xxaj6d561OVl3S+DlFYtq0/s7xJQdbNRU1
	 7I7d8lAUvVoQYBA1drMukTn5efiEF6LwPqKiFxIXQxJbDOBjFGvM5bGUjTCIoJni3B
	 DgV6+8Tvv1z1ESDgKHQJKZhKEfJBpSzYsf7srHUI/IrmexUu8QdnDmjwTB1HQhl2Vp
	 M8Ovk2xSmnhPaAOAOpdmxg/zJCIa1hJ1WV5hXV7WS6aB1CwPzTFV5/vKoOG6dunZzs
	 fLDrZ+55CDZSb7vTmfL3/kP0RxBKx1cMB25zzrgoNmpH1AvFR+E74rbtIVRda4eMHG
	 XPXLFwujTibTA==
Date: Tue, 24 Feb 2026 01:07:16 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL
 single-step
Message-Id: <20260224010716.91b1f54b446acab84bc6031c@kernel.org>
In-Reply-To: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
	<aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, linux-arm-msm@vger.kernel.org, yang@os.amperecomputing.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 17 Feb 2026 16:55:44 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Tue, Feb 17, 2026 at 07:08:54PM +0530, Khaja Hussain Shaik Khaji wrote:
> > On arm64, non-emulatable kprobes instructions execute out-of-line (XOL)
> > after returning from the initial debug exception. The XOL instruction
> > runs in normal kernel context, while kprobe state is maintained per-CPU.
> 
> The XOL instruction runs in a context with all DAIF bits set (see
> kprobes_save_local_irqflag() and kprobes_restore_local_irqflag()), so
> not quite a regular kernel context.
> 
> > If the task is preempted or migrates during the XOL window, the subsequent
> > SS-BRK exception may be handled on a different CPU, corrupting per-CPU
> > kprobe state and preventing correct recovery.
> 
> I think we need a better explanation of this.
> 
> Since DAIF is masked, we won't take an IRQ to preempt during the actual
> XOL execution.
> 
> AFAICT we *could* explicitly preempt/schedule in C code around the XOL
> execution. However, AFAICT that'd equally apply to other architectures,
> and on x86 they *removed* the preempt count manipulation in commit:
> 
>   2bbda764d720aaca ("kprobes/x86: Do not disable preempt on int3 path")
> 
> ... so it looks like there's a wider potential problem here.
> 
> Can you please share an example failure that you have seen? .. and how
> you triggered it (e.g. is this a plain kprobe, something with bpf, etc).

Yeah, this is important to know. Did it really happen on the single
stepping? or in user's handler function?

> 
> I reckon you could hack a warning something into schedule() (or
> cond_resched(), etc) that detects when there's an active XOL slot, so
> that we can get the full backtrace.

Sounds good way to show it.

Thank you,

> 
> > Disable preemption across the XOL instruction and re-enable it in the
> > SS-BRK handler to prevent migration until control returns to the kprobe
> > handler.
> 
> This might work, but without some more detail I'm not certain this is
> sufficient, and I believe other architectures are likely affected by the
> same problem.
> 
> Thanks,
> Mark.
> 
> > 
> > Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> > ---
> >  arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> > index 43a0361a8bf0..d8a70c456543 100644
> > --- a/arch/arm64/kernel/probes/kprobes.c
> > +++ b/arch/arm64/kernel/probes/kprobes.c
> > @@ -227,6 +227,14 @@ static void __kprobes setup_singlestep(struct kprobe *p,
> >  
> >  		kprobes_save_local_irqflag(kcb, regs);
> >  		instruction_pointer_set(regs, slot);
> > +
> > +		/*
> > +		 * Disable preemption across the out-of-line (XOL) instruction.
> > +		 * The XOL instruction executes in normal kernel context and
> > +		 * kprobe state is per-CPU.
> > +		 */
> > +		preempt_disable();
> > +
> >  	} else {
> >  		/* insn simulation */
> >  		arch_simulate_insn(p, regs);
> > @@ -363,6 +371,11 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
> >  		kprobes_restore_local_irqflag(kcb, regs);
> >  		post_kprobe_handler(cur, kcb, regs);
> >  
> > +		/*
> > +		 * Re-enable preemption after completing the XOL instruction.
> > +		 */
> > +		preempt_enable_no_resched();
> > +
> >  		return DBG_HOOK_HANDLED;
> >  	}
> >  
> > -- 
> > 2.34.1
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

