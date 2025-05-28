Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6523CC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnPBFMMufFSeNcqZizRMjWKUzawvZzRiyrrOzYnJdpk=; b=h5KaKndT3loTb9aImE33SY1ryy
	XJtqwKnCwLRUdpeeZvgeipLTCjTUkR3cSyOKZImgm2zzS6m6fSOCDHxA0Fqg2roP2otKR70c8bmbs
	Yvunba4tG1ESty8txlhhwE+O6VxCrlHw9Np3Old8hfrA7Pq7dzFn5udU9ysptXIu1CFIN5954V+jn
	0gLyV9e2nLYUSfm8Ic6q3nKGvn8sCkqtNtlQtkfKlXB4QYbwW2ueyJDcvspuZgOxJCkkQKCQG1wtf
	UUpunE8Ao+tDfZJeFKVozF35nLIzRYDxx2QLw5unP17EhvVBOpAEmcLv18pDnCP7Xf3E03g6SiYL0
	c8aswnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdG-0000000DemR-408Q;
	Wed, 28 May 2025 16:27:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIbZ-0000000DXXE-1UDZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:22:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AC7F1A2D;
	Wed, 28 May 2025 08:21:52 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9BA3F5A1;
	Wed, 28 May 2025 08:22:07 -0700 (PDT)
Date: Wed, 28 May 2025 16:22:05 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 07/11] arm64: debug: split single stepping exception
 entry
Message-ID: <aDcqHaQx6favgsoK@J2N7QTR9R3.cambridge.arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-8-ada.coupriediaz@arm.com>
 <20250520162913.GA19155@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520162913.GA19155@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_082209_440035_405D2965 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, May 20, 2025 at 05:29:14PM +0100, Will Deacon wrote:
> On Mon, May 12, 2025 at 06:43:22PM +0100, Ada Couprie Diaz wrote:
> > +	enter_from_user_mode(regs);
> > +	/*
> > +	 * After handling a breakpoint, we suspend the breakpoint
> > +	 * and use single-step to move to the next instruction.
> > +	 * If we have a suspended breakpoint there's nothing more to do:
> > +	 * complete the single-step.
> > +	 */
> > +	if (reinstall_suspended_bps(regs)) {
> > +		local_daif_restore(DAIF_PROCCTX);
> > +		do_softstep(esr, regs);
> > +	}
> > +	exit_to_user_mode(regs);
> 
> I quite like the look of this now, but perhaps we could rename
> reinstall_suspended_bps() and change the return value to make things a
> bit more readable? For example, 'if (!stepped_suspended_breakpt(regs))'
> or something like that? What do you think?

How about:

	if (!try_step_suspended_breakpoints(regs))

... that'd match the naming in do_el0_undef() and do_el1_undef() in
traps.c, where we have try_${HANDLE_POTENTIAL_CASE}() for a few cases,
e.g.

| void do_el0_undef(struct pt_regs *regs, unsigned long esr) 
| {
|         u32 insn;
| 
|         /* check for AArch32 breakpoint instructions */
|         if (!aarch32_break_handler(regs))
|                 return;
| 
|         if (user_insn_read(regs, &insn))
|                 goto out_err;
| 
|         if (try_emulate_mrs(regs, insn))
|                 return;
| 
|         if (try_emulate_armv8_deprecated(regs, insn))
|                 return;
| 
| out_err:
|         force_signal_inject(SIGILL, ILL_ILLOPC, regs->pc, 0);
| }

Mark.

