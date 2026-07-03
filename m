Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iePnWn1STyOvyklsUoVvutkKt8RQo/4FWC/Qf5Y06eg=; b=XuyUXEU336rl167+vTHovpkCik
	I4cTJuYkMwHG4ali0Hj614SBpGS8P/3fdrkXxiokB1v/Z5QvbTuxOIbpuqHx64KJlTY3DSaqfP8h9
	UVaLV4Y44oEjSrOjCEJp+udivHzHFYqqx2OYt2dcf7CmkT1bABLjqIPsuBpJIVVj/HhnP6FqJTAOh
	eHlRJ2TAtcbEynQ1+MvNEf9n8y8Is1y9/W0a1GFADo5iF/VikXIfout9lfm4xin4345c6Ze3CnEEm
	1JJMKa7dVrxMoS670EbK39vDHtXeLfbW+2mVsjqbLFdJmB50L5XuB9KFVfhMV44FcIigpxyNEvong
	anrX+E2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeSd-00000007Bxp-26qT;
	Fri, 03 Jul 2026 14:01:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeSY-00000007BwJ-3FSm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:01:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D646463D;
	Fri,  3 Jul 2026 07:01:33 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.73.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 779203F85F;
	Fri,  3 Jul 2026 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783087297; bh=zQ2saK3N8tjQXvyqm147W7lK2i3tH/yyPXIdgCx7ieI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tUR639/mZqB99L/R8p/+Ow8CUGRtFOhwwjyLrr6Hg+KpqIX6xs5SxN/32z9LegT6t
	 R/RdgLeSyo1ulNknDTjUZLJSrvfuv9+x+LI9uXpbS7aXj1c4ZARoIrQu9shRZGArzx
	 NI6IkcEhuoZ5uJMyZ231a6+jhi/WUZ3Ol7mBckL0=
Message-ID: <b8159f62-51a0-4c67-8058-65109d21b3cb@arm.com>
Date: Fri, 3 Jul 2026 15:01:30 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 1/5] arm_mpam: resctrl: Pick classes for use as MBM
 counters
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-2-ben.horgan@arm.com>
 <887e73b3-a3ec-419e-9583-6a2c288106f2@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <887e73b3-a3ec-419e-9583-6a2c288106f2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_070138_895389_363964FE 
X-CRM114-Status: GOOD (  23.31  )
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

On 7/2/26 17:30, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 5/20/26 14:24, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has two types of bandwidth counters, NUMA-local and global. MPAM
>> can only count globally; either using MSC at the L3 cache or in the
>> memory
>> controllers. When global and local equate to the same thing continue just
>> to call it global.
>>
>> Pick the corresponding MPAM classes to back the MBM counters. As resctrl
>> requires all monitors to be at the L3 cache, we can only use the counters
>> at the memory controllers when they have the same topology as the L3
>> cache
>> and the traffic they see if the same. In particular, for the bandwidth
>> counters at the memory controllers to be exposed to resctrl it is
>> required
>> there is a single L3 cache and a single NUMA node as otherwise cross NUMA
>> traffic will be counted at the wrong instance.
>>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc v1:
>> Move finding any_mon_comp into monitor boilerplate patch
>> Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
>> Remove free running check
>> Trim commit message
>>
>> Changes since v3:
>> Extra paragraph in commit message
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>> mpam_resctrl.c
>> index 226ff6f532fa..f70fa65d39e4 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -606,6 +606,16 @@ static bool cache_has_usable_csu(struct
>> mpam_class *class)
>>       return true;
>>   }
>>   +static bool class_has_usable_mbwu(struct mpam_class *class)
>> +{
>> +    struct mpam_props *cprops = &class->props;
>> +
>> +    if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>   /*
>>    * Calculate the worst-case percentage change from each implemented
>> step
>>    * in the control.
>> @@ -983,6 +993,22 @@ static void mpam_resctrl_pick_counters(void)
>>                   break;
>>               }
>>           }
>> +
>> +        if (class_has_usable_mbwu(class) &&
>> +            topology_matches_l3(class) &&
>> +            traffic_matches_l3(class)) {
>> +            pr_debug("class %u has usable MBWU, and matches L3
>> topology and traffic\n",
>> +                 class->level);
>> +
>> +            /*
>> +             * We can't distinguish traffic by destination so
>> +             * we don't know if it's staying on the same NUMA
> 
> This sentence makes me think counting only on mbm_total is a "software"
> limitation. In fact, it's a MPAM hardware feature (or limitation).
> 
> Maybe add a sentence like this to make it clear why mbm_total only comes
> from originally?
> 
> MPAM only provides one memory bandwidth usage value for each MSC that
> supports memory bandwidth usage . We can't distinguish traffic .."

How about "An MSC measures bandwidth for a path determined by it's
location in hardware."?

Thanks,

Ben

> 
>> +             * node. Hence, we can't calculate mbm_local except
>> +             * when we only have one L3 and it's equivalent to
>> +             * mbm_total and so always use mbm_total.
>> +             */
>> +            counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
>> +        }
>>       }
>>   }
>>   
> 
> Thanks.
> 
> -Fenghua


