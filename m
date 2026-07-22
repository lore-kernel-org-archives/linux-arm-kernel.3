Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9743EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL+0vF4sqSgnS6CrcdvhBTdHZxo5UEO5SZdBMrgO4Ao=; b=O1PyNxum3znPvgn+yWFfGEKagJ
	SOaTP6fnbhg/evoGg9KkA+f/yyN7O5zbOUx8PemjBAx6jODWDHVboUSum7nNN1vlcuvfAP6M9nPOk
	HI7/lx2Mw5XxM+PqgzSMT34s6n9IV8MzEtVQZdDw4IdoRpnmOidprQZTGM/+S9oDtDD8VurYfLYLl
	QQ08jFuiySahnB2tlNkxlCxybQDC32XGEyUN+V5zfF78ajuIT36J/6Sb5uDQtrVDQ2ZBFWgZ2lXCG
	mgZ/xkT78XsMajf0VX9ZFlnfNqylR79/qBdy1okIGfB3SZbD6eLdub/si/5cEVnSvLdETySOW+Eke
	fHNl7lDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdBJ-0000000CgA8-1KiJ;
	Wed, 22 Jul 2026 20:04:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdBG-0000000Cg9j-0yTh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:04:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F03121595;
	Wed, 22 Jul 2026 13:04:30 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64093F59E;
	Wed, 22 Jul 2026 13:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784750675; bh=CjJZRMZW98EN1r5q3jC2RHLJuj9i+uIanPTZMLLNZoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4juYzy+ybwQR85P0FSBjrVoOC07Mc862nVQNopVfJcu+4tWphW4fyEgPVo2Nc1iF
	 7yD9bSWPLHjkTU7/hg3qv4kggqL69H/sJzuHdQlVkU9pEaSa57M8ALZULfrQhkTkPc
	 HVBjGsokJvMvUri7dVtAO4r5yAlJ/4qGQkGk9Mrw=
Date: Wed, 22 Jul 2026 21:04:31 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <amEiT5yRrSET6cw0@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706173940.GB1024232@e132581.arm.com>
 <2005044a-ff4d-4585-963b-1c346d661a35@arm.com>
 <alk6iwJNcnJHDxas@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alk6iwJNcnJHDxas@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_130438_386322_855BB15B 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Suzuki,

> > On 06/07/2026 18:39, Leo Yan wrote:
> > > On Mon, Jun 29, 2026 at 10:00:01AM +0100, Yeoreum Yun wrote:
> > > 
> > > [...]
> > > 
> > > > @@ -922,25 +950,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> > > >   {
> > > >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > > >   	struct etm4_enable_arg arg = { };
> > > > -	unsigned long cfg_hash;
> > > > -	int ret, preset;
> > > > -
> > > > -	/* enable any config activated by configfs */
> > > > -	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > > > -	if (cfg_hash) {
> > > > -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > > > -		if (ret) {
> > > > -			etm4_release_trace_id(drvdata);
> > > > -			return ret;
> > > > -		}
> > > > -	}
> > > > -
> > > > -	raw_spin_lock(&drvdata->spinlock);
> > > > -
> > > > -	drvdata->trcid = path->trace_id;
> > > > -
> > > > -	/* Tracer will never be paused in sysfs mode */
> > > > -	drvdata->paused = false;
> > > > +	int ret;
> > > >   	/*
> > > >   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> > > > @@ -948,20 +958,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> > > >   	 */
> > > >   	arg.drvdata = drvdata;
> > > >   	arg.path = path;
> > > > +
> > > > +	raw_spin_lock(&drvdata->spinlock);
> > > > +	arg.config = drvdata->config;
> > > > +	raw_spin_unlock(&drvdata->spinlock);
> > > > +
> > > >   	ret = smp_call_function_single(drvdata->cpu,
> > > >   				       etm4_enable_sysfs_smp_call, &arg, 1);
> > > >   	if (!ret)
> > > >   		ret = arg.rc;
> > > >   	if (!ret)
> > > > -		drvdata->sticky_enable = true;
> > > > -
> > > > -	if (ret)
> > > > +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> > > > +	else
> > > >   		etm4_release_trace_id(drvdata);
> > > > -	raw_spin_unlock(&drvdata->spinlock);
> > > > -
> > > > -	if (!ret)
> > > > -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> > > >   	return ret;
> > > >   }
> > > 
> > > This is most valuable change for me, as now we will have much clear
> > > scope for what is protected ("drvdata->config").
> > > 
> > > However, a corner case was mentioned by Sashiko:
> > > 
> > >   | It appears etm4_enable_hw() modifies drvdata->ss_status while executing
> > >   | via IPI, but sshot_ctrl_store() can modify the same array concurrently
> > 
> > Could we stop modifying the drvdata->ss_status in enable_hw() ? We moved
> > it outside the config claiming that the status is not used(or useful). #
> > Then why not remove the updating from enable_hw()
> 
> This is because of the consistency with the former.
> If we remove those parts in the etm4x_enbale_hw(), the PENDING and STATUS
> bits will be never cleared according to the case.
> 
> This will be handled in the future for the PENDING and STATUS bit
> hanlding in the perf session and sysfs accordingly
> before that, to keep the old behavior, remain as-is.

If you don't mind, could I keep it as-is and post next version among
this week?

Thanks!

-- 
Sincerely,
Yeoreum Yun

