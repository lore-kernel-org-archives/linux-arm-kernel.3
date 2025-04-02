Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0F4C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enLo0l71vRPD3IoKWlPto7u4zNOZiOyYk8xnmZnZrLs=; b=p2gEpVkCoNf65899nYOVrqNXPM
	ErbRddTqjEM0igerE+EdqAdJ195FeelpwI2xg91Bdp91iWdq2PB/vXOol2nUqBGjX4iGZmLMLDP9V
	U9AZBQqjwRlH8pBtSWwjr4ryyTqC/Jw8dGOPk+f8eo7QdGcSdZEg1ODQR7ZX5rV5+Bn9SZqxDWOku
	7zdGPkzbBFyOtj5sczBGZp9aR99VEs+J2qdA43HzfbtPwwXANa+8uKP+a/Zazox/itHJ+nFhfVFMI
	X7ImY5ksRPMTrO//snvmaqgXHbivAxrYYJpqVEIsdxaF8d2l6hTFIfdqe+mgzN6pdr155BWSFtMbD
	YnS8mMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzySs-00000006Iio-3cp8;
	Wed, 02 Apr 2025 13:49:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyR7-00000006IQu-1uhf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:47:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C26FEC;
	Wed,  2 Apr 2025 06:47:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79BF33F694;
	Wed,  2 Apr 2025 06:47:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:47:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] coresight: catu: Prevent concurrent PERF and
 SYSFS mode enablement
Message-ID: <20250402134716.GK115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-3-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402011832.2970072-3-yabinc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_064721_536448_1FF5FD03 
X-CRM114-Status: GOOD (  24.36  )
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

On Tue, Apr 01, 2025 at 06:18:31PM -0700, Yabin Cui wrote:
> A CATU device can be enabled for either PERF mode or SYSFS mode, but
> not both simultaneously. Consider the following race condition:
> 
> CPU 1 enables CATU for PERF mode.
> CPU 2 enables CATU for SYSFS mode. It only increases refcnt.
> CPU 2 enables ETR for SYSFS mode.
> CPU 1 fails to enable ETR for PERF mode.
> 
> This results in a CATU being enabled in PERF mode and an ETR enabled
> in SYSFS mode, leading to unknown behavior.
> 
> To prevent this situation, this patch checks enabled mode of a
> CATU device before increasing its refcnt.

Yes.  We have also observed the same issue.  I am currently working on
refactoring the Arm CoreSight locking, my plan is to use coresight_path
to maintain mode.

Given it is uncommon case to use two modes concurrently in Arm
CoreSight, I assume this is not an urgent issue.  Could we defer this
patch?  My understanding is that this issue will be prevented with
checking the path mode, rather than checking modes in seperate modules.

To be clear, I am fine with other two patches in the series.

Thanks,
Leo

> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: James Clark <james.clark@linaro.org>
> Suggested-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 6 +++++-
>  drivers/hwtracing/coresight/coresight-catu.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index b1d490dd7249..0caf3a3e75ce 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -466,7 +466,10 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		CS_UNLOCK(catu_drvdata->base);
>  		rc = catu_enable_hw(catu_drvdata, mode, data);
>  		CS_LOCK(catu_drvdata->base);
> -	}
> +		if (!rc)
> +			catu_drvdata->mode = mode;
> +	} else if (catu_drvdata->mode != mode)
> +		rc = -EBUSY;
>  	if (!rc)
>  		csdev->refcnt++;
>  	return rc;
> @@ -499,6 +502,7 @@ static int catu_disable(struct coresight_device *csdev, void *__unused)
>  		CS_UNLOCK(catu_drvdata->base);
>  		rc = catu_disable_hw(catu_drvdata);
>  		CS_LOCK(catu_drvdata->base);
> +		catu_drvdata->mode = CS_MODE_DISABLED;
>  	} else {
>  		rc = -EBUSY;
>  	}
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 755776cd19c5..ea406464f0a8 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -66,6 +66,7 @@ struct catu_drvdata {
>  	struct coresight_device *csdev;
>  	int irq;
>  	raw_spinlock_t spinlock;
> +	enum cs_mode mode;
>  };
>  
>  #define CATU_REG32(name, offset)					\
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

