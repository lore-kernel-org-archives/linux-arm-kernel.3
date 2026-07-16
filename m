Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1746C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHiv8cgOY+XLBDgbN2+DQcRWyejDZR3R3rPpBP0f7Ow=; b=Y3AxC/W9W8UiuIeK9fmIJyU5Hs
	TsLHCW9WhEwLk/OyLs9fZoPVD430zaJE0Bd+7s8z+fcYQJzk3aPlY3eIMmF3QkjJW0GCim3kuvIu2
	jxuAUHlIrZ4sxcSuByvb5x12UlGjjxXXZfvN1qkhmzECteqbuNHguAPGQnYoEc1bt4TeweC5e0e5n
	98KIdG+/nul14LyZ1hBd7E35II9e2l4eMz0oLNe9BgdIZenAoFmDYQaOMLyAhCYPaoNXrdPzOABDh
	9Kx5/utC3LEPLsKbo2aNuxSOoY95aWasotMvvxhnlt+JATDPEl7+zL7Zn3Zs9BeP3TS5ueehGC5gD
	X8qk8JLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLTy-0000000HL1p-2MES;
	Thu, 16 Jul 2026 12:46:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLTw-0000000HL1O-0Dun
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:46:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60F1D1476;
	Thu, 16 Jul 2026 05:46:22 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17ED83F7B4;
	Thu, 16 Jul 2026 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784205986; bh=L7PRKcdUcyY9cZtK+oiBNUUw0ecplgqCo37pv1o1gqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B80jlc4CGpyBtAUHsSwtYUiu+85yw7d6NxC/de4RtGH9lGe+2kdVb2h7GtBJTsRu9
	 j03LZ2dE0+NlalEfzzFyKRolk1mpJnqKtWyVsyxrf3CblBeRO3h7DJL3c65s+bnJVf
	 Z7YRsSuxAR4JPWziBF5WVDi9MBFJnnJQLeBhOLKI=
Message-ID: <78a81992-6beb-4caf-b7bd-5cab635a6de1@arm.com>
Date: Thu, 16 Jul 2026 13:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with sysfs
 configuration
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260629090007.1718746-9-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054628_210765_DEAD106C 
X-CRM114-Status: GOOD (  32.63  )
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

On 29/06/2026 10:00, Yeoreum Yun wrote:
> The current ETM4x configuration via sysfs can lead to
> several inconsistencies:
> 
>    - If the configuration is modified via sysfs while a perf session is
>      active, the running configuration may differ before a sched-out and
>      after a subsequent sched-in.
> 
>    - If a perf session and a sysfs session enable tracing concurrently,
>      the configuration from configfs may become corrupted.
> 
>    - There is a risk of corrupting drvdata->config if a perf session enables
>      tracing while cscfg_csdev_disable_active_config() is being handled in
>      etm4_disable_sysfs().
> 
> To resolve these issues, separate the configuration into:
> 
>    - active_config: the configuration applied to the current session
>    - config: the configuration set via sysfs
> 
> Additionally:
> 
>    - Apply the configuration from configfs after taking the appropriate mode.
> 
>    - Since active_config and related fields are accessed only by the local CPU
>      in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
>      remove the lock/unlock from the sysfs enable/disable path and
>      startup/dying_cpu except when to access config fields.
> 
> Fixes: 54ff892b76c6 ("coresight: etm4x: splitting struct etmv4_drvdata")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |   2 +-
>   .../coresight/coresight-etm4x-core.c          | 103 ++++++++++--------
>   drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
>   3 files changed, 58 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index 9b4947d75fde..9d56e17e09b1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>   				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
>   {
>   	int err = -EINVAL, idx;
> -	struct etmv4_config *drvcfg = &drvdata->config;
> +	struct etmv4_config *drvcfg = &drvdata->active_config;
>   	u32 off_mask;
>   
>   	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2798604943ed..31ac7783fdb8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -245,6 +245,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>   struct etm4_enable_arg {
>   	struct etmv4_drvdata *drvdata;
>   	struct coresight_path *path;
> +	struct etmv4_config config;
>   	int rc;
>   };
>   
> @@ -270,10 +271,11 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
>   static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   {
>   	u64 trfcr = drvdata->trfcr;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
> -	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
> +	if (config->mode & ETM_MODE_EXCL_KERN)
>   		trfcr &= ~TRFCR_EL1_ExTRE;
> -	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
> +	if (config->mode & ETM_MODE_EXCL_USER)
>   		trfcr &= ~TRFCR_EL1_E0TRE;
>   
>   	return trfcr;
> @@ -281,7 +283,7 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   
>   /*
>    * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
> - * as configured by the drvdata->config.mode for the current
> + * as configured by the drvdata->active_config.mode for the current
>    * session. Even though we have TRCVICTLR bits to filter the
>    * trace in the ELs, it doesn't prevent the ETM from generating
>    * a packet (e.g, TraceInfo) that might contain the addresses from
> @@ -292,12 +294,13 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
>   {
>   	u64 trfcr, guest_trfcr;
> +	struct etmv4_config *config = &drvdata->active_config;
>   
>   	/* If the CPU doesn't support FEAT_TRF, nothing to do */
>   	if (!drvdata->trfcr)
>   		return;
>   
> -	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
> +	if (config->mode & ETM_MODE_EXCL_HOST)
>   		trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   	else
>   		trfcr = etm4x_get_kern_user_filter(drvdata);
> @@ -305,7 +308,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
>   	write_trfcr(trfcr);
>   
>   	/* Set filters for guests and pass to KVM */
> -	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
> +	if (config->mode & ETM_MODE_EXCL_GUEST)
>   		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   	else
>   		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
> @@ -499,7 +502,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	int i, rc;
>   	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct device *etm_dev = &csdev->dev;
>   	struct csdev_access *csa = &csdev->access;
> @@ -619,27 +622,52 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   static void etm4_enable_sysfs_smp_call(void *info)
>   {
>   	struct etm4_enable_arg *arg = info;
> +	struct etmv4_drvdata *drvdata;
>   	struct coresight_device *csdev;
> +	unsigned long cfg_hash;
> +	int preset;
>   
>   	if (WARN_ON(!arg))
>   		return;
>   
> -	csdev = arg->drvdata->csdev;
> +	drvdata = arg->drvdata;
> +	csdev = drvdata->csdev;
>   	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
>   		/* Someone is already using the tracer */
>   		arg->rc = -EBUSY;
>   		return;
>   	}
>   
> -	arg->rc = etm4_enable_hw(arg->drvdata);
> +	drvdata->active_config = arg->config;

I see, we copy the sysfs config to init_arg and then apply it here.

>   
> -	/* The tracer didn't start */
> +	/* enable any config activated by configfs */
> +	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> +	if (cfg_hash) {
> +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> +							   cfg_hash,
> +							   preset);
> +		if (arg->rc)
> +			goto err;
> +	}
> +
> +	drvdata->trcid = arg->path->trace_id;
> +
> +	/* Tracer will never be paused in sysfs mode */
> +	drvdata->paused = false;
> +
> +	arg->rc = etm4_enable_hw(drvdata);
>   	if (arg->rc) {
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> -		return;
> +		cscfg_csdev_disable_active_config(csdev);
> +		goto err;
>   	}
>   
> +	drvdata->sticky_enable = true;
>   	csdev->path = arg->path;
> +
> +	return;
> +err:
> +	/* The tracer didn't start */
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);

Do we need to reset the active_config ?


> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index c0f7da17a186..a974e4d05838 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1068,6 +1068,7 @@ struct etmv4_save_state {
>    *		allows tracing at all ELs. We don't want to compute this
>    *		at runtime, due to the additional setting of TRFCR_CX when
>    *		in EL2. Otherwise, 0.
> + * @active_config:	structure holding current applied configuration parameters.
>    * @config:	structure holding configuration parameters.

Please could you update the documentation for "config" -> holding sysfs 
mode configuration.

Suzuki


>    * @save_state:	State to be preserved across power loss
>    * @paused:	Indicates if the trace unit is paused.
> @@ -1089,6 +1090,7 @@ struct etmv4_drvdata {
>   	bool				os_unlock : 1;
>   	bool				paused : 1;
>   	u64				trfcr;
> +	struct etmv4_config		active_config;
>   	struct etmv4_config		config;
>   	struct etmv4_save_state		*save_state;
>   	u32				ss_status[ETM_MAX_SS_CMP];


