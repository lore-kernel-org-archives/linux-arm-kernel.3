Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C717C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWGdlmuL/ulxDvEVmn/Xw32cqs5rrCBO6yojxeXkrvQ=; b=ywhw7v8slVyFt4Gv8uqpJgIQnH
	uHh7IebkNbV8OyyhuRIXb+Dy61H763mfUhNLKPoh0ZpDCi9rtptFlf/JFzyIi6tXy42k/oKXl2kHR
	AEEA6Gzt3smm/3rW92EyurVG02ywDgrGzn8SeeO/2qAktlgpIVuiLONwNiRxrDpa7zSUAe4S45ZJy
	qihbjU7MXlh9VnNMgidRdoVbQoO79MJK4dTJKc8kWjsnJJmASs0W1kW29dmovE/K6JeXwJv16wCgT
	vqUtaxHPZZH7OC6Wk26JSs2YjyWJZSdZJWe1PWG0S1SWXkh9uLhzFqrTlx158ssKrRWoXL5gN4EpD
	h42ao8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RIg-00000006vJV-3flA;
	Mon, 28 Apr 2025 16:25:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RFP-00000006uNi-3mpY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9F11516;
	Mon, 28 Apr 2025 09:22:13 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370683F66E;
	Mon, 28 Apr 2025 09:22:19 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:22:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250428162214.GG551819@e132581.arm.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com>
 <Z+OuATAe31GbcKZ2@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+OuATAe31GbcKZ2@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092224_029669_20604B33 
X-CRM114-Status: GOOD (  44.95  )
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

Hi Levi,

On Wed, Mar 26, 2025 at 07:34:25AM +0000, Yeoreum Yun wrote:

[...]

> > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > >
> > >  	raw_spin_unlock(&drvdata->spinlock);
> > > +
> > > +	cscfg_csdev_disable_active_config(csdev);
> > > +
> >
> > In general, we need to split changes into several patches if each
> > addresses a different issue.  From my understanding, the change above is
> > to fix missing to disable config when disable Sysfs mode.
> >
> > If so, could we use a seperate patch for this change?
> >
> 
> It's not a differnt issue. Without this line, the active count wouldn't
> decrese and it raise another issue -- unloadable moudle for active_cnt :(
> So I think it should be included in this patch.

I read the code again and concluded the change above is not related to
locking and would be a separate issue: when we close a Sysfs session,
we need to disable a config on a CoreSight device.

Could you clarify what is meaning "unloadable moudle for active_cnt"?
I only saw "cscfg_mgr->sys_active_cnt" is used for module unloading,
but have no clue why "active_cnt" impacts module unloading.

> > >  	cpus_read_unlock();
> > >
> > >  	/*
> > > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > index a70c1454b410..6d8c212ad434 100644
> > > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
> > >  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
> > >  {
> > >  	struct cscfg_config_csdev *config_csdev, *tmp;
> > > +	unsigned long flags;
> > >
> > >  	if (list_empty(&csdev->config_csdev_list))
> > >  		return;
> > >
> > > +	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> >
> > I think we should use spinlock to guard the condition checking
> > list_empty().
> >
> > Here the race condition is the 'config_csdev_list' list and
> > configurations on the list.  For atomicity, we should use lock to
> > protect any operations on the list (read, add, delete, etc).
> 
> Interesting... Would you let me know which race it is?
> here to check list_empty(), it already guarded with "cscfg_mutex".

Thanks for pointing out this.  I read the code and understood that in
some scenarios the list is protected by the mutex "cscfg_mutex".

I would argue for using locking, we need to make clear for two thigns:

- What is the race condition;
- What locking is used to protect the race condition.

For current case, a CoreSight device has a config list, the race
condition is the config list will be manipulated by multiple places
(e.g., for module loading / unloading, opening or closing a perf or
SysFS session).  So a spinlock is used to to protect the config list.

"cscfg_mutex" is a high level lock, my understanding is to protect the
high level operations from the Sysfs knobs, though sometimes it can
mitigate the race condition on configuration list mentioned above, but
the spinlock is the locking mechanism for the low level's config list
on a CoreSight device.

> However list_del() is special case because iterating config_csdev_list
> can be done without cscfg_mutex -- see
> cscfg_csdev_enable_active_config().
> This gurad with spinlock purpose to guard race unloading and
> get the config in cscfg_csdev_enable_active_config()
> (Please see my response below...).
> 
> the emptiness of config_csdev_list is guarded with cscfg_mutex.
> therefore, It seems enough to guard iterating part with spinlock :)

Mixed using cscfg_mutex and spinlock get code complexity, and I am a bit
concerned this is not best practice.

At a glance, I would say 'cscfg_mutex' is purposed to protect the global
'cscfg_mgr', per CoreSight device's config list should be protected by
'cscfg_csdev_lock'.

> > A side topic, as here it adds locks for protecting 'config_csdev_list',
> > I am wandering why we do not do the same thing for
> > 'feature_csdev_list' (See cscfg_remove_owned_csdev_features() and
> > cscfg_get_feat_csdev()).
> 
> In case of feature, It's okay since it couldn't be accessed when it
> gets failed to get related config.

I looked at cscfg_load_feat_csdev(), it uses 'cscfg_csdev_lock' to
protect the feature list.  This is why I thought the feature list also
need to be protected by the lock.  Now it is only partially protected.

> When we see cscfg_csdev_enable_active_config(), the config could be
> accessed without cscfg_mutex lock. so the config need to be guarded with
> spin_lock otherwise it could be acquired while unload module
> (after get active_cnt in search logic cscfg_csdev_enable_active_config()
> and other running unloading process)

To make things more clear, I have a questions.

'cscfg_mgr->sys_active_cnt' is used in the cscfg_unload_config_sets()
function to decide if can unload module, if any configuration is
active, why this variable cannot prevent unloading module?

Sorry for late replying.

Leo

> But feature list is depends on config, If config is safe from
> load/unload, this is not an issue so we don't need it.
> 
> Thanks for your review!

