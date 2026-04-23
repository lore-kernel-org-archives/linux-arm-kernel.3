Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF34F9937B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQtSUg7vaMSw/HEBIfOQe1UK7n9zLBFtXbbH3OgDn9I=; b=pL61rpwiFMeKBdX4YOJVKn+com
	KMyYq0vkkbxthALJQyXMgvKGvl+bcTfZV4DVG5RGAYyjL2hkauzxrqiWEregQeCv8Nk10+jk3i1xy
	M+0hMo2uP844m5bPyJG1KHw0K9Y3m2GIyTYeUJnh4N47BVafmbs0/XGfzdjBvh1hhjA25Lhh5CfYt
	/iT1JQ7L52eUqQosI3eZ9T2nfJa70rSNx7AFROruRD27NjmL47Kvs9wl/WcH4oqm1e5InK6fpqd8x
	VKtzJTDLzD0WFkkpldpX0nG92avaKf4pmhvoYYmqQSITrwVG8RJrxF1+jtgmfrJD7y6rSaJOfRrMh
	95FOTZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsoZ-0000000BaEP-0C1y;
	Thu, 23 Apr 2026 12:05:51 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsoS-0000000BaCt-0vVU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:05:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dQtSUg7vaMSw/HEBIfOQe1UK7n9zLBFtXbbH3OgDn9I=;
	b=StbJg1m8yS6T1dmr16DL2qGJW98VRgJWb8uBWpFyTcxTwDTzCdaqCqTJbMgyehYHvtv80szZw
	RHbcAe5NDxqyDxSsoS+E8ZyMR8JYPC+smPyZh40trwkz6sN+lkrIdFmRa3n2A1lj4hlsCX0+wXT
	NEdaselZbBjCbxZMHxsz6KM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4g1ZPg0GKzzRhR4;
	Thu, 23 Apr 2026 19:59:03 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B9FF40561;
	Thu, 23 Apr 2026 20:05:26 +0800 (CST)
Received: from [10.67.121.62] (10.67.121.62) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Apr
 2026 20:05:25 +0800
Message-ID: <842ad447-fe1b-4f6f-8347-efd8314313cd@huawei.com>
Date: Thu, 23 Apr 2026 20:05:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: Limit nr_cpu_ids under nosmp
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>, <linuxarm@huawei.com>,
	<wangzhi12@huawei.com>
References: <20260422095831.2926775-1-zhangpengjie2@huawei.com>
 <aekCUnZAE8bSfNfO@arm.com>
From: "zhangpengjie (A)" <zhangpengjie2@huawei.com>
In-Reply-To: <aekCUnZAE8bSfNfO@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.62]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_050544_883993_33664051 
X-CRM114-Status: GOOD (  27.12  )
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

Hi Catalin,

On 4/23/2026 1:16 AM, Catalin Marinas wrote:
> On Wed, Apr 22, 2026 at 05:58:31PM +0800, Pengjie Zhang wrote:
>> Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.
>>
>> However, arm64 still enumerates firmware-described CPUs during SMP
>> initialization, so secondary CPUs can remain visible to
>> for_each_possible_cpu() users even though they never reach the
>> bringup path in this configuration.
>>
>> This is not just a cosmetic mask mismatch: code iterating over
>> possible CPUs may observe secondary CPU per-CPU state that is never
>> fully initialized under nosmp.
>>
>> Limit nr_cpu_ids to 1 in arch_disable_smp_support() so that
>> secondary CPUs are not set up on arm64 when nosmp/maxcpus=0 is in
>> effect.
>>
>> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>> ---
>>   arch/arm64/kernel/smp.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index 1aa324104afb..cc34c68871e9 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -435,6 +435,15 @@ static void __init hyp_mode_check(void)
>>   	}
>>   }
>>   
>> +void __init arch_disable_smp_support(void)
>> +{
>> +	/*
>> +	 * Under nosmp/maxcpus=0, only the boot CPU can ever be brought up.
>> +	 * Limit nr_cpu_ids so that secondary CPUs are never set up.
>> +	 */
>> +	set_nr_cpu_ids(1);
>> +}
> I don't think that's the right fix. We don't have anything like the x86
> ioapic to disable in this function, so no need to implement it. If
> nr_cpu_ids must be 1 with nosmp/maxcpus=0, I'd rather do this in the
> generic code. It need some alignment with other architectures if we are
> to do this early. IOW, is nosmp equivalent to nr_cpus=1?
>
> In the meantime, for arm64, we can do something like below and let the
> generic code set nr_cpu_ids() via start_kernel() -> setup_nr_cpu_ids().

Thanks for the review. I completely agree with your assessment.

My initial thought was to consolidate the nosmp logic in one place,
but you are right—using `arch_disable_smp_support()` here is indeed
an abuse of the callback, as arm64 doesn't have SMP-specific hardware
to tear down like the x86 IOAPIC.

My main concern was specifically that under nosmp/maxcpus=0, secondary
CPUs can still remain visible to `for_each_possible_cpu()` users on
arm64, even though they will never reach the bringup path.

Regarding your question on whether `nosmp` is equivalent to `nr_cpus=1`:
practically, they both result in a uniprocessor system, but historically
they take different paths (`setup_max_cpus=0` vs early `nr_cpu_ids=1`).
Unifying this globally in generic code would indeed require a broader
cross-arch discussion, so your arm64-specific mitigation is the best
way forward right now.

Your proposed alternative in `smp_init_cpus()` is elegant and solves
the mask mismatch perfectly.

I will spin up a v2 incorporating your snippet and will add a
`Suggested-by` tag for you.

Thanks,
     Pengjie
> -------------8<-------------------
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 1aa324104afb..7364481cc03a 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -754,6 +754,13 @@ void __init smp_init_cpus(void)
>   		return;
>   	}
>
> +	/*
> +	 * For the nosmp/maxcpus=0 case, do not mark the secondary CPUs
> +	 * possible.
> +	 */
> +	if (!setup_max_cpus)
> +		return;
> +
>   	/*
>   	 * We need to set the cpu_logical_map entries before enabling
>   	 * the cpus so that cpu processor description entries (DT cpu nodes
>
>

