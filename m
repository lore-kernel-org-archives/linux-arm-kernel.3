Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA3FCC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 03:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIpHWuXUD+B0nM605H+8Y3byQjJEbNOYgaYDz+R88T4=; b=EkVlMgm0sA/n08Xv64X75LH0Wt
	PMU9p6Y++sMHelibEGYmjDLw/NlB3/5du/UAEE3DPW5BoqbNwEnAtmZMtrnerSKomcoEFT5W9f1yt
	CjP87hDHP39u15cPavaRMVYZahwFjsaF2neBgRIFREuvFgtn3bTcbUeirBlo9cL8Io6kVKKD+kbKg
	uYM2WCxA0DXIZZCnUkH4tQD56TO2WhXwNcTbakLQHqUwRRn1ZakNlQWNFVaCRNyDoLcx7ZOiHYcFj
	B030eJH/iLeg22S3sitJH8dZ9py727zrDR8alWSByJ2tBg0gGCXQ833d5eWvgUBCBsUJE/SzeQZEU
	wcPiSuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCbA-0000000Gm17-2NMM;
	Thu, 15 Oct 2026 03:57:44 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCax-0000000GlzR-46Un
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 03:57:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j4v8l59c0zKm8R;
	Thu, 15 Oct 2026 11:44:55 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id E97934057C;
	Thu, 15 Oct 2026 11:57:17 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 11:57:16 +0800
Message-ID: <526758a6-40f5-4810-8e17-6e94afc3fab2@hisilicon.com>
Date: Thu, 15 Oct 2026 11:57:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Zhan <zhanjie9@hisilicon.com>
Subject: Re: [PATCH 1/3] cpufreq: Add a driver frequency resolution callback
To: Christian Loehle <christian.loehle@arm.com>, <rafael@kernel.org>
CC: <zhenglifeng1@huawei.com>, <zhongqiu.han@oss.qualcomm.com>,
	<viresh.kumar@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, Huang Rui <ray.huang@amd.com>, Perry
 Yuan <perry.yuan@amd.com>, "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>, Shubhang Kaushik
	<sh@gentwo.org>, Pierre Gondois <pierre.gondois@arm.com>, Beata Michalska
	<beata.michalska@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Jeremy Linton
	<jeremy.linton@arm.com>, Peter Zijlstra <peterz@infradead.org>,
	<jonathanh@nvidia.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
References: <20260929102957.2591657-1-christian.loehle@arm.com>
 <20260929102957.2591657-2-christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20260929102957.2591657-2-christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_205733_000146_685C787F 
X-CRM114-Status: GOOD (  22.53  )
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



On 9/29/2026 6:29 PM, Christian Loehle wrote:
> Without a frequency table, cpufreq treats the policy range as continuous
> even when the driver selects discrete performance levels. Governors can
> then issue different kHz requests for the same driver setting.
> 
> Add ->resolve_freq() for table-less ->target() drivers to canonicalize
> requests within the supplied limits using CPUFREQ_RELATION_{L,H,C}.
> Document the callback and verification contracts so callers can safely
> cache resolved requests.
Hi Christian,

IIUC, ->target() + ->resolve_freq() should do almost the same work as
->target_index() + freq_table. Why not switch to ->target_index() if that's
intended?

I had a few unsent comments on the second CPPC patch but perhaps we discuss
this first.

Jie
> 
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  Documentation/admin-guide/pm/cpufreq.rst |  4 ++++
>  Documentation/cpu-freq/cpu-drivers.rst   | 19 +++++++++++++++++++
>  drivers/cpufreq/cpufreq.c                | 17 +++++++++++++++--
>  include/linux/cpufreq.h                  | 10 ++++++++++
>  4 files changed, 48 insertions(+), 2 deletions(-)
> 
[...]
>  
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..44bda2f32fcf 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -480,8 +480,12 @@ static unsigned int __resolve_freq(struct cpufreq_policy *policy,
>  
>  	target_freq = clamp_val(target_freq, min, max);
>  
> -	if (!policy->freq_table)
> +	if (!policy->freq_table) {
> +		if (cpufreq_driver->resolve_freq)
> +			return cpufreq_driver->resolve_freq(policy, target_freq, min, max,
> +							    relation & ~CPUFREQ_RELATION_E);
>  		return target_freq;
> +	}
>  
>  	idx = cpufreq_frequency_table_target(policy, target_freq, min, max, relation);
>  	policy->cached_resolved_idx = idx;
> @@ -495,7 +499,10 @@ static unsigned int __resolve_freq(struct cpufreq_policy *policy,
>   * @policy: associated policy to interrogate
>   * @target_freq: target frequency to resolve.
>   *
> - * The target to driver frequency mapping is cached in the policy.
> + * The frequency-table resolution path caches the mapping in the policy.
> + *
> + * Keep the policy active and exclude driver teardown; a policy reference
> + * alone does not protect driver-private data.
Do you mean the caller should ensure this?
This function doesn't seem to do this.
>   *
>   * Return: Lowest driver-supported frequency greater than or equal to the
>   * given target_freq, subject to policy (min/max) and driver limitations.
> @@ -1445,6 +1452,11 @@ static int cpufreq_policy_online(struct cpufreq_policy *policy,
>  		 * If there is a problem with its frequency table, take it
>  		 * offline and drop it.
>  		 */
> +		if (policy->freq_table && cpufreq_driver->resolve_freq) {
> +			ret = -EINVAL;
> +			goto out_offline_policy;
> +		}
> +
>  		ret = cpufreq_table_validate_and_sort(policy);
>  		if (ret)
>  			goto out_offline_policy;
> @@ -2925,6 +2937,7 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
>  
>  	if (!driver_data || !driver_data->verify || !driver_data->init ||
>  	     (driver_data->target_index && driver_data->target) ||
> +	     (driver_data->resolve_freq && !driver_data->target) ||
>  	     (!!driver_data->setpolicy == (driver_data->target_index || driver_data->target)) ||
>  	     (!driver_data->get_intermediate != !driver_data->target_intermediate) ||
>  	     (!driver_data->online != !driver_data->offline) ||
[...]

