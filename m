Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB01BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=; b=JtIoj6WlWCB5WL8s2AjJJRMKO1
	t+psIx+TmV8IFLTox+nyOqtbb3FQtqZb4hgIc1ElqFC5lNfOsAJVGcsrzulzI+oReJ2vqNUq2EIFh
	N/TuMAtmduiCybFdTR1DIjV5eOkAo7TyWtUOGBtI48odODX+mwdcbxDGWw1n37VPNoyfPM0uks7LX
	ach7Bn97t0QK/yWWTtl1N2d0MSRcKqtaWVfmKgMYv/bIMyw4xkfWrbGCJ6EiXqzKh0BaasE1Wzw62
	Yk7zObiIzglPz3SsTalrRX+d4HzbWJxXTjYnYlMdVHp3XC1Vdr7abvhkqR1dTDFu6ZJJVGq+1lZUe
	MOpooLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PZa-0000000CLtu-345m;
	Tue, 01 Sep 2026 14:34:50 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PZY-0000000CLsw-1Ioo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:34:49 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-52d8679c149so8527811cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788273287; x=1788878087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=;
        b=iQN7mZyf6uYnw1faTfCtxjQPWWJq35ipUaIgY6kjyIdJIxUXgb0qn5rPCVk0Bfqn0F
         Cp7DMUaidIKPaBtz7tR8hG9mD0c+O8W4KeCvXt/fmH4htFbAKoTWOyH/B5ngcd+89e9Q
         ZDR+KXGduRKMuVmsSn/QRitQ3O5sG8sLw5Ril2qftNTpB90vu9mP9qhP3cGYxgxGaXC+
         SG8Pu7Z0gMZctZJhUCOUPmP8i3mjenWmiXbjV0cetnytSGyYEEuQcDdgZFXBErRcTrMc
         6dMsuPpwjtwoIPjhMKI6Tygr80uH+ifed0e1tbnryUukTrUmrSLhRQlujqziFx7VrTCX
         eNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273287; x=1788878087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=;
        b=hWbAAPALx+CpJnAStzw1AAUiHw/ZrPX3G/PMZVh7PSRldKS4oQePrRbyi6pi4WuO5c
         +Sqh3Fj3dNtj5Woczh1+47ylLjtzLFmZIPD0qoIqHmKWCQOHBNOwqdwtd66DdP6WosWX
         MRrq8wNGD9mU1agIVx8HmAHHoHT4yY5fs4q9vN+j0LuIWLDxBoFGlGK1uC4cbF/+pPoy
         sSXE0ho5osh6NK/3CRg1NFiN6l/M0+mBwrWs+vqgBNt7hyOQZGEDg508Bp/5HW2vcMJ3
         M3hjSqsiwBmqkdwzOJOoSqL/eB28RK2HqDDkAaN8w0/P/Skmh0kZwmMwsIm/8i14xoKP
         MhTA==
X-Forwarded-Encrypted: i=1; AHgh+RpEszhqhJWk8iAM8SDz1rFko4JseKRhqpUxBVCZBJ4LG3X4U29cfRNjnL+1mULXEmudtZOiF7XRd0mfPJux9ieJ@lists.infradead.org
X-Gm-Message-State: AFuF++kJvOKxaG/0+0tajRx//dX/i+DefjqM/mKSbhToqr3LThHa2oS8
	DDtirNvt7/+XgX3BubHpOJSJsROG3dSGQ90KDnMKsafeVxCeMZxBz1+jT/OuRL+ot5M=
X-Gm-Gg: AR+sD13ESXU7h4xC+WDMobLWC2CZxli2LUt8nhl03sWayCtZY0krfSKrW5Dhdb8zMga
	dspEjlaB5Y/KzjoRLcXFh0JObUWsS8eXLrfFbSVOdE3OWVPoqMTpsHA6xlEM4ggmaOAiIRTu9Ir
	ADeWYMlC2iUtcYp5kt273cr7Bxhl/RG8NPzI8VH6NRGKZOvp0uCryJ+1+detkBnxgqZZkaywlDO
	sgdHdvBrdYGrIC0/M8kzojn+GwhBVNJ3hZ1SLD3c0tt+R66RGCdhn1MBQxqIalnj3AsEpI2UegO
	DtSooDvGVuQjRSMHKaPe66dqjpeMvllh06gF5x96z7+Gv9Cwh6JRh9hkcL5HmBKRxWOfWBLT658
	Gh8DEDsCYljFX/Uvl5ZfKGkcYNJPmQwMEKL9UtYDNDl5qAshUBKxWtO7W1XxJUHUxTF78R4TxvD
	O9AcGi12FclwPw3vWmxvonPhB4U5VHPWCARn9x5EXi8ykKaeYrdMIAzK91boDYT3EdvENsWeBYI
	V4YWEbMv5L04T3SZsEW/GIxeiBhXYaxW1gHU0dHMX9k+lQ=
X-Received: by 2002:a05:622a:5913:b0:52f:f472:bad1 with SMTP id d75a77b69052e-52ff472c08bmr383344431cf.33.1788273287009;
        Tue, 01 Sep 2026 07:34:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe830222sm98165671cf.20.2026.09.01.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:34:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PZV-0000000Bhy0-23ZI;
	Tue, 01 Sep 2026 11:34:45 -0300
Date: Tue, 1 Sep 2026 11:34:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260901143445.GC56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecfdnv4i.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073448_356351_CB92FD6B 
X-CRM114-Status: GOOD (  14.44  )
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

On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:

> @@ -463,14 +460,13 @@
>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>  
>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> +		if (arm_smmu_is_realm_viommu(viommu))
> +			return arm_realm_smmu_v3_init(viommu, user_data);
> +

I think the realm vsmmu is going to require a different info struct
than the normal psmmu case, isn't it?

If so it needs its own enum value.

It would be nice to see a draft patch showing how the real vsmmu works
on top of the RMM spec for it. If we are using a viommu object then
non-vsmmu case should be identical just with an option in the info
struct to not create the vsmmu object.

Jason

