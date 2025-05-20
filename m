Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CEC54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2+4XIzAv41jwRA6xw5NPdmvt3cPyjiRlVdoFsZZoL0=; b=kSCuemqFt4FXwkDIEYI67gr+cl
	HyJLnWoEMKyv3F822bmKpcL3fjdKVDLI8REqcTTqiqP7drjjolJ71MpZW84FRYzKNqe3s3S5Rb4dy
	7HXQyUpn/P8+dFPfmjj7kLHWnqKfQw5sLgQV+VsL3ondmH5gWqBvsC+avGPXDopn99r2wU8NvXTTa
	WP4VGv2Lh9f6Jgc768EGNZ4TNXRHdHjzbfQqwnT+EEIjzvoPXjHC5VlliqyffCenZRXYBa4WQ7PXb
	KRwAUZP2TR1IF/7Ce+giM0r4w/26vjBzdGHuOLbOgakylnyagacku8XI8IAAKhRRPUF4VY2k+r8vY
	z4mIaJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMB4-0000000CsSD-211B;
	Tue, 20 May 2025 12:34:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM8w-0000000Cs95-1wKS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66126A4E9CA;
	Tue, 20 May 2025 12:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B413C4CEF2;
	Tue, 20 May 2025 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747744345;
	bh=6txSALMLb+dCskHPkdAxPCvoltw2CKwvqVATLo9J0uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMEa3po3VUmMBkINcJHkPTKGF7YsD3KtMT2IvPwlFtgKcVEPaERspam4hX7ZTGNLx
	 Rm30FBBZGi1yXyXrkzPHG9VTmFNm+ZgNjt4UYgZLgVdh0NAk+mIQRfDtfqmXKoUYV+
	 gg8pAiEbhArjrYH8VLsG/Mv/ChbLDi33R+tVn2DipunlW13zf1xsgWepFQfpWICTHE
	 HFZvBomv+AEnQAF4pJFE5zQoqTTgN4MoK4RqKdOsnYOsP4t3ulDeWMbSoC+mHLOM82
	 DWtw0P8BqcmNxzSkth2dJXnyamhyeHnMNQiJMjpYNToJDW9N9aMmwfsk7QHhzzSufc
	 AB/eIyXdubskw==
Date: Tue, 20 May 2025 13:32:19 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250520123219.GA18565@willie-the-truck>
References: <cover.1745999587.git.namcao@linutronix.de>
 <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
 <20250516140449.GB13612@willie-the-truck>
 <aCtZfiU8bgkSAgLh@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCtZfiU8bgkSAgLh@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_053226_636710_4CF0F00D 
X-CRM114-Status: GOOD (  39.44  )
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

On Mon, May 19, 2025 at 05:17:02PM +0100, Mark Rutland wrote:
> On Fri, May 16, 2025 at 03:04:50PM +0100, Will Deacon wrote:
> > On Wed, Apr 30, 2025 at 01:02:32PM +0200, Nam Cao wrote:
> > > Add page fault trace points, which are useful to implement RV monitor which
> > > watches page faults.
> > > 
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > ---
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > >  arch/arm64/mm/fault.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > index ef63651099a9..e3f096b0dffd 100644
> > > --- a/arch/arm64/mm/fault.c
> > > +++ b/arch/arm64/mm/fault.c
> > > @@ -44,6 +44,9 @@
> > >  #include <asm/tlbflush.h>
> > >  #include <asm/traps.h>
> > >  
> > > +#define CREATE_TRACE_POINTS
> > > +#include <trace/events/exceptions.h>
> > > +
> > >  struct fault_info {
> > >  	int	(*fn)(unsigned long far, unsigned long esr,
> > >  		      struct pt_regs *regs);
> > > @@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> > >  	if (kprobe_page_fault(regs, esr))
> > >  		return 0;
> > >  
> > > +	if (user_mode(regs))
> > > +		trace_page_fault_user(addr, regs, esr);
> > > +	else
> > > +		trace_page_fault_kernel(addr, regs, esr);
> > 
> > Why is this after kprobe_page_fault()?
> 
> The kprobe_page_fault() gunk is doing something quite different, and is
> poorly named. That's trying to fixup the PC (and some other state) to
> hide kprobe details from the fault handling logic when an out-of-line
> copy of an instruction somehow triggers a fault.
> 
> Logically, that *should* happen before the tracepoints, and shouldn't be
> moved later. For other reasons it needs to be even earlier in the fault
> handling flow, and is currently far too late, but that only ends up
> mattering int he presence of other kernel bugs. For now I think it
> should stay where it is.

I thought these tracepoints were intended to be used by RV, in which
case I'd have thought we'd want as much coverage as possible to reason
about what the kernel is actually doing.

> More details below, for the curious and/or deranged.
> 
> The kprobe_page_fault() gunk is trying to fix up the case where an
> instruction has been kprobed, an out-of-line copy of that instruction is
> being stepped, and the out-of-line instruction has triggered a fault.
> When that happens, kprobe_page_fault() tries to reset the faulting PC
> and DAIF such that it looks like the fault was taken from the original
> PC of the probed instruction.
> 
> The real logic for that happens in kprobe_fault_handler(), which adjusts
> the values in pt_regs, but does not handle the live DAIF value. It also
> doesn't handle the PMR when pNMI is in use. Due to this, the fault
> handler can run with DAIF bits masked unexpectedly, and a subsequent
> exception return *could* go wrong.
> 
> Luckily all code with an extable entry has been blacklisted for kprobes
> since commit:
> 
>   888b3c8720e0a403 ("arm64: Treat all entry code as non-kprobe-able")
> 
> ... so we should only get here if there's another kernel bug that causes
> an unmarked dereference of a faulting address, in which case we're
> likely to BUG() anyway.
> 
> The real fix would be to hoist this out to the arm64 entry code (and
> handle similar for other EL1 exceptions), and get rid of all the
> __kprobes annotations inthe fault code.

This seems to be an argument for removing kprobe_page_fault() entirely,
which is fine, but while it exists it's not obvious to me how it's
supposed to interact with RV.

I suppose the pragmatic thing to do would be to align as closely as
possible with x86, but any documentation/guidance/tests to help us
maintain that would be really helpful. Otherwise, this feels like we're
going to have a repeat of the syscall entry mess where the interaction
with ptrace, audit, seccomp etc was perpetually broken in user-visible
ways.

Will

