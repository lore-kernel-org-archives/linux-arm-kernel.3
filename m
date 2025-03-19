Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC463C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9A0nRJZyImgfZelDYVNznpovHLycNtzQfn64oNPZOA=; b=oOFQWQx3rZ+nyAQ52sTNM6AF5R
	mug3GikcjcEAElcwHAM3qXE2yjYbBUiRqx0J8T6sxbUaZPdxbJnczMMs3W4j203u2X6CKhfrCWOey
	zSxizS3hf/5KboqfrA37eMuWbkU7ZhQOnnHXHzqjpxvCxZ+z5H+8vwZBJHRbvnFOV9dX9JDfvUCQC
	iGcMHBOdYAKfFbGIsZcZNftNBaIBlYmwxADLRHxYMpAHuRWAYKwJVovfw62E6QF7chCGKUDphywgS
	OVoN80dPMQ4kpRkJnELp9bk6Ts6KFYcJvyGNxNnDJ2/OZswD631ZVT7UMbMs/E7MrpfcFr/Dy94q4
	km3RuiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tus7Q-00000008uSc-1t4l;
	Wed, 19 Mar 2025 12:01:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tus5j-00000008u8x-0deO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 12:00:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C7D5113E;
	Wed, 19 Mar 2025 05:00:16 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0F3B3F694;
	Wed, 19 Mar 2025 05:00:06 -0700 (PDT)
Message-ID: <cc68d43f-4719-4f57-a38c-fb5afe8d29cc@arm.com>
Date: Wed, 19 Mar 2025 12:00:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] coresight: Convert tag clear function to take a
 struct cs_access
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_050011_283707_D2184F2A 
X-CRM114-Status: GOOD (  19.82  )
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

On 18/03/2025 16:21, James Clark wrote:
> The self hosted claim tag will be reset on device probe in a later
> commit. We'll want to do this before coresight_register() is called so
> won't have a coresight_device and have to use cs_access instead.
> 
> Also make them public and create locked and unlocked versions for
> later use.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

minor nit:

The restructuring looks a bit confusing. Could we start with :

coresight_{set,clear}_self_claim_tag_unlocked in Patch 1. Rather
than rename what we renamed in patch 1 again here.


> ---
>   drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
>   include/linux/coresight.h                    |  3 ++-
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3f1c996d668a..9ff601e2415a 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -151,12 +151,21 @@ static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
>   	isb();
>   }
>   
> -static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
> +void coresight_clear_self_claim_tag(struct csdev_access *csa)
>   {
> -	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
> +	CS_UNLOCK(csa->base);

This looks to be hard coding MMIO based access ? Should we abstract it 
based on the csdev_access_** ?


Suzuki


> +	coresight_clear_self_claim_tag_unlocked(csa);
> +	CS_LOCK(csa->base);
> +}
> +EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
> +
> +void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
> +{
> +	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
>   				     CORESIGHT_CLAIMCLR);
>   	isb();
>   }
> +EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
>   
>   /*
>    * coresight_claim_device_unlocked : Claim the device for self-hosted usage
> @@ -180,7 +189,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
>   	if (coresight_is_claimed_self_hosted(csdev))
>   		return 0;
>   	/* There was a race setting the tag, clean up and fail */
> -	coresight_clear_self_claim_tag(csdev);
> +	coresight_clear_self_claim_tag_unlocked(&csdev->access);
>   	return -EBUSY;
>   }
>   EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
> @@ -211,7 +220,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>   		return;
>   
>   	if (coresight_is_claimed_self_hosted(csdev))
> -		coresight_clear_self_claim_tag(csdev);
> +		coresight_clear_self_claim_tag_unlocked(&csdev->access);
>   	else
>   		/*
>   		 * The external agent may have not honoured our claim
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..00134a80d358 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
>   
>   extern int coresight_claim_device(struct coresight_device *csdev);
>   extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
> -
> +void coresight_clear_self_claim_tag(struct csdev_access *csa);
> +void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
>   extern void coresight_disclaim_device(struct coresight_device *csdev);
>   extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
>   extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
> 




