Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC16C98309
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovOwY8bLaV9a90WmLe0SJbMjYqolqHUHY1GzJaJp6yo=; b=Yo4n/DZIWJwxR9mwbu+K5jS79a
	nUVIAKyJxVU80oil0/RR246jMiYzbY4ckVybugInw3sCt8TM09iDz5535SbusAT1Q4GxtDWRKDk8Q
	3eGhf4EN5MHotxnYH5xvbKHKOJvA1RAWQQ4qmyBqeJzGUr1+ZBbmiICQCOV91i4uOj1IYIC5eLXfn
	EoRYCjuy/RLNZbgwZDUL1uqcFB+oGe7jO25TJDERolDp/U1MgiAnWaySYnvpTRShel30HL+XVrMqp
	RCBhUFju012CerO+9w5Yib1Mtsf8h1Yh+5Aymfi6vSyzxEdD6336n8HQefPlUTbKj3E8WHBdM8aLb
	MhoWzTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KF1-00000007tog-1r9o;
	Wed, 23 Sep 2026 10:30:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KEy-00000007toM-04ZG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 10:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ovOwY8bLaV9a90WmLe0SJbMjYqolqHUHY1GzJaJp6yo=; b=aihXyavXe9wCUuDBKnZu9F/AZF
	o7h2g7rngNoifLm/L9KyxPlt0p+R7mhyMgK9nSNxiPO6eX3wcZnWv4uGXfvwilMTdWcvbxcuoXRJV
	vHegGHFkvUs+RNci118lQ9zZzDbo6HX3udlKJrl3XPfeL6T0LzGNeUc32v/mNf4P9yrAj3acvchL/
	CDawj9+dIQqnZwj5Zi1mYMhWeLdJbN5wnwgJmh75J5mDZ2uYOMZBKA99JtEwtYi46iMNDGraMNIkU
	fc1qzGJT8W3xQKxLFd6wniEJ/rgRvZjjrFuz5/mM0dSo51qfgoL/o/VD7BrdICBserD5Qsc5Rk09L
	6r6Zjfrg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9KEu-0000000Ee8t-1Fsx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:30:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-498012a61f6so29755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790159410; x=1790764210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovOwY8bLaV9a90WmLe0SJbMjYqolqHUHY1GzJaJp6yo=;
        b=q4TMfzOos5K9tuqXP179GrR3RpwLstkeuSXoNFCCpKL9DZ12g2fPn8JRcI6KUdAEmn
         xQT8sUS+N0Va7Mi16cAR2wypQysBFkfgBaj302usDvwF5eJ8f31sI0Wf0+8hNeMH+2W3
         CZsRRJTES2mkD8JoVAq60ZGwM3yABigHC1YXIriBDa0uTacN+n3g87nYPloFGf64iTZR
         Q4q5C5KrYxNVZwJv46YVyktpBBCvyrxiGEML0tOhmEooDCiWZJTkuljC43V0aNcCgFVL
         YvkUhlyvQy1FWJucFkV5iCey9S01XrHGDDxv4UaGZ0QQeS9QoddR/m36o7rSMnP/YJF1
         K0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159410; x=1790764210;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovOwY8bLaV9a90WmLe0SJbMjYqolqHUHY1GzJaJp6yo=;
        b=ieOiXnVEICw43ZoGP19Lz5+4FwyYZaeU2pI/YuKqKZHP+r79/p3sTlEPILIDQEsZbe
         +ZO/A4YzQxfObDaQfQY6f1H/ZwgHGrBSIgbN7Fo2ttdAPmlVT3LyrzlcCrcRvn6a4bR7
         JW9xm6TVGNUvY27yDxV/eRu9v25eHH0rw6Lfp3p8hKkjO79Fegoq36V3nKDjt55o4pX6
         0Xo2+Coi7Fi4UN7qnxM6og0+nQRvGfyP03nt0H8o23oqutKb5P5c/1v44wpC+GRrQOZe
         Ctz2gCDNHK0Vg6QIJMjwKX6ScJCFBE6nf+lMZgDI+NUke8Y7tY0nMj6ebfbSOVJnzQrm
         Rqqw==
X-Gm-Message-State: AFuF++k7iEeMHFH+oGqL9Dhwo+blzOD4Jd+Wh+1IJ0DAYNMOqa3EJYtS
	XdDgswNlnQUWw0sjPgFJSQjz0lzmnzwyZQdxoa7YNZQsAUDzx+wN+5A/fRVaLJBOBw==
X-Gm-Gg: AYBFou0+vyPFohq+2TJWsbBCQoR3tw35DBrMZf0n6vrMAyEXcg+obSuz+/zy8bG0Sif
	qeG/3xL5u3mMbY69/CnCe/Oe48kmqLqVZr7rdw1qKX95q4rsK7wqFfYxOhdkSlezMDrSyfo3xRA
	v+rcwGwM63JY1Wl3KYN3OeqpbuayHfUJKLlcLkcrQG3psvU9pTEvWsvIcbk8v8ZPwfvhNPHGTdc
	2iv4zhSH7S7t/h3Sdq83BPe8l7CjO1/rk1Y/6mo8My2G9fKK/eDs4sB1do1f9G/U1jcwd5etSAW
	iUv+nub+MuvSRzMUrwBET9LIOZPMcJT42JirxA2w/09Fl3RrgE5oZURMBYgp3/rAdIMDUAIgWdd
	W36zkK2C14rqZWQUfS1HS0yPWeGkDSkvkSHEAqonnZe/FRfMaTce6agxwjz/HxvCyg/pryzMPUx
	cD5n0dZGeaafoWh3ptzteQ6R91QYWOUWnUAoIFrEpobmztgVGDIXn8fKVLl7pw2miOxq2che6s0
	1LFEfTmGfuw0JbwxsLC7Sz081N4o6CaTV9x0ER9
X-Received: by 2002:a05:600c:8588:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-49fe1a55d46mr425265e9.7.1790159409353;
        Wed, 23 Sep 2026 03:30:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde185329sm68031695e9.1.2026.09.23.03.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:30:08 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:30:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v8 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
Message-ID: <arOqLQTOsofAzCmg@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-11-smostafa@google.com>
 <arMDiPHiMvHVHsBr@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMDiPHiMvHVHsBr@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_113012_713364_31C8E8EF 
X-CRM114-Status: GOOD (  31.52  )
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

On Tue, Sep 22, 2026 at 03:39:04PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:43PM +0000, Mostafa Saleh wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Add the skeleton for an Arm SMMUv3 driver at EL2.
> > 
> > The driver rely on an array of SMMUv3s on the system, where at
> 
> s/rely/relies

Will do.

> 
> > +++ b/drivers/iommu/arm/Kconfig
> > @@ -141,3 +141,15 @@ config QCOM_IOMMU
> >  	select ARM_DMA_USE_IOMMU
> >  	help
> >  	  Support for IOMMU on certain Qualcomm SoCs.
> > +
> > +config ARM_SMMU_V3_PKVM
> > +	bool "ARM SMMUv3 support for protected Virtual Machines"
> > +	depends on KVM && ARM_SMMU_V3=y
> 
> Should it depend on OF?

Makes sense, I will add it.

> 
> > +	help
> > +	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
> 
> s/a SMMUv3/an SMMUv3

Will do.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __KVM_ARM_SMMU_V3_HYP_H
> > +#define __KVM_ARM_SMMU_V3_HYP_H
> > +
> > +#include <asm/kvm_asm.h>
> > +
> > +/*
> > + * Parameters from the trusted host:
> > + * @mmio_addr		base address of the SMMU registers
> > + * @mmio_size		size of the registers resource
> 
> Are these still in the host's physical address space or guest's?
> 
> If it's still "host" (though trusted), what's different from the
> ioaddr in the main driver?

This is the physical address of the SMMUv3 as read from the device
tree.

The "base" pointer is for the hypervisor virtual address which is
created in the private mapping range (similar to ioremap())

The hypervisor doesn't keep the host VA anywhere. Also note that
there is no guest support at the moment, only the host.

> 
> > +size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
> > +struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
> 
> Should kvm_hyp_arm_smmu_v3_smmus be __ro_after_init as well?

That won't work at the moment as the hypervisor writes this pointer
after __ro_after_init to convert the kernel VA to hypervisor VA
unlike the count which is set once at boot.
It might be possible to make the kernel do this conversion early, I
will need to double check.

It's worth noting that __ro_after_init is just for the hypervisor
hardening and not for protection as those are protected by stage-2
MMU.

> 
> > +
> > +#define for_each_smmu(smmu) \
> > +	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
> > +	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
> > +	     (smmu)++)
> 
> "smmu" sounds too generic. Maybe for_each_pkvm_smmu?

This macro is private to this driver, so I guess that's enough, also
smmu is used everywhere else, but no strong opinion.

> 
> > +/* Called while is the host is still trusted. */
> > +static int smmu_init(void)
> 
> s/while is/while

Will do.

> 
> > +/* Shared with the kernel driver in EL1 */
> > +struct pkvm_iommu_ops smmu_ops = {
> > +	.init				= smmu_init,
> > +	.host_stage2_idmap		= smmu_host_stage2_idmap,
> 
> Can we add a "pvkm_arm_smmu_" prefix for the ops and functions here?

Similar to above, these symbols are private to this file and the
hypervisor symbols gets prefixed with "__kvm_nvhe_" anyway, so they
never clash with the kernel. But no strong opinon.

Thanks,
Mostafa

> 
> Nicolin

