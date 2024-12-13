Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9W4+MULctZogrAGLwUALyyDv3bgkU20X0apq/gV2IuY=; b=PYaR4nCWjebC1l7iat8pMmOxYC
	HRzMIL8BTAuSSir7izlvodoP/YOHNJXl3G8osZY8psIscpIkOUeYM5Cr9Kvflt/i0spcK7IvBi7HH
	LFViIXhKLS3fsf7kB0Kv0IoaziXM/3ddF94ypRPPq1/oKRpItRQLlMhYPlkV3iIekHiWdS+DNch52
	GzeoFboJ63XzA4LLj2ozUAONwSF+7Ad2sbZn9fpoPqMn6vvkM44DQSaneZm1XZ/ZsRS+mEOrZxTjO
	ZabUZLqlPHee0Y5h8bvJlIdxb4h0Wlv94FqE6G/8qb4eIzRVEK5rEXT+h8GQ+r01jRxekD4vCzgTA
	UkoSvYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8hD-00000004Quu-3ZA7;
	Fri, 13 Dec 2024 16:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8g9-00000004QoP-0P4g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:38:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A87061480;
	Fri, 13 Dec 2024 08:38:37 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC4C43F5A1;
	Fri, 13 Dec 2024 08:38:08 -0800 (PST)
Message-ID: <0c13fbf6-3023-4f9e-9571-a9e8ca6e3402@arm.com>
Date: Fri, 13 Dec 2024 16:38:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] coresight: Update timeout functions to allow
 return of test register value
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Cc: james.clark@linaro.org, alexander.shishkin@linux.intel.com
References: <20241213144919.110642-1-mike.leach@linaro.org>
 <20241213144919.110642-2-mike.leach@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241213144919.110642-2-mike.leach@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_083813_228241_F9684822 
X-CRM114-Status: GOOD (  27.13  )
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

Hi Mike

On 13/12/2024 14:49, Mike Leach wrote:
> Current coresight_timeout function spins on a bit on a test register,
> till bit value achieved or timeout hit.
> 
> Add another function to return the full value of the register being
> tested.
> 

The patch looks good to me. However, this change doesn't bring much 
value, other than avoiding a read at the caller side. I guess it is
simpler to leave things as is and let the caller read the register value
while logging rather than providing another variant.

I am inclined to keep the interface simpler.


> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 50 +++++++++++++++-----
>   include/linux/coresight.h                    |  2 +
>   2 files changed, 41 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ea38ecf26fcb..feb1a1db355f 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1017,32 +1017,37 @@ static void coresight_remove_conns(struct coresight_device *csdev)
>   }
>   
>   /**
> - * coresight_timeout - loop until a bit has changed to a specific register
> - *			state.
> + * coresight_timeout_retval - loop until a bit has changed to a specific register
> + *			      state. Return final register value
>    * @csa: coresight device access for the device
>    * @offset: Offset of the register from the base of the device.
>    * @position: the position of the bit of interest.
>    * @value: the value the bit should have.
> + * @rval:  the last read value of the register being tested.
>    *
>    * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
>    * TIMEOUT_US has elapsed, which ever happens first.
>    */
> -int coresight_timeout(struct csdev_access *csa, u32 offset,
> -		      int position, int value)
> +int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
> +			     int position, int value, u32 *rval)
>   {
> -	int i;
> -	u32 val;
> +	int i, rc = -EAGAIN;
> +	u32 val = 0;
>   
>   	for (i = TIMEOUT_US; i > 0; i--) {
>   		val = csdev_access_read32(csa, offset);
>   		/* waiting on the bit to go from 0 to 1 */
>   		if (value) {
> -			if (val & BIT(position))
> -				return 0;
> +			if (val & BIT(position)) {
> +				rc = 0;
> +				goto return_rval;
> +			}
>   		/* waiting on the bit to go from 1 to 0 */
>   		} else {
> -			if (!(val & BIT(position)))
> -				return 0;
> +			if (!(val & BIT(position))) {
> +				rc = 0;
> +				goto return_rval;
> +			}
>   		}
>   
>   		/*
> @@ -1054,7 +1059,30 @@ int coresight_timeout(struct csdev_access *csa, u32 offset,
>   			udelay(1);
>   	}
>   
> -	return -EAGAIN;
> +return_rval:
> +	*rval = val;

super minor nit: we could be flexible in accepting a "NULL" rval and 
thus keep the normal variants pass the NULL straight in. i.e,

	if (rval)
		*rval = val;

> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(coresight_timeout_retval);
> +
> +/**
> + * coresight_timeout - loop until a bit has changed to a specific register
> + *		       state
> + * @csa: coresight device access for the device
> + * @offset: Offset of the register from the base of the device.
> + * @position: the position of the bit of interest.
> + * @value: the value the bit should have.
> + *
> + * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
> + * TIMEOUT_US has elapsed, which ever happens first.
> + */
> +int coresight_timeout(struct csdev_access *csa, u32 offset,
> +		      int position, int value)
> +{
> +	u32 rval = 0;
> +
> +	return coresight_timeout_retval(csa, offset, position, value, &rval);

	return core_timeout_retval(csa, offset, position, value, NULL);

Suzuki

>   }
>   EXPORT_SYMBOL_GPL(coresight_timeout);
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 055ce5cd5c44..29cb71e82b0b 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -639,6 +639,8 @@ extern int coresight_enable_sysfs(struct coresight_device *csdev);
>   extern void coresight_disable_sysfs(struct coresight_device *csdev);
>   extern int coresight_timeout(struct csdev_access *csa, u32 offset,
>   			     int position, int value);
> +extern int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
> +				    int position, int value, u32 *rval);
>   
>   extern int coresight_claim_device(struct coresight_device *csdev);
>   extern int coresight_claim_device_unlocked(struct coresight_device *csdev);


