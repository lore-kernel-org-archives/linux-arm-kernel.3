Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FB5C531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8FCdb3eB/3bUhksPtDN8Ru3166aWM2yJ9zcvq645Bg=; b=YT+/3TbRHO9lJBMVnCQmrSBpo1
	hFr1D25dgQkmaNroGR/A/vc2I7GZZB6l69/L/UsPmyHH02rdrqZbxFbpRV5tXzBhjMtW3lsuA0qb5
	G7DQkuzNvMuWtvb1GDfqA7/xDOQHkt4WWSfWoQQB4EydHdQ6x0Zm2Yp900iVa4laNABJL4klBQirS
	EHuoXSH+eKT/sosqQOCldJlvYedDuQtR9JUjUwuO6IEgjycf6Darwucr/uw7YpDjuitjqOC0Xono0
	LxuT/AyhENJ3PkvXoHk3knZoEIJYdWpfYgtUtqOobhnqh9DMzVBjJezF+XAZjpp66it+y5jBuJ+7C
	ypeDVsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrrQ-0000000EBPY-24ue;
	Thu, 23 Jul 2026 11:45:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrrP-0000000EBPR-1E7X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:45:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E7D6600AD;
	Thu, 23 Jul 2026 11:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8341F000E9;
	Thu, 23 Jul 2026 11:45:04 +0000 (UTC)
Date: Thu, 23 Jul 2026 12:45:01 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 0/5] arm64: arch_timer: Improve errata handling
Message-ID: <amH-vUEL-SUjfa-5@willie-the-truck>
References: <20260508094203.2913880-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508094203.2913880-1-maz@kernel.org>
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

Hi Marc,

Sorry it took me so long to look at this.

On Fri, May 08, 2026 at 10:41:58AM +0100, Marc Zyngier wrote:
> This is the second version of this series addressing a couple of
> embarrassing bugs in the prolific arm64 timer errata handling
> department. Nothing changed since v1, which didn't get much traction,
> so this is only a rebase.
> 
> Time is hard. Timers are harder. As a consequence, we have plenty of
> broken counter/timer implementations in the wild, and an
> infrastructure to deal with them.
> 
> However, what we have today suffers from a number of issues:
> 
> - if, on an heterogeneous system, affected CPUs are secondaries, we do
>   record their broken state but don't correct anything
> 
> - we always play games with preemption in order to access per-CPU
>   state, irrespective of the presence of broken CPUs
> 
> I hear someone saying "just use a static key to enable the errata and
> be done with it". Good call, except that we need to do that from a
> CPUHP callback, and that's deadlock central. We can't do it later,
> because this could affect the CPU before the workaround is enabled.
> 
> However, not everything is lost if we turn the logic on its head:
> 
> - always start with the mitigations enabled, even if we don't know of
>   any affected CPU
> 
> - once all CPUs have been seen once, and that we still haven't
>   enabled any workaround, disable the mitigations globally.
> 
> With that, a normal kernel boot with all CPUs will quickly switch to
> no mitigation on decent HW. If you're booting with CPUs disabled, this
> will only kick in once you have booted them all.

I think this series is a definite improvement on the existing (broken)
code, but there are two things that jump out at me with the new code:

1. If somebody uses maxcpus= on perfectly working hardware, they will
   run with the overhead of the workaround. I fear this will be
   unpopular (and I sympathise!)... I suppose we could wait for people
   to scream and then add something like a cmdline option to pinky
   promise that the late CPUs are not affected by any timer errata (we
   could presumably refuse to bring them online if they are?).

2. It's a bit grotty that you have to maintain your own mask to track
   which CPUs have booted once. I'd have thought this information should
   exist already, although none of the existing masks I could find do
   quite what you need. One alternative would be to iterate our per-cpu
   'cpu_data' variable or perhaps you could even use the driver's
   existing 'arch_timer_evt' variable?

Will

