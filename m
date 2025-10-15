Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D273CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC129mfOqt4svCEhsCGr7Ui4bow4e4J9G+P0XmQlpKM=; b=CdQuKmja318B0hMCkK0qeBupKA
	qNnjS5X64PJEwGJ2z6bLJik6Cr3S+AGIxEjHVW12Gq/o3ow+Ykz+BG1/XdeV7sHncQf3MMt9Ftv2E
	odvQC+pKvdhlfUuGyPjb7FH7q+TWbUciDC0xOO1B9mqmqY0OXMWkB2fLfqiFSougAWpzCvcd2dI8x
	zFKpt83HJlUO1SSslbyhUUvnkHNpned8pcBewo3G8t86e6BktdWFzpbqTz/KcS3YRGmW+NRffWG6j
	oYxF6lXmLzCm60mdQSYIXV6SzK73sjI3DwITcs4b4+jLqk3Mv/4rGWPUYYOWo9mFUm+8g2w2UV2Fa
	PKd8mI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yCa-00000001CXt-0PI3;
	Wed, 15 Oct 2025 09:53:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yCX-00000001CX2-1lXH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:53:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47105bbb8d9so23145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760522023; x=1761126823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UC129mfOqt4svCEhsCGr7Ui4bow4e4J9G+P0XmQlpKM=;
        b=Vs9I8qfkJa+dT2f/vNBHjktN2/+fUxZcovnXYpMSKkcU2+aDXqWNhWrKehzC/xDbP/
         vMT80sRLnMcLagRg4emDb6+QdlwqAXmK6CT43/CZxNfQFFwYtU5XhqgnC++ZRIaV20QJ
         VvL284/QMGwhZjAwhlwi5O9aaxW5vPIAu8ZldkAmDkpZxTvSos3grVkt4OVfgFWJ+Wz2
         fVHkCsPrFtGaUJ7MS2R8UqKQ/jyGGeTeQpSqSydH7CHCfHQtwVThqV4l1qZmoq7KiX+2
         vFKWUJdY34N8lv9Y8DtZm93xPVFyTFtz49jQUsHLkPjw/jI7IGMzLwSWJIgxmFhsz6oV
         JGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760522023; x=1761126823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC129mfOqt4svCEhsCGr7Ui4bow4e4J9G+P0XmQlpKM=;
        b=kOMq05l+GQd5mI0arHW4PRSAD4nhNeE880iLvRrv7gPwd7I82s5VA8J4Zne+TyjpZD
         7nOaQ6OJTswRuKyyO36tqAMgdf0msPcAsN5dWSoDUFt4WMyG46iCCm3YppXkxmstlfsK
         HDTd9PkLdEtabi19Sa5ns5XS/8wkgjHh0mQc7fpEb3g3jQ735vcoLIj/jT45vz4AQcpz
         eKOmcCDO7OyjESpdUgs2cmgcd/D/61ZtV/ryq78EjVqAVA67YW/ZgwJAJUw4TfQtbZo7
         +latf6QM38hkW+Ge2DaRy+wPkM0kmFZZ3/jy0968wMX8r7Rak+FJHWu4CaFO3mZGl5kH
         NRow==
X-Forwarded-Encrypted: i=1; AJvYcCV7YCYVxR49UXV9xbgQXX6a5YUXgaG7ccUVjBDwCTzKXtTEm+2y88xa7pDpF/pzi4VvHRFYPqlStXOwSk5soRHQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzr5n0vZXkC8yFCz5DI+hAVs0waRD6UV7u67hztw4MPoweQlya
	b/W51T2oru6w9Qvk+80MycH5iaTMO1eF6H2UzmQ0je9VsyelP3LhhvhiW1SfUoAixg==
X-Gm-Gg: ASbGncvhwyMOnYfAuL07qzHAjNtKWnq/9M7jVPPMn3NAKY3UsTPVNZBigwVbK5bi6Rb
	6gcxomQcWvcH3BdfV4066iTN18ns2PRGImcbMRBS6L+PjS/doOtaZj3icPlaLstXWxyvlPcwsGW
	Lta3CdWRrcwnZOP0R6FBwmA7KmPKK5wFxsPaXOOQlMupsp1gU3TgHJzJNt6PxHcWD/7jaJl46mG
	pATllv5rDAQ8ttxodieNSoqPCAzMLXdnzFjOBjJ4bP1DyMnhTPshZSvLmpr2O8B4ROcnJ6YRRpW
	uJb1a89BOfWiC29sBGMCiYGpkM+m6GM5DjPOML2qt1RHOhPeh8y50WacBBPriEjSuYEX3RI8nlv
	ptvjNZmNQ9DHsdPSgOZx8UATj5RLWeq914ctkvdbk8c+s2L4Bb3Zvnq2dpq4NqN/YydeghiJMeC
	rdXod2xXGMxVAt0brV1kYP
X-Google-Smtp-Source: AGHT+IHe1E1s7HUbEkXph4hxdxNH+oQJI3gWsBL77vTsMzihUgBJOr2SIJMGce02dMVTe2csEDSXCQ==
X-Received: by 2002:a05:600c:4706:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-470fd61e6dbmr1731065e9.2.1760522023158;
        Wed, 15 Oct 2025 02:53:43 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9absm332974755e9.2.2025.10.15.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:53:42 -0700 (PDT)
Date: Wed, 15 Oct 2025 09:53:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org,
	jgg@ziepe.ca, praan@google.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aO9vI1aEhnyZx1PL@google.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_025345_538877_590C1901 
X-CRM114-Status: GOOD (  41.98  )
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

On Tue, Oct 14, 2025 at 02:43:53PM +0100, Robin Murphy wrote:
> On 2025-09-29 4:49 pm, Mostafa Saleh wrote:
> > Integrate the selftests as part of kunit.
> > 
> > Now instead of the test only being run at boot, it can run:
> > 
> > - With CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST=y
> >    It will automatically run at boot as before.
> > 
> > - Otherwise with CONFIG_IOMMU_IO_PGTABLE_KUNIT_TEST=m:
> >    1) on module load:
> >       Once the module load the self test will run
> >       # modprobe io-pgtable-arm-selftests
> > 
> >    2) debugfs
> >       With CONFIG_KUNIT_DEBUGFS=y You can run the test with
> >       # echo 1 > /sys/kernel/debug/kunit/io-pgtable-arm-test/run
> > 
> >    3) Using kunit.py
> >       You can also use the helper script which uses Qemu in the background
> > 
> >       # ./tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --arch arm64 \
> >         --make_options LLVM=1 --kunitconfig ./kunit/kunitconfig
> >        [18:01:09] ============= io-pgtable-arm-test (1 subtest) ==============
> >        [18:01:09] [PASSED] arm_lpae_do_selftests
> >        [18:01:09] =============== [PASSED] io-pgtable-arm-test ===============
> >        [18:01:09] ============================================================
> > 
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/Kconfig                    | 11 ++--
> >   drivers/iommu/Makefile                   |  2 +-
> >   drivers/iommu/io-pgtable-arm-selftests.c | 82 +++++++++++++-----------
> >   3 files changed, 51 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 553522ef3ca9..d50685433347 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -40,12 +40,13 @@ config IOMMU_IO_PGTABLE_LPAE
> >   	  sizes at both stage-1 and stage-2, as well as address spaces
> >   	  up to 48-bits in size.
> > -config IOMMU_IO_PGTABLE_LPAE_SELFTEST
> > -	tristate "LPAE selftests"
> > -	depends on IOMMU_IO_PGTABLE_LPAE
> > +config IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST
> > +	tristate "KUnit tests for LPAE"
> > +	depends on IOMMU_IO_PGTABLE_LPAE && KUNIT
> > +	default KUNIT_ALL_TESTS
> >   	help
> > -	  Enable self-tests for LPAE page table allocator. This performs
> > -	  a series of page-table consistency checks during boot.
> > +	  Enable kunit tests for LPAE page table allocator. This performs
> > +	  a series of page-table consistency checks.
> >   	  If unsure, say N here.
> > diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> > index 5250a2eea13f..ac3851570303 100644
> > --- a/drivers/iommu/Makefile
> > +++ b/drivers/iommu/Makefile
> > @@ -12,7 +12,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
> >   obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
> >   obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
> >   obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
> > -obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST) += io-pgtable-arm-selftests.o
> > +obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST) += io-pgtable-arm-selftests.o
> >   obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
> >   obj-$(CONFIG_IOMMU_IOVA) += iova.o
> >   obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
> > diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
> > index 32c6a5c7af53..b61849a8a685 100644
> > --- a/drivers/iommu/io-pgtable-arm-selftests.c
> > +++ b/drivers/iommu/io-pgtable-arm-selftests.c
> > @@ -6,7 +6,8 @@
> >    *
> >    * Author: Will Deacon <will.deacon@arm.com>
> >    */
> > -#include <linux/device/faux.h>
> > +#include <kunit/device.h>
> > +#include <kunit/test.h>
> >   #include <linux/io-pgtable.h>
> >   #include <linux/kernel.h>
> > @@ -47,13 +48,14 @@ static void arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> >   		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
> >   }
> > -#define __FAIL(ops, i)	({						\
> > -		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
> > -		arm_lpae_dump_ops(ops);					\
> > -		-EFAULT;						\
> > +#define __FAIL(test, ops, i)	({						\
> > +		KUNIT_FAIL(test, "");						\
> > +		kunit_err(test, "selftest: test failed for fmt idx %d\n", (i));	\
> 
> This looks suspect - AFAICS open-coded kunit_err() is intended for test
> infrastucture errors (like the allocation in the next hunk below), while for
> an actual test report message it seems it should just be:
> 
> 	KUNIT_FAIL(test, "selftest: test failed for fmt idx %d\n", (i));

I see, I used kunit_err, as KUNIT_FAIL adds extra information which was
noisy to be printed more than once as:
  # arm_lpae_do_selftests: EXPECTATION FAILED at drivers/iommu/io-pgtable-arm-selftests.c:91
I will check if there is a better way to do this.

> 
> > +		arm_lpae_dump_ops(ops);						\
> > +		-EFAULT;							\
> >   })
> > -static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> > +static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
> >   {
> >   	static const enum io_pgtable_fmt fmts[] = {
> >   		ARM_64_LPAE_S1,
> > @@ -69,7 +71,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> >   		cfg_cookie = cfg;
> >   		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> >   		if (!ops) {
> > -			pr_err("selftest: failed to allocate io pgtable ops\n");
> > +			kunit_err(test, "selftest: failed to allocate io pgtable ops\n");
> >   			return -ENOMEM;
> >   		}
> > @@ -78,13 +80,13 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> >   		 * Empty page tables shouldn't provide any translations.
> >   		 */
> >   		if (ops->iova_to_phys(ops, 42))
> > -			return __FAIL(ops, i);
> > +			return __FAIL(test, ops, i);
> >   		if (ops->iova_to_phys(ops, SZ_1G + 42))
> > -			return __FAIL(ops, i);
> > +			return __FAIL(test, ops, i);
> >   		if (ops->iova_to_phys(ops, SZ_2G + 42))
> > -			return __FAIL(ops, i);
> > +			return __FAIL(test, ops, i);
> >   		/*
> >   		 * Distinct mappings of different granule sizes.
> > @@ -97,16 +99,16 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> >   					   IOMMU_READ | IOMMU_WRITE |
> >   					   IOMMU_NOEXEC | IOMMU_CACHE,
> >   					   GFP_KERNEL, &mapped))
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			/* Overlapping mappings */
> >   			if (!ops->map_pages(ops, iova, iova + size, size, 1,
> >   					    IOMMU_READ | IOMMU_NOEXEC,
> >   					    GFP_KERNEL, &mapped))
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			iova += SZ_1G;
> >   		}
> > @@ -117,18 +119,18 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> >   			size = 1UL << j;
> >   			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			if (ops->iova_to_phys(ops, iova + 42))
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			/* Remap full block */
> >   			if (ops->map_pages(ops, iova, iova, size, 1,
> >   					   IOMMU_WRITE, GFP_KERNEL, &mapped))
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > -				return __FAIL(ops, i);
> > +				return __FAIL(test, ops, i);
> >   			iova += SZ_1G;
> >   		}
> > @@ -144,11 +146,11 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> >   				   IOMMU_READ | IOMMU_WRITE |
> >   				   IOMMU_NOEXEC | IOMMU_CACHE,
> >   				   GFP_KERNEL, &mapped))
> > -			return __FAIL(ops, i);
> > +			return __FAIL(test, ops, i);
> >   		if (mapped != size)
> > -			return __FAIL(ops, i);
> > +			return __FAIL(test, ops, i);
> >   		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> > -			return __FAIL(ops, i);
> > +			return __FAIL(test, ops, i);
> >   		free_io_pgtable_ops(ops);
> >   	}
> > @@ -156,7 +158,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> >   	return 0;
> >   }
> > -static int arm_lpae_do_selftests(void)
> > +static void arm_lpae_do_selftests(struct kunit *test)
> >   {
> >   	static const unsigned long pgsize[] = {
> >   		SZ_4K | SZ_2M | SZ_1G,
> > @@ -169,18 +171,19 @@ static int arm_lpae_do_selftests(void)
> >   	};
> >   	int i, j, k, pass = 0, fail = 0;
> > -	struct faux_device *dev;
> > +	struct device *dev;
> >   	struct io_pgtable_cfg cfg = {
> >   		.tlb = &dummy_tlb_ops,
> >   		.coherent_walk = true,
> >   		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
> >   	};
> > -	dev = faux_device_create("io-pgtable-test", NULL, 0);
> > -	if (!dev)
> > -		return -ENOMEM;
> > +	dev = kunit_device_register(test, "io-pgtable-test");
> > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);
> 
> Conversely, this is infrastructure, not an actual test of expected
> io-pgtable behaviour, so I think just:
> 
> 	cfg.iommu_dev = kunit_device_register(test, "io-pgtable-test");
> 	if (IS_ERR(cfg.iommu_dev))
> 		return;
> 
> (it doesn't return NULLs either)
> 

Yes, I was not sure about this one, when checking the code base, every test
handles kunit_device_register() failure differently, this seemed the
most strict one so I used it, I will update that in the next version.

> Otherwise, there's clearly scope for plenty more follow-up work streamlining
> and breaking the whole thing up into KUnit idioms, pulling the v7s test in,
> etc... However as a first step to at least set things firmly on the right
> KUnit-shaped path, I agree this seems enough for now.
> 

I agree, ultimately every configuration should be a test, which can be
even broken down to smaller cases. I will look in to that next.

Thanks,
Mostafa

> Thanks,
> Robin.
> 
> > +	if (IS_ERR_OR_NULL(dev))
> > +		return;
> > -	cfg.iommu_dev = &dev->dev;
> > +	cfg.iommu_dev = dev;
> >   	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
> >   		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> > @@ -189,9 +192,9 @@ static int arm_lpae_do_selftests(void)
> >   				cfg.pgsize_bitmap = pgsize[i];
> >   				cfg.ias = address_size[k];
> >   				cfg.oas = address_size[j];
> > -				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> > -					pgsize[i], cfg.ias, cfg.oas);
> > -				if (arm_lpae_run_tests(&cfg))
> > +				kunit_info(test, "selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> > +					   pgsize[i], cfg.ias, cfg.oas);
> > +				if (arm_lpae_run_tests(test, &cfg))
> >   					fail++;
> >   				else
> >   					pass++;
> > @@ -199,17 +202,20 @@ static int arm_lpae_do_selftests(void)
> >   		}
> >   	}
> > -	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> > -	faux_device_destroy(dev);
> > -
> > -	return fail ? -EFAULT : 0;
> > +	kunit_info(test, "selftest: completed with %d PASS %d FAIL\n", pass, fail);
> >   }
> > -static void arm_lpae_exit_selftests(void)
> > -{
> > -}
> > +static struct kunit_case io_pgtable_arm_test_cases[] = {
> > +	KUNIT_CASE(arm_lpae_do_selftests),
> > +	{},
> > +};
> > +
> > +static struct kunit_suite io_pgtable_arm_test = {
> > +	.name = "io-pgtable-arm-test",
> > +	.test_cases = io_pgtable_arm_test_cases,
> > +};
> > +
> > +kunit_test_suite(io_pgtable_arm_test);
> > -subsys_initcall(arm_lpae_do_selftests);
> > -module_exit(arm_lpae_exit_selftests);
> >   MODULE_DESCRIPTION("io-pgtable-arm library selftest");
> >   MODULE_LICENSE("GPL");

