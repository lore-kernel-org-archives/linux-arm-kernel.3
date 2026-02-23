Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045E8E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bHQQt0nfwa5Gpf+u6EldALeISoOQfF0AYxgdnSK/xs=; b=BVHmMisKiZnjA4Mv08SRUM1zGE
	/JgMmdN3lxp1ATf4eVo8rwlzm/id6kJTvFIuEwBDcVKJfZZN/47usDzAbeRLaO3rBB2xJDYD0zVGM
	1e9rMY6AKc24e1JeAVunEAgRdXj9tKa4XpV4tH/jJnk90ayBkRpz2WTmm+VhycMFRe/lhx/Tv2azW
	2LyaGqMwolfNB8FRfCa75GgiQxdR7bDKDMpytZsIt0kfYyZ/V6Td4glUPOuK1PXIdf17BWesoTDli
	tOGbclGjn5rl6qTsbY6+5AvXi9XMTn6H5cKtza5wus6Yyq+KAsOMMAzv8cux1SfoZ/GQGTBpMwIAd
	celo///g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSaZ-0000000Ha1O-2i6a;
	Mon, 23 Feb 2026 09:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSaX-0000000Ha0E-1ESY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:50:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5DA3339;
	Mon, 23 Feb 2026 01:50:38 -0800 (PST)
Received: from [10.57.72.33] (unknown [10.57.72.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FEAF3F62B;
	Mon, 23 Feb 2026 01:50:43 -0800 (PST)
Message-ID: <666e2c55-a1aa-4960-a084-50921ec7f696@arm.com>
Date: Mon, 23 Feb 2026 09:50:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tmc: Fix overflow when calculating is bigger
 than 2GiB
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Junhao He <hejunhao3@h-partners.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Michiel van Tol <michiel.vantol@arm.com>
References: <20260217-arm_coresight_fix_big_buffer_size-v1-1-774e893d8e3f@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260217-arm_coresight_fix_big_buffer_size-v1-1-774e893d8e3f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_015049_374439_FAD8E0BB 
X-CRM114-Status: GOOD (  20.89  )
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

Hi Leo

On 17/02/2026 13:19, Leo Yan wrote:
> When specifying a 2GB AUX buffer, the ETR driver ends up allocating only
> a 1MB buffer instead:
> 
>    # echo 'file coresight-tmc-etr.c +p' > \
> 	/sys/kernel/debug/dynamic_debug/control
>    # perf record -e cs_etm/@tmc_etr0,timestamp=0/u -C 0 -m ,2G -- test
>    coresight tmc_etr0: allocated buffer of size 1024KB in mode 0
> 
> The page index is an 'int' type, and shifting it by PAGE_SHIFT overflows
> when the resulting value exceeds 2GB.  This produces a negative value,
> causing the driver to fall back to the minimum buffer size (1MB).
> 
> Cast the page index to a wider type to accommodate large buffer sizes.
> Also fix a similar issue in the buffer offset calculation.
> 
> Reported-by: Michiel van Tol <michiel.vantol@arm.com>
> Fixes: 99443ea19e8b ("coresight: Add generic TMC sg table framework")
> Fixes: eebe8dbd8630 ("coresight: tmc: Decouple the perf buffer allocation from sysfs mode")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index cee82e52c4ea96b035f1db71b2d9a006bfc1c51e..990bbb721e1d712d7b93f1e36087fdaf9d3baa3b 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -154,7 +154,7 @@ tmc_pages_get_offset(struct tmc_pages *tmc_pages, dma_addr_t addr)
>   	for (i = 0; i < tmc_pages->nr_pages; i++) {
>   		page_start = tmc_pages->daddrs[i];
>   		if (addr >= page_start && addr < (page_start + PAGE_SIZE))
> -			return i * PAGE_SIZE + (addr - page_start);
> +			return (long)i * PAGE_SIZE + (addr - page_start);
>   	}
>   
>   	return -EINVAL;
> @@ -1381,7 +1381,7 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
>   	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
>   
>   	/* Use the minimum limit if the required size is smaller */
> -	size = nr_pages << PAGE_SHIFT;
> +	size = (ssize_t)nr_pages << PAGE_SHIFT;
>   	size = max_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);
>   
>   	/*
> 

Thanks for the fix. Could we not fix the declaration of the variables 
instead ?  (Also add a comment to make sure people don't revert it back )

Cheers
Suzuki



> ---
> base-commit: eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d
> change-id: 20260217-arm_coresight_fix_big_buffer_size-a8a41298369d
> 
> Best regards,


