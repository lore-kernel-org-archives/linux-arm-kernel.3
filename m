Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD99FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRSzBVZFgub2HmMShQ90dHmqgeN4zf9oh5ozCMakXGA=; b=UVTLiU8K61TsC/AAU+DaWzT/zz
	kRATOoszh22scd/rRV1jvqbOo6fS/zFY+0Rhh9ZB1vl/yY4v5gR0CP8j0YOigz+jVuAc/OvKPLg7n
	rm2fx5Ikw585+Wp5sHZZw4wdgzZErRR1hjTn1Afxb9x24jFA39PhF9YaQ0KCQYuUugIeSNNjlQMwd
	hbm1nIIhQeFixnpHQPJ8/CYz71E/f+E57vs/4QYJqLB5OzpwxCBJLPxGB1Vur1f2jt+bWhlUuRv13
	FucpfcTuHDpygxQ5aPtjygYwaivG6kCF9ee+PlZboUK5h0DV7KTeyqUFOJpLkPTnYDiuW/39hoHpi
	Hw+uTBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIjB0-00000006Vk7-3IvH;
	Fri, 01 May 2026 08:24:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIjAy-00000006Vjg-0nPl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 08:24:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5D09176B;
	Fri,  1 May 2026 01:24:33 -0700 (PDT)
Received: from [10.57.23.180] (unknown [10.57.23.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 547EB3F7B4;
	Fri,  1 May 2026 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777623879; bh=wvmEX2et2ShvFzfkys+EovBlO7Onf2ndTlH0LxczpEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rKs56zIXFHWIQyf8oJ+Zg7P1QjdVZniDaAKfy9t0b1uMvyUFLOv5S9xDZDhVM+FfD
	 85lphHLA3Dmt2UPFYGoyPoI3nNl1cuuxoJcc1LHCrQ6+cwPhUS7cu7QJUluYqdjUhN
	 4xdsmYq+c4nADTGaVNFeoC1CK0Qcll77VqHwLL/8=
Message-ID: <bc9f873e-4919-4617-bb6f-1f495a6a508b@arm.com>
Date: Fri, 1 May 2026 09:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: ete: Always save state on power down
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
 <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_012444_412021_9EABC9C0 
X-CRM114-Status: GOOD (  30.20  )
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

On 28/04/2026 13:18, James Clark wrote:
> ETE registers are always system registers so it's highly unlikely there
> will be an implementation that preserves them on CPU power down. Also
> the ETE DT binding never documented
> "arm,coresight-loses-context-with-cpu" so nobody would have legitimately
> been able to use that binding to fix it.
> 
> Fix it by hard coding the setting for ETE and add a warning if the user
> tried to use the module parameter. Don't add a warning if
> loses-context-with-cpu is present in the DT as it's not a documented
> binding anyway. etm4_init_pm_save() needs to happen after drvdata is
> initialised so etm4x_is_ete() can be called.
> 
> This fixes the following error when using Coresight with ACPI on the FVP
> which supports CPU PM:
> 
>    coresight ete0: External agent took claim tag
>    WARNING: drivers/hwtracing/coresight/coresight-core.c:248 at coresight_disclaim_device_unlocked+0xe0/0xe8, CPU#0: perf/117
> 
> Fixes: 35e1c9163e02 ("coresight: ete: Add support for ETE tracing")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 +++++++++++++++-------
>   1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042..a7fb680dd383 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -56,10 +56,11 @@ MODULE_PARM_DESC(boot_enable, "Enable tracing on boot");
>   #define PARAM_PM_SAVE_NEVER	  1 /* never save any state */
>   #define PARAM_PM_SAVE_SELF_HOSTED 2 /* save self-hosted state only */
>   
> +/* Save option for ETM4. ETE ignores this option and always saves */
>   static int pm_save_enable = PARAM_PM_SAVE_FIRMWARE;
>   module_param(pm_save_enable, int, 0444);
>   MODULE_PARM_DESC(pm_save_enable,
> -	"Save/restore state on power down: 1 = never, 2 = self-hosted");
> +	"Save/restore state on power down: 1 = never, 2 = self-hosted. ETM4 only.");
>   
>   static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
>   static void etm4_set_default_config(struct etmv4_config *config);
> @@ -1365,6 +1366,30 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
>   	}
>   }
>   
> +static int etm4_init_pm_save(struct device *dev, struct etmv4_drvdata *drvdata)
> +{
> +	if (etm4x_is_ete(drvdata)) {
> +		/*
> +		 * Always do PM save for ETE. It always uses system registers
> +		 * which will be lost on CPU power down.
> +		 */
> +		pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;

Should we do this instead based on if the ETM/ETE is accessed via sys 
instructions ? That would cover all implementations?


Suzuki

> +	} else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE) {
> +		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
> +			PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
> +	}
> +
> +	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
> +		drvdata->save_state = devm_kmalloc(dev,
> +						   sizeof(struct etmv4_save_state),
> +						   GFP_KERNEL);
> +		if (!drvdata->save_state)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
>   static void etm4_init_arch_data(void *info)
>   {
>   	u32 etmidr0;
> @@ -2247,6 +2272,9 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>   		return -ENOMEM;
>   
>   	etm4_set_default(&drvdata->config);
> +	ret = etm4_init_pm_save(dev, drvdata);
> +	if (ret)
> +		return ret;
>   
>   	pdata = coresight_get_platform_data(dev);
>   	if (IS_ERR(pdata))
> @@ -2305,17 +2333,6 @@ static int etm4_probe(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
> -		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
> -			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
> -
> -	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
> -		drvdata->save_state = devm_kmalloc(dev,
> -				sizeof(struct etmv4_save_state), GFP_KERNEL);
> -		if (!drvdata->save_state)
> -			return -ENOMEM;
> -	}
> -
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
>   	drvdata->cpu = coresight_get_cpu(dev);
> 


