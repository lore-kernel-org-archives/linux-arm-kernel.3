Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5827FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9l7kfCBA2cs7PkOgzQd41fpeGxaVdiNT2GRWXLR1Ow=; b=ycvDp1bGyG6otVORkwi4BYeD5V
	8bytiIeOLy1nWdHvw0uqCEBh6SkBM1MvpUJgMP1UYeggMYN6uUO/3jZV+GoUtxLKQW/NNTSMiO5sh
	CUdBL7Tq08u5UTxriRYRoDzZhksW4INpvVEkM4EbEKzBBjqMo58ItYY/BvDXvjuduPofJi9dX8xvd
	i4UyGFi0bFm8A1d/vtpXAp29ujFaJQw/zw7X8eVSruSmuD78Rndok7KRJcAqnghhjFyKqIpQnPLd6
	ozXGoAf0KIV2+cqN5iZowc3g80asZMWRMxpJ3gksw1LhVyyTWvybiMEAewfcu7rDUbRiqYYfD/BB9
	o72ktvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyALC-00000004jzG-2uqi;
	Mon, 15 Sep 2025 14:38:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAL9-00000004jxQ-4Au3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:38:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24cca557085so397675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757947079; x=1758551879; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9l7kfCBA2cs7PkOgzQd41fpeGxaVdiNT2GRWXLR1Ow=;
        b=zmXFbo8GYpGItrVfpb750Vwet/Gl/qnONi1Rh+t4QgbudH3LWzDngeRcWd67fCNmXk
         0yA9B4JdwNhYAqA5tGssx3jP1RXtQfKpS2M93r7R2VUPCJD1y9oe8osVaMbYvsjpJmj7
         BgDnXlXEFD/42zxfyZ40NmnYT4aRI34EUbjpTXGeLqlT5Q3LNUPQYZ7Y+bIV1RP6v46J
         5X4ylmtQtEF4Z8Wcp23R+xWVvUVfx4DNfsNce6Lb/9w9J2xKAuooQ7RhN6LHe+j6jiJi
         9oUKvgB1l4C7T5h7YF03/2/0jo1lTJSDO/DWJAyYIPFYnO6yDi1ZTtszTe42jYYd8Syf
         6UUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757947079; x=1758551879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9l7kfCBA2cs7PkOgzQd41fpeGxaVdiNT2GRWXLR1Ow=;
        b=FPIzyF4NdDAcPMDcVJyecgexYRXLfeSR7MuLYfdlmPM5jZUBSkCPZN+ERCVWyfD/PW
         c7VJis4lWoJLmFLLnb2x0VCesgciMTnPLL+DCNAkgMoE/QrpHLwtRcLmJmNwrf8wQg2x
         qaHRDcpU3PQRuh+ziBvUHhhf1YYj4bGP7hhrFvttn2x/fWoCUzWy+w34FQjWXdFOrZT0
         mIpwzRHhoiAexOTd9VLR06ByBv3jWstlPdwwHc+6eH/DqT0QzjrtQUGN4WIr8yceGVlE
         HFnvKHF/UarYFQa8TYCLt7zX3ECy+Y6cyYOGWi2JNfXPrInaN+n4/HqIWzvPfUywSKD0
         uUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU19/4uaAj8hkEBuZFffTRWFrFQnXmSn/v7AVzuGPUUKBXQjP/3Ww3lDoSznqya3qeBITge9wi3Cuy40t0QhylE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq4WQ4nm7UenltR68n2c9Eapg4CO0fwTxLPmSBhL7/DJiL3P74
	Mh5J6B68IUuCvgxD/Nbryp+02k8xSVqX657YRN54MSMxRJ/r0BaFrWvxJd4DL0yIWg==
X-Gm-Gg: ASbGncu2kG4yOVcNe8LOQEG6pOQghuZMNLboNPbeSZGIi+hfv5aodOmydU8ogEuU+e5
	z/6NGytwUBMJmdSWZEWFOdQqqdoEcxplsMldQ4kyCnVj3p7OINPT+Xh1u49LsAFHRW98wdaVTkJ
	pq90xKOHQz7Zf33j30c9KoHf7fCO/tKcNfm/YrzlDEs9D/+XxtznxCx7NkPLHwgU913IytneuDI
	w3PknXBNMcU1rXNwyNPyQW7kJBS8GKYyKaZ4yroOhnptCcQy2HEVNo0aRScwUq3kDLYFzGwt3BS
	//vxELT7UPAjxxvOg1xP2ersZZm8WDyO+VuiVF6nDDj9d7Qq4IygaIBjQ5IxtjjDvhEhJgUIPVY
	remujGJEEjzFgoiev5ZtptvZjXlYemyk7ST66tECX+yfM5SPoPkhquRD6bOEZYTo=
X-Google-Smtp-Source: AGHT+IGhfmd7g1PxAjlI0hYoPute4cdl8W6oRNhYET11FPPMJfr+Sk6514yvFJkaiLa+4xRUIMBrbA==
X-Received: by 2002:a17:902:f542:b0:264:9b0d:3197 with SMTP id d9443c01a7336-2649b0d3435mr4027565ad.6.1757947078628;
        Mon, 15 Sep 2025 07:37:58 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-265819a61a7sm41148385ad.48.2025.09.15.07.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:37:56 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:37:49 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 04/28] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <aMgkvTLAWLUJ7OD5@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073800_064344_8702CA49 
X-CRM114-Status: GOOD (  40.33  )
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

On Tue, Aug 19, 2025 at 09:51:32PM +0000, Mostafa Saleh wrote:
> Soon, io-pgtable-arm.c will be compiled as part of the KVM/arm64
> in the hypervisor object, which doesn't have many of the kernel APIs,
> as faux devices, printk...
> 
> We would need to factor this things outside of this file, this patch
> moves the selftests outside, which remove many of the kernel
> dependencies, which also is not needed by the hypervisor.
> Create io-pgtable-arm-kernel.c for that, and in the next patch
> the rest of the code is factored out.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Makefile                |   2 +-
>  drivers/iommu/io-pgtable-arm-kernel.c | 216 +++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c        | 245 --------------------------
>  drivers/iommu/io-pgtable-arm.h        |  41 +++++
>  4 files changed, 258 insertions(+), 246 deletions(-)
>  create mode 100644 drivers/iommu/io-pgtable-arm-kernel.c
> 
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 355294fa9033..d601b0e25ef5 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -11,7 +11,7 @@ obj-$(CONFIG_IOMMU_DEBUGFS) += iommu-debugfs.o
>  obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
>  obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
>  obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
> -obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
> +obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o io-pgtable-arm-kernel.o
>  obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
>  obj-$(CONFIG_IOMMU_IOVA) += iova.o
>  obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
> diff --git a/drivers/iommu/io-pgtable-arm-kernel.c b/drivers/iommu/io-pgtable-arm-kernel.c
> new file mode 100644
> index 000000000000..f3b869310964
> --- /dev/null
> +++ b/drivers/iommu/io-pgtable-arm-kernel.c

If this file just contains the selftests, how about naming it
"io-pgtable-arm-selftests.c" ? 

> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * CPU-agnostic ARM page table allocator.
> + *
> + * Copyright (C) 2014 ARM Limited
> + *
> + * Author: Will Deacon <will.deacon@arm.com>
> + */
> +#define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
> +
> +#include <linux/device/faux.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +
> +#include "io-pgtable-arm.h"
> +
> +#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
> +
> +static struct io_pgtable_cfg *cfg_cookie __initdata;
> +
> +static void __init dummy_tlb_flush_all(void *cookie)
> +{
> +	WARN_ON(cookie != cfg_cookie);
> +}
> +
> +static void __init dummy_tlb_flush(unsigned long iova, size_t size,
> +				   size_t granule, void *cookie)
> +{
> +	WARN_ON(cookie != cfg_cookie);
> +	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
> +}
> +
> +static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
> +				      unsigned long iova, size_t granule,
> +				      void *cookie)
> +{
> +	dummy_tlb_flush(iova, granule, granule, cookie);
> +}
> +
> +static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> +	.tlb_flush_all	= dummy_tlb_flush_all,
> +	.tlb_flush_walk	= dummy_tlb_flush,
> +	.tlb_add_page	= dummy_tlb_add_page,
> +};
> +
> +static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> +
> +	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> +		cfg->pgsize_bitmap, cfg->ias);
> +	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> +		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> +		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> +}
> +
> +#define __FAIL(ops, i)	({						\
> +		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
> +		arm_lpae_dump_ops(ops);					\
> +		-EFAULT;						\
> +})
> +
> +static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> +{
> +	static const enum io_pgtable_fmt fmts[] __initconst = {
> +		ARM_64_LPAE_S1,
> +		ARM_64_LPAE_S2,
> +	};
> +
> +	int i, j;
> +	unsigned long iova;
> +	size_t size, mapped;
> +	struct io_pgtable_ops *ops;
> +
> +	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
> +		cfg_cookie = cfg;
> +		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> +		if (!ops) {
> +			pr_err("selftest: failed to allocate io pgtable ops\n");
> +			return -ENOMEM;
> +		}
> +
> +		/*
> +		 * Initial sanity checks.
> +		 * Empty page tables shouldn't provide any translations.
> +		 */
> +		if (ops->iova_to_phys(ops, 42))
> +			return __FAIL(ops, i);
> +
> +		if (ops->iova_to_phys(ops, SZ_1G + 42))
> +			return __FAIL(ops, i);
> +
> +		if (ops->iova_to_phys(ops, SZ_2G + 42))
> +			return __FAIL(ops, i);
> +
> +		/*
> +		 * Distinct mappings of different granule sizes.
> +		 */
> +		iova = 0;
> +		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> +			size = 1UL << j;
> +
> +			if (ops->map_pages(ops, iova, iova, size, 1,
> +					   IOMMU_READ | IOMMU_WRITE |
> +					   IOMMU_NOEXEC | IOMMU_CACHE,
> +					   GFP_KERNEL, &mapped))
> +				return __FAIL(ops, i);
> +
> +			/* Overlapping mappings */
> +			if (!ops->map_pages(ops, iova, iova + size, size, 1,
> +					    IOMMU_READ | IOMMU_NOEXEC,
> +					    GFP_KERNEL, &mapped))
> +				return __FAIL(ops, i);
> +
> +			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> +				return __FAIL(ops, i);
> +
> +			iova += SZ_1G;
> +		}
> +
> +		/* Full unmap */
> +		iova = 0;
> +		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> +			size = 1UL << j;
> +
> +			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> +				return __FAIL(ops, i);
> +
> +			if (ops->iova_to_phys(ops, iova + 42))
> +				return __FAIL(ops, i);
> +
> +			/* Remap full block */
> +			if (ops->map_pages(ops, iova, iova, size, 1,
> +					   IOMMU_WRITE, GFP_KERNEL, &mapped))
> +				return __FAIL(ops, i);
> +
> +			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> +				return __FAIL(ops, i);
> +
> +			iova += SZ_1G;
> +		}
> +
> +		/*
> +		 * Map/unmap the last largest supported page of the IAS, this can
> +		 * trigger corner cases in the concatednated page tables.
> +		 */
> +		mapped = 0;
> +		size = 1UL << __fls(cfg->pgsize_bitmap);
> +		iova = (1UL << cfg->ias) - size;
> +		if (ops->map_pages(ops, iova, iova, size, 1,
> +				   IOMMU_READ | IOMMU_WRITE |
> +				   IOMMU_NOEXEC | IOMMU_CACHE,
> +				   GFP_KERNEL, &mapped))
> +			return __FAIL(ops, i);
> +		if (mapped != size)
> +			return __FAIL(ops, i);
> +		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> +			return __FAIL(ops, i);
> +
> +		free_io_pgtable_ops(ops);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init arm_lpae_do_selftests(void)
> +{
> +	static const unsigned long pgsize[] __initconst = {
> +		SZ_4K | SZ_2M | SZ_1G,
> +		SZ_16K | SZ_32M,
> +		SZ_64K | SZ_512M,
> +	};
> +
> +	static const unsigned int address_size[] __initconst = {
> +		32, 36, 40, 42, 44, 48,
> +	};
> +
> +	int i, j, k, pass = 0, fail = 0;
> +	struct faux_device *dev;
> +	struct io_pgtable_cfg cfg = {
> +		.tlb = &dummy_tlb_ops,
> +		.coherent_walk = true,
> +		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
> +	};
> +
> +	dev = faux_device_create("io-pgtable-test", NULL, 0);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	cfg.iommu_dev = &dev->dev;
> +
> +	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
> +		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> +			/* Don't use ias > oas as it is not valid for stage-2. */
> +			for (k = 0; k <= j; ++k) {
> +				cfg.pgsize_bitmap = pgsize[i];
> +				cfg.ias = address_size[k];
> +				cfg.oas = address_size[j];
> +				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> +					pgsize[i], cfg.ias, cfg.oas);
> +				if (arm_lpae_run_tests(&cfg))
> +					fail++;
> +				else
> +					pass++;
> +			}
> +		}
> +	}
> +
> +	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> +	faux_device_destroy(dev);
> +
> +	return fail ? -EFAULT : 0;
> +}
> +subsys_initcall(arm_lpae_do_selftests);
> +#endif
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 96425e92f313..791a2c4ecb83 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -7,15 +7,10 @@
>   * Author: Will Deacon <will.deacon@arm.com>
>   */
>  
> -#define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
> -
>  #include <linux/atomic.h>
>  #include <linux/bitops.h>
>  #include <linux/io-pgtable.h>
> -#include <linux/kernel.h>
> -#include <linux/device/faux.h>
>  #include <linux/sizes.h>
> -#include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/dma-mapping.h>
>  
> @@ -24,33 +19,6 @@
>  #include "io-pgtable-arm.h"
>  #include "iommu-pages.h"
>  
> -#define ARM_LPAE_MAX_ADDR_BITS		52
> -#define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
> -#define ARM_LPAE_MAX_LEVELS		4
> -
> -/* Struct accessors */
> -#define io_pgtable_to_data(x)						\
> -	container_of((x), struct arm_lpae_io_pgtable, iop)
> -
> -#define io_pgtable_ops_to_data(x)					\
> -	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
> -
> -/*
> - * Calculate the right shift amount to get to the portion describing level l
> - * in a virtual address mapped by the pagetable in d.
> - */
> -#define ARM_LPAE_LVL_SHIFT(l,d)						\
> -	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
> -	ilog2(sizeof(arm_lpae_iopte)))
> -
> -#define ARM_LPAE_GRANULE(d)						\
> -	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
> -#define ARM_LPAE_PGD_SIZE(d)						\
> -	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
> -
> -#define ARM_LPAE_PTES_PER_TABLE(d)					\
> -	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
> -
>  /*
>   * Calculate the index at level l used to map virtual address a using the
>   * pagetable in d.
> @@ -163,18 +131,6 @@
>  #define iopte_set_writeable_clean(ptep)				\
>  	set_bit(ARM_LPAE_PTE_AP_RDONLY_BIT, (unsigned long *)(ptep))
>  
> -struct arm_lpae_io_pgtable {
> -	struct io_pgtable	iop;
> -
> -	int			pgd_bits;
> -	int			start_level;
> -	int			bits_per_level;
> -
> -	void			*pgd;
> -};
> -
> -typedef u64 arm_lpae_iopte;
> -
>  static inline bool iopte_leaf(arm_lpae_iopte pte, int lvl,
>  			      enum io_pgtable_fmt fmt)
>  {
> @@ -1274,204 +1230,3 @@ struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
>  	.alloc	= arm_mali_lpae_alloc_pgtable,
>  	.free	= arm_lpae_free_pgtable,
>  };
> -
> -#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
> -
> -static struct io_pgtable_cfg *cfg_cookie __initdata;
> -
> -static void __init dummy_tlb_flush_all(void *cookie)
> -{
> -	WARN_ON(cookie != cfg_cookie);
> -}
> -
> -static void __init dummy_tlb_flush(unsigned long iova, size_t size,
> -				   size_t granule, void *cookie)
> -{
> -	WARN_ON(cookie != cfg_cookie);
> -	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
> -}
> -
> -static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
> -				      unsigned long iova, size_t granule,
> -				      void *cookie)
> -{
> -	dummy_tlb_flush(iova, granule, granule, cookie);
> -}
> -
> -static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> -	.tlb_flush_all	= dummy_tlb_flush_all,
> -	.tlb_flush_walk	= dummy_tlb_flush,
> -	.tlb_add_page	= dummy_tlb_add_page,
> -};
> -
> -static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> -{
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> -
> -	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> -		cfg->pgsize_bitmap, cfg->ias);
> -	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> -		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> -		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> -}
> -
> -#define __FAIL(ops, i)	({						\
> -		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
> -		arm_lpae_dump_ops(ops);					\
> -		-EFAULT;						\
> -})
> -
> -static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> -{
> -	static const enum io_pgtable_fmt fmts[] __initconst = {
> -		ARM_64_LPAE_S1,
> -		ARM_64_LPAE_S2,
> -	};
> -
> -	int i, j;
> -	unsigned long iova;
> -	size_t size, mapped;
> -	struct io_pgtable_ops *ops;
> -
> -	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
> -		cfg_cookie = cfg;
> -		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> -		if (!ops) {
> -			pr_err("selftest: failed to allocate io pgtable ops\n");
> -			return -ENOMEM;
> -		}
> -
> -		/*
> -		 * Initial sanity checks.
> -		 * Empty page tables shouldn't provide any translations.
> -		 */
> -		if (ops->iova_to_phys(ops, 42))
> -			return __FAIL(ops, i);
> -
> -		if (ops->iova_to_phys(ops, SZ_1G + 42))
> -			return __FAIL(ops, i);
> -
> -		if (ops->iova_to_phys(ops, SZ_2G + 42))
> -			return __FAIL(ops, i);
> -
> -		/*
> -		 * Distinct mappings of different granule sizes.
> -		 */
> -		iova = 0;
> -		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> -			size = 1UL << j;
> -
> -			if (ops->map_pages(ops, iova, iova, size, 1,
> -					   IOMMU_READ | IOMMU_WRITE |
> -					   IOMMU_NOEXEC | IOMMU_CACHE,
> -					   GFP_KERNEL, &mapped))
> -				return __FAIL(ops, i);
> -
> -			/* Overlapping mappings */
> -			if (!ops->map_pages(ops, iova, iova + size, size, 1,
> -					    IOMMU_READ | IOMMU_NOEXEC,
> -					    GFP_KERNEL, &mapped))
> -				return __FAIL(ops, i);
> -
> -			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> -				return __FAIL(ops, i);
> -
> -			iova += SZ_1G;
> -		}
> -
> -		/* Full unmap */
> -		iova = 0;
> -		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> -			size = 1UL << j;
> -
> -			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> -				return __FAIL(ops, i);
> -
> -			if (ops->iova_to_phys(ops, iova + 42))
> -				return __FAIL(ops, i);
> -
> -			/* Remap full block */
> -			if (ops->map_pages(ops, iova, iova, size, 1,
> -					   IOMMU_WRITE, GFP_KERNEL, &mapped))
> -				return __FAIL(ops, i);
> -
> -			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> -				return __FAIL(ops, i);
> -
> -			iova += SZ_1G;
> -		}
> -
> -		/*
> -		 * Map/unmap the last largest supported page of the IAS, this can
> -		 * trigger corner cases in the concatednated page tables.
> -		 */
> -		mapped = 0;
> -		size = 1UL << __fls(cfg->pgsize_bitmap);
> -		iova = (1UL << cfg->ias) - size;
> -		if (ops->map_pages(ops, iova, iova, size, 1,
> -				   IOMMU_READ | IOMMU_WRITE |
> -				   IOMMU_NOEXEC | IOMMU_CACHE,
> -				   GFP_KERNEL, &mapped))
> -			return __FAIL(ops, i);
> -		if (mapped != size)
> -			return __FAIL(ops, i);
> -		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> -			return __FAIL(ops, i);
> -
> -		free_io_pgtable_ops(ops);
> -	}
> -
> -	return 0;
> -}
> -
> -static int __init arm_lpae_do_selftests(void)
> -{
> -	static const unsigned long pgsize[] __initconst = {
> -		SZ_4K | SZ_2M | SZ_1G,
> -		SZ_16K | SZ_32M,
> -		SZ_64K | SZ_512M,
> -	};
> -
> -	static const unsigned int address_size[] __initconst = {
> -		32, 36, 40, 42, 44, 48,
> -	};
> -
> -	int i, j, k, pass = 0, fail = 0;
> -	struct faux_device *dev;
> -	struct io_pgtable_cfg cfg = {
> -		.tlb = &dummy_tlb_ops,
> -		.coherent_walk = true,
> -		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
> -	};
> -
> -	dev = faux_device_create("io-pgtable-test", NULL, 0);
> -	if (!dev)
> -		return -ENOMEM;
> -
> -	cfg.iommu_dev = &dev->dev;
> -
> -	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
> -		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> -			/* Don't use ias > oas as it is not valid for stage-2. */
> -			for (k = 0; k <= j; ++k) {
> -				cfg.pgsize_bitmap = pgsize[i];
> -				cfg.ias = address_size[k];
> -				cfg.oas = address_size[j];
> -				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> -					pgsize[i], cfg.ias, cfg.oas);
> -				if (arm_lpae_run_tests(&cfg))
> -					fail++;
> -				else
> -					pass++;
> -			}
> -		}
> -	}
> -
> -	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> -	faux_device_destroy(dev);
> -
> -	return fail ? -EFAULT : 0;
> -}
> -subsys_initcall(arm_lpae_do_selftests);
> -#endif
> diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
> index ba7cfdf7afa0..a06a23543cff 100644
> --- a/drivers/iommu/io-pgtable-arm.h
> +++ b/drivers/iommu/io-pgtable-arm.h
> @@ -2,6 +2,8 @@
>  #ifndef IO_PGTABLE_ARM_H_
>  #define IO_PGTABLE_ARM_H_
>  
> +#include <linux/io-pgtable.h>
> +
>  #define ARM_LPAE_TCR_TG0_4K		0
>  #define ARM_LPAE_TCR_TG0_64K		1
>  #define ARM_LPAE_TCR_TG0_16K		2
> @@ -27,4 +29,43 @@
>  #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
>  #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
>  
> +/* Struct accessors */
> +#define io_pgtable_to_data(x)						\
> +	container_of((x), struct arm_lpae_io_pgtable, iop)
> +
> +#define io_pgtable_ops_to_data(x)					\
> +	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
> +
> +struct arm_lpae_io_pgtable {
> +	struct io_pgtable	iop;
> +
> +	int			pgd_bits;
> +	int			start_level;
> +	int			bits_per_level;
> +
> +	void			*pgd;
> +};
> +
> +#define ARM_LPAE_MAX_ADDR_BITS		52
> +#define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
> +#define ARM_LPAE_MAX_LEVELS		4
> +
> +/*
> + * Calculate the right shift amount to get to the portion describing level l
> + * in a virtual address mapped by the pagetable in d.
> + */
> +#define ARM_LPAE_LVL_SHIFT(l,d)						\
> +	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
> +	ilog2(sizeof(arm_lpae_iopte)))
> +
> +#define ARM_LPAE_GRANULE(d)						\
> +	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
> +#define ARM_LPAE_PGD_SIZE(d)						\
> +	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
> +
> +#define ARM_LPAE_PTES_PER_TABLE(d)					\
> +	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
> +
> +typedef u64 arm_lpae_iopte;
> +
>  #endif /* IO_PGTABLE_ARM_H_ */

Apart from the renaming above, I was able to apply this patch alone, and
build succesfully while toggling IOMMU_IO_PGTABLE_LPAE_SELFTEST across 
builds.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.51.0.rc1.167.g924127e9c0-goog
> 

