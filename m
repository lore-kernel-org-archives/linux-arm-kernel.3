Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA057FD8740
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpCyD+Y3gyHjQ/WCEE5VigucvLyX3xlBQ67DsZNU+JU=; b=ULnsXkaKroIe8qjDIDBx02RfMk
	ZnafFHg4ULBJBpofsyCBw8mJwqQCOzpINaVUHfZFgkoXV6sF7hNmO+96fxVFDX39haeCQqEX0Vmwl
	fAyr7bO7rNfiABwjR0X9NJRChoVok1izlV5aspzOFktJ5kiVyAGdfWyt66lBG5/dsAh7Vx6VmTeZl
	86LvKmqHpIXbilkRYCVDCWd/XKBBeI7kI2NpUWuW66AwOxzQPUfPkjyx42ALJ/KSz15gIJG5Mq9mD
	Vy7qX5sxQ1OtmYSXlUOafyENNz2N1nWyspoUVVX6Ddzatdd/jZkFrgAPDX8hqG6/B6zPo3a6cZgcu
	31oHimew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SXj-000000067tc-2jSh;
	Tue, 17 Mar 2026 11:24:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SXh-000000067tI-3vrL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UpCyD+Y3gyHjQ/WCEE5VigucvLyX3xlBQ67DsZNU+JU=; b=DtNd8Apd5cVMNFOJcyo3qSI+Ea
	SPB0PjLpT3vZCxAcoNlmM7F3GA6XoDX3jK9pg5Ln92IPdN7bvGxB2bCDvNw/E08MiIl7e4qkMz4mH
	rTKj/H0Nrc6dCjLHDSz2lpP0cFgHZL1Bpk5I4mQX7L7ek9Sc7XMChMrLJRnVEfx01+HP3tijSqcB6
	FMzjtPXKqvi6pQQp6S63lQmFeN5BorotsJ/lHOFfc5ntcRj91L3ERMZyjM8+dFTVaVJmtWti/xrAC
	AwN6Ru9FTYFZhVjD+yNlJ/pCgYWe4RaJj/Uf+TuJOEeKaUqidFhiCeknsr1ypxiqfeY0qeD0cFN4T
	wW98/2Ng==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SXf-00000008oof-0lN1;
	Tue, 17 Mar 2026 11:24:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C20F8303244; Tue, 17 Mar 2026 12:24:53 +0100 (CET)
Date: Tue, 17 Mar 2026 12:24:53 +0100
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
Message-ID: <20260317112453.GF2872@noisy.programming.kicks-ass.net>
References: <20260313061852.4025964-1-cmllamas@google.com>
 <6053b599-c00e-47d0-8f9c-4554fec6d288@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6053b599-c00e-47d0-8f9c-4554fec6d288@app.fastmail.com>
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

On Tue, Mar 17, 2026 at 11:59:49AM +0100, Ard Biesheuvel wrote:

> > +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
> > +	asm("	.pushsection .static_call.text, \"ax\"			\n" \
> > +	    "	.align	3						\n" \
> > +	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
> > +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
> > +	    "	hint	34	/* BTI C */				\n" \
> > +	    "	adrp	x16, 1f						\n" \
> > +	    "	ldr	x16, [x16, :lo12:1f]				\n" \
> > +	    "	cbz	x16, 0f						\n" \
> > +	    "	br	x16						\n" \
> > +	    "0:	ret							\n" \
> > +	    "	.type	" STATIC_CALL_TRAMP_STR(name) ", %function	\n" \
> > +	    "	.size	" STATIC_CALL_TRAMP_STR(name) ", . - " 
> > STATIC_CALL_TRAMP_STR(name) " \n" \
> > +	    "	.popsection						\n" \
> > +	    "	.pushsection .rodata, \"a\"				\n" \
> > +	    "	.align	3						\n" \
> > +	    "1:	.quad	" target "					\n" \
> > +	    "	.popsection						\n")

> > +void arch_static_call_transform(void *site, void *tramp, void *func, 
> > bool tail)
> > +{
> > +	u64 literal;
> > +	int ret;
> > +
> 
> Here, set func to &__static_call_return0 if it is NULL.

I'm confused. NULL is for the static_call_cond() case, where we NO-OP.
And the trampoline above does that cbz 0f to ret. So far so good.

But ret0 should return 0, and IIRC arm64 uses x0 for the return value.
But I don't see the above clearing it. Hmm?

> > +	/* decode the instructions to discover the literal address */
> > +	literal = ALIGN_DOWN((u64)tramp + 4, SZ_4K) +
> > +		  aarch64_insn_adrp_get_offset(le32_to_cpup(tramp + 4)) +
> > +		  8 * aarch64_insn_decode_immediate(AARCH64_INSN_IMM_12,
> > +						    le32_to_cpup(tramp + 8));
> > +
> > +	ret = aarch64_insn_write_literal_u64((void *)literal, (u64)func);
> > +	WARN_ON_ONCE(ret);
> > +}
> > +EXPORT_SYMBOL_GPL(arch_static_call_transform);

