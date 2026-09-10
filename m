Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351B7C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ic/LkmLOXogubKe3BAPte7eEtUqLwk2XroTu3Q+0VD4=; b=VmEKxigIZ17nsIQ0H72ukvKQb8
	w2hgS3A9WQZJz4WKfF5f0sVV1wo8MPSPCkktvudwbuBbyvdyt0bZmo+6ei5+8DSS4uXkNMiWjbQsM
	scILeUjgaLOCPOG/VfCiQmFALVvU5KpLX9jKQcQvuYcgtHpV9n4qzzwuKQ84uYz9BRPvUeaQ/JE5X
	3tQOE/jxtzhCgvrO0gblXqOrnAUpAOQnXnPJQTfti5oBzaUkNjJWaNovUQy4yLPVrLgkYvp4WFMLX
	8KDVtoqG4sOjesxSjQfjhnlNzseePsWvn4d+DNiFBmQn8y4bsuoBr62K2+UqtVufr8GSWEJxcj/OP
	mkNpRpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aXS-0000000Do3Z-13NI;
	Thu, 10 Sep 2026 08:53:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aXR-0000000Do3Q-2drR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:53:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62B4C43F51;
	Thu, 10 Sep 2026 08:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CA11F00893;
	Thu, 10 Sep 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030425;
	bh=ic/LkmLOXogubKe3BAPte7eEtUqLwk2XroTu3Q+0VD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZfTZGCTUO6fwaS0Y9cDQGvUNcotSSeNzpiBqLyI2mBO6yQDtZxTlxbWtTX3ACYhrt
	 uuOJ8ZbwcTMRqFtSVqsptTy7Hb0CQ/3JA7lspIvmoWfahG0hAwUP+0f4od4i6jt4+t
	 G23pDPPtt8Kd1ju0GaOcTrHVFCSMV3V1xGNjcGph8o5EVdjiTVu1IcBXR0Eq58mm28
	 hAIBsQ/Q0fqJA/9CPoilCVx1qUaleBprjgjO9lnNqZIN+8HKWjOoJ/wdllvbRoTJT0
	 ZRZ17SrcAnYlfFLr0CN+PqMoODAQbfXEGC9/YedX9Ew6Ln/+FZoEawYUEasQpIGyZI
	 xBPv+Abt6HY+w==
Date: Thu, 10 Sep 2026 09:53:38 +0100
From: Will Deacon <will@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqJwEpnrmqnEzpui@willie-the-truck>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <aqF8euAA8wLmr4w1@willie-the-truck>
 <aqGEKHfxcOzYiuBy@gpd4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqGEKHfxcOzYiuBy@gpd4>
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

On Wed, Sep 09, 2026 at 06:07:04PM +0200, Andrea Righi wrote:
> On Wed, Sep 09, 2026 at 04:34:18PM +0100, Will Deacon wrote:
> > On Wed, Sep 09, 2026 at 08:26:08AM +0200, Andrea Righi wrote:
> > > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > > index d28438f8b83f1..e5a7a4b2e3844 100644
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -19,6 +19,8 @@
> > >  #include <linux/init.h>
> > >  #include <linux/percpu.h>
> > >  #include <linux/sched/isolation.h>
> > > +#include <linux/sched/topology.h>
> > > +#include <linux/smp.h>
> > >  #include <linux/xarray.h>
> > >  
> > >  #include <asm/cpu.h>
> > > @@ -44,6 +46,55 @@
> > >  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> > >  static cpumask_var_t amu_fie_cpus;
> > >  
> > > +/*
> > > + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> > > + * two-thread active mode, with resources partitioned between the PEs.
> > > + *
> > > + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> > > + * mode. Firmware does not currently describe this preference, so detect
> > > + * Olympus by MIDR until a firmware interface is available.
> > > + */
> > 
> > Fix the firmware?
> > 
> > If we add this MIDR kludge, I guarantee that it will never be fixed.
> 
> Understood. The existing PPTT already describes the SMT relationship, but as far
> as I can tell ACPI doesn't currently provide a way to describe a preferred SMT
> sibling. Both PEs also have equal isolated performance, so representing this
> using different _CPC highest_perf values wouldn't accurately describe their
> capacity.
> 
> I'll drop the MIDR-based enablement and coordinate with the firmware team on a
> proper ABI.

Thanks, Andrea, I must confess that I wasn't expecting that!

> In the meantime, for systems with the existing firmware, would an explicit
> kernel boot option be acceptable as a fallback? It'd enable SD_ASYM_PACKING at
> the SMT level and prefer the primary PE, but only when requested by the user;
> the kernel would not infer this policy from the CPU model.

I'm ok with that.

Will

