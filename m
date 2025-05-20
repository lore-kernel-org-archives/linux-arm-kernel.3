Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61498C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TjQf2bsD9B+3ZtSLqggdahfBZJn2LeQ0M92uMrIdNA=; b=IIZSf/oWl28XnIrbJliBkh/tm1
	zewfnZ5w9EjMlEF/29wQ+dauGN7b9q8mhATqVKJB0l9kftjRhvyeRLGK9zOy8S1EA47QgAgiWz1m5
	vci+U6cjsF/nzkRV1n/t+34Jp0jL2FXktdoP671uRiCzfR4j0SY2wLOfC11TN7c1V1PlhN5nhaJbT
	0/fq0hM8JDdBTrPOnbyI62BkSpjYidn8/HRSnJjKEZnpLBJKrzwGqczIZnJRh1hLGw4NDa9iVL/IA
	dDIBk6EPEIxy8iqMKIY1OFY7vzFeZ8AkZgyXcygZz7B2iYJwv6xOCZyjacoQqbPK1PPNBPLBulmN1
	3JH+wnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNmQ-0000000D8DZ-2MIo;
	Tue, 20 May 2025 14:17:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNkJ-0000000D7tn-0a0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66A2662A07;
	Tue, 20 May 2025 14:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991D0C4CEEF;
	Tue, 20 May 2025 14:15:04 +0000 (UTC)
Date: Tue, 20 May 2025 15:15:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 17/22] arm64: mm: Add page fault trace points
Message-ID: <aCyOZVVioijWpEPY@arm.com>
References: <cover.1747046848.git.namcao@linutronix.de>
 <f5fccde2326a896e5c568ef06a4dbd9aa7465f6a.1747046848.git.namcao@linutronix.de>
 <aCtE-RvyN6XJQjTo@arm.com>
 <20250520122548.lkvaylSB@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122548.lkvaylSB@linutronix.de>
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

On Tue, May 20, 2025 at 02:25:48PM +0200, Nam Cao wrote:
> On Mon, May 19, 2025 at 03:49:29PM +0100, Catalin Marinas wrote:
> > On Mon, May 12, 2025 at 12:51:00PM +0200, Nam Cao wrote:
> > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > index ec0a337891dd..55094030e377 100644
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
> > What are the semantics for these tracepoints? When are they supposed to
> > be called? In the RV context context I guess you only care about the
> > benign, recoverable faults that would affect timing. These tracepoints
> > were generalised from the x86 code but I don't know enough about it to
> > tell when they would be invoked.
> > 
> > For arm64, we also have the do_translation_fault() path for example that
> > may or may not need to log such trace events.
> 
> These tracepoints are invoked for x86 page fault exceptions. Are arm64's
> translation faults considered equivalent to x86 page faults?

Probably. We route permission or access flag faults via do_page_fault()
directly while missing page table entries via do_translation_fault().
The latter end up in do_page_fault() only if the faulting address is in
the user address range.

My point was that we may not always invoke the trace callbacks if, for
example, the user tries to access the kernel space (and results in a
SIGSEGV). While that's fine for RV, I wanted to know what is expected of
these trace points in general. Do we need to log such SIGSEGV-generating
events? We do log them if there's a permission fault.

-- 
Catalin

