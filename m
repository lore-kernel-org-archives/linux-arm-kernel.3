Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE01CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v8C9o6+CzO4FZtK6+YFfUN4nnLR7cjEK5iSDnOvRSI=; b=WH9XDvWH9P/irGjqmywwc0Es38
	nu4WZoKkEqBBDVLU/jNrO5FNtMXQ7KsjsNTyRmgPVTAvCTFwzy3DuDM6yET9rXz7/zrPNTzmUY4dd
	VbzmhZ00f7Ff1wWtO7PeFB5eJJCe9ucmS9otKlIXCZj8D7hACFKLWVHsUbmqYWxKjEoY2gXFQPJiw
	czUtNiD0VBwuyp8uC2kFTAUrLuzRJgbsrCuSSouFidW2CeBUVwHsx0WGWGjEQKmbgbKIrCIMVBCNe
	eP4KZSN8uxx+TzuAWSFIf8M2duZgNPSRkmoIr9tvdncM94aW+qcynY3TgH7k6lle8coXp94hShBrr
	RovD1Wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwO0B-0000000Fbup-0593;
	Wed, 10 Sep 2025 16:48:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwO07-0000000Fbtb-3nAg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:48:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6FA1BF7;
	Wed, 10 Sep 2025 09:48:46 -0700 (PDT)
Received: from [10.57.5.181] (unknown [10.57.5.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C52483F63F;
	Wed, 10 Sep 2025 09:48:53 -0700 (PDT)
Message-ID: <ab3023a8-ebe0-48ac-b725-9f5d34ba94fa@arm.com>
Date: Wed, 10 Sep 2025 17:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix possible deadlock in coresight_panic_cb
Content-Language: en-GB
To: Sean Anderson <sean.anderson@linux.dev>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Linu Cherian <lcherian@marvell.com>, James Clark <james.clark@linaro.org>
References: <20250828181738.1529289-1-sean.anderson@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250828181738.1529289-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_094856_063627_2A6D648F 
X-CRM114-Status: GOOD (  25.72  )
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

Hi Sean

On 28/08/2025 19:17, Sean Anderson wrote:
> coresight_panic_cb is called with interrupts disabled during panics.
> However, bus_for_each_dev calls bus_to_subsys which takes
> bus_kset->list_lock without disabling IRQs. This will cause a deadlock
> if a panic occurs while one of the other coresight functions that uses
> bus_for_each_dev is running.
> 
> Maintain a separate list of coresight devices to access during a panic.

Thanks for the patch. I have a minor comment.

> 
> Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>   drivers/hwtracing/coresight/coresight-core.c | 40 ++++++++++----------
>   include/linux/coresight.h                    |  1 +
>   2 files changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827..1f1bf0e2bf92 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1315,6 +1315,9 @@ void coresight_release_platform_data(struct coresight_device *csdev,
>   		coresight_remove_conns_sysfs_group(csdev);
>   }
>   
> +static DEFINE_SPINLOCK(csdev_lock);
> +static LIST_HEAD(csdev_list);

May be add a comment here to mention why we maintain this list ?

> +
>   struct coresight_device *coresight_register(struct coresight_desc *desc)
>   {
>   	int ret;
> @@ -1374,11 +1377,16 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   		goto out_unlock;
>   	}
>   
> +	scoped_guard(spinlock_irq, &csdev_lock)
> +		list_add(&csdev->csdev_list, &csdev_list);
> +
>   	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
>   	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
>   		ret = etm_perf_add_symlink_sink(csdev);
>   
>   		if (ret) {
> +			scoped_guard(spinlock_irq, &csdev_lock)
> +				list_del(&csdev->csdev_list);
Could this be moved to coresight_device_release(), which will be called
when the device gets unregistered ? That way, you don't need it here
and in coresight_unregister()  too.

Rest looks good to me

Suzuki

>   			device_unregister(&csdev->dev);
>   			/*
>   			 * As with the above, all resources are free'd
> @@ -1427,6 +1435,8 @@ void coresight_unregister(struct coresight_device *csdev)
>   	coresight_remove_conns(csdev);
>   	coresight_clear_default_sink(csdev);
>   	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
> +	scoped_guard(spinlock_irq, &csdev_lock)
> +		list_del(&csdev->csdev_list);
>   	device_unregister(&csdev->dev);
>   }
>   EXPORT_SYMBOL_GPL(coresight_unregister);
> @@ -1563,28 +1573,20 @@ const struct bus_type coresight_bustype = {
>   	.name	= "coresight",
>   };
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
>   static int coresight_panic_cb(struct notifier_block *self,
>   			       unsigned long v, void *p)
>   {
> -	bus_for_each_dev(&coresight_bustype, NULL, NULL,
> -				 coresight_panic_sync);
> +	struct coresight_device *csdev;
> +
> +	guard(spinlock)(&csdev_lock);
> +	list_for_each_entry(csdev, &csdev_list, csdev_list) {
> +		/* Run through panic sync handlers for all enabled devices */
> +		int mode = coresight_get_mode(csdev);
> +
> +		if ((mode == CS_MODE_SYSFS || mode == CS_MODE_PERF) &&
> +		    panic_ops(csdev))
> +			panic_ops(csdev)->sync(csdev);
> +	}
>   
>   	return 0;
>   }
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4ac65c68bbf4..a5e62ebd03b5 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -302,6 +302,7 @@ struct coresight_device {
>   	/* system configuration and feature lists */
>   	struct list_head feature_csdev_list;
>   	struct list_head config_csdev_list;
> +	struct list_head csdev_list;
>   	raw_spinlock_t cscfg_csdev_lock;
>   	void *active_cscfg_ctxt;
>   };


