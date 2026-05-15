Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9D4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1b6vOaMqCEmG/2hVtTitY/n7/xIXSH100fgEF2P5KM=; b=V1P6s/Ix7F+V30MFfgDtewuLSO
	DMG5UV5xnO7FKFxtXmfY+L9DZa7FX8holT7pDbnWqnNC1ChP0FHUCgPaloPJRnUnVDke3Ki3T93Zn
	XWbr5YdRokOXqlXdl3VzID752fmW86UVdrOnCjt9XeuUO5Ju/pTGP5HsMBFAMVKdQ6QJSt2zemY4M
	Pr1pGjVmjT6CtDIVAbzirG5IjbiSAbDF5f8O8pN3/wzLu5ShH1dP7k4u1O2rm2Nnl7B3WydJih+D+
	d/9hKP3yz3o2zf4/H/MgrDtG8NMn6dm8krBrBbwmvKD+JwjM46JKTGC9O5jPi6kQJbwCMwwgR7KJm
	4PKLeh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNujf-00000008mgf-2Vf5;
	Fri, 15 May 2026 15:45:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNujc-00000008mg6-2MB1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:45:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEEA32880;
	Fri, 15 May 2026 08:45:49 -0700 (PDT)
Received: from [10.57.26.77] (unknown [10.57.26.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBC833F85F;
	Fri, 15 May 2026 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778859954; bh=lA78vabUeY/22HO3Al62otFUM7kmkVISd/R4lqOcEqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gq1gZDmhBBR3xBpVO39L92KoXFlrafc8fyy4LfMu8kNMWIgI8MxcLHdyFZv7qzHFQ
	 WMRVXN6kZROEi6GWBA2v63g9iiwuuCYjkIUb/avJTmhl+bQRbMKOeoD+PACmxnuvpt
	 6r95A61MvwvKI9imttp1WJz3CoWsSrO66fffBKd8=
Message-ID: <d1793d84-3a69-41c4-9cd4-1d52a64d12ae@arm.com>
Date: Fri, 15 May 2026 16:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 23/28] coresight: Control path during CPU idle
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
 <20260511-arm_coresight_path_power_management_improvement-v12-23-1c9dcb1de8c9@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-23-1c9dcb1de8c9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_084556_785741_84BEA8EB 
X-CRM114-Status: GOOD (  33.25  )
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

On 11/05/2026 12:11, Leo Yan wrote:
> Extend the CPU PM flow to control the path: disable from source up to
> the node before the sink, then re-enable the same range on restore.
> To avoid latency, control it up to the node before the sink.
> 
> Track per-CPU PM restore failures using percpu_pm_failed.  Once a CPU
> hits a restore failure, set the percpu_pm_failed and return NOTIFY_BAD
> on subsequent notifications to avoid repeating half-completed
> transitions.
> 
> Setting percpu_pm_failed permanently blocks CPU PM on that CPU.  Such
> failures are typically seen during development; disabling PM operations
> simplifies the implementation, and a warning highlights the issue.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 90 +++++++++++++++++++++++-----
>   1 file changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index f07f6f28b9162911cdc673a454702f3ac4dc29ad..674fc375ff44e732405563af7be9dc8fae118e41 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -38,6 +38,7 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
>   
>   static DEFINE_RAW_SPINLOCK(coresight_dev_lock);
>   static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
> +static DEFINE_PER_CPU(bool, percpu_pm_failed);

We have to reset this when the ETM4x module is taken off or the etmN
device is unregistered ?

Rest looks fine to me.

Suzuki


>   
>   /**
>    * struct coresight_node - elements of a path, from source to sink
> @@ -1840,7 +1841,7 @@ static void coresight_release_device_list(void)
>   	}
>   }
>   
> -static struct coresight_device *coresight_cpu_get_active_source(void)
> +static struct coresight_path *coresight_cpu_get_active_path(void)
>   {
>   	struct coresight_device *source;
>   	bool is_active = false;
> @@ -1856,22 +1857,32 @@ static struct coresight_device *coresight_cpu_get_active_source(void)
>   
>   	/*
>   	 * It is expected to run in atomic context, so it cannot be preempted
> -	 * to disable the source. Here returns the active source pointer
> -	 * without concern that its state may change. Since the build path has
> -	 * taken a reference on the component, the source can be safely used
> -	 * by the caller.
> +	 * to disable the path. Here returns the active path pointer without
> +	 * concern that its state may change. Since the build path has taken
> +	 * a reference on the component, the path can be safely used by the
> +	 * caller.
>   	 */
> -	return is_active ? source : NULL;
> +	return is_active ? source->path : NULL;
>   }
>   
> -static int coresight_pm_is_needed(struct coresight_device *csdev)
> +/* Return: 1 if PM is required, 0 if skip, or a negative error */
> +static int coresight_pm_is_needed(struct coresight_path *path)
>   {
> -	if (!csdev)
> +	struct coresight_device *source;
> +
> +	if (this_cpu_read(percpu_pm_failed))
> +		return -EIO;
> +
> +	if (!path)
> +		return 0;
> +
> +	source = coresight_get_source(path);
> +	if (!source)
>   		return 0;
>   
>   	/* pm_save_disable() and pm_restore_enable() must be paired */
> -	if (coresight_ops(csdev)->pm_save_disable &&
> -	    coresight_ops(csdev)->pm_restore_enable)
> +	if (coresight_ops(source)->pm_save_disable &&
> +	    coresight_ops(source)->pm_restore_enable)
>   		return 1;
>   
>   	return 0;
> @@ -1887,22 +1898,71 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
>   	coresight_ops(csdev)->pm_restore_enable(csdev);
>   }
>   
> +static int coresight_pm_save(struct coresight_path *path)
> +{
> +	struct coresight_device *source = coresight_get_source(path);
> +	struct coresight_node *from, *to;
> +	int ret;
> +
> +	ret = coresight_pm_device_save(source);
> +	if (ret)
> +		return ret;
> +
> +	from = coresight_path_first_node(path);
> +	/* Disable up to the node before sink */
> +	to = list_prev_entry(coresight_path_last_node(path), link);
> +	coresight_disable_path_from_to(path, from, to);
> +
> +	return 0;
> +}
> +
> +static void coresight_pm_restore(struct coresight_path *path)
> +{
> +	struct coresight_device *source = coresight_get_source(path);
> +	struct coresight_node *from, *to;
> +	int ret;
> +
> +	from = coresight_path_first_node(path);
> +	/* Enable up to the node before sink */
> +	to = list_prev_entry(coresight_path_last_node(path), link);
> +	ret = coresight_enable_path_from_to(path, coresight_get_mode(source),
> +					    from, to);
> +	if (ret)
> +		goto path_failed;
> +
> +	coresight_pm_device_restore(source);
> +	return;
> +
> +path_failed:
> +	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
> +	       smp_processor_id(), ret);
> +
> +	/*
> +	 * Once PM fails on a CPU, set percpu_pm_failed and leave it set until
> +	 * reboot. This prevents repeated partial transitions during idle
> +	 * entry and exit.
> +	 */
> +	this_cpu_write(percpu_pm_failed, true);
> +}
> +
>   static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
>   				   void *v)
>   {
> -	struct coresight_device *csdev = coresight_cpu_get_active_source();
> +	struct coresight_path *path = coresight_cpu_get_active_path();
> +	int ret;
>   
> -	if (!coresight_pm_is_needed(csdev))
> -		return NOTIFY_DONE;
> +	ret = coresight_pm_is_needed(path);
> +	if (ret <= 0)
> +		return ret ? NOTIFY_BAD : NOTIFY_DONE;
>   
>   	switch (cmd) {
>   	case CPU_PM_ENTER:
> -		if (coresight_pm_device_save(csdev))
> +		if (coresight_pm_save(path))
>   			return NOTIFY_BAD;
>   		break;
>   	case CPU_PM_EXIT:
>   	case CPU_PM_ENTER_FAILED:
> -		coresight_pm_device_restore(csdev);
> +		coresight_pm_restore(path);
>   		break;
>   	default:
>   		return NOTIFY_DONE;
> 


