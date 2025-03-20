Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692CDC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 21:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYIFpIGg7Pw4Ms94S3HA9G4NSedkMEmXDo8W6VlYbjw=; b=bfWYsyzue8tJW9Xn23liO30Wf2
	3KtDW4eBfIYFJ4sRq65CosP3vCLu1uwYDLGSz0RaqPcT7p1VIQP06CbLD1kN9vg7gwdkHXA2IiH1A
	K4AEj8fFzXQEiF00t+4tpCwEumWSSEMdpq3SKVKd3o72u4QcGrdeKEKLAd0vGE0D0lrczqZEWdnRK
	+U/CjiJA7hzWKI92j/o9vCX/XkA8MuG1ehVBVLqQLUYcDJ8aLjRTVOzlZwuJnaG6OnsUnx2GHQd5u
	UpldeZwD9FeSfCyeqBqseaVcBjvl8jc/lgSv7V+8piiSxZ15rRmFBJgGU0KgnsXJAoEHV5CYQd9t6
	6xMIr6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNEY-0000000DEEf-13FY;
	Thu, 20 Mar 2025 21:15:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNCr-0000000DE5Y-04bX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 21:13:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57F87A496EA;
	Thu, 20 Mar 2025 21:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F231C4CEDD;
	Thu, 20 Mar 2025 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742505215;
	bh=qT3pRQIRt1i35oXtu0ODXFreqqI/+Y7zQS4P0enG44U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaMJ49FB16G+FlJRuy97OCfjA+ZbWBl3XVzcBMcaKwrB06G5d36541muYB5cmaXHu
	 YMMt/nHuOhUyOpB+eQ4xO2cyWMn+axk3d7aTdXz2tEEpUBygHFk0M9oDEEwHS0uJPd
	 EKgLazyXP8IsrH66Cm5uouuHXXVNfRPzAwLWxRrU=
Date: Thu, 20 Mar 2025 14:12:15 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	james.morse@arm.com, conor@kernel.org,
	Yicong Yang <yangyicong@huawei.com>, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>, linux-mm@kvack.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 3/6] cache: coherency device class
Message-ID: <2025032013-venus-request-b026@gregkh>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
 <20250320174118.39173-4-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320174118.39173-4-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_141337_185440_4C731CC7 
X-CRM114-Status: GOOD (  22.22  )
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

On Thu, Mar 20, 2025 at 05:41:15PM +0000, Jonathan Cameron wrote:
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -1,6 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menu "Cache Drivers"
>  
> +config CACHE_COHERENCY_CLASS
> +	bool "Cache coherency control class"

Why can't this be a module?  And why would anyone want to turn it off?

> +	help
> +	  Class to which coherency control drivers register allowing core kernel
> +	  subsystems to issue invalidations and similar coherency operations.

What "core kernel subsystems"?

> +
>  config AX45MP_L2_CACHE
>  	bool "Andes Technology AX45MP L2 Cache controller"
>  	depends on RISCV

Shouldn't all of these now depend on CACHE_COHERENCY_CLASS?

> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index 55c5e851034d..b72b20f4248f 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -3,3 +3,5 @@
>  obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
>  obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
>  obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
> +
> +obj-$(CONFIG_CACHE_COHERENCY_CLASS)	+= coherency_core.o

Why the blank line?

> diff --git a/drivers/cache/coherency_core.c b/drivers/cache/coherency_core.c
> new file mode 100644
> index 000000000000..52cb4ceae00c
> --- /dev/null
> +++ b/drivers/cache/coherency_core.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Class to manage OS controlled coherency agents within the system.
> + * Specifically to enable operations such as write back and invalidate.
> + *
> + * Copyright: Huawei 2025
> + * Some elements based on fwctl class as an example of a modern
> + * lightweight class.
> + */
> +
> +#include <linux/cache_coherency.h>
> +#include <linux/container_of.h>
> +#include <linux/idr.h>
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include <asm/cacheflush.h>
> +
> +static DEFINE_IDA(cache_coherency_ida);
> +
> +static void cache_coherency_device_release(struct device *device)
> +{
> +	struct cache_coherency_device *ccd =
> +		container_of(device, struct cache_coherency_device, dev);
> +
> +	ida_free(&cache_coherency_ida, ccd->id);
> +}
> +
> +static struct class cache_coherency_class = {
> +	.name = "cache_coherency",
> +	.dev_release = cache_coherency_device_release,
> +};
> +
> +static int cache_inval_one(struct device *dev, void *data)
> +{
> +	struct cache_coherency_device *ccd =
> +		container_of(dev, struct cache_coherency_device, dev);
> +
> +	if (!ccd->ops)
> +		return -EINVAL;
> +
> +	return ccd->ops->wbinv(ccd, data);
> +}
> +
> +static int cache_inval_done_one(struct device *dev, void *data)
> +{
> +	struct cache_coherency_device *ccd =
> +		container_of(dev, struct cache_coherency_device, dev);
> +	if (!ccd->ops)
> +		return -EINVAL;
> +
> +	return ccd->ops->done(ccd);
> +}
> +
> +static int cache_invalidate_memregion(int res_desc,
> +				      phys_addr_t addr, size_t size)
> +{
> +	int ret;
> +	struct cc_inval_params params = {
> +		.addr = addr,
> +		.size = size,
> +	};
> +
> +	ret = class_for_each_device(&cache_coherency_class, NULL, &params,
> +				    cache_inval_one);
> +	if (ret)
> +		return ret;
> +
> +	return class_for_each_device(&cache_coherency_class, NULL, NULL,
> +				     cache_inval_done_one);
> +}
> +
> +static const struct system_cache_flush_method cache_flush_method = {
> +	.invalidate_memregion = cache_invalidate_memregion,
> +};
> +
> +struct cache_coherency_device *
> +_cache_coherency_alloc_device(struct device *parent,
> +			      const struct coherency_ops *ops, size_t size)
> +{
> +
> +	if (!ops || !ops->wbinv)
> +		return NULL;
> +
> +	struct cache_coherency_device *ccd __free(kfree) = kzalloc(size, GFP_KERNEL);
> +
> +	if (!ccd)
> +		return NULL;
> +
> +	ccd->dev.class = &cache_coherency_class;
> +	ccd->dev.parent = parent;
> +	ccd->ops = ops;
> +	ccd->id = ida_alloc(&cache_coherency_ida, GFP_KERNEL);
> +
> +	if (dev_set_name(&ccd->dev, "cache_coherency%d", ccd->id))
> +		return NULL;
> +
> + 	device_initialize(&ccd->dev);
> +
> +	return_ptr(ccd);
> +}
> +EXPORT_SYMBOL_NS_GPL(_cache_coherency_alloc_device, "CACHE_COHERENCY");
> +
> +int cache_coherency_device_register(struct cache_coherency_device *ccd)
> +{
> +	return device_add(&ccd->dev);
> +}
> +EXPORT_SYMBOL_NS_GPL(cache_coherency_device_register, "CACHE_COHERENCY");
> +
> +void cache_coherency_device_unregister(struct cache_coherency_device *ccd)
> +{
> +	device_del(&ccd->dev);
> +}
> +EXPORT_SYMBOL_NS_GPL(cache_coherency_device_unregister, "CACHE_COHERENCY");
> +
> +static int __init cache_coherency_init(void)
> +{
> +	int ret;
> +
> +	ret = class_register(&cache_coherency_class);
> +	if (ret)
> +		return ret;
> +
> +	//TODO: generalize
> +	arm64_set_sys_cache_flush_method(&cache_flush_method);

I'm guessing this will blow up the build on non-x86 builds :)

> +struct cache_coherency_device {
> +	struct device dev;
> +	const struct coherency_ops *ops;
> +	int id;
> +};

Classes are normally for user/kernel apis, what is this going to be used
for?  I don't see any new user/kernel apis happening, so why do you need
a struct device to be created?

thanks,

greg k-h

