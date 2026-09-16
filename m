Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30452C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMa6zFvLf4yWYKXjQgqxzfLhILFoyAQ4PaywI3rafUY=; b=jASnd6+xLJ/+sWMkSMdckKrebC
	o+S8paHo51L2dDq8ZChYKjCXJIXR7Vc31qIeTSdwPA0+nO2f/p00v8pPAQ8b3OUsNZVMTo63jkp5O
	ta1SeUPlhQu8PPk2MXHdPCKb4RSI5CNraTIUD3lLggfrVNgBK9yryZX6S9SQAWjm69+dmQqFTdF+b
	5mOYzGhV4Dl4k/BX0NLj3OFJosASbpIkd75uXSDy45Yr7/DUM+Qis0XPL+fi6lOyRH2n+Xm/GwTGY
	XHK8z1hs+AE6L4C44YaCoCogPxgoX/JfwVDqwnbZ/Yj9n3PO/lH4TIcDzyKw3TOi8/SDLQL+2Oo1R
	DT4bE1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nFs-000000090nN-1KOU;
	Wed, 16 Sep 2026 10:52:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nFp-000000090mx-2C6E;
	Wed, 16 Sep 2026 10:52:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21DB1152B;
	Wed, 16 Sep 2026 03:52:34 -0700 (PDT)
Received: from [192.168.178.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862EB3F882;
	Wed, 16 Sep 2026 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789555957; bh=RhduKqcItE584Gog2HHjq9v4nZ1t5cRd+2u1AHvp/Pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k+QPQZ+7lFhCUxzwB5qWc/aVin1L+Ty0HMKoeDTdKQNkahM0tK+cYSMFOw9EPXdAo
	 tX5VERC5gj1tGwCTKOJI9xmdx7BHPsNI6W1G5AhCwLINtZMxU0+AaaM9dXBVOgrIGo
	 o1IbXWjEdyKMbcLMH+LPLmm7NStwCDN4mFkR0t0o=
Message-ID: <55538466-2203-42ec-a0bd-b743c04a3b38@arm.com>
Date: Wed, 16 Sep 2026 12:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
To: Oleg Keri <okerixx@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Sudeep Holla <sudeep.holla@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, jonathan.cameron@oss.qualcomm.com,
 sibi.sankar@oss.qualcomm.com
References: <20260910063440.4677-1-okerixx@gmail.com>
 <20260910063440.4677-2-okerixx@gmail.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260910063440.4677-2-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_035241_643483_587AA52F 
X-CRM114-Status: GOOD (  12.93  )
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

On 10.09.26 08:34, Oleg Keri wrote:

[...]

> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..0eca321ff113 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
>  	return freq;
>  }

In task scheduler code we use cap_scale(v, s) for CPU capacity related
scaling.

We could move its definition from private task scheduler include file
kernel/sched/sched.h to include/linux/topology.h to be able to use it
also outside the task scheduler?

Only compile tested on arm64 and x86.

-->8--

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 0eca321ff113..180a7aa97752 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -186,7 +186,6 @@ int arch_freq_get_on_cpu(int cpu)
      struct amu_cntr_sample *amu_sample;
      unsigned int start_cpu = cpu;
      unsigned long last_update;
-     unsigned int freq = 0;
      u64 scale;

      if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
@@ -245,8 +244,7 @@ int arch_freq_get_on_cpu(int cpu)
      * (see amu_scale_freq_tick for details)
      */
      scale = arch_scale_freq_capacity(cpu);
-     freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
-     return freq;
+     return cap_scale(arch_scale_freq_ref(cpu), scale);
 }

 static void amu_fie_setup(const struct cpumask *cpus)
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 709a2dcf4c73..0a4ee12a98d5 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -351,4 +351,6 @@ static inline unsigned long
topology_get_cpu_scale(int cpu)

 void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);

+#define cap_scale(v, s)               ((v)*(s) >> SCHED_CAPACITY_SHIFT)
+
 #endif /* _LINUX_TOPOLOGY_H */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..45796fccdc84 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -236,8 +236,6 @@ static inline int task_has_dl_policy(struct
task_struct *p)
        return dl_policy(p->policy);
 }

-#define cap_scale(v, s)               ((v)*(s) >> SCHED_CAPACITY_SHIFT)
-
 static inline void update_avg(u64 *avg, u64 sample)
 {
        s64 diff = sample - *avg;


