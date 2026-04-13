Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9116AEBFD07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n13aWmfABqf0ACII0iuopiaMba90EnQgEx9gPb2M6+8=; b=CHkG2dEJWuLXEFSTevTDl+zSxC
	6MdH4uV3LIFTPmimkINaCU9h7ruylp6FhnRon+OaFaOfnm+AhG8h425EfHfFmjVt0RqXQg15rVZy7
	KY2+DoZK2rErOZXs54GkfZWoAowxhO2syixVAdXpFjvrOgEhnX0tY3WwxNpU8E4YG6uVn41ptf/fl
	UsZu/crOpI6zSXAnUS4AIecjml5pozbwE2bqD5MCcFsCXINNg1BmRZ81l+2vCxzYO1/06U+nmQ4nA
	zdKlPVhKIAZJzRoilCTf1Sf34Sny9K/xNyKXYlCGS6df8Poqdrb1ADW5mrpVf/4xUNi5PGZDA3aH8
	gDxy7Lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBNP-0000000F6x4-2dlt;
	Mon, 13 Apr 2026 07:06:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBNM-0000000F6wj-3NW4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:06:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5EED1AC1;
	Mon, 13 Apr 2026 00:06:21 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0BE93F7B4;
	Mon, 13 Apr 2026 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776063987; bh=XGNHcX6f/sKfYlVXwKVDYEqv5Gvlox8Z8P3NxNleDqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALFrlBKIQfth2qMQfsvBMI93jAOfAkWn9Az6L3P4RLWEqVoK/QOzHJMXhwmTB+6TQ
	 KcAEBXlEthZR/ZVhapKfEdOiitJOATpUeQQq8G5YTiS1DLcX752NOATQI06RZArgh1
	 roi8QP91uKfo7IT5SdMccVCkGYyZjenqTRr4+NRg=
Date: Mon, 13 Apr 2026 08:06:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v3 3/5] coresight: etm4x: fix inconsistencies with sysfs
 configration
Message-ID: <adyV78oSCU2t6puT@e129823.arm.com>
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
 <20260412175506.412301-4-yeoreum.yun@arm.com>
 <ea457326-f81c-47ce-abf8-a66bf13f19cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea457326-f81c-47ce-abf8-a66bf13f19cc@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_000629_111740_2A05A4E8 
X-CRM114-Status: GOOD (  33.88  )
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

Hi Jie,

> Hi Yeoreum,
>
> On 4/13/2026 1:55 AM, Yeoreum Yun wrote:
> > The current ETM4x configuration via sysfs can lead to the following
> > inconsistencies:
> >
> >    - If a configuration is modified via sysfs while a perf session is
> >      active, the running configuration may differ between before
> >      a sched-out and after a subsequent sched-in.
> >
> >    - If a perf session and sysfs session tries to enable concurrently,
> >      configuration from configfs could be corrupted.
> >
> >    - There is chance to corrupt drvdata->config if perf session tries
> >      to enabled among handling cscfg_csdev_disable_active_config()
> >      in etm4_disable_sysfs().
> >
> > To resolve these inconsistencies, the configuration should be separated into:
> >
> >    - active_config, which is applied configuration for the current session
> >    - config, which stores the settings configured via sysfs.
> >
> > and apply configuration from configfs after taking a mode.
>
> typo in subject:
> s/configration/configuration

Thanks.

>
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-cfg.c |  2 +-
> >   .../coresight/coresight-etm4x-core.c          | 74 ++++++++++++-------
> >   drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
> >   3 files changed, 49 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index d14d7c8a23e5..0553771d04e7 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> >   				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
> >   {
> >   	int err = -EINVAL, idx;
> > -	struct etmv4_config *drvcfg = &drvdata->config;
> > +	struct etmv4_config *drvcfg = &drvdata->active_config;
> >   	u32 off_mask;
>
> <...>
>
> >   	struct device *etm_dev = &csdev->dev;
> >   	struct csdev_access *csa = &csdev->access;
> > @@ -616,19 +621,36 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >   static void etm4_enable_sysfs_smp_call(void *info)
> >   {
> >   	struct etm4_enable_arg *arg = info;
> > +	struct etmv4_drvdata *drvdata;
> >   	struct coresight_device *csdev;
> >   	if (WARN_ON(!arg))
> >   		return;
> > -	csdev = arg->drvdata->csdev;
> > +	drvdata = arg->drvdata;
> > +	csdev = drvdata->csdev;
> >   	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> >   		/* Someone is already using the tracer */
> >   		arg->rc = -EBUSY;
> >   		return;
> >   	}
> > -	arg->rc = etm4_enable_hw(arg->drvdata);
> > +	drvdata->active_config = drvdata->config;
> > +
> > +	if (arg->cfg_hash) {
> > +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> > +							   arg->cfg_hash,
> > +							   arg->preset);
> > +		if (arg->rc)
>
> we need reset the mode once enable failed before return.
> coresight_set_mode(csdev, CS_MODE_DISABLED);

Good catch. also missing some fix more for deadlock.
I'll send again. Thanks!

>
> Thanks,
> Jie
>
> > +			return;
> > +	}
> > +
> > +	drvdata->trcid = arg->trace_id;
> > +
> > +	/* Tracer will never be paused in sysfs mode */
> > +	drvdata->paused = false;
> > +
> > +	arg->rc = etm4_enable_hw(drvdata);
> >   	/* The tracer didn't start */
> >   	if (arg->rc)
> > @@ -670,7 +692,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> >   	int ctridx;
> >   	int rselector;
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >   	/* No point in trying if we don't have at least one counter */
> >   	if (!caps->nr_cntr)
> > @@ -754,7 +776,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >   	int ret = 0;
> >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >   	struct perf_event_attr max_timestamp = {
> >   		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> >   	};
> > @@ -916,24 +938,18 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >   	/* enable any config activated by configfs */
> >   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > -	if (cfg_hash) {
> > -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > -		if (ret)
> > -			return ret;
> > -	}
> >   	raw_spin_lock(&drvdata->spinlock);
> > -	drvdata->trcid = path->trace_id;
> > -
> > -	/* Tracer will never be paused in sysfs mode */
> > -	drvdata->paused = false;
> > -
> >   	/*
> >   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> >   	 * ensures that register writes occur when cpu is powered.
> >   	 */
> >   	arg.drvdata = drvdata;
> > +	arg.cfg_hash = cfg_hash;
> > +	arg.preset = preset;
> > +	arg.trace_id = path->trace_id;
> > +
> >   	ret = smp_call_function_single(drvdata->cpu,
> >   				       etm4_enable_sysfs_smp_call, &arg, 1);
> >   	if (!ret)
> > @@ -1034,7 +1050,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> >   {
> >   	u32 control;
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >   	struct coresight_device *csdev = drvdata->csdev;
> >   	struct csdev_access *csa = &csdev->access;
> >   	int i;
> > @@ -1070,6 +1086,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
> >   	etm4_disable_hw(drvdata);
> > +	cscfg_csdev_disable_active_config(drvdata->csdev);
> > +
> >   	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> >   }
> > @@ -1130,9 +1148,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> >   				 drvdata, 1);
> >   	raw_spin_unlock(&drvdata->spinlock);
> > -
> > -	cscfg_csdev_disable_active_config(csdev);
> > -
> >   	cpus_read_unlock();
> >   	/*
> > @@ -1375,6 +1390,7 @@ static void etm4_init_arch_data(void *info)
> >   	struct etm4_init_arg *init_arg = info;
> >   	struct etmv4_drvdata *drvdata;
> >   	struct etmv4_caps *caps;
> > +	struct etmv4_config *config;
> >   	struct csdev_access *csa;
> >   	struct device *dev = init_arg->dev;
> >   	int i;
> > @@ -1382,6 +1398,7 @@ static void etm4_init_arch_data(void *info)
> >   	drvdata = dev_get_drvdata(init_arg->dev);
> >   	caps = &drvdata->caps;
> >   	csa = init_arg->csa;
> > +	config = &drvdata->active_config;
> >   	/*
> >   	 * If we are unable to detect the access mechanism,
> > @@ -1442,7 +1459,7 @@ static void etm4_init_arch_data(void *info)
> >   	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
> >   	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> > -	drvdata->config.s_ex_level = caps->s_ex_level;
> > +	config->s_ex_level = caps->s_ex_level;
> >   	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
> >   	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
> >   	/*
> > @@ -1687,7 +1704,7 @@ static void etm4_set_default(struct etmv4_config *config)
> >   static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
> >   {
> >   	int nr_comparator, index = 0;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >   	/*
> >   	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
> > @@ -1728,7 +1745,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
> >   {
> >   	int i, comparator, ret = 0;
> >   	u64 address;
> > -	struct etmv4_config *config = &drvdata->config;
> > +	struct etmv4_config *config = &drvdata->active_config;
> >   	struct etm_filters *filters = event->hw.addr_filters;
> >   	if (!filters)
> > @@ -2250,7 +2267,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
> >   	if (!desc.name)
> >   		return -ENOMEM;
> > -	etm4_set_default(&drvdata->config);
> > +	etm4_set_default(&drvdata->active_config);
> > +	drvdata->config = drvdata->active_config;
> >   	pdata = coresight_get_platform_data(dev);
> >   	if (IS_ERR(pdata))
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> > index 3cc1ca76c933..b943c28c9c71 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -1069,6 +1069,7 @@ struct etmv4_save_state {
> >    *		allows tracing at all ELs. We don't want to compute this
> >    *		at runtime, due to the additional setting of TRFCR_CX when
> >    *		in EL2. Otherwise, 0.
> > + * @active_config:	structure holding current applied configuration parameters.
> >    * @config:	structure holding configuration parameters.
> >    * @save_state:	State to be preserved across power loss
> >    * @paused:	Indicates if the trace unit is paused.
> > @@ -1089,6 +1090,7 @@ struct etmv4_drvdata {
> >   	bool				os_unlock : 1;
> >   	bool				paused : 1;
> >   	u64				trfcr;
> > +	struct etmv4_config		active_config;
> >   	struct etmv4_config		config;
> >   	struct etmv4_save_state		*save_state;
> >   	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>

--
Sincerely,
Yeoreum Yun

