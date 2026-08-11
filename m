Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D45C5CFE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlVFmHYNA101JeQgx90POXzIJ/GTBET5OuqyCpzrNo4=; b=vKXtYLjqHEYeSn+MIEc/iV9kNV
	GAOxo+lltKBsxrZkD3y1+DJXStwfGMme85qg1PIDGzT6RlCw/mWcuw+bxXFHQcbgXdC8VbUiMAjoQ
	bdAstqUBdUBwVL8V5yy/NDt3H7CL8ChBOpJC3Z1kM/dLfzXnq9QxxjfEOBU1tmqead67/TJU/qJdM
	J9uJR7DI3iqgHQb7p20f67kPmbKl5EoUjR3AS951bUaT8NaTWW/653r7P3NajtupRooHXN7lR667D
	Fg7jIdIKf727nNkRaglzaXx5FiMdvtrQslr7f9fbfJblpIXQTkJqAP1qlsbmESpW7ORiglPjOXuj/
	dcp6zBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofe-0000000ENRd-452x;
	Tue, 11 Aug 2026 15:45:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofO-0000000EMz6-3n4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:45:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235541516;
	Tue, 11 Aug 2026 08:45:20 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5B0B3F632;
	Tue, 11 Aug 2026 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786463124; bh=le+NNPrAYCUZxz1+o/7VIHlKfNijZaFoZCquij3ucIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq33hIGcTmSoNM6mygiLmeEkmMYMUcfhp9X9yt60bvbT/7Au3M6+75VTK8dVnpnYs
	 HzU/5bvz+kdVfsYZYzbVbaIgLDX/tnBL/BtesU5w1x5Q9YojS/t+8uEERwa1YU4qHw
	 qMN+/W9K1PifG/8bOLb8A6bPUut5lkVZVEcwCjrQ=
Date: Tue, 11 Aug 2026 16:45:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 04/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260811154521.GF15499@e132581.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725113645.57519-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084527_134660_86C0A2E1 
X-CRM114-Status: GOOD (  24.99  )
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

On Sat, Jul 25, 2026 at 12:36:36PM +0100, Yeoreum Yun wrote:

[...]

> As the active_config is used for cfg-configfs, etmv4 doesn't need to set
> its lock for the cfg-configfs since the active_config is proceted by cs_mode
> otherwise it would make a possible cpu-stall when it get interrupt while
> setting the sysfs configuration.
> 
> Therefore, set the drv_spinlock for cfg-configfs as NULL and
> let the cfg-configfs disable irq without grap drv_spinlock when it is NULL.

I understand that this patch tries to put all the changes (active_config
and drv_spinlock) into a single patch so that it can be backported to
stable kernels.

However, the change is now quite large, and I suspect it will also be
difficult for maintainers to backport it to stable kernels. The fixes
tag 54ff892b76c6 is quite old, while this patch also touches cfgfs
which was introduced much later.

Can we treat this as a refactoring instead and split it into at least
two patches? This would make it easier to review now and easier to
understand later if someone will read the changes.

 - Lock refactoring
 - SMP call refactoring
 - active_config refactoring

>  static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
>  {
> -	unsigned long flags;
>  	int i;
>  
> -	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> -	for (i = 0; i < feat_csdev->nr_regs; i++)
> -		cscfg_set_reg(&feat_csdev->regs_csdev[i]);
> -	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> +	scoped_guard (feat_csdev_lock, feat_csdev) {

scoped_guard(feat_csdev_lock, feat_csdev) {

> +		for (i = 0; i < feat_csdev->nr_regs; i++)
> +			cscfg_set_reg(&feat_csdev->regs_csdev[i]);
> +	}
>  	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
>  		feat_csdev->feat_desc->name, "set on enable");
>  	return 0;
> @@ -88,13 +87,12 @@ static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
>  /* copy back values from the driver locations referenced in cscfg_reg_csdev */
>  static void cscfg_save_on_disable(struct cscfg_feature_csdev *feat_csdev)
>  {
> -	unsigned long flags;
>  	int i;
>  
> -	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> -	for (i = 0; i < feat_csdev->nr_regs; i++)
> -		cscfg_save_reg(&feat_csdev->regs_csdev[i]);
> -	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> +	scoped_guard (feat_csdev_lock, feat_csdev) {

scoped_guard(feat_csdev_lock, feat_csdev) {

> +		for (i = 0; i < feat_csdev->nr_regs; i++)
> +			cscfg_save_reg(&feat_csdev->regs_csdev[i]);
> +	}
>  	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
>  		feat_csdev->feat_desc->name, "save on disable");
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index 90fd937d3bd8..0782db3b1b74 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -8,6 +8,7 @@
>  #define _CORESIGHT_CORESIGHT_CONFIG_H
>  
>  #include <linux/coresight.h>
> +#include <linux/cleanup.h>

Alphabet order. Move cleanup.h above coresight.h.

>  #include <linux/types.h>
>  
>  /* CoreSight Configuration Management - component and system wide configuration */
> @@ -259,4 +260,29 @@ void cscfg_csdev_disable_config(struct cscfg_config_csdev *config_csdev);
>  /* reset a feature to default values */
>  void cscfg_reset_feat(struct cscfg_feature_csdev *feat_csdev);
>  
> +#define feat_csdev_lock(feat_csdev, flags)				\

Could use inline here?

static inline void feat_csdev_lock_irqsave(..., unsigned long *flags)
{
    ...
}

> +	do {								\
> +		raw_spinlock_t *__lock = feat_csdev->drv_spinlock;	\
> +		typecheck(unsigned long, flags);			\

After using inline, no need typecheck.

> +		if (__lock)						\
> +			raw_spin_lock_irqsave(__lock, flags);		\
> +		else							\
> +			local_irq_save(flags);				\

If __lock is NULL, do we still need local_irq_save()? Seems to me, if
lock is NULL pointer, it means no race condition.

> +	} while (0)

> +
> +#define feat_csdev_unlock(feat_csdev, flags)				\
> +	do {								\
> +		raw_spinlock_t *__lock = feat_csdev->drv_spinlock;	\
> +		typecheck(unsigned long, flags);			\
> +		if (__lock)						\
> +			raw_spin_unlock_irqrestore(__lock, flags);	\
> +		else							\
> +			local_irq_restore(flags);			\
> +	} while (0)

Use inline for feat_csdev_unlock() and rename it to
feat_csdev_unlock_irqrestore().

Otherwise, LGTM.

Thanks,
Leo

