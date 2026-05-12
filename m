Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE2DCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YFOdFIgUTEBxroCy4XmRTSh9sEfifb+hhBD0F23QNA=; b=4j7mWp4+X58B/X7gljBUe8xH7E
	Zx2A/21jEeH4lS6kpeJt9O1hvCC2hbwXnxllxiRtybm/Wm/F3EdLDtQCHMX4OxXNlm+oPYsT71dSS
	qDG+N22z6YN5GyZUJIAU3P0vFTtZhs9MfBIekvfB295qEKT0Wb/IM84cGpzJwSovA8dmUOVzzkFyG
	fFCQkEhM4oDQBPUQVtl7HmjVay46amlW3C54+ajcOKr9COs4FKs86V/jN5CZx7lS9afRj2VBxNeYb
	zm+l53BBnNsD7Zd/JNHLGg8Rtmv/CP/O2RFKQ8zUCDm2GpZ99dFxZI3SSX2OzPOFqXUckmBxDwaUh
	Y9hviPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk28-0000000GOCg-3jiJ;
	Tue, 12 May 2026 10:08:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk26-0000000GOB7-1D3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:08:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4011691;
	Tue, 12 May 2026 03:08:03 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30BAA3F7B4;
	Tue, 12 May 2026 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778580488; bh=eGr3fp5GkMU3CLAyOvVshZEVqHTmK+5CoHNUA1ui2AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBsdS/E1/7LU87K3e2zSG7GwqBKdw0z6IXR13j6V0WLW1hx0Z9RWZWJfjQEKvPf6W
	 TWn6Wk5ixhN9UqwAej3RYb/DoVXTDG8hPjMAswwW3ZJvHoSJSo6VtS91oyF8tZIdXr
	 5627kLrYOzsVr/rx/r0ITxVGeEG/eDj5a6I7yCCQ=
Date: Tue, 12 May 2026 11:07:59 +0100
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
Subject: Re: [PATCH v5 8/8] unwind: arm64: Use sframe to unwind interrupt
 frames
Message-ID: <agL7_3RD8RrfiucX@J2N7QTR9R3>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-9-dylanbhatch@google.com>
 <afTYzAF_x41pyilu@J2N7QTR9R3>
 <CADBMgpx9YxNUO6wLP7mYKxWW8L78Hk9gPwHrMjXUwPyUmGEu9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADBMgpx9YxNUO6wLP7mYKxWW8L78Hk9gPwHrMjXUwPyUmGEu9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030810_424015_E1B3C796 
X-CRM114-Status: GOOD (  45.87  )
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

On Mon, May 11, 2026 at 08:00:21PM -0700, Dylan Hatch wrote:
> Hi Mark,
> 
> Thanks for all the feedback and help on this. I'm planning on getting
> your comments addressed in the coming days, but I have some initial
> clarifying questions.
> 
> On Fri, May 1, 2026 at 9:46 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > Hi Dylan,
> >
> > Thanks for putting this together. I think this is looking pretty good.
> > However, there are some things that aren't quite right and need some
> > work, which I've commented on below.
> >
> > More generally, there are a few things that aren't addressed by this
> > series that we will also need to address. Importantly:
> >
> > (1) For correctness, we'll need to address a latent issue with unwinding
> >     across an fgraph return trampoline, where the return address is
> >     transiently unrecoverable.
> >
> >     Before this series, that doesn't matter for livepatching because the
> >     livepatching code isn't called synchronously within the fgraph
> >     handler, and unwinds which cross an exception boundary are marked as
> >     unreliable.
> >
> >     After this series, that does matter as we can unwind across an
> >     exception boundary, and might happen to interrupt that transient
> >     window.
> >
> >     I think we can solve that with some restructuring of that code,
> >     restoring the original address *before* removing that from the
> >     fgraph return stack, and ensuring that the unwinder can find it.
> 
> If my understanding is correct, the issue arrises in return_to_handler
> as the return address is recovered:
> 
> mov x0, sp
> bl ftrace_return_to_handler // addr = ftrace_return_to_hander(fregs);
> mov x30, x0 // restore the original return address
> 
> Because ftrace_return_to_handler pops the return address from the
> return stack before it can be restored into the LR, it cannot be
> recovered.

Yes.

To be clear, please don't worry about solving that for the next version
of this series; let's get the SFrame bits into shape first. I just
wanted to highlight that there's some more general work that we'll need
to do.

I think we can *detect* this case (and mark the unwind as unreliable)
with some tiny changes to the arm64 code. I'm happy to put that
together.

> Based on this, I believe you are suggesting to restructure this code
> path such that the return address is removed from the return stack
> only after it has been restored to LR. But since kernel/trace/fgraph.c
> is core kernel code, will this end up requiring either (1) a similar
> restructuring of other arches supporting ftrace, or (2) an
> arm64-specific implementation of this recovery logic?

Yes, I am say that to *recover* the address we'd need to make changes to
core code.

In the mean time we can *detect* this case with some minimal changes to
arm64 code, and abort. As above, I'm happy to go put that together.

> It looks to me like there is essentially the same recovery pattern on
> other arches; is there a reason this transient unrecoverability isn't
> an issue for reliable unwind on other platforms?

Yep; on all architectures there's a transient period where the address
cannot be recovered. It's not a correctness issue so long as the
architecture detects this case and marks the unwind as unreliable.

IIUC x86 will mark the unwind as unreliable in this case.

I don't know whether other architectures detect this reliably. That's a
question for loonarch, parisc, powerpc, and s390 folk.

> >     I'm not immediately sure whether kretprobes has a similar issue.
> >
> > (2) To make unwinding generally possible, we'll need to annotate some
> >     assembly functions as unwindable. We'll need to do that for string
> >     routines under lib/, and probably some crypto code, but we don't
> >     need to do that for most code in head.S, entry.S, etc.
> >
> >     The vast majority of relevant assembly functions are leaf functions
> >     (where the return address is never moved out of the LR), so we can
> >     probably get away with a simple annotation for those that avoids the
> >     need for open-coded CFI directives everywhere.
> 
> Are you suggesting something like a SYM_LEAF_FUNC_(START|END), that
> wraps CFI directives for leaf functions?

Yep; that's exactly the sort of thing I was thinking of.

That or have a seaprate annotation we can add, e.g.

SYM_FUNC_START(foo)
SYM_FUN_END(foo)
SYM_FUNC_IS_LEAF_AND_DOES_NOT_TOUCH_LR(foo)

> > I've pushed some reliable stacktrace tests to:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
> >
> > That finds the fgraph issue (regardless of this series). When merged
> > with this series triggers a warning in kunwind_next_frame_record_meta(),
> > where unwind_next_frame_sframe() calls that erroneously as a fallback.
> 
> Thanks for the pointer on these tests, they're super useful! I've been
> able to reproduce the fgraph failure you mentioned.

Great!

Mark.

