Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA6CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bl3eOcc6sGhMB7Cfp7/Ta488voLPowICSalHXhwlC6E=; b=YxWTpNBP7ADtc7Q4d3jMaiaILy
	RZTW00LyQePY+qz3xzOtUzzy9Pd7baUa/RzmLYGdOG+MvcBqnCyJP4H+hfvwkO7g32+BqJ1mt1PCD
	EFHEZFLlznWq2rcBmE61FhmriKq4GzoAL+soI08h10MNrcKnk0bDMH+vtrfpEnLC58bNma0cEPDRK
	T5baKuxVI0rYqXHZbYVRfs2XjN1AcLTWSLLhPs5GK3yA6PjOGwkpPy+7Qi6XIfCGPpG7NnQ9D6Mih
	qTZiDTwTABqQzUnz5hcLOOt83Qkft6uSRRNxobuC+eR/vsd6MOTHK329+4w081LQ7wnmXrVfpeW2E
	11x4Bxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwNy-0000000H10S-3YrB;
	Wed, 29 Oct 2025 02:58:06 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwNv-0000000H0zr-1yXj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:58:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cxBjD2TNmz1T4HJ;
	Wed, 29 Oct 2025 10:56:48 +0800 (CST)
Received: from kwepemr500004.china.huawei.com (unknown [7.202.195.141])
	by mail.maildlp.com (Postfix) with ESMTPS id CCBC514027A;
	Wed, 29 Oct 2025 10:57:51 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemr500004.china.huawei.com
 (7.202.195.141) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 29 Oct
 2025 10:57:51 +0800
Message-ID: <4f02fbba-dcdf-4133-9cad-eb4a75273f0f@hisilicon.com>
Date: Wed, 29 Oct 2025 10:57:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] cpufreq: CPPC: Don't warn if FIE init fails to
 read counters
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <ionela.voinescu@arm.com>, <beata.michalska@arm.com>,
	<zhenglifeng1@huawei.com>, <linux-pm@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
 <20250828110212.2108653-2-zhanjie9@hisilicon.com>
 <h2k4enovkvyasxkf3s6ceslpdnhhuvems3jmmv6a2q2zg4nsap@tlsqppgiszwo>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <h2k4enovkvyasxkf3s6ceslpdnhhuvems3jmmv6a2q2zg4nsap@tlsqppgiszwo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr500004.china.huawei.com (7.202.195.141)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_195803_703235_CDEDDABF 
X-CRM114-Status: GOOD (  17.53  )
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



On 10/28/2025 1:10 PM, Viresh Kumar wrote:
> On 28-08-25, 19:02, Jie Zhan wrote:
>> During the CPPC FIE initialization, reading perf counters on offline cpus
>> should be expected to fail.  Don't warn on this case.
>>
>> Also, change the error log level to debug since FIE is optional.
>>
>> Co-developed-by: Bowen Yu <yubowen8@huawei.com>
>> Signed-off-by: Bowen Yu <yubowen8@huawei.com> # Changing loglevel to debug
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>>  drivers/cpufreq/cppc_cpufreq.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
>> index 4a17162a392d..7724318b3415 100644
>> --- a/drivers/cpufreq/cppc_cpufreq.c
>> +++ b/drivers/cpufreq/cppc_cpufreq.c
>> @@ -144,16 +144,10 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
>>  		init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
>>  
>>  		ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
>> -		if (ret) {
>> -			pr_warn("%s: failed to read perf counters for cpu:%d: %d\n",
>> +		if (ret && cpu_online(cpu)) {
>> +			pr_debug("%s: failed to read perf counters for cpu:%d: %d\n",
>>  				__func__, cpu, ret);
>> -
>> -			/*
>> -			 * Don't abort if the CPU was offline while the driver
>> -			 * was getting registered.
>> -			 */
>> -			if (cpu_online(cpu))
>> -				return;
>> +			return;
> 
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 7724318b3415..5a30c1ec0cdd 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -144,6 +144,11 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
>                 init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
>  
>                 ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
> +
> +               /*
> +                * Don't abort as the CPU was offline while the driver was
> +                * getting registered.
> +                */
>                 if (ret && cpu_online(cpu)) {
>                         pr_debug("%s: failed to read perf counters for cpu:%d: %d\n",
>                                 __func__, cpu, ret);
> 
> Applied with this diff.
> 
Sure, thanks!

