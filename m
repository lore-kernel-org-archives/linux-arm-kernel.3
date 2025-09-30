Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9409CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWru2SA+uoIfyEZ7IrrzgeBX/4qRUPduw4yCrBJ2+Hs=; b=h4RYN2zKESLLyQhYMRC2jH6vrj
	RMnt79wQ3hVVSfx6uGmG0kNPDPa9/YdyE73g5jEO3qwC+qU3bFVK3DCrYZnR2JmPauqYh3fEkrPwv
	+JJ6tomn2WrIPr5Bv88fx4H6J00+ay6ZMYLc6j9T0caGBQpZu6aFqnId+eMigXbez1l6VNEhiC87e
	VbhPCRlKj9zz0/NJg+OhhZYYYAjRbXmnolzmhg2X/qHc8FzYwnd2H5hwn9Nud0UW+jp4JTp3DiW/R
	5DqVKFFsPYyNp9TySBoZZPflbX4Xrai77QZ6rZrWbjoM9xhIeZ2JhEHQ0KoEyUqTXsuUyQc4dofHC
	JRMSfERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3c3b-00000005d3z-15NS;
	Tue, 30 Sep 2025 15:14:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3c3Y-00000005d3a-2fT6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 15:14:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BAFA1424;
	Tue, 30 Sep 2025 08:14:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D65A3F59E;
	Tue, 30 Sep 2025 08:14:15 -0700 (PDT)
Date: Tue, 30 Sep 2025 16:14:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
Message-ID: <20250930151414.GK7985@e132581.arm.com>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_081420_755411_701461CC 
X-CRM114-Status: GOOD (  24.58  )
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

On Thu, Aug 14, 2025 at 11:49:56AM +0100, James Clark wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -25,6 +25,11 @@
>  #include "coresight-syscfg.h"
>  #include "coresight-trace-id.h"
>  
> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> +#include <linux/perf/arm_pmu.h>
> +#include "coresight-etm4x.h"
> +#endif
> +
>  static struct pmu etm_pmu;
>  static bool etm_perf_up;
>  
> @@ -69,7 +74,10 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
>  /* config ID - set if a system configuration is selected */
>  PMU_FORMAT_ATTR(configid,	"config2:32-63");
>  PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
> -
> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> +/* Interval = (2 ^ ts_level) */
> +GEN_PMU_FORMAT_ATTR(ts_level);
> +#endif
>  
>  /*
>   * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
> @@ -103,6 +111,9 @@ static struct attribute *etm_config_formats_attr[] = {
>  	&format_attr_configid.attr,
>  	&format_attr_branch_broadcast.attr,
>  	&format_attr_cc_threshold.attr,
> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> +	&format_attr_ts_level.attr,
> +#endif

By using .visible() callback for attrs, we can improve a bit code
without spreading "#ifdef IS_ENABLED()" in this file. E.g.,

   static umode_t format_attr_is_visible(struct kobject *kobj,
                                   struct attribute *attr, int n)
   {
        struct device *dev = kobj_to_dev(kobj);

        if (attr == &format_attr_ts_level.attr &&
	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
                return 0;

        return attr->mode;
   }

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

>  	NULL,
>  };
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 1a2d02bdcb88..42277c201d4f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/amba/bus.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/perf_event.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -615,7 +616,7 @@ static void etm4_enable_hw_smp_call(void *info)
>   *  +--------------+
>   *         |
>   *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
>   *  +--------------+
>   *         |
>   *  +------v--------------+
> @@ -626,11 +627,17 @@ static void etm4_enable_hw_smp_call(void *info)
>   *  | Timestamp Generator  |  (timestamp on resource y)
>   *  +----------------------+
>   */
> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> +				       struct perf_event_attr *attr)
>  {
>  	int ctridx;
>  	int rselector;
>  	struct etmv4_config *config = &drvdata->config;
> +	u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
> +
> +	/* Disable when ts_level == MAX */
> +	if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
> +		return 0;
>  
>  	/* No point in trying if we don't have at least one counter */
>  	if (!drvdata->nr_cntr)
> @@ -666,12 +673,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>  		return -ENOSPC;
>  	}
>  
> -	/*
> -	 * Initialise original and reload counter value to the smallest
> -	 * possible value in order to get as much precision as we can.
> -	 */
> -	config->cntr_val[ctridx] = 1;
> -	config->cntrldvr[ctridx] = 1;
> +	/* Initialise original and reload counter value. */
> +	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>  
>  	/*
>  	 * Trace Counter Control Register TRCCNTCTLRn
> @@ -761,7 +764,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		 * order to correlate instructions executed on different CPUs
>  		 * (CPU-wide trace scenarios).
>  		 */
> -		ret = etm4_config_timestamp_event(drvdata);
> +		ret = etm4_config_timestamp_event(drvdata, attr);
>  
>  		/*
>  		 * No need to go further if timestamp intervals can't
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index aaa6633b2d67..54558de158fa 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -598,6 +598,12 @@
>  #define ETM_CNTR_MAX_VAL		0xFFFF
>  #define ETM_TRACEID_MASK		0x3f
>  
> +#define ATTR_CFG_FLD_ts_level_CFG	config3
> +#define ATTR_CFG_FLD_ts_level_LO	12
> +#define ATTR_CFG_FLD_ts_level_HI	15
> +#define ATTR_CFG_FLD_ts_level_MASK	GENMASK(ATTR_CFG_FLD_ts_level_HI, \
> +						ATTR_CFG_FLD_ts_level_LO)
> +
>  /* ETMv4 programming modes */
>  #define ETM_MODE_EXCLUDE		BIT(0)
>  #define ETM_MODE_LOAD			BIT(1)
> 
> -- 
> 2.34.1
> 

