Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F091E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-version:References:Subject:In-Reply-To:Cc:To:From:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7jpJNI0F+PeYzNY6k1MGwwVVerw00/5tqQ9VnMetpk=; b=Lso+KX71SCAOyOcQT4fRgEuiiT
	eelngCVrpXlvGet0cfy0zFFEU56Rj6W39qXNASb6Z30j8ZhQUyDZ2EDLGZ7UJ/vZCmcCAQIHIb4U+
	gBUXZ3NWP+c1HWJwg/iapsVnXOxTk2JaC+RHwdi6O2DteyuxQPX5w0wzIY4sY8ZZ8mZkPbtBylI15
	Kr7wWmr5u7N8v9MM5SypOv7j1rrIxvNVPDzNICr4LQHsrkHRIThLK27BN2dC3IGt9fb+fXsZyvNTp
	xRCnBwpCfiqX1ZRwhpJQtL7GaoGgYaKNMHCpwSHimG7yHDsIFJ3kq8wdq6J8grdRQDsJaXv/ufm9Y
	LXBzzNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLirH-00000000Rhx-0K0D;
	Thu, 12 Dec 2024 13:03:59 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiqB-00000000ReD-1TdT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:02:53 +0000
X-KPN-MessageId: 61c044fe-b889-11ef-9ddf-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 61c044fe-b889-11ef-9ddf-00505699b430;
	Thu, 12 Dec 2024 14:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:to:from:message-id:date;
	bh=l7jpJNI0F+PeYzNY6k1MGwwVVerw00/5tqQ9VnMetpk=;
	b=MACV0laWu3KQuyCH9apa6IqYKKNKQ2dWTLleXgOM9MWasMjYUMDJ/dveLTFF+2Mn6paKfFdAUFN+B
	 ne3l6wpFrtVbUd9UP5KtrYwmHm17wWdkAEe3U1n5wRF8RETQxhNu/ReTxZ4JA+qLQqBg0eYO86ZW3+
	 D66QTVEmjmN0EsNXIf3IaO5LyAc7rzjdbN5iTyB2qhaMojneZdtMMz/yT7X6S55u9ASg3bazOAYD9l
	 3UYh4uGlVp3ZL06M2A7Q+37Uc8y139q97BqRvoa6sNsX/CDPpVbEOVzCtPGu522FVNefDt29T4YUvM
	 VrmHSNBgW/xjFlZPpro3d9ofyw+tnyQ==
X-KPN-MID: 33|hMzDFhXczWu9xhBRfz9qvyNVXNDVvVVDflEsBZzrHBDHUMXAXu2RSdfpV1f+1T9
 4R441mCnY1bDekT5/A1jwNcWa+OPL9h6UYK7AUbIer/w=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ATLDymPtu2YdLoARljJmFYN8t1tRU3mwNqFvZP1geq9m8dY6WPr6I00F+81kX0G
 4RkYmM6I4H0ixul9Yk6JlaA==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 619f2579-b889-11ef-9773-005056998788;
	Thu, 12 Dec 2024 14:02:46 +0100 (CET)
Date: Thu, 12 Dec 2024 14:02:45 +0100
Message-Id: <871pydxde2.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Marc Zyngier <maz@kernel.org>
Cc: richard.xnu.clark@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org,
	linux@armlinux.org.uk, mark.rutland@arm.com,
	torvalds@linux-foundation.org
In-Reply-To: <86ldwlryzz.wl-maz@kernel.org> (message from Marc Zyngier on Thu,
	12 Dec 2024 10:12:32 +0000)
Subject: Re: Question about interrupt prioriyt of ARM GICv3/4
References: <CAJNi4rMfhZOCT+7Ki14vUs+dZbv9cxCZ0s+jgn6=_om4NTgo_A@mail.gmail.com>
	<86cyi5tanz.wl-maz@kernel.org>
	<CAJNi4rPDVXS3Ft3nHLXvMzHmn9d10Nz4Pxeduoe+v5HaK=CEAg@mail.gmail.com> <86ldwlryzz.wl-maz@kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_050251_532514_056F5462 
X-CRM114-Status: GOOD (  51.31  )
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

> Date: Thu, 12 Dec 2024 10:12:32 +0000
> From: Marc Zyngier <maz@kernel.org>

Hi Marc, Richard,

> On Thu, 12 Dec 2024 09:18:56 +0000,
> richard clark <richard.xnu.clark@gmail.com> wrote:
> > 
> > Hi M,
> 
> Hi r,
> 
> > 
> > On Fri, Dec 6, 2024 at 5:37 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 06 Dec 2024 08:33:11 +0000,
> > > richard clark <richard.xnu.clark@gmail.com> wrote:
> > > >
> > > > Hi,
> > > > Currently seems the GICv3/4 irqchip configures all the interrupts as
> > > > the same priority, I am thinking about to minimize the latency of the
> > > > interrupt for a particular device, e.g, the arm arch_timer in the RTL
> > > > system. The question is,
> > > > 1. Why don't we provide a /proc or /sys interface for the enduser to
> > > > set the priority of a specific interrupt(SPI/PPI)?
> > >
> > > I'm afraid this really has nothing to do with any particular interrupt
> > > architecture.
> > >
> > > Before thinking of exposing the interrupt priority to userspace, you
> > > should look at what this translates into for the kernel once you allow
> > > interrupts to be preempted by another one with a higher priority.
> > >
> > Interrupt priority doesn't necessarily mean the preemption, seems
> > you're talking about the interrupt preemption harm according to your
> > statement followed.Frankly I am just thinking higher priority will win
> > the lower ones in case massive external interrupts received in the GIC
> > level (you see I am still talking about GIC, not kernel)
> 
> As I stated at the end of my email, the GIC only gives guarantee that
> you will ack the highest priority interrupt in finite time. Not right
> when it is made pending. Yes, it has the concept of HPPI. But that
> from the PoV of the CPU interface, not that of the distributor. Factor
> in the Stream interface, and you realise that expecting to always ack
> the highest priority pending interrupt is akin to expecting no
> reordering of packets in a network.
> 
> > >
> > > This means that at every point where you would normally see a
> > > local_irq_save(), spinlock_irqsave() or equivalent, you would need to
> > > explicitly specify the priority that you allow for preemption. You
> > > should then make sure that any code that can be run during an
> > > interrupt is reentrant. You need to define which data structures can
> > > be manipulated at which priority level... The list goes on.
> > >
> > irqsave just masks the interrupt from the point of cpu, I don't think
> > it will mess things up if preemption really happens (no? then what the
> > side-effect is for the nested interrupt handling in the softirq part.
> > damage the semantic of the lock primitives?)
> > >
> > > If you want a small taste of the complexity, just look at what
> > > handling NMIs (or even pseudo-NMIs in the case of GICv3) means, and
> > > generalise it to not just two, but an arbitrary range of priorities.
> > >
> > > If you want the full blown experience, look at the BSDs and their use
> > > of spl*(). I don't think anyone has any plan to get there, and the RT
> > > patches have shown that there is little need for it.
> > >
> > As supplement，the fiq is suggested to be used as an alternative to the
> > higher priority in the RT area...
> 
> <PulpFiction>
> FIQ's dead, baby. FIQ's dead.
> </PulpFiction>

Hah, tell that to Apple! ;).

> > > > 2. Is there any way to verify the higher priority interrupt will have
> > > > more dominant to be selected to the CPU (IOW, the priority is really
> > > > working) in case of multiple different interrupts asserted to the GIC
> > > > at the same time(some debug registers of GIC like GICD_REEMPT_CNT :-)
> > > > to record higher priority wins)?
> > >
> > > The GIC architecture makes no promise that the interrupt you
> > > acknowledge is the highest priority pending interrupt, because this is
> > > by definition a very racy process.
> > >
> > > Also, even on busy systems, you will very rarely see two interrupts
> > > targeting the same CPU being made pending at the same time, so that
> > > the interrupt delivery system would have to arbitrate between the two.
> > > That's because interrupts are vanishingly rare in the grand scheme of
> > > things.
> > >
> > 1. I am trying to stress the external interrupts to the core#0 via the
> > stress-ng tool with one of interrupt being configured as higher
> > priority to see the benchmark data, it's time consuming as you can
> > image, still is in progress(BTW, I can't see any lockup similar hang
> > in the system with a higher priority configured)
> 
> If you don't have preemption, I don't think anything wrong will
> happen. But I don't expect any benefit either.

Based on my experience with OpenBSD, I'm not even sure there is much
benefit even if you have preemtion.

And regarding anything wrong happening: there is an interesting bug in
the RK3399 GIC integration where it gets the priorities wrong:

https://github.com/openbsd/src/blob/feb3ea439d8f49b3c0e33f54c34631a611b98e21/sys/arch/arm64/dev/agintc.c#L395

(that comment is my interpretation of what's happening; I might be
misinterpreting what's really going on)

As far as I can tell the Linux code doesn't handle that quirk.
Probably it doesn't matter because Linux only uses the priority
mechanisms to implement pseudo-NMI functionality and/or doesn't do
preemption of interrupts.

> > 2. This raises a very interesting question and I am also very curious
> > about is, what is the purpose for the GIC to introduce the interrupt
> > priority features, a placeholder feature reserved for the future? Ah,
> > hardware prefer to provide more functionalities than its being
> > actually used by software, any other justification except that?
> 
> You realise that the HW is not exclusively designed for Linux, right?
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 
> 

