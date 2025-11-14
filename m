Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA11CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMEUP9u3W9EIR+cFst4nLdjSq5wH8QN53pHZMn7gQng=; b=j+eAnj0qiG4ir54uXsMvOe94Pd
	v8PoyI64lEJqT593ahF+0vGxf8HMcxiy+Xl/8+uZlcjlQ2W0MSX85zLquVtUmDTCMb6C/vKhhEFhG
	sGeSzNLxedZkWEyc340GAZt3hd0Q+tz0U+6gBkM811pKrLjqZblOKAmI2Eq0aGvm7LEtRi0jESOVv
	1Qnjh2adj++Ijw4qLzfI3Vqpq8PNtIgMsL+smUxTIUIDDCjoQfg5hzVsk8eR9RMgjQ7pZzgaD8T2l
	BVEJ9VhAQX0xUrshKWbrXbpINzaU6b0JuHNNhZnkJLvB4ZfSDbzx1FjaX2/Lz77cw9PnqWJTwl9m/
	FafVzEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwN4-0000000ChVp-2qag;
	Fri, 14 Nov 2025 16:09:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwN2-0000000ChTK-3nfx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:09:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0ACF1AC1;
	Fri, 14 Nov 2025 08:09:48 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3EB3F5A1;
	Fri, 14 Nov 2025 08:09:55 -0800 (PST)
Date: Fri, 14 Nov 2025 16:09:54 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114160954.GJ3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-9-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-9-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080957_047758_7883FB55 
X-CRM114-Status: GOOD (  27.67  )
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

On Wed, Nov 12, 2025 at 03:22:15PM +0000, James Clark wrote:
> Remove hard coded bitfield extractions and shifts and replace with
> ATTR_CFG_GET_FLD().
> 
> ETM4_CFG_BIT_BB was defined to give the register bit positions to
> userspace, TRCCONFIGR_BB should be used in the kernel so replace it.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 380a7840adb8..1aa0357a5ce7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -29,6 +29,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -789,17 +790,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		goto out;
>  
>  	/* Go from generic option to ETMv4 specifics */
> -	if (attr->config & BIT(ETM_OPT_CYCACC)) {
> +	if (ATTR_CFG_GET_FLD(attr, cycacc)) {
>  		config->cfg |= TRCCONFIGR_CCI;
>  		/* TRM: Must program this for cycacc to work */
> -		cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
> +		cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
>  		if (!cc_threshold)
>  			cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
>  		if (cc_threshold < drvdata->ccitmin)
>  			cc_threshold = drvdata->ccitmin;
>  		config->ccctlr = cc_threshold;
>  	}
> -	if (attr->config & BIT(ETM_OPT_TS)) {
> +	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
>  		/*
>  		 * Configure timestamps to be emitted at regular intervals in
>  		 * order to correlate instructions executed on different CPUs
> @@ -819,17 +820,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  	}
>  
>  	/* Only trace contextID when runs in root PID namespace */
> -	if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
> +	if (ATTR_CFG_GET_FLD(attr, contextid1) &&
>  	    task_is_in_init_pid_ns(current))
>  		/* bit[6], Context ID tracing bit */
>  		config->cfg |= TRCCONFIGR_CID;
>  
>  	/*
> -	 * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
> -	 * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
> -	 * kernel is not running in EL2.
> +	 * If set bit contextid2 in perf config, this asks to trace VMID for
> +	 * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
> +	 * is not running in EL2.
>  	 */
> -	if (attr->config & BIT(ETM_OPT_CTXTID2)) {
> +	if (ATTR_CFG_GET_FLD(attr, contextid2)) {
>  		if (!is_kernel_in_hyp_mode()) {
>  			ret = -EINVAL;
>  			goto out;
> @@ -840,26 +841,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  	}
>  
>  	/* return stack - enable if selected and supported */
> -	if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
> +	if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
>  		/* bit[12], Return stack enable bit */
>  		config->cfg |= TRCCONFIGR_RS;
>  
>  	/*
> -	 * Set any selected configuration and preset.
> -	 *
> -	 * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
> -	 * in the perf attributes defined in coresight-etm-perf.c.
> -	 * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
> -	 * A zero configid means no configuration active, preset = 0 means no preset selected.
> +	 * Set any selected configuration and preset. A zero configid means no
> +	 * configuration active, preset = 0 means no preset selected.
>  	 */
> -	if (attr->config2 & GENMASK_ULL(63, 32)) {
> -		cfg_hash = (u32)(attr->config2 >> 32);
> -		preset = attr->config & 0xF;
> +	if (ATTR_CFG_GET_FLD(attr, configid)) {
> +		cfg_hash = ATTR_CFG_GET_FLD(attr, configid);

Nitpick:


    cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
    if (cfg_hash) {

Then we can avoid a redundant ATTR_CFG_GET_FLD().

Otherwise:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> +		preset = ATTR_CFG_GET_FLD(attr, preset);
>  		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>  	}
>  
>  	/* branch broadcast - enable if selected and supported */
> -	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
> +	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>  		if (!drvdata->trcbb) {
>  			/*
>  			 * Missing BB support could cause silent decode errors
> @@ -868,7 +865,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			ret = -EINVAL;
>  			goto out;
>  		} else {
> -			config->cfg |= BIT(ETM4_CFG_BIT_BB);
> +			config->cfg |= TRCCONFIGR_BB;
>  		}
>  	}
>  
> @@ -1104,11 +1101,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>  		return -EINVAL;
>  
>  	etm4_disable_hw(drvdata);
> -	/*
> -	 * The config_id occupies bits 63:32 of the config2 perf event attr
> -	 * field. If this is non-zero then we will have enabled a config.
> -	 */
> -	if (attr->config2 & GENMASK_ULL(63, 32))
> +	/* If configid is non-zero then we will have enabled a config. */
> +	if (ATTR_CFG_GET_FLD(attr, configid))
>  		cscfg_csdev_disable_active_config(csdev);
>  
>  	/*
> 
> -- 
> 2.34.1
> 

