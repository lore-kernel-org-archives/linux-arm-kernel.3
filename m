Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2178BC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOBJIJnNOMCdQ6+XqylCC6XKFDNzzWzFZKu0gFClous=; b=uZ0yD5jLvC2So4j47MxEfXK3iu
	XS5Dh0rb7e5nHOh5oEt+eeIbZcaGH2M78Nnv+jRT99InlYG+x6Hwp3/4bxx+hqGf4UkAFAKRz12jL
	Q98VAPnGpWChVuqUWPjUXKQd83hQHLzXB0yzOgOf1iZQ6HcMRdG7y5CQsgupYRuMhnfMyhQ2QCNsB
	lFWs1yK64ZncdBnSmdr+5svE4JfYIEjKJxlQ/3ZkmX0UsMzDLRPV44OZaeyt0Vtg/Q9A44UDHY676
	y9+/exffa7UuljlJk+TeWRoPCZLP4c7G9T7oNyW8m1kNQmmwZS/zNh9Jt67jqVkbpBB5Y5IeQhefg
	hKFUk4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKTn-0000000876c-1Zly;
	Fri, 07 Aug 2026 13:19:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKTm-0000000876B-0h5O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:19:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBA02401CC;
	Fri,  7 Aug 2026 13:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D89F1F000E9;
	Fri,  7 Aug 2026 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108756;
	bh=qOBJIJnNOMCdQ6+XqylCC6XKFDNzzWzFZKu0gFClous=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z7SNscdHWB1cDQ5+rvz5nK5wNgdW3DLxKgPjQcHmsQ4QpVvOuMNdNrnRJKJGnfaQ0
	 jasDVQYfcu8CwGl3t+j3F4er/0YkaXao9MC2tebSSNpbJU0Q9TCGC3Rdbxyk/Xs37N
	 o0ilVBDrpJ3rnEuINi6nda+N8KppMoO5IjIUQm8+J1VcZAoOVFgAN9cBmYXKGdKND0
	 MC1MEWhoPjwkZnx1k0NJIIPtvVTJEjgf2Zao9jVb4ke+z0qgJ+eNI+qhMvQ/qVUFr/
	 Egs5mr8oGPxMs212uYr4hHvEmY7GvWAXxzmYVBzc5I0oR1gK0+U+0dgD/3Wt9oGGUS
	 KgFSycowVhL1Q==
Date: Fri, 7 Aug 2026 14:19:11 +0100
From: Will Deacon <will@kernel.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <anXbTwhaWZCIxxTg@willie-the-truck>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3>
 <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
 <anR28GyRtCpApQYX@willie-the-truck>
 <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop>
 <anXKRdA9sUziFda5@willie-the-truck>
 <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, dvyukov@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Marco,

Thanks for the help.

On Fri, Aug 07, 2026 at 02:21:39PM +0200, Marco Elver wrote:
> On Fri, 7 Aug 2026 at 14:06, Will Deacon <will@kernel.org> wrote:
> > On Thu, Aug 06, 2026 at 10:25:37AM -0700, Paul E. McKenney wrote:
> > > On Thu, Aug 06, 2026 at 12:58:40PM +0100, Will Deacon wrote:
> > > > On Fri, Jul 31, 2026 at 11:39:14AM -0700, Paul E. McKenney wrote:
> > > > > [  738.696166] BUG: KCSAN: data-race in __delay / set_need_resched_current
> > > > > [  738.696184]
> > > > > [  738.696188] read (marked) to 0xffff000005899b48 of 8 bytes by interrupt on cpu 8:
> > > > > [  738.696198]  __delay+0xb0/0x378
> > > > > [  738.696212]  __udelay+0x4c/0x60
> > > > > [  738.696225]  kcsan_setup_watchpoint+0x3b4/0x820
> > > > > [  738.696238]  __tsan_unaligned_write4+0x228/0x26c
> > > > > [  738.696249]  set_need_resched_current+0x138/0x1a8
> > > > > [  738.696260]  rcu_exp_handler+0x418/0x4a0
> > > > > [  738.696273]  __flush_smp_call_function_queue+0x36c/0x4a0
> > > > > [  738.696288]  generic_smp_call_function_single_interrupt+0x20/0x30
> > > >
> > > > This is a bit weird -- it looks like the read is occuring from within
> > > > kcsan itself?
> > >
> > > Ah, you are right, as part of KCSAN's software watchpoints.
> > >
> > > What do you suggest?
> >
> > I suppose we could add some __no_kcsan annotations to everything that is
> > called from the KCSAN implementation but it feels error-prone and could
> > hide races exposed by other callers.
> >
> > I've added the KCSAN folks to see if they have any other ideas; it looks
> > like the sort of thing you'd expect them to have encountered already.
> 
> Most of KCSAN's internals are not instrumented, but do call out to
> some instrumented bits where that's safe. In this case, it looks like
> a real data race, even though the access comes from __delay that was
> called by KCSAN, I don't think it's any less valid.

Ok, but then I don't understand how these accesses can race. They appear
to be on the same CPU, in the same IPI handler.

Will

