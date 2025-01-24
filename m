Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E88C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHlPyp9Wsuk1//JTHYevQVMmyaXun/9BTDCPm9l+sfA=; b=oR9K4i+KzFxUYej/skBRbGXTS5
	eEUhfjDunI83qym4DQVHioozzol/MyTTijvMK37dhBLLtlQI5605hQ7jgAFfIpTxTjFSLPHlLaDBv
	oWxLCLxMUgMXMGR8L+RxKmd6yLY/vFLj9NMWx8e9Wg80KL2EC9a4vFohJvn2dWx5BeAJhgV+ntiPZ
	Fcy9ZcBQ/dkXmt7O0WnRXOH/uuuLnTLsa8R/ldmcQ/xGLky359/z3JdqtXK4x9NsZAIpGybONvPjg
	G0b76SOuDUz0RcQCRI6WLCrOACH0+LXVzMBdUIHJ8hrGRFqg6xwhceT4Oyd98GJax6CtdinhXIjaY
	pllM/PbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBdQ-0000000DutB-3zmN;
	Fri, 24 Jan 2025 04:49:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBc6-0000000DulA-4AvV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 04:48:16 +0000
Received: from [100.79.193.133] (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id 56D112109A4E;
	Thu, 23 Jan 2025 20:48:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 56D112109A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737694093;
	bh=CHlPyp9Wsuk1//JTHYevQVMmyaXun/9BTDCPm9l+sfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kWv1NEQVs7Epi4AflhK354YKrJsnt7W1bJdhPnm0tiNEr9iXNhxRQCthDKtFMXzgQ
	 1Fz2WJ3rusE6h43nEL7z9lJgXHiviiqHta0zOv5YGagYMJioGSetjFcKcSC/j+SWgB
	 lffGBtaGu6d+tLFgN2eyTTrZj1nXv4uFOFdNkBao=
Message-ID: <d44f53b1-c028-45c9-b3e9-cc0afd9925f2@linux.microsoft.com>
Date: Fri, 24 Jan 2025 10:18:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] arm64: amu: Delay allocating cpumask for AMU FIE
 support
To: Beata Michalska <beata.michalska@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
 catalin.marinas@arm.com, rafael@kernel.org, viresh.kumar@linaro.org
Cc: sumitg@nvidia.com, yang@os.amperecomputing.com,
 vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
 zhanjie9@hisilicon.com
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-4-beata.michalska@arm.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250121084435.2839280-4-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204815_086385_373604D4 
X-CRM114-Status: GOOD (  19.37  )
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
> For the time being, the amu_fie_cpus cpumask is being exclusively used
> by the AMU-related internals of FIE support and is guaranteed to be
> valid on every access currently made. Still the mask is not being
> invalidated on one of the error handling code paths, which leaves
> a soft spot with theoretical risk of UAF for CPUMASK_OFFSTACK cases.
> To make things sound, delay allocating said cpumask
> (for CPUMASK_OFFSTACK) avoiding otherwise nasty sanitising case failing
> to register the cpufreq policy notifications.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>   arch/arm64/kernel/topology.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..cb180684d10d 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -194,12 +194,19 @@ static void amu_fie_setup(const struct cpumask *cpus)
>   	int cpu;
>   
>   	/* We are already set since the last insmod of cpufreq driver */
> -	if (unlikely(cpumask_subset(cpus, amu_fie_cpus)))
> +	if (cpumask_available(amu_fie_cpus) &&
> +	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
>   		return;
>   
> -	for_each_cpu(cpu, cpus) {
> +	for_each_cpu(cpu, cpus)
>   		if (!freq_counters_valid(cpu))
>   			return;
> +
> +	if (!cpumask_available(amu_fie_cpus) &&
> +	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
> +		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
> +			  cpumask_pr_args(cpus));
> +		return;
>   	}
>   
>   	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
> @@ -237,17 +244,8 @@ static struct notifier_block init_amu_fie_notifier = {
>   
>   static int __init init_amu_fie(void)
>   {
> -	int ret;
> -
> -	if (!zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL))
> -		return -ENOMEM;
> -
> -	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
> +	return cpufreq_register_notifier(&init_amu_fie_notifier,
>   					CPUFREQ_POLICY_NOTIFIER);
> -	if (ret)
> -		free_cpumask_var(amu_fie_cpus);
> -
> -	return ret;
>   }
>   core_initcall(init_amu_fie);
>   

This patch appears useful, irrespective of the feature introduced by 
this series. Isn't it? Can you please carve out this into an individual 
patch?

The change looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.

Please feel free to add my reviewed-by tag even if you are carving this 
patch out.


