Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C236E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pF9w6wRDM6VrngNoTkozgk/nzYiJ+WZH1nl2Atk8tu8=; b=WA0wCwv4bNPOqIeO/Kg4iUh2ML
	qYQ9btbzx+ZWDeyLdXzuobgCIRhgT6qu6xBShT8xnikWpeqrJGl3gzVhHmw/mpI0T8AO1tPCqVv1e
	RmiAqWIYcqs/FcAjQtAj6tYI5P+l7a1x4UrrZ7rmKrFoS3TOwphmu2iyRK1sOc9R1CN/SakYMFdfm
	vs5qmJuHh4PGDWtVybZ2kc6w+9DzdLccPVqykC435XCrBtVh7JvsXlldHQVH9o6rvaL4vnzf6FQV+
	hYJE3QqIa82a9W93PZyCVuB2nparpAqiCawA208RZrU8Dri83sPXQBBNbx4e+DYPilFlc6kE4xWln
	WxWBhofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCWY-0000000F05r-3rBJ;
	Fri, 10 Jan 2025 10:45:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCVL-0000000Ezr7-0Jgg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:44:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F6BD13D5;
	Fri, 10 Jan 2025 02:45:06 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4A9F3F673;
	Fri, 10 Jan 2025 02:44:36 -0800 (PST)
Message-ID: <7fa2c7c2-0bbf-4d45-bc90-71c4a4a82c0c@arm.com>
Date: Fri, 10 Jan 2025 10:44:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: catu: Fix number of pages while using 64k
 pages
Content-Language: en-GB
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250109215348.5483-1-ilkka@os.amperecomputing.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250109215348.5483-1-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_024439_166868_D655FC9C 
X-CRM114-Status: GOOD (  15.11  )
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

On 09/01/2025 21:53, Ilkka Koskinen wrote:
> Trying to record a trace on kernel with 64k pages resulted in -ENOMEM.
> This happens due to a bug in calculating the number of table pages, which
> returns zero. Fix the issue by rounding up.
> 
> $ perf record --kcore -e cs_etm/@tmc_etr55,cycacc,branch_broadcast/k --per-thread taskset --cpu-list 1 dd if=/dev/zero of=/dev/null
> failed to mmap with 12 (Cannot allocate memory)
> 

Needs a Fixes tag.

Fixes : 8ed536b1e283 ("coresight: catu: Add support for scatter gather 
tables")

> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 275cc0d9f505..3378bb77e6b4 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -269,7 +269,7 @@ catu_init_sg_table(struct device *catu_dev, int node,
>   	 * Each table can address upto 1MB and we can have
>   	 * CATU_PAGES_PER_SYSPAGE tables in a system page.
>   	 */
> -	nr_tpages = DIV_ROUND_UP(size, SZ_1M) / CATU_PAGES_PER_SYSPAGE;
> +	nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
>   	catu_table = tmc_alloc_sg_table(catu_dev, node, nr_tpages,
>   					size >> PAGE_SHIFT, pages);
>   	if (IS_ERR(catu_table))

Looks good to me, I will queue this later for v6.15.

Suzuki

