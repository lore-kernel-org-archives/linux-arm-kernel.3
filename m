Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC81CD0D17F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEsUz8dDoVvIufOrHK9ZWcVVWyNJnijW++HS0aXtJXQ=; b=3DXrGfn3zHRV7xF9kgluQdRnlw
	14saOAQOKDl3ZNldJdoRQAOqIIATo2umqgjmFeF4TOaMV1HGjtxRMpw0jUkWPpzB/QTw0COvuIpzo
	HZVPB97N1iD2HuCyvCerK8k0487K6LYcgsjCyFPvQTxKP3+GdyY5k0sg52jKA/R1DavV87tdCxlhv
	On3EEB6uolMURsP7dZ766uRiXAT8PjIEKblnxB/eD+TBYcEdAP8xhMEr7cuo1c0QNDtBdF3pZZAS8
	9LUNCZcjCE/tkydtvEVJicXGfQ5u1Evj5X5ggxaUOhhzGwMhgNJi5B5bAIlzrQXTMwMTvDa65T2+p
	MlqY8GXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqxA-0000000HLGa-26wM;
	Thu, 08 Jan 2026 14:25:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqx8-0000000HLFz-2lv2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 14:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NEsUz8dDoVvIufOrHK9ZWcVVWyNJnijW++HS0aXtJXQ=; b=lPNWkBq6ZuiCbmEaH4tioTKx9C
	pt0UStiAMltTdBf7Aky/GGb4gESK1x7ZD42gw4F+by0VM/E1oPTOmr+YyYPlrUCDy7h4rv2FThlTq
	H6FwEv2/LJmE1J+IFmVj8waz9mmIQYaNJpWqJShTuywhpbIZH2GEDhOY00zm5JROT4FBjSjONpAo9
	b6LXyvWaZiVPcxwQE69lVk37Lne37941MLn6r2j9VVeBA10oUwuNNpKXeZ5rR6be4hqXDjwLM4rah
	Qa2YRqwFOUuXg1x71SvEaxgeF+G+cmOWPo54ATGELvU44+UxBZaVCPN8Xx3Ys7Esh/JHoUZlLgquh
	qV3XdSaA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqx4-0000000DMjC-2y5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:25:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E18C9497;
	Thu,  8 Jan 2026 06:25:17 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C03A93F5A1;
	Thu,  8 Jan 2026 06:25:17 -0800 (PST)
Message-ID: <7dc49b72-603c-4756-9f38-d5037a3a6206@arm.com>
Date: Thu, 8 Jan 2026 14:25:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/45] arm_mpam: resctrl: Pre-allocate free running
 monitors
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-30-ben.horgan@arm.com>
 <20260106142214.0000686c@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260106142214.0000686c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_142527_157825_CC57F4DA 
X-CRM114-Status: GOOD (  33.15  )
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

On 1/6/26 14:22, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:31 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> When there are enough monitors, the resctrl mbm local and total files can
>> be exposed. These need all the monitors that resctrl may use to be
>> allocated up front.
>>
>> Add helpers to do this.
>>
>> If a different candidate class is discovered, the old array should be
>> free'd and the allocated monitors returned to the driver.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> See below.  Maybe there isn't a nicer way to handle the error
> cases in counter_update_class() but I think it can be improved at least
> a little.
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 51caf3b82392..bea16bc096f7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
>> +
>>  static void counter_update_class(enum resctrl_event_id evt_id,
>>  				 struct mpam_class *class)
> The stuff below is very much a case of me trying to figure out a nicer
> code flow in here and stumbling a bit over what it can be, however
> I do think this function would benefit from another look.
> 
>>  {
>> -	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
>> +	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evt_id];
>> +	struct mpam_class *existing_class = mon->class;
>> +	u16 num_mbwu_mon = class->props.num_mbwu_mon;
>> +	int *existing_array = mon->mbwu_idx_to_mon;
>>  
>>  	if (existing_class) {
>>  		if (class->level == 3) {
>> @@ -576,8 +624,40 @@ static void counter_update_class(enum resctrl_event_id evt_id,
>>  		}
>>  	}
>>  
>> -	mpam_resctrl_counters[evt_id].class = class;
>> +	pr_debug("Updating event %u to use class %u\n", evt_id, class->level);
>> +	mon->class = class;
>>  	exposed_mon_capable = true;
>> +
>> +	if (evt_id == QOS_L3_OCCUP_EVENT_ID)
>> +		return;
>> +
>> +	/* Might not need all the monitors */
>> +	num_mbwu_mon = __mpam_monitors_free_running(num_mbwu_mon);
>> +	if (!num_mbwu_mon) {
> 
> For the below suggestion would need duplicate setting 
> 		mon->class = class;
> here (which is the one disadvantage I can see in setting it later than
> currently.  One option would be to flip the logic here and
> not exit early, allowing sharing of that statement after the
> rest of the code.
> 	if (num_mbw_mon) {
> 		stuff to allocate array.
> 	} else {
> 		pr_debug("Not pre-allocating...);
> 	}
> 	mon->class = class;
> }
> 
> 
> 
>> +		pr_debug("Not pre-allocating free-running counters\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * This is the pre-allocated free-running monitors path. It always
>> +	 * allocates one monitor per PARTID * PMG.
>> +	 */
>> +	WARN_ON_ONCE(num_mbwu_mon != resctrl_arch_system_num_rmid_idx());
>> +
>> +	mon->mbwu_idx_to_mon = __alloc_mbwu_array(class, num_mbwu_mon);
> 
> This might be cleaner with a local so as to avoid setting and reverting on error.
> Also, does anything stop mon->class being set after this?
> Seems like that would be cleaner.
> 
> 	int *new_array; // up top obviously.
> 
> 	new_array = __alloc_mbwu_array(class, num_mbwu_mon);
> 	if (IS_ERR(new_array)) {
> 		pr_debug("Failed to allocate MBWU array\n");
> 		return;
> 	}
> 
> //this bit less obviously a good idea.
> 	if (mon->mbwu_idx_to_mon) {
> 		pr_debug("Releasing previous class %u's monitors\n",
> 			 mon->mbwu_idx_to_mon->level);
> 		__free_mbwu_mon(mon->class, mon->mbwu_idx_to_mon, num_mbwu_mon);
> 		kfree(mon->mbwu_idx_to_mon);
> 	}
> //so maybe skip that bit.
> //Anyhow aim is to set these only after we know we are good carry on.
> 	mon->mbwu_idx_to_mon = new_array;
> 	mon->class = class;
> 
> 
> Some parts of this might make sense without going the whole way. Maybe
> just setting the array late and leaving the class set early then
> reverting that on error.
> 
> 

I was considering moving the memory allocation out of the conditional but 
didn't get anywhere better with that idea so I've taken your suggestion and 
included the csu case as well.

	pr_debug("Updating event %u to use class %u\n", evt_id, class->level);

	/* Might not need all the monitors */
	num_mbwu_mon = __mpam_monitors_free_running(num_mbwu_mon);

	if (evt_id != QOS_L3_OCCUP_EVENT_ID && !num_mbwu_mon) {
		/*
		 * This is the pre-allocated free-running monitors path. It always
		 * allocates one monitor per PARTID * PMG.
		 */
		WARN_ON_ONCE(num_mbwu_mon != resctrl_arch_system_num_rmid_idx());

		new_array = __alloc_mbwu_array(class, num_mbwu_mon);
		if (IS_ERR(new_array)) {
			pr_debug("Failed to allocate MBWU array\n");
			return;
		}
		mon->mbwu_idx_to_mon = new_array;

		if (existing_array) {
			pr_debug("Releasing previous class %u's monitors\n",
				 existing_class->level);
			__free_mbwu_mon(existing_class, existing_array, num_mbwu_mon);
			kfree(existing_array);
		}
	} else if (evt_id != QOS_L3_OCCUP_EVENT_ID) {
		pr_debug("Not pre-allocating free-running counters\n");
	}

	exposed_mon_capable = true;
	mon->class = class;


>> +	if (IS_ERR(mon->mbwu_idx_to_mon)) {
>> +		pr_debug("Failed to allocate MBWU array\n");
>> +		mon->class = existing_class;
>> +		mon->mbwu_idx_to_mon = existing_array;
>> +		return;
>> +	}
>> +
>> +	if (existing_array) {
>> +		pr_debug("Releasing previous class %u's monitors\n",
>> +			 existing_class->level);
>> +		__free_mbwu_mon(existing_class, existing_array, num_mbwu_mon);
>> +		kfree(existing_array);
>> +	}
>>  }
>>  
>>  static void mpam_resctrl_pick_counters(void)
> 
 
Thanks,

Ben


