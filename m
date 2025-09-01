Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D19DCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Nr/MwF31XEwBjX/1QgxunAdY2Zjigki+lCVGwyIqxs=; b=eJSirFFOdw8bV5chlEu7XOJPhU
	w+wsjzeyV0hjsGMfe+2qxs2REKLVSy1VU6BHSNn3cFS4hF2/51XQpy3rZkfTXDRANlNsvogid1lwK
	i6cZP1UGtx29ytp3xWtIc+afKwOr+xgUQvBplWV7sPzHROL2VuiA4PiYFG35hENJGhIAIZ6KOPkOW
	7iyZEXDyBkzSa5U2Ef/zrWHvE/7tZOxaIOyIT33nmBhowbvt3iFTzi1UdB+u97TQNMyLMmCewhsqh
	6h9ltIgCF1QM4d1B7UGAmtm0KQRfvJm/CfETzDev3f9deGiFT63tRaw7SvmCTCnBAADKBK2emmhC0
	WiIZC3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszpW-0000000BZOH-1xEF;
	Mon, 01 Sep 2025 08:23:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyyp-0000000BRI1-0XPx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 07:29:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3029D1A25;
	Mon,  1 Sep 2025 00:29:20 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.80.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201C93F63F;
	Mon,  1 Sep 2025 00:29:28 -0700 (PDT)
Date: Mon, 1 Sep 2025 08:29:26 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, beata.michalska@arm.com,
	sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	vincent.guittot@linaro.org, yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	zhangpengjie2@huawei.com, linhongye@h-partners.com
Subject: Re: [PATCH v5 3/3] arm64: topology: Setup AMU FIE for online CPUs
 only
Message-ID: <aLVJdy3M1NRBR5LF@arm.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
 <20250819072931.1647431-4-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819072931.1647431-4-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_002931_264780_EB4079B1 
X-CRM114-Status: GOOD (  29.86  )
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

Hi,

On Tuesday 19 Aug 2025 at 15:29:31 (+0800), Lifeng Zheng wrote:
> When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
> only CPU0 will go online. The support AMU flag of CPU0 will be set but the
> flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
> when it shares a cpufreq policy with other CPU(s). After that, when other
> CPUs are finally online and the support AMU flags of them are set, they'll
> never have a chance to set up AMU FIE, even though they're eligible.
> 
> To solve this problem, the process of setting up AMU FIE needs to be
> modified as follows:
> 
> 1. Set up AMU FIE only for the online CPUs.
> 
> 2. Try to set up AMU FIE each time a CPU goes online and do the
> freq_counters_valid() check. If this check fails, clear scale freq source
> of all the CPUs related to the same policy, in case they use different
> source of the freq scale.
> 
> At the same time, this change also be applied to cpufreq when calling
> arch_set_freq_scale.
> 
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 54 ++++++++++++++++++++++++++++++++++--
>  drivers/cpufreq/cpufreq.c    |  4 +--
>  2 files changed, 54 insertions(+), 4 deletions(-)
> 
[..]
>  
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 78ca68ea754d..d1890a2af1af 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -417,7 +417,7 @@ void cpufreq_freq_transition_end(struct cpufreq_policy *policy,
>  
>  	cpufreq_notify_post_transition(policy, freqs, transition_failed);
>  
> -	arch_set_freq_scale(policy->related_cpus,
> +	arch_set_freq_scale(policy->cpus,
>  			    policy->cur,
>  			    arch_scale_freq_ref(policy->cpu));
>  
> @@ -2219,7 +2219,7 @@ unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
>  		return 0;
>  
>  	policy->cur = freq;
> -	arch_set_freq_scale(policy->related_cpus, freq,
> +	arch_set_freq_scale(policy->cpus, freq,
>  			    arch_scale_freq_ref(policy->cpu));

I think it might be good to keep these calls to arch_set_freq_scale() for
all related CPUs and not only online ones. This can result in CPUs coming
out of hotplug with a wrong scale factor, because while they were out, any
frequency transitions of the policy only modified the scale factor of
online CPUs. When they come out of hotplug, arch_set_freq_scale() will not
be called for them until there's a new frequency transition.

I understand that if this is not changed to only pass online CPUs,
supports_scale_freq_counters() will now fail when called in
topology_set_freq_scale() for scenarios when only some CPUs in a policy
are online - e.g. the scenario in your commit message. But I think a
simple change in supports_scale_freq_counters() that instead checks that
at least one CPU in the policy supports AMU-based FIE, instead of all,
is a better fix that does not break the cpufreq-based FIE. If at least
one CPU is marked as supporting AMUs for FIE we know that the AMU setup
path is in progress and we should bail out of
topology_set_freq_scale()/arch_set_freq_scale(). 

Hope it helps,
Ionela.

>  	cpufreq_stats_record_transition(policy, freq);
>  
> -- 
> 2.33.0
> 
> 

