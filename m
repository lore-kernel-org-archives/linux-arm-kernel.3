Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB75CCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjeauMGvhixKRVKtVDbcZpK+rXhbvA3+HVN56bMzdns=; b=PmZGEBV0sXIsowKFH+g9EXl8u+
	4N9zLLhdZm7PXV1Io385oPEP5kF4faA0GjUzuPHirllwGnj3ijb7qXZXbfUjKLcciHSPr0uWVib4f
	7iVxOH+RXxCLm4qifRIC2uZBEhL7gnGojiJvu/AvOouPzMP6UMhrZ8jSVyB7kgPjeeS//4ZPOkc0D
	DZcXeIODbcXwxL3MrAKZXZSnPgSGeOgPhJaqW8d3H78tDM+OB3viEhI1BBX8nGhD9ZfRax+neIExX
	K0q27beVu73TlHh0lEJCUvRUX+3IMIwqnNmNvY74kP/Q79jgB0fgg/K7DVWXoc5DZgj6K1wSkQTo5
	m5VobBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKXTl-0000000ES5F-0shZ;
	Sun, 16 Nov 2025 07:47:21 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKXTi-0000000ES4K-0O7n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 07:47:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YjeauMGvhixKRVKtVDbcZpK+rXhbvA3+HVN56bMzdns=;
	b=e+5hP5vh0YfDBH+LcUmpfTiwCVvjkQWlvJJUqvqx0ExUJcFgq6rx2ANrkvtYhgK5IPmqZM6+j
	ESyVHnve5GNwXdQc0mtuyPxhTG7cLCxr+jO59+0zXy56iiartz13YMj2ViMjIjsrKIYsIeVMIwh
	kUCS4MLwRUFApG1dcFAZVLI=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4d8NFm5nRVzmV6q;
	Sun, 16 Nov 2025 15:45:16 +0800 (CST)
Received: from kwepemk500012.china.huawei.com (unknown [7.202.194.97])
	by mail.maildlp.com (Postfix) with ESMTPS id D2AF1180043;
	Sun, 16 Nov 2025 15:46:58 +0800 (CST)
Received: from [10.67.120.228] (10.67.120.228) by
 kwepemk500012.china.huawei.com (7.202.194.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 16 Nov 2025 15:46:58 +0800
Message-ID: <6dff34d1-731e-4e18-a719-04da498b28ee@huawei.com>
Date: Sun, 16 Nov 2025 15:46:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: topology: Use current freq in governor for
 idle cpus in cpuinfo_avg_freq
To: Beata Michalska <beata.michalska@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <ptsm@linux.microsoft.com>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <xuwei5@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
 <20251104075544.3243606-3-yubowen8@huawei.com> <aRIc20ErWTQr4dRa@arm.com>
From: "yubowen (H)" <yubowen8@huawei.com>
In-Reply-To: <aRIc20ErWTQr4dRa@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.228]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500012.china.huawei.com (7.202.194.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_234718_750296_C07FB4C3 
X-CRM114-Status: GOOD (  26.74  )
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


在 2025/11/11 1:11, Beata Michalska 写道:
> On Tue, Nov 04, 2025 at 03:55:43PM +0800, Bowen Yu wrote:
>> The current cpuinfo_avg_freq interface returns an error when all CPUs
>> under a policy are idle, which is relatively common. To address this, it
>> is better to use the current frequency stored in the governor. This
>> implementation is also used on x86 architecture.
> Well, the very reason of having this knob was not to mix hardware and software
> view of so called 'current frequency'. Note that for x86 there is a dedicated
> config option that keeps the behaviour you have mentioned for backward
> compatibility.
>
>
> cpuinfo_avg_freq -> average freq as seen by hw
> cpuinfo_cur_freq -> closes one can get to current frequency - hw feedback
> scaling_cur_freq -> requested freq, so smth the software believes should be the
> 		    current freq (often might not be)
>
> The following thread might be useful -> [1]
>
> ---
> [1] https://lore.kernel.org/all/20240603114811.oio3uemniib5uaa2@vireshk-i7/
> ---
>
> BR
> Beata
Hi Beata,

Thank you for pointing out the important distinction between hardware and
software views of current frequency. The motivation behind this patch is
not to blur these boundaries, but rather to avoid returning -EAGAIN when
all CPUs under a policy are idle — a relatively common scenario,
especially in idle or low-utilization systems.

I'm relatively new to x86 architecture, so I might be missing something,
but it appears that on x86, a fallback to software-derived frequency
(e.g., via scaling_cur_freq) is always in effect in arch_freq_get_on_cpu()
when the last hardware update is too stale. However, I couldn't locate the
config option that controls this behavior — could you please clarify which
option you were referring to?

I fully understand the concern about mixing hardware and software
frequency views. That said, when no CPU is active and hardware provides
no real-time feedback, there is no available hardware source for current
frequency. In such cases, falling back to the last known frequency
(as maintained by the cpufreq core) seems like a reasonable compromise
— it provides a stale-but-plausible value instead of an error, which
improves usability for monitoring tools and user-space interfaces.

That said, I'm open to better alternatives. If there's a more appropriate
way to handle this scenario — such as deferring to the governor,
introducing a policy-specific fallback, or adjusting the cpufreq core
logic — I’d be happy to revise the patch accordingly.

Thanks again for the reference thread [1], it's very helpful.

BR
Bowen Yu
>> Since the current frequency in the governor is the last known frequency,
>> it should be more user-friendly.
>>
>> This patch also removes redundant !housekeeping_cpu() check since it is
>> inherently done when checking jiffies.
>>
>> Original output when all cpus under a policy are idle:
>> [root@localhost home]# cat /sys/devices/system/cpu/cpufreq/policy0/
>> cpuinfo_avg_freq
>> cat: /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq: Resource
>>   temporarily unavailable
>>
>> Output after changes:
>> [root@localhost home]# cat /sys/devices/system/cpu/cpufreq/policy0
>> /cpuinfo_avg_freq
>> 1200000
>>
>> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
>> ---
>>   arch/arm64/kernel/topology.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index c0dbc27289ea..f1370a4a4df9 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -333,14 +333,13 @@ int arch_freq_get_on_cpu(int cpu)
>>   				if (!idle_cpu(ref_cpu))
>>   					break;
>>   			}
>> +
>> +			if (ref_cpu >= nr_cpu_ids) {
>> +				cpufreq_cpu_put(policy);
>> +				return cpufreq_quick_get(start_cpu);
>> +			}
>>   
>>   			cpufreq_cpu_put(policy);
>> -
>> -			if (ref_cpu >= nr_cpu_ids)
>> -				/* No alternative to pull info from */
>> -				return -EAGAIN;
>> -
>> -			cpu = ref_cpu;
>>   		} else {
>>   			break;
>>   		}
>> -- 
>> 2.33.0

