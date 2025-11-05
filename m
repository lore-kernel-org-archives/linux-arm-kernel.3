Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A00CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOXgrVtNgt1wqOZYRpFRnKR5ChwbGXGhpixYHezfCPU=; b=BnfkH31ayflkRc4qMX99TyBHSC
	ZODp7O0jp2US4MnaIfqgl7WBfU5bAXsMjZmZxe8WZKAAyisx0PwgdgGmYhUYFGTWc6ZWWBlJW2ooE
	/GoaqAXILJ55R8I7ixET1mz8kk7vPOVGIabWL+lw8NFfLAqemD4t5aIjx47Nt/guoine2Ho+f5Yje
	NyZf4kFMLU83J2oG1dZCt8oc78hdHco1ckjI2U4snDfS+6U0mtBXII2rh9CdVDNscZWplErKecE5A
	kCBlOh+h9TabPbALES1FgFj6jeyDk2fp5HUgcmkJi8zQlGjsIJdEYfs+1NTkM38XXbw+MCAAmN2pp
	6EYmYLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfM4-0000000DvDY-0yHF;
	Wed, 05 Nov 2025 15:23:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfM1-0000000DvCX-3FGw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:23:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E9901692;
	Wed,  5 Nov 2025 07:23:10 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 118C03F63F;
	Wed,  5 Nov 2025 07:23:17 -0800 (PST)
Date: Wed, 5 Nov 2025 15:23:16 +0000
From: Leo Yan <leo.yan@arm.com>
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Linu Cherian <lcherian@marvell.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
Message-ID: <20251105152316.GA281971@e132581.arm.com>
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_072321_954360_1087FD63 
X-CRM114-Status: GOOD (  26.53  )
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

On Tue, Oct 21, 2025 at 04:45:25PM +0800, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
> 
> Fixes: bd2767ec3df2 ("coresight: Fix run time warnings while reusing ETR buffer")
> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>

Tested on my Juno board with below steps:

  1) Enable the first path: ETM2 -> ETR0
  echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source

  2) Enlarge buffer size from 1MiB to 4MiB
  cat /sys/bus/coresight/devices/tmc_etr0/buffer_size
  0x100000
  echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size

  3) Enable the second path: ETM0 -> ETR0
  echo 1 > /sys/bus/coresight/devices/etm0/enable_source

  4) Disable paths
  echo 0 > /sys/bus/coresight/devices/etm0/enable_source
  echo 0 > /sys/bus/coresight/devices/etm2/enable_source

Without this patch, the oops will be triggered when disable paths.
I can confirm this patch does dismiss the issue.

Tested-by: Leo Yan <leo.yan@arm.com>

> ---
> Changes in v3:
> - Add a fix tag for the fix patch.
> - Link to v2: https://lore.kernel.org/r/20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com
> 
> Changes in v2:
> - Exit earlier to avoid allocating memory unnecessarily.
> - Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..800be06598c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>  	 * with the lock released.
>  	 */
>  	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +
> +	/*
> +	 * If the ETR is already enabled, continue with the existing buffer.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>  	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
>  	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
>  		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,
> -- 
> Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> 
> 

