Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C8D3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxaFxXAfLjCdhHNr+p7oFJVXaqRDw/7hp7ZPcMfNGaA=; b=j0EzBr+hL00LpY9KMvr+G2hQ1n
	KElc8eEb45rpUILuuWLhHkVw6av5iv7Bz8Mab3abnJqKZLvdL3ofgV4JqrQfNQ3ckABazUpuoE0vF
	iZufYM8qoDOCbk/xsGIZ6CXNvQfmYjvYhd2wT8wIDMSdckGvF0wrbapMR9nRbGOzSDDazpvvNygEX
	RmBM3gYUk696i3L0JQio9j+mV0q4tT/3Sou1Gj54T2hlqdAPdtvQ8ZdB4MJq0skj0zz0PM42VQZRk
	4SkgdVVZ7hxvMHDa5Wr+UOV/FXKj58u3trm0nt7rGwZrmp7bpY9hWsUXQbSgV9KEHoAZLcVgxRgqV
	mX17on0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0hK-0000000EY06-3fXG;
	Tue, 09 Dec 2025 16:36:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0hH-0000000EXys-2iZF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 16:36:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 117C4175D;
	Tue,  9 Dec 2025 08:36:11 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD1D93F73B;
	Tue,  9 Dec 2025 08:36:14 -0800 (PST)
Message-ID: <dc5355c6-e7a6-466e-9183-9753281961a8@arm.com>
Date: Tue, 9 Dec 2025 16:36:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/38] arm_mpam: resctrl: Update the rmid reallocation
 limit
To: Fenghua Yu <fenghuay@nvidia.com>, James Morse <james.morse@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>, rohit.mathew@arm.com,
 reinette.chatre@intel.com, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-32-james.morse@arm.com>
 <1cc804d5-9d14-4d71-9da1-a660a2569e4e@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <1cc804d5-9d14-4d71-9da1-a660a2569e4e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083619_775524_372EC981 
X-CRM114-Status: GOOD (  22.66  )
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

On 12/6/25 00:06, Fenghua Yu wrote:
> Hi, James,
> 
> On 12/5/25 13:58, James Morse wrote:
>> resctrl's limbo code needs to be told when the data left in a cache is
>> small enough for the partid+pmg value to be re-allocated.
>>
>> x86 uses the cache size divided by the number of rmid users the cache
>> may have. Do the same, but for the smallest cache, and with the
>> number of partid-and-pmg users.
>>
>> Querying the cache size can't happen until after cacheinfo_sysfs_init()
>> has run, so mpam_resctrl_setup() must wait until then.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 54 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>> mpam_resctrl.c
>> index 506063bd3348..ccdf8db742c9 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/resctrl.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>> +#include <linux/wait.h>
>>     #include <asm/mpam.h>
>>   @@ -58,6 +59,13 @@ static bool cdp_enabled;
>>    */
>>   static bool resctrl_enabled;
>>   +/*
>> + * mpam_resctrl_pick_caches() needs to know the size of the caches.
>> cacheinfo
>> + * populates this from a device_initcall(). mpam_resctrl_setup() must
>> wait.
>> + */
>> +static bool cacheinfo_ready;
>> +static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);
>> +
>>   /*
>>    * L3 local/total may come from different classes - what is the
>> number of MBWU
>>    * 'on L3'?
>> @@ -584,6 +592,38 @@ void resctrl_arch_reset_cntr(struct rdt_resource
>> *r, struct rdt_mon_domain *d,
>>       reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
>>   }
>>   +/*
>> + * The rmid realloc threshold should be for the smallest cache
>> exposed to
>> + * resctrl.
>> + */
>> +static int update_rmid_limits(struct mpam_class *class)
>> +{
>> +    u32 num_unique_pmg = resctrl_arch_system_num_rmid_idx();
>> +    struct mpam_props *cprops = &class->props;
>> +    struct cacheinfo *ci;
>> +
>> +    lockdep_assert_cpus_held();
>> +
>> +    /* Assume cache levels are the same size for all CPUs... */
>> +    ci = get_cpu_cacheinfo_level(smp_processor_id(), class->level);
>> +    if (!ci || ci->size == 0) {
>> +        pr_debug("Could not read cache size for class %u\n",
>> +             class->level);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
>> +        return 0;
>> +
>> +    if (!resctrl_rmid_realloc_limit ||
>> +        ci->size < resctrl_rmid_realloc_limit) {
>> +        resctrl_rmid_realloc_limit = ci->size;
>> +        resctrl_rmid_realloc_threshold = ci->size / num_unique_pmg;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static bool cache_has_usable_cpor(struct mpam_class *class)
>>   {
>>       struct mpam_props *cprops = &class->props;
>> @@ -1025,6 +1065,9 @@ static void mpam_resctrl_pick_counters(void)
>>               /* CSU counters only make sense on a cache. */
>>               switch (class->type) {
>>               case MPAM_CLASS_CACHE:
>> +                if (update_rmid_limits(class))
>> +                    continue;
>> +
>>                   counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
>>                   return;
>>               default:
>> @@ -1731,6 +1774,8 @@ int mpam_resctrl_setup(void)
>>       struct mpam_resctrl_res *res;
>>       struct mpam_resctrl_mon *mon;
>>   +    wait_event(wait_cacheinfo_ready, cacheinfo_ready);
> 
> This may cause system hang for any hw/fw issue that causes cacheinfo
> failure. Instead of hang, is it better to have a timeout wait here? Like
>     errowait_event_timeout(wait_cache_info_read, cacheinfo_ready, 5 * HZ);
> and report failure when cacheinfo is not ready.

This is just waiting on everything in device_initcall(). I think we've
got bigger problems if that doesn't finish.

> 
> Thanks.
> 
> -Fenghua


Thanks,

Ben


