Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A891CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usQROcgrtVOvzODeP+1/ScXY4pMsSqL1oEBvU3RwOH0=; b=zcAD8Y6WuLJ6ZzsCT0T6ESHaap
	wRfyELurhQwLOeUOtO8xJvnn5efvsw7u16Qdy/z7MNK5HAsGixO2/nBbD5IuIBK8vWn2TExvir5xN
	zmmw3kbIyWGXJK0/JURQ1ee+DEt7YupND/IdXgAYcY3c8WFPsRkhRHj8qthZYchmT9xMSBE3Fna2A
	7GQ+CKVikHHoIO7QsIDuYHLZ7kfMTLB8OMIuKtJOy07oOwhM4ITS1bw4VssxmcIBtxT26TtAlC7zY
	OUqGNt9JgA4TklLGq1FuKAlUisVDFULbcVDq6ZovfnUnOhATy/NPNjInpBq1i5futA65zqYTkyBBG
	p8QtU30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fJr-0000000GWN3-43TH;
	Tue, 14 Oct 2025 13:44:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fJo-0000000GWMQ-2Ffs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 13:44:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E7DB1A9A;
	Tue, 14 Oct 2025 06:43:51 -0700 (PDT)
Received: from [10.57.7.84] (unknown [10.57.7.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE97E3F66E;
	Tue, 14 Oct 2025 06:43:56 -0700 (PDT)
Message-ID: <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
Date: Tue, 14 Oct 2025 14:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, praan@google.com,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250929155001.3287719-5-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_064400_735401_A8F19110 
X-CRM114-Status: GOOD (  29.62  )
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

On 2025-09-29 4:49 pm, Mostafa Saleh wrote:
> Integrate the selftests as part of kunit.
> 
> Now instead of the test only being run at boot, it can run:
> 
> - With CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST=y
>    It will automatically run at boot as before.
> 
> - Otherwise with CONFIG_IOMMU_IO_PGTABLE_KUNIT_TEST=m:
>    1) on module load:
>       Once the module load the self test will run
>       # modprobe io-pgtable-arm-selftests
> 
>    2) debugfs
>       With CONFIG_KUNIT_DEBUGFS=y You can run the test with
>       # echo 1 > /sys/kernel/debug/kunit/io-pgtable-arm-test/run
> 
>    3) Using kunit.py
>       You can also use the helper script which uses Qemu in the background
> 
>       # ./tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --arch arm64 \
>         --make_options LLVM=1 --kunitconfig ./kunit/kunitconfig
>        [18:01:09] ============= io-pgtable-arm-test (1 subtest) ==============
>        [18:01:09] [PASSED] arm_lpae_do_selftests
>        [18:01:09] =============== [PASSED] io-pgtable-arm-test ===============
>        [18:01:09] ============================================================
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   drivers/iommu/Kconfig                    | 11 ++--
>   drivers/iommu/Makefile                   |  2 +-
>   drivers/iommu/io-pgtable-arm-selftests.c | 82 +++++++++++++-----------
>   3 files changed, 51 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 553522ef3ca9..d50685433347 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -40,12 +40,13 @@ config IOMMU_IO_PGTABLE_LPAE
>   	  sizes at both stage-1 and stage-2, as well as address spaces
>   	  up to 48-bits in size.
>   
> -config IOMMU_IO_PGTABLE_LPAE_SELFTEST
> -	tristate "LPAE selftests"
> -	depends on IOMMU_IO_PGTABLE_LPAE
> +config IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST
> +	tristate "KUnit tests for LPAE"
> +	depends on IOMMU_IO_PGTABLE_LPAE && KUNIT
> +	default KUNIT_ALL_TESTS
>   	help
> -	  Enable self-tests for LPAE page table allocator. This performs
> -	  a series of page-table consistency checks during boot.
> +	  Enable kunit tests for LPAE page table allocator. This performs
> +	  a series of page-table consistency checks.
>   
>   	  If unsure, say N here.
>   
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 5250a2eea13f..ac3851570303 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -12,7 +12,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
>   obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
>   obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
>   obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
> -obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST) += io-pgtable-arm-selftests.o
> +obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST) += io-pgtable-arm-selftests.o
>   obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
>   obj-$(CONFIG_IOMMU_IOVA) += iova.o
>   obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
> diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
> index 32c6a5c7af53..b61849a8a685 100644
> --- a/drivers/iommu/io-pgtable-arm-selftests.c
> +++ b/drivers/iommu/io-pgtable-arm-selftests.c
> @@ -6,7 +6,8 @@
>    *
>    * Author: Will Deacon <will.deacon@arm.com>
>    */
> -#include <linux/device/faux.h>
> +#include <kunit/device.h>
> +#include <kunit/test.h>
>   #include <linux/io-pgtable.h>
>   #include <linux/kernel.h>
>   
> @@ -47,13 +48,14 @@ static void arm_lpae_dump_ops(struct io_pgtable_ops *ops)
>   		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
>   }
>   
> -#define __FAIL(ops, i)	({						\
> -		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
> -		arm_lpae_dump_ops(ops);					\
> -		-EFAULT;						\
> +#define __FAIL(test, ops, i)	({						\
> +		KUNIT_FAIL(test, "");						\
> +		kunit_err(test, "selftest: test failed for fmt idx %d\n", (i));	\

This looks suspect - AFAICS open-coded kunit_err() is intended for test 
infrastucture errors (like the allocation in the next hunk below), while 
for an actual test report message it seems it should just be:

	KUNIT_FAIL(test, "selftest: test failed for fmt idx %d\n", (i));

> +		arm_lpae_dump_ops(ops);						\
> +		-EFAULT;							\
>   })
>   
> -static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> +static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
>   {
>   	static const enum io_pgtable_fmt fmts[] = {
>   		ARM_64_LPAE_S1,
> @@ -69,7 +71,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   		cfg_cookie = cfg;
>   		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
>   		if (!ops) {
> -			pr_err("selftest: failed to allocate io pgtable ops\n");
> +			kunit_err(test, "selftest: failed to allocate io pgtable ops\n");
>   			return -ENOMEM;
>   		}
>   
> @@ -78,13 +80,13 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   		 * Empty page tables shouldn't provide any translations.
>   		 */
>   		if (ops->iova_to_phys(ops, 42))
> -			return __FAIL(ops, i);
> +			return __FAIL(test, ops, i);
>   
>   		if (ops->iova_to_phys(ops, SZ_1G + 42))
> -			return __FAIL(ops, i);
> +			return __FAIL(test, ops, i);
>   
>   		if (ops->iova_to_phys(ops, SZ_2G + 42))
> -			return __FAIL(ops, i);
> +			return __FAIL(test, ops, i);
>   
>   		/*
>   		 * Distinct mappings of different granule sizes.
> @@ -97,16 +99,16 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   					   IOMMU_READ | IOMMU_WRITE |
>   					   IOMMU_NOEXEC | IOMMU_CACHE,
>   					   GFP_KERNEL, &mapped))
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			/* Overlapping mappings */
>   			if (!ops->map_pages(ops, iova, iova + size, size, 1,
>   					    IOMMU_READ | IOMMU_NOEXEC,
>   					    GFP_KERNEL, &mapped))
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			iova += SZ_1G;
>   		}
> @@ -117,18 +119,18 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   			size = 1UL << j;
>   
>   			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			if (ops->iova_to_phys(ops, iova + 42))
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			/* Remap full block */
>   			if (ops->map_pages(ops, iova, iova, size, 1,
>   					   IOMMU_WRITE, GFP_KERNEL, &mapped))
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> -				return __FAIL(ops, i);
> +				return __FAIL(test, ops, i);
>   
>   			iova += SZ_1G;
>   		}
> @@ -144,11 +146,11 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   				   IOMMU_READ | IOMMU_WRITE |
>   				   IOMMU_NOEXEC | IOMMU_CACHE,
>   				   GFP_KERNEL, &mapped))
> -			return __FAIL(ops, i);
> +			return __FAIL(test, ops, i);
>   		if (mapped != size)
> -			return __FAIL(ops, i);
> +			return __FAIL(test, ops, i);
>   		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> -			return __FAIL(ops, i);
> +			return __FAIL(test, ops, i);
>   
>   		free_io_pgtable_ops(ops);
>   	}
> @@ -156,7 +158,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   	return 0;
>   }
>   
> -static int arm_lpae_do_selftests(void)
> +static void arm_lpae_do_selftests(struct kunit *test)
>   {
>   	static const unsigned long pgsize[] = {
>   		SZ_4K | SZ_2M | SZ_1G,
> @@ -169,18 +171,19 @@ static int arm_lpae_do_selftests(void)
>   	};
>   
>   	int i, j, k, pass = 0, fail = 0;
> -	struct faux_device *dev;
> +	struct device *dev;
>   	struct io_pgtable_cfg cfg = {
>   		.tlb = &dummy_tlb_ops,
>   		.coherent_walk = true,
>   		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
>   	};
>   
> -	dev = faux_device_create("io-pgtable-test", NULL, 0);
> -	if (!dev)
> -		return -ENOMEM;
> +	dev = kunit_device_register(test, "io-pgtable-test");
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);

Conversely, this is infrastructure, not an actual test of expected 
io-pgtable behaviour, so I think just:

	cfg.iommu_dev = kunit_device_register(test, "io-pgtable-test");
	if (IS_ERR(cfg.iommu_dev))
		return;

(it doesn't return NULLs either)

Otherwise, there's clearly scope for plenty more follow-up work 
streamlining and breaking the whole thing up into KUnit idioms, pulling 
the v7s test in, etc... However as a first step to at least set things 
firmly on the right KUnit-shaped path, I agree this seems enough for now.

Thanks,
Robin.

> +	if (IS_ERR_OR_NULL(dev))
> +		return;
>   
> -	cfg.iommu_dev = &dev->dev;
> +	cfg.iommu_dev = dev;
>   
>   	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
>   		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> @@ -189,9 +192,9 @@ static int arm_lpae_do_selftests(void)
>   				cfg.pgsize_bitmap = pgsize[i];
>   				cfg.ias = address_size[k];
>   				cfg.oas = address_size[j];
> -				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> -					pgsize[i], cfg.ias, cfg.oas);
> -				if (arm_lpae_run_tests(&cfg))
> +				kunit_info(test, "selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> +					   pgsize[i], cfg.ias, cfg.oas);
> +				if (arm_lpae_run_tests(test, &cfg))
>   					fail++;
>   				else
>   					pass++;
> @@ -199,17 +202,20 @@ static int arm_lpae_do_selftests(void)
>   		}
>   	}
>   
> -	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> -	faux_device_destroy(dev);
> -
> -	return fail ? -EFAULT : 0;
> +	kunit_info(test, "selftest: completed with %d PASS %d FAIL\n", pass, fail);
>   }
>   
> -static void arm_lpae_exit_selftests(void)
> -{
> -}
> +static struct kunit_case io_pgtable_arm_test_cases[] = {
> +	KUNIT_CASE(arm_lpae_do_selftests),
> +	{},
> +};
> +
> +static struct kunit_suite io_pgtable_arm_test = {
> +	.name = "io-pgtable-arm-test",
> +	.test_cases = io_pgtable_arm_test_cases,
> +};
> +
> +kunit_test_suite(io_pgtable_arm_test);
>   
> -subsys_initcall(arm_lpae_do_selftests);
> -module_exit(arm_lpae_exit_selftests);
>   MODULE_DESCRIPTION("io-pgtable-arm library selftest");
>   MODULE_LICENSE("GPL");

