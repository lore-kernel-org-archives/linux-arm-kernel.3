Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C14F89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYcwq9XtUCkeGg/9kY+8GcsqZ3uv9Mz7OwdQUgNaoLM=; b=3HOfkesFNqyF1kF/4JNUZdUfbw
	eNndQyPMQYFsYUj4cJjcaHrgWACbQbSGDImh+HdxLK88V8Bk8NbwpXPcMESOdiiThGm0fTgX/S3GR
	kNrFOoY8z5NG5Na02VkSFUAQzh78zHddmtMABo1RVnTx1xQMVYEOEoiXfHaRLDX+MVuAH6pADMJKR
	++IXerLqjhNKsKhfbJ7bLLbrUn8Le1BhXOwJ7rVq2OWqaZvHUUDXtilWee2vPwVy9uM6ONEsMbesp
	+kXM6s0idvsQZLIuIiBq0A2hP5DXyBrs+HHUJxSWgmZPgQ7LzfPswKZlBfJUm/8hkKSzVMts7sTqo
	EiYPUcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8cK-00000008Spk-03jP;
	Tue, 21 Apr 2026 10:46:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8cG-00000008SpP-3lbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:46:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC2D25E0;
	Tue, 21 Apr 2026 03:45:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 447CE3FE8F;
	Tue, 21 Apr 2026 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776768363; bh=QhXkQZOHiYA5eptsazKYG8SLrjSlnq+YelLqIRiAyTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtYTqP27NkWb2NTVN5marbwf/KXkiwfThYLmh15gsMJUwZuk9/ZgZjw/qb8RXVxpq
	 cXDp/9hKYYHuDH9wl8V2CAcFuSCivNbcMaxTi6nrRuMqSDvExpIXHDkZmiuIi9pDEw
	 zgzjHo1FBu6zhy74WCSalA60EgWerDrdPzlkL/9U=
Date: Tue, 21 Apr 2026 11:46:01 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 07/12] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260421104601.GB929984@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415165528.3369607-8-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_034605_088533_D7AA1B31 
X-CRM114-Status: GOOD (  36.04  )
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

On Wed, Apr 15, 2026 at 05:55:23PM +0100, Yeoreum Yun wrote:
> The current ETM4x configuration via sysfs can lead to
> several inconsistencies:
> 
>   - If the configuration is modified via sysfs while a perf session is
>     active, the running configuration may differ before a sched-out and
>     after a subsequent sched-in.
> 
>   - If a perf session and a sysfs session enable tracing concurrently,
>     the configuration from configfs may become corrupted.

I think this happens because the sysfs path calls
cscfg_csdev_enable_active_config() without first acquiring the mode,
allowing a perf session to acquire the mode and call the same function
concurrently.

>   - There is a risk of corrupting drvdata->config if a perf session enables
>     tracing while cscfg_csdev_disable_active_config() is being handled in
>     etm4_disable_sysfs().

Similiar to above, cscfg_csdev_disable_active_config() is not
protected in etm4_disable_sysfs().

> To resolve these issues, separate the configuration into:
> 
>   - active_config: the configuration applied to the current session
>   - config: the configuration set via sysfs
> 
> Additionally:
> 
>   - Apply the configuration from configfs after taking the appropriate mode.
> 
>   - Since active_config and related fields are accessed only by the local CPU
>     in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
>     remove the lock/unlock from the sysfs enable/disable path and
>     startup/dying_cpu except when to access config fields.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm4x-cfg.c |   2 +-
>  .../coresight/coresight-etm4x-core.c          | 107 ++++++++++--------
>  drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
>  3 files changed, 63 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index d14d7c8a23e5..0553771d04e7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>  				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
>  {
>  	int err = -EINVAL, idx;
> -	struct etmv4_config *drvcfg = &drvdata->config;
> +	struct etmv4_config *drvcfg = &drvdata->active_config;
>  	u32 off_mask;
>  
>  	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index b199aebbdb60..15aaf4a898e1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -245,6 +245,10 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>  
>  struct etm4_enable_arg {
>  	struct etmv4_drvdata *drvdata;
> +	unsigned long cfg_hash;
> +	int preset;

Since smp call cannot directly call cscfg_config_sysfs_get_active_cfg()
due to it runs in atomic context but ...active_cfg() tries to acquire
mutex. So we firstly retrieve pass 'cfg_hash' and 'preset' in sleepable
context and deliver them to the SMP call.

After coresight cfg refactoring, we should remove cfg_hash/preset from
ETM driver, the ETM driver only needs to retrieve register list and can
do this in smp call.

Before we finish cfg refactoring, it is fine for me to add these two
parameters into etm4_enable_arg.

> +	u8 trace_id;

Can we add 'path' instead ? The SMP call can retrieve path->trace_id.
This can benefit for future clean up (e.g., we can store config into
path so we can retrieve config from path pointer), and this allows us
for further refactoring to unify etm4_enable_sysfs_smp_call() and
etm4_enable_perf().

> +	struct etmv4_config config;

We don't need this. We can defer to get drvdata->config in SMP call.

>  	int rc;
>  };

[...]

> @@ -918,40 +946,29 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  
>  	/* enable any config activated by configfs */
>  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> -	if (cfg_hash) {
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret) {
> -			etm4_release_trace_id(drvdata);
> -			return ret;
> -		}
> -	}
> -
> -	raw_spin_lock(&drvdata->spinlock);
> -
> -	drvdata->trcid = path->trace_id;
> -
> -	/* Tracer will never be paused in sysfs mode */
> -	drvdata->paused = false;
>  
>  	/*
>  	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>  	 * ensures that register writes occur when cpu is powered.
>  	 */
>  	arg.drvdata = drvdata;
> +	arg.cfg_hash = cfg_hash;
> +	arg.preset = preset;
> +	arg.trace_id = path->trace_id;
> +
> +	raw_spin_lock(&drvdata->spinlock);
> +	arg.config = drvdata->config;
> +	raw_spin_unlock(&drvdata->spinlock);

Can we defer this in smp call ?  And we can consolidate a bit
configurations, we can consider to use a separate patch for this.

  etm4x_apply_config(drvdata, event, hash, preset)
  {
      /* perf mode */
      if (event) {
          etm4_parse_event_config(drvdata->csdev, event);
      } else if (mode == CS_MODE_PERF) {
          scoped_guard(raw_spinlock, &drvdata->spinlock)
              &drvdata->active_config = drvdata->config;
      }

      /* At the end, we always apply the config */
      cscfg_csdev_enable_active_config(drvdata->csdev, hash, preset);
  }


> +
>  	ret = smp_call_function_single(drvdata->cpu,
>  				       etm4_enable_sysfs_smp_call, &arg, 1);
>  	if (!ret)
>  		ret = arg.rc;
>  	if (!ret)
> -		drvdata->sticky_enable = true;
> -
> -	if (ret)
> +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> +	else
>  		etm4_release_trace_id(drvdata);
>  
> -	raw_spin_unlock(&drvdata->spinlock);
> -
> -	if (!ret)
> -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
>  	return ret;
>  }
>  
> @@ -1038,7 +1055,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>  {
>  	u32 control;
>  	const struct etmv4_caps *caps = &drvdata->caps;
> -	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_config *config = &drvdata->active_config;
>  	struct coresight_device *csdev = drvdata->csdev;
>  	struct csdev_access *csa = &csdev->access;
>  	int i;
> @@ -1074,6 +1091,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
>  
>  	etm4_disable_hw(drvdata);
>  
> +	cscfg_csdev_disable_active_config(drvdata->csdev);
> +
>  	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
>  }
>  
> @@ -1124,7 +1143,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>  	 * DYING hotplug callback is serviced by the ETM driver.
>  	 */
>  	cpus_read_lock();
> -	raw_spin_lock(&drvdata->spinlock);
>  
>  	/*
>  	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
> @@ -1133,10 +1151,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>  	smp_call_function_single(drvdata->cpu, etm4_disable_sysfs_smp_call,
>  				 drvdata, 1);
>  
> -	raw_spin_unlock(&drvdata->spinlock);
> -
> -	cscfg_csdev_disable_active_config(csdev);
> -
>  	cpus_read_unlock();
>  
>  	/*
> @@ -1379,6 +1393,7 @@ static void etm4_init_arch_data(void *info)
>  	struct etm4_init_arg *init_arg = info;
>  	struct etmv4_drvdata *drvdata;
>  	struct etmv4_caps *caps;
> +	struct etmv4_config *config;
>  	struct csdev_access *csa;
>  	struct device *dev = init_arg->dev;
>  	int i;
> @@ -1386,6 +1401,7 @@ static void etm4_init_arch_data(void *info)
>  	drvdata = dev_get_drvdata(init_arg->dev);
>  	caps = &drvdata->caps;
>  	csa = init_arg->csa;
> +	config = &drvdata->active_config;

Should we init drvdata->config instead so make it has sane values ?

In other words, drvdata->active_config are always set at the runtime,
so don't need to init it at all, right?

Thanks,
Leo

