Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FBAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGbVmrhUI5Uv11tNzQgsKxsAH9iPy+QdOEX38aJe6Mc=; b=QkPSKvthQg8m3cKaXSVvuUCL60
	x7/K/z59/M+f5HQ1HkZH5CqKpWQxLPazxOodXX8Dqq/wfFIlSklDIW6ggHpQJjcvwNs1vrvJT4sz/
	ts0BvQgDbA4yFtOyx4Miz+nBVTA+4S2Bmsa2rmCFZ6v16GPAM5bxEirxSU2+kynHMPtO87JkTS1Rx
	82V2U7xoLio4Qh9i389KVxPFimlGHL64ynPpXYgQ8yFNRE9mnM4gNpqtFaFS7fU9YcO0ln2WLu5RA
	Und42P/7QrdQu6Sp9qM+irPDR2nvaZARBNPI0xXiZFXGQ/GNOEcSGzbowAyHmUHcpl9t+5akMCHd5
	qD6im4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZD-00000009AGy-3Gx2;
	Wed, 02 Jul 2025 17:48:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0cO-000000090eS-3VI2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:47:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0B9522C7;
	Wed,  2 Jul 2025 09:47:16 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615703F66E;
	Wed,  2 Jul 2025 09:47:31 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:47:29 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
Message-ID: <20250702164729.GA1039028@e132581.arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-3-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620075412.952934-3-hejunhao3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_094732_964331_62696668 
X-CRM114-Status: GOOD (  25.04  )
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

On Fri, Jun 20, 2025 at 03:54:11PM +0800, Junhao He wrote:

[...]

> To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
> enabled in a different mode, and simplily the setup and checks for "mode".
> To prevent race conditions between mode transitions.

I have a similiar fixing for CTI driver, see:
https://lore.kernel.org/linux-arm-kernel/20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com/T/#maccd68b460fb8d74ccdd3504163d8f486f04178b

[...]

> @@ -1781,14 +1756,52 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>  static int tmc_enable_etr_sink(struct coresight_device *csdev,
>  			       enum cs_mode mode, void *data)
>  {
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	enum cs_mode old_mode;
> +	int rc = -EINVAL;
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {

scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {

I am concerned that the spinlock is acquired and released for several
times in a single flow. It is possible to hit some corner case, e.g.,

- CPU0 acquires the lock, set sink as SYSFS mode, and releases the lock;
- CPU1 acquires the lock, detects the SYSFS mode has been set,
  directly bail out, then enable ETM.

The problem is the sink has not been enabled yet. This leads to CPU1
to enable the tracer but prior to sink's enabling.

The key piont is we should ensure the mode is consistent to the
hardware state. I will take a bit time for if we can have a better idea
for this.

> +		old_mode = coresight_get_mode(csdev);
> +		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
> +			return -EBUSY;
> +
> +		if (drvdata->reading)
> +			return -EBUSY;
> +
> +		/* In sysFS mode we can have multiple writers per sink. */
> +		if (old_mode == CS_MODE_SYSFS) {
> +			csdev->refcnt++;

I am just wandering if we can unify the "refcnt" code for both SYSFS
mode and Perf mode, and as a result, we can consolidate the code cross
different drivers.

Something like:

                if (!csdev->refcnt) {
                        coresight_set_mode(csdev, mode);
                } else {
                        /* The device has been configured with an incompatible mode */
                        if (coresight_get_mode(csdev) != mode)
                                return -EBUSY;

                        csdev->refcnt++;
                }

Then when disable the device:

                csdev->refcnt--;
                if (!csdev->refcnt)
                        coresight_set_mode(csdev, CS_MODE_DISABLED);

We should not check "drvdata->reading" when enable or disable sink, as
it is a flag to track if reading the trace buffer, it is irrelevant to
the sink device's enabling or disabling.

Please verify perf mode (especially for system wide session) to avoid
anything missed.

Thanks,
Leo

> +			return 0;
> +		}
> +
> +		/*
> +		 * minor note: In sysFS mode, the task1 get locked first, it setup
> +		 * etr mode to SYSFS. Then task2 get locked，it will directly return
> +		 * success even when the tmc-etr is not enabled at this moment.
> +		 * Ultimately, task1 will still successfully enable tmc-etr.
> +		 * This is a transient state and does not cause an anomaly.
> +		 */
> +		coresight_set_mode(csdev, mode);
> +	}
> +
>  	switch (mode) {
>  	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		rc = tmc_enable_etr_sink_sysfs(csdev);
> +		break;
>  	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		rc = tmc_enable_etr_sink_perf(csdev, data);
> +		break;
>  	default:
> -		return -EINVAL;
> +		rc = -EINVAL;
>  	}
> +
> +	if (rc && old_mode != mode) {
> +		scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +			coresight_set_mode(csdev, old_mode);
> +		}
> +	}
> +
> +	return rc;
>  }
>  
>  static int tmc_disable_etr_sink(struct coresight_device *csdev)
> -- 
> 2.33.0
> 

