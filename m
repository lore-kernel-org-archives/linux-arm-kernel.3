Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93889C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nm05lwPwjgUmfp2RmwUicO1Tz2HynEjchc9nZj/wEXY=; b=l0fhkFQqvLy2QbnVKpy/kIYFkl
	3owhs+2tF2RbxZtLmKT5Aewzksy5GQN32mogycvHrLyamDjv3e/S5hMoUeuMZoI1WDis+Cm55CQ1I
	RjKhcMFdaRLZ8YZil14L/AAaGwDqakcwvuFp3//6p1Eo5Gj4cOYp012UvL9TTnd6XowgLrixnrPpj
	PXq+9aQK6sa+bcxE1hPCL0z883ZcievutHNnuV/lTbl6ONRyq2YQWtAW8K9d9ERIO5KK5XvGKn+QF
	1vYTiuRzbQ4f6LIPXalRyKjBR1eWfPkU3mDbJEgFgr5OQ+50yl7+fIUWERzHeRnjigBEJm9o5zneG
	TDLXaw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSP4-00000000VBa-2PWq;
	Thu, 16 Jul 2026 20:09:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSP1-00000000VBA-2ojs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 20:09:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF211476;
	Thu, 16 Jul 2026 13:09:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45CB83F7D8;
	Thu, 16 Jul 2026 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784232590; bh=h2Sg3AMrAkxMgPDUQPLthDdOBIKTGic4NQaONzFMGC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkc6jJbnaFUH1ADGBEOtNKwBManVrNy0YMdvzxRGivNnUtJrLQPbuiQxRADEmXgM6
	 rBud3VQHkJftLK6tmVrwAAQiRuPkHZwrer5XSaTa+dYbNhB9nE3nnV54sY4BdArzcz
	 8sJiy7ZZMvRVynngj3jri+p5+Jd3d7TREltgcoqw=
Date: Thu, 16 Jul 2026 21:09:47 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <alk6iwJNcnJHDxas@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706173940.GB1024232@e132581.arm.com>
 <2005044a-ff4d-4585-963b-1c346d661a35@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2005044a-ff4d-4585-963b-1c346d661a35@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_130951_817515_7324325F 
X-CRM114-Status: GOOD (  19.34  )
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

> On 06/07/2026 18:39, Leo Yan wrote:
> > On Mon, Jun 29, 2026 at 10:00:01AM +0100, Yeoreum Yun wrote:
> > 
> > [...]
> > 
> > > @@ -922,25 +950,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> > >   {
> > >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > >   	struct etm4_enable_arg arg = { };
> > > -	unsigned long cfg_hash;
> > > -	int ret, preset;
> > > -
> > > -	/* enable any config activated by configfs */
> > > -	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > > -	if (cfg_hash) {
> > > -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > > -		if (ret) {
> > > -			etm4_release_trace_id(drvdata);
> > > -			return ret;
> > > -		}
> > > -	}
> > > -
> > > -	raw_spin_lock(&drvdata->spinlock);
> > > -
> > > -	drvdata->trcid = path->trace_id;
> > > -
> > > -	/* Tracer will never be paused in sysfs mode */
> > > -	drvdata->paused = false;
> > > +	int ret;
> > >   	/*
> > >   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> > > @@ -948,20 +958,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> > >   	 */
> > >   	arg.drvdata = drvdata;
> > >   	arg.path = path;
> > > +
> > > +	raw_spin_lock(&drvdata->spinlock);
> > > +	arg.config = drvdata->config;
> > > +	raw_spin_unlock(&drvdata->spinlock);
> > > +
> > >   	ret = smp_call_function_single(drvdata->cpu,
> > >   				       etm4_enable_sysfs_smp_call, &arg, 1);
> > >   	if (!ret)
> > >   		ret = arg.rc;
> > >   	if (!ret)
> > > -		drvdata->sticky_enable = true;
> > > -
> > > -	if (ret)
> > > +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> > > +	else
> > >   		etm4_release_trace_id(drvdata);
> > > -	raw_spin_unlock(&drvdata->spinlock);
> > > -
> > > -	if (!ret)
> > > -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
> > >   	return ret;
> > >   }
> > 
> > This is most valuable change for me, as now we will have much clear
> > scope for what is protected ("drvdata->config").
> > 
> > However, a corner case was mentioned by Sashiko:
> > 
> >   | It appears etm4_enable_hw() modifies drvdata->ss_status while executing
> >   | via IPI, but sshot_ctrl_store() can modify the same array concurrently
> 
> Could we stop modifying the drvdata->ss_status in enable_hw() ? We moved
> it outside the config claiming that the status is not used(or useful). #
> Then why not remove the updating from enable_hw()

This is because of the consistency with the former.
If we remove those parts in the etm4x_enbale_hw(), the PENDING and STATUS
bits will be never cleared according to the case.

This will be handled in the future for the PENDING and STATUS bit
hanlding in the perf session and sysfs accordingly
before that, to keep the old behavior, remain as-is.

-- 
Sincerely,
Yeoreum Yun

