Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D51ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJwu8d1VjBax/Ax6CR+cICNdpcd/l+NLfncjdeH7A50=; b=lF/eO+7isvgxOnOOZtG3gGnHLc
	7LG3U4ijb+yfnlUQNPQI1BA/JCy1+XiEah74W2L4jM02Z+9rZ1gY1y6aP0t546wOhTfvNvLrJFqPK
	QD00C1I8oP6cNpsskkQhcWz5swQF4+F0+ZIwzSx7F5l3HpA5423uoaC6Jn69wBZi/Z+TRGHGjRfGh
	gEhdq91spEB+G+u5m9pAtcJedIbl3bnj8el8f14RxNTIQxJPTDaqfOaJhzBzdk8k/1pnNh+YybdR9
	wOxXUXiO0XOTbcS7I+bAYxlLIaOU1bvOS/tIIZblUQLzHSzE/sfBFcDqO6XF8YnAP0lng1hRxrcfs
	u8ytaJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAI3-00000004iv6-2My8;
	Mon, 15 Sep 2025 14:34:47 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAI0-00000004i5r-2FU5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:34:46 +0000
Message-ID: <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757946689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJwu8d1VjBax/Ax6CR+cICNdpcd/l+NLfncjdeH7A50=;
	b=ss5Vh4eeOZKx6HgcOhOkRAJVN6+ggHzufq/oqcvjmuKWO+zWvrOM6c9GdnJ+jA6tVb7JqP
	CXTLb/lsTDjYdjA7KenrPD+OXvSsekM3jDyfDsuVJ4KJHKXyX12j2zlkgdFnyFtGhk//9Y
	hY7UE3aXf9w5gE6aTAlziQvoiGJfB5k=
Date: Mon, 15 Sep 2025 10:31:24 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Linu Cherian <lcherian@marvell.com>,
 linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250915095820.GH12516@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073444_854761_204997CD 
X-CRM114-Status: GOOD (  41.15  )
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

On 9/15/25 05:58, Leo Yan wrote:
> On Fri, Sep 12, 2025 at 11:13:14AM -0400, Sean Anderson wrote:
>> coresight_panic_cb is called with interrupts disabled during panics.
>> However, bus_for_each_dev calls bus_to_subsys which takes
>> bus_kset->list_lock without disabling IRQs. This may cause a deadlock.
> 
> I would rephrase it to make it clearer for anyone reading it later:
> 
>   coresight_panic_cb() is called during panics, which can preempt a flow
>   that triggers exceptions (such as data or instruction aborts).

I don't see what exceptions have to do with it. You can also panic
during a regular interrupt.

>   However, bus_for_each_dev() calls bus_to_subsys(), which takes
>   'bus_kset->list_lock'. If a panic occurs after the lock has been
>   acquired, it will cause a deadlock.
> 
>> Instead of adding a panic API for coresight devices, just have coresight
>> drivers that need a panic callback register directly with the panic
>> notifier.
>> 
>> Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
>> Fixes: 6dbcbcfc4496 ("coresight: tmc: Enable panic sync handling")
> 
> Let us fix the bug caused by the commit 46006ceb5d02. OTOH, I think we
> should not touch change introduced in the commit 6dbcbcfc4496.

They are the same change. The API is introduced in one and the only users
are added in the other.

> Please see details below.
> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v3:
>> - Rewrite patch to remove the panic sync API entirely
>> 
>> Changes in v2:
>> - Add a comment describing csdev_lock/list
>> - Consolidate list removal in coresight_device_release
>> 
>>  drivers/hwtracing/coresight/coresight-core.c  | 42 -------------------
>>  .../hwtracing/coresight/coresight-tmc-core.c  | 20 ++++++++-
>>  .../hwtracing/coresight/coresight-tmc-etf.c   | 12 +++---
>>  .../hwtracing/coresight/coresight-tmc-etr.c   | 12 +++---
>>  drivers/hwtracing/coresight/coresight-tmc.h   | 10 ++++-
>>  include/linux/coresight.h                     | 11 +----
>>  6 files changed, 38 insertions(+), 69 deletions(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index fa758cc21827..297af270bf3d 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -19,7 +19,6 @@
>>  #include <linux/property.h>
>>  #include <linux/delay.h>
>>  #include <linux/pm_runtime.h>
>> -#include <linux/panic_notifier.h>
>>  
>>  #include "coresight-etm-perf.h"
>>  #include "coresight-priv.h"
>> @@ -1563,36 +1562,6 @@ const struct bus_type coresight_bustype = {
>>  	.name	= "coresight",
>>  };
>>  
>> -static int coresight_panic_sync(struct device *dev, void *data)
>> -{
>> -	int mode;
>> -	struct coresight_device *csdev;
>> -
>> -	/* Run through panic sync handlers for all enabled devices */
>> -	csdev = container_of(dev, struct coresight_device, dev);
>> -	mode = coresight_get_mode(csdev);
>> -
>> -	if ((mode == CS_MODE_SYSFS) || (mode == CS_MODE_PERF)) {
>> -		if (panic_ops(csdev))
>> -			panic_ops(csdev)->sync(csdev);
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static int coresight_panic_cb(struct notifier_block *self,
>> -			       unsigned long v, void *p)
>> -{
>> -	bus_for_each_dev(&coresight_bustype, NULL, NULL,
>> -				 coresight_panic_sync);
>> -
>> -	return 0;
>> -}
>> -
>> -static struct notifier_block coresight_notifier = {
>> -	.notifier_call = coresight_panic_cb,
>> -};
>> -
>>  static int __init coresight_init(void)
>>  {
>>  	int ret;
>> @@ -1605,20 +1574,11 @@ static int __init coresight_init(void)
>>  	if (ret)
>>  		goto exit_bus_unregister;
>>  
>> -	/* Register function to be called for panic */
>> -	ret = atomic_notifier_chain_register(&panic_notifier_list,
>> -					     &coresight_notifier);
>> -	if (ret)
>> -		goto exit_perf;
>> -
>>  	/* initialise the coresight syscfg API */
>>  	ret = cscfg_init();
>>  	if (!ret)
>>  		return 0;
>>  
>> -	atomic_notifier_chain_unregister(&panic_notifier_list,
>> -					     &coresight_notifier);
>> -exit_perf:
>>  	etm_perf_exit();
>>  exit_bus_unregister:
>>  	bus_unregister(&coresight_bustype);
>> @@ -1628,8 +1588,6 @@ static int __init coresight_init(void)
>>  static void __exit coresight_exit(void)
>>  {
>>  	cscfg_exit();
>> -	atomic_notifier_chain_unregister(&panic_notifier_list,
>> -					     &coresight_notifier);
>>  	etm_perf_exit();
>>  	bus_unregister(&coresight_bustype);
>>  }
> 
> Removing panic notifier in coresight-core.c looks good to me.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 88afb16bb6be..012f76dbf7d3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/fs.h>
>>  #include <linux/miscdevice.h>
>>  #include <linux/mutex.h>
>> +#include <linux/panic_notifier.h>
>>  #include <linux/property.h>
>>  #include <linux/uaccess.h>
>>  #include <linux/slab.h>
>> @@ -834,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>  		desc.type = CORESIGHT_DEV_TYPE_SINK;
>>  		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
>>  		desc.ops = &tmc_etr_cs_ops;
>> +		drvdata->panic_notifier.notifier_call = tmc_panic_sync_etr;
>>  		ret = tmc_etr_setup_caps(dev, devid, &desc.access);
>>  		if (ret)
>>  			goto out;
>> @@ -847,6 +849,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>  		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>>  		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>>  		desc.ops = &tmc_etf_cs_ops;
>> +		drvdata->panic_notifier.notifier_call = tmc_panic_sync_etf;
>>  		dev_list = &etf_devs;
>>  		break;
>>  	default:
>> @@ -869,11 +872,18 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>  	dev->platform_data = pdata;
>>  	desc.pdata = pdata;
>>  
>> +	if (drvdata->panic_notifier.notifier_call) {
>> +		ret = atomic_notifier_chain_register(&panic_notifier_list,
>> +						     &drvdata->panic_notifier);
>> +		if (ret)
>> +			goto out;
>> +	}
> 
> When I review this patch, I recognize we can consolidate panic notifier
> in coresight-tmc-core.c, so we don't need to distribute the changes
> into ETF and ETR drivers (sorry if I misled you in my previous reply).

And this kind of thing is why I went with the straightforward fix
initially. I do not want to bikeshed the extent that this gets removed.
IMO the whole "panic ops" stuff should be done directly with the panic
notifier, hence this patch. If you do not agree with that, then ack v2
and send a follow up of your own to fix it how you see fit.

--Sean

> How about we change like below? We still can keep the panic_ops
> callback, and then register a common callback tmc_panic_cb(), which
> still checks device state and invoke device's sync callback.
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index bd783c9dcb56..f7c175b3ae4c 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -21,6 +21,7 @@
>  #include <linux/slab.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/spinlock.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -769,6 +770,22 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
>  			"Valid crash tracedata found\n");
>  }
>  
> +static int tmc_panic_cb(struct notifier_block *nb, unsigned long v, void *p)
> +{
> +	struct tmc_drvdata *drvdata = container_of(nb, struct tmc_drvdata,
> +						   panic_notifier);
> +	struct coresight_device *csdev = drvdata->csdev;
> +	int mode = coresight_get_mode(csdev);
> +
> +	if (mode == CS_MODE_DISABLED)
> +		return 0;
> +
> +	if (panic_ops(csdev))
> +		panic_ops(csdev)->sync(csdev);
> +
> +	return 0;
> +}
> +
>  static int __tmc_probe(struct device *dev, struct resource *res)
>  {
>  	int ret = 0;
> @@ -886,6 +903,12 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  		goto out;
>  	}
>  
> +        if (panic_ops(drvdata->csdev)) {
> +		drvdata->panic_notifier.notifier_call = tmc_panic_cb;
> +		atomic_notifier_chain_register(&panic_notifier_list,
> +					       &drvdata->panic_notifier);
> +	}
> +
>  out:
>  	if (is_tmc_crashdata_valid(drvdata) &&
>  	    !tmc_prepare_crashdata(drvdata))
> @@ -930,6 +953,10 @@ static void __tmc_remove(struct device *dev)
>  {
>  	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
>  
> +	if (panic_ops(drvdata->csdev))
> +		atomic_notifier_chain_unregister(&panic_notifier_list,
> +						 &drvdata->panic_notifier);
> +
>  	/*
>  	 * Since misc_open() holds a refcount on the f_ops, which is
>  	 * etb fops in this case, device is there until last file
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index cbb4ba439158..873c5427673c 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -243,6 +243,7 @@ struct tmc_resrv_buf {
>   *		(after crash) by default.
>   * @crash_mdata: Reserved memory for storing tmc crash metadata.
>   *		 Used by ETR/ETF.
> + * @panic_notifier: Notifier used to clean up during a panic
>   */
>  struct tmc_drvdata {
>  	struct clk		*atclk;
> @@ -273,6 +274,7 @@ struct tmc_drvdata {
>  	struct etr_buf		*perf_buf;
>  	struct tmc_resrv_buf	resrv_buf;
>  	struct tmc_resrv_buf	crash_mdata;
> +	struct notifier_block	panic_notifier;
>  };
>  
>  struct etr_buf_operations {

