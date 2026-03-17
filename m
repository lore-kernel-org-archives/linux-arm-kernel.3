Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E91FD8747
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFGq4h2FsMq1y7NBHXlX2dn4AB2abDi/bzGCS8WpuJU=; b=mtyGqmwCwnx9A0VCcwUwRR5boF
	bk482DQXOMo/i9XrfZBtj1T682K9tB3MtZ5PAuXa9ea4Lwyq5VG1aLzSaCvQfJxtddKiMizlkYd8X
	HGkfWk3QlDb0gnAAoj5B66m9BRwSGVaOQBmp9zLAOigiYsLNhqWLoZDb/XZH+gMK0N0sYcxcxDwQo
	DuGtgavr0lRne67JDkSU+g1LEzoVvez5kFGdyOB92VeuXqG/n1OABmCN4oiVw+3zqMuJmv4ZyoDNf
	0na3njA1ZTrzpSL5OqwNLg2Auqk+FXBLYDf0siJvWV8UDT/xY+oPpyXktAdwfTLHM4oiQ3oTjdfJr
	7+7wX21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sgj-000000069ds-0ukV;
	Tue, 17 Mar 2026 11:34:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sgh-000000069dX-3jWy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fFGq4h2FsMq1y7NBHXlX2dn4AB2abDi/bzGCS8WpuJU=; b=M7lYv5Xp2lAjG/6SrXdNWmi37i
	K6UOtA4rybK6H6+eEOfmPiZ4Yp90PbIOMa0PJdA2kREOmzdF61EeJlqfGp1rssHuB0di5h4IcLsgq
	iIUZR2rUG10eOHuJQnGskZA8PiRw6y0HPG5gdeNwAeIoeisFnHgJ1i8EE3pMWn7vbMogrMwJX7SIL
	xOr/yhjkxyruHSti0MEaEQe6AhVpmy6XqguTeXwKljVCcPM/TqY9sb1yHgwxQ1ejT6ny+xLsVQJB5
	T9udbYmUgVyumKFe/M4Ryc3ekjwSUOfU0vAQxTw3gBO+jnWuvAcQ9AiHTd2DoxbknGxfE8ZX+EEa8
	uhIfOB/g==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sgf-00000008q9r-1N0M;
	Tue, 17 Mar 2026 11:34:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D437A303244; Tue, 17 Mar 2026 12:34:12 +0100 (CET)
Date: Tue, 17 Mar 2026 12:34:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will McVicker <willmcvicker@google.com>,
	Sean Christopherson <seanjc@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Message-ID: <20260317113412.GH2872@noisy.programming.kicks-ass.net>
References: <20260313061852.4025964-1-cmllamas@google.com>
 <6053b599-c00e-47d0-8f9c-4554fec6d288@app.fastmail.com>
 <20260317112453.GF2872@noisy.programming.kicks-ass.net>
 <f7ca0540-12d4-49eb-9baf-0ed254d3f340@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7ca0540-12d4-49eb-9baf-0ed254d3f340@app.fastmail.com>
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

On Tue, Mar 17, 2026 at 12:31:51PM +0100, Ard Biesheuvel wrote:
> 
> On Tue, 17 Mar 2026, at 12:24, Peter Zijlstra wrote:
> > On Tue, Mar 17, 2026 at 11:59:49AM +0100, Ard Biesheuvel wrote:
> >
> >> > +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
> >> > +	asm("	.pushsection .static_call.text, \"ax\"			\n" \
> >> > +	    "	.align	3						\n" \
> >> > +	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
> >> > +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
> >> > +	    "	hint	34	/* BTI C */				\n" \
> >> > +	    "	adrp	x16, 1f						\n" \
> >> > +	    "	ldr	x16, [x16, :lo12:1f]				\n" \
> >> > +	    "	cbz	x16, 0f						\n" \
> >> > +	    "	br	x16						\n" \
> >> > +	    "0:	ret							\n" \
> >> > +	    "	.type	" STATIC_CALL_TRAMP_STR(name) ", %function	\n" \
> >> > +	    "	.size	" STATIC_CALL_TRAMP_STR(name) ", . - " 
> >> > STATIC_CALL_TRAMP_STR(name) " \n" \
> >> > +	    "	.popsection						\n" \
> >> > +	    "	.pushsection .rodata, \"a\"				\n" \
> >> > +	    "	.align	3						\n" \
> >> > +	    "1:	.quad	" target "					\n" \
> >> > +	    "	.popsection						\n")
> >
> >> > +void arch_static_call_transform(void *site, void *tramp, void *func, 
> >> > bool tail)
> >> > +{
> >> > +	u64 literal;
> >> > +	int ret;
> >> > +
> >> 
> >> Here, set func to &__static_call_return0 if it is NULL.
> >
> > I'm confused. NULL is for the static_call_cond() case, where we NO-OP.
> > And the trampoline above does that cbz 0f to ret. So far so good.
> >
> > But ret0 should return 0, and IIRC arm64 uses x0 for the return value.
> > But I don't see the above clearing it. Hmm?
> >

(your MUA seems busted and generates these silly long lines, let me
reflow again)

> The RET0 case will tail call __static_call_return0() which will take
> care of this.
> 
> I am just saying that the NULL case could just do the same, rather
> than have a conditional branch in the trampoline, as even in that
> case, the surrounding code must assume that X0 is clobbered.
> Alternatively, we could tail call __static_call_nop(), which would do
> just the 'ret'.
> 
> IOW, if we guarantee that the target is always set to something
> appropriate, we can elide the NULL check, and __static_call_return0()
> and __static_call_nop() are equally appropriate for the NULL case.

Ah, yes that is possible. Trade that cbz for an unconditional branch to
a function. That works fine.

Do whatever is best for the uarch etc..

