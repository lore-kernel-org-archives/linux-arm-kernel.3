Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3EEC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPaFLVPwMZ2tc6ueMFHHrqc2KtEDFinSge5uqs3yEHM=; b=15HAqHRbZM3wfLKyT4QdRk0E2o
	5JpWi41LAY45tNJn/vfP5uUGfEOoBxovfNnDXpS3PFj5cFHIL63N0H0oc0R2wvPx/Q4lXtVe8EK97
	1UU6nRmbjEVTT7/P/bCrWxI7BkEetKvxlTwZVA8g6iZIuCD+TdH07EMuMFa2gWkAodrO8hUyJ8j48
	s1GSGdj3Z63ue3uudS8CjNnhwoSqbMQtW46qtbonYckuutagGbpBD27yLGA1enKbCJupnY902beAc
	eZWI2zDecpNP7J+pcUQL19AUkzqPcPI2yjxj7f+/+vsQPLIk+6245QrXGOVhyqtfuAbbIJaFzrbd2
	Vx6rKZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM24-00000008Izi-0p26;
	Fri, 07 Aug 2026 14:58:48 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM1v-00000008Iz7-2F3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vPaFLVPwMZ2tc6ueMFHHrqc2KtEDFinSge5uqs3yEHM=; b=Jnal31JtehGp27yZ/WmdwAmRjW
	C+2PEuQUfImj83GQ6mHDyopLL+2o5054MBkzZN88qnPDHfJUHqmN9GtxtvR4XPt10zIHdJ1GfVVIg
	gTRK5z4Z6wQ7FY3ay3PqKvTwvgMzMom6TAhmf9bG1qU4GXpykWMXl1JSAK6UWPW1opHHVHYu4kGVk
	XPitbuN06bhSM73p2KgNpw6A8GMnAyb1PL3st3R3p40KMDrJ3s4x1c9bSI0u3rVtN6z92tRY3Scdf
	Q3c1rnme/7wu8TFnI/48KfOBID1SMCWoGpQRk95Wp0q0KhH0UvBD2s8VFuUQJ3AXoFMDw1Vvkvc2f
	vZEYG+ZQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wsM1i-000VXB-2i;
	Fri, 07 Aug 2026 14:58:27 +0000
Date: Fri, 7 Aug 2026 07:58:21 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
Message-ID: <anXqMsJ14r3BAbMG@gmail.com>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXkO8YpoadRzm07@J2N7QTR9R3>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075839_602136_1FB39946 
X-CRM114-Status: GOOD (  31.63  )
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2026 at 02:57:15PM +0100, Mark Rutland wrote:
> Hi Breno,
> 
> On Fri, Aug 07, 2026 at 04:45:31AM -0700, Breno Leitao wrote:
> > This is my understand of the current situation:
> > 
> > A) A task enters the kernel via a syscall.
> > 	* PSTATE_I_SET becomes set on the live PMR
> > 	* regs->PMR doesn't have PSR_I_SET set
> 
> At this point, regs->pmr will be the value of PMR when we were executing
> in userspace, which should be the value of regs->pmr the last time we
> returned to userspace. That should be GIC_PRIO_IRQON, as configured by
> start_thread_common().
> 
> The entry asm will set PMR to 'GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET', but
> that should be reset to GIC_PRIO_IRQON when el0_svc() calls
> local_daif_restore(DAIF_PROCCTX).
> 
> Within invoke_syscall(), we should have DAIF==0 and PMR==GIC_PRIO_IRQON.

local_daif_restore() keeps GIC_PRIO_PSR_I_SET on aborts, which is not
the case here.

so, as you said, GIC_PRIO_PSR_I_SET is set in PMR and then cleared in
local_daif_restore().

> > B) A BRK fires at EL1 and that is what leaves the live PMR
> >    with PSR_I_SET.
> > 	* At this stage PSTATE_I_SET is set on both on PMR and regs->PMR
> 
> The value in the regs->pmr should be GIC_PRIO_IRQON, without
> GIC_PRIO_PSR_I_SET.
> 
> As we don't unmask anything during BRK handling, the live PMR should
> contain 'GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET'.

Right, that was my reading as well.

> > C) A nested synchronous exception happens (Not sure why -- BPF related)
> > 	* Now both the live PMR and regs->pmr have PSR_I_SET.
> 
> The presence of 'el1_abort()' in the trace suggests that BPF tried to
> access memory which faulted. That looks to be a result of
> bpf_probe_read_kernel() and copy_from_kernel_nofault().
> 
> Regardless of BPF, we can probably trigger a synchronous exception with
> a WARN() or similar, so we will need to handle synchronous exceptions
> from the same contexts.

I think I can find a reproducer for us, give me a few hours.

> > I am not certain that we want to have PSTATE_I_SET ever be sent to
> > regs->pstate. Do we ever need PSTATE_I_SET in regs->pstate?
> 
> I'm not sure what you mean here. PSTATE_I_SET doesn't exist, and I'm not
> sure whether you're asking about the PSTATE.DAIF bits saved in
> regs->pstate, or the PMR value in regs->pmr.

Sorry, I meant PSTATE_I_SET. 

> Regardless of pseudo-NMI, is is essential that regs->pstate holds a
> complete snapshot of SPSR, including the I bit.
> 
> With pseudo-NMI, it is essential that the full PMR value (including
> GIC_PRIO_PSR_I_SET) is saved into regs->pmr.

For the live PMR register I follow it now: arch_local_save_flags()
returns the PMR and nothing there looks at PSTATE, so a context masked
by PSTATE.I has to advertise that in the PMR or irqs_disabled() lies.

What I don't follow is the saved copy. regs_irqs_disabled() already
consults both halves:

      return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);

so GIC_PRIO_PSR_I_SET in regs->pmr looks redundant for anything querying
the frame.

That matters for the warning, because local_daif_inherit() reloading the
entry-time 'GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET' is what puts 0xf0 in
the live PMR before the handler body runs.

Meanwhile, I will try to ftrace the writes to PMR and regs->pmr to get
a better grasp of the states machine we are in (probably on Monday).

Thanks for the answers so far,
--breno

