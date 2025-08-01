Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599DAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=U0K8WneYe0hUxO63Vk79hSQr4whopEni3RdgnpwrdlA=; b=smSqqM/a3xgKot
	CVgbJ4xVZQ8HTcnu7qzHyPpi1HAsJvG1AgS0Qb7sVEXlLU44xyVfgfvTnTSptBougtT/wlXjTZbkp
	5btwPsbflieEM1MnDUl4lK68cRjPTXQKQ/eW5Tzl6qRpRz2QfgRk/aQAOGW1W9vSl/dyTZ9R3fO5K
	bUOfBnT5DQ57BoE/652BCZJ5bj0iLALOFiHxPU2OFxWRnDWQjz/SCmWq4LlPabtgrfdBgLKrkt2jd
	YXx1bbp3g7VBITW6Xrhh1ektgxIWguijk7iDbpKQw8WOUDEnhp8CAiGyJbssHTzTa+yLFBPW6XFUa
	08C40MyZ8x/mB4uNBTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhmRS-00000005PFm-3yKy;
	Fri, 01 Aug 2025 09:52:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhmOs-00000005P4m-3PlA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 09:50:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E059150C;
	Fri,  1 Aug 2025 02:49:55 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 268A03F66E;
	Fri,  1 Aug 2025 02:50:01 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:49:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 00/10] ftrace,bpf: Use single direct ops for bpf trampolines
Message-ID: <aIyNOd18TRLu8EpY@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIn_12KHz7ikF2t1@krava>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_025006_950920_5B6CB3A9 
X-CRM114-Status: GOOD (  55.44  )
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

On Wed, Jul 30, 2025 at 01:19:51PM +0200, Jiri Olsa wrote:
> On Tue, Jul 29, 2025 at 06:57:40PM +0100, Mark Rutland wrote:
> > Hi Jiri,
> > 
> > [adding some powerpc and riscv folk, see below]
> > 
> > On Tue, Jul 29, 2025 at 12:28:03PM +0200, Jiri Olsa wrote:
> > > hi,
> > > while poking the multi-tracing interface I ended up with just one
> > > ftrace_ops object to attach all trampolines.
> > > 
> > > This change allows to use less direct API calls during the attachment
> > > changes in the future code, so in effect speeding up the attachment.
> > 
> > How important is that, and what sort of speedup does this result in? I
> > ask due to potential performance hits noted below, and I'm lacking
> > context as to why we want to do this in the first place -- what is this
> > intended to enable/improve?
> 
> so it's all work on PoC stage, the idea is to be able to attach many
> (like 20,30,40k) functions to their trampolines quickly, which at the
> moment is slow because all the involved interfaces work with just single
> function/tracempoline relation

Do you know which aspect of that is slow? e.g. is that becuase you have
to update each ftrace_ops independently, and pay the synchronization
overhead per-ops?

I ask because it might be possible to do some more batching there, at
least for architectures like arm64 that use the CALL_OPS approach.

> there's ongoing development by Menglong [1] to organize such attachment
> for multiple functions and trampolines, but still at the end we have to use
> ftrace direct interface to do the attachment for each involved ftrace_ops 
> 
> so at the point of attachment it helps to have as few ftrace_ops objects
> as possible, in my test code I ended up with just single ftrace_ops object
> and I see attachment time for 20k functions to be around 3 seconds
> 
> IIUC Menglong's change needs 12 ftrace_ops objects so we need to do around
> 12 direct ftrace_ops direct calls .. so probably not that bad, but still
> it would be faster with just single ftrace_ops involved
> 
> [1] https://lore.kernel.org/bpf/20250703121521.1874196-1-dongml2@chinatelecom.cn/
> 
> > 
> > > However having just single ftrace_ops object removes direct_call
> > > field from direct_call, which is needed by arm, so I'm not sure
> > > it's the right path forward.
> > 
> > It's also needed by powerpc and riscv since commits:
> > 
> >   a52f6043a2238d65 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS")
> >   b21cdb9523e5561b ("riscv: ftrace: support direct call using call_ops")
> > 
> > > Mark, Florent,
> > > any idea how hard would it be to for arm to get rid of direct_call field?
> > 
> > For architectures which follow the arm64 style of implementation, it's
> > pretty hard to get rid of it without introducing a performance hit to
> > the call and/or a hit to attachment/detachment/modification. It would
> > also end up being a fair amount more complicated.
> > 
> > There's some historical rationale at:
> > 
> >   https://lore.kernel.org/lkml/ZfBbxPDd0rz6FN2T@FVFF77S0Q05N/
> > 
> > ... but the gist is that for several reasons we want the ops pointer in
> > the callsite, and for atomic modification of this to switch everything
> > dependent on that ops atomically, as this keeps the call logic and
> > attachment/detachment/modification logic simple and pretty fast.
> > 
> > If we remove the direct_call pointer from the ftrace_ops, then IIUC our
> > options include:
> > 
> > * Point the callsite pointer at some intermediate structure which points
> >   to the ops (e.g. the dyn_ftrace for the callsite). That introduces an
> >   additional dependent load per call that needs the ops, and introduces
> >   potential incoherency with other fields in that structure, requiring
> >   more synchronization overhead for attachment/detachment/modification.
> > 
> > * Point the callsite pointer at a trampoline which can generate the ops
> >   pointer. This requires that every ops has a trampoline even for
> >   non-direct usage, which then requires more memory / I$, has more
> >   potential failure points, and is generally more complicated. The
> >   performance here will vary by architecture and platform, on some this
> >   might be faster, on some it might be slower.
> > 
> >   Note that we probably still need to bounce through an intermediary
> >   trampoline here to actually load from the callsite pointer and
> >   indirectly branch to it.
> > 
> > ... but I'm not really keen on either unless we really have to remove 
> > the ftrace_ops::direct_call field, since they come with a substantial
> > jump in complexity.
> 
> ok, that sounds bad.. thanks for the details
> 
> Steven, please correct me if/when I'm wrong ;-)
> 
> IIUC in x86_64, IF there's just single ftrace_ops defined for the function,
> it will bypass ftrace trampoline and call directly the direct trampoline
> for the function, like:
> 
>    <foo>:
>      call direct_trampoline
>      ...

More details at the end of this reply; arm64 can sometimes do this, but
not always, and even when there's a single ftrace_ops we may need to
bounce through a common trampoline (which can still be cheap).

> IF there are other ftrace_ops 'users' on the same function, we execute
> each of them like:
> 
>   <foo>:
>     call ftrace_trampoline
>       call ftrace_ops_1->func
>       call ftrace_ops_2->func
>       ...

More details at the end of this reply; arm64 does essentially the same
thing via the ftrace_list_ops and ftrace_ops_list_func().

> with our direct ftrace_ops->func currently using ftrace_ops->direct_call
> to return direct trampoline for the function:
> 
> 	-static void call_direct_funcs(unsigned long ip, unsigned long pip,
> 	-                             struct ftrace_ops *ops, struct ftrace_regs *fregs)
> 	-{
> 	-       unsigned long addr = READ_ONCE(ops->direct_call);
> 	-
> 	-       if (!addr)
> 	-               return;
> 	-
> 	-       arch_ftrace_set_direct_caller(fregs, addr);
> 	-}

More details at the end of this reply; at present, when an instrumented
function has a single ops, arm64 can call ops->direct_call directly from
the common trampoline, and only needs to fall back to
call_direct_funcs() when there are multiple ops.

> in the new changes it will do hash lookup (based on ip) for the direct
> trampoline we want to execute:
> 
> 	+static void call_direct_funcs_hash(unsigned long ip, unsigned long pip,
> 	+                                  struct ftrace_ops *ops, struct ftrace_regs *fregs)
> 	+{
> 	+       unsigned long addr;
> 	+
> 	+       addr = ftrace_find_rec_direct(ip);
> 	+       if (!addr)
> 	+               return;
> 	+
> 	+       arch_ftrace_set_direct_caller(fregs, addr);
> 	+}
> 
> still this is the slow path for the case where multiple ftrace_ops objects use
> same function.. for the fast path we have the direct attachment as described above
> 
> sorry I probably forgot/missed discussion on this, but doing the fast path like in
> x86_64 is not an option in arm, right?

On arm64 we have a fast path, BUT branch range limitations means that we
cannot always branch directly from the instrumented function to the
direct func with a single branch instruction. We use ops->direct_call to
handle that case within a common trampoline, which is significantly
cheaper that iterating over the ops and/or looking up the direct func
from a hash.

With CALL_OPS, we place a pointer to the ops immediately before the
instrumented function, and have the instrumented function branch to a
common trampoline which can load that pointer (and can then branch to
any direct func as necessary).

The instrumented function looks like:

	# Aligned to 8 bytes
	func - 8:
		< pointer to ops >
	func:
		BTI		// optional
		MOV	X9, LR	// save original return address
		NOP		// patched to `BL ftrace_caller`
	func_body:

... and then in ftrace_caller we can recover the 'ops' pointer with:

	BIC	<tmp>, LR, 0x7					// align down (skips BTI)
	LDR	<ops>, [<tmp>, #-16]				// load ops pointer

	LDR	<direct>, [<ops>, #FTRACE_OPS_DIRECT_CALL]	// load ops->direct_call
	CBNZ	<direct>, ftrace_caller_direct			// if !NULL, make direct call

	< fall through to non-direct func case here >

Having the ops (and ops->direct_call) means that getting to the direct
func is significantly cheaper than having to lookup the direct func via
the hash.

Where an instrumented function has a single ops, this can get to the
direct func with a low constant overhead, significantly cheaper than
looking up the direct func via the hash.

Where an instrumented function has multiple ops, the ops pointer is
pointed at a common ftrace_list_ops, where ftrace_ops_list_func()
iterates over all the other relevant ops.

Mark.

