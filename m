Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AE5CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn4hDOgu3qoBbjxRSq3mIaV7DyvDEFKwfNRxh9zgstM=; b=2FJnA4rAUYabkw0uxuWno1Uow4
	lXx4mQLE5iBP9gewHfGbFP+fUUiq6kGzcFMgebAIGXLzlLrJI4RBvUepFGEhJ6Vs87Yz0ZLjiAwfs
	Is/2Ni7IR66F+11ysb48z0/EolTmQwzgigvcityTqwvFFDhqj7NVFOxYJ24D9eHsyfgSSx9vS7J28
	utllo+BP3+/YSUU8KcgogD2k6ooprvmraY1FLd4HVOQ2AKAIU4ZBV36Ap9SCgH1yIX7MAmRi38nDS
	wnHa5a7QzfNJVHFGPx8b631YUshQpC+DYCuMwQnfzPA+iQnMcqRHd9gzv+jiDmzOPf41m/FPt7mgG
	dBuK+bBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwe93-00000002HFR-3LS1;
	Thu, 11 Sep 2025 10:03:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwe90-00000002HEW-0uVq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:03:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C64E0153B;
	Thu, 11 Sep 2025 03:03:00 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D41833F66E;
	Thu, 11 Sep 2025 03:03:07 -0700 (PDT)
Message-ID: <9c86b280-60de-4819-855a-87c91f057dcd@arm.com>
Date: Thu, 11 Sep 2025 11:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] coresight: Separate failure and success flows
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250512154108.23920-1-leo.yan@arm.com>
 <20250512154108.23920-5-leo.yan@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250512154108.23920-5-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_030310_308643_9063F0D8 
X-CRM114-Status: GOOD (  17.58  )
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
> For a success registration, it releases mutex, then binds associated CTI
> device, and returns a device pointer.
> 
> As a result, it separates flows between the success case and the failure
> flow, any code after the tag 'out_unlock' is only used for failure
> handling.
> 

This description is a bit ambiguous. Please could we simply say:

Subject: coresight: Cleanup coresight_register error handling

Separate the failure handling path from the successful case.
Use the out_unlock label only for the failure handling.

Rest looks fine to me.

Suzuki

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 4f51ce152ac7..4fc82206b326 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1377,17 +1377,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	registered = true;
>   
>   	ret = coresight_create_conns_sysfs_group(csdev);
> -	if (!ret)
> -		ret = coresight_fixup_orphan_conns(csdev);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = coresight_fixup_orphan_conns(csdev);
> +	if (ret)
> +		goto out_unlock;
> +
> +	mutex_unlock(&coresight_mutex);
> +
> +	if (cti_assoc_ops && cti_assoc_ops->add)
> +		cti_assoc_ops->add(csdev);
> +	return csdev;
>   
>   out_unlock:
>   	mutex_unlock(&coresight_mutex);
> -	/* Success */
> -	if (!ret) {
> -		if (cti_assoc_ops && cti_assoc_ops->add)
> -			cti_assoc_ops->add(csdev);
> -		return csdev;
> -	}
>   
>   	/* Unregister the device if needed */
>   	if (registered) {


