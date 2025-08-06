Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrxzd4zej2R/MJNN5DdLYMne6QurCDHzOjtSBY+ygs4=; b=Nw6tL9FO85bgTubBAVG8/arSdw
	W3JBpkZUs/kw/Tn50hgEv9pe2+7lPNfPCP1yHl07v26tuMKnwtFZc4u9whhSTEBpM3JpgakGidUEV
	NYAMeCevEL4bW5MTArJ6wgYy0jTnL1Q7gf60cZvXfTUIeASO6vVJ3fSGLxAh5oCdl/oOre+lCyX0a
	iYYvO2tk70sCu3Hg1DTCerLliJelUYuFScoNPCHclzQCzhcnQ1IF43pc+pacLnoiFd/Lkm9sIxyQK
	FFymPWiz3Z1LpFQPiqwcD3dZtlb93EtIPOwbvqUIbSfHN36ALHBZHtOBA7yxRQcH7haBhY3mmfhgi
	8cfbqiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbIK-0000000Esqu-2jbl;
	Wed, 06 Aug 2025 10:22:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbFr-0000000EsXG-2IoE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:20:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE8981E8D;
	Wed,  6 Aug 2025 03:20:08 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 115603F738;
	Wed,  6 Aug 2025 03:20:13 -0700 (PDT)
Date: Wed, 6 Aug 2025 11:20:08 +0100
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
Message-ID: <aJMsWB2Sxb7-66zs@J2N7QTR9R3>
References: <aIn_12KHz7ikF2t1@krava>
 <aIyNOd18TRLu8EpY@J2N7QTR9R3>
 <aI6CltnCRbVXwyfm@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aI6CltnCRbVXwyfm@krava>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_032019_671867_118457B4 
X-CRM114-Status: GOOD (  42.08  )
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

On Sat, Aug 02, 2025 at 11:26:46PM +0200, Jiri Olsa wrote:
> On Fri, Aug 01, 2025 at 10:49:56AM +0100, Mark Rutland wrote:
> > On Wed, Jul 30, 2025 at 01:19:51PM +0200, Jiri Olsa wrote:
> > > On Tue, Jul 29, 2025 at 06:57:40PM +0100, Mark Rutland wrote:
> > > > 
> > > > On Tue, Jul 29, 2025 at 12:28:03PM +0200, Jiri Olsa wrote:
> > > > > hi,
> > > > > while poking the multi-tracing interface I ended up with just one
> > > > > ftrace_ops object to attach all trampolines.
> > > > > 
> > > > > This change allows to use less direct API calls during the attachment
> > > > > changes in the future code, so in effect speeding up the attachment.
> > > > 
> > > > How important is that, and what sort of speedup does this result in? I
> > > > ask due to potential performance hits noted below, and I'm lacking
> > > > context as to why we want to do this in the first place -- what is this
> > > > intended to enable/improve?
> > > 
> > > so it's all work on PoC stage, the idea is to be able to attach many
> > > (like 20,30,40k) functions to their trampolines quickly, which at the
> > > moment is slow because all the involved interfaces work with just single
> > > function/tracempoline relation
> > 
> > Do you know which aspect of that is slow? e.g. is that becuase you have
> > to update each ftrace_ops independently, and pay the synchronization
> > overhead per-ops?
> > 
> > I ask because it might be possible to do some more batching there, at
> > least for architectures like arm64 that use the CALL_OPS approach.
> 
> IIRC it's the rcu sync in register_ftrace_direct and ftrace_shutdown
> I'll try to profile that case again, there  might have been changes
> since the last time we did that

Do you mean synchronize_rcu_tasks()?

The call in register_ftrace_direct() was removed in commit:

  33f137143e651321 ("ftrace: Use asynchronous grace period for register_ftrace_direct()")

... but in ftrace_shutdown() we still have a call to synchronize_rcu_tasks(),
and to synchronize_rcu_tasks_rude().

The call to synchronize_rcu_tasks() is still necessary, but we might be
abel to batch that better with API changes.

I think we might be able to remove the call to
synchronize_rcu_tasks_rude() on architectures with ARCH_WANTS_NO_INSTR,
since there shouldn't be any instrumentable functions called with RCU
not watching. That'd need to be checked.

[...]

> > > sorry I probably forgot/missed discussion on this, but doing the fast path like in
> > > x86_64 is not an option in arm, right?
> > 
> > On arm64 we have a fast path, BUT branch range limitations means that we
> > cannot always branch directly from the instrumented function to the
> > direct func with a single branch instruction. We use ops->direct_call to
> > handle that case within a common trampoline, which is significantly
> > cheaper that iterating over the ops and/or looking up the direct func
> > from a hash.
> > 
> > With CALL_OPS, we place a pointer to the ops immediately before the
> > instrumented function, and have the instrumented function branch to a
> > common trampoline which can load that pointer (and can then branch to
> > any direct func as necessary).
> > 
> > The instrumented function looks like:
> > 
> > 	# Aligned to 8 bytes
> > 	func - 8:
> > 		< pointer to ops >
> 
> stupid question.. so there's ftrace_ops pointer stored for each function at
> 'func - 8` ?  why not store the func's direct trampoline address in there?

Once reason is that today we don't have trampolines for all ops. Since
branch range limitations can require bouncing through the common ops,
it's simpler/better to bounce from that to the regular call than to
bounce from that to a trampoline which makes the regular call.

We *could* consider adding trampolines, but that comes with a jump in
complexity that we originally tried to avoid, and a potential
performance hit for regular ftrace calls. IIUC that will require similar
synchronization to what we have today, so it's not clearly a win
generally.

I'd like to better understand what the real bottleneck is; AFAICT it's
the tasks-rcu synchronization, and sharing the hash means that you only
need to do that once. I think that it should be possible to share that
synchronization across multiple ops updates with some API changes (e.g.
something like the batching of text_poke on x86).

If we can do that, it might benefit other users too (e.g.
live-patching), even if trampolines aren't being used, and would keep
the arch bits simple/maintainable.

[...]

> thanks for all the details, I'll check if both the new change and ops->direct_call
> could live together for x86 and other arch, but it will probably complicate
> things a lot more

Thanks; please let me know if there's any challenges there!

Mark.

