Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58516D185FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rog3MqnILi2w05gDM2K9Bo8d1CiP/9MrnfUSxrtvScE=; b=AB3jaSlHYkP+Ggv79gewransU6
	+ReNuhjZUo9p2s/pKznaUFI1NWcAetlgOOprg6SBmzZE4TsuGsiiVNrVlB45t2nT8BWIfbGrlo+wg
	/pafOpS26IGNi+tBsamnwGkzK8cOYJ85+3en/zOIy0lv/QQs0IEoddRkBwczfqoXw5KUZGNlufk+R
	mcVC9YqbXZjTuTeRA2Y5Tz1Bcf8fdmXn8rD4YyMzalECsf15kzYNI5UfjHB023iUwjiqoebsTKrWe
	ZH8RmlZTV7tbthMwlNiLh88/W+tRTjVoeP3vpsocn0VEW2zlAfd/7AyuBzFf1+WcHpZIHaRJU3wZI
	WdwkX3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr55-0000000HMX7-1NP0;
	Thu, 08 Jan 2026 14:33:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr53-0000000HMVU-0VVN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:33:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6437B497;
	Thu,  8 Jan 2026 06:33:30 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49BB23F5A1;
	Thu,  8 Jan 2026 06:33:30 -0800 (PST)
Message-ID: <daa69e3a-29c0-4c21-a4ae-43b2c7b8f8e6@arm.com>
Date: Thu, 8 Jan 2026 14:33:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/45] arm_mpam: resctrl: Pre-allocate assignable
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
 <20251219181147.3404071-31-ben.horgan@arm.com>
 <20260106142937.00000e33@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260106142937.00000e33@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_063341_281060_CD03E1E8 
X-CRM114-Status: GOOD (  14.95  )
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

On 1/6/26 14:29, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:32 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> When there are not enough monitors, MPAM is able to emulate ABMC by making
>> a smaller number of monitors assignable. These monitors still need to be
>> allocated from the driver, and mapped to whichever control/monitor group
>> resctrl wants to use them with.
>>
>> Add a second array to hold the monitor values indexed by resctrl's cntr_id.
>>
>> When CDP is in use, two monitors are needed so the available number of
>> counters halves. Platforms with one monitor will have zero monitors when
>> CDP is in use.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc:
>> Move __free
>> kmalloc -> kcalloc
>>  
> 
> Trivial comments only,
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
>>  static inline int mpam_alloc_csu_mon(struct mpam_class *class)
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index bea16bc096f7..e96d320c219c 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
>> +/*
>> + * This must run after all event counters have been picked so that any free
>> + * running counters have already been allocated.
>> + */
>> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>> +{
>> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>> +	struct rdt_resource *l3 = &res->resctrl_res;
>> +	struct mpam_class *class = mon->class;
>> +	u16 num_mbwu_mon;
>> +
>> +	if (mon->mbwu_idx_to_mon) {
>> +		pr_debug("monitors free running\n");
>> +		return 0;
>> +	}
>> +
>> +	int *rmid_array __free(kfree) =
>> +		kcalloc(resctrl_arch_system_num_rmid_idx(), sizeof(int), GFP_KERNEL);
> 
> It's a long line, but I'd prefer sizeof(*rmid_array).
> could use kmalloc_array to avoid zeroing just before you fill it with -1.

Nice, I hadn't found kmalloc_array().

> 
>> +
>> +	if (!rmid_array) {
>> +		pr_debug("Failed to allocate RMID array\n");
>> +		return -ENOMEM;
>> +	}
>> +	memset(rmid_array, -1, resctrl_arch_system_num_rmid_idx() * sizeof(int));
>> +
>> +	num_mbwu_mon = class->props.num_mbwu_mon;
>> +	mon->assigned_counters = __alloc_mbwu_array(mon->class, num_mbwu_mon);
>> +	if (IS_ERR(mon->assigned_counters))
>> +		return PTR_ERR(mon->assigned_counters);
>> +	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
>> +
>> +	mpam_resctrl_monitor_sync_abmc_vals(l3);
>> +
>> +	return 0;
>> +}
> 
> 

Thanks,

Ben


