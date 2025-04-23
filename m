Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE3EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GylFDQvuYiXaEPlo0gQwIyWWYpjusSslCah4O7FCJgg=; b=xiSym+0dDqhklXudTvr6yW8LbS
	+eF32ikGR97f+HevNO8K1FqR/e6hdtkXkmWGFmIJ+BNEZG681EEP8Cyx0wZw8oe9WcjMsx+JT6aqD
	21KJSoPUln79djmqdg1ZUktGm+pO53PNP6OitKEX+I1niZsKiNAxXJnvRboI7pnFNAP1ZTWHNGk+1
	7oc9rpVSR+YuxUWefaX1GrW1uzIQAz6OFt7Zk4XleyhB7CpTJIN5Z3XuRXrSSDOhFFoAWXxq//cKU
	Oaj9jQFix6yQr4zM3sgnuy9viE3o2AlQNHj5OKgSrmuCYC3jxwvnOVzJSoxtSYdqpVpdqpxvsAAsG
	6ttugiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WH4-00000009w38-2i5H;
	Wed, 23 Apr 2025 09:20:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VHq-00000009gCl-0xs2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:16:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270001063;
	Wed, 23 Apr 2025 01:16:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545BC3F59E;
	Wed, 23 Apr 2025 01:16:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 09:16:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
Message-ID: <20250423081648.GJ28953@e132581.arm.com>
References: <20250415184649.356683-1-yabinc@google.com>
 <20250415184649.356683-2-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415184649.356683-2-yabinc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_011654_370287_EA6AE388 
X-CRM114-Status: GOOD (  27.54  )
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

Hi Yabin,

Sorry for late reply as I was on vacation for the past two weeks.

On Tue, Apr 15, 2025 at 11:46:48AM -0700, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>    reentrant. Therefore, a spinlock is added to ensure that only
>    one CPU can enable or disable a given CATU device at any point
>    in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>    of the CATU device. The device is enabled when the first CPU
>    requires it and is only disabled when the last CPU finishes
>    using it. This ensures the device remains active as long as at
>    least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

As Jie reminded, please add James' review tag in next spin.

Thanks,
Leo

> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>  drivers/hwtracing/coresight/coresight-catu.h |  1 +
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..3909b562b077 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>  static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		       void *data)
>  {
> -	int rc;
> +	int rc = 0;
>  	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>  
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
>  	return rc;
>  }
>  
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>  
>  static int catu_disable(struct coresight_device *csdev, void *__unused)
>  {
> -	int rc;
> +	int rc = 0;
>  	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>  
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (--csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_disable_hw(catu_drvdata);
> +		CS_LOCK(catu_drvdata->base);
> +	}
>  	return rc;
>  }
>  
> @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	dev->platform_data = pdata;
>  
>  	drvdata->base = base;
> +	raw_spin_lock_init(&drvdata->spinlock);
>  	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>  	catu_desc.pdata = pdata;
>  	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>  	void __iomem *base;
>  	struct coresight_device *csdev;
>  	int irq;
> +	raw_spinlock_t spinlock;
>  };
>  
>  #define CATU_REG32(name, offset)					\
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 

