Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF0FEEF50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FmR99LZ8Tn4vCrHVpXr+y5OXEgFcl4dQEEXkDkeVcI=; b=ozrQ+KUit658Z+e4yzWxKDT6+r
	yZrYtVWOt09j8t0l/E4RKyNFTZui3wS+Qshr+aJDrO4Zi2FWObYMx+e3dp4fEtAISn6vMOVj4Nfs6
	frLaZoUhctzqkMR2blF7NK+EiA9wSdgZLLKbenfcXqlQ5iaK1mCNukODIhTPYCHYiur6m+U4vd6M7
	yzKHbnU54IZxMbVN3aHZZFc2NfNrj1YtY7nF489BAaNDZvLbUlRQBu1pElhWUyHifFnFTnTKRLhJ0
	QUOQUFPHWTISqY43ErxGJ/EY104+8tcYugxXqmH+uTS/TarERUjOzWOvg/l736ytH6UeYT4cvwijC
	YoKFZFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Rs-00000006bvv-29Qi;
	Tue, 07 Apr 2026 14:30:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Rn-00000006bte-32gd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:30:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8AEE16A3;
	Tue,  7 Apr 2026 07:30:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ABD73FC07;
	Tue,  7 Apr 2026 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775572230; bh=dXmMNv331vsD1/TZhQeflRhnIasUgjGg+y87Al+96Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaKY3T8Iy3J39TtZ1JUYhfUZszVo4hWP+BmoJSwAK3supPXAjFbTFBemQne1mlLgi
	 YrLYvtt3nm6RJKtb4Tw3iwim+PEcKHSQJNTsbD7/WvcPIpa5TjkDmDWvw2zXaXPITb
	 bwt9sbA6NyifrMcx6pz1uX9nQ+ZjOzpen4WaafHM=
Date: Tue, 7 Apr 2026 15:30:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 1/2] coresight: etm4x: fix inconsistencies with sysfs
 configration
Message-ID: <20260407143028.GM356832@e132581.arm.com>
References: <20260317181705.2456271-1-yeoreum.yun@arm.com>
 <20260317181705.2456271-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317181705.2456271-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_073031_938418_843927B0 
X-CRM114-Status: GOOD (  25.66  )
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

On Tue, Mar 17, 2026 at 06:17:04PM +0000, Yeoreum Yun wrote:
> The current ETM4x configuration via sysfs can lead to the following
> inconsistencies:
> 
>   - If a configuration is modified via sysfs while a perf session is
>     active, the running configuration may differ between before
>     a sched-out and after a subsequent sched-in.
> 
>   - Once a perf session is enabled, some read-only register fields
>     (e.g., TRCSSCSR<n>) may not be reported correctly,
>     because drvdata->config is cleared while enabling with perf mode,
>     even though the information was previously read via etm4_init_arch_data().
> 
> To resolve these inconsistencies, the configuration should be separated into:
> 
>   - active_config, which represents the currently applied configuration
>   - config, which stores the settings configured via sysfs.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm4x-cfg.c |  2 +-
>  .../coresight/coresight-etm4x-core.c          | 45 +++++++++++--------
>  drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
>  3 files changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index c302072b293a..84213d40d1ae 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>  				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
>  {
>  	int err = -EINVAL, idx;
> -	struct etmv4_config *drvcfg = &drvdata->config;
> +	struct etmv4_config *drvcfg = &drvdata->active_config;

I'd suggest we leave out complex cfg things, we can refactor it
later.

In this series, let us first separate active_config and config, and
keep using drvdata->config to save complex cfg ?

>  	u32 off_mask;
>  
>  	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042..c552129c4a0c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -88,9 +88,11 @@ static int etm4_probe_cpu(unsigned int cpu);
>   */
>  static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>  {
> +	struct etmv4_config *config = &drvdata->active_config;
> +
>  	return (n < drvdata->nr_ss_cmp) &&
>  	       drvdata->nr_pe &&
> -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> +	       (config->ss_status[n] & TRCSSCSRn_PC);

As Suzuki suggested in another reply, we need to extract capabilities
into a separate structure.  I'd also extract status related registers
into a new structure:

  struct etm4_cap {
      int nr_ss_cmp;
      bool pe_comparator;    // TRCSSCSRn.PC
      bool dv_comparator;    // TRCSSCSRn.DV
      bool da_comparator;    // TRCSSCSRn.DA
      bool inst_comparator;  // TRCSSCSRn.INST

      int ns_ex_level;
      int nr_pe;
      int nr_pe_cmp;
      int nr_resource;
      ...
  }

  struct etm4_status_reg {
      u32 ss_status[ETM_MAX_SS_CMP];
      u32 cntr_val[ETMv4_MAX_CNTR];
  }

[...]

> @@ -911,14 +915,17 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  
>  	/* enable any config activated by configfs */
>  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> +
> +	raw_spin_lock(&drvdata->spinlock);
> +
> +	drvdata->active_config = drvdata->config;

This is not an issue introduced by this patch, but we might need to
consider to copy active config until it has acquired SYSFS mode.
Otherwise, it might update config here but will disturb a perf session
has been running.

> @@ -2246,7 +2254,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>  	if (!desc.name)
>  		return -ENOMEM;
>  
> -	etm4_set_default(&drvdata->config);
> +	etm4_set_default(&drvdata->active_config);

Should we set default values to drvdata->config ?

My understanding is drvdata->active_config would be always set at the
runtime, but "drvdata->config" should be initialized properly so it
can be consumed by sysfs knobs.

Thanks,
Leo

