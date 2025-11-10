Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43B5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMvPvRl5d6iVE3ptPaFXfk3oXZYKvNe7sQ20t0HNoRI=; b=FpLOr6zqVeiLEpmG9OdbMh6qBs
	LaRVR5eJsY4+OQE15dIr1eoLlj4jvfrhLuyVKfWGpFPFQnXPrJgGwmPngnERkOQ3jcHQpS4nKFlMC
	X0z6yB1HOgCpv2uQkHLmpYjL9f9YAzqTUp9ojXU3Io3nHlj8YDl4WOdNaqR4xGNCufksrkdwE+Tmo
	TzvzCk7bTRLRFIozPXd9wxzgbHRd3BqWDyJ/6oibuywL1dmdgNSGViWcC1CX/0jP8VYAyg9CBMBIu
	uNz6FYrsFCYV5uVaer4Lk+7GNPGMvIvkp9E81PEW1s79OY0TWnOOKb58d4YC2dKf4AN7i/YmN4nE1
	J9o9h4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPSw-00000005F4i-0PAJ;
	Mon, 10 Nov 2025 10:49:42 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPSs-00000005F2Z-42XU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:49:40 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b72cbc24637so525980666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 02:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762771777; x=1763376577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMvPvRl5d6iVE3ptPaFXfk3oXZYKvNe7sQ20t0HNoRI=;
        b=jMp5Mhc3mywGdkKDiL8TtB2QIpWAkftAdQpsW0pvwI80WgmTWvl4arRQ+erIamxmiI
         Ohn8ptnqZS/BcaMYXOQkCk5rOi/3E2c8UQ1uhUEhTKSqk5iBZ8iDfWFT6hx6yfBJZkai
         UQU0x09JuYLl/OcaiLClDrgmtFlX1QDC3yoQB9lhpP+ERhL1r3CAvHWFZ55tny/P/l8m
         zvXldRN0+SqqdWbWD49yv2NQglonFrZK6yPEVTQqg5Xrzyp9tL8ho/6WukyVNDm5fX6h
         VtNHVerNd9oywxv7E1tTj/dwX9wGlv+AJ9r7v967Ch0bPVfyTIW0g/Kh34dtLRGWygT9
         5Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771777; x=1763376577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMvPvRl5d6iVE3ptPaFXfk3oXZYKvNe7sQ20t0HNoRI=;
        b=kOz8itdU9X9BmdKIXaAXWSqO6MAwN6mpJuba0KhATvr924YgRvnQ6bMh8KVSXIc/1n
         8CVch7e5cPcg8378RKvYT2FbgGyvmzmtaA+mpAvGRkwLp7bvRxyLK3f3U3b4ADNuSuDd
         YQH9plQ98mH50c5wXgctQjO4JDtd44kKFgXOpGvtmJe5PkaZH9K+OBTVp2qAHNhGAM7E
         LCnaDJsO9+ZMXKN1KVhj2rYQIhxGW/hXOqg95KA4zcCUvlwXFeYOHGbbEX3K8FkvQo+5
         le3w3bAFv8zVW43qnsUZXVS7NRDtlM+fe48oMWffA3d5dHWn/0u5UqWYm/wzaOitbIDn
         IJZg==
X-Forwarded-Encrypted: i=1; AJvYcCX617bbKDQemAde/c+pKzg+JQ4UD3nH6nF+3o9EVsLB+aW9hOHLgv2c+Ve7Utkv180NP8e8TrXBXhYmz1PJB7mE@lists.infradead.org
X-Gm-Message-State: AOJu0YxX+XEXPBiOdLIAu3Cuv4HoXfwkqQOjKXuA7RG8m/VaEpQMSgrY
	XcuoK6VkeqTIk8l46ckkSt0JyO4pUvUryglxX9+QB7z3P3+Fr2fGJEtFZuj3RjbnrnE=
X-Gm-Gg: ASbGncuVqN1d+mTCy2OkMBTaACMo2MdIZ1JyXSaPv5NbqIkpfuoz9vDnUPt/mbKRFkS
	6SgT59vQiRo5WatYIGi+o4hcLnCIvPf26jMUIuf9dkHzpZ0eWi9RteUctNdaPPRr2vIYYu0tIQX
	yCYPMFijMQR+6X7e65TwHceSl49q4r2hM/5W/LDrStKfrOjyGVugcpKYq2mIN1uXKpt6fw2C6xL
	GwtVgEuwKJuBkz6khsau9poMZL4m88Yn8FsEVw9sDI2m494Ye4hPLGuuSCgbzg/5kzD+VvQmroI
	87Xy3RzKT5WxnXViMBBPaosE/AXjvLtD3v2AxpH7G489806p5sPXbFP+ARFg1P037kf/OKX6J2p
	w7Q97R8iXNFdt2lNaT9/0PWhj3kmzvMWv6rxHY+sR1LpCOASzmgslV1kJhWzQ47E1/ulTg+0xbg
	LUEmhl+ZoqthrraHR9
X-Google-Smtp-Source: AGHT+IGtpJKRIXNxKL2U5U+JrzpufzBgaRA0TfWq/kavlkvK1yrGXtZK/SX7/Url5/U2GGdG6OWLIA==
X-Received: by 2002:a17:907:969e:b0:b6d:6a35:9996 with SMTP id a640c23a62f3a-b72e058dff0mr709284966b.58.1762771776690;
        Mon, 10 Nov 2025 02:49:36 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf312e25sm1044628266b.20.2025.11.10.02.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:49:36 -0800 (PST)
Message-ID: <a6315648-249c-4e42-8373-6a7bb8c6ee73@linaro.org>
Date: Mon, 10 Nov 2025 10:49:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] coresight: Register CPU PM notifier in core
 layer
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-3-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-3-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_024939_078831_8DE8CA41 
X-CRM114-Status: GOOD (  28.08  )
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
> The current implementation only saves and restores the context for ETM
> sources while ignoring the context of links.  However, if funnels or
> replicators on a linked path resides in a CPU or cluster power domain,
> the hardware context for the link will be lost after resuming from low
> power states.
> 
> To support context management for links during CPU low power modes, a
> better way is to implement CPU PM callbacks in the Arm CoreSight core
> layer.  As the core layer has sufficient information for linked paths,
> from tracers to links, which can be used for power management.
> 
> As a first step, this patch registers CPU PM notifier in the core layer.
> If a source device provides callbacks for saving and restoring context,
> these callbacks will be invoked in CPU suspend and resume.
> 
> Further changes will extend for controlling path.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-core.c | 70 ++++++++++++++++++++++++++++
>   include/linux/coresight.h                    |  2 +
>   2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 25a530cde8938b366bbb144fdcc107271ebae276..f642190740b93555084584abbc1d9426cc87ec7c 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -6,6 +6,7 @@
>   #include <linux/acpi.h>
>   #include <linux/bitfield.h>
>   #include <linux/build_bug.h>
> +#include <linux/cpu_pm.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
>   #include <linux/types.h>
> @@ -1575,6 +1576,68 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
>   }
>   EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
>   
> +static bool coresight_pm_is_needed(struct coresight_device *csdev)
> +{
> +	if (!csdev)
> +		return false;
> +
> +	/* pm_save_disable() and pm_restore_enable() must be paired */
> +	if (!coresight_ops(csdev)->pm_save_disable ||
> +	    !coresight_ops(csdev)->pm_restore_enable)
> +		return false;
> +
> +	return true;
> +}
> +
> +static int coresight_pm_save(struct coresight_device *csdev)
> +{
> +	return coresight_ops(csdev)->pm_save_disable(csdev);
> +}
> +
> +static void coresight_pm_restore(struct coresight_device *csdev)
> +{
> +	coresight_ops(csdev)->pm_restore_enable(csdev);
> +}
> +
> +static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
> +				   void *v)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	struct coresight_device *source = per_cpu(csdev_source, cpu);
> +
> +	if (!coresight_pm_is_needed(source))
> +		return NOTIFY_OK;
> +
> +	switch (cmd) {
> +	case CPU_PM_ENTER:
> +		if (coresight_pm_save(source))
> +			return NOTIFY_BAD;
> +		break;
> +	case CPU_PM_EXIT:
> +	case CPU_PM_ENTER_FAILED:
> +		coresight_pm_restore(source);
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block coresight_cpu_pm_nb = {
> +	.notifier_call = coresight_cpu_pm_notify,
> +};
> +
> +static int __init coresight_pm_setup(void)
> +{
> +	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
> +}
> +
> +static void coresight_pm_cleanup(void)
> +{
> +	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
> +}
> +
>   const struct bus_type coresight_bustype = {
>   	.name	= "coresight",
>   };
> @@ -1629,9 +1692,15 @@ static int __init coresight_init(void)
>   
>   	/* initialise the coresight syscfg API */
>   	ret = cscfg_init();
> +	if (ret)
> +		goto exit_notifier;
> +
> +	ret = coresight_pm_setup();
>   	if (!ret)
>   		return 0;
>   
> +	cscfg_exit();
> +exit_notifier:
>   	atomic_notifier_chain_unregister(&panic_notifier_list,
>   					     &coresight_notifier);
>   exit_perf:
> @@ -1643,6 +1712,7 @@ static int __init coresight_init(void)
>   
>   static void __exit coresight_exit(void)
>   {
> +	coresight_pm_cleanup();
>   	cscfg_exit();
>   	atomic_notifier_chain_unregister(&panic_notifier_list,
>   					     &coresight_notifier);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 222597ec7a089e10ad763df206917e90f34bb5c2..b10ef4fa17a76b4d11223cc8fd43e5544b6ea8b9 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -439,6 +439,8 @@ struct coresight_ops_panic {
>   struct coresight_ops {
>   	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>   			struct coresight_device *sink);
> +	int (*pm_save_disable)(struct coresight_device *csdev);
> +	void (*pm_restore_enable)(struct coresight_device *csdev);
>   	const struct coresight_ops_sink *sink_ops;
>   	const struct coresight_ops_link *link_ops;
>   	const struct coresight_ops_source *source_ops;
> 


