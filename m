Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16763C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UZDaxHZ9IunrgLDGUQHp9v1b4H7eiYaDN6WoBbp5Eg=; b=lS3vRUDrsLcfnG4Cnz8XrL1Dlv
	lNjSn/UZghpdEaARcmornTu8DPMeAQztxiGrDF93WgMPFLo1YViBDyrUDERu16amxcTb1uG/0Hoxv
	qszZALFRQ3lAd/KdbuimSyMmMlsV8W171PlaNC0v6SB5f2H3TKaZtysl8SNrCQdI4sj7BYPxduJZ2
	WpD9rQlZfLN0An5d6HFoYwBo1e97sraTOC1ZrhCRE0rAChhFpOIN5kYi5nVuNtQ60oBFLLbfcxAxB
	y4uRXQiTUkgLzj/5baTE9E8l5cs+Kw5mXNgjb2YcMtN6yxgz5+9Dwkwt+U8NFqNYAKMEUcJnwgq1A
	jHYZbVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB53-0000000F2Fe-1zlo;
	Wed, 14 May 2025 12:19:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zr-0000000EhE8-1GcG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8362C1688;
	Wed, 14 May 2025 02:38:51 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BCB53F5A1;
	Wed, 14 May 2025 02:39:02 -0700 (PDT)
Date: Wed, 14 May 2025 10:39:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250514093900.GF26114@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
 <20250513170622.3071637-4-yeoreum.yun@arm.com>
 <20250514093019.GE26114@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514093019.GE26114@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023903_429699_AABD2F40 
X-CRM114-Status: GOOD (  38.29  )
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

On Wed, May 14, 2025 at 10:30:19AM +0100, Leo Yan wrote:
> On Tue, May 13, 2025 at 06:06:22PM +0100, Yeoreum Yun wrote:
> > While enable active config via cscfg_csdev_enable_active_config(),
> > active config could be deactivated via configfs' sysfs interface.
> > This could make UAF issue in below scenario:
> > 
> > CPU0                                          CPU1
> > (sysfs enable)                                load module
> >                                               cscfg_load_config_sets()
> >                                               activate config. // sysfs
> >                                               (sys_active_cnt == 1)
> > ...
> > cscfg_csdev_enable_active_config()
> > lock(csdev->cscfg_csdev_lock)
> > // here load config activate by CPU1
> > unlock(csdev->cscfg_csdev_lock)
> > 
> >                                               deactivate config // sysfs
> >                                               (sys_activec_cnt == 0)
> >                                               cscfg_unload_config_sets()
> >                                               unload module
> > 
> > // access to config_desc which freed
> > // while unloading module.
> > cscfg_csdev_enable_config
> > 
> > To address this, use cscfg_config_desc's active_cnt as a reference count
> >  which will be holded when
> >     - activate the config.
> >     - enable the activated config.
> > and put the module reference when config_active_cnt == 0.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

And please add a fix tag:

Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")

> > ---
> >  .../hwtracing/coresight/coresight-config.h    |  2 +-
> >  .../hwtracing/coresight/coresight-syscfg.c    | 49 +++++++++++++------
> >  2 files changed, 35 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> > index b9ebc9fcfb7f..90fd937d3bd8 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
> >   * @feats_csdev:references to the device features to enable.
> >   */
> >  struct cscfg_config_csdev {
> > -	const struct cscfg_config_desc *config_desc;
> > +	struct cscfg_config_desc *config_desc;
> >  	struct coresight_device *csdev;
> >  	bool enabled;
> >  	struct list_head node;
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index 5d194b9269f5..6d8c212ad434 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -870,6 +870,25 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> >  
> > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc)
> 
> I would like to change the return type to int, so the error is handled
> within the function.  As a result, the caller _cscfg_activate_config()
> does not need to explicitly return an error value.
> 
> Otherwise, the patch looks good to me.
> 
> Thanks,
> Leo
> 
> > +{
> > +	if (!atomic_fetch_inc(&config_desc->active_cnt)) {
> > +		/* must ensure that config cannot be unloaded in use */
> > +		if (unlikely(cscfg_owner_get(config_desc->load_owner))) {
> > +			atomic_dec(&config_desc->active_cnt);
> > +			return false;
> > +		}
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
> > +{
> > +	if (!atomic_dec_return(&config_desc->active_cnt))
> > +		cscfg_owner_put(config_desc->load_owner);
> > +}
> > +
> >  /*
> >   * This activate configuration for either perf or sysfs. Perf can have multiple
> >   * active configs, selected per event, sysfs is limited to one.
> > @@ -893,22 +912,17 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
> >  			if (config_desc->available == false)
> >  				return -EBUSY;
> >  
> > -			/* must ensure that config cannot be unloaded in use */
> > -			err = cscfg_owner_get(config_desc->load_owner);
> > -			if (err)
> > +			if (!cscfg_config_desc_get(config_desc)) {
> > +				err = -EINVAL;
> >  				break;
> > +			}
> > +
> >  			/*
> >  			 * increment the global active count - control changes to
> >  			 * active configurations
> >  			 */
> >  			atomic_inc(&cscfg_mgr->sys_active_cnt);
> >  
> > -			/*
> > -			 * mark the descriptor as active so enable config on a
> > -			 * device instance will use it
> > -			 */
> > -			atomic_inc(&config_desc->active_cnt);
> > -
> >  			err = 0;
> >  			dev_dbg(cscfg_device(), "Activate config %s.\n", config_desc->name);
> >  			break;
> > @@ -923,9 +937,8 @@ static void _cscfg_deactivate_config(unsigned long cfg_hash)
> >  
> >  	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> >  		if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> > -			atomic_dec(&config_desc->active_cnt);
> >  			atomic_dec(&cscfg_mgr->sys_active_cnt);
> > -			cscfg_owner_put(config_desc->load_owner);
> > +			cscfg_config_desc_put(config_desc);
> >  			dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
> >  			break;
> >  		}
> > @@ -1050,7 +1063,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >  				     unsigned long cfg_hash, int preset)
> >  {
> >  	struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> > -	const struct cscfg_config_desc *config_desc;
> > +	struct cscfg_config_desc *config_desc;
> >  	unsigned long flags;
> >  	int err = 0;
> >  
> > @@ -1065,8 +1078,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >  	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> >  	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
> >  		config_desc = config_csdev_item->config_desc;
> > -		if ((atomic_read(&config_desc->active_cnt)) &&
> > -		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> > +		if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> > +				cscfg_config_desc_get(config_desc)) {
> >  			config_csdev_active = config_csdev_item;
> >  			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
> >  			break;
> > @@ -1100,7 +1113,11 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >  				err = -EBUSY;
> >  			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >  		}
> > +
> > +		if (err)
> > +			cscfg_config_desc_put(config_desc);
> >  	}
> > +
> >  	return err;
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> > @@ -1139,8 +1156,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
> >  	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >  
> >  	/* true if there was an enabled active config */
> > -	if (config_csdev)
> > +	if (config_csdev) {
> >  		cscfg_csdev_disable_config(config_csdev);
> > +		cscfg_config_desc_put(config_csdev->config_desc);
> > +	}
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
> >  
> > -- 
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> > 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

