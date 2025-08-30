Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBAECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 04:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz04imSYex6cruBTKf204fk9b+qALSsd7yfJrZhWV00=; b=I5qUDS8CTIeKT6I6q9uom3GHez
	lAqpZACklWrZP2yRQTczcC05K5YAW46V6v/A8WifF/SO+Pcb3/ie1Jqny2AQb4ab4NwnABhucaGO/
	tPHxqgKS7oSXOOOn9MfItNuHfiylUQD/7dwyk2bjZ3WsYie3+IGVtYmT9IEDG2kvGxeysqrhkOHLB
	uoRfGyTuwUg/DMTSZCiMcy6lBLFfD2i/PbmgAYvaoz4wMJT5cQ8yCLgOc6/ZKTUvAwCPd6jEK70qm
	pzr5z6PdvruyYrAYocK4OHd4hL24a/FKGgrp6rviwuzhpBoFBlxF+QlMTxsRrbM0e2FOyQt3YCNzx
	+gZd3uOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usD1W-00000007Pqz-2xPy;
	Sat, 30 Aug 2025 04:17:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCvk-00000007PTI-1xdj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 04:11:09 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cDMBS1wCKz14Mfm;
	Sat, 30 Aug 2025 12:10:56 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A2A3180485;
	Sat, 30 Aug 2025 12:11:04 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 30 Aug
 2025 12:11:03 +0800
Message-ID: <4639ba1d-110b-9000-f2a9-7bb1cacf8d63@hisilicon.com>
Date: Sat, 30 Aug 2025 12:11:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 2/3] cpufreq: Add a new function to get cpufreq policy
 without checking if the CPU is online
To: Lifeng Zheng <zhenglifeng1@huawei.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<beata.michalska@arm.com>, <sudeep.holla@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <lihuisong@huawei.com>, <yubowen8@huawei.com>,
	<zhangpengjie2@huawei.com>, <linhongye@h-partners.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
 <20250819072931.1647431-3-zhenglifeng1@huawei.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20250819072931.1647431-3-zhenglifeng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_211108_662892_CD823793 
X-CRM114-Status: GOOD (  15.00  )
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



On 19/08/2025 15:29, Lifeng Zheng wrote:
> cpufreq_cpu_get_raw() gets cpufreq policy only if the CPU is in
> policy->cpus mask, which means the CPU is already online. But in some
> cases, the policy is needed before the CPU is added to cpus mask. Add a
> function to get the policy in these cases.
> 
LGTM.

Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---
>  drivers/cpufreq/cpufreq.c | 6 ++++++
>  include/linux/cpufreq.h   | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index fc7eace8b65b..78ca68ea754d 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -198,6 +198,12 @@ struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
>  }
>  EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw);
>  
> +struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu)
> +{
> +	return per_cpu(cpufreq_cpu_data, cpu);
> +}
> +EXPORT_SYMBOL_GPL(cpufreq_cpu_policy);
> +
>  unsigned int cpufreq_generic_get(unsigned int cpu)
>  {
>  	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 95f3807c8c55..26b3c3310d5b 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -205,6 +205,7 @@ struct cpufreq_freqs {
>  
>  #ifdef CONFIG_CPU_FREQ
>  struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu);
> +struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu);
>  struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
>  void cpufreq_cpu_put(struct cpufreq_policy *policy);
>  #else
> @@ -212,6 +213,10 @@ static inline struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
>  {
>  	return NULL;
>  }
> +static inline struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu)
> +{
> +	return NULL;
> +}
>  static inline struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu)
>  {
>  	return NULL;

