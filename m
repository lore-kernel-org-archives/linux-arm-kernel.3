Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9BECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCJiMf6aW4/wRpGmSU4WGqroY7tsrQX031t/RA/jJGQ=; b=wl5WYyZwtwM6zDt0Siy7+7myPl
	acQw+JH1p0FlhMGHaOwcG2uP3L3Ja3WaP7SDuh2tLchJtFmZrahp+tv3bRQnHAmkHefZkxPwONgLE
	2e5lvCw3DNGyTLYPrRWk67yu+X6M9in3WLzkJzgShU2/n4dm0A3W/h+LY4A2Zr/dohI1HTqibWxYQ
	TNhkF4K0kVDU9BoomUJKZ31va3S/iqDriEKIK72QxTgwXf/lF3MYDMYcBPR4PxuroaM/21AuWqDvP
	9wk7IKGC7o2EPProSYCQKepoklkk8p2YLw3I7I4axhErkK22Jsfxi4oJ3QyLrVibbD2c1bjFo/XpE
	lk3MyIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoNV-00000007o1m-3VUG;
	Fri, 15 May 2026 08:58:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoNS-00000007o0S-2Uox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:58:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1877225E3;
	Fri, 15 May 2026 01:58:30 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BCE23F7B4;
	Fri, 15 May 2026 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778835515; bh=jV5bXdtpOjz07c8aVu/DQNoLK0X8K5E5q+WDYtjkBWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+U8Z9rjEYBpu+LUUutT3hOsrHX0KM2xYEHMH5VcdHnMhIctVv91O/zvchkF/fd76
	 dSLPNQjmmCaFSbmwxX1n9fU4ly0gSlHynPkRXeze63jNZwCAlYvjCnNSzR2aQtZNuH
	 36Q9/1vMty1KtMjaIj+ByOXRL+xEWOdHGoJB19hA=
Date: Fri, 15 May 2026 09:58:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 3/8] arm64: entry: add unwind info for various kernel
 entries
Message-ID: <agbgMb6jrgiFFHRX@J2N7QTR9R3>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-4-dylanbhatch@google.com>
 <afIjFLbUrdxWA6eR@J2N7QTR9R3.cambridge.arm.com>
 <CADBMgpxBeYUdA5X8BPgkgz=KQyN=NQ760bXygwXfvVRScNzgbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADBMgpxBeYUdA5X8BPgkgz=KQyN=NQ760bXygwXfvVRScNzgbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_015838_716590_E16CE38B 
X-CRM114-Status: GOOD (  40.09  )
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

On Thu, May 14, 2026 at 08:30:43PM -0700, Dylan Hatch wrote:
> On Wed, Apr 29, 2026 at 8:26 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > On Tue, Apr 28, 2026 at 06:36:38PM +0000, Dylan Hatch wrote:
> > > From: Weinan Liu <wnliu@google.com>
> > >
> > > DWARF CFI (Call Frame Information) specifies how to recover the return
> > > address and callee-saved registers at each PC in a given function.
> > > Compilers are able to generate the CFI annotations when they compile
> > > the code to assembly language. For handcrafted assembly, we need to
> > > annotate them by hand.
> > >
> > > Annotate minimal CFI to enable stacktracing using SFrame for kernel
> > > exception entries through el1*_64_*() paths
> >
> > I thought we were only consuming SFrame when unwinding an exeption
> > boundary?
> >
> > We shouldn't be taking exceptions _from_ the entry assembly functions
> > unless something has gone horribly wrong, and so I don't see why we'd
> > need CFI entries for the entry assembly functions.
> >
> > Am I missing some reason we need CFI entries for the entry assembly
> > functions? I strongly suspect it is not necessary to add these, and I'd
> > prefer to omit them.
> 
> I believe the el1 entry functions are called in an exception, and are
> called before call_on_irq_stack. 

Yes, but I don't think that matters. See below for more details.

> Example stacktrace segment:
> 
> [  262.119564]  handle_percpu_devid_irq+0xb4/0x348
> [  262.119913]  handle_irq_desc+0x3c/0x68
> [  262.120196]  generic_handle_domain_irq+0x20/0x40
> [  262.120678]  gic_handle_irq+0x48/0xe0
> [  262.121005]  call_on_irq_stack+0x30/0x48
> [  262.121412]  do_interrupt_handler+0x88/0xa0
> [  262.121779]  el1_interrupt+0x38/0x58
> [  262.122089]  el1h_64_irq_handler+0x18/0x30
> [  262.122617]  el1h_64_irq+0x6c/0x70

The segment immediately above can be unwound using FP, as frame records
were created consistently, and there are no exception boundaries. No CFI
needed.

It's legitimate to take an exception from parts of call_on_irq_stack(),
so it makes sense for that to have CFI, but for the specific unwind
segment above, CFI isn't necessary.

Everything in the stacktrace segment above was executed *after* HW took
the exception.

<< EXCEPTION BOUNDARY HERE >>

Everything in the stacktrace segment(s) below was executed *before* HW
took the exception.

The unwinder knows that it has crossed this exception boundary by virtue
of finding a FRAME_META_TYPE_PT_REGS frame record.

> [  262.123159]  _raw_spin_unlock_irq+0x10/0x60 (P)

The unwinder knows that the value of pt_regs::pc was *definitely* the PC
at the time the exception was taken, so that entry is reliable. No CFI
needed.

> [  262.123720]  __filemap_add_folio+0x200/0x580 (L)

The unwinder doesn't know whether the LR should be used, and needs CFI
to determine that.

After this point, an FP unwind can be used until we encounter the next
exception boundary.

> [  262.124145]  filemap_add_folio+0xec/0x300
> [  262.124674]  page_cache_ra_unbounded+0x128/0x368
> [  262.125338]  do_page_cache_ra+0x70/0x98
> [  262.125875]  page_cache_ra_order+0x460/0x4e0

The segment immediately above can be unwound using FP. No CFI needed.

> Here, el1h_64_irq is the last function that appears in the exception
> stack before _raw_spin_unlock_irq and __filemap_add_folio are
> recovered from the saved PC and LR, respectively. So we therefore need
> the CFI annotations in order to unwind through the full exception
> boundary.
> 
> Is my interpretation here correct?

Given you say "full exception boundary" here, I think we might be using
the term "exception boundary" to mean different things.

As per the example above, I'm using "exception boundary" to mean the a
point between two entries in the stacktrace where HW took an exception.

Did my comments on the example help?

> > > and irq entries through call_on_irq_stack()
> >
> > Needing some sort of unwind annotations for call_on_irq_stack() makes
> > sense to me, but don't we need something for other assembly functions
> > too?
> >
> > We can interrupt things like memset(); I assume we'll treat those as
> > unreliable until annotated?
> 
> While looking into adding these annotations, I noticed a pattern where
> a sibling call is made to a local function:
> 
> SYM_FUNC_START(__pi_memset)
> alternative_if_not ARM64_HAS_MOPS
>         b       __pi_memset_generic
> alternative_else_nop_endif
> 
>         mov     dst, dstin
>         setp    [dst]!, count!, val_x
>         setm    [dst]!, count!, val_x
>         sete    [dst]!, count!, val_x
>         ret
> SYM_FUNC_END(__pi_memset)
> 
> In this case, do we consider the stacktrace unreliable since
> __pi_memset may not appear in the trace?

This is a tail-call, and __pi_memset_generic() will not return to
__pi_memset(). Once the branch to __pi_memset_generic() has been
executed, it's fine for __pi_memset() to not show up in the trace.

The key thing is that no more instructions from __pi_memset() itself
will be executed unless it was called again (from its entry point).

> Or is this not important because assembly functions cannot be directly
> livepatched anyway?

To the best of my knowledge, reliable stacktrace is only used to
determine whether any thread is still within an old version of a
patchable function (including where it's within a callee thereof).

I am not aware of a case where we'd need to detect whether a thread is
still within a non-patchable function, but I can't rule out that as a
possibility.

That's more of a question for the livepatching maintainers.

Thanks,
Mark.

