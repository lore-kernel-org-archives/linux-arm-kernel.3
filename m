Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F7AE64A85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgvloqEbcG0ET8abPGxJ4MLJMX0IpTlMrXMiXpJxduA=; b=amkpFQAJ7dKvYCdhalmyMrZD/v
	CFQRyyPREFgg8nSSpM7DLMCpWcGnwyqILngTMZbijNAUr0+MvSZ+vAxob45ncsBllo6BOcJ6k7MqX
	cJ9o7MQvcnfCySzarmeCII98cbgfupqWRX1GVknqljYZy344aGwco2ptydl82ovO/0lXPdpPM/NK3
	dYLKnt6n2jmkm3K/+MMAead4BBW+2ENpUN2qtp3poVbrqsIGDNlY6A0M46br+8+D/3bFnWVufffju
	KTzTFUVSQx9PtXdMErTx/yi+4ViapcfAUKgU3sFGY+GYv0t9jBtUhBwQCE+oEKvnXXuzwuhOhjkZY
	by03EN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRwe-00000009PwP-30yn;
	Tue, 03 Dec 2024 12:24:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRn3-00000009Nla-34wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:14:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E5B3FEC;
	Tue,  3 Dec 2024 04:14:31 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21493F58B;
	Tue,  3 Dec 2024 04:14:02 -0800 (PST)
Date: Tue, 3 Dec 2024 12:14:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/3] firmware/arm_ffa: change ffa_device_register()'s
 parameters and return
Message-ID: <Z072CGn6fhnT0hED@bogus>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
 <20241125095251.366866-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125095251.366866-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041405_873579_7C68C0BD 
X-CRM114-Status: GOOD (  27.69  )
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

On Mon, Nov 25, 2024 at 09:52:49AM +0000, Yeoreum Yun wrote:
> From: Levi Yun <yeoreum.yun@arm.com>
> 
> Currently, ffa_dev->properties is set after ffa_device_register() in
> ffa_setup_partitions().
> This means it couldn't validate partition's properties
> while probing ffa_device.
> 
> Change parameter of ffa_device_register() to receive ffa_partition_info
> so that before device_register(), ffa_device->properties can be setup
> and any other data.
> 
> Also, change return value of ffa_device_register() from NULL to ERR_PTR
> so that it passes error code.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/firmware/arm_ffa/bus.c    | 22 +++++++++++++++-------
>  drivers/firmware/arm_ffa/driver.c | 12 ++++--------
>  include/linux/arm_ffa.h           | 12 ++++++++----
>  3 files changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
> index eb17d03b66fe..95c0e9518556 100644
> --- a/drivers/firmware/arm_ffa/bus.c
> +++ b/drivers/firmware/arm_ffa/bus.c
> @@ -38,6 +38,7 @@ static int ffa_device_match(struct device *dev, const struct device_driver *drv)
>  
>  		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
>  			return 1;
> +

Spurious, don't add formatting or style changes in functional change. We
can take it up later when there are other formatting issues.

>  		id_table++;
>  	}
>  
> @@ -187,21 +188,26 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev)
>  	return valid;
>  }
>  
> -struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
> -				       const struct ffa_ops *ops)
> +struct ffa_device *ffa_device_register(
> +		const struct ffa_partition_info *part_info,
> +		const struct ffa_ops *ops)
>  {
>  	int id, ret;
> +	uuid_t uuid;
>  	struct device *dev;
>  	struct ffa_device *ffa_dev;
>  
> +	if (!part_info)
> +		return ERR_PTR(-EINVAL);
> +
>  	id = ida_alloc_min(&ffa_bus_id, 1, GFP_KERNEL);
>  	if (id < 0)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	ffa_dev = kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
>  	if (!ffa_dev) {
>  		ida_free(&ffa_bus_id, id);
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);

I am not keen on changing the error from NULL here. -ENOMEM has its own
logging. ida_alloc failing is very unlikely unless you have so many
partitions in the system.

>  	}
>  
>  	dev = &ffa_dev->dev;
> @@ -210,16 +216,18 @@ struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
>  	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
>  
>  	ffa_dev->id = id;
> -	ffa_dev->vm_id = vm_id;
> +	ffa_dev->vm_id = part_info->id;
> +	ffa_dev->properties = part_info->properties;
>  	ffa_dev->ops = ops;
> -	uuid_copy(&ffa_dev->uuid, uuid);
> +	import_uuid(&uuid, (u8 *)part_info->uuid);
> +	uuid_copy(&ffa_dev->uuid, &uuid);
>  
>  	ret = device_register(&ffa_dev->dev);
>  	if (ret) {
>  		dev_err(dev, "unable to register device %s err=%d\n",
>  			dev_name(dev), ret);

This error log will give the information you are adding in driver.c, so
it is again not needed to change that.

>  		put_device(dev);
> -		return NULL;
> +		return ERR_PTR(ret);
>  	}
>  
>  	return ffa_dev;
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index b14cbdae94e8..a3a9cdec7389 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1406,23 +1406,19 @@ static int ffa_setup_partitions(void)
>  
>  	xa_init(&drv_info->partition_info);
>  	for (idx = 0, tpbuf = pbuf; idx < count; idx++, tpbuf++) {
> -		import_uuid(&uuid, (u8 *)tpbuf->uuid);
> -
>  		/* Note that if the UUID will be uuid_null, that will require
>  		 * ffa_bus_notifier() to find the UUID of this partition id
>  		 * with help of ffa_device_match_uuid(). FF-A v1.1 and above
>  		 * provides UUID here for each partition as part of the
>  		 * discovery API and the same is passed.
>  		 */
> -		ffa_dev = ffa_device_register(&uuid, tpbuf->id, &ffa_drv_ops);
> -		if (!ffa_dev) {
> -			pr_err("%s: failed to register partition ID 0x%x\n",
> -			       __func__, tpbuf->id);
> +		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops);
> +		if (IS_ERR_OR_NULL(ffa_dev)) {
> +			pr_err("%s: failed to register partition ID 0x%x, error %ld\n",
> +			       __func__, tpbuf->id, PTR_ERR(ffa_dev));

Drop this additional error info you are adding as bus.c will provide it.

-- 
Regards,
Sudeep

