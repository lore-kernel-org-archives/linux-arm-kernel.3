Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811BF88073
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 06:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPrFd9xVH/FeIPpHZNhfcE2eMSxpfHWYBPbRaa9EJvU=; b=mRXgaH1jVAN6sAil6vQg2ixlha
	Wl8XSPVCLmGzR9z22cH771yv32ORI4qmSsM6LKX3KefMVlv4AH3sdnIsa0bIl5O4Y0z8s8QlCFSK5
	/AKsyeEefxcDzVQ9OoFbibOVjpVPZA8DklHMvvnbpaFBfhGLxLFIazIItlSqv9jRWyYJxS2mk0pn6
	bGBJCDJt4KbUavF+5hxM/PfNVQH6w6YJ+N0Q2OQEzkBlhRuPh1yNnmuUqo0PW3is5m+HTkkG4tWWv
	VBP5IDhW65xZ/yfskWtK0Vl7GdxsiF+ZCfu2jBI1dDQ5oeERGJYA0p7TrHZlMgxDFeV/iZiJJgmtp
	VpwvH9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGY4-000000024ie-2HKZ;
	Thu, 16 Apr 2026 06:50:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGY2-000000024hV-0jiq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 06:49:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB56025E9;
	Wed, 15 Apr 2026 23:49:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3791E3F7D8;
	Wed, 15 Apr 2026 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776322195; bh=WJqqPg+NgUXu080b4oFgLHWOe9dqYajMw9jaKFv6/FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkxrBHdnhN86Y72V0m0mLjRWiTs8d7n5iptacW35T55rS1gTE4eGayrnmFCfVt3H/
	 w7G6aMhKDXJJGI3NRrl4Quc8WT912vpngf/weC36hQdzXhcHPNBaFXJw36PP8Mb0wl
	 1iVCh4HvPW/ie8OFeiNiKPlUr1ucK8HEXSskkdNg=
Date: Thu, 16 Apr 2026 07:49:51 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v5 07/12] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <aeCGj3HS+wPhmMBK@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-8-yeoreum.yun@arm.com>
 <b9528488-b0c7-410b-b91b-b05c21fd0c08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9528488-b0c7-410b-b91b-b05c21fd0c08@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_234958_330573_48078460 
X-CRM114-Status: GOOD (  21.45  )
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
>
>
> On 4/16/2026 12:55 AM, Yeoreum Yun wrote:
> > The current ETM4x configuration via sysfs can lead to
> > several inconsistencies:
> >
> >    - If the configuration is modified via sysfs while a perf session is
> >      active, the running configuration may differ before a sched-out and
> >      after a subsequent sched-in.
> >
> >    - If a perf session and a sysfs session enable tracing concurrently,
> >      the configuration from configfs may become corrupted.
> >
> >    - There is a risk of corrupting drvdata->config if a perf session enables
> >      tracing while cscfg_csdev_disable_active_config() is being handled in
> >      etm4_disable_sysfs().
> >
> > To resolve these issues, separate the configuration into:
> >
> >    - active_config: the configuration applied to the current session
> >    - config: the configuration set via sysfs
> >
> > Additionally:
> >
> >    - Apply the configuration from configfs after taking the appropriate mode.
> >
> >    - Since active_config and related fields are accessed only by the local CPU
> >      in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
> >      remove the lock/unlock from the sysfs enable/disable path and
> >      startup/dying_cpu except when to access config fields.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
>
> <...>
>
> > @@ -618,23 +624,45 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
>
> needs disable the active config in error path:
> cscfg_csdev_disable_active_config(drvdata->csdev);

You're right. I missed it. Thanks!

[...]

--
Sincerely,
Yeoreum Yun

