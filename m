Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENorQJ/pLh3pPA/2sJg/M7aUt54CHEBCt3OvYkywruk=; b=qHUqM0sG0s/Ovllbf+DX4LQMqg
	6iPVyEc0FPG4FeK+Da3Ns8PkDjPVeB7chjREx6Yk8g1FJZset7KzBNTJSSbs6vTSIPsXWU2nh6Vhi
	p4wIdhOAyXUwEyfOIvl9YLIPyaKdrKtH8LMix9TZ6rSDxzeMNPlgQM+bm77RLspFrZDis/zesN/Wo
	nzBRKrE68sF3GbDVZASAjE/0uNA78AviYsYXy9Rx0WKle2CJBIA3ED3kjcvPaw7hRfibPiz5pxdb1
	nSDg2Xd+cBGsnsl6Z3r8Os8AOSdC0nT3N4jf8qW2l+8wNiVZx1Zuj3q+HLgFFeVyHMstl9Y7rMDf4
	w11bO2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x938D-000000061GZ-30mK;
	Tue, 22 Sep 2026 16:14:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x938C-000000061GF-38Ez
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:14:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA20A6024D;
	Tue, 22 Sep 2026 16:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27ED1F000FF;
	Tue, 22 Sep 2026 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093647;
	bh=ENorQJ/pLh3pPA/2sJg/M7aUt54CHEBCt3OvYkywruk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KJ3dk0u53UyHdo8MUMbEJc+Q6GjkB7nePEU1r/iUnou6lgcF07QQGKmNPF6owynjA
	 brmhN9xePWg2kiaOYX5WD/RUONjKLGahkuYAvzfdkH+JrHy+Rm9/AKc8PO9y3v9s22
	 lf6pNZSh5+eUKN4cl1Xm48r0KKKmvqnprbXx2mgeR+GkrGGDYcZxII3XEs+JIwevr4
	 pALKzntLFWks4/AW2wPfBDzMit4HYfI2otNErskLQSSDEp2KDI904oSvXH4gEBa1vB
	 PskLsc9R3M/e7QYq1txbjLLDlPqV8Qow96tVMHG48dVi/LKGTW1uo3XpVWah0U/7hD
	 OiUjml68PB+8A==
Date: Tue, 22 Sep 2026 17:14:00 +0100
From: Will Deacon <will@kernel.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5] arm64: topology: fix arch_freq_get_on_cpu() overflow
 above 4.19 GHz
Message-ID: <arKpSGPXOCFF09hM@willie-the-truck>
References: <20260917182059.2851-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917182059.2851-1-okerixx@gmail.com>
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

On Thu, Sep 17, 2026 at 08:20:59PM +0200, Oleg Keri wrote:
> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Compute it with cap_scale(), turned into a static inline taking u64 and
> moved to <linux/sched/topology.h> so it is usable outside kernel/sched.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
> Changes in v5:
> - cap_scale() becomes a static inline taking u64 arguments instead of
>   a macro, as Dietmar proposed and Peter agreed, after Peter pointed out
>   that the macro relies on one operand being u64.  It now lives in
>   <linux/sched/topology.h>, where SCHED_CAPACITY_SHIFT is visible,
>   rather than <linux/topology.h>.
> - Patch 2/2 of v4 is dropped: it duplicated Ananthu C V's series [1],
>   which I tested instead.  This fix is needed with that series, since
>   it puts the reference above 4194304 kHz from boot.
> - v4: https://lore.kernel.org/all/20260917125112.2283-1-okerixx@gmail.com/
> 
> [1] https://lore.kernel.org/all/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com/
> 
>  arch/arm64/kernel/topology.c   | 6 ++----
>  include/linux/sched/topology.h | 5 +++++
>  kernel/sched/sched.h           | 2 --
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..39dd7f8575cd 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -19,6 +19,7 @@
>  #include <linux/init.h>
>  #include <linux/percpu.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/sched/topology.h>
>  #include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
> @@ -186,7 +187,6 @@ int arch_freq_get_on_cpu(int cpu)
>  	struct amu_cntr_sample *amu_sample;
>  	unsigned int start_cpu = cpu;
>  	unsigned long last_update;
> -	unsigned int freq = 0;
>  	u64 scale;
>  
>  	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
> @@ -245,9 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> -	return freq;
> +	return cap_scale(arch_scale_freq_ref(cpu), scale);
>  }
>  
>  static void amu_fie_setup(const struct cpumask *cpus)

The arm64 part looks fine to me, so for that:

Acked-by: Will Deacon <will@kernel.org>

However...

> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index b5d9d7c2b8ad..922b2f015e89 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -234,6 +234,11 @@ static inline void rebuild_sched_domains_energy(void)
>  }
>  #endif
>  
> +static inline u64 cap_scale(u64 value, u64 scale)
> +{
> +	return value * scale >> SCHED_CAPACITY_SHIFT;
> +}

... does this introduce unnecessary 64-bit arithmetic for 32-bit
architectures that currently pass 'unsigned long' to the existing macro?

Will

