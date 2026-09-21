Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B653C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4ZczZP60GGyLgMGKTvbjHMqpsZeZfnjU75R62E8W38=; b=XdJtwRgfPVcXdLKb6yFtiJH3G8
	5C9ieJDC2dfkWfOoDqevkSYB9eNTcJNxm4nvC5s5Qa3qDmTxjYtjmmOPk+HX2aB30S2uU3YB56VTD
	iHxa7sugPhcIzGCCDFzM1T5jfonG18AvYMYr/vDo9ew4spbFJ6nR71Fq2UqOwMy63ziP+pHOWg+HS
	93wS/iQDueHlrXRGj6LHaXdzsF7n63AgpNAcwJf6xE8iuUVikjKh6x32et4JkS9EJpvPNGq88/7q/
	O8B/APQBDOygOnvrq7JkNqLl6QA9XoJU1/RJZoXn237QNYynZAcYbW498wx+6Z/RPiN9TNs11ulAR
	LnYj48kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ePz-00000002IW2-20Wa;
	Mon, 21 Sep 2026 13:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ePw-00000002IUL-3VVc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:50:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FCC219F6;
	Mon, 21 Sep 2026 06:50:41 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9437D3F528;
	Mon, 21 Sep 2026 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789998645; bh=DjB3fpKqAp8686etMoCaKqxhPaFUQK7vXCBysnxb29c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=elKUwwCqub7RIwV77IdsKQyaM87EwE3VLi531pEViltJiItG1HhW+lmj1VNLTK4Qx
	 6+h7C8XOgMDMcFVtEyt5gJHh1mO/Ga97VpFBOzCpuZFkv3mZL+nfl68VWS5QYVSEeM
	 mE8Wc7bBSS8dB7+phLxP9ufh8GoinSoZzhwwFKQk=
Message-ID: <2404d9c9-b66c-43ab-a42d-709486b0f250@arm.com>
Date: Mon, 21 Sep 2026 15:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: topology: fix arch_freq_get_on_cpu() overflow
 above 4.19 GHz
To: Oleg Keri <okerixx@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sumit Gupta <sumitg@nvidia.com>, Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ananthu C V <ananthu.cv@oss.qualcomm.com>, linux-pm@vger.kernel.org
References: <20260917182059.2851-1-okerixx@gmail.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260917182059.2851-1-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_065048_956112_A83AEB3E 
X-CRM114-Status: GOOD (  25.75  )
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

On 17.09.26 20:20, Oleg Keri wrote:
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

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

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
> +
>  #ifndef arch_scale_cpu_capacity
>  /**
>   * arch_scale_cpu_capacity - get the capacity scale factor of a given CPU.
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c3ad70e58b8..45796fccdc84 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -236,8 +236,6 @@ static inline int task_has_dl_policy(struct task_struct *p)
>  	return dl_policy(p->policy);
>  }
>  
> -#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
> -
>  static inline void update_avg(u64 *avg, u64 sample)
>  {
>  	s64 diff = sample - *avg;
> 
> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1




