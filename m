Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D051D10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpJ1eAcNnmmGykmdmUW/MBd+rg+EnEJfn+tXJmlEBec=; b=z7eI2Q+hBx+3b8ejjUlJPyPq65
	pdu3hlrfvxLf2c/YUseaUJnWRZObEg7wTL2DRh3dyvl3/u6v08rRlqMnySV8d72uRnfpXSDo6zjFE
	f/x0VzzCPFd3zxrE5U4rz6hWAuy7/T31dRM1IJTgjtG4zQoVq6gxjPaypq3NDnbUyN4rfsYJfDMKp
	jiYp4LeU68sqQ4Od37f8Tuq8BWXWbh4XICe+0naObO0IiX/SXsWtT0sYKz9eJDCYs1FEYCHy6dSDd
	vCPqmCK4udXW57yMDU4FDsuGueE80MztITFdGV+A3XWIvmmtN2NfoJ5M5tCvbi4jMGc/I2y2hVvMt
	loGeqj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI32C-00000005c7s-1kIT;
	Mon, 02 Dec 2024 09:48:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI31C-00000005c34-4BFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:47:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68A4EFEC;
	Mon,  2 Dec 2024 01:47:26 -0800 (PST)
Received: from [10.57.68.33] (unknown [10.57.68.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 745223F71E;
	Mon,  2 Dec 2024 01:46:56 -0800 (PST)
Message-ID: <62f5d1c5-05bd-41b6-8703-baacec3e2619@arm.com>
Date: Mon, 2 Dec 2024 09:46:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] coresight: tmc-etr: Fix race condition between sysfs
 and perf mode
Content-Language: en-GB
To: Yicong Yang <yangyicong@huawei.com>, mike.leach@linaro.org,
 james.clark@linaro.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Cc: jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 hejunhao3@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com
References: <20241202092419.11777-1-yangyicong@huawei.com>
 <20241202092419.11777-4-yangyicong@huawei.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241202092419.11777-4-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_014703_130063_37616D23 
X-CRM114-Status: GOOD (  21.80  )
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

Hi Yicong

On 02/12/2024 09:24, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
> in tmc_etr_enable_hw() is triggered sometimes:
> 
>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>   [..snip..]
>   Call trace:
>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>    coresight_enable_path+0x1c8/0x218 [coresight]
>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>    enable_source_store+0x58/0xa8 [coresight]
>    dev_attr_store+0x20/0x40
>    sysfs_kf_write+0x4c/0x68
>    kernfs_fop_write_iter+0x120/0x1b8
>    vfs_write+0x2c8/0x388
>    ksys_write+0x74/0x108
>    __arm64_sys_write+0x24/0x38
>    el0_svc_common.constprop.0+0x64/0x148
>    do_el0_svc+0x24/0x38
>    el0_svc+0x3c/0x130
>    el0t_64_sync_handler+0xc8/0xd0
>    el0t_64_sync+0x1ac/0x1b0
>   ---[ end trace 0000000000000000 ]---
> 
> Since the enablement of sysfs mode is separeted into two critical regions,
> one for sysfs buffer allocation and another for hardware enablement, it's
> possible to race with the perf mode. Fix this by double check whether
> the perf mode's been used before enabling the hardware in sysfs mode.

Thanks for the fix. Some minor comments below.

It needs a Fixes tag.

> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index ad83714ca4dc..d382d95da5ff 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1230,6 +1230,36 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
>   
> +	/*
> +	 * Since the sysfs buffer allocation and the hardware enablement is not
> +	 * in the same critical region, it's possible to race with the perf
> +	 * mode:
> +	 *   [sysfs mode]                   [perf mode]
> +	 *   tmc_etr_get_sysfs_buffer()
> +	 *     spin_lock(&drvdata->spinlock)
> +	 *     [sysfs buffer allocation]
> +	 *     spin_unlock(&drvdata->spinlock)
> +	 *                                  spin_lock(&drvdata->spinlock)
> +	 *                                  tmc_etr_enable_hw()
> +	 *                                    drvdata->etr_buf = etr_perf->etr_buf
> +	 *                                  spin_unlock(&drvdata->spinlock)
> +	 *   spin_lock(&drvdata->spinlock)
> +	 *   tmc_etr_enable_hw()
> +	 *     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
> +	 *                                  the perf side
> +	 *   spin_unlock(&drvdata->spinlock)
> +	 *
> +	 * So check here before continue.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_PERF) {
> +		drvdata->sysfs_buf = NULL;
> +		spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +		/* Free allocated memory out side of the spinlock */
> +		tmc_etr_free_sysfs_buf(sysfs_buf);
> +		return -EBUSY;
> +	}

With this in place, I think we should remove the check for CS_MODE_PERF 
in get_etr_sysfs_buf() to avoid confusion (which I believe opened up 
this race)

Suzuki



> +
>   	/*
>   	 * In sysFS mode we can have multiple writers per sink.  Since this
>   	 * sink is already enabled no memory is needed and the HW need not be


