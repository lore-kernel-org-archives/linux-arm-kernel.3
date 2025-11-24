Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FFACFD341
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1d7db4jbpWEDjxSJmiEb+yX2P+MCvXx8kaBol+kPG6w=; b=Pr2NP2ISdPIdylbaeR8UlPvQNv
	2PKgYpEelsydYlSYoal96Xf4+sgxVqait3WYB5fVA1q+D+JHDTxjzVMKj3N9WruVR1sLrMlrkGnOx
	q3sYE1JtuloHL1gT28fvw4hIh6LRL8+qPusVehY494EIClZNuo53BE7RcFruW0HpPl2yybvHy9OEw
	Q58OKunBQ/eLhUtZOv1N01PfX0tpP3PmXB/O01YwuhX9OyyLvmMjlG8W6cGSB7MXVkwT5YqyVkQcW
	C/B63JebG6bC20Ca0mdPW4itZSh6MI6yc0By5G1kWRT2rqgEHSVS9Vl44GNAOVs0Q1LZR8ATcUMUF
	SO3PRVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNasH-0000000C94z-3NQi;
	Mon, 24 Nov 2025 18:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNasF-0000000C94U-0bt3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:01:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0BE01477;
	Mon, 24 Nov 2025 10:01:06 -0800 (PST)
Received: from [10.1.30.67] (unknown [10.1.30.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAE793F86F;
	Mon, 24 Nov 2025 10:01:12 -0800 (PST)
Message-ID: <0bea885c-6647-4552-a7f7-4fef260ef97c@arm.com>
Date: Mon, 24 Nov 2025 18:01:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf/arm-ni: rename PMU device name
To: Will Deacon <will@kernel.org>, Shouping Wang <allen.wang@hj-micro.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andy.xu@hj-micro.com, peter.du@hj-micro.com
References: <20251107084320.555979-1-allen.wang@hj-micro.com>
 <20251107084320.555979-2-allen.wang@hj-micro.com>
 <aSR-Lu-nkSJl0V-x@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aSR-Lu-nkSJl0V-x@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100115_227974_FA2AC386 
X-CRM114-Status: GOOD (  17.51  )
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

On 2025-11-24 3:47 pm, Will Deacon wrote:
> On Fri, Nov 07, 2025 at 04:43:18PM +0800, Shouping Wang wrote:
>> The PMU device names are arm_ni_1_*,arm_ni_2_*, etc.
>> The device names change based on the order of registration
>> for multiple NI instances. By naming the PMU device using
>> its address, the device name can be made independent of
>> the registration order.
>>
>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>> ---
>>   drivers/perf/arm-ni.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>> index 1615a0564031..32eabdbe877a 100644
>> --- a/drivers/perf/arm-ni.c
>> +++ b/drivers/perf/arm-ni.c
>> @@ -53,6 +53,7 @@
>>   
>>   #define NI_NUM_COUNTERS		8
>>   #define NI_CCNT_IDX		31
>> +#define NI_PMU_PA_SHIFT		12
>>   
>>   /* Event attributes */
>>   #define NI_CONFIG_TYPE		GENMASK_ULL(15, 0)
>> @@ -115,7 +116,6 @@ struct arm_ni {
>>   	struct device *dev;
>>   	void __iomem *base;
>>   	enum ni_part part;
>> -	int id;
>>   	int cpu;
>>   	int num_cds;
>>   	struct hlist_node cpuhp_node;
>> @@ -560,7 +560,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>>   		.read = arm_ni_event_read,
>>   	};
>>   
>> -	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%d_cd_%d", ni->id, cd->id);
>> +	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%llx", res_start >> NI_PMU_PA_SHIFT);
> 
> Doesn't this have the potential to break userspace (e.g. scripts) that
> expect the current naming to be stable?

Certainly on platforms where only arm_ni_0 ever exists. For 
multi-instance cases it's always been documented that this ID is 
arbitrary, and users should look at the platform device that is the 
sysfs parent of the PMU device(s) in order to disambiguate - from there 
they already have the freedom to use whatever information they like, 
including MMIO resources, but also interrupt numbers, ACPI _UIDs or 
whatever. So although changing one arbitrary value to a different 
arbitrary value is in theory something well-behaved users should be OK 
with, in practice changing it from a small decimal integer to a massive 
hex number may well still break parsing expectations.

Thanks,
Robin.

> 
> Either way, I'll need Robin's acks for these changes.
> 
> Will

