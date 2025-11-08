Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FF0CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyeBZ40Zx3/ppIHhmR71GLzPo2k7dUKf85UvKKswyAY=; b=j0WwpbmuH4gezkRWn3ksULDOva
	Ikh5hmcdEWjtEr7BCJLg3/pnbbaKTt2tse91M9MVUKc9eovhvUEWLv6kcynvYxg7zIQzDdlfpN/OC
	gUz5XaSMujoL1XvKPGYdmUF48y0/XlcVZsYLRM8s/TqqQw5BPuq5AVgSVjGRcPtDa6wdT7ZjBhEen
	wxjz47DfdwojAy2bCyT3yAfpbeZFo5QQMSyds6G6Y7q0j+lwokknkAzSW8ahRoH0i4nPlx5BfT6sN
	B0tekybREdoxkjUl/wPlNDBsz0lS/ml85oNSStvc3XUpTWbg704+KvIJs+G2CUxjR5GtYm4DXT9dW
	jRAw7sxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHnpc-00000003N6f-3Tkb;
	Sat, 08 Nov 2025 18:38:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHnpb-00000003N6X-0sEe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 18:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F06FA60097;
	Sat,  8 Nov 2025 18:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3C8C4CEFB;
	Sat,  8 Nov 2025 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762627113;
	bh=t3e7SIt0+zXbhtJv1BbHHXc8fxypkZN0DeRPDQUHafQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=S1hLQWo9OpsM4h7Qvv7OGWHH/FvfTZBcdvZr6BCrJPEev3bx53NZ65gLGVIGqNjSi
	 hDnVtVxMfF1Av8f+rtEAN6Z79VooIY90Ft+7PPVKdSBnV61CK1YGWzklvYbyT5y+Vn
	 c54iF3Y8y/Ie4mwws0ErfyzZUd0AOxGmI69tt+zAlCt8gmZWoTPR+hmi7honkrvSRP
	 Nn3WA/0re9nAo7gtq2rxyJhoz8kOKMNkU4dpoT1UlszQ/GHPsJwO0sUn8taG/Ww7Qp
	 30Gy2iVZBPmr66zawuEKwoVACvjvgqU2Ta9CAM3qTzxUQGNGJaH5YbzVbAqqYWmAS3
	 qlx2fckgUhBzw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5BD38CE0BB3; Sat,  8 Nov 2025 10:38:32 -0800 (PST)
Date: Sat, 8 Nov 2025 10:38:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	frederic@kernel.org
Subject: Re: [PATCH v2 15/16] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <d53a5852-f84a-4dae-9bf4-312751880452@paulmck-laptop>
References: <bb177afd-eea8-4a2a-9600-e36ada26a500@paulmck-laptop>
 <20251105203216.2701005-15-paulmck@kernel.org>
 <aQ9AoauJKLYeYvrn@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ9AoauJKLYeYvrn@willie-the-truck>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 08, 2025 at 01:07:45PM +0000, Will Deacon wrote:
> Hi Paul,
> 
> On Wed, Nov 05, 2025 at 12:32:15PM -0800, Paul E. McKenney wrote:
> > Some arm64 platforms have slow per-CPU atomic operations, for example,
> > the Neoverse V2.  This commit therefore moves SRCU-fast from per-CPU
> > atomic operations to interrupt-disabled non-read-modify-write-atomic
> > atomic_read()/atomic_set() operations.  This works because
> > SRCU-fast-updown is not invoked from read-side primitives, which
> > means that if srcu_read_unlock_fast() NMI handlers.  This means that
> > srcu_read_lock_fast_updown() and srcu_read_unlock_fast_updown() can
> > exclude themselves and each other
> > 
> > This reduces the overhead of calls to srcu_read_lock_fast_updown() and
> > srcu_read_unlock_fast_updown() from about 100ns to about 12ns on an ARM
> > Neoverse V2.  Although this is not excellent compared to about 2ns on x86,
> > it sure beats 100ns.
> > 
> > This command was used to measure the overhead:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --torture refscale --allcpus --duration 5 --configs NOPREEMPT --kconfig "CONFIG_NR_CPUS=64 CONFIG_TASKS_TRACE_RCU=y" --bootargs "refscale.loops=100000 refscale.guest_os_delay=5 refscale.nreaders=64 refscale.holdoff=30 torture.disable_onoff_at_boot refscale.scale_type=srcu-fast-updown refscale.verbose_batched=8 torture.verbose_sleep_frequency=8 torture.verbose_sleep_duration=8 refscale.nruns=100" --trust-make
> > 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: <linux-arm-kernel@lists.infradead.org>
> > Cc: <bpf@vger.kernel.org>
> > ---
> >  include/linux/srcutree.h | 51 +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 48 insertions(+), 3 deletions(-)
> 
> I've queued the per-cpu tweak from Catalin in the arm64 fixes tree [1]
> for 6.18, so please can you drop this SRCU commit from your tree?

Very good!  Adding Frederic on CC since he is doing the pull request
for the upcoming merge window.

But if this doesn't show up in -rc1, we reserve the right to put it
back in.

Sorry, couldn't resist!   ;-)

							Thanx, Paul

> Cheers,
> 
> Will
> 
> [1] https://git.kernel.org/arm64/c/535fdfc5a228

