Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93ABCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQNL/ezeiqu4YEllZaH0w4gsPJkeK595Pu20GcsXIRQ=; b=C8/560472TCuprQxdrhpt90gR3
	URMum75I2ANdLGOQvuciAJBtETHXSttyPuwtDT8Z6XiPB4Iiw94DcUh+qpoMLLVlN3AZc0KOvDE7d
	umBNRhwQT9CGhFpLKJ9tJJ3afTR2VGTxNZpVPx7gLWZspSOM8G9hLtyK3NQ3gp/IowyQMZac1QDAv
	zH1LwL1J0qCLZaGWkLC/cMLWFey4h21b33Y0PB4YcvzEHf+XSMZUyCfF2LCBbCXzGfyhwYnAReG8j
	HvrEnxtohsJPKekdI9VbTvEaV9QZOmEWBk3vUGi7iPuw1J9Yg6YjY8vi4mOGjlsai1kMYzG7EdhEH
	2+E4L1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd2Y-00000001vod-489a;
	Thu, 11 Sep 2025 08:52:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd2W-00000001vnR-2kUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:52:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20BAB153B;
	Thu, 11 Sep 2025 01:52:15 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DBAD3F694;
	Thu, 11 Sep 2025 01:52:22 -0700 (PDT)
Message-ID: <64186261-3e65-45b5-a68c-8ec236a75f2f@arm.com>
Date: Thu, 11 Sep 2025 09:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] coresight: Explicitly use the parent device
 handler
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250512154108.23920-1-leo.yan@arm.com>
 <20250512154108.23920-4-leo.yan@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250512154108.23920-4-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_015224_750086_AF391737 
X-CRM114-Status: GOOD (  17.39  )
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

On 12/05/2025 16:41, Leo Yan wrote:
> A CoreSight device is present on the CoreSight bus, and its device node
> in the DT binding is assigned as the parent device.  Comments are added
> to document this relationship.
> 
> The code is refined to explicitly use the parent device handle, making
> it more readable and clearly indicating which device handle is being
> used.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3eacdcf638df..4f51ce152ac7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1313,9 +1313,13 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	csdev->access = desc->access;
>   	csdev->orphan = true;
>   
> +	/*
> +	 * 'csdev->dev' is a device present on the CoreSight bus. The device
> +	 * node in the device tree is assigned as the parent device.
> +	 */
> +	csdev->dev.parent = desc->dev;
>   	csdev->dev.type = &coresight_dev_type[desc->type];
>   	csdev->dev.groups = desc->groups;
> -	csdev->dev.parent = desc->dev;
>   	csdev->dev.release = coresight_device_release;
>   	csdev->dev.bus = &coresight_bustype;
>   
> @@ -1334,7 +1338,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	 * Hold the reference to our parent device. This will be
>   	 * dropped only in coresight_device_release().
>   	 */
> -	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
> +	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(csdev->dev.parent));
>   	dev_set_name(&csdev->dev, "%s", desc->name);
>   
>   	/*
> @@ -1393,7 +1397,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   
>   err_out:
>   	/* Cleanup the connection information */
> -	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
> +	coresight_release_platform_data(NULL, csdev->dev.parent, desc->pdata);

This may be problematic, as the csdev could be NULL ?

Suzuki

>   	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_GPL(coresight_register);


