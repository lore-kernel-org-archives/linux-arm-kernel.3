Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE23C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg9kwtzkNVr89LUjHsPnBl0WVsm7riweLfXAeDfqeLM=; b=1HuRfVytCPXt3JTLnqY9vjqG/P
	5OaN2Ieg70IHW97tW2POpVfCPcnQBx9ab+XN2r1HvIel9AWbGiAbXv+8iTdAvIJMSz2oGuTUVEQU4
	r4Rlq84unRimLvd+LdpKqZqi3g480Q3PmnuhLVa8d7WK6KAmc48C6mdgD7H2VpLdcvltstXVNhR/v
	ifiasnFYDMMnOsMPDfbzyK8UAzGcuzEfPAOvlcIxlPuixQSbuUJSFxHAotxbTmpPf6D/281dlO56Y
	0mqrfl4jhdfiSlHk7JQ4Y1dTNq9hPWuupDEx3+V2JOrzK6SezXy21dHMIPNoSZpHr0QLY4EKbN5Xn
	v6IEMihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E69-0000000Bgyr-3zCB;
	Thu, 17 Sep 2026 15:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E68-0000000Bgy9-3PLb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 15:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rg9kwtzkNVr89LUjHsPnBl0WVsm7riweLfXAeDfqeLM=; b=VBBCKWgaLxuV+mxuEtZNKirWZ3
	LEMS1qKp9j1ZAAyPKxgP9pNR/dipTRFAOv9+OjiZtbcZrwy84AdQk14tp5G8TONAfaYQJeh9fbqH3
	eb366isBMGLYXfbe94a10RysXpw4Nd7vwDNUt3ZK/WD56Zo6BEJbSytnvqrAoFAMTd793OnoCyBU/
	dTSFSwRPNHcx7Jh/7Dzpxc62rkNvpMEG1MpK8QCT6kXJOtSZ8O/w6+HbCrE2CFhgm+DZTMdnGWdZt
	b50RLyMlBKKaT8KfuVaNqA5+jM2GDc/o+BdDIgx2PAtzlWPUAsYXfd0mw+F5sjW3UMU+kqmkcjHvr
	LNnqynOg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7E66-00000008zmQ-0Q6p;
	Thu, 17 Sep 2026 15:32:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 489B1301BD5; Thu, 17 Sep 2026 17:32:24 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:32:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260917153224.GJ4121339@noisy.programming.kicks-ass.net>
References: <20260917125112.2283-1-okerixx@gmail.com>
 <20260917125112.2283-2-okerixx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917125112.2283-2-okerixx@gmail.com>
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

On Thu, Sep 17, 2026 at 02:51:11PM +0200, Oleg Keri wrote:
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
> Use cap_scale(), which the scheduler already has for exactly this
> capacity scaling, so the multiply and the shift stay in 64 bits and
> only the final value is narrowed by the return type. Move the macro
> from the scheduler's private header to <linux/topology.h> so it can be
> used outside kernel/sched.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 5 +----
>  include/linux/topology.h     | 2 ++
>  kernel/sched/sched.h         | 2 --
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..07b8c497c9e6 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -186,7 +186,6 @@ int arch_freq_get_on_cpu(int cpu)
>  	struct amu_cntr_sample *amu_sample;
>  	unsigned int start_cpu = cpu;
>  	unsigned long last_update;
> -	unsigned int freq = 0;
>  	u64 scale;
>  
>  	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
> @@ -245,9 +244,7 @@ int arch_freq_get_on_cpu(int cpu)
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
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 709a2dcf4c73..0a4ee12a98d5 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -351,4 +351,6 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
>  
>  void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
>  
> +#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)

This might not be a very good generic helper, since it relies on either
of the variables to be u64 for correctness.

