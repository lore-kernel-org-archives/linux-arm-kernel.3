Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C5BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0p9kCPX0kFOEZOIBaQgiLe2sNq8cghl604dX/e+fCK8=; b=NFclO/0si5heAqXDJGQfM+WuTI
	KWMB8Mv/qh2F70jdWpKvl4kZU0VLw8T6z4gyjHUru+IVlECofZSemcSG9pBuWuCMbCgotNELKrXGA
	GOaTZv6WcXkRt6TDgHIwzFlmxvrM0i8T2Jg9+RS5bHj+QBjMb9ibm8FNWxefE4LbJ0Q83CVkBzbvq
	XnrHYPb4aK7iQkLOVjM03DNKVgfuWrwcajcZsEnt8Qk63jA1TrIwcu8arAs1h51YFdzDax5JAWCjQ
	MKP3//rWIxpBJvjcuEvrj65nWNZK8nv0YpqBDlxaSWQE4Np4KK3U6LGr8YAAiy0Wkulb6ztD33NaQ
	BZkDBkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbB7i-0000000Ds6I-1Ibv;
	Fri, 24 Jan 2025 04:16:50 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbB6O-0000000Ds1v-04eE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 04:15:29 +0000
Received: from [100.79.193.133] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 85E492109A4F;
	Thu, 23 Jan 2025 20:15:21 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 85E492109A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737692125;
	bh=0p9kCPX0kFOEZOIBaQgiLe2sNq8cghl604dX/e+fCK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vpm4VR+InpBq4Y3Eid7fFT5i1qwVtNVR7e5SIEu1yBJ0pkYqSTpqIVFUmmJ5G+2yb
	 F880cxxnwPG34WnvaV7ir4i7Hx99FBaRKOWMA0xWRV3++8WegzWsTedxU8wpNU8QEd
	 ELnWB+zMdd0wRR/DFmmhuMUQPCCAEOYWNelOzxiA=
Message-ID: <7380ab36-9cbb-455f-95ac-36b2a17db434@linux.microsoft.com>
Date: Fri, 24 Jan 2025 09:45:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
To: Beata Michalska <beata.michalska@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
 catalin.marinas@arm.com, rafael@kernel.org, viresh.kumar@linaro.org
Cc: sumitg@nvidia.com, yang@os.amperecomputing.com,
 vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
 zhanjie9@hisilicon.com
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250121084435.2839280-2-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_201528_111485_F56D2792 
X-CRM114-Status: GOOD (  17.90  )
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


On 21-01-2025 14:14, Beata Michalska wrote:
> Allow arch_freq_get_on_cpu to return an error for cases when retrieving
> current CPU frequency is not possible, whether that being due to lack of
> required arch support or due to other circumstances when the current
> frequency cannot be determined at given point of time.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>   arch/x86/kernel/cpu/aperfmperf.c | 2 +-
>   arch/x86/kernel/cpu/proc.c       | 7 +++++--
>   drivers/cpufreq/cpufreq.c        | 8 ++++----
>   include/linux/cpufreq.h          | 2 +-
>   4 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
> index f642de2ebdac..6cf31a1649c4 100644
> --- a/arch/x86/kernel/cpu/aperfmperf.c
> +++ b/arch/x86/kernel/cpu/aperfmperf.c
> @@ -498,7 +498,7 @@ void arch_scale_freq_tick(void)
>    */
>   #define MAX_SAMPLE_AGE	((unsigned long)HZ / 50)
>   
> -unsigned int arch_freq_get_on_cpu(int cpu)
> +int arch_freq_get_on_cpu(int cpu)
>   {
>   	struct aperfmperf *s = per_cpu_ptr(&cpu_samples, cpu);
>   	unsigned int seq, freq;
> diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> index 41ed01f46bd9..d79f5845a463 100644
> --- a/arch/x86/kernel/cpu/proc.c
> +++ b/arch/x86/kernel/cpu/proc.c
> @@ -86,9 +86,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
>   
>   	if (cpu_has(c, X86_FEATURE_TSC)) {
> -		unsigned int freq = arch_freq_get_on_cpu(cpu);
> +		int freq = arch_freq_get_on_cpu(cpu);
>   
> -		seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
> +		if (freq <= 0)
> +			seq_puts(m, "cpu MHz\t\t: Unknown\n");
> +		else
> +			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
>   	}
>   
>   	/* Cache size */
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 418236fef172..6f45684483c4 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -728,18 +728,18 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
>   show_one(scaling_min_freq, min);
>   show_one(scaling_max_freq, max);
>   
> -__weak unsigned int arch_freq_get_on_cpu(int cpu)
> +__weak int arch_freq_get_on_cpu(int cpu)
>   {
> -	return 0;
> +	return -EOPNOTSUPP;
>   }
>   
>   static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
>   {
>   	ssize_t ret;
> -	unsigned int freq;
> +	int freq;
>   
>   	freq = arch_freq_get_on_cpu(policy->cpu);
> -	if (freq)
> +	if (freq > 0)
>   		ret = sysfs_emit(buf, "%u\n", freq);
>   	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
>   		ret = sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu));
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 7fe0981a7e46..02fd4746231d 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1184,7 +1184,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
>   }
>   #endif
>   
> -extern unsigned int arch_freq_get_on_cpu(int cpu);
> +extern int arch_freq_get_on_cpu(int cpu);
>   
>   #ifndef arch_set_freq_scale
>   static __always_inline

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>


