Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28750CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIzjjuHUCnphLFo0ttXGZI+g3r6b2spOBMRvkx9pSxA=; b=30sIk+iqbSfuib2RLVKrzqwQsE
	/aZYM19q5hSQqPlbsbqK7jAL3Zg7TEYIoUQyTiyjcZjnC7jS29giQWVSxyHX86n1zrPJQ/JfUVy6n
	7bu6nVilhjm7rrfPC0v41Z7exrLZ1HlUf/fNvI80IuVON58UBf2GFSRzhuU9N2/4hrPXB6VEkY5qn
	9oIZ7+IxHWJGerIH1+vyXEE7ZZp/GMJTIdk0LEaJXae3oSIy4bE4YZG4imEP2in4XQMRNnjwCzyk8
	e8pumwYqlm6VBoKaW0nufr2rSD5EHHkEnhbBK9NkBWpdw3mAbxvXkfpCs3K40J3lmWxN3MpKCe6yc
	Q/WU1wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXuj-0000000H2Dr-0WA4;
	Thu, 14 Aug 2025 13:22:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWIu-0000000GlNY-2Y05
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 11:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zIzjjuHUCnphLFo0ttXGZI+g3r6b2spOBMRvkx9pSxA=; b=E74EZCmyLm9aVhhA5Q0c4B5svA
	FG98zTemryEP76MXLT7Jw9VCtSTtyfDZldweszBZ8wXRUN5FRE/QLoTd+bo8ib/u8NzBi9d53HB8G
	7lO88jTVbF3O7iLj6qKycN19TaY806fkuYKvVBOzA2V+2gtGvwaaDu1zt5gLogq3M+0ayFT0Z7Yb1
	PcbATjEKSi+Q01zhjGhvcaU1kl9KD647LIZ45lyGTL6O1/f2WFcLydIyCwxMCVrhN3vAgNdDeznpC
	OsFSPxJAAz0t4dCgwbwkZwg5M8gstAIQIkA3FStEz8bd381uXpaogwFpUk4JZ7X+Cx4KCV3TNsv3M
	4jqPL+WQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWIq-0000000GNEz-0Yv5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 11:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D6FA5C70C3;
	Thu, 14 Aug 2025 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4A0C4CEED;
	Thu, 14 Aug 2025 11:39:17 +0000 (UTC)
Date: Thu, 14 Aug 2025 12:39:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	rafael@kernel.org, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aJ3K4tQCztOXF6hO@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
 <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com>
 <aJy414YufthzC1nv@arm.com>
 <87bjoi2wdf.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjoi2wdf.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_123929_174317_61E00DA9 
X-CRM114-Status: GOOD (  52.26  )
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

On Thu, Aug 14, 2025 at 12:30:36AM -0700, Ankur Arora wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Mon, Aug 11, 2025 at 02:15:56PM -0700, Ankur Arora wrote:
> >> Catalin Marinas <catalin.marinas@arm.com> writes:
> >> > Also I feel the spinning added to poll_idle() is more of an architecture
> >> > choice as some CPUs could not cope with local_clock() being called too
> >> > frequently.
> >>
> >> Just on the frequency point -- I think it might be a more general
> >> problem that just on specific architectures.
> >>
> >> Architectures with GENERIC_SCHED_CLOCK could use a multitude of
> >> clocksources and from a quick look some of them do iomem reads.
> >> (AFAICT GENERIC_SCHED_CLOCK could also be selected by the clocksource
> >> itself, so an architecture header might not need to be an arch choice
> >> at  all.)
> >>
> >> Even for something like x86 which doesn't use GENERIC_SCHED_CLOCK,
> >> we might be using tsc or jiffies or paravirt-clock all of which would
> >> have very different performance characteristics. Or, just using a
> >> clock more expensive than local_clock(); rqspinlock uses
> >> ktime_get_mono_fast_ns().
> >>
> >> So, I feel we do need a generic rate limiter.
> >
> > That's a good point but the rate limiting is highly dependent on the
> > architecture, what a CPU does in the loop, how fast a loop iteration is.
> >
> > That's why I'd keep it hidden in the arch code.
> 
> Yeah, this makes sense. However, I would like to keep as much of the
> code that does this common.

You can mimic what poll_idle() does for x86 in the generic
implementation, maybe with some comment referring to the poll_idle() CPU
usage of calling local_clock() in a loop. However, allow the arch code
to override the whole implementation and get rid of the policy. If an
arch wants to spin for some power reason, it can do it itself. The code
duplication for a while loop is much more readable than a policy setting
some spin/wait parameters just to have a single spin loop. If at some
point we see some pattern, we could revisit the common code.

For arm64, I doubt the extra spinning makes any difference. Our
cpu_relax() doesn't do anything (almost), it's probably about the same
cost as reading the monotonic clock. I also see a single definition
close enough to the logic in __delay() on arm64. It would be more
readable than a policy callback setting wait/spin with a separate call
for actually waiting. Well, gut feel, let's see how that would look
like.

> Currently the spin rate limit is scaled up or down based on the current
> spin (or SMP_TIMEWAIT_SPIN_BASE) in the common __smp_cond_spinwait()
> which implements a default policy.
> SMP_TIMEWAIT_SPIN_BASE can already be chosen by the architecture but
> that doesn't allow it any runtime say in the spinning.
> 
> I think a good way to handle this might be the same way that the wait
> policy is handled. When the architecture handler (__smp_cond_timewait()
> on arm64) is used, it should be able to choose both spin and wait and
> can feed those back into __smp_cond_spinwait() which can do the scaling
> based on that.

Exactly.

> > However, in the absence of some precision requirement for the potential
> > two users of this interface, I think we complicate things unnecessarily.
> > The only advantage is if you want to make it future proof, in case we
> > ever need more precision.
> 
> There's the future proofing aspect but also having time-remaining
> simplifies the rate limiting of the time-check because now it can
> rate-limit depending on how often the policy handler is called and
> the remaining time.

To keep things simple, I'd skip the automatic adjustment of the rate
limiting in the generic code. Just go for a fixed one until someone
complains about the slack.

> >> This also gives the WFET a clear end time (though it would still need
> >> to be converted to timer cycles) but the WFE path could stay simple
> >> by allowing an overshoot instead of falling back to polling.
> >
> > For arm64, both WFE and WFET would be woken up by the event stream
> > (which is enabled on all production systems). The only reason to use
> > WFET is if you need smaller granularity than the event stream period
> > (100us). In this case, we should probably also add a fallback from WFE
> > to a busy loop.
> 
> What do you think would be a good boundary for transitioning to a busy
> loop?
> 
> Say, we have < 100us left and the event-stream is 100us. We could do
> what __delay() does and spin for the remaining time. But given that we
> dont' care about precision at least until there's need for it, it seems
> to be better to err on the side of saving power.
> 
> So, how about switching to busy-looping when we get to event-stream-period/4?
> (and note that in a comment block.)

Let's do like __delay() (the principle, not necessarily copying the
code) - start with WFET if available, WFE otherwise. For the latter,
when the time left is <100us, fall back to spinning. We can later get
someone to benchmark the power usage and we can revisit. Longer term,
WFET would be sufficient without any spinning.

That said, I thin our __delay() implementation doesn't need spinning if
WFET is available:

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index cb2062e7e234..5d4c28db399a 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -43,10 +43,10 @@ void __delay(unsigned long cycles)
 
 		while ((get_cycles() - start + timer_evt_period) < cycles)
 			wfe();
-	}
 
-	while ((get_cycles() - start) < cycles)
-		cpu_relax();
+		while ((get_cycles() - start) < cycles)
+			cpu_relax();
+	}
 }
 EXPORT_SYMBOL(__delay);
 
-- 
Catalin

