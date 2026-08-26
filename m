Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0736CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCpGxFqreLjSVtJ1Gq5kxQUJHIsXo7AfwLCjemfnd9c=; b=pfe7Vpt3GFDV71gbtGah9hukCh
	pNHssTF4udbGqjcJOr1H+KpZ3p6+Roz+ZhvDFYaoMa5riRJwYk+ERa4O46Z/tVY6TdSisZioRM/kI
	O/1Ypah4Hmew291C8/t84dQ3zz8jLVkd0WZ039QM8ejAV4F5x4YagYsWxp7k/ze3oyfQusqJA1Ue7
	yMJA0CTVVVVi/8wdLChgU6RVgCKc9TYx/MZujA8tUzWaUY4BzS8vFLUIyZI6QbpXP6oVWjIZ9Sk9P
	5N9Qc0qngbYZv1EWfkUfzOYDqG9iopIrMM3uik2FCkvPEnzBJK0MRADRbfnBBjl9Q4ouT8U12DYOd
	G+17JJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzABJ-00000002EF2-1C1P;
	Wed, 26 Aug 2026 09:44:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzABG-00000002EEa-2jZ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:44:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-499b1409a75so35835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787737465; x=1788342265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DCpGxFqreLjSVtJ1Gq5kxQUJHIsXo7AfwLCjemfnd9c=;
        b=prj2Ag/ubOdHMfyTn51t/3zJq5Xc0QOjBCcVEa/+lPPwPdFqscfLkK+lBMC/Y+KNGV
         JPvY1Vr7bFGaBzcgleR3H32TrBlDzN/S07NhxOfF9SUxQ4ZckqH60gMS2qY8TxUGsfvL
         fSWFa8Jl1mrPrSldMNSVI01IozPxADnd4qjrgXSu7ccxmlRgl8YJ2koV7n4f3QJOYg/Y
         /msl5/KjRHx67GhXb7GICbzJH8XHWDRXZd6Ja0SzFUzz6ZpRXJRmyzFVknxpEKbyUvtJ
         dYii2ttpVbud8U9HAgVkVFuiaNqZo0/i2TlkeuF0eeHSaH1RRiuxKJQ7j+do6cwgVF6L
         AG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737465; x=1788342265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCpGxFqreLjSVtJ1Gq5kxQUJHIsXo7AfwLCjemfnd9c=;
        b=P3Lbj435b/SrL1YdeDGl16qSs+JIcOQWmUUrdw/K8/Y6yOQ6m7Mde1JezoRViPFJ9h
         MJxfZVEzKlqM7XfuXzlr2G4B58ceEQwveW4CH9PHtlDQM1kv8xRzVfCG115pliJ97AT+
         6pD5YrtWDWmnX8+a7p4SQFVXFv9iHm1hUoT19UxSSWRqVe60+9/9T12r0wqyiT92odtr
         L33NgBWFNmtn08NPd/qHxh/NJ2UaAZbjHAXZejdGsKrIRVMuZVV6IAL/9vdKqUO2C1M0
         xbLCHoBCdMGLpl5Rz3GA0NljJ0sqsrjj+ZzmL7Cibz00LdEwRSxJDGGxZFM5JhK/ijCk
         HjFA==
X-Gm-Message-State: AFuF++m0YuyMAztGrmjBpSx3cGIwn4IAL3Gb/KDmF058gHWU63ky2YtL
	fF+LjRDzFIzckjgknIW84PV6pf1caA8Hq9Fb60Rjrenf0TggnnUuwr1OlZuVpcZq2g==
X-Gm-Gg: AR+sD13Ti8CmWPbrgfq3fWIT3Z0TbLFgq8pFDG4xVTSG/YGxEjoKVVScGQYCrqT1xlK
	KM9HxlppgiqTVRPQVORo+nCarx4UNxu65KJSmpds9EUdsnwr7ptDo9LoQWYGEDSYcJxVF/9ME4p
	lYtVePucWbgV4MM5hT4z/Oj18U1VzJ2yPefXxEDLe151GMUWbvifhDdo0U07CJH459MZCcMXCjS
	ApB7UINYXxpFQk5Q8vGc9/Ifa9oOYkG87tG6eQHU+5RrkEEKGP4eXGzGaxBIdESYhhJcN6FqNQz
	Aci482HJtSZ6Bs7O18hcvqK0eGGq8EFbjA0riqixtLlFlWaE7ZaI67m+thCdC0tjsJB+lPxCGoP
	8l4Wh31qkXb9fqPjpHNdm2btnP/6J2ehPAz9PtCgxW2+OEZvmLz6UHplltBvktx4tUM0eVMR7G6
	DwIaM6ZaZupJ+40dmnszWLkFfg4OheNDrn6VDNeau5y0BjoycAyIwMSTrUBBawECE354FbyL6Zb
	/jd2Pho15yzEROmTq0eAPVM+Opadw==
X-Received: by 2002:a05:600c:6085:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-499dda23078mr651695e9.7.1787737464409;
        Wed, 26 Aug 2026 02:44:24 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm20805035e9.2.2026.08.26.02.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:44:23 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:44:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 05/24] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <ao61dMZqUEgC7huD@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-6-smostafa@google.com>
 <178769159057.3356902.8176677714818911833.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178769159057.3356902.8176677714818911833.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_024426_783398_EEDA4749 
X-CRM114-Status: GOOD (  26.73  )
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

On Tue, Aug 25, 2026 at 05:59:50PM -0300, Jason Gunthorpe wrote:
> > [ ... 21 lines skipped ... ]
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
> > @@ -0,0 +1,184 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2015 ARM Limited
> > + *
> > + * Author: Will Deacon <will.deacon@arm.com>
> > + * Arm SMMUv3 driver functions shared with hypervisor.
> > + */
> > +
> > +#include "arm-smmu-v3.h"
> > +#include <asm-generic/errno-base.h>
> > +
> > +#include <linux/string.h>
> > +
> > +u32 smmu_idr0_features(u32 reg)
> > +{
> 
> I think you should do more to make this shared C file usable by both
> compiles with more of the infrastructure available.
> 
> For instance, something like this at the top:
> 
>  #ifdef __KVM_NVHE_HYPERVISOR__
>  #include "pkvm/arm_smmu_v3.h"
>  #define arm_smmu_device  hyp_arm_smmu_v3_device
>  #else
>  #include "arm-smmu-v3.h"
>  #endif
> 
> (heh you used _ and the driver uses - in file names)

Yes, that's a bit ugly, I can rename it to arm-smmu-v3-hyp.h

> 
> Then the existing code using 'arm_smmu_device' just works fine since
> the hyp version has the same structure members. Now just move the code
> as-is.
> 
> Otherwise we still have alot of cut and paste duplication:
> 
> 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
> 
> 	smmu->features |= smmu_idr0_features(reg);
> 	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE))) {
> 		dev_err(smmu->dev, "unknown/unsupported TT endianness!\n");
> 		return -ENXIO;
> 	}
> 
> vs
> 
> 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
> 
> 	smmu->features |= smmu_idr0_features(reg);
> 	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE)))
> 		return -ENXIO;

I am not sure I get this, the only difference is the printk?

We can do more with that, but as discussed last time, I am worried that
re-defining structs using macros just makes things harder for
maintenance and more fragile to changes, causing build failures,
and mismatch in types between the 2 structs.
I can experiment with that when working on the next version and see
if the there is significant benefits.

Thanks,
Mostafa

> 
> Then you can put the prior patches tlbi stuff here instead of the
> header file, which is important because after I get the CONT and
> errata stuff worked in it becomes really quite big.
> 
> -- 
> Jason

