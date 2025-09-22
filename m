Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AEACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERYPWxcYDyrF9wbUs3twqfQOYGQBT+BnaPffPDlJxpI=; b=bLmlWnPv77pHDIGY8wLViyIq55
	jSxV8c5hn+GzXblVOVS4vN4/sG4iQwvYwHP81GY2QzmTsOt8BeFJl4opqb83Jji2pW857dR36INYi
	uFUU0tTT2nhPxR/GwGJQXw3jZ65f0eXF3GQaydT9tYC4bZBblU2C4DxixQrGWqlSd/OYdAeou0CHP
	gIs2AGSofNGVo6/5S2camuA4RD67PuRhEr0ilMcAzf9VW2NUrnXMOc28ZHC3EJfXeBAPmBZq14VG9
	G9P/e9EFOArzbgfHZ2dbjspniDvWEfYfdbtH90mCisGUFiMFp1FNvHCC07QPAgzcWzjgq8WOxrWGv
	s/Zp+kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ds9-0000000A3cW-3qSR;
	Mon, 22 Sep 2025 10:34:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ds7-0000000A3bX-3or1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:34:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 044EF497;
	Mon, 22 Sep 2025 03:34:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6B673F66E;
	Mon, 22 Sep 2025 03:34:14 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:34:12 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] coresight: Fix possible deadlock in
 coresight_panic_cb
Message-ID: <20250922103412.GF516577@e132581.arm.com>
References: <20250919160653.507109-1-sean.anderson@linux.dev>
 <20250919160653.507109-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919160653.507109-3-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_033416_038346_31ED8926 
X-CRM114-Status: GOOD (  26.17  )
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

On Fri, Sep 19, 2025 at 12:06:53PM -0400, Sean Anderson wrote:

[...]

> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 022c8384b98d..6dfb1198c16e 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1046,8 +1046,11 @@ static void coresight_device_release(struct device *dev)
>  {
>  	struct coresight_device *csdev = to_coresight_device(dev);
>  
> -	fwnode_handle_put(csdev->dev.fwnode);
> +	if (panic_ops(csdev))
> +		atomic_notifier_chain_unregister(&panic_notifier_list,
> +						 &csdev->panic_notifier);
>  	free_percpu(csdev->perf_sink_id_map.cpu_map);
> +	fwnode_handle_put(csdev->dev.fwnode);

The moving fwnode_handle_put() is irrelvant to panic notifier fix,
should be moved out from this patch.

>  	kfree(csdev);
>  }
>  
> @@ -1315,6 +1318,16 @@ void coresight_release_platform_data(struct coresight_device *csdev,
>  		coresight_remove_conns_sysfs_group(csdev);
>  }
>  
> +static int coresight_panic_notifier(struct notifier_block *nb,
> +				    unsigned long action, void *data)
> +{
> +	struct coresight_device *csdev =
> +		container_of(nb, struct coresight_device, panic_notifier);
> +

Need to check device mode:

        if (coresight_get_mode(csdev) == CS_MODE_DISABLED)
            return NOTIFY_DONE;

The rest is fine for me.

Thanks,
Leo

> +	panic_ops(csdev)->sync(csdev);
> +	return NOTIFY_DONE;
> +}
> +
>  struct coresight_device *coresight_register(struct coresight_desc *desc)
>  {
>  	int ret;
> @@ -1357,6 +1370,17 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>  			goto err_out;
>  		}
>  	}
> +
> +	if (panic_ops(csdev)) {
> +		csdev->panic_notifier.notifier_call = coresight_panic_notifier;
> +		ret = atomic_notifier_chain_register(&panic_notifier_list,
> +						     &csdev->panic_notifier);
> +		if (ret) {
> +			coresight_device_release(&csdev->dev);
> +			goto err_out;
> +		}
> +	}
> +
>  	/*
>  	 * Make sure the device registration and the connection fixup
>  	 * are synchronised, so that we don't see uninitialised devices
> @@ -1563,36 +1587,6 @@ const struct bus_type coresight_bustype = {
>  	.name	= "coresight",
>  };
>  
> -static int coresight_panic_sync(struct device *dev, void *data)
> -{
> -	int mode;
> -	struct coresight_device *csdev;
> -
> -	/* Run through panic sync handlers for all enabled devices */
> -	csdev = container_of(dev, struct coresight_device, dev);
> -	mode = coresight_get_mode(csdev);
> -
> -	if ((mode == CS_MODE_SYSFS) || (mode == CS_MODE_PERF)) {
> -		if (panic_ops(csdev))
> -			panic_ops(csdev)->sync(csdev);
> -	}
> -
> -	return 0;
> -}
> -
> -static int coresight_panic_cb(struct notifier_block *self,
> -			       unsigned long v, void *p)
> -{
> -	bus_for_each_dev(&coresight_bustype, NULL, NULL,
> -				 coresight_panic_sync);
> -
> -	return 0;
> -}
> -
> -static struct notifier_block coresight_notifier = {
> -	.notifier_call = coresight_panic_cb,
> -};
> -
>  static int __init coresight_init(void)
>  {
>  	int ret;
> @@ -1605,20 +1599,11 @@ static int __init coresight_init(void)
>  	if (ret)
>  		goto exit_bus_unregister;
>  
> -	/* Register function to be called for panic */
> -	ret = atomic_notifier_chain_register(&panic_notifier_list,
> -					     &coresight_notifier);
> -	if (ret)
> -		goto exit_perf;
> -
>  	/* initialise the coresight syscfg API */
>  	ret = cscfg_init();
>  	if (!ret)
>  		return 0;
>  
> -	atomic_notifier_chain_unregister(&panic_notifier_list,
> -					     &coresight_notifier);
> -exit_perf:
>  	etm_perf_exit();
>  exit_bus_unregister:
>  	bus_unregister(&coresight_bustype);
> @@ -1628,8 +1613,6 @@ static int __init coresight_init(void)
>  static void __exit coresight_exit(void)
>  {
>  	cscfg_exit();
> -	atomic_notifier_chain_unregister(&panic_notifier_list,
> -					     &coresight_notifier);
>  	etm_perf_exit();
>  	bus_unregister(&coresight_bustype);
>  }
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4ac65c68bbf4..a7aaf9d3d01d 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -280,6 +280,7 @@ struct coresight_trace_id_map {
>   * @config_csdev_list:  List of system configurations added to the device.
>   * @cscfg_csdev_lock:	Protect the lists of configurations and features.
>   * @active_cscfg_ctxt:  Context information for current active system configuration.
> + * @panic_notifier: Notifier block used to clean up during a panic
>   */
>  struct coresight_device {
>  	struct coresight_platform_data *pdata;
> @@ -304,6 +305,7 @@ struct coresight_device {
>  	struct list_head config_csdev_list;
>  	raw_spinlock_t cscfg_csdev_lock;
>  	void *active_cscfg_ctxt;
> +	struct notifier_block panic_notifier;
>  };
>  
>  /*
> -- 
> 2.35.1.1320.gc452695387.dirty
> 

