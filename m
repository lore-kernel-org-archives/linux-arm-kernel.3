Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FAACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+LpIs0ABGKOiV60eydwO/d145Y9hqipWZrPRu3HOBc=; b=hCG0+eod6+ekAOkgDR/4mMRfhN
	msIndq/7eLolA1d/MMo25kDrVFkCTPA4/s4dLm9kg8ACcNSG/hU985vq95XjPiYdGr5Z2pQX5+ScM
	89hD9J+6YYz1fgLynd1Mx+GE2WjGz8xBYncOYt/v68LM0eDCA/UjDPAnBp3dM15TWNIt/HBYKHK4Y
	jalf4OUP6AkBsb7scx+xREgjeeuxVG+pEUq4v1i/XjsnR7XH27jySEtBeRNl4sLz+rPbSDIs1mSeQ
	RkOHkKzmJspnWWzapM6KuF3bfwkL6Y08RsZzan+BM3+FdGMieijKxsLN7l0vySPGMMfoO/K/p6T1v
	Ld9p7j9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQsW-00000005OiA-423X;
	Mon, 10 Nov 2025 12:20:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQsU-00000005Ohe-0H4w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:20:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso10854165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762777208; x=1763382008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+LpIs0ABGKOiV60eydwO/d145Y9hqipWZrPRu3HOBc=;
        b=WEExNMnjjYK8iZ7DajTdpESvSRf8UKLPUYIUckMDI9NlZi7OBo8jccShOgBPQAZS7R
         PeNHAm2zMWZtLcrHwweYHP+CScOVR1DCKpW15z5fkd0j9axM+jF2zdN1IKBAJuZddhOl
         /hUQeaossoJZu8mSzm28Ow9Fo5H6KjyNxR0wUkU0YRcrXMHNxV3zVncoWzlZPWhr62lU
         QIxyagl12pIEHbBclwVsiL2wwK4BTEbjf7kA+nxCGS7s4O7DENAjOM384ALSHLQGJBhZ
         ZxfUQwZ57VenP8oMtWslNRE3mxDGToL0HdtjhVrRQ9y1BqrfYZg2pyfcRJuq3xym3EWn
         tQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777208; x=1763382008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+LpIs0ABGKOiV60eydwO/d145Y9hqipWZrPRu3HOBc=;
        b=Fs+1NoyHsB3FOO2/bBS021Gga+jg95KBIQS0XThnVCVoW7WD8ElP+CoHQclwDX/Aw5
         UrsRXRAahlQV2+/gwCRSs6Qq7Yxm1NQihOuNHtXPatb6dfUuFKUDgvHxl3RpNiRhAsZA
         6FFRUGnxDsJBrfo3GvfTZefw9eIc8URbE3vNWTDJ5osFkpIxjrk4ms/i7INSksBIbOUS
         Qxh+/AETM+0+DVVkhGQ42T2TdTosr/FHfV1nLfhsm9cEcJTRONdXZfsTPHcps1wJQBpJ
         6kIOuQ6KIOlka/UjfzkqePvyaS8Hg1AN37USSo+LrfmINM70lwqmLJ7QXzFTYM0Q4EoY
         /LxA==
X-Forwarded-Encrypted: i=1; AJvYcCWLxSOtYEkBpghKcshb4EgAN1ff/Sw1gxMWEQ164KNVjb8SPNPd8q60Zl/YINizZQ5D3HpVr2Hb3Bk4aoYsL1L+@lists.infradead.org
X-Gm-Message-State: AOJu0YxrZP0Ldt6Myzy0il/56SCa0i6Xa+s5zLceqMebU0qXqiLpukpF
	Jzhw4xPMpGhVHZF/K3NveFwFUJ8xtgEMWCf9W7UAhcLFdOutrvHVr3Qln5P4kj3jIIc=
X-Gm-Gg: ASbGncvAXzOg2vZCX1Buoew7MjMHYRtxi0h+auR8sOO9A8ViMH73RiG6wUovDr9u5gC
	eARKmOL6rxhAThrnmxy0wSblG36nqHOVvC5Wq3cQ5yTqdUBswPKQTUh+PqNa2UsXOkCcPpGTtLE
	Cfm/f/nkd6pmPRKogNciw/BvwZ8WLXJ+/S/YAw5mwtDLr+E4ajJTy2KpBRqmhVeSEYFzvY1M1fU
	FxVC50PjSLeRDXwbkX3C21j4SN2afJj/9DNvVT7BnWezjhm8uX0xDgCxkJmkXcbTsj3eK96Ok+T
	0ebSvO11RcnKHPo+SW2msWAmVnAvWtPPdxRgMRSoeQ7tN9RZ2yeKUh2ngEmQW2T7bawVnFh8x9m
	MKZV8urVm34u+gg3LhScJDy8YxaaIvNFditXqlhfjiSrGc5fxLmqJJMyl3MbB0scK04kHJhm+lV
	8KBPEu13VyUSnns7mI
X-Google-Smtp-Source: AGHT+IFJkC8c1JyMZC7WcWJffBv2BeNkOCuG1Cc+BMpDyOz3CdkGvPYLKBqfPtvdmIFnv7NLyQb8fg==
X-Received: by 2002:a05:600c:5486:b0:477:be4:7a52 with SMTP id 5b1f17b1804b1-477732ab255mr53404455e9.39.1762777207920;
        Mon, 10 Nov 2025 04:20:07 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b35ad7c16sm9114419f8f.15.2025.11.10.04.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:20:07 -0800 (PST)
Message-ID: <f01585fc-919d-4059-81e2-7131dd54553a@linaro.org>
Date: Mon, 10 Nov 2025 12:20:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] coresight: Move CPU hotplug callbacks to core
 layer
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_042010_176315_FA4D4307 
X-CRM114-Status: GOOD (  30.63  )
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
> This commit moves CPU hotplug callbacks from ETMv4 driver to core layer.
> The motivation is the core layer can control all components on an
> activated path rather but not only managing tracer in ETMv4 driver.
> 
> The perf event layer will disable CoreSight PMU event 'cs_etm' when
> hotplug off a CPU.  That means a perf mode will be always converted to
> disabled mode in CPU hotplug.  Arm CoreSight CPU hotplug callbacks only
> need to handle the Sysfs mode and ignore the perf mode.
> 
> The core layer disables a source and the path when hotplug-off a CPU.
> 
> When hotplug-in a CPU, it does not re-enable even the trace was enabled
> before hotplug-off, in this case, users are asked to re-enable the trace
> via Sysfs interface.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c       | 41 +++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 -------------------
>   2 files changed, 40 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 7095f9befa98c7d638f857466351ef7cd960fde7..9149f028031808dc2b7285f621b97f3631a02b01 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1726,6 +1726,32 @@ static void coresight_pm_restore(struct coresight_device *csdev)
>   	coresight_ops(csdev)->pm_restore_enable(csdev);
>   }
>   
> +static int coresight_dying_cpu(unsigned int cpu)
> +{
> +	struct coresight_device *source = per_cpu(csdev_source, cpu);
> +	struct coresight_path *path;
> +
> +	if (!source || !source->path)
> +		return 0;
> +
> +	/*
> +	 * The perf event layer will disable PMU events in the CPU hotplug.
> +	 * CoreSight driver should never handle the CS_MODE_PERF case.
> +	 */
> +	if (coresight_get_mode(source) != CS_MODE_SYSFS)
> +		return 0;
> +
> +	/*
> +	 * Save 'source->path' here, as it will be cleared in
> +	 * coresight_disable_source().
> +	 */
> +	path = source->path;
> +
> +	coresight_disable_source(source, NULL);
> +	coresight_disable_path(path);
> +	return 0;

If the user is expected to re-enable and this new state is visible, 
don't you need to use the regular coresight_disable_sysfs() function? It 
calls coresight_disable_source_sysfs() which updates a refcount.

Maybe you didn't do it because it has a mutex in it? It would be easier 
to change that to a spinlock or take the mutex in a wrapper function and 
share the core disabling code with the hotplug path.

> +}
> +
>   static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
>   				   void *v)
>   {
> @@ -1757,11 +1783,24 @@ static struct notifier_block coresight_cpu_pm_nb = {
>   
>   static int __init coresight_pm_setup(void)
>   {
> -	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
> +	int ret;
> +
> +	ret = cpu_pm_register_notifier(&coresight_cpu_pm_nb);
> +	if (ret)
> +		return ret;
> +
> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
> +					"arm/coresight-core:starting",
> +					NULL, coresight_dying_cpu);
> +	if (ret)
> +		cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
> +
> +	return ret;
>   }
>   
>   static void coresight_pm_cleanup(void)
>   {
> +	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>   	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 7bea3d2c6f49a2169b8e3de1cb07cc22147aae3a..1730cee3c3e1845efb2be815553085aba1246cca 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1802,33 +1802,6 @@ static int etm4_online_cpu(unsigned int cpu)
>   	return 0;
>   }
>   
> -static int etm4_starting_cpu(unsigned int cpu)
> -{
> -	if (!etmdrvdata[cpu])
> -		return 0;
> -
> -	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
> -	if (!etmdrvdata[cpu]->os_unlock)
> -		etm4_os_unlock(etmdrvdata[cpu]);
> -
> -	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
> -		etm4_enable_hw(etmdrvdata[cpu], true);
> -	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
> -	return 0;
> -}
> -
> -static int etm4_dying_cpu(unsigned int cpu)
> -{
> -	if (!etmdrvdata[cpu])
> -		return 0;
> -
> -	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
> -	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
> -		etm4_disable_hw(etmdrvdata[cpu]);
> -	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
> -	return 0;
> -}
> -
>   static bool etm4_need_save_restore_context(struct coresight_device *csdev)
>   {
>   	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> @@ -1915,13 +1888,6 @@ static int __init etm4_pm_setup(void)
>   {
>   	int ret;
>   
> -	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
> -					"arm/coresight4:starting",
> -					etm4_starting_cpu, etm4_dying_cpu);
> -
> -	if (ret)
> -		return ret;
> -
>   	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>   					"arm/coresight4:online",
>   					etm4_online_cpu, NULL);
> @@ -1932,14 +1898,11 @@ static int __init etm4_pm_setup(void)
>   		return 0;
>   	}
>   
> -	/* failed dyn state - remove others */
> -	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>   	return ret;
>   }
>   
>   static void etm4_pm_clear(void)
>   {
> -	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>   	if (hp_online) {
>   		cpuhp_remove_state_nocalls(hp_online);
>   		hp_online = 0;
> 


