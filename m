Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DB7FD5F9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5nYMZA7H8DavVxdPkSJlX8p2HnoZtgaey/pS/L3KBQ=; b=YlG9AO2WCgtcEthODAXG4KqOxN
	qy+cRSyFTjMPRvRtUt+QaAZLcz4yWgFBjoMEFs1/YR55OlqhhBK3D9NVi7nHW8JSeto6sKc8m//0M
	hcuyuA2OPqi46X+v0FjvweocSiik7JnU2yjClDjIu8ILw66dDl8gyA0Cmq651fAO4NF9d2XtHo1jL
	JjQKbmBenivGSFDmCOd67lV8lh7aZ/1Vhezq9UkjFFhHGuQnvJzQwkFsniAOarhkHdU1vukAPz7td
	wpV2ommxuF/m5aYSR51ESDRw3N2Cp6aZk4cIFGXeoRQZTce2GwiokEioDGfwBCeYUUr/1+nR0PhTD
	VgQWrw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP2t-00000008aoC-2JIg;
	Wed, 08 Apr 2026 09:17:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP2q-00000008anc-3tAL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:17:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDB4F293B;
	Wed,  8 Apr 2026 02:17:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55DB63F641;
	Wed,  8 Apr 2026 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775639875; bh=qvvlclEr5+IMumWBNAfQzto/zRrwMeMeoVde3/6P+vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ky7RG1TwfRJDtYeTAvPcsIRBA1uKZw3p1Yhx0bnSRpEKvHNrVKCPsW5ECXdQNtlA2
	 3r5CBMrk/PFdq7sKu+CtxmnIaB2Gl+qzEMLnkRG8qDDmbtCNNvknR2hggNT/Y0nAoC
	 rUSpqAbiBs4QtZYTxklvplWhwsVyzhFnBH7I3WeA=
Date: Wed, 8 Apr 2026 10:17:51 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 1/2] coresight: etm4x: fix inconsistencies with sysfs
 configration
Message-ID: <adYdPy8AkMY4YKr2@e129823.arm.com>
References: <20260317181705.2456271-1-yeoreum.yun@arm.com>
 <20260317181705.2456271-2-yeoreum.yun@arm.com>
 <20260407143028.GM356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407143028.GM356832@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021757_052923_791292B1 
X-CRM114-Status: GOOD (  34.90  )
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

> On Tue, Mar 17, 2026 at 06:17:04PM +0000, Yeoreum Yun wrote:
> > The current ETM4x configuration via sysfs can lead to the following
> > inconsistencies:
> >
> >   - If a configuration is modified via sysfs while a perf session is
> >     active, the running configuration may differ between before
> >     a sched-out and after a subsequent sched-in.
> >
> >   - Once a perf session is enabled, some read-only register fields
> >     (e.g., TRCSSCSR<n>) may not be reported correctly,
> >     because drvdata->config is cleared while enabling with perf mode,
> >     even though the information was previously read via etm4_init_arch_data().
> >
> > To resolve these inconsistencies, the configuration should be separated into:
> >
> >   - active_config, which represents the currently applied configuration
> >   - config, which stores the settings configured via sysfs.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  .../hwtracing/coresight/coresight-etm4x-cfg.c |  2 +-
> >  .../coresight/coresight-etm4x-core.c          | 45 +++++++++++--------
> >  drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
> >  3 files changed, 30 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index c302072b293a..84213d40d1ae 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> >  				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
> >  {
> >  	int err = -EINVAL, idx;
> > -	struct etmv4_config *drvcfg = &drvdata->config;
> > +	struct etmv4_config *drvcfg = &drvdata->active_config;
>
> I'd suggest we leave out complex cfg things, we can refactor it
> later.
>
> In this series, let us first separate active_config and config, and
> keep using drvdata->config to save complex cfg ?

Yes. but I think we should include the separation of ss_status in
this patchset.

>
> >  	u32 off_mask;
> >
> >  	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index d565a73f0042..c552129c4a0c 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -88,9 +88,11 @@ static int etm4_probe_cpu(unsigned int cpu);
> >   */
> >  static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
> >  {
> > +	struct etmv4_config *config = &drvdata->active_config;
> > +
> >  	return (n < drvdata->nr_ss_cmp) &&
> >  	       drvdata->nr_pe &&
> > -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> > +	       (config->ss_status[n] & TRCSSCSRn_PC);
>
> As Suzuki suggested in another reply, we need to extract capabilities
> into a separate structure.  I'd also extract status related registers
> into a new structure:
>
>   struct etm4_cap {
>       int nr_ss_cmp;
>       bool pe_comparator;    // TRCSSCSRn.PC
>       bool dv_comparator;    // TRCSSCSRn.DV
>       bool da_comparator;    // TRCSSCSRn.DA
>       bool inst_comparator;  // TRCSSCSRn.INST
>
>       int ns_ex_level;
>       int nr_pe;
>       int nr_pe_cmp;
>       int nr_resource;
>       ...
>   }
>
>   struct etm4_status_reg {
>       u32 ss_status[ETM_MAX_SS_CMP];
>       u32 cntr_val[ETMv4_MAX_CNTR];
>   }

Thanks. I'll take with this as reference.

>
> [...]
>
> > @@ -911,14 +915,17 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >
> >  	/* enable any config activated by configfs */
> >  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > +
> > +	raw_spin_lock(&drvdata->spinlock);
> > +
> > +	drvdata->active_config = drvdata->config;
>
> This is not an issue introduced by this patch, but we might need to
> consider to copy active config until it has acquired SYSFS mode.
> Otherwise, it might update config here but will disturb a perf session
> has been running.

Good catch. I think we should access "active_config" after taking a
mode. That means cscfg_csdev_enable/disable_active_config() should
be called after/before taking mode like PERF session otherwise
active_config could be a race if perf and sysfs session are enabled parallely.

>
> > @@ -2246,7 +2254,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
> >  	if (!desc.name)
> >  		return -ENOMEM;
> >
> > -	etm4_set_default(&drvdata->config);
> > +	etm4_set_default(&drvdata->active_config);
>
> Should we set default values to drvdata->config ?
>
> My understanding is drvdata->active_config would be always set at the
> runtime, but "drvdata->config" should be initialized properly so it
> can be consumed by sysfs knobs.

Right. I've only thought about perf case not a sysfs knobs for this.

Thanks.

--
Sincerely,
Yeoreum Yun

