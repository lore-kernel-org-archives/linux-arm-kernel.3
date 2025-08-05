Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0880C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO3Qn0tssIlttjgTOIC8IugjDIoRT4cFYZnqkbBl38U=; b=WzQZqyAjPEB2QqMgnHpJ6Ba2jt
	xrHIBNONQwuCyk9Z0/WFNQsJpFyRnHHoqQW78aXKI9QkHi55q/j88oqqskUDysHISk5huyAmfDXQo
	NRhzhDRiaMIz3C1BQUTSK3/Dvx5LaqsABgX29KGLksnCRFvuYTOE+KZbkEo6qL5NEi+co5+a8NRnH
	puoPVAhWNuU36M2deGK0keB9a22WKILyiGXLNvvAea1TS8RrZt4synKw2bwbZDgQgqI/0PHxEYf4b
	SlRChqg1OWFXuMV2kRAN22wMqCqk3XL/kFH2s+hx8tRoIsvn4Kd3QI8yNoavdFRunwCzKKEE37EOj
	Pd+H3MSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHxv-0000000Csc1-1bci;
	Tue, 05 Aug 2025 13:44:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHmc-0000000CqvA-0WOd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:32:52 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxDkZ54MSz14MHM;
	Tue,  5 Aug 2025 21:27:50 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C040180487;
	Tue,  5 Aug 2025 21:32:46 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemh100008.china.huawei.com
 (7.202.181.93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 5 Aug
 2025 21:32:45 +0800
Message-ID: <7586dd30-74b5-4e23-9ee2-bb82d3cb8bd4@huawei.com>
Date: Tue, 5 Aug 2025 21:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] cpufreq: Add a new function to get cpufreq policy
 without checking if the CPU is online
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <viresh.kumar@linaro.org>,
	<beata.michalska@arm.com>, <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>
References: <20250805093330.3715444-1-zhenglifeng1@huawei.com>
 <20250805093330.3715444-3-zhenglifeng1@huawei.com>
 <CAJZ5v0h3XKXAGHSrx50vt1Aho3uchiJ2kjQa7qCM8jCr03YKTA@mail.gmail.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <CAJZ5v0h3XKXAGHSrx50vt1Aho3uchiJ2kjQa7qCM8jCr03YKTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_063250_476697_C047AD73 
X-CRM114-Status: GOOD (  18.09  )
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

On 2025/8/5 20:57, Rafael J. Wysocki wrote:

> On Tue, Aug 5, 2025 at 11:34 AM Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
>>
>> cpufreq_cpu_get_raw() gets cpufreq policy only if the CPU is in
>> policy->cpus mask, which means the CPU is already online. But in some
>> cases, the policy is needed before the CPU is added to cpus mask. Add a
>> function to get the policy in these cases.
>>
>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>> ---
>>  drivers/cpufreq/cpufreq.c | 11 +++++++++++
>>  include/linux/cpufreq.h   |  1 +
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index fc7eace8b65b..2de76a072893 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -198,6 +198,17 @@ struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
>>  }
>>  EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw);
>>
>> +struct cpufreq_policy *cpufreq_cpu_get_raw_no_check(unsigned int cpu)
> 
> This is not a particularly nice name.  Maybe call it cpufreq_cpu_policy()?

Thanks for giving a better one.

> 
>> +{
>> +       struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_data, cpu);
>> +
>> +       if (policy)
>> +               return policy;
>> +
>> +       return NULL;
> 
> This could just be a one-liner with this statement in the function body:
> 
>   return per_cpu(cpufreq_cpu_data, cpu);
> 
> Can't it?
> 
> In which case it can be called in all places reading cpufreq_cpu_data
> for a given CPU.

Yes, it can be done in one line. Thanks.

> 
>> +}
>> +EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw_no_check);
>> +
>>  unsigned int cpufreq_generic_get(unsigned int cpu)
>>  {
>>         struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
>> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
>> index 95f3807c8c55..02ad8173dc10 100644
>> --- a/include/linux/cpufreq.h
>> +++ b/include/linux/cpufreq.h
>> @@ -205,6 +205,7 @@ struct cpufreq_freqs {
>>
>>  #ifdef CONFIG_CPU_FREQ
>>  struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu);
>> +struct cpufreq_policy *cpufreq_cpu_get_raw_no_check(unsigned int cpu);
>>  struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
>>  void cpufreq_cpu_put(struct cpufreq_policy *policy);
>>  #else
>> --
> 


