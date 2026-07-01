Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8121C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DAQrL4Uz5bRDfabuZQWjIQ2uRrro0YgiufXdlSCV6o=; b=xeXjIGlws4EJ99nO7tuBXfv35E
	rrZ+xzePNfAldIBllzsfb8J19LrJyhdRg0lVCnbWn3hIGVFlZmwCAjvscDmphFyBJcFnfBVAVvh6v
	y0r4qSjUCnXxkwPh2hV/T6DsV7az6ZCwkiGCNa1SL1KU0CLtqUaWldY40QonbMxWJYf3QkYEmjmni
	01bEeKduyODyS9wPsOkOfi1bkNmymr/0sFcflQNC4jYpPpRx5im8y2HlnnxWi7RMOvrJlWIhAL8WO
	3WyURAUMhLTKLhhAuTC5UtiB1YxrXhyFUxymga5+30FQ3SJtzzodRRODKkjChlH/VXHY8deqzzkgx
	b3x2zLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexij-00000002Wdi-3O7e;
	Wed, 01 Jul 2026 16:23:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexih-00000002Wd1-1C6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:23:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA37B1E7D;
	Wed,  1 Jul 2026 09:23:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B22F13F673;
	Wed,  1 Jul 2026 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782923004; bh=QDuwYFuFsQex09p/F/Y2K7txltbO6dGVc5gPKtvf6UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSYsJS1ssQDTzRKLDsO/Yyw68KpGwaH82FNpbe/1R5gXZ61TQyQxLN0bNxVww0f5F
	 lVf0OhesrMIdNhbndF2SYNgLkuhN1DyIp7PyDljLs4GJagYu0H7I5b9K1+pg0LF+3i
	 gGvf1dkV0MW1veJLqFOUgaWBksrtXOs53886JcMg=
Date: Wed, 1 Jul 2026 17:23:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] coresight: Fix clock refcount imbalance on platform
 remove
Message-ID: <20260701162321.GG1812158@e132581.arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_092327_398896_FE65BE51 
X-CRM114-Status: GOOD (  20.12  )
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

On Wed, Jul 01, 2026 at 02:05:02PM +0800, Jie Gan wrote:

> After probe, pm_runtime_put() allows the device to suspend and the
> runtime suspend callback disables the same clocks. During remove the
> device is left runtime suspended, so pm_runtime_disable() freezes it
> with the clocks already disabled. The devm cleanup that runs afterwards
> calls clk_disable_unprepare() a second time, underflowing the clock
> enable refcount.

Thanks for fixing the issue.

The problem is that if the device has already been runtime suspended and
its clock has been disabled, afterwards when remove the device, the devm
cleanup disables the clock again, resulting in clock count underflow.

> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..4c5b94640e6a 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
>  		return;
>  
>  	funnel_remove(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

Let's use the funnel driver for the discussion. Once we agree on the
approach, we can apply the same change to the other CoreSight platform
drivers.

How about the following teardown?

 static void funnel_platform_remove(struct platform_device *pdev)
 {
        struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+       int ret;

        if (WARN_ON(!drvdata))
                return;

+       ret = pm_runtime_get_sync(&pdev->dev);
+       if (ret < 0)
+               dev_warn(&pdev->dev, "failed to resume before remove: %d\n", ret);
+
        funnel_remove(&pdev->dev);
+
        pm_runtime_disable(&pdev->dev);
+       pm_runtime_set_suspended(&pdev->dev);
+       pm_runtime_put_noidle(&pdev->dev);
 }

The idea is to first resume the device with pm_runtime_get_sync(), then
perform the remove (which is safe if they need to access or clean up
hardware state), and finally clean up the runtime PM states. I mainly
referred to drivers/iio/adc/stm32-adc.c.

Thanks,
Leo

