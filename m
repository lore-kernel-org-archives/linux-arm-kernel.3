Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C489C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfiBT4i+e4erblo4Z7FEn8UiUH2du6Ayzd5FBWXPi4w=; b=t2Djzg+8j1rsc0TOsL71OHujy3
	2OZexRDPreLN6gvGUlg+YBfa5cGFArKanpb4vTHlbbRAQYVH9D3tZgNsG8rLyaKObfMgOs3TsBKfT
	gye0wysQyJEAUD9aDVbJVa5M//aqIxNXOwATIBL1lTt1N44ezvqnWbqL7lb1SD6L7UgtmslSxYlcH
	dsJHmfp/opEoVhdLZvBjnTgKuK0mtLp/84f0CCIxgnJDW/W2TQ9+NXaKyOieNuNXMF1IYbO2JF8F3
	DN4vw9TEBGbmI/EnWJ74TfmQBmtqNXrDzaO6PrqWE7c3z8iWmEILLFJorpUDK6F/v2TELHJB6Ybv9
	YlA4uYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeiY-00000001onu-3qt9;
	Fri, 17 Jul 2026 09:18:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeiV-00000001omn-3rYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:18:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69C8E1476;
	Fri, 17 Jul 2026 02:18:40 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB4EE3F7B4;
	Fri, 17 Jul 2026 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784279924; bh=NZ11VQ2UlrkmmSssu1s3Q0lo6ANBbwBro9/3SM8FpC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NShuvMKB8Kgx2lMNrQwzDeWMugkBLo0uhf8O9QnuvEGFCn7qcSGmHjlNlY3sLqo6s
	 HbQoPxjyFzTJbUWUFrUXE03XUddERERT+I0HL7h5FSleyCNew/6Azux78/EOZCXlT4
	 KUHesVXwuQXQWftP9xmUXBETCitsaIcB90+g81Pk=
Message-ID: <f8a26b9c-7a61-4594-83ce-60b83ab67d71@arm.com>
Date: Fri, 17 Jul 2026 10:18:41 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 15/23] arm_mpam: Refine L3 topology and class selection
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>,
 Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>,
 Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu
 <newtonl@nvidia.com>, Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1784217438.git.fenghuay@nvidia.com>
 <20260716210329.2914625-15-fenghuay@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260716210329.2914625-15-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_021848_062132_D62A3304 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Fenghua,

On 7/16/26 22:03, Fenghua Yu wrote:
> After enabling memory-level MSCs, the existing class-picking heuristics
> still treat every candidate like an L3 cache MSC. That rejects valid
> memory classes for MBWU counters and applies L3 egress checks to MBA
> classes on CPU-less or system-wide affinities, leaving no monitor or
> control class selected on affected platforms.
> 
> Adjust the heuristics

I think we have to live with what we've got. We don't want to change the resctrl monitor events or
schemata files for existing platforms.

 so memory classes can back MBWU directly, L3
> topology matching is only required for level-3 MBA candidates, and
> traffic matching is skipped when the class already spans all CPUs.


I think we can keep the existing checks the same and if they match go with what we've got and if
they don't then you can go ahead and use MBWU/MBA at NUMA scope when appropriate.


> Also tolerate components with no online CPUs once at least one
> component has matched.

Ok, new support for unexposed features can be added but if we've already got support for something
in the specific setup then we shouldn't change how it is exposed to the user.

THanks,

Ben

> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 953412f11995..86458a56a526 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -854,10 +854,12 @@ static bool topology_matches_l3(struct mpam_class *victim)
>  {
>  	int cpu, err;
>  	struct mpam_component *victim_iter;
> +	bool matched_once = false;
>  
>  	lockdep_assert_cpus_held();
>  
>  	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> +
>  	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
>  		return false;
>  
> @@ -871,8 +873,11 @@ static bool topology_matches_l3(struct mpam_class *victim)
>  		}
>  
>  		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
> -		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> +		if (WARN_ON_ONCE(cpu >= nr_cpu_ids)) {
> +			if (matched_once)
> +				continue;
>  			return false;
> +		}
>  
>  		cpumask_clear(tmp_cpumask);
>  		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> @@ -892,6 +897,7 @@ static bool topology_matches_l3(struct mpam_class *victim)
>  
>  			return false;
>  		}
> +		matched_once = true;
>  	}
>  
>  	return true;
> @@ -1030,13 +1036,15 @@ static void mpam_resctrl_pick_mba(void)
>  			continue;
>  		}
>  
> -		if (!topology_matches_l3(class)) {
> +		if (class->level == 3 && !topology_matches_l3(class)) {
>  			pr_debug("class %u topology doesn't match L3\n",
>  				 class->level);
>  			continue;
>  		}
>  
> -		if (!traffic_matches_l3(class)) {
> +		/* Check memory at egress from L3 for MSC with L3 */
> +		if (!cpumask_equal(&class->affinity, cpu_possible_mask) &&
> +		    !traffic_matches_l3(class)) {
>  			pr_debug("class %u traffic doesn't match L3 egress\n",
>  				 class->level);
>  			continue;
> @@ -1164,8 +1172,9 @@ static void mpam_resctrl_pick_counters(void)
>  		}
>  
>  		if (class_has_usable_mbwu(class) &&
> -		    topology_matches_l3(class) &&
> -		    traffic_matches_l3(class)) {
> +		    ((class->type == MPAM_CLASS_MEMORY) ||
> +		    (topology_matches_l3(class) &&
> +		    traffic_matches_l3(class)))) {
>  			pr_debug("class %u has usable MBWU, and matches L3 topology and traffic\n",
>  				 class->level);
>  
> @@ -1302,6 +1311,9 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>  	if (class->type == MPAM_CLASS_CACHE)
>  		return comp->comp_id;
>  
> +	if (mpam_class_memory(class))
> +		return comp->comp_id;
> +
>  	if (topology_matches_l3(class)) {
>  		/* Use the corresponding L3 component ID as the domain ID */
>  		int id = get_cpu_cacheinfo_id(cpu, 3);


