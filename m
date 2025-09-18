Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6803CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXm1TANnXePPhnLHXmE1qsaS9rFxyboP9+U2qaj2llA=; b=PxVm4uPcMlEhimWwzMoDaUSUPu
	I42nFxhZNChpgBpASr5yNYiLiqqA51RPxIo9AbaDqoGLnpJhMVz6JYMBaquhUgPhv4FuIFKMzhf2m
	iu14Qkn76gwg3rcMkXpRiRkEk2We7sr8p2oU5IJ9OgKqriviqPB5x9zDkV5pUXyyuMC4LubXbBWAT
	9IM2X5Jblp0OajpvQxBdy+stIfPZyLGZ0wkZX79znpglaWGuEE2uZw27VvHc3kIeMjniCBSaLp1Bc
	Q56Zn8/fGUC83anIT6uaTlBEEkKQemsBzLqOJTGUb35tPNQt/euO6UZvs1JtwSZZjuG6Izcedun84
	/dslKjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAkJ-0000000Gpt3-2iPV;
	Thu, 18 Sep 2025 09:16:07 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAkG-0000000Gprr-1AEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:16:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cS8yL3qRkzPtWR;
	Thu, 18 Sep 2025 17:11:22 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 97E5B1402EA;
	Thu, 18 Sep 2025 17:15:58 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 17:15:58 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 17:15:57 +0800
CC: <yangyicong@hisilicon.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH v3 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
To: Junhao He <hejunhao3@huawei.com>, <suzuki.poulose@arm.com>,
	<james.clark@arm.com>, <anshuman.khandual@arm.com>, <leo.yan@arm.com>
References: <20250818080600.418425-1-hejunhao3@huawei.com>
 <20250818080600.418425-3-hejunhao3@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b68d0460-0af0-6824-b215-5b6af1e69260@huawei.com>
Date: Thu, 18 Sep 2025 17:15:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250818080600.418425-3-hejunhao3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_021604_637555_DD8C4B4D 
X-CRM114-Status: GOOD (  31.61  )
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

On 2025/8/18 16:05, Junhao He wrote:
> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
> in tmc_etr_enable_hw() is triggered sometimes:
> 
>  WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>  [..snip..]
>  Call trace:
>   tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>   tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>   tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>   coresight_enable_path+0x1c8/0x218 [coresight]
>   coresight_enable_sysfs+0xa4/0x228 [coresight]
>   enable_source_store+0x58/0xa8 [coresight]
>   dev_attr_store+0x20/0x40
>   sysfs_kf_write+0x4c/0x68
>   kernfs_fop_write_iter+0x120/0x1b8
>   vfs_write+0x2c8/0x388
>   ksys_write+0x74/0x108
>   __arm64_sys_write+0x24/0x38
>   el0_svc_common.constprop.0+0x64/0x148
>   do_el0_svc+0x24/0x38
>   el0_svc+0x3c/0x130
>   el0t_64_sync_handler+0xc8/0xd0
>   el0t_64_sync+0x1ac/0x1b0
>  ---[ end trace 0000000000000000 ]---
> 
> Since the sysfs buffer allocation and the hardware enablement is not
> in the same critical region, it's possible to race with the perf
> 
> mode:
>   [sysfs mode]                   [perf mode]
>   tmc_etr_get_sysfs_buffer()
>     spin_lock(&drvdata->spinlock)
>     [sysfs buffer allocation]
>     spin_unlock(&drvdata->spinlock)
>                                  spin_lock(&drvdata->spinlock)
>                                  tmc_etr_enable_hw()
>                                    drvdata->etr_buf = etr_perf->etr_buf
>                                  spin_unlock(&drvdata->spinlock)
>  spin_lock(&drvdata->spinlock)
>  tmc_etr_enable_hw()
>    WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>                                 the perf side
>   spin_unlock(&drvdata->spinlock)
> 
> A race condition is introduced here, perf always prioritizes execution, and
> warnings can lead to concerns about potential hidden bugs, such as getting
> out of sync.
> 
> To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
> enabled in a different mode, and simplily the setup and checks for "mode".
> To prevent race conditions between mode transitions.
> 
> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-yangyicong@huawei.com/
> Signed-off-by: Junhao He <hejunhao3@huawei.com>

Tested by running perf and sysfs mode simultaneously, no warning reproduced.

Tested-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 80 ++++++++++---------
>  1 file changed, 42 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..06c74717be19 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1263,7 +1263,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>  		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>  	}
>  
> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
> +	if (drvdata->reading) {
>  		ret = -EBUSY;
>  		goto out;
>  	}
> @@ -1300,20 +1300,18 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>  	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>  
>  	/*
> -	 * In sysFS mode we can have multiple writers per sink.  Since this
> -	 * sink is already enabled no memory is needed and the HW need not be
> -	 * touched, even if the buffer size has changed.
> +	 * When two sysfs sessions race to acquire an idle sink, both may enter
> +	 * this function. We need to recheck if the sink is already in use to
> +	 * prevent duplicate hardware configuration.
>  	 */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> +	if (csdev->refcnt) {
>  		csdev->refcnt++;
>  		goto out;
>  	}
>  
>  	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
> -	if (!ret) {
> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
> +	if (!ret)
>  		csdev->refcnt++;
> -	}
>  
>  out:
>  	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> @@ -1729,39 +1727,24 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>  {
>  	int rc = 0;
>  	pid_t pid;
> -	unsigned long flags;
>  	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>  	struct perf_output_handle *handle = data;
>  	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>  
> -	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -	 /* Don't use this sink if it is already claimed by sysFS */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		rc = -EBUSY;
> -		goto unlock_out;
> -	}
> -
> -	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
> -		rc = -EINVAL;
> -		goto unlock_out;
> -	}
> +	if (WARN_ON(!etr_perf || !etr_perf->etr_buf))
> +		return -EINVAL;
>  
>  	/* Get a handle on the pid of the session owner */
>  	pid = etr_perf->pid;
>  
>  	/* Do not proceed if this device is associated with another session */
> -	if (drvdata->pid != -1 && drvdata->pid != pid) {
> -		rc = -EBUSY;
> -		goto unlock_out;
> -	}
> +	if (drvdata->pid != -1 && drvdata->pid != pid)
> +		return -EBUSY;
>  
> -	/*
> -	 * No HW configuration is needed if the sink is already in
> -	 * use for this session.
> -	 */
> +	/* The sink is already in use for this session */
>  	if (drvdata->pid == pid) {
>  		csdev->refcnt++;
> -		goto unlock_out;
> +		return rc;
>  	}
>  
>  	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
> @@ -1773,22 +1756,43 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>  		csdev->refcnt++;
>  	}
>  
> -unlock_out:
> -	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>  	return rc;
>  }
>  
>  static int tmc_enable_etr_sink(struct coresight_device *csdev,
>  			       enum cs_mode mode, void *data)
>  {
> -	switch (mode) {
> -	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> -	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> -	default:
> -		return -EINVAL;
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	int rc;
> +
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
> +		if (coresight_get_mode(csdev) != CS_MODE_DISABLED &&
> +		    coresight_get_mode(csdev) != mode)
> +			return -EBUSY;
> +
> +		switch (mode) {
> +		case CS_MODE_SYSFS:
> +			if (csdev->refcnt) {
> +				/* The sink is already enabled */
> +				csdev->refcnt++;
> +				return 0;
> +			}
> +			coresight_set_mode(csdev, mode);
> +			break;
> +		case CS_MODE_PERF:
> +			return tmc_enable_etr_sink_perf(csdev, data);
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	rc = tmc_enable_etr_sink_sysfs(csdev);
> +	if (rc) {
> +		scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
>  	}
> +
> +	return rc;
>  }
>  
>  static int tmc_disable_etr_sink(struct coresight_device *csdev)
> 

