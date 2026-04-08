Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528471073C89
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfy5jiFp/cBoNobPRB+UM61E0Er5prxDKhEY2yXZxGs=; b=t5rtAMkb0Xy4jS6104M5I+juQQ
	Pw14oAwsl6T0dCn04fW4ug7wHjVCozhQF2WMeYG+N6fZdhcTpYrM2E4fvKlnOP+iNcj/QCXGO1wjz
	cZKNqieU5R22Jts7vTNLplI/IgvMa5P49MHCdhCX2TYw9beReWTbnVrxspKdC/w5qA9BPxezC0Xc5
	L91QZW5YR4TOEtpXxZDcjdFc1nxoeYoQOZLvpDinOTUyaw30M1g5ctbWoKS8BDh/asoK3trs5JKOB
	wLY/SziKTrDnc5he/OZ8UiWGbLsiCXDBKdFw245L5E0r2tR3CKPija9FjS+n+zI2lVa4MqCgg/8c/
	XVbjTJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ0U-00000008fvI-0AdR;
	Wed, 08 Apr 2026 10:19:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ0Q-00000008fuT-28il
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:19:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DFFD3161;
	Wed,  8 Apr 2026 03:19:23 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5C383F632;
	Wed,  8 Apr 2026 03:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775643569; bh=WmwShQzYPknrvR6gU+R3HWsVbnrmnJ8t4GkPvqjeMrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJew61uDwLQN40laHPY+cuqofDDJwusjf1MGnV8buURble+uWv5/H726yZIUptZJP
	 yeXzuZU0vhSkzcNqgpL+XLLn4qZA6wwkIyUFlQogV/pjiDufpQY7dtC+YZ9phGRVW9
	 U0LdJtNHzSFgiKEJlhRC9PUwtfQliPcbK99neOr8=
Date: Wed, 8 Apr 2026 11:19:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH 05/10] entry: Split preemption from
 irqentry_exit_to_kernel_mode()
Message-ID: <adYrrUU7bk0ewCgp@J2N7QTR9R3>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-6-mark.rutland@arm.com>
 <2d647257-f14b-efac-0d46-ef8aa643393d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d647257-f14b-efac-0d46-ef8aa643393d@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_031930_712795_CF54098A 
X-CRM114-Status: GOOD (  36.86  )
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
Cc: vladimir.murzin@arm.com, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 08, 2026 at 05:17:29PM +0800, Jinjie Ruan wrote:
> 
> 
> On 2026/4/7 21:16, Mark Rutland wrote:
> > Some architecture-specific work needs to be performed between the state
> > management for exception entry/exit and the "real" work to handle the
> > exception. For example, arm64 needs to manipulate a number of exception
> > masking bits, with different exceptions requiring different masking.
> > 
> > Generally this can all be hidden in the architecture code, but for arm64
> > the current structure of irqentry_exit_to_kernel_mode() makes this
> > particularly difficult to handle in a way that is correct, maintainable,
> > and efficient.
> > 
> > The gory details are described in the thread surrounding:
> > 
> >   https://lore.kernel.org/lkml/acPAzdtjK5w-rNqC@J2N7QTR9R3/
> > 
> > The summary is:
> > 
> > * Currently, irqentry_exit_to_kernel_mode() handles both involuntary
> >   preemption AND state management necessary for exception return.
> > 
> > * When scheduling (including involuntary preemption), arm64 needs to
> >   have all arm64-specific exceptions unmasked, though regular interrupts
> >   must be masked.
> > 
> > * Prior to the state management for exception return, arm64 needs to
> >   mask a number of arm64-specific exceptions, and perform some work with
> >   these exceptions masked (with RCU watching, etc).
> > 
> > While in theory it is possible to handle this with a new arch_*() hook
> > called somewhere under irqentry_exit_to_kernel_mode(), this is fragile
> > and complicated, and doesn't match the flow used for exception return to
> > user mode, which has a separate 'prepare' step (where preemption can
> > occur) prior to the state management.
> > 
> > To solve this, refactor irqentry_exit_to_kernel_mode() to match the
> > style of {irqentry,syscall}_exit_to_user_mode(), moving preemption logic
> > into a new irqentry_exit_to_kernel_mode_preempt() function, and moving
> > state management in a new irqentry_exit_to_kernel_mode_after_preempt()
> > function. The existing irqentry_exit_to_kernel_mode() is left as a
> > caller of both of these, avoiding the need to modify existing callers.
> > 
> > There should be no functional change as a result of this patch.
> > 
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Cc: Andy Lutomirski <luto@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> >  include/linux/irq-entry-common.h | 26 +++++++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > Thomas/Peter/Andy, as mentioned on IRC, I haven't created kerneldoc
> > comments for these new functions because the existing comments don't
> > seem all that consistent (e.g. for user mode vs kernel mode), and I
> > suspect we want to rewrite them all in one go for wider consistency.
> > 
> > I'm happy to respin this, or to follow-up with that as per your
> > preference.
> > 
> > Mark.
> > 
> > diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> > index 2206150e526d8..24830baa539c6 100644
> > --- a/include/linux/irq-entry-common.h
> > +++ b/include/linux/irq-entry-common.h
> > @@ -421,10 +421,18 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
> >  	return ret;
> >  }
> >  
> > -static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
> > +static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs, irqentry_state_t state)
> >  {
> > -	lockdep_assert_irqs_disabled();
> > +	if (regs_irqs_disabled(regs) || state.exit_rcu)
> > +		return;
> > +
> > +	if (IS_ENABLED(CONFIG_PREEMPTION))
> > +		irqentry_exit_cond_resched();
> > +}
> >  
> > +static __always_inline void
> > +irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_t state)
> > +{
> >  	if (!regs_irqs_disabled(regs)) {
> >  		/*
> >  		 * If RCU was not watching on entry this needs to be done
> > @@ -443,9 +451,6 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, i
> >  		}
> >  
> >  		instrumentation_begin();
> > -		if (IS_ENABLED(CONFIG_PREEMPTION))
> > -			irqentry_exit_cond_resched();
> > -
> >  		/* Covers both tracing and lockdep */
> >  		trace_hardirqs_on();
> >  		instrumentation_end();
> > @@ -459,6 +464,17 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, i
> >  	}
> >  }
> >  
> > +static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
> > +{
> > +	lockdep_assert_irqs_disabled();
> > +
> > +	instrumentation_begin();
> > +	irqentry_exit_to_kernel_mode_preempt(regs, state);
> > +	instrumentation_end();
> 
> I think the below AI's feedback makes sense. Directly calling
> irqentry_exit_to_kernel_mode_preempt() on arm64/other archs could lead
> to missing instrumentation_begin()/end() markers.
> 
> https://sashiko.dev/#/patchset/20260407131650.3813777-1-mark.rutland%40arm.com

I deliberartely made irqentry_exit_to_kernel_mode_preempt 'inline'
rather than '__always_inline' since everything it does is
instrumentable, and it's up to architecture code to handle that
appropriately.

On arm64 instrumentation_begin() and instrumentation_end() are currently
irrelevant. I didn't add those in the arm64-specific entry code as
they'd simply add pointless NOPs.

This is fine as-is.

Mark.

