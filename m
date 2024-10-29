Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC49D5B17D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDzktzQGRyQtdnWxsMQ1utTlJvqYcvWig6bJDXjHxAw=; b=4Ng2jhT71GXlm7anRzCOXPf3rd
	lQ7jDJJh9jA92RVIOfL7QcjDbK52DIDpCrJLzMPVCn8moZttsi8qVrgwcmwFRpkIa0zlXZfi3DXvp
	VhIzcIjm6oXOdLoELmIiXJLlaiHkuCwi+UaUopZCfN8Ga9TtHQhW74sJjAJo12sHWBwd06xDxyDtE
	qcZnQVBS3GyYzPoGzxTOvRyW55T7aRFGO14eXtynG9TE78AidC0wCY9ToWduDsX+99xrfiYAvlMuG
	5RPaHZLZ5NScitkIm8kr7RcFpVu0wuqkvUzuOEtTbJjecMSRTZlmH/Ui2pa0tVVpAXQWd865tHASw
	/BRTYCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mwA-0000000Egez-0AWb;
	Tue, 29 Oct 2024 14:11:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mjW-0000000Eed9-3hXY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:58:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB39113E;
	Tue, 29 Oct 2024 06:58:34 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4E13F528;
	Tue, 29 Oct 2024 06:58:02 -0700 (PDT)
Date: Tue, 29 Oct 2024 13:57:53 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, puranjay@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@linaro.org>, puranjay12@gmail.com,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <zenghui.yu@linux.dev>
Subject: Re: Supporting KVM_GUESTDBG_BLOCKIRQ or something similar on ARM64
Message-ID: <ZyDp2VLqjjzm47S3@J2N7QTR9R3.cambridge.arm.com>
References: <mb61p4j4wwlap.fsf@kernel.org>
 <86ed4031zh.wl-maz@kernel.org>
 <CAMj1kXEX2TLdYCn3C-AXhfhjOe6cuzOmd0h5MbgXnzi7Q94T3w@mail.gmail.com>
 <86bjz32q2q.wl-maz@kernel.org>
 <CAMj1kXFLRruq1gv+oiSz_LrfCt3j5ftv78prkxKV62tCXe0KVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFLRruq1gv+oiSz_LrfCt3j5ftv78prkxKV62tCXe0KVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_065807_128135_5CB7C268 
X-CRM114-Status: GOOD (  37.21  )
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

On Tue, Oct 29, 2024 at 11:00:24AM +0100, Ard Biesheuvel wrote:
> On Tue, 29 Oct 2024 at 10:53, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Tue, 29 Oct 2024 08:52:41 +0000,
> > Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Mon, 28 Oct 2024 at 12:23, Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > > Let's start a discussion about what needs to be done to support this on
> > > > > arm64.
> > > >
> > > > A good start would be to define the semantics of such a flag:
> > > >
> > > > - what should it affect? the vcpu you are single-stepping? all vcpu?
> > > >
> > > > - should userspace to know that interrupts are pending?
> > > >
> > > > - should this result in any effect on the guest's view of time?
> > > >
> > > > - what of interactions on the rest of the system (such as devices)?
> > > >
> > >
> > > Sorry to give a handwavy answer here, but approaching this from a
> > > usability PoV (like what Puranjay is doing), it is really about
> > > adhering to the principle of least surprise for the user.
> > >
> > > So in that sense, it is not really about blocking IRQs at all, as long
> > > as we step over them rather than into them. How that is achieved is
> > > not that relevant from the user PoV, and maybe KVM_GUESTDBG_BLOCKIRQ
> > > is not the right solution for ARM at all.
> >
> > I definitely sympathise with the goal, but there is no simple way to
> > let interrupts through while stepping (which is what your "step over"
> > implies):
> >
> > - the hypervisor (in general) doesn't interact with the guest delivery
> >   and handling of interrupts -- this is either very opaque (list
> >   registers) or completely invisible (direct injection)
> >
> > - replacing the step with a breakpoint after the stepped instruction
> >   requires us to decode the guest instructions to handle branching
> >   effects
> >
> 
> Yeah, and we still want to take non-IRQ/FIQ exceptions, so this does
> not seem feasible to me.
> 
> > One possible mechanism would be to:
> >
> > - while stepping, add breakpoints to the interrupt vectors for the EL
> >   we are stepping (3 breakpoints for any of the 4 possible exception
> >   groups),
> >
> > - when any interrupt breakpoint hits, clear all 3, place a breakpoint
> >   on the instruction that was about to be single-stepped (pointed to
> >   by SPSR)
> >
> > - run to completion, until the breakpoint hits
> >
> > - disable the breakpoint, reinstall the previous 3 interrupt
> >   breakpoints
> >
> > - single-step, rinse, repeat
> >
> > But then I'm asking myself the question: why is this KVM's job? It
> > seems to me that this is what an external debugger would do when
> > interacting with HW on bare metal.
> >
> > So can we implement this as part of the debugger's state machine?
> >
> 
> Which debugger is that? The GDB stub in QEMU?
> 
> Setting a one-shot breakpoint on the address in SPSR when taking an
> IRQ exception seems like a reasonable approach to me.

That doesn't work; an IRQ could be taken in the middle of a common
helper that's also used in IRQ context, so you'd take the breakpoint
within the IRQ. You could try to match a bunch of things like the SP and
so on, but that boils to do a bunch of heuristics rather than something
that's guarnateed to work...

More generally, the IRQ can preempt the running thread anyway, so:

* The user cannot use this to trace a kernel thread reliabl , since that
  can be switched out behind their back.

* The user cannot use this to trace a CPU regardless of the running
  thread, since they lose anything that happens under an IRQ.

Mark.

