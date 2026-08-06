Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42720C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85m6qDvX94f34ClMCnT9o91sJx60R8VpWuaYG2h5D/o=; b=EWp5NyXctOwRbMI/+1W6G1vwoa
	7U2gH91kT2K+Se4vzqKn5dX6xLpncBjekYr3XDcb402BYH0+PhUot7Gmt1a2hGZbwrwrt72AD8+9O
	VmoABSF+Ox8L3+VQcsCFOcHef8NMP/pDnifV9HfLlhuxDy1/hyxw4EaonyK0L8Io26NeJmqhuRJI2
	U5/M0vZVICUEG0zsvfSfqcLbPwASzL5FnNOFqtM1BlD0cBqUwSCOwJo5WgRSn74yUJWkriWdxQ1F4
	zQYkuW7EBR3+YXyywgcBQlSFk+dn+oqDQ7TKnGER3COMlhCVHVQoIJgHhMI5d6F8ZUcFkTN1iqmsj
	59i84YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvGi-00000005Xhh-036V;
	Thu, 06 Aug 2026 10:24:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvGe-00000005Xgp-49ng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:24:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF0A3153B;
	Thu,  6 Aug 2026 03:23:58 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68B6F3F632;
	Thu,  6 Aug 2026 03:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786011842; bh=XaLduez5YfnL+jR4/n7fJz93AdeD63NFCK1NlX5SdD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7ZlhmWYzW1T+51f6Fnb10Kr9fgREylca9XwHKFhL8f/znEeri1N3rbL/2jIY0QlP
	 QBXtGjSq2JiLQTBtXSS1zwaIY7iXYRkchuiEUCuwcScARK6kjU8htuOJSuzSPjEgpx
	 sdfF7+72O/kx0N7x1OT5WlBvr27xE1MOu+LayIHg=
Date: Thu, 6 Aug 2026 11:23:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2 02/20] arm64: percpu: Fix this_cpu_and() mask
 generation
Message-ID: <anRgvaej7exNu8H5@J2N7QTR9R3>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-3-mark.rutland@arm.com>
 <20260805101416.454a49b6@pumpkin>
 <anM0S1jVmwO0mqEt@J2N7QTR9R3>
 <20260806092815.082c6b2a@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806092815.082c6b2a@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_032405_190826_01D9C7FF 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 06, 2026 at 09:28:15AM +0100, David Laight wrote:
> On Wed, 5 Aug 2026 14:02:03 +0100
> Mark Rutland <mark.rutland@arm.com> wrote:
> > On Wed, Aug 05, 2026 at 10:14:16AM +0100, David Laight wrote:
> > > On Tue,  4 Aug 2026 18:04:45 +0100
> > > Mark Rutland <mark.rutland@arm.com> wrote:
> > > >  #define this_cpu_and_8(pcp, val)	\
> > > > -	_pcp_protect(__percpu_andnot_case_64, pcp, ~val)
> > > > +	_pcp_protect(__percpu_andnot_case_64, pcp, ~(u64)(val))  
> > > 
> > > This one still isn't right.
> > > If val is a signed int with a negative value then it is sign extended
> > > before being inverted.
> > > 	val             (int)0x80000000
> > > 	(u64)(val)   0xffffffff80000000
> > > 	~(u64)(val)  0x000000007fffffff
> > > Something like ~(u64)((val) + 0u) will DTRT.  
> > 
> > As above, where have you got that idea from?
> > 
> > AFAICT, a smaller signed type *should* be sign extended, and that must
> > happen before bitwise negation, since that bitwise negation is to cancel
> > out the NOT part of the ANDNOT operation.
> >  
> > Think:
> > 
> >     'pcp'                    is (u64) 0x0123456789abcdef
> >     'val'                    is (int) 0x800000000
> >     '(u64)(val)'             is (u64) 0xffffffff80000000
> >     'pcp & (u64)(val)'       is (u64) 0x0123456780000000
> > 
> >     '~(u64)(val)'            is (u64) 0x000000007fffffff
> >     'pcp ANDNOT ~(u64)(val)' is (u64) 0x0123456780000000
> 
> The problem tends to arise with (u8)128 << 24 which is signed even
> though that is never intended.

Never intended by whom?

The expression '(u8)128 << 24' has int type. If an int is passed into a
u64 function parameter, it will be sign extended to 64 bits. If that's
passed into a binary expression against a u64, it will be sign extended.
That's the way __this_cpu_and() evaluates its argument too.

This is no different from calling any other function. If that caller
doesn't want the int value sign-extended to 64 bits to match the 64-bit
argument type, the caller needs to cast to an unsigned type.

See:

| void some_callee(u64 arg);
| 
| void some_caller(u8 arg)
| {
|         some_caller(arg << 24).
| }
|
| u64 some_inline_and(u8 arg)
| {
|         u64 lhs = 0x0123456789abcdef;
|         return lhs & (arg << 24);
| }
|
| void outline___this_cpu_and_expr(u64 __percpu *p)
| {
|        __this_cpu_and(*p, (u8)128 << 24);
| }

Generated code:

| <some_caller>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        lsl     w0, w0, #24           // left-shift 24
|        mov     x29, sp
|        sxtw    x0, w0                // sign-extend from 32-bit to 64-bit
|        bl      some_callee
|        ldp     x29, x30, [sp], #16
|        autiasp
|        ret
|
| <some_inline_and>:
|        lsl     w0, w0, #24           // left-shift 24
|        mov     x1, #0xcdef
|        movk    x1, #0x89ab, lsl #16
|        sxtw    x0, w0                // sign-extend from 32-bit to 64-bit
|        movk    x1, #0x4567, lsl #32
|        movk    x1, #0x123, lsl #48
|        and     x0, x0, x1
|        ret
|
| <outline___this_cpu_and_expr>:
|        mrs     x2, tpidr_el1
|        ldr     x1, [x0, x2]
|        and     x1, x1, #0xffffffff80000000
|        str     x1, [x0, x2]
|        ret

> To my mind sign extension prior to and/or operations is almost
> certainly unexpected.

As above, I disagree. I think you're starting from an incorrect
assumption about how these should work.

Having sign extension here is is entirely consistent with the usual way
type promotions are applied. It's the semantic of the __this_cpu_*()
operations that should match the this_cpu_*() operations.

Applying an arbitrarily different rule here doesn't help, and would be a
bug. I am not going to change this.

Mark.

