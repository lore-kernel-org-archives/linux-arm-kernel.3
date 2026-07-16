Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A287DC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IDKOqlLeq7gny2neb1RjYhAbO2ajrqWnhJTQdhcvO4=; b=UTl/lGed9P3Q0/LtaSUHs8llhR
	vVsyTnFhfAy7oFhZFMUx7scjeRc7QEl6fQnbWzO0N84KIwY+PfOkOSvcB7s5kiPNx47lSJ+cNvqtd
	/KSDbqXZKmN95ARfWfOQLvcu2YoSrmuEfNFZCssI5vIiJOAln+OQvBVezt1WNtjBB/KqiLjFIPn8+
	AhI86d5q1LfudrfSLFXq8Pgi7GtAdZPPFqRIFIFl7gOmONb0jUwdNOgOAC/91gGV/3vtBLhCn0WaW
	HRWe709spL9dNx5vxHkks2nFjBNIv+ruzho2syizhNUHfA+DRGN3+Lw9GYb6Ye2cfWIjqUpR2BG8d
	gCAYfNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSDe-00000000UR8-4BxD;
	Thu, 16 Jul 2026 19:58:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSDc-00000000UQi-2pKq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 19:58:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB76B1476;
	Thu, 16 Jul 2026 12:57:57 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3E103F66F;
	Thu, 16 Jul 2026 12:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784231882; bh=pPrRe+Xjk6CAM0WQ2SNb/SkAx8gLxSfCcN3TUqvO0mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBbc69aGjZ/0dD77ieu+b3FTgMg0b8ogmR2jh+ASoV0ALIbP+4by5mWy9TbJYmy8I
	 2tQTDrGOxgsNC6gBA+1KDluM+ZJ/co9w4LGoZnrEkJFuFPfKN5ZMIEtpw0WhZA2se6
	 KZcFfLU9866W4alXTZtJfcNzKrK1SkdJy4fS1UAQ=
Date: Thu, 16 Jul 2026 20:57:58 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <alk3xhoECdrVJ-3M@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <78a81992-6beb-4caf-b7bd-5cab635a6de1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78a81992-6beb-4caf-b7bd-5cab635a6de1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_125804_818990_7954FF25 
X-CRM114-Status: GOOD (  21.32  )
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

[...]

> >   static void etm4_enable_sysfs_smp_call(void *info)
> >   {
> >   	struct etm4_enable_arg *arg = info;
> > +	struct etmv4_drvdata *drvdata;
> >   	struct coresight_device *csdev;
> > +	unsigned long cfg_hash;
> > +	int preset;
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
> > +	drvdata->active_config = arg->config;
> 
> I see, we copy the sysfs config to init_arg and then apply it here.

Yes it is. Thanks!

> 
> > -	/* The tracer didn't start */
> > +	/* enable any config activated by configfs */
> > +	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
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
> >   	if (arg->rc) {
> > -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> > -		return;
> > +		cscfg_csdev_disable_active_config(csdev);
> > +		goto err;
> >   	}
> > +	drvdata->sticky_enable = true;
> >   	csdev->path = arg->path;
> > +
> > +	return;
> > +err:
> > +	/* The tracer didn't start */
> > +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> 
> Do we need to reset the active_config ?

I don't think we don't need to reset active_config since
it's a failure path and at the next time, the active_config will
be initialised with the drvdata->config again if next trial is via
sysfs.

If the next trial is perf, it clears active_config in
etm4_parse_event_config().

Therefore, we wouldn't need to reset the active_config before
relasing mode.

> 
> 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> > index c0f7da17a186..a974e4d05838 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -1068,6 +1068,7 @@ struct etmv4_save_state {
> >    *		allows tracing at all ELs. We don't want to compute this
> >    *		at runtime, due to the additional setting of TRFCR_CX when
> >    *		in EL2. Otherwise, 0.
> > + * @active_config:	structure holding current applied configuration parameters.
> >    * @config:	structure holding configuration parameters.
> 
> Please could you update the documentation for "config" -> holding sysfs mode
> configuration.

Thanks I'll update accordingly.

-- 
Sincerely,
Yeoreum Yun

