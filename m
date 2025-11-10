Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0E1CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8LLX/6F5dSXkG4e3cVV8aZwKiidbJmvdgkkGoTpS8M=; b=o83mz8e0+wqDIW92lXaD8nCQRJ
	C0J5ddKxi33QNx6ibG4tGUxDV1qaoN0yuHepdvjwgRl5rYp4NJMi/YjS06Cq7rG05C/67rgpqnSES
	6rpZTeQl95BY2AE3jcxxEr8oelAuOg7rtCrg0NPvX5d0guODoPWsAdQu1KkOUngBpIM+yduhGOb1X
	kuCvekBvWwuzD/Mgrhb5IpBtN/YeJ95rrNyuC9LutYsBa6kzZg+WFuPEoMC/Zw5v+of4OA6VPzRH9
	5LO5XWmyVvRDX2EyvkQVOj0umO8zc5yy3TVm8ro7hO51blOfxOe4wTdpIr/vinZTvU2GOVWpXZ+Eg
	7ecKrmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPU4-00000005FFn-2Mh2;
	Mon, 10 Nov 2025 10:50:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPU1-00000005FEs-2tF5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:50:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso9546315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 02:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762771848; x=1763376648; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8LLX/6F5dSXkG4e3cVV8aZwKiidbJmvdgkkGoTpS8M=;
        b=uzqQIHzpH4wxw/AjM0Zn41txCU2V8HBbJ4/RvsEtcePwgQH6Fj6iDDcMcAE8Zmt26C
         91Ff5GQ95N6p+W0sPQho+5lYF5n4vrlKS6m4CCYd+rp/5P5lIkrNkTJS/YqMeXSB3hMA
         wMG8uaWLfbhI8Z3zr5jGb42gKM82EntNXQFsJlE78dETq9qqzgciJTTbqegxHiub3T3m
         lhSGsSezweogMLRnx4xL4FKnJzeiLTzBLbrTH289nLhgst3lcGRu1ZCQT4P7LrkzxaCv
         FrA2sMw1TpNS4d0DmB+T3M63au92H+Md5YsEV2s4K/9veuVLEpR6h051lm/Ng5v/XjJE
         DyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771848; x=1763376648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8LLX/6F5dSXkG4e3cVV8aZwKiidbJmvdgkkGoTpS8M=;
        b=J59qWx+k/q8BZaMfM1A1tfcIswZZbX81Zi2kNl2qOtmc5vp4IBEeRSHqGumclgMMMg
         4P4HV2wA4N5UGAv3Mfum7Cu6UX86IhRmFIeQ0KQv9wB0n9jofc2982kHHCxkDjHm0YEv
         Ptxs+dLSgtqA793KG2KvA5WvVP3Z6whrCt5OpqVNV9y+NJki4dR5JQb7kyMGvbabYxN0
         FJL8mr23u0ahXfoZ74WyzCkRiY8L20cNi1SFhVxp1Z/2pMgOOBRsTtUiVsQ1CWmRZ9MO
         ofFr4gGUsmGIkePmaja6hfm/ZzEQGBMopc7XKksP4Pz8476fELbTLR8zOH6vNQs/o6Sn
         HRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHL8Etlpb9QpPwa73LMGn9V1o8ZSbCcIfFEZI1ZVj2DVLf8kS3Ob2gd+ojLwvyz77HDjLJOINhX2Tv51FfAXwl@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ8OV50En5shIkWj7Oo0ydbN8LXp/XalrMGjfAwvKDSMoSp64S
	P0EvzeOrSuqvdnoZWn1tunyKbnVmG0ABeu9TfP4861p+9osUNK/225TPQjXwlpHlcrM=
X-Gm-Gg: ASbGnctZe8sNritHiD7pCT1hYEypCs0d9ZXRzCNtdKAy8zrvesNJmrc7DATV9+qBxjp
	pAmqhDB7D2z6K//ytBTgY5ME42GIUzKynD2jKOBgTg1fBUbaik7WVvATDTN1IWh18qAg6RGil8e
	igB9JzuVEe+DSCo7v37nwdbxlEGqZu4agOCF2mYbqHFZ1pF3SAHS5jprtl86ED5EUrPXBy+sgD8
	wFVsVfxMS1ZHrF2LZF2lWZFA+cG5hobAHdcI6CkXVt0Om3wFvJJGhhqrywleZTtraH16QHSM2bd
	aYo6tTL3iLJpz8WL8PcvIpC+fwNNYAwBCvbkkUEpi9FYKASj2FwhilXnuxgis0DSkX57sRu/tPZ
	45SFJOItKAANZT5j326yGDF+CfkvlpsXj6uuK6CWQ3mJcwLvPD6XH+sXDjbYnSg/qYd6SA0U9ii
	nYN3TwpuNPL07w3Q8+
X-Google-Smtp-Source: AGHT+IHaJxhP7HYXG0G0oC5AsuOUsW7JSAiEZEPDT4lOwTsG42UCGmTxJq3Rdx0f4hX+1FOKToTpHQ==
X-Received: by 2002:a05:600c:45cf:b0:477:2f7c:3140 with SMTP id 5b1f17b1804b1-4777329768emr58180185e9.37.1762771847538;
        Mon, 10 Nov 2025 02:50:47 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm68577495e9.13.2025.11.10.02.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:50:47 -0800 (PST)
Message-ID: <412d49ea-045c-45ca-bc24-17ae06987e6e@linaro.org>
Date: Mon, 10 Nov 2025 10:50:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] coresight: etm4x: Hook CPU PM callbacks
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-4-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-4-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_025050_127870_035DF4DA 
X-CRM114-Status: GOOD (  21.81  )
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



On 04/11/2025 3:21 pm, Leo Yan wrote:
> Since the CoreSight core layer has registered CPU PM notifiers, this
> patch hooks CPU save and restore callbacks to be invoked from the core
> layer.
> 
> The CPU PM notifier in the ETMv4 driver is no longer needed, remove it
> along with its registration and unregistration code.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 59 ++++------------------
>   1 file changed, 11 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 15bf825a346826cd534ef3cd4f41c885c66321da..adb5c6b12c6f3113747f1f455087b1ab497a53f6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1185,11 +1185,6 @@ static const struct coresight_ops_source etm4_source_ops = {
>   	.pause_perf	= etm4_pause_perf,
>   };
>   
> -static const struct coresight_ops etm4_cs_ops = {
> -	.trace_id	= coresight_etm_get_trace_id,
> -	.source_ops	= &etm4_source_ops,
> -};
> -
>   static bool cpu_supports_sysreg_trace(void)
>   {
>   	u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> @@ -1894,8 +1889,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   	return ret;
>   }
>   
> -static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
> +static int etm4_cpu_save(struct coresight_device *csdev)
>   {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	int ret = 0;
>   
>   	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> @@ -1918,8 +1914,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   	etm4_enable_hw(drvdata, false);
>   }
>   
> -static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> +static void etm4_cpu_restore(struct coresight_device *csdev)
>   {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
>   	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
>   		return;
>   
> @@ -1927,38 +1925,11 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   		__etm4_cpu_restore(drvdata);
>   }
>   
> -static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
> -			      void *v)
> -{
> -	struct etmv4_drvdata *drvdata;
> -	unsigned int cpu = smp_processor_id();
> -
> -	if (!etmdrvdata[cpu])
> -		return NOTIFY_OK;
> -
> -	drvdata = etmdrvdata[cpu];
> -
> -	if (WARN_ON_ONCE(drvdata->cpu != cpu))
> -		return NOTIFY_BAD;
> -
> -	switch (cmd) {
> -	case CPU_PM_ENTER:
> -		if (etm4_cpu_save(drvdata))
> -			return NOTIFY_BAD;
> -		break;
> -	case CPU_PM_EXIT:
> -	case CPU_PM_ENTER_FAILED:
> -		etm4_cpu_restore(drvdata);
> -		break;
> -	default:
> -		return NOTIFY_DONE;
> -	}
> -
> -	return NOTIFY_OK;
> -}
> -
> -static struct notifier_block etm4_cpu_pm_nb = {
> -	.notifier_call = etm4_cpu_pm_notify,
> +static const struct coresight_ops etm4_cs_ops = {
> +	.trace_id		= coresight_etm_get_trace_id,
> +	.pm_save_disable	= etm4_cpu_save,
> +	.pm_restore_enable	= etm4_cpu_restore,
> +	.source_ops		= &etm4_source_ops,
>   };
>   
>   /* Setup PM. Deals with error conditions and counts */
> @@ -1966,16 +1937,12 @@ static int __init etm4_pm_setup(void)
>   {
>   	int ret;
>   
> -	ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
> -	if (ret)
> -		return ret;
> -
>   	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
>   					"arm/coresight4:starting",
>   					etm4_starting_cpu, etm4_dying_cpu);
>   
>   	if (ret)
> -		goto unregister_notifier;
> +		return ret;
>   
>   	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>   					"arm/coresight4:online",
> @@ -1989,15 +1956,11 @@ static int __init etm4_pm_setup(void)
>   
>   	/* failed dyn state - remove others */
>   	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
> -
> -unregister_notifier:
> -	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>   	return ret;
>   }
>   
>   static void etm4_pm_clear(void)
>   {
> -	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>   	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>   	if (hp_online) {
>   		cpuhp_remove_state_nocalls(hp_online);
> 


