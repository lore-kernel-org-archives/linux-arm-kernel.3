Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26F7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3siaCn8ANgJ7z00VgBSBBFtgKn3opKxbSo3/uzLE4Og=; b=31cJhwTcMoFEDuvYoztkY2p//t
	wzyYVBHWPRVgRTFS8hUPKy5YeJcPAILKnSo877HErA45/FGyeA/mnLU+4KW5on2lHcCIg0RlA0XbS
	RfUp4HCfM6XSWJqifnngd3DENa7wjY0I+3YTsFlj8txtVCs9WgdNbZdgOOtBMIks+65g5tZwLWTFI
	OKsSnDxaV4Xp/mcBuc8VOkfDRu+4Cy9/WBVgz02uOfumKSInYgFDz4R1p51dCB8ZDsTvUOe6++HIn
	7n1INQyG5CeXTX2s+SNMF8SmtCCF944AHBeHjrjE3AzG0LchjrCp7sgcwQENifH9OXUPgFrjFV60x
	ofmeg/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnw9-0000000DKM7-3s2a;
	Mon, 06 Jul 2026 18:20:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnw7-0000000DKLg-0bc2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:20:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4821176C;
	Mon,  6 Jul 2026 11:20:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915953F905;
	Mon,  6 Jul 2026 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783362053; bh=sakR/mUF17O2uJtIDze5qohEXx2DQJaPiUpFEvm4Ctg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyVXaCjgwCDhSuPOYrSDVMdnpSTGR+lWm5ldnHAfi9/cvtEtvadXkf2WhFIyBlS8d
	 RAqWlT9Vr64Qd5QEi+mzbYB4pM3hbITByTgmDIIDLCpXmyHkdo6HYDT+i0A6CL0kHO
	 xDjH0B1nKTxSkK8gg3kWJh6wQD4K1Hi+lFGM/1mA=
Date: Mon, 6 Jul 2026 19:20:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <akvyAOJZDqB4yG3m@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706173940.GB1024232@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706173940.GB1024232@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_112055_302337_3C9A259C 
X-CRM114-Status: GOOD (  18.28  )
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

> On Mon, Jun 29, 2026 at 10:00:01AM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > @@ -922,25 +950,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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
> > @@ -948,20 +958,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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
> 
> This is most valuable change for me, as now we will have much clear
> scope for what is protected ("drvdata->config").
> 
> However, a corner case was mentioned by Sashiko:
> 
>  | It appears etm4_enable_hw() modifies drvdata->ss_status while executing
>  | via IPI, but sshot_ctrl_store() can modify the same array concurrently
>  | from process context since the lock is no longer held across the
>  | smp_call_function_single() call.
> 
> "drvdata->ss_status" is a race condition between SMP call and sysfs
> knobs. Should we change to spinlock_irqsave/irqrestore when access
> drvdata->ss_status?

I know this, but  This is currently ignorable since
whatever perf or sysfs session, the ss_status is always clear
the PENDING and STATUS bits (and we make a compromise for this right now).

And the sshot_ctrl_store()'s action is always clear above bits.

So, This is ignorable comment from Sashiko.

Thanks!

-- 
Sincerely,
Yeoreum Yun

