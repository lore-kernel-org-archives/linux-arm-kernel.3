Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C3ECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HShoPQmKhWPfy1OnMwKg01Y3DNas9O6fwq8aUeABtfI=; b=BNrXH2ENvauHSzoAaq11cafwgA
	v167TT6nf5KBQM2sI3XmqYEz96SNR2S/vVlpYbmSGqlXLZqi8Q0iwYY/d8xQVDLSbtYVaFW7+UMio
	ueL5RGSUZxwXi4pgHnJ1Jci7ClJ4R/D265ZwXsW4g3ydr691z0TzMNKv7j8IhgsdeVCPkhhF0Yagn
	toaj28qdxiZHAz4VqFh2TVFN6a2wtPAPwMtAGQzP/14zo/mjl5aQkbtIjhh8fNUCd8WPv95+WGeKz
	UASKyV+J7wsbpjcRh2DrVF/mvmw82RgS1STQb0fWlZJfkLKL2choiWusAkVFjo5UGJLgOEeEVLOUY
	qPShk9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWLV-000000082Tq-2CJs;
	Tue, 16 Sep 2025 14:07:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWLT-000000082Ss-0RFb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:07:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45f2d21cbabso54595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758031665; x=1758636465; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HShoPQmKhWPfy1OnMwKg01Y3DNas9O6fwq8aUeABtfI=;
        b=IZfTqD/4reE9QrtP7CZMn+Zgx73MJ46D7CLMXioumAQfZ//i7A7Rg3zMhkYvtWcVf/
         2oGLtBFzhr8SkyIODNhAqvsP/s8di5YeXYxyw0PkT3fvmgVMAq1WKws9lQGokLRNM3x0
         N52l5NvuOiZza9wtJ6sxYG3P3hmuGB3z9I7qmhV6T8Iy8XJC0/jWAVdwNrEBF2uW8T4w
         rzU2aoGJetd79EadumlkUYhPgIMe9ACDvq4fa81peNChO/zyqdVPuFJuet6MXVBkKmBB
         CNBH/kCvnlM0ApvKPztVe12kl5wDW5KbUNj3ZSA0QdzDz8ZOcwU/L5eNDpIpDk+iv/a3
         8hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031665; x=1758636465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HShoPQmKhWPfy1OnMwKg01Y3DNas9O6fwq8aUeABtfI=;
        b=IiKX7k0DsZdk4wiYvG0UBcaFpYVDv0Zm0PSg3tEg4ZnFqaGnT9b/gYlZFMewhAwZQG
         VCq4gay3btQEtR+9R08fgBuVITnSjkdiNsAhLnO7gMEDvBZPQHiMQmZmSY9Ff75BrA9q
         kZIgKTnV5FJXpum3+XqJvzLjJNO5kbQZ+9TqApwxA4klAgT3axGJaVC8ZXTac2ReaNwb
         t5kKno/4F9mgc0SbEi7OxsMs1foVqz/7jm6zjTZRuAswbn0wgQNXjIt9c5THF2kmV3MX
         r9bIedDVjayvsy6rpnf0VqJ10fnlLCHPah8++ERQLdmUN9lxCwdYDMQtJxlB4qZDcvJC
         wswA==
X-Forwarded-Encrypted: i=1; AJvYcCXS8EUpKMj0wgn1ORvuNKfjS8ng5kv2+HvXtvK1K9urmjHIQ6RC6w8i3kOMBPtUEjLscA+QKZ/edr0uv5uYjC31@lists.infradead.org
X-Gm-Message-State: AOJu0YxplVOpYzZInvx6rGB2dNK+JHyvPlVLFI+gWlhHoJRpAttolMxe
	DkFYEhCEQWO8iEwVGK7iibsMz7KuPrrV+27IXprEB2+R/IJfgZLNrK/5bGOYDL0zAA==
X-Gm-Gg: ASbGncuNoBNmjLkLo7Kv1i/9x0QcWfgJS7uBkHYhQA57Y12B8huBjN+KNpyfAF9B7lR
	2GweRmuqba327Cqk5JJTngqdyzVCjOLwC0QKNPm4PcM9gpmTJ2MZWg3BGJVOSQtb8bRlo3HeOOY
	gIckFlTI5lH8nioR3GnxQV01oG+MlmIVgAgjzgbufFwUn1VtNcR0AgtwW1egMg2kP94qgntAuKK
	Mej+aYPP/YmotRuuZ4c/iM72TSUp7Uc/zKNvlW4UcLDza3Ox/3keZ/Gfrv+WtPxmTTI/dSXue4v
	+epq0Kx4ZfW80hgz9qqheEmsDBQVEjD0UugfTGARbkQ0Bqy3L2K02zTYnw7GrBGaH71lEqDZUH/
	hoA5g1FA6lL9YoCdK8Wm/rkkykxYod5Hu7Hh/WPbJ6PZPD6cT/AFrx3mqIfhpCckXzVGVRwW5dZ
	FtPryb
X-Google-Smtp-Source: AGHT+IEVo4a+qAIT+mxk3e2bBJu0HzPute2usozdzr8r6tBTGChpG2GP9sikTw0U3WHTfaTbYtNMLw==
X-Received: by 2002:a05:600c:8b6a:b0:45f:5b02:b0cb with SMTP id 5b1f17b1804b1-45f5b02b390mr1185505e9.0.1758031664917;
        Tue, 16 Sep 2025 07:07:44 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdbc7fe1bsm804909f8f.52.2025.09.16.07.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:07:44 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:07:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 04/28] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <aMlvLHFgubf0lcfO@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-5-smostafa@google.com>
 <aMgkvTLAWLUJ7OD5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMgkvTLAWLUJ7OD5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_070747_310849_98D6D1CF 
X-CRM114-Status: GOOD (  44.51  )
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

On Mon, Sep 15, 2025 at 02:37:49PM +0000, Pranjal Shrivastava wrote:
> On Tue, Aug 19, 2025 at 09:51:32PM +0000, Mostafa Saleh wrote:
> > Soon, io-pgtable-arm.c will be compiled as part of the KVM/arm64
> > in the hypervisor object, which doesn't have many of the kernel APIs,
> > as faux devices, printk...
> > 
> > We would need to factor this things outside of this file, this patch
> > moves the selftests outside, which remove many of the kernel
> > dependencies, which also is not needed by the hypervisor.
> > Create io-pgtable-arm-kernel.c for that, and in the next patch
> > the rest of the code is factored out.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/Makefile                |   2 +-
> >  drivers/iommu/io-pgtable-arm-kernel.c | 216 +++++++++++++++++++++++
> >  drivers/iommu/io-pgtable-arm.c        | 245 --------------------------
> >  drivers/iommu/io-pgtable-arm.h        |  41 +++++
> >  4 files changed, 258 insertions(+), 246 deletions(-)
> >  create mode 100644 drivers/iommu/io-pgtable-arm-kernel.c
> > 
> > diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> > index 355294fa9033..d601b0e25ef5 100644
> > --- a/drivers/iommu/Makefile
> > +++ b/drivers/iommu/Makefile
> > @@ -11,7 +11,7 @@ obj-$(CONFIG_IOMMU_DEBUGFS) += iommu-debugfs.o
> >  obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
> >  obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
> >  obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
> > -obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
> > +obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o io-pgtable-arm-kernel.o
> >  obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
> >  obj-$(CONFIG_IOMMU_IOVA) += iova.o
> >  obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
> > diff --git a/drivers/iommu/io-pgtable-arm-kernel.c b/drivers/iommu/io-pgtable-arm-kernel.c
> > new file mode 100644
> > index 000000000000..f3b869310964
> > --- /dev/null
> > +++ b/drivers/iommu/io-pgtable-arm-kernel.c
> 
> If this file just contains the selftests, how about naming it
> "io-pgtable-arm-selftests.c" ? 

In the next patch I am adding more kernel code to it, so it’s not just
selftests, but as Jason suggested, we can just completely move the self
tests out, in that case "io-pgtable-arm-selftests.c" makes sense.

Thanks,
Mostafa

> 
> > @@ -0,0 +1,216 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * CPU-agnostic ARM page table allocator.
> > + *
> > + * Copyright (C) 2014 ARM Limited
> > + *
> > + * Author: Will Deacon <will.deacon@arm.com>
> > + */
> > +#define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
> > +
> > +#include <linux/device/faux.h>
> > +#include <linux/kernel.h>
> > +#include <linux/slab.h>
> > +
> > +#include "io-pgtable-arm.h"
> > +
> > +#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
> > +
> > +static struct io_pgtable_cfg *cfg_cookie __initdata;
> > +
> > +static void __init dummy_tlb_flush_all(void *cookie)
> > +{
> > +	WARN_ON(cookie != cfg_cookie);
> > +}
> > +
> > +static void __init dummy_tlb_flush(unsigned long iova, size_t size,
> > +				   size_t granule, void *cookie)
> > +{
> > +	WARN_ON(cookie != cfg_cookie);
> > +	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
> > +}
> > +
> > +static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
> > +				      unsigned long iova, size_t granule,
> > +				      void *cookie)
> > +{
> > +	dummy_tlb_flush(iova, granule, granule, cookie);
> > +}
> > +
> > +static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> > +	.tlb_flush_all	= dummy_tlb_flush_all,
> > +	.tlb_flush_walk	= dummy_tlb_flush,
> > +	.tlb_add_page	= dummy_tlb_add_page,
> > +};
> > +
> > +static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> > +{
> > +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> > +
> > +	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> > +		cfg->pgsize_bitmap, cfg->ias);
> > +	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> > +		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> > +		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> > +}
> > +
> > +#define __FAIL(ops, i)	({						\
> > +		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
> > +		arm_lpae_dump_ops(ops);					\
> > +		-EFAULT;						\
> > +})
> > +
> > +static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> > +{
> > +	static const enum io_pgtable_fmt fmts[] __initconst = {
> > +		ARM_64_LPAE_S1,
> > +		ARM_64_LPAE_S2,
> > +	};
> > +
> > +	int i, j;
> > +	unsigned long iova;
> > +	size_t size, mapped;
> > +	struct io_pgtable_ops *ops;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
> > +		cfg_cookie = cfg;
> > +		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> > +		if (!ops) {
> > +			pr_err("selftest: failed to allocate io pgtable ops\n");
> > +			return -ENOMEM;
> > +		}
> > +
> > +		/*
> > +		 * Initial sanity checks.
> > +		 * Empty page tables shouldn't provide any translations.
> > +		 */
> > +		if (ops->iova_to_phys(ops, 42))
> > +			return __FAIL(ops, i);
> > +
> > +		if (ops->iova_to_phys(ops, SZ_1G + 42))
> > +			return __FAIL(ops, i);
> > +
> > +		if (ops->iova_to_phys(ops, SZ_2G + 42))
> > +			return __FAIL(ops, i);
> > +
> > +		/*
> > +		 * Distinct mappings of different granule sizes.
> > +		 */
> > +		iova = 0;
> > +		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > +			size = 1UL << j;
> > +
> > +			if (ops->map_pages(ops, iova, iova, size, 1,
> > +					   IOMMU_READ | IOMMU_WRITE |
> > +					   IOMMU_NOEXEC | IOMMU_CACHE,
> > +					   GFP_KERNEL, &mapped))
> > +				return __FAIL(ops, i);
> > +
> > +			/* Overlapping mappings */
> > +			if (!ops->map_pages(ops, iova, iova + size, size, 1,
> > +					    IOMMU_READ | IOMMU_NOEXEC,
> > +					    GFP_KERNEL, &mapped))
> > +				return __FAIL(ops, i);
> > +
> > +			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > +				return __FAIL(ops, i);
> > +
> > +			iova += SZ_1G;
> > +		}
> > +
> > +		/* Full unmap */
> > +		iova = 0;
> > +		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > +			size = 1UL << j;
> > +
> > +			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> > +				return __FAIL(ops, i);
> > +
> > +			if (ops->iova_to_phys(ops, iova + 42))
> > +				return __FAIL(ops, i);
> > +
> > +			/* Remap full block */
> > +			if (ops->map_pages(ops, iova, iova, size, 1,
> > +					   IOMMU_WRITE, GFP_KERNEL, &mapped))
> > +				return __FAIL(ops, i);
> > +
> > +			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > +				return __FAIL(ops, i);
> > +
> > +			iova += SZ_1G;
> > +		}
> > +
> > +		/*
> > +		 * Map/unmap the last largest supported page of the IAS, this can
> > +		 * trigger corner cases in the concatednated page tables.
> > +		 */
> > +		mapped = 0;
> > +		size = 1UL << __fls(cfg->pgsize_bitmap);
> > +		iova = (1UL << cfg->ias) - size;
> > +		if (ops->map_pages(ops, iova, iova, size, 1,
> > +				   IOMMU_READ | IOMMU_WRITE |
> > +				   IOMMU_NOEXEC | IOMMU_CACHE,
> > +				   GFP_KERNEL, &mapped))
> > +			return __FAIL(ops, i);
> > +		if (mapped != size)
> > +			return __FAIL(ops, i);
> > +		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> > +			return __FAIL(ops, i);
> > +
> > +		free_io_pgtable_ops(ops);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int __init arm_lpae_do_selftests(void)
> > +{
> > +	static const unsigned long pgsize[] __initconst = {
> > +		SZ_4K | SZ_2M | SZ_1G,
> > +		SZ_16K | SZ_32M,
> > +		SZ_64K | SZ_512M,
> > +	};
> > +
> > +	static const unsigned int address_size[] __initconst = {
> > +		32, 36, 40, 42, 44, 48,
> > +	};
> > +
> > +	int i, j, k, pass = 0, fail = 0;
> > +	struct faux_device *dev;
> > +	struct io_pgtable_cfg cfg = {
> > +		.tlb = &dummy_tlb_ops,
> > +		.coherent_walk = true,
> > +		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
> > +	};
> > +
> > +	dev = faux_device_create("io-pgtable-test", NULL, 0);
> > +	if (!dev)
> > +		return -ENOMEM;
> > +
> > +	cfg.iommu_dev = &dev->dev;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
> > +		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> > +			/* Don't use ias > oas as it is not valid for stage-2. */
> > +			for (k = 0; k <= j; ++k) {
> > +				cfg.pgsize_bitmap = pgsize[i];
> > +				cfg.ias = address_size[k];
> > +				cfg.oas = address_size[j];
> > +				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> > +					pgsize[i], cfg.ias, cfg.oas);
> > +				if (arm_lpae_run_tests(&cfg))
> > +					fail++;
> > +				else
> > +					pass++;
> > +			}
> > +		}
> > +	}
> > +
> > +	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> > +	faux_device_destroy(dev);
> > +
> > +	return fail ? -EFAULT : 0;
> > +}
> > +subsys_initcall(arm_lpae_do_selftests);
> > +#endif
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 96425e92f313..791a2c4ecb83 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -7,15 +7,10 @@
> >   * Author: Will Deacon <will.deacon@arm.com>
> >   */
> >  
> > -#define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
> > -
> >  #include <linux/atomic.h>
> >  #include <linux/bitops.h>
> >  #include <linux/io-pgtable.h>
> > -#include <linux/kernel.h>
> > -#include <linux/device/faux.h>
> >  #include <linux/sizes.h>
> > -#include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <linux/dma-mapping.h>
> >  
> > @@ -24,33 +19,6 @@
> >  #include "io-pgtable-arm.h"
> >  #include "iommu-pages.h"
> >  
> > -#define ARM_LPAE_MAX_ADDR_BITS		52
> > -#define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
> > -#define ARM_LPAE_MAX_LEVELS		4
> > -
> > -/* Struct accessors */
> > -#define io_pgtable_to_data(x)						\
> > -	container_of((x), struct arm_lpae_io_pgtable, iop)
> > -
> > -#define io_pgtable_ops_to_data(x)					\
> > -	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
> > -
> > -/*
> > - * Calculate the right shift amount to get to the portion describing level l
> > - * in a virtual address mapped by the pagetable in d.
> > - */
> > -#define ARM_LPAE_LVL_SHIFT(l,d)						\
> > -	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
> > -	ilog2(sizeof(arm_lpae_iopte)))
> > -
> > -#define ARM_LPAE_GRANULE(d)						\
> > -	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
> > -#define ARM_LPAE_PGD_SIZE(d)						\
> > -	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
> > -
> > -#define ARM_LPAE_PTES_PER_TABLE(d)					\
> > -	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
> > -
> >  /*
> >   * Calculate the index at level l used to map virtual address a using the
> >   * pagetable in d.
> > @@ -163,18 +131,6 @@
> >  #define iopte_set_writeable_clean(ptep)				\
> >  	set_bit(ARM_LPAE_PTE_AP_RDONLY_BIT, (unsigned long *)(ptep))
> >  
> > -struct arm_lpae_io_pgtable {
> > -	struct io_pgtable	iop;
> > -
> > -	int			pgd_bits;
> > -	int			start_level;
> > -	int			bits_per_level;
> > -
> > -	void			*pgd;
> > -};
> > -
> > -typedef u64 arm_lpae_iopte;
> > -
> >  static inline bool iopte_leaf(arm_lpae_iopte pte, int lvl,
> >  			      enum io_pgtable_fmt fmt)
> >  {
> > @@ -1274,204 +1230,3 @@ struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
> >  	.alloc	= arm_mali_lpae_alloc_pgtable,
> >  	.free	= arm_lpae_free_pgtable,
> >  };
> > -
> > -#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
> > -
> > -static struct io_pgtable_cfg *cfg_cookie __initdata;
> > -
> > -static void __init dummy_tlb_flush_all(void *cookie)
> > -{
> > -	WARN_ON(cookie != cfg_cookie);
> > -}
> > -
> > -static void __init dummy_tlb_flush(unsigned long iova, size_t size,
> > -				   size_t granule, void *cookie)
> > -{
> > -	WARN_ON(cookie != cfg_cookie);
> > -	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
> > -}
> > -
> > -static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
> > -				      unsigned long iova, size_t granule,
> > -				      void *cookie)
> > -{
> > -	dummy_tlb_flush(iova, granule, granule, cookie);
> > -}
> > -
> > -static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> > -	.tlb_flush_all	= dummy_tlb_flush_all,
> > -	.tlb_flush_walk	= dummy_tlb_flush,
> > -	.tlb_add_page	= dummy_tlb_add_page,
> > -};
> > -
> > -static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> > -{
> > -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > -	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> > -
> > -	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> > -		cfg->pgsize_bitmap, cfg->ias);
> > -	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> > -		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> > -		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> > -}
> > -
> > -#define __FAIL(ops, i)	({						\
> > -		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
> > -		arm_lpae_dump_ops(ops);					\
> > -		-EFAULT;						\
> > -})
> > -
> > -static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> > -{
> > -	static const enum io_pgtable_fmt fmts[] __initconst = {
> > -		ARM_64_LPAE_S1,
> > -		ARM_64_LPAE_S2,
> > -	};
> > -
> > -	int i, j;
> > -	unsigned long iova;
> > -	size_t size, mapped;
> > -	struct io_pgtable_ops *ops;
> > -
> > -	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
> > -		cfg_cookie = cfg;
> > -		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> > -		if (!ops) {
> > -			pr_err("selftest: failed to allocate io pgtable ops\n");
> > -			return -ENOMEM;
> > -		}
> > -
> > -		/*
> > -		 * Initial sanity checks.
> > -		 * Empty page tables shouldn't provide any translations.
> > -		 */
> > -		if (ops->iova_to_phys(ops, 42))
> > -			return __FAIL(ops, i);
> > -
> > -		if (ops->iova_to_phys(ops, SZ_1G + 42))
> > -			return __FAIL(ops, i);
> > -
> > -		if (ops->iova_to_phys(ops, SZ_2G + 42))
> > -			return __FAIL(ops, i);
> > -
> > -		/*
> > -		 * Distinct mappings of different granule sizes.
> > -		 */
> > -		iova = 0;
> > -		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > -			size = 1UL << j;
> > -
> > -			if (ops->map_pages(ops, iova, iova, size, 1,
> > -					   IOMMU_READ | IOMMU_WRITE |
> > -					   IOMMU_NOEXEC | IOMMU_CACHE,
> > -					   GFP_KERNEL, &mapped))
> > -				return __FAIL(ops, i);
> > -
> > -			/* Overlapping mappings */
> > -			if (!ops->map_pages(ops, iova, iova + size, size, 1,
> > -					    IOMMU_READ | IOMMU_NOEXEC,
> > -					    GFP_KERNEL, &mapped))
> > -				return __FAIL(ops, i);
> > -
> > -			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > -				return __FAIL(ops, i);
> > -
> > -			iova += SZ_1G;
> > -		}
> > -
> > -		/* Full unmap */
> > -		iova = 0;
> > -		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > -			size = 1UL << j;
> > -
> > -			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> > -				return __FAIL(ops, i);
> > -
> > -			if (ops->iova_to_phys(ops, iova + 42))
> > -				return __FAIL(ops, i);
> > -
> > -			/* Remap full block */
> > -			if (ops->map_pages(ops, iova, iova, size, 1,
> > -					   IOMMU_WRITE, GFP_KERNEL, &mapped))
> > -				return __FAIL(ops, i);
> > -
> > -			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > -				return __FAIL(ops, i);
> > -
> > -			iova += SZ_1G;
> > -		}
> > -
> > -		/*
> > -		 * Map/unmap the last largest supported page of the IAS, this can
> > -		 * trigger corner cases in the concatednated page tables.
> > -		 */
> > -		mapped = 0;
> > -		size = 1UL << __fls(cfg->pgsize_bitmap);
> > -		iova = (1UL << cfg->ias) - size;
> > -		if (ops->map_pages(ops, iova, iova, size, 1,
> > -				   IOMMU_READ | IOMMU_WRITE |
> > -				   IOMMU_NOEXEC | IOMMU_CACHE,
> > -				   GFP_KERNEL, &mapped))
> > -			return __FAIL(ops, i);
> > -		if (mapped != size)
> > -			return __FAIL(ops, i);
> > -		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
> > -			return __FAIL(ops, i);
> > -
> > -		free_io_pgtable_ops(ops);
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -static int __init arm_lpae_do_selftests(void)
> > -{
> > -	static const unsigned long pgsize[] __initconst = {
> > -		SZ_4K | SZ_2M | SZ_1G,
> > -		SZ_16K | SZ_32M,
> > -		SZ_64K | SZ_512M,
> > -	};
> > -
> > -	static const unsigned int address_size[] __initconst = {
> > -		32, 36, 40, 42, 44, 48,
> > -	};
> > -
> > -	int i, j, k, pass = 0, fail = 0;
> > -	struct faux_device *dev;
> > -	struct io_pgtable_cfg cfg = {
> > -		.tlb = &dummy_tlb_ops,
> > -		.coherent_walk = true,
> > -		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
> > -	};
> > -
> > -	dev = faux_device_create("io-pgtable-test", NULL, 0);
> > -	if (!dev)
> > -		return -ENOMEM;
> > -
> > -	cfg.iommu_dev = &dev->dev;
> > -
> > -	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
> > -		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
> > -			/* Don't use ias > oas as it is not valid for stage-2. */
> > -			for (k = 0; k <= j; ++k) {
> > -				cfg.pgsize_bitmap = pgsize[i];
> > -				cfg.ias = address_size[k];
> > -				cfg.oas = address_size[j];
> > -				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
> > -					pgsize[i], cfg.ias, cfg.oas);
> > -				if (arm_lpae_run_tests(&cfg))
> > -					fail++;
> > -				else
> > -					pass++;
> > -			}
> > -		}
> > -	}
> > -
> > -	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
> > -	faux_device_destroy(dev);
> > -
> > -	return fail ? -EFAULT : 0;
> > -}
> > -subsys_initcall(arm_lpae_do_selftests);
> > -#endif
> > diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
> > index ba7cfdf7afa0..a06a23543cff 100644
> > --- a/drivers/iommu/io-pgtable-arm.h
> > +++ b/drivers/iommu/io-pgtable-arm.h
> > @@ -2,6 +2,8 @@
> >  #ifndef IO_PGTABLE_ARM_H_
> >  #define IO_PGTABLE_ARM_H_
> >  
> > +#include <linux/io-pgtable.h>
> > +
> >  #define ARM_LPAE_TCR_TG0_4K		0
> >  #define ARM_LPAE_TCR_TG0_64K		1
> >  #define ARM_LPAE_TCR_TG0_16K		2
> > @@ -27,4 +29,43 @@
> >  #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
> >  #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
> >  
> > +/* Struct accessors */
> > +#define io_pgtable_to_data(x)						\
> > +	container_of((x), struct arm_lpae_io_pgtable, iop)
> > +
> > +#define io_pgtable_ops_to_data(x)					\
> > +	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
> > +
> > +struct arm_lpae_io_pgtable {
> > +	struct io_pgtable	iop;
> > +
> > +	int			pgd_bits;
> > +	int			start_level;
> > +	int			bits_per_level;
> > +
> > +	void			*pgd;
> > +};
> > +
> > +#define ARM_LPAE_MAX_ADDR_BITS		52
> > +#define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
> > +#define ARM_LPAE_MAX_LEVELS		4
> > +
> > +/*
> > + * Calculate the right shift amount to get to the portion describing level l
> > + * in a virtual address mapped by the pagetable in d.
> > + */
> > +#define ARM_LPAE_LVL_SHIFT(l,d)						\
> > +	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
> > +	ilog2(sizeof(arm_lpae_iopte)))
> > +
> > +#define ARM_LPAE_GRANULE(d)						\
> > +	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
> > +#define ARM_LPAE_PGD_SIZE(d)						\
> > +	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
> > +
> > +#define ARM_LPAE_PTES_PER_TABLE(d)					\
> > +	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
> > +
> > +typedef u64 arm_lpae_iopte;
> > +
> >  #endif /* IO_PGTABLE_ARM_H_ */
> 
> Apart from the renaming above, I was able to apply this patch alone, and
> build succesfully while toggling IOMMU_IO_PGTABLE_LPAE_SELFTEST across 
> builds.
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 
> > -- 
> > 2.51.0.rc1.167.g924127e9c0-goog
> > 

