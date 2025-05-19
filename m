Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932A8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pv9Q7Q+E+jeLyk++HgmF/d4MWFvyYbXsI2ml0pzJpU=; b=bxACbqLfRIyFDfWgvgWyRdeeCJ
	ekk5aFUU/GJHddN0v4BJ024uDp+fvmNOxJEl++Pc7PXuaLENwc0djQyJ+Uwtv2kk3PLny0BDwztNf
	JxUc6+vxbl76u7hHXz3heHOpnUr0i0MJ+pSs3xjHQek4Y1H+GX+JcCWRMC3ZkyiwMpYg8FM49xxZN
	bseZeC75maw5tzejRDEyPswFOPe+Smf0zx2FCg+b/LeMpXupwfulEaM5KJAl4/pSXbFj3Gj9lLA2G
	m52muyCVHxHpuPvUna2J6NnIPVnmq7OdooF3aB7CHpGqXVenq/f4hHMRmmwprR0f6pR6iKWCEMYvx
	Zu8bodGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3vx-00000009uWh-0bhz;
	Mon, 19 May 2025 17:05:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3As-00000009lyu-0Fsd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:17:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09C361655;
	Mon, 19 May 2025 09:16:56 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8161B3F5A1;
	Mon, 19 May 2025 09:17:07 -0700 (PDT)
Date: Mon, 19 May 2025 17:17:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <aCtZfiU8bgkSAgLh@J2N7QTR9R3>
References: <cover.1745999587.git.namcao@linutronix.de>
 <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
 <20250516140449.GB13612@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516140449.GB13612@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091710_184895_4647AA2A 
X-CRM114-Status: GOOD (  27.75  )
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

On Fri, May 16, 2025 at 03:04:50PM +0100, Will Deacon wrote:
> On Wed, Apr 30, 2025 at 01:02:32PM +0200, Nam Cao wrote:
> > Add page fault trace points, which are useful to implement RV monitor which
> > watches page faults.
> > 
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> >  arch/arm64/mm/fault.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index ef63651099a9..e3f096b0dffd 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -44,6 +44,9 @@
> >  #include <asm/tlbflush.h>
> >  #include <asm/traps.h>
> >  
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/exceptions.h>
> > +
> >  struct fault_info {
> >  	int	(*fn)(unsigned long far, unsigned long esr,
> >  		      struct pt_regs *regs);
> > @@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> >  	if (kprobe_page_fault(regs, esr))
> >  		return 0;
> >  
> > +	if (user_mode(regs))
> > +		trace_page_fault_user(addr, regs, esr);
> > +	else
> > +		trace_page_fault_kernel(addr, regs, esr);
> 
> Why is this after kprobe_page_fault()?

The kprobe_page_fault() gunk is doing something quite different, and is
poorly named. That's trying to fixup the PC (and some other state) to
hide kprobe details from the fault handling logic when an out-of-line
copy of an instruction somehow triggers a fault.

Logically, that *should* happen before the tracepoints, and shouldn't be
moved later. For other reasons it needs to be even earlier in the fault
handling flow, and is currently far too late, but that only ends up
mattering int he presence of other kernel bugs. For now I think it
should stay where it is.

More details below, for the curious and/or deranged.

The kprobe_page_fault() gunk is trying to fix up the case where an
instruction has been kprobed, an out-of-line copy of that instruction is
being stepped, and the out-of-line instruction has triggered a fault.
When that happens, kprobe_page_fault() tries to reset the faulting PC
and DAIF such that it looks like the fault was taken from the original
PC of the probed instruction.

The real logic for that happens in kprobe_fault_handler(), which adjusts
the values in pt_regs, but does not handle the live DAIF value. It also
doesn't handle the PMR when pNMI is in use. Due to this, the fault
handler can run with DAIF bits masked unexpectedly, and a subsequent
exception return *could* go wrong.

Luckily all code with an extable entry has been blacklisted for kprobes
since commit:

  888b3c8720e0a403 ("arm64: Treat all entry code as non-kprobe-able")

... so we should only get here if there's another kernel bug that causes
an unmarked dereference of a faulting address, in which case we're
likely to BUG() anyway.

The real fix would be to hoist this out to the arm64 entry code (and
handle similar for other EL1 exceptions), and get rid of all the
__kprobes annotations inthe fault code.

Mark.

