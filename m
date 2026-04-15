Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD54FA0C2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 05:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmbgoOcnGnQZxOXZQG2oRMTX41rKqJefpcAnGYAgwCo=; b=H9J673Gg38WOteR0Io+AH72MMQ
	zZ9JgHaTVsjQvndMIChXYimV6cOulWe3CJLwjsXOx557/X9u1W6AP0H/u+cRi8bLlUZQHjOa6RZ3X
	9xhrEGbsFlnucvj9/1/6BbHowubGb+A6v5v8lGLHsa4859Je4jequ3r1AXEXzigJPIpk10kZDuogC
	PIBbR2QyqaZ4Mavqf1Mlf1NxyyYxXK1uh5Qa93904X7hFOu2oMeXR5Ec73Ailav5rcdUb8Q5vcCMj
	QccuIXbJquhZRTse1ZoX45ip5rHY4iDtMkXGkBhD0yEpOwu3WNzUUjXxGyJC3niNN/psrbLVve14o
	JHk6qm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCsvD-00000000bfI-1AEa;
	Wed, 15 Apr 2026 05:36:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCsvA-00000000beY-2h5B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 05:36:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB9F4B37;
	Tue, 14 Apr 2026 22:36:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 455D63F641;
	Tue, 14 Apr 2026 22:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776231374; bh=UU2BXdGMJyr9q4mAsFIm8mMtzZnkRwYF9AofLjkAGrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGfuHt5SGpzvLbi4ltzXpaNXfAykcgdkNW2yXwkw+PD7QCjxcMajihLaxyM5506Pj
	 DRv8ZKAMUSa1ToN+LM0M8tG9sYiaA9WNn4Q+7K4EaryuXJQwo7W+mqn6ZzNiULFZFP
	 aqV8UIbpSwG1Dk51c0iXOoDfJkhIfntTm+AtKuX8=
Date: Wed, 15 Apr 2026 06:36:10 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v4 4/9] coresight: etm4x: fix inconsistencies with sysfs
 configuration
Message-ID: <ad8jyi+cRFqDY7XX@e129823.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-5-yeoreum.yun@arm.com>
 <d1b42ecb-3275-4399-8537-b6a4844002cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1b42ecb-3275-4399-8537-b6a4844002cf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_223616_726053_49DFB64B 
X-CRM114-Status: GOOD (  14.18  )
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

> > @@ -616,23 +622,46 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
> > +	drvdata->active_config = arg->config;
> > -	/* The tracer didn't start */
> > +	if (arg->cfg_hash) {
> > +		arg->rc = cscfg_csdev_enable_active_config(csdev,
> > +							   arg->cfg_hash,
> > +							   arg->preset);
> > +		if (arg->rc)
> > +			goto err;
> > +	}
> > +
> > +	drvdata->trcid = arg->trace_id;
> > +
> > +	/* Tracer will never be paused in sysfs mode */
> > +	drvdata->paused = false;
> > +
> > +	arg->rc = etm4_enable_hw(drvdata);
> >   	if (arg->rc)
> > -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> > +		goto err;
> > +
> > +	drvdata->sticky_enable = true;
> > +
> > +	return;
> > +err:
> > +	/* The tracer didn't start */
> > +	etm4_release_trace_id(drvdata);
>
> [NIT] better move this error handle to etm4_enable_sysfs.
>
> smp_call_function_single possible return before call
> etm4_enable_sysfs_smp_call if the cpu is offline. The error path here cannot
> handle this error, breaking previous logic(handle all errors in
> etm4_enable_sysfs by releasing trace id).
>
> There is no harm in not releasing the trace id here because ETM can re-use
> the allocated trace ID. But it's better to fix the inconsistent logic.

Agree. I've missed this!

Thanks ;)

[...]


--
Sincerely,
Yeoreum Yun

