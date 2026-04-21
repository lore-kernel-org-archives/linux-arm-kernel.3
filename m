Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5114F8FA78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4U4pl1zOZWkLWSJAsu/tFf0f7cS9QPJQ+iXEHtK2z8=; b=jZ1gBM4+CjnB3g+otAMacq2081
	mb9iZsA9C357UBxbNSNvUOf2yW9oUMuRYUhoTLD8Tzrf3rE4Q1o1X1RM2zZ04FwbhX2O2K7qHW+35
	8h6KLvkwT1HXgAyiDJ7AAB9RiLjZK6BXU8tc1RCNSaOLucPMbmKaacMKLJBPqdejb7N5q+EBT6wV0
	s/R36JIFh7rCKe0hsLqFLsN2lOnl+/tGpgO3FARig1+GkVsmLvj1EnPb5bePUi4JXBVh+0yq85u5Z
	bWuz8BKbCZBFE3czeXuyDTGj+iseXFbg9U9s7euQ53/LFNzUqA2Gxi6kDdkEM3G3bOrsP94F1loHP
	E/HAVorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFB9l-00000008fXP-1XGO;
	Tue, 21 Apr 2026 13:28:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFB9i-00000008fX1-3LZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:28:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37D2C1BF3;
	Tue, 21 Apr 2026 06:28:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A7E43FE87;
	Tue, 21 Apr 2026 06:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776778125; bh=+1X+DlknRjHqKgv3dA+1G8Jnl/AycFThXqT8ZxAXDzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2BriHx/r5DzNtTFzlzG4r9GRVY4hpopEZb83uwmv6QTY6f5ROZgn5z/IJSIZgamE
	 fvCWoYzFk3Yj69WcE5oa8JuNBTS8BII0Xe02ELOtqQufyToSXjtSK6NTRaN7rqjiWk
	 jBmZdtzSTeYiNnKbxpmDChAf0pQ+btlzvzXGyvVo=
Date: Tue, 21 Apr 2026 14:28:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 07/12] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260421132842.GC929984@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-8-yeoreum.yun@arm.com>
 <20260421104601.GB929984@e132581.arm.com>
 <aedcDEpBAnAieSRX@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aedcDEpBAnAieSRX@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_062847_075224_7065B554 
X-CRM114-Status: GOOD (  26.70  )
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

On Tue, Apr 21, 2026 at 12:14:20PM +0100, Yeoreum Yun wrote:

[...]

> > >   - There is a risk of corrupting drvdata->config if a perf session enables
> > >     tracing while cscfg_csdev_disable_active_config() is being handled in
> > >     etm4_disable_sysfs().
> >
> > Similiar to above, cscfg_csdev_disable_active_config() is not
> > protected in etm4_disable_sysfs().
> 
> This is not true.
> at the time of etm4_disable_sysfs() "mode" is already taken
> (whether sysfs or perf). In this situation, it's enough to
> call cscfg_csdev_disable_active_config() before chaning
> mode to DISABLED.

To be clear, I am trying to understand issue _before_ your patch.
Without this patch, cscfg_csdev_disable_active_config() is not
protected by the mode.

> > >  struct etm4_enable_arg {
> > >  	struct etmv4_drvdata *drvdata;
> > > +	struct etmv4_config config;
> >
> > We don't need this. We can defer to get drvdata->config in SMP call.
> 
> This is not true ane make a situation more complex.
> If we get config in SMP call, that would be a problem when some user is
> trying to modify config.
> 
> IOW, while user modifying config via sysfs, and SMP call happens,
> it makes a dead lock. so for this if we try to grab the lock in SMP call,
> we should change every sysfs raw_spin_lock() into raw_spin_lock_irqsave().
> 
> Instead of this it would be much clear and simpler to get config in here
> rather than to add some latencies via sysfs.

Thanks for info. If so, it is fine for me to add "config".

> > > @@ -1386,6 +1401,7 @@ static void etm4_init_arch_data(void *info)
> > >  	drvdata = dev_get_drvdata(init_arg->dev);
> > >  	caps = &drvdata->caps;
> > >  	csa = init_arg->csa;
> > > +	config = &drvdata->active_config;
> >
> > Should we init drvdata->config instead so make it has sane values ?
> >
> > In other words, drvdata->active_config are always set at the runtime,
> > so don't need to init it at all, right?
> 
> No. at least when the initialise, I think we should fill the its
> contesnt with the "etm4_set_default()".
> 
> That's why the consequence call etm4_set_default() called with
> active_config and config is coped with the default configutation.

I'm concerned that some config fields may be reused across sessions.
For example, a sysfs session copies drvdata->config into
drvdata->active_config, and later a perf session may reuse stale
values. The same issue can happen in the reverse direction.

A clean approach would be to treat drvdata->active_config as
per-session state:

  1) clear drvdata->active_config at session start
  2) apply the session-specific config
     2.1) sysfs: use drvdata->config
     2.2) perf: use event config
  3) then apply configfs configuration

So we should clear drvdata->active_config at the start of each session
and rebuild it with the correct configuration.

Thanks,
Leo

