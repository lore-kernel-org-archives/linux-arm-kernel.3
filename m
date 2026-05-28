Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E435CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFJ/ywYor2WZCvHkqATZq9QUDDlj9d/3ElvsUofMQxU=; b=Hfw3iWtala/P4iaQD4Qljill8y
	aU9d5nvNnlEEO3bi94V6P5u+qTRJWeFY0xNshDdMvWmUm2id+Xml01X+AAYWjudkRsz1+Oj1qQPKH
	LxXdpD5+YTB39G+RsgWJyv17OqxCixeR8gjL76i7GAQBlA7MaICXaXogP9Ga6bW6zWEItKrg8XP0l
	U/XrxEhefjJeXQAYX0BJ3nya4Za55Y2mH+f9dJJdgY5diyBoULhpK7hAwI+3mD0DmIN88ULwG3BzG
	Fwn45Ns7gvLlC3D8GE1kV+7ZffkvqfjGyw1BrLR8p5YrCom0QUN9MQhKrnvR9SXCwrBQAAuSvgikM
	O4qdK94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbhR-00000005qbz-0w3k;
	Thu, 28 May 2026 14:27:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbhO-00000005qbU-27p0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:27:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDCF044A7;
	Thu, 28 May 2026 07:26:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B77A43F905;
	Thu, 28 May 2026 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779978420; bh=s6F2Efxk2WV9Dt67rZc51h8FcFWKXsHu+eFkbXrErJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAY5l++byfOwPF2u3LBdI3Vpw6JqqF+VELGxkF674kpeuPxiUrIAbUNXip44z7JIW
	 He0cqJKpU96XY6tTQeLAvDb51AZtfHxigE3YMQBu/k6XqOtLAEjzWrI7WxgLiq7v97
	 Zht9Muub4O6+O2aNnpmHN8c87ARJhH2iB1p6lFQ4=
Date: Thu, 28 May 2026 15:26:57 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <ahhQsTNok65e6K0F@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-9-yeoreum.yun@arm.com>
 <20260528140943.GE101133@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528140943.GE101133@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_072702_630383_3686ED0F 
X-CRM114-Status: GOOD (  39.80  )
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

Hi Leo,

> On Tue, May 19, 2026 at 04:48:07PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> >  				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
> >  {
> >  	int err = -EINVAL, idx;
> > -	struct etmv4_config *drvcfg = &drvdata->config;
> > +	struct etmv4_config *drvcfg = &drvdata->active_config;
> 
> Wouldn't it make more sense to keep using drvdata->config for cfgfs?
> This would avoid cfgfs updating the active configuration while a session
> is enabled.
>
> My understanding is after refactoring cfgfs, we will never expose
> active_config or config anymore so this should not an issue. Before
> that, maybe we just keep to use config so can avoid mess.

I don't think so. since the cfgfs's config is updated right before
enable and in this patchset, It's applied after "take the mode".

If we do it into drvdta->config, then contention would be increased
with the access of sysfs and that nullifies almost this patch purpose
and because of we use "one config" this makes a corruption with perf
and sysfs.

Therefore, It might be right to remain this as it is.
and let's remove it at the time of refactorying.

> 
> >  	u32 off_mask;
> >  
> >  	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 9b477b36b432..f0a9f2ef4b27 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -243,6 +243,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
> >  struct etm4_enable_arg {
> >  	struct etmv4_drvdata *drvdata;
> >  	struct coresight_path *path;
> > +	struct etmv4_config config;
> >  	int rc;
> >  };
> >  
> > @@ -268,10 +269,11 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
> >  static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
> >  {
> >  	u64 trfcr = drvdata->trfcr;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >  
> > -	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
> > +	if (config->mode & ETM_MODE_EXCL_KERN)
> >  		trfcr &= ~TRFCR_EL1_ExTRE;
> > -	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
> > +	if (config->mode & ETM_MODE_EXCL_USER)
> >  		trfcr &= ~TRFCR_EL1_E0TRE;
> >  
> >  	return trfcr;
> > @@ -279,7 +281,7 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
> >  
> >  /*
> >   * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
> > - * as configured by the drvdata->config.mode for the current
> > + * as configured by the drvdata->active_config.mode for the current
> >   * session. Even though we have TRCVICTLR bits to filter the
> >   * trace in the ELs, it doesn't prevent the ETM from generating
> >   * a packet (e.g, TraceInfo) that might contain the addresses from
> > @@ -290,12 +292,13 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
> >  static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
> >  {
> >  	u64 trfcr, guest_trfcr;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >  
> >  	/* If the CPU doesn't support FEAT_TRF, nothing to do */
> >  	if (!drvdata->trfcr)
> >  		return;
> >  
> > -	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
> > +	if (config->mode & ETM_MODE_EXCL_HOST)
> >  		trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
> >  	else
> >  		trfcr = etm4x_get_kern_user_filter(drvdata);
> > @@ -303,7 +306,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
> >  	write_trfcr(trfcr);
> >  
> >  	/* Set filters for guests and pass to KVM */
> > -	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
> > +	if (config->mode & ETM_MODE_EXCL_GUEST)
> >  		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
> >  	else
> >  		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
> > @@ -497,7 +500,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >  {
> >  	int i, rc;
> >  	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >  	struct coresight_device *csdev = drvdata->csdev;
> >  	struct device *etm_dev = &csdev->dev;
> >  	struct csdev_access *csa = &csdev->access;
> > @@ -618,27 +621,53 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >  static void etm4_enable_sysfs_smp_call(void *info)
> >  {
> >  	struct etm4_enable_arg *arg = info;
> > +	struct etmv4_drvdata *drvdata;
> >  	struct coresight_device *csdev;
> > +	unsigned long cfg_hash;
> > +	int preset;
> >  
> >  	if (WARN_ON(!arg))
> >  		return;
> >  
> > -	csdev = arg->drvdata->csdev;
> > +	drvdata = arg->drvdata;
> > +	csdev = drvdata->csdev;
> >  	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> >  		/* Someone is already using the tracer */
> >  		arg->rc = -EBUSY;
> >  		return;
> >  	}
> >  
> > -	arg->rc = etm4_enable_hw(arg->drvdata);
> > +	/* enable any config activated by configfs */
> > +	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> >  
> > -	/* The tracer didn't start */
> > +	drvdata->active_config = arg->config;
> 
> Can move this down to just before drvdata->trcid assignment so cscfg
> operations can be put together?

No. Copy the arg->config must be before cscfg_csdev_enable_active_config().
If that's after, it overrides the "preset" and this is different from
the former behavior.

> 
> > +
> > +	if (cfg_hash) {
> > +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> > +							   cfg_hash,
> > +							   preset);
> > +		if (arg->rc)
> > +			goto err;
> > +	}
> > +
> > +	drvdata->trcid = arg->path->trace_id;
> > +
> > +	/* Tracer will never be paused in sysfs mode */
> > +	drvdata->paused = false;
> > +
> > +	arg->rc = etm4_enable_hw(drvdata);
> >  	if (arg->rc) {
> > -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> > -		return;
> > +		cscfg_csdev_disable_active_config(csdev);
> > +		goto err;
> 
> Add a new goto tag (like err_enable_hw) for the disable_active_config
> rollback?

This is only place where cscfg_csdev_disable_active_config().
Why do we need to goto for cleanup where there is no duplication?

> 
> >  	}
> >  
> > +	drvdata->sticky_enable = true;
> >  	csdev->path = arg->path;
> > +
> > +	return;
> > +err:
> > +	/* The tracer didn't start */
> > +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> >  }
> >  
> >  /*
> > @@ -676,7 +705,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> >  	int ctridx;
> >  	int rselector;
> >  	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >  
> >  	/* No point in trying if we don't have at least one counter */
> >  	if (!caps->nr_cntr)
> > @@ -760,7 +789,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >  	int ret = 0;
> >  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >  	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >  	struct perf_event_attr max_timestamp = {
> >  		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> >  	};
> > @@ -922,25 +951,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >  {
> >  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >  	struct etm4_enable_arg arg = { };
> > -	unsigned long cfg_hash;
> > -	int ret, preset;
> > -
> > -	/* enable any config activated by configfs */
> > -	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > -	if (cfg_hash) {
> > -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > -		if (ret) {
> > -			etm4_release_trace_id(drvdata);
> > -			return ret;
> > -		}
> > -	}
> > -
> > -	raw_spin_lock(&drvdata->spinlock);
> > -
> > -	drvdata->trcid = path->trace_id;
> > -
> > -	/* Tracer will never be paused in sysfs mode */
> > -	drvdata->paused = false;
> > +	int ret;
> >  
> >  	/*
> >  	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> > @@ -948,20 +959,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >  	 */
> >  	arg.drvdata = drvdata;
> >  	arg.path = path;
> > +
> > +	raw_spin_lock(&drvdata->spinlock);
> > +	arg.config = drvdata->config;
> > +	raw_spin_unlock(&drvdata->spinlock);
> > +
> >  	ret = smp_call_function_single(drvdata->cpu,
> >  				       etm4_enable_sysfs_smp_call, &arg, 1);
> >  	if (!ret)
> >  		ret = arg.rc;
> >  	if (!ret)
> > -		drvdata->sticky_enable = true;
> > -
> > -	if (ret)
> > +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> > +	else
> >  		etm4_release_trace_id(drvdata);
> >  
> > -	raw_spin_unlock(&drvdata->spinlock);
> > -
> > -	if (!ret)
> > -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> >  	return ret;
> >  }
> >  
> > @@ -1048,7 +1059,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> >  {
> >  	u32 control;
> >  	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >  	struct coresight_device *csdev = drvdata->csdev;
> >  	struct csdev_access *csa = &csdev->access;
> >  	int i;
> > @@ -1091,6 +1102,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
> >  	etm4_disable_hw(drvdata);
> >  
> >  	drvdata->csdev->path = NULL;
> > +	cscfg_csdev_disable_active_config(drvdata->csdev);
> 
> Move cscfg_csdev_disable_active_config() just after etm4_disable_hw() so
> the sequence is consistent with perf mode.

Fair enough. I'll do that.

> 
> [...]
> 
> > @@ -1449,7 +1458,7 @@ static void etm4_init_arch_data(void *info)
> >  
> >  	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
> >  	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> > -	drvdata->config.s_ex_level = caps->s_ex_level;
> > +	config->s_ex_level = caps->s_ex_level;
> 
> config->s_ex_level is redundant and not really a configuration item.
> We should use caps->s_ex_level instead of config->s_ex_level wherever
> it is used.

Agree, but this includes it should change the omse function
declations to pass "caps" argument:
  - etm4_set_comparator_filter()
  - etm4_set_start_stop_filter()

If that's okay, I'll respin with it.

> 
> Thanks,
> Leo

-- 
Sincerely,
Yeoreum Yun

