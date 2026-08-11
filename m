Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A0C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9i6rc31+U1tpU+/EAV67KCCelGdXXsL6RoFWoFSfCc=; b=RAPsdktr7XnTGYGGHNR1a3csob
	s3i0QoSKcrR21x0acQvq6e3RzTJfNle8exLVa6NxGcZJ20P0lqkYEzHCMhFLHH29+vCK2rZ1ilIvN
	DP6l0xQ0W+XXYGTtykFh9K0cCObmswEPcn8mJmyL0uro+bGhkY9HNVFomn4s6qfdRv96/+V3yBVtQ
	LHozkeyGe33FvjUMGiaDposiHrTgKnrAZRANdoPG+99PZNYw5MuCCX17zY/dk2wsl1xuRmlPerAkf
	zkTYGSlqEDugIZMfxPIAV1I3ORwWd93wMaKoR90kUDZJLg1EuhZM3t/yQaXG8L42LAOpus0fHaWzI
	9ZGpcQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpm9-0000000EZMc-00Tc;
	Tue, 11 Aug 2026 16:56:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpm6-0000000EZLx-3xjd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:56:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BA891516;
	Tue, 11 Aug 2026 09:56:19 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01D463F86F;
	Tue, 11 Aug 2026 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786467383; bh=Z5m/evdtIpzFVuQMmgrAC6HmOI0Ya8kMwQODghq1HBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLmTwUtKXmrKWbAHOHI3Rg3KI9BnID4XiEKqzVaDCiGh06zvbNm8zZnNpywwodXKm
	 W5O3b4Njr2SrhUQTOgGH5hQi1XtdhNggHlmYyzs0//ddRiIhdM0R70GQji3q263WJK
	 ERgISjpq/GLFf9Zy0JDweC+gkXS/ObzdKYahbhCY=
Date: Tue, 11 Aug 2026 17:56:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 04/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <antUM71hxHaBJ_5l@e129823.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-5-yeoreum.yun@arm.com>
 <20260811154521.GF15499@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811154521.GF15499@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_095627_074008_60D68B50 
X-CRM114-Status: GOOD (  37.54  )
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

On Tue, Aug 11, 2026 at 04:45:21PM +0100, Leo Yan wrote:
> On Sat, Jul 25, 2026 at 12:36:36PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > As the active_config is used for cfg-configfs, etmv4 doesn't need to set
> > its lock for the cfg-configfs since the active_config is proceted by cs_mode
> > otherwise it would make a possible cpu-stall when it get interrupt while
> > setting the sysfs configuration.
> > 
> > Therefore, set the drv_spinlock for cfg-configfs as NULL and
> > let the cfg-configfs disable irq without grap drv_spinlock when it is NULL.
> 
> I understand that this patch tries to put all the changes (active_config
> and drv_spinlock) into a single patch so that it can be backported to
> stable kernels.
> 
> However, the change is now quite large, and I suspect it will also be
> difficult for maintainers to backport it to stable kernels. The fixes
> tag 54ff892b76c6 is quite old, while this patch also touches cfgfs
> which was introduced much later.
> 
> Can we treat this as a refactoring instead and split it into at least
> two patches? This would make it easier to review now and easier to
> understand later if someone will read the changes.
> 
>  - Lock refactoring
>  - SMP call refactoring
>  - active_config refactoring

It couldn't since separation of Lock and SMP can introduce the bug for
that patch. and the Lock and SMP call refactoring isn't meaningful
without active_config.

With this perspective, I think it would be better as-is.

> >  static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
> >  {
> > -	unsigned long flags;
> >  	int i;
> >  
> > -	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> > -	for (i = 0; i < feat_csdev->nr_regs; i++)
> > -		cscfg_set_reg(&feat_csdev->regs_csdev[i]);
> > -	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> > +	scoped_guard (feat_csdev_lock, feat_csdev) {
> 
> scoped_guard(feat_csdev_lock, feat_csdev) {
> 
> > +		for (i = 0; i < feat_csdev->nr_regs; i++)
> > +			cscfg_set_reg(&feat_csdev->regs_csdev[i]);
> > +	}
> >  	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
> >  		feat_csdev->feat_desc->name, "set on enable");
> >  	return 0;
> > @@ -88,13 +87,12 @@ static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
> >  /* copy back values from the driver locations referenced in cscfg_reg_csdev */
> >  static void cscfg_save_on_disable(struct cscfg_feature_csdev *feat_csdev)
> >  {
> > -	unsigned long flags;
> >  	int i;
> >  
> > -	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> > -	for (i = 0; i < feat_csdev->nr_regs; i++)
> > -		cscfg_save_reg(&feat_csdev->regs_csdev[i]);
> > -	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> > +	scoped_guard (feat_csdev_lock, feat_csdev) {
> 
> scoped_guard(feat_csdev_lock, feat_csdev) {

Thanks. I'll change it.

> > +		for (i = 0; i < feat_csdev->nr_regs; i++)
> > +			cscfg_save_reg(&feat_csdev->regs_csdev[i]);
> > +	}
> >  	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
> >  		feat_csdev->feat_desc->name, "save on disable");
> >  }
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> > index 90fd937d3bd8..0782db3b1b74 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -8,6 +8,7 @@
> >  #define _CORESIGHT_CORESIGHT_CONFIG_H
> >  
> >  #include <linux/coresight.h>
> > +#include <linux/cleanup.h>
> 
> Alphabet order. Move cleanup.h above coresight.h.

okay.

> 
> >  #include <linux/types.h>
> >  
> >  /* CoreSight Configuration Management - component and system wide configuration */
> > @@ -259,4 +260,29 @@ void cscfg_csdev_disable_config(struct cscfg_config_csdev *config_csdev);
> >  /* reset a feature to default values */
> >  void cscfg_reset_feat(struct cscfg_feature_csdev *feat_csdev);
> >  
> > +#define feat_csdev_lock(feat_csdev, flags)				\
> 
> Could use inline here?
> 
> static inline void feat_csdev_lock_irqsave(..., unsigned long *flags)
> {
>     ...
> }

I think this is much annyoing. since the deference might add more
instruction to save the flags. Otherwise the typecheck is for
compilet-time check and not for runtime.

So, it would be better to remain as-is.

> 
> > +	do {								\
> > +		raw_spinlock_t *__lock = feat_csdev->drv_spinlock;	\
> > +		typecheck(unsigned long, flags);			\
> 
> After using inline, no need typecheck.
> 
> > +		if (__lock)						\
> > +			raw_spin_lock_irqsave(__lock, flags);		\
> > +		else							\
> > +			local_irq_save(flags);				\
> 
> If __lock is NULL, do we still need local_irq_save()? Seems to me, if
> lock is NULL pointer, it means no race condition.

Yeap. When I check again it doesn't need to disable the irq.
I'll remove it.

> > +	} while (0)
> 
> > +
> > +#define feat_csdev_unlock(feat_csdev, flags)				\
> > +	do {								\
> > +		raw_spinlock_t *__lock = feat_csdev->drv_spinlock;	\
> > +		typecheck(unsigned long, flags);			\
> > +		if (__lock)						\
> > +			raw_spin_unlock_irqrestore(__lock, flags);	\
> > +		else							\
> > +			local_irq_restore(flags);			\
> > +	} while (0)
> 
> Use inline for feat_csdev_unlock() and rename it to
> feat_csdev_unlock_irqrestore().

See above please.

> 
> Otherwise, LGTM.

Thanks!

-- 
Sincerely,
Yeoreum Yun

