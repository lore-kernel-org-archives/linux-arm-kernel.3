Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB029CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOHHMrs5il1Ee3qXOsEQyuYL0/RSXvJc2Iaulc2GucI=; b=YVv/4hrekA/0N4vnxjlsY+g1ZP
	nYdsDc69ubqHj7B2dYFFWb/QyQDR1l9+/A5Gsb3+dceiYMy5MGklqtqjRtELVI106I2k7WMDe/V1T
	N5qq5S2/nwuvJr0aoGMeK1j4DfdqPZ4SL1/dXkv49ZfsZf6bXKhFLzxfspJ3uGuv3+MmUo0eujn9Y
	acR9+BLKORVb99RJMj39GlEeaISsZEhaB2J3sATx/BoPuwDR5OOJ+XHZhTlkX4eQPY7PxYdPqt/EO
	YdkfyaUOKgoqDSDgbsQj8Tcm8DHJTz4yEOG6kzSwdrwZsFPIdQ3pWIs9+43QW2W6wE+jE/qmpR745
	8pCn/FlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSEC-00000000WoX-0wIK;
	Fri, 05 Sep 2025 08:55:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQvA-000000002W1-0Y6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:31:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5207153B;
	Fri,  5 Sep 2025 00:31:32 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1747E3F694;
	Fri,  5 Sep 2025 00:31:36 -0700 (PDT)
Date: Fri, 5 Sep 2025 09:31:03 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	vincent.guittot@linaro.org, yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	zhangpengjie2@huawei.com, linhongye@h-partners.com
Subject: Re: [PATCH v5 3/3] arm64: topology: Setup AMU FIE for online CPUs
 only
Message-ID: <aLqRt0K2-UH8cOcI@arm.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
 <20250819072931.1647431-4-zhenglifeng1@huawei.com>
 <aLVJdy3M1NRBR5LF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLVJdy3M1NRBR5LF@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_003144_247368_5F95BA43 
X-CRM114-Status: GOOD (  38.70  )
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

Hi Ionela,
On Mon, Sep 01, 2025 at 08:29:26AM +0100, Ionela Voinescu wrote:
> Hi,
> 
> On Tuesday 19 Aug 2025 at 15:29:31 (+0800), Lifeng Zheng wrote:
> > When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
> > only CPU0 will go online. The support AMU flag of CPU0 will be set but the
> > flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
> > when it shares a cpufreq policy with other CPU(s). After that, when other
> > CPUs are finally online and the support AMU flags of them are set, they'll
> > never have a chance to set up AMU FIE, even though they're eligible.
> > 
> > To solve this problem, the process of setting up AMU FIE needs to be
> > modified as follows:
> > 
> > 1. Set up AMU FIE only for the online CPUs.
> > 
> > 2. Try to set up AMU FIE each time a CPU goes online and do the
> > freq_counters_valid() check. If this check fails, clear scale freq source
> > of all the CPUs related to the same policy, in case they use different
> > source of the freq scale.
> > 
> > At the same time, this change also be applied to cpufreq when calling
> > arch_set_freq_scale.
> > 
> > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> > ---
> >  arch/arm64/kernel/topology.c | 54 ++++++++++++++++++++++++++++++++++--
> >  drivers/cpufreq/cpufreq.c    |  4 +--
> >  2 files changed, 54 insertions(+), 4 deletions(-)
> > 
> [..]
> >  
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 78ca68ea754d..d1890a2af1af 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -417,7 +417,7 @@ void cpufreq_freq_transition_end(struct cpufreq_policy *policy,
> >  
> >  	cpufreq_notify_post_transition(policy, freqs, transition_failed);
> >  
> > -	arch_set_freq_scale(policy->related_cpus,
> > +	arch_set_freq_scale(policy->cpus,
> >  			    policy->cur,
> >  			    arch_scale_freq_ref(policy->cpu));
> >  
> > @@ -2219,7 +2219,7 @@ unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
> >  		return 0;
> >  
> >  	policy->cur = freq;
> > -	arch_set_freq_scale(policy->related_cpus, freq,
> > +	arch_set_freq_scale(policy->cpus, freq,
> >  			    arch_scale_freq_ref(policy->cpu));
> 
> I think it might be good to keep these calls to arch_set_freq_scale() for
> all related CPUs and not only online ones. This can result in CPUs coming
> out of hotplug with a wrong scale factor, because while they were out, any
> frequency transitions of the policy only modified the scale factor of
> online CPUs. When they come out of hotplug, arch_set_freq_scale() will not
> be called for them until there's a new frequency transition.
> 
> I understand that if this is not changed to only pass online CPUs,
> supports_scale_freq_counters() will now fail when called in
> topology_set_freq_scale() for scenarios when only some CPUs in a policy
> are online - e.g. the scenario in your commit message. But I think a
> simple change in supports_scale_freq_counters() that instead checks that
> at least one CPU in the policy supports AMU-based FIE, instead of all,
> is a better fix that does not break the cpufreq-based FIE. If at least
> one CPU is marked as supporting AMUs for FIE we know that the AMU setup
> path is in progress and we should bail out of
> topology_set_freq_scale()/arch_set_freq_scale(). 
> 

Thank you for pointing that out - that indeed might be an issue, and the
solution you have suggested should do the trick.

---
BR
Beata

> Hope it helps,
> Ionela.
> 
> >  	cpufreq_stats_record_transition(policy, freq);
> >  
> > -- 
> > 2.33.0
> > 
> > 

