Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33A2C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhGAkZhd+c7Gpv29Jc9g1Hdi/vq/IM5iDuyQnOFO/O4=; b=vPg14utteKt4GeTlF5zGGQ2MHm
	UoC/s8c5TiZiPDSQN7xJKDIde0UEHHurYwHr6vR88iExEzvHaKtz3DvKeRbpI3BcW6Kd2sBm777Ph
	w9ImaWuxSVKXu6k6VcM9nnuVtiToSLZyr7N3jlv0Qjo/VzpgwEgdqj8Rt2kr7PcK/j/ud86ugP+3m
	WIMDdlwmPTaiw3oHEH/7aaBk79dSruxvpUksvD6pA3jnXgcekzRJjYfD/Il0auuymu95RUAX4/ckM
	DjxX85lLSZn95O/I5ynGSJcrzuhrOhy9U5ahkXo70168U/pED7ZzesnHWAmJDTpu+J3UJeZZ8c7fv
	fsITqKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3g-0000000F01p-03oN;
	Wed, 14 May 2025 12:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Cm-0000000EdH4-3jqm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:15:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 109D715A1;
	Wed, 14 May 2025 02:15:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB213F5A1;
	Wed, 14 May 2025 02:15:11 -0700 (PDT)
Date: Wed, 14 May 2025 10:15:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] coresight: holding cscfg_csdev_lock while
 removing cscfg from csdev
Message-ID: <20250514091509.GD26114@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513170622.3071637-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_021512_976616_495DD998 
X-CRM114-Status: GOOD (  16.24  )
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

On Tue, May 13, 2025 at 06:06:21PM +0100, Yeoreum Yun wrote:
> There'll be possible race scenario for coresight config:
> 
> CPU0                                          CPU1
> (perf enable)                                 load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
>   lock(csdev->cscfg_csdev_lock)
>                                               deactivate config // sysfs
>                                               (sys_activec_cnt == 0)
>                                               cscfg_unload_config_sets()
>   <iterating config_csdev_list>               cscfg_remove_owned_csdev_configs()
>   // here load config activate by CPU1
>   unlock(csdev->cscfg_csdev_lock)
> 
> iterating config_csdev_list could be raced with config_csdev_list's
> entry delete.
> 
> To resolve this race , hold csdev->cscfg_csdev_lock() while
> cscfg_remove_owned_csdev_configs()
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
> ---
>  drivers/hwtracing/coresight/coresight-syscfg.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a70c1454b410..5d194b9269f5 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
>  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
>  {
>  	struct cscfg_config_csdev *config_csdev, *tmp;
> +	unsigned long flags;
>  
>  	if (list_empty(&csdev->config_csdev_list))
>  		return;
>  
> +	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);

Could we use the format:

   guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);

Sorry I did not mention this in the earlier review.  Otherwise:

Reviewed-by: Leo Yan <leo.yan@arm.com>

>  	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
>  		if (config_csdev->config_desc->load_owner == load_owner)
>  			list_del(&config_csdev->node);
>  	}
> +	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);


>  }
>  
>  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

