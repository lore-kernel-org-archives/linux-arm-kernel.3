Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87ECCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJuWEJUlvaCE4nA4kDuytEb63h3ixW4NdLS1291VPf4=; b=JCLMY+0R7CRmJsPStd8BAWp90W
	uPlN9ki6w5oQKJeDIn5RKftd3Fx5dmeudBK+O3sF/x6Ue8ZccCEZbIq+s1boI2T1ba73s4sSc+xGT
	ge8EyTFYageQu/jP5IZmhkL/fFHrEZ7TM2ATP4nl+xMSl9eFZm56OZrmyexwDsmHkv/UCmSLi7cE1
	VfDrZyoHGti8wauUS7IsS9w/GC3t67SH66Soz6WaG1NjZ5hfWq9p3IT2PUjy61hZiy3PCLCeEJhqX
	b+uQcj3h0XB+clopC6pVmINFvci1MeE3135t4jeHklvIS3I8K5K8VzS+VYbrM1KHOab6SewK6u++C
	UU8LdI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQDg-00000005Kgu-3J74;
	Mon, 10 Nov 2025 11:38:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQDd-00000005KgW-1asu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:37:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D40EB497;
	Mon, 10 Nov 2025 03:37:47 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 248023F63F;
	Mon, 10 Nov 2025 03:37:54 -0800 (PST)
Message-ID: <ac108275-0b12-4cc1-b8db-d864175f9059@arm.com>
Date: Mon, 10 Nov 2025 11:37:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] coresight: etm4x: Add flag to control
 single-shot restart
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_033757_558743_E331ADCF 
X-CRM114-Status: GOOD (  22.32  )
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

On 03/11/2025 16:49, Leo Yan wrote:
> Add a new argument restart_ss to etm4_enable_hw(). When passed as true,
> it resets the TRCSSCSRn.STATUS bit to 0 to re-enable single-shot
> control.
> 
> No functional change. This is a preparation for a subsequent change.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 560975b70474c3449aa6799fc1a8e05d5ea93495..5101ac3885c7dec6aed397668a866b7cfe907d10 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -490,7 +490,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>   	return 0;
>   }
>   
> -static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> +static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)

While this looks to work, I wonder if we could manage this all in the 
config ? i.e.,

Use an extra field, say config->retain_single_shot_status, which 
defaults to 0 and is always cleared once we pass through enable_hw.


>   {
>   	int i, rc;
>   	struct etmv4_config *config = &drvdata->config;
> @@ -565,9 +565,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>   
>   	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +		if (restart_ss) {

		if (!config->retain_single_shot_status) {> +			/* always clear status 
bit on restart if using single-shot */
> +			if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> +				config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +		}
		} else {
			config->retain_single_shot_status = 0;
		}

So, the default behavior is "clear" the status and can be explicitly
requested by the CPU PM code to leave it alone. We could do this as
a separate cleanup.

Suzuki


		}>   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>   		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>   		if (etm4x_sspcicrn_present(drvdata, i))
> @@ -624,7 +626,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>   		return;
>   	}
>   
> -	arg->rc = etm4_enable_hw(arg->drvdata);
> +	arg->rc = etm4_enable_hw(arg->drvdata, true);
>   
>   	/* The tracer didn't start */
>   	if (arg->rc)
> @@ -861,7 +863,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
>   
>   	/* And enable it */
> -	ret = etm4_enable_hw(drvdata);
> +	ret = etm4_enable_hw(drvdata, true);
>   
>   out:
>   	/* Failed to start tracer; roll back to DISABLED mode */
> @@ -1820,7 +1822,7 @@ static int etm4_starting_cpu(unsigned int cpu)
>   		etm4_os_unlock(etmdrvdata[cpu]);
>   
>   	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
> -		etm4_enable_hw(etmdrvdata[cpu]);
> +		etm4_enable_hw(etmdrvdata[cpu], true);
>   	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>   	return 0;
>   }
> 


