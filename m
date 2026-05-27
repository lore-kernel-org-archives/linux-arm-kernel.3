Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5D5CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiyIYx3OeHBRTtKu69Onq9r0k6+FUjLoCIWtpjQKHz8=; b=h8UP8UFMI7fb8C5+kYYZgP4Csy
	vKg1t0QD/JsICaynx9CKcK/UWLBxJSioPXR/Qe7uomRn9n2ScpXJB87dI8yiUrp8goYk5ivtdSepS
	bQ6Tif8y8r4Jr8ngNKEkZtwewK6LpjNZ6qTBvS4JpuvMqeqANTJcldxd+EO+Wza++qbTmr2RWFBfV
	T+speq7AXGeD12F/H6ZWLM3aqqz4VkG6Eq4TZh+j6hHPFOUAlLXL0UCjgdCUfRySMltFzuOGKwDDl
	1ZKlVurklq+wmqUTYqHZ6qgGoJjXkl1hzZORqABAI9lP8O6iWjbZCumtgfuwAOCx62rokAWOB9P9S
	1zL6bFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGHq-00000004Pod-2TtP;
	Wed, 27 May 2026 15:35:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGHo-00000004Po1-2Upo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:35:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7673C35AC;
	Wed, 27 May 2026 08:35:05 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949B53F632;
	Wed, 27 May 2026 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779896110; bh=RupPVhysoIRPyqEypw5MRUxq+nTP845Zq+S/6pv9BZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZApS8zZpD0EnnrOVhSRb12w6Z5BM5IIh+AuI1z/40PO2BvR7YCOqkl4fJ7Up1m9ii
	 lgMVyjnFLCYKF4rWQFl6FU/sL2ogdzza1p5WAalZa6ljxh9o5J5NF1mmFZG0fXJofo
	 xizqTIWSZ3/qXgzbh21zeplufuF+BUDzmlbv/AQw=
Date: Wed, 27 May 2026 16:34:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 12/18] arm64: fpsimd: Move fpsimd save/restore inline
Message-ID: <ahcPITrHKBgAHGkP@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-13-mark.rutland@arm.com>
 <c5ba3af9-08b2-4be2-b9f5-58a925f0b050@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5ba3af9-08b2-4be2-b9f5-58a925f0b050@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_083512_742320_80BBFEC4 
X-CRM114-Status: GOOD (  14.66  )
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

On Wed, May 27, 2026 at 03:49:18PM +0100, Vladimir Murzin wrote:
> On 5/21/26 14:25, Mark Rutland wrote:
> > +static inline void fpsimd_save_vregs(struct user_fpsimd_state *state)
> > +{
> > +	instrument_write(state->vregs, sizeof(state->vregs));
> > +	asm volatile(
> > +	__FPSIMD_PREAMBLE
> > +	"	stp	q0,  q1,  [%[vregs], #16 * 0]\n"
> > +	"	stp	q2,  q3,  [%[vregs], #16 * 2]\n"
> > +	"	stp	q4,  q5,  [%[vregs], #16 * 4]\n"
> > +	"	stp	q6,  q7,  [%[vregs], #16 * 6]\n"
> > +	"	stp	q8,  q9,  [%[vregs], #16 * 8]\n"
> > +	"	stp	q10, q11, [%[vregs], #16 * 10]\n"
> > +	"	stp	q12, q13, [%[vregs], #16 * 12]\n"
> > +	"	stp	q14, q15, [%[vregs], #16 * 14]\n"
> > +	"	stp	q16, q17, [%[vregs], #16 * 16]\n"
> > +	"	stp	q18, q19, [%[vregs], #16 * 18]\n"
> > +	"	stp	q20, q21, [%[vregs], #16 * 20]\n"
> > +	"	stp	q22, q23, [%[vregs], #16 * 22]\n"
> > +	"	stp	q24, q25, [%[vregs], #16 * 24]\n"
> > +	"	stp	q26, q27, [%[vregs], #16 * 26]\n"
> > +	"	stp	q28, q29, [%[vregs], #16 * 28]\n"
> > +	"	stp	q30, q31, [%[vregs], #16 * 30]\n"
> > +	: "=Q" (state->vregs)
> > +	: [vregs] "r" (state->vregs)
> 
> Missing "memory" clobber here?

Here the "=Q" constraint is sufficient.

The "=Q" output constraint describes that the operand is written to but
the old value is not read. It behaves like an "=m" constraint, but
places the base address in a single register without any offset (and no
writeback addressing mode). Here it applies to the entirety of the
vregs array.

See https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html :

|  Q
|     A memory address which uses a single base register with no offset

We generally prefer to use "Q" constraints rather than memory clobbers
where possible, since it gives the compiler more freedom (e.g. due to
*not* clobbering unrelated memory locations). 

The "Q" constraint causes the output to be formatted as a memory address
(e.g. "[x0]"), so to be able to apply an offset we need a separate "r"
constraint to get the base register. It doesn't matter whether the
compiler happens to use a different register for that (and in practice
compilers realise they can use the register allocated for the "Q"
conrstraint).

Unfortunately we can't use "Q" for the scalable registers, since the
size isn't known at compile time, and the simplest option for those is
to use a memory clobber.

[...]

> > +static inline void fpsimd_load_vregs(const struct user_fpsimd_state *state)
> > +{
> > +	instrument_read(state->vregs, sizeof(state->vregs));
> > +	asm volatile(
> > +	__FPSIMD_PREAMBLE
> > +	"	ldp	q0,  q1,  [%[vregs], #16 * 0]\n"
> > +	"	ldp	q2,  q3,  [%[vregs], #16 * 2]\n"
> > +	"	ldp	q4,  q5,  [%[vregs], #16 * 4]\n"
> > +	"	ldp	q6,  q7,  [%[vregs], #16 * 6]\n"
> > +	"	ldp	q8,  q9,  [%[vregs], #16 * 8]\n"
> > +	"	ldp	q10, q11, [%[vregs], #16 * 10]\n"
> > +	"	ldp	q12, q13, [%[vregs], #16 * 12]\n"
> > +	"	ldp	q14, q15, [%[vregs], #16 * 14]\n"
> > +	"	ldp	q16, q17, [%[vregs], #16 * 16]\n"
> > +	"	ldp	q18, q19, [%[vregs], #16 * 18]\n"
> > +	"	ldp	q20, q21, [%[vregs], #16 * 20]\n"
> > +	"	ldp	q22, q23, [%[vregs], #16 * 22]\n"
> > +	"	ldp	q24, q25, [%[vregs], #16 * 24]\n"
> > +	"	ldp	q26, q27, [%[vregs], #16 * 26]\n"
> > +	"	ldp	q28, q29, [%[vregs], #16 * 28]\n"
> > +	"	ldp	q30, q31, [%[vregs], #16 * 30]\n"
> > +	:
> > +	: "Q" (state->vregs),
> > +	  [vregs] "r" (state->vregs)
> 
> Missing "memory" clobber here?

Same story as for fpsimd_save_vregs() above, except that here the "Q"
input constraint describes that the entirety of the operand is read from
but not written to.

Mark.

