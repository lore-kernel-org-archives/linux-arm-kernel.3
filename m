Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30ADCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI/n0cbl1faK6JZJM78qb+T6OT+I/np6AuumtYDHioE=; b=VujUDq2+4RNkNsW6UmMley+PxO
	nHUqlwfvkogbWW5yMmS4cgy/kfi0kaLWP6ADN+JG2Qv9hn+6XZG1DwKryYQq7Pc9t5ZAdRwY9YQUJ
	YbdGtgb4jumO0S5b88b/AjkuYhRHQttdLOKPwfc/pWDdnCdkFY7WAk/ngNeUMCLH8OW53qPwNPjSV
	5bY1mOA52NV8euNnKmy8Z817cOz3YRf7kswzJUCB/9JSgg9l1X24+8hR98TuRyzJgPX0u2O6iXsnC
	tkCGO8MB/nui7d5078D86hXH2qvxGzzy7Fce2425+0vmnt0mPZOCt+smhyrseylQuOI7cSj+gXhjL
	NPtKQKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRk-00000009zJ3-1URm;
	Mon, 22 Sep 2025 10:07:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRh-00000009zFi-03Gn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F063B14BF;
	Mon, 22 Sep 2025 03:06:47 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEAB23F66E;
	Mon, 22 Sep 2025 03:06:55 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:06:53 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] coresight: Fix fwnode leak in coresight_register
 error path
Message-ID: <20250922100653.GE516577@e132581.arm.com>
References: <20250919160653.507109-1-sean.anderson@linux.dev>
 <20250919160653.507109-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919160653.507109-2-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030657_102912_A7CEBB4F 
X-CRM114-Status: GOOD (  19.77  )
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

On Fri, Sep 19, 2025 at 12:06:52PM -0400, Sean Anderson wrote:
> If registering the CPU map fails, we need to put the fwnode. free_percpu
> works when called with a NULL pointer, so just use
> coresight_device_release.
> 
> Fixes: 5ad628a76176 ("coresight: Use per-sink trace ID maps for Perf sessions")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

I have a patch that fixes the same issue:

https://lore.kernel.org/linux-arm-kernel/20250512154108.23920-2-leo.yan@arm.com/

The difference in my patch is about the sequence: first it allocates the
resource, then increases the fw node's reference count. During release,
it first decreases the reference count, and then safely releases the
resource.

After comparing your patch, I still think the above reason is valid.

That said, I agree we should put this fixing before the panic notifier
fix. This would be friendly for backporting.

Thanks,
Leo

> ---
> 
> Changes in v4:
> - New
> 
>  drivers/hwtracing/coresight/coresight-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827..022c8384b98d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1352,7 +1352,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>  		raw_spin_lock_init(&csdev->perf_sink_id_map.lock);
>  		csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
>  		if (!csdev->perf_sink_id_map.cpu_map) {
> -			kfree(csdev);
> +			coresight_device_release(&csdev->dev);
>  			ret = -ENOMEM;
>  			goto err_out;
>  		}
> -- 
> 2.35.1.1320.gc452695387.dirty
> 

