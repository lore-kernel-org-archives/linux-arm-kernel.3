Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4C6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4VNCDP4pWCJrDen//V3q6LUGxbKnjS9bsz0lWmLz30=; b=ebnsHxyenqsmO2uluVxRfHqBBT
	OheIyQyzG+v/ygLyvjSAqRh3dh1fNGAsNC7thEX3W+uniTLOlN1z/aKVdO93LYoqRwL+OgL9JxRld
	y98nKa2tRNcSHQx9IapUNFe517cFtxBE1x2zyrXiOEw5rGKS6fgbM/DoD+5kClG1Q/si9JbDdHf6/
	ckSICJj7MmvS1cYWXp6udViIVWbkZ8ocRyiOh8BRiZkY1Vhy8+sIqTntKGe6GgRbU8g+VwWWryl4y
	Yzxnu0wxjZ4AzxhfXDqJhEkGQ3UWH7AlXRQnyKqQkJrJzd6sB0onHyq9Be24LXr2uYHwlaozQ25qv
	J4ryfwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScAA-00000005t32-1esr;
	Thu, 28 May 2026 14:56:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScA7-00000005t2X-1zmJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:56:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E4CD22EE;
	Thu, 28 May 2026 07:56:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A428E3F905;
	Thu, 28 May 2026 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779980200; bh=XVP2Gi7G4tEsptxsYNuSM55GDS2HDDrgsvrixrhKPuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMghMG9NrTN19JsFStvSh4Yl05mYSxcACFBHJVy2WUNp8YhtTvWkE0aRsJcHbHGf+
	 dIlq8W6pc7wwm1q76aJZ3Np3xAHk3SHkCSaqiz07UGGIVqG0IhUX6MU5Q/IXFXY1t/
	 DazVTwlSP/NX68rogS97+HiMQprkpOlyE5g6mtg4=
Date: Thu, 28 May 2026 15:56:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260528145637.GG101133@e132581.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-9-yeoreum.yun@arm.com>
 <20260528140943.GE101133@e132581.arm.com>
 <ahhQsTNok65e6K0F@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahhQsTNok65e6K0F@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_075643_593228_DCF3D622 
X-CRM114-Status: GOOD (  35.48  )
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

On Thu, May 28, 2026 at 03:26:57PM +0100, Yeoreum Yun wrote:

[...]

> > > @@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> > >  				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
> > >  {
> > >  	int err = -EINVAL, idx;
> > > -	struct etmv4_config *drvcfg = &drvdata->config;
> > > +	struct etmv4_config *drvcfg = &drvdata->active_config;
> > 
> > Wouldn't it make more sense to keep using drvdata->config for cfgfs?
> > This would avoid cfgfs updating the active configuration while a session
> > is enabled.
> >
> > My understanding is after refactoring cfgfs, we will never expose
> > active_config or config anymore so this should not an issue. Before
> > that, maybe we just keep to use config so can avoid mess.
> 
> I don't think so. since the cfgfs's config is updated right before
> enable and in this patchset, It's applied after "take the mode".
> 
> If we do it into drvdta->config, then contention would be increased
> with the access of sysfs and that nullifies almost this patch purpose
> and because of we use "one config" this makes a corruption with perf
> and sysfs.

Here have two different contention: the contention between sysfs and
cfgfs, and the contention between cfgfs and a runtime config (active
config). My suggestion is to avoid the later contention, which is the
main idea in this series that avoid the runtime config is modified in
the middle of a session.

That said, I have no strong opinion.

> > >  static void etm4_enable_sysfs_smp_call(void *info)
> > >  {
> > >  	struct etm4_enable_arg *arg = info;
> > > +	struct etmv4_drvdata *drvdata;
> > >  	struct coresight_device *csdev;
> > > +	unsigned long cfg_hash;
> > > +	int preset;
> > >  
> > >  	if (WARN_ON(!arg))
> > >  		return;
> > >  
> > > -	csdev = arg->drvdata->csdev;
> > > +	drvdata = arg->drvdata;
> > > +	csdev = drvdata->csdev;
> > >  	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> > >  		/* Someone is already using the tracer */
> > >  		arg->rc = -EBUSY;
> > >  		return;
> > >  	}
> > >  
> > > -	arg->rc = etm4_enable_hw(arg->drvdata);
> > > +	/* enable any config activated by configfs */
> > > +	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > >  
> > > -	/* The tracer didn't start */
> > > +	drvdata->active_config = arg->config;
> > 
> > Can move this down to just before drvdata->trcid assignment so cscfg
> > operations can be put together?
> 
> No. Copy the arg->config must be before cscfg_csdev_enable_active_config().
> If that's after, it overrides the "preset" and this is different from
> the former behavior.

Please copy config first, then do cscfg stuffs.

> > > +	arg->rc = etm4_enable_hw(drvdata);
> > >  	if (arg->rc) {
> > > -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> > > -		return;
> > > +		cscfg_csdev_disable_active_config(csdev);
> > > +		goto err;
> > 
> > Add a new goto tag (like err_enable_hw) for the disable_active_config
> > rollback?
> 
> This is only place where cscfg_csdev_disable_active_config().
> Why do we need to goto for cleanup where there is no duplication?

It is about to use a central place for handling errors.

> > > @@ -1449,7 +1458,7 @@ static void etm4_init_arch_data(void *info)
> > >  
> > >  	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
> > >  	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> > > -	drvdata->config.s_ex_level = caps->s_ex_level;
> > > +	config->s_ex_level = caps->s_ex_level;
> > 
> > config->s_ex_level is redundant and not really a configuration item.
> > We should use caps->s_ex_level instead of config->s_ex_level wherever
> > it is used.
> 
> Agree, but this includes it should change the omse function
> declations to pass "caps" argument:
>   - etm4_set_comparator_filter()
>   - etm4_set_start_stop_filter()
> 
> If that's okay, I'll respin with it.

This is fine for me.

Thanks,
Leo

