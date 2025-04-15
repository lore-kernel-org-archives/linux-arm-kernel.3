Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE57C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4yB7kQlZUb6xayWQsrmLdqiBMKXxBZBkdVERCDut1w=; b=v/2Vask5DufqN2CuyvZRqhHrcE
	4J3Bs80aRZj/+Lnc6UtvgkotQyn8JKz+FSs8ez6jElqaw6JUa9xv6tkwhQ96PgqOL9cOiEnJvi64h
	NSUhO5/gMCANETbu2Yeg/quy0NTKS5WRM7+6uGfp0YG4rv75zi2MbJjh1Clzrrhv5veAZ2vn/p6om
	CZuLDlIXX9DtiFl57dgBxoNYIqu02pVLFQGed89t0l++8039im4FRDlJ/uPcFY2UKmJfE1x3ksnBE
	7TfK2mYyA56py80KuM6E3XWVnbS3llLwakLvMMklS+Qve6RFAze31B72i40QkC8jVyDCSSvmNAGMY
	y+A8VeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gkB-00000005zbR-0gCb;
	Tue, 15 Apr 2025 13:54:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gXf-00000005xP0-1qbr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:41:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913b539aabso3370555f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724494; x=1745329294; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4yB7kQlZUb6xayWQsrmLdqiBMKXxBZBkdVERCDut1w=;
        b=UctFABn3nlX6HYe+sHkCePYiCgejFqCAlFkVj0AoibRdulYzPNvvSU1GE6bOgzaq/b
         mNs1M56v9drX95fiDsIeD+KIUEk78OJr0Ew1jJWTXSNrHzU+StC74V1ulPqSShixtP8l
         +t2MtaTK/rrrbVE4qVGI2rIjwcpwAXpPrV7B6lxhQy9ZqrXP7BkV1en4pwtCtLnPvnAw
         EMEDCUE197Z1tApdtYF1XdP5MeNPYCXH39iixR1sMa59KJAIY1gkklWlieLJeqOhzbbL
         NzlOrgu2b1Ro507FHOjMEIBj/PX0ePP7vZ2HVM83kJ3IiFewIb/ftyZ3Pw5itr6+9yCk
         dYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724494; x=1745329294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4yB7kQlZUb6xayWQsrmLdqiBMKXxBZBkdVERCDut1w=;
        b=qb+hJmJRew6XRKZpX0F2ob8fiWOMWcmD/7W65YubJKVhLZhC+fVf+kRSYBRBu46OGR
         X7yD1YltrT4enFIJObbSRhTSsvFiNXmp+VZCbXM2zk1lL8+kiewggTSinrugOCwTd65z
         qJMB7amtkX48FTCPOTSKbHu3Qu8Fx8QG+KyRv4zt2jLtP7svb2iXC89w+4tFLRWCVvMy
         kT7CYuyoJJFKDxHPCNZb+ADyaet0115zacRqzgw7F36Kbwik8W0RMBOule4tpWuYRmoR
         5RfLdn5cfxasqNK/YJFnMqUFPnkwJBT6JFdGlOZc/LJEAgsLrlbM71fmAeVdBaHYp0hU
         meQg==
X-Forwarded-Encrypted: i=1; AJvYcCVQoFzCdgyxpaUUyZUrqP21tdMrz00MSpBbO3dc2X44YQFH+p3Y9m+sYypauYEGvQBfkolPbeYPLKxeze63m0Ln@lists.infradead.org
X-Gm-Message-State: AOJu0YwzjJkYnsv8Zl30SUe/zWpBoZ492V4YWgjs9jbHAqBLnyM3XpJP
	rIVhzsJ4DESC0Bxo7zAz0NKKVy5tpIfvR3KKYulAGB7K9PjKbwpXZX3OHC34yTQ=
X-Gm-Gg: ASbGncutxSiFUYs3EvHTWOag4CkzuW4s/5y8wG3MIzILbsWl8ukYH5NOTPVNvASYADe
	ppaAmFyg4OF0Y4vJuFos2J3gbeiRHkCp0zmjeH2/Czp6Pv17I4I10jmoTJpNgrzCzSKnspH7C7X
	FY3XWhCaqq/+xVWLZSueZhHCQWKPiqjyR2Uou9OPvtRBKkt4qf79pMeVdijBfKEGdnf0+q/gyd4
	igtrDK80hqpySTqkuGJl76E8gWS7m38fLZOsvQw9c9v4/o2igsmwKm5DLByUBMki7PPNcceZqGN
	ABpt+7a/bsNgdHBfC2U4g02rE9E96vs4DKK6k59WU/c=
X-Google-Smtp-Source: AGHT+IGfWgdOUteKBd0Xg5+jg66EqrcGaih9n9NEZtkwhykKyItVqvzsTpM2lpnDn7APIwWUE1dwLw==
X-Received: by 2002:a5d:584f:0:b0:39c:1257:c7a1 with SMTP id ffacd0b85a97d-39eaaecaeb2mr12782034f8f.57.1744724493943;
        Tue, 15 Apr 2025 06:41:33 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963fccsm14162453f8f.3.2025.04.15.06.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:41:33 -0700 (PDT)
Message-ID: <2e9f1ad4-d490-4c22-bcff-7d19b8a89721@linaro.org>
Date: Tue, 15 Apr 2025 14:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250408195922.770377-1-yabinc@google.com>
 <20250408195922.770377-2-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250408195922.770377-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_064135_481341_93DA5BCE 
X-CRM114-Status: GOOD (  29.36  )
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



On 08/04/2025 8:59 pm, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>     reentrant. Therefore, a spinlock is added to ensure that only
>     one CPU can enable or disable a given CATU device at any point
>     in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>     of the CATU device. The device is enabled when the first CPU
>     requires it and is only disabled when the last CPU finishes
>     using it. This ensures the device remains active as long as at
>     least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..30b78b2f8adb 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>   

Very minor nit only because you need to resend anyway, but there should 
be a newline between the variable definitions and the code. Not sure why 
checkpatch doesn't warn here.

> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
>   	return rc;
>   }
>   
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	if (--csdev->refcnt == 0) {

Hopefully this never underflows if disable is called again after a 
failed enable. We could add a WARN_ON() but I think this is a general 
case and not specific to these patches so is probably better to do later 
as separate change.

Reviewed-by: James Clark <james.clark@linaro.org>


