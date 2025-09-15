Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007C2CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfRsZFpoQYPjxmdn8fIPIG87WJT0e8u6Q6JGhONgU40=; b=rG/BGyqTizXWtb6pa1zjjjFLjU
	0nN/9SqeiixVZjIdVGa3vzvp5NbVPx1IsLmYDp7jnbXPJ7U2IEj12KJx1ZfQWaxwMdCBBt8YpBXDA
	CsXqPkSJ6ZsXdnq4sW26RxkPHZS/eA+EhqgZte9VfWUkpUF7w6koN9jLs25fLoesmdTpaTJCFHweF
	1CNIaVCTcfleDcrqePWydOqg5kM3sWDhFpr+Yag434b8u3ksyks/Xk2kDPvAh9J5Yecu2K4bMJwc0
	yE2FYS57Gwkf2PkkJh2+4jlrk3Nk3JA/LDQEzMaZUknuObIFm41PzinuXNjpqWuFvy3CsIF2yA8Br
	l1tkRvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6kV-00000003m4r-1Zuz;
	Mon, 15 Sep 2025 10:47:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6kS-00000003m3L-0cQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:47:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32DF91424;
	Mon, 15 Sep 2025 03:47:43 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09B723F66E;
	Mon, 15 Sep 2025 03:47:49 -0700 (PDT)
Message-ID: <88a6c0fe-ee7d-4ee6-a27c-8ec23bfed444@arm.com>
Date: Mon, 15 Sep 2025 11:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/31] coresight: etm4x: Always set tracer's device
 mode on target CPU
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-2-ea49e91124ec@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-2-ea49e91124ec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034752_319718_7C015413 
X-CRM114-Status: GOOD (  32.01  )
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

On 15/09/2025 11:33, Leo Yan wrote:
> When enabling a tracer via SysFS interface, the device mode may be set
> by any CPU - not necessarily the target CPU. This can lead to race
> condition in SMP, and may result in incorrect mode values being read.
> 
> Consider the following example, where CPU0 attempts to enable the tracer
> on CPU1 (the target CPU):
> 
>   CPU0                                    CPU1
>   etm4_enable()
>    ` coresight_take_mode(SYSFS)
>    ` etm4_enable_sysfs()
>       ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>       			                /
>                                         /  CPU idle:
>                                        /   etm4_cpu_save()
>                                       /     ` coresight_get_mode()
> 	       Failed to enable h/w /         ^^^
>    ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode
> 
> In this case, CPU0 initiates the operation by taking the SYSFS mode to
> avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
> configure the tracer registers. If any error occurs during this process,
> CPU0 rolls back by setting the mode to DISABLED.
> 
> However, if CPU1 enters an idle state during this time, it might read
> the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
> save and restore tracer context that is actually disabled.
> 
> To resolve the issue, this commit moves the device mode setting logic on
> the target CPU. This ensures that the device mode is only modified by
> the target CPU, eliminating race condition between mode writes and reads
> across CPUs.
> 
> An additional change introduces the etm4_disable_hw_smp_call() function
> for SMP calls, which disables the tracer and explicitly set the mode to
> DISABLED during SysFS operations.
> 
> The flow is updated with this change:
> 
>   CPU0                                    CPU1
>   etm4_enable()
>    ` etm4_enable_sysfs()
>       ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>                                            ` coresight_take_mode(SYSFS)
> 	                                    Failed, set back to DISABLED
>                                            ` coresight_set_mode(DISABLED)
> 
>                                            CPU idle:
>                                            etm4_cpu_save()
>                                             ` coresight_get_mode()
>                                                ^^^
>                                                Read out the DISABLED mode
> 
> Fixes: c38a9ec2b2c1 ("coresight: etm4x: moving etm_drvdata::enable to atomic field")
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 48 +++++++++++++++-------
>   1 file changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 020f070bf17dc0557dfb3ae4f282b0a0c1778bd8..02ad41da7356547a67c53ff0a9146aec844f89da 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -592,10 +592,23 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   static void etm4_enable_hw_smp_call(void *info)

While at this, please could you rename this function to make it explicit
that this is only for sysfs mode ?

e.g., etm4_enable_hw_sysfs_smp_call()

>   {
>   	struct etm4_enable_arg *arg = info;
> +	struct coresight_device *csdev;
>   
>   	if (WARN_ON(!arg))
>   		return;
> +
> +	csdev = arg->drvdata->csdev;
> +	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> +		/* Someone is already using the tracer */
> +		arg->rc = -EBUSY;
> +		return;
> +	}
> +
>   	arg->rc = etm4_enable_hw(arg->drvdata);
> +
> +	/* The tracer didn't start */
> +	if (arg->rc)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
>   }
>   
>   /*
> @@ -811,6 +824,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> +	if (!coresight_take_mode(csdev, CS_MODE_PERF))
> +		return -EBUSY;
> +

Should be done after the CPU check below ? Otherwise you are undoing the
fix on sysfs side.

>   	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
>   		ret = -EINVAL;
>   		goto out;
> @@ -830,6 +846,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	ret = etm4_enable_hw(drvdata);
>   
>   out:
> +	/* The tracer didn't start */
> +	if (ret)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
>   	return ret;
>   }
>   
> @@ -882,11 +901,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>   {
>   	int ret;
>   
> -	if (!coresight_take_mode(csdev, mode)) {
> -		/* Someone is already using the tracer */
> -		return -EBUSY;
> -	}
> -
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
>   		ret = etm4_enable_sysfs(csdev, path);
> @@ -898,10 +912,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>   		ret = -EINVAL;
>   	}
>   
> -	/* The tracer didn't start */
> -	if (ret)
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> -
>   	return ret;
>   }
>   
> @@ -953,10 +963,9 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>   	isb();
>   }
>   
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
> -	struct etmv4_drvdata *drvdata = info;
>   	struct etmv4_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
> @@ -993,6 +1002,15 @@ static void etm4_disable_hw(void *info)
>   		"cpu: %d disable smp call done\n", drvdata->cpu);
>   }
>   
> +static void etm4_disable_hw_smp_call(void *info)

sysfs mode again.

Rest looks fine

Suzuki


> +{
> +	struct etmv4_drvdata *drvdata = info;
> +
> +	etm4_disable_hw(drvdata);
> +
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +}
> +
>   static int etm4_disable_perf(struct coresight_device *csdev,
>   			     struct perf_event *event)
>   {
> @@ -1022,6 +1040,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>   	/* TRCVICTLR::SSSTATUS, bit[9] */
>   	filters->ssstatus = (control & BIT(9));
>   
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +
>   	/*
>   	 * perf will release trace ids when _free_aux() is
>   	 * called at the end of the session.
> @@ -1047,7 +1067,8 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
>   	 * ensures that register writes occur when cpu is powered.
>   	 */
> -	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> +	smp_call_function_single(drvdata->cpu, etm4_disable_hw_smp_call,
> +				 drvdata, 1);
>   
>   	raw_spin_unlock(&drvdata->spinlock);
>   
> @@ -1087,9 +1108,6 @@ static void etm4_disable(struct coresight_device *csdev,
>   		etm4_disable_perf(csdev, event);
>   		break;
>   	}
> -
> -	if (mode)
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
>   }
>   
>   static int etm4_resume_perf(struct coresight_device *csdev)
> 


