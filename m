Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9Gi2lbBe8f7wfuW3GwYiZMF6A9fJI+RtqlNyAWo58E=; b=W+o2myF6+KmckwSFMmd53ojpbi
	QRJ8vv4sGmjVyYPos7iDgeRHLoZsTUIklKDilBp+SsDdNO5pf4ovEASuZ2qLUoc3u0b3KYhrRInoy
	oTETi26pnBwBxff3+h8exe5ZWZEoAo1dlMtZrMHm0e0woqCNQyN8bhcIh1rnG4GzqMms+slRfMJG8
	2BPx5Gv4TI2Y+g7yFVFScDWd4R/9tRyz+OUW6movr9DcaZAdHpfRUepdBuOhuCSI1eXhCCkErggmz
	zlywiXhFFnMTLhpVV/3k5Lk9ry+2Zux6Low3XmxSmb23AclQjQKjLUdC0QUh832wxIh2oNDZ5OgSa
	e/XvtuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6q2-00000009SLF-0vYJ;
	Mon, 16 Dec 2024 08:52:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6oU-00000009SD4-0pOd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 08:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B9Gi2lbBe8f7wfuW3GwYiZMF6A9fJI+RtqlNyAWo58E=; b=csVngC2lNbKoIP12izDa/11ndm
	vunxNcB54Et2DIYFMmmEqdWZgqQ5JM6wubxmjbB2nFENu47s3EUXSBlRXLjSVdY9etjPRoZuN9QwF
	uAGupBOh2keJeOv1460xpkgF1NB/XRwGhXuDXBMNL2xOZ1LnUAINW/yT+VGshwD+0Z7D5o2bAmL8I
	vL3C01IneZHnbZiQD2HNDhKKH6Vq1s/wek2VmIFsSRRX8Gu3ESiN6NQ+pu76cW8BgNRijAcJrN2td
	LOvkYqdnqDLt6yessoBm4TdBf070Rsc941mOzGvCdu56FylH0noLKmwc3cpr2D2nkyFX2tQ8RODGr
	8U8yiKKA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6oQ-00000004nyA-1edD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:50:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D7B1113E;
	Mon, 16 Dec 2024 00:51:11 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F463F720;
	Mon, 16 Dec 2024 00:50:41 -0800 (PST)
Date: Mon, 16 Dec 2024 08:50:26 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: guomin_chen@sina.com
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <Z1_p0nU93PHJ4Sg_@pluto>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216073745.2973317-1-guomin_chen@sina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085046_885805_0CCE4B67 
X-CRM114-Status: GOOD (  20.03  )
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

On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrote:
> From: guomin chen <guomin_chen@sina.com>
> 
> Currently, scmi_bus_id is only used to set scmi_dev.id,
> which in turn sets the SCMI device name. After removing
> scmi_bus_id, it is clearer and more meaningful to directly
> use the unique tuple [Parent name,device name, protocol] to 
> set the SCMI device name.
> 

Hi Guomin,

this same pTCH was NACKed(Rejected) a few days ago:

https://lore.kernel.org/arm-scmi/20241211134505.2218386-1-guomin_chen@sina.com/T/#u

...and you agreed that is not a simplification we can do (not to break
multuple instances...)...

..so why you are posting V2 now ?

Thanks,
Cristian

> Signed-off-by: guomin chen <guomin_chen@sina.com>
> ---
>  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
>  drivers/firmware/arm_scmi/driver.c |  4 ++--
>  2 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 157172a5f2b5..800e8ec9357c 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -20,7 +20,6 @@
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>  
> -static DEFINE_IDA(scmi_bus_id);
>  
>  static DEFINE_IDR(scmi_requested_devices);
>  /* Protect access to scmi_requested_devices */
> @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
>  		atomic_set(&scmi_syspower_registered, 0);
>  
> -	ida_free(&scmi_bus_id, scmi_dev->id);
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> @@ -349,7 +347,7 @@ static struct scmi_device *
>  __scmi_device_create(struct device_node *np, struct device *parent,
>  		     int protocol, const char *name)
>  {
> -	int id, retval;
> +	int retval;
>  	struct scmi_device *scmi_dev;
>  
>  	/*
> @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  		return NULL;
>  	}
>  
> -	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> -	if (id < 0) {
> -		kfree_const(scmi_dev->name);
> -		kfree(scmi_dev);
> -		return NULL;
> -	}
> -
> -	scmi_dev->id = id;
>  	scmi_dev->protocol_id = protocol;
>  	scmi_dev->dev.parent = parent;
>  	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
>  	scmi_dev->dev.bus = &scmi_bus_type;
>  	scmi_dev->dev.release = scmi_device_release;
> -	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> +	dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent),
> +			scmi_dev->name, protocol);
>  
>  	retval = device_register(&scmi_dev->dev);
>  	if (retval)
> @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  	return scmi_dev;
>  put_dev:
>  	put_device(&scmi_dev->dev);
> -	ida_free(&scmi_bus_id, id);
>  	return NULL;
>  }
>  
> @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
>  	 */
>  	scmi_devices_unregister();
>  	bus_unregister(&scmi_bus_type);
> -	ida_destroy(&scmi_bus_id);
>  }
>  module_exit(scmi_bus_exit);
>  
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 1b5fb2c4ce86..bbf1f05f2be3 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>  	cinfo->max_msg_size = info->desc->max_msg_size;
>  
>  	/* Create a unique name for this transport device */
> -	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> -		 idx ? "rx" : "tx", prot_id);
> +	snprintf(name, 32, "__scmi_transport_device_%s",
> +		 idx ? "rx" : "tx");
>  	/* Create a uniquely named, dedicated transport device for this chan */
>  	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
>  	if (!tdev) {
> -- 
> 2.47.1
> 

