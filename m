Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244E4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkFAmI+xW3CL3Tc/tWMfAhKsPA99m46OFL2rkLhI5h8=; b=RiT+FBicYXrNXKNKBlMHjeg63T
	XVL1J3nPq2NL6eZmPxFq4ZjUMis9azqbr4S+8jvRyB6fltBNLJ4NP+81RhafthxRtUDJscgYo61tu
	vpRoBo2Gfg/CUyXQpwupX9PN6RBBZxfiVC5dk2E018lY1GNXb7ECznHi9o471GEUwEQBbpPX6qbXq
	QxngkUnR8eY7N3KQ3VAQt7JwGBz3rFy5eRtYan9O/SGP6ZifJl20GajSczJyLVLywkrM+NxG17932
	nytiz7Cko2qO/I+y50lAvIKPdRy7BDxMbXZ1G8auWXnsR28+kY0KLWENesCHn7mxD9Cvd5G1DtiUn
	KCfwsgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzCa-00000005ypq-2t9z;
	Thu, 06 Feb 2025 10:33:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzBD-00000005yiA-21CD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:32:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 413FA12FC;
	Thu,  6 Feb 2025 02:32:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8722F3F63F;
	Thu,  6 Feb 2025 02:32:18 -0800 (PST)
Date: Thu, 6 Feb 2025 10:32:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
Message-ID: <20250206103213.GB8855@e132581.arm.com>
References: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_023219_608278_384F92B9 
X-CRM114-Status: GOOD (  26.43  )
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

Hi Yuanfang,

On Fri, Jan 03, 2025 at 04:01:54PM +0800, Yuanfang Zhang wrote:
> 
> When multiple ETMs are enabled simultaneously, the time required
> to complete a flush in the process of reading the TMC device node
> may exceed the default wait time of 100us.

Have you tried how long time would be safe to wait for the
TMCREADY_BIT bit to be set on your platform?

> If the TMC capture is stopped while any ETM has not completed its
> flush, it can cause the corresponding CPU to hang.
>
> Fix the by checking the TMCReady bit after the flush. If TMCReady
> bit is set, TraceCaptEn bit can be clear; otherwise, return directly
> and stop the TMC read.

When a timeout for TMC flush and stop is detected, if the driver
arbitrarily bails out without disabling TMC, this would leave the
hardware always on.

I would like first know if a longer timeout can fix the issue.

Thanks,
Leo

> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
>  2 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
>         return;
>  }
> 
> -static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> +static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +       int rc;
> +
>         CS_UNLOCK(drvdata->base);
> 
>         tmc_flush_and_stop(drvdata);
> +
> +       rc = tmc_wait_for_tmcready(drvdata);
> +       if (rc) {
> +               dev_err(&drvdata->csdev->dev,
> +                       "Failed to disable : TMC is not ready\n");
> +               CS_LOCK(drvdata->base);
> +               return rc;
> +       }
>         /*
>          * When operating in sysFS mode the content of the buffer needs to be
>          * read before the TMC is disabled.
> @@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>         tmc_disable_hw(drvdata);
> 
>         CS_LOCK(drvdata->base);
> +       return 0;
>  }
> 
>  static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> @@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
>                         ret = -EINVAL;
>                         goto out;
>                 }
> -               __tmc_etb_disable_hw(drvdata);
> +               ret = __tmc_etb_disable_hw(drvdata);
> +               if (ret)
> +                       goto out;
>         }
> 
>         drvdata->reading = true;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
>         }
>  }
> 
> -static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> +static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +       int rc;
> +
>         CS_UNLOCK(drvdata->base);
> 
>         tmc_flush_and_stop(drvdata);
> +
> +       rc = tmc_wait_for_tmcready(drvdata);
> +       if (rc) {
> +               dev_err(&drvdata->csdev->dev,
> +                       "Failed to disable : TMC is not ready\n");
> +               CS_LOCK(drvdata->base);
> +               return rc;
> +       }
>         /*
>          * When operating in sysFS mode the content of the buffer needs to be
>          * read before the TMC is disabled.
> @@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>         tmc_disable_hw(drvdata);
> 
>         CS_LOCK(drvdata->base);
> -
> +       return 0;
>  }
> 
>  void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> @@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>         }
> 
>         /* Disable the TMC if we are trying to read from a running session. */
> -       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> -               __tmc_etr_disable_hw(drvdata);
> -
> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
> +               ret = __tmc_etr_disable_hw(drvdata);
> +               if (ret)
> +                       goto out;
> +       }
>         drvdata->reading = true;
>  out:
>         spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20250103-fix_cpu_hung-b5a95179ada4
> 
> Best regards,
> --
> Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> 

