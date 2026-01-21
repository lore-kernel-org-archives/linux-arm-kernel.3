Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B8C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRWWmi2XgU9gTAi+N6aFYcFsRcQIgcKzX/tq4U834L0=; b=UN4B7T5dh2a1rK08EiWnh/50XD
	bcohoqbKdgvU+qMOMpvzyvj00cpNDae7sQ7ROYfqxUIeFQMkpZYNLbB1HloxmsCv++qynDTHjOr7Y
	LsWCai1mt9Yl2hkc1zv8U4jd34VoairGNxUN77ZIiSlHO5bmTH2MA2dtaUXB+qBbg+ptZD4KQBNxZ
	H61liHauPxcdAQT4Rze49XdmIwvKFiJtDEegHgW49GJSEXMP8dtb0vnKGVEgkvxyn9QkbMAcRGs3i
	KnKP7QnKeVTiH0nl8/pVrzVlJzFkwcZlNoDbJErcGAplxoo1UHj9yM2QU48IFRalUY906MPONCr/t
	gR/AMSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibYx-00000005qXd-3Wc0;
	Wed, 21 Jan 2026 17:00:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibYv-00000005qVG-0L07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 17:00:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D50D1476;
	Wed, 21 Jan 2026 08:59:49 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF77C3F632;
	Wed, 21 Jan 2026 08:59:54 -0800 (PST)
Date: Wed, 21 Jan 2026 16:59:49 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, david.spickett@arm.com,
	kevin.brodsky@arm.com, stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1] arm64: poe: fix stale POR_EL0 values for ptrace
Message-ID: <20260121165949.GA1873371@e124191.cambridge.arm.com>
References: <20260121135639.1835784-1-joey.gouly@arm.com>
 <aXD0VUDsHxQbCegJ@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXD0VUDsHxQbCegJ@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_090009_261585_8AE200F5 
X-CRM114-Status: GOOD (  39.11  )
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

On Wed, Jan 21, 2026 at 03:44:21PM +0000, Mark Rutland wrote:
> Hi Joey,
> 
> On Wed, Jan 21, 2026 at 01:56:39PM +0000, Joey Gouly wrote:
> > If a process wrote to POR_EL0 and then crashed before a context switch
> > happened, the coredump would contain an incorrect value for POR_EL0.
> > 
> > The value read in poe_get() would be a stale value left in thread.por_el0.  Fix
> > this by reading the value from the system register, if the target thread is the
> > current thread.
> > 
> > This matches what gcs/fpsimd do.
> > 
> > Fixes: 175198199262 ("arm64/ptrace: add support for FEAT_POE")
> > Reported-by: David Spickett <david.spickett@arm.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> 
> I have a couple of comments below, but as-is this looks functionally
> correct to me. With or without the changes suggested below:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> > ---
> >  arch/arm64/include/asm/por.h | 2 ++
> >  arch/arm64/kernel/process.c  | 7 ++++++-
> >  arch/arm64/kernel/ptrace.c   | 5 +++++
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
> > index d913d5b529e4..46f1356837e2 100644
> > --- a/arch/arm64/include/asm/por.h
> > +++ b/arch/arm64/include/asm/por.h
> > @@ -31,4 +31,6 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
> >  	return perm & POE_X;
> >  }
> >  
> > +void poe_preserve_current_state(void);
> 
> Is it possible to have a static inline here, i.e.
> 
> 	static inline void poe_preserve_current_state(void)
> 	{
> 		current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> 	}
> 
> ... or will that cause some header dependency problem?

It is possible to do as a static inline..

> 
> If we can have this as a static inline, we can use it everywhere
> consistently, and avoid needing a function call for a trivial number of
> instructions.
> 
> Otherwise, see below for another option.
> 
> > +
> >  #endif /* _ASM_ARM64_POR_H */
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index 489554931231..400182099784 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -665,12 +665,17 @@ static int do_set_tsc_mode(unsigned int val)
> >  	return 0;
> >  }
> >  
> > +void poe_preserve_current_state(void)
> > +{
> > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > +}
> > +
> >  static void permission_overlay_switch(struct task_struct *next)
> >  {
> >  	if (!system_supports_poe())
> >  		return;
> >  
> > -	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > +	poe_preserve_current_state();
> >  	if (current->thread.por_el0 != next->thread.por_el0) {
> >  		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> >  		/*
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index b9bdd83fbbca..276d8ee630cd 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -37,6 +37,7 @@
> >  #include <asm/gcs.h>
> >  #include <asm/mte.h>
> >  #include <asm/pointer_auth.h>
> > +#include <asm/por.h>
> >  #include <asm/stacktrace.h>
> >  #include <asm/syscall.h>
> >  #include <asm/traps.h>
> > @@ -1486,6 +1487,10 @@ static int poe_get(struct task_struct *target,
> >  	if (!system_supports_poe())
> >  		return -EINVAL;
> >  
> > +	if (target == current) {
> > +		poe_preserve_current_state();
> > +	}
> 
> If we can't do the static inline, it might be best to just open code the
> read here, i.e. make this:
> 
> 	if (target == current)
> 		current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);

.. however I think this approach is better, no need for abstraction over this.

I will send a v2 in a day or so, in case there are other comments /
disagreements with that approach.

Thanks,
Joey

> 
> ... since permission_overlay_switch() writes the register directly,
> we're not really gaining abstraction by factoring this out. Open coding
> would make the diff a bit smaller, and avoid the function call.
> 
> That all said, this is functionally correct either way, so if Catalin or
> Will disagree, go with whatever they prefer!
> 
> Mark.
> 

