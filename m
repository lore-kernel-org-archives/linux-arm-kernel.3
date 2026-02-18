Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7FAE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoWIl3J0AYKhjKgSgLSsD1jKc2lLqZ2lM8zO5ZZYuMk=; b=uXTyGykutdpLPHwqZlYbN67oGk
	dzdk8sOEuuzRNA+m5zifAjbp2lXXkowpP8OtWf0aJhLnL3GrZK4oQQGme2AeFuGTxLz2bjgzTG1uI
	Rvat7YZnEfWtet0uP3QqZ/7NFlH1O80SL9qBK1pP25UY5rFbqHpwvaWVvylIhLhrA7Wy9cEAcLF2d
	30gRRRS8563sQOVUzQ8Z74tnHKKTQkZ96ao9Fr2KcSxWP4hwrPN0Vl6tsg5AIL1xlPWzD3pVmQysq
	FndZ2U9Jc7G/Em32Mq+qVoALZF2l5I84tbo52SNJw3I0b67gnb6+3WdkLOtDmKk8JQw2VI+f6muP0
	qAUmzIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskb9-0000000A69X-3o4N;
	Wed, 18 Feb 2026 16:40:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskb7-0000000A68t-3r0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:40:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B312C339;
	Wed, 18 Feb 2026 08:40:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBC983F62B;
	Wed, 18 Feb 2026 08:40:14 -0800 (PST)
Message-ID: <35f1f327-a464-4299-b91b-ec036059a675@arm.com>
Date: Wed, 18 Feb 2026 16:40:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/41] arm_mpam: resctrl: Add support for 'MB' resource
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-27-ben.horgan@arm.com>
 <20260205165018.0000089c@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260205165018.0000089c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_084022_042417_9BA8085D 
X-CRM114-Status: GOOD (  27.62  )
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

Hi Jonathan,

On 2/5/26 16:50, Jonathan Cameron wrote:
> On Tue, 3 Feb 2026 21:43:27 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl supports 'MB', as a percentage throttling of traffic from the
>> L3. This is the control that mba_sc uses, so ideally the class chosen
>> should be as close as possible to the counters used for mbm_total. If
>> there is a single L3 and the topology of the memory matches then the
>> traffic at the memory controller will be equivalent to that at egress of
>> the L3. If these conditions are met allow the memory class to back MB.
>>
>> MB's percentage control should be backed either with the fixed point
>> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
>> bitmaps is not used as its tricky to pick which bits to use to avoid
>> contention, and may be possible to expose this as something other than a
>> percentage in the future.
> 
> I'm very curious to know whether this heuristic is actually useful on many
> systems or whether many / most of them fail this 'shape' heuristic.
> 
> Otherwise, just comments on the placement of __free related declarations.
> See the guidance in cleanup.h for that.
> 
> With those moved, 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> 
>>
>> CC: Zeng Heng <zengheng4@huawei.com>
>> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v2:
>> Code flow change
>> Commit message 'or'
>>
>> Changes since v3:
>> initialise tmp_cpumask
>> update commit message
>> check the traffic matches l3
>> update comment on candidate_class update, only mbm_total
>> drop tags due to rework
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 275 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 274 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 25950e667077..4cca3694978d 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
>> +/*
>> + * topology_matches_l3() - Is the provided class the same shape as L3
>> + * @victim:		The class we'd like to pretend is L3.
>> + *
>> + * resctrl expects all the world's a Xeon, and all counters are on the
>> + * L3. We allow some mapping counters on other classes. This requires
>> + * that the CPU->domain mapping is the same kind of shape.
>> + *
>> + * Using cacheinfo directly would make this work even if resctrl can't
>> + * use the L3 - but cacheinfo can't tell us anything about offline CPUs.
>> + * Using the L3 resctrl domain list also depends on CPUs being online.
>> + * Using the mpam_class we picked for L3 so we can use its domain list
>> + * assumes that there are MPAM controls on the L3.
>> + * Instead, this path eventually uses the mpam_get_cpumask_from_cache_id()
>> + * helper which can tell us about offline CPUs ... but getting the cache_id
>> + * to start with relies on at least one CPU per L3 cache being online at
>> + * boot.
>> + *
>> + * Walk the victim component list and compare the affinity mask with the
>> + * corresponding L3. The topology matches if each victim:component's affinity
>> + * mask is the same as the CPU's corresponding L3's. These lists/masks are
>> + * computed from firmware tables so don't change at runtime.
>> + */
>> +static bool topology_matches_l3(struct mpam_class *victim)
>> +{
>> +	int cpu, err;
>> +	struct mpam_component *victim_iter;
>> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> 
> Same as below.  Move it down right next to the alloc.

I've moved both.

Thanks,

Ben


