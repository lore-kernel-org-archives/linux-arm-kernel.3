Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77155C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9ftFDlwc/FibPIn46wU+QFfUWQaPXrd9MLqfPuq9UM=; b=K58wcaxnCX68FrkBI9tS1f5qYT
	p+1QKa7raX29FnmNEEb35Xms+qX2bVhOtX+og+irJSr2rCTVGpxU2KHlxF8Wb3rLnvRc9oR9BAQrt
	Mlw9UYbMDz3fAUO1c9G6QiKpwkz1Ce1jUM7ve1qSYrH9kBBURsyxU8Uikz8ko6G1oNt4EonuFgMC0
	t5FzVvqeuuTvXUNmtP99l49uAz+Cpvv8pN3CHZyh6mf0Y9CJMXisdqVM3/56d+hHHwk+C0LE3oP0J
	mZQEujIjKIgZcGnG8HVdCqFCYL3Wb6dh86fvZnLWTlc5YCPu/tlAwbSkqpqiqpylinIqxj53zIjml
	LznkdZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Fb8-0000000E8Ln-3YsM;
	Fri, 11 Apr 2025 14:43:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EII-0000000DtCp-3aKE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:19:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9865A106F;
	Fri, 11 Apr 2025 06:19:41 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617BA3F59E;
	Fri, 11 Apr 2025 06:19:40 -0700 (PDT)
Message-ID: <60c980c1-16b6-460e-89a4-203e9f0cbf3b@arm.com>
Date: Fri, 11 Apr 2025 14:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: dynamically allocate selftest
 device struct
To: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mostafa Saleh <smostafa@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Rob Clark <robdclark@chromium.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250411125423.1411061-1-arnd@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250411125423.1411061-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061942_982459_DC00E9A1 
X-CRM114-Status: GOOD (  24.68  )
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

On 11/04/2025 1:54 pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In general a 'struct device' is way too large to be put on the kernel
> stack. Apparently something just caused it to grow a slightly larger,
> which pushed the arm_lpae_do_selftests() function over the warning
> limit in some configurations:
> 
> drivers/iommu/io-pgtable-arm.c:1423:19: error: stack frame size (1032) exceeds limit (1024) in 'arm_lpae_do_selftests' [-Werror,-Wframe-larger-than]
>   1423 | static int __init arm_lpae_do_selftests(void)
>        |                   ^
> 
> Change the function to use a dynamically allocated platform_device
> instead of the on-stack device structure. The device is not actually
> registered with the system, but is initialized enough to be used here.
> 
> Fixes: ca25ec247aad ("iommu/io-pgtable-arm: Remove iommu_dev==NULL special case")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/iommu/io-pgtable-arm.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7632c80edea6..9f3bf0b5e8da 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -13,6 +13,7 @@
>   #include <linux/bitops.h>
>   #include <linux/io-pgtable.h>
>   #include <linux/kernel.h>
> +#include <linux/platform_device.h>
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> @@ -1433,15 +1434,17 @@ static int __init arm_lpae_do_selftests(void)
>   	};
>   
>   	int i, j, k, pass = 0, fail = 0;
> -	struct device dev;

Could we not simply make this static? Per the comment it's only here to 
serve a NUMA node lookup buried deep in the pagetable allocator (TBH my 
first thought was to just put an int on the stack and contrive a pointer 
as the inverse of dev_to_node(), but I decided that would probably be 
too contentious...)

> +	struct platform_device *pdev;
>   	struct io_pgtable_cfg cfg = {
>   		.tlb = &dummy_tlb_ops,
>   		.coherent_walk = true,
> -		.iommu_dev = &dev,
>   	};
>   
> -	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
> -	set_dev_node(&dev, NUMA_NO_NODE);
> +	pdev = platform_device_alloc("io-pgtable-test", 0);

Otherwise, this would seem to be another perfect case for the new 
faux_device.

Thanks,
Robin.

> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	cfg.iommu_dev = &pdev->dev;
>   
>   	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
>   		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> @@ -1461,6 +1464,8 @@ static int __init arm_lpae_do_selftests(void)
>   	}
>   
>   	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> +	platform_device_put(pdev);
> +
>   	return fail ? -EFAULT : 0;
>   }
>   subsys_initcall(arm_lpae_do_selftests);

