Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3CBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF3UOYMc7muJs71UWTd/bxCq5x/to6zNlVDjm2ki1yk=; b=rtWhNMADHC6poS8Q8MBlnAg5z7
	Mg9wXjuqgaYObkoi+0k8nqg6wGAg6z2slWTWc99sYdXeFJ4hkGcChMYmSUZlWFqggY12rWCzi42nM
	0vsaWxKAd/5u4J7YamLwvVWAQyTEnjs4b7eW2op/C6DltZ65v1lv47+2LLbWfwHkFT6TV1W8DqjOq
	ZDpBnbGG8ASECJU2QTydrr89eV9tRnpvorggalL4zz+HHZuR9yBTjznIAh6FnkLA4djPTN1ZIdyqi
	dpyOJ2/OMUAnl08NcsLW/ssOjHhb3+udNg4wNS2y4F4rtCy5YKEWmkXEEqbuJBbCe/aHmJ6kzzF5o
	dlKIJKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoY1d-0000000C841-2Y4H;
	Wed, 20 Aug 2025 01:54:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXz1-0000000C7q2-42Qs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 01:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dF3UOYMc7muJs71UWTd/bxCq5x/to6zNlVDjm2ki1yk=; b=a3r+0c/IiKg9l/AZqvTzcWT/yK
	hYalFOzbUR0Yy4MEqnuKFHja+yQMRYvHNsQOooM7rLygRhFe2YO4xb93WswPlMr/kx2kZxF96TrVE
	VUNCq1wmF//rheeJgZp2cPQPBUZYNNAx826ma0w5cW+88RWqjz4J26W6zPILnKZPGlkeWIy2zbyta
	SKIvgEvb5DZPdBzAfHgMAOWnz0cxgmRpRo0qahgNEus7XhBV1mCArwaCrpBtPcpaLlx161PdT7WVA
	9raJZeN5gLReJvw2SI9QsfxnjbbPewBW13yvbpPfF89sobVPXhB7eTJq3i8WTBzm8W682STxk0YmG
	sG3apiOA==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXyq-000000008ki-2Ad8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:51:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4c68Zd4WySz27j7S;
	Wed, 20 Aug 2025 09:51:53 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 59FCF140277;
	Wed, 20 Aug 2025 09:50:48 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemh100008.china.huawei.com
 (7.202.181.93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 20 Aug
 2025 09:50:47 +0800
Message-ID: <cbecda55-db03-409a-b892-65171e00f6bc@huawei.com>
Date: Wed, 20 Aug 2025 09:50:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] cpufreq: Add a new function to get cpufreq policy
 without checking if the CPU is online
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <viresh.kumar@linaro.org>,
	<beata.michalska@arm.com>, <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>, <linhongye@h-partners.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
 <20250819072931.1647431-3-zhenglifeng1@huawei.com>
 <CAJZ5v0i7g8i8m9GPi9=-Y0x36491Ng3akUfVP2vPOBS-OAEg=w@mail.gmail.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <CAJZ5v0i7g8i8m9GPi9=-Y0x36491Ng3akUfVP2vPOBS-OAEg=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_025117_070462_80CB9328 
X-CRM114-Status: GOOD (  15.82  )
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

On 2025/8/20 3:05, Rafael J. Wysocki wrote:

> On Tue, Aug 19, 2025 at 9:30 AM Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
>>
>> cpufreq_cpu_get_raw() gets cpufreq policy only if the CPU is in
>> policy->cpus mask, which means the CPU is already online. But in some
>> cases, the policy is needed before the CPU is added to cpus mask. Add a
>> function to get the policy in these cases.
> 
> I'd prefer the subject to be somewhat shorter.  For instance, something like
> 
> cpufreq: Add new helper function returning cpufreq policy
> 
> would suffice because the changelog explains the details.
> 
> With that addressed
> 
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

Thanks! Will shorten it in the next version.

> 
>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>> ---
>>  drivers/cpufreq/cpufreq.c | 6 ++++++
>>  include/linux/cpufreq.h   | 5 +++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index fc7eace8b65b..78ca68ea754d 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -198,6 +198,12 @@ struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
>>  }
>>  EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw);
>>
>> +struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu)
>> +{
>> +       return per_cpu(cpufreq_cpu_data, cpu);
>> +}
>> +EXPORT_SYMBOL_GPL(cpufreq_cpu_policy);
>> +
>>  unsigned int cpufreq_generic_get(unsigned int cpu)
>>  {
>>         struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
>> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
>> index 95f3807c8c55..26b3c3310d5b 100644
>> --- a/include/linux/cpufreq.h
>> +++ b/include/linux/cpufreq.h
>> @@ -205,6 +205,7 @@ struct cpufreq_freqs {
>>
>>  #ifdef CONFIG_CPU_FREQ
>>  struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu);
>> +struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu);
>>  struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
>>  void cpufreq_cpu_put(struct cpufreq_policy *policy);
>>  #else
>> @@ -212,6 +213,10 @@ static inline struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
>>  {
>>         return NULL;
>>  }
>> +static inline struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu)
>> +{
>> +       return NULL;
>> +}
>>  static inline struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu)
>>  {
>>         return NULL;
>> --
>> 2.33.0
>>
>>
> 


