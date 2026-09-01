Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8CDC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSpPsrjUbmiSavh9ORSXd1N82cCUzjhFeagQI6oMt/A=; b=CE/1Ls0jbRP6pmXubcTJnaMVH8
	Y+n5LUBr4lZJGdaATu/W0QK7Ff8a4P96AXJv36wsPlKUiI+RN8nFQAzJ9g1915d7ltC1y7SkDdNoT
	ZvUX9a+IWSbaWMnpmYIjAlv6y94yjPk0lEusGTlz7RupLlOsEFut26lPeXBWRxiDDMerO4HXjpcHP
	Z2bJ+ltIwutk0TRld/dyweB6r1kkRGoGRfRKTIhZpx/urq6jQvBDBILim+HERkfmOHD+Nze5FIv9c
	k4fbgkVLKMMQdo7iGavRAsXsdWkZ2KNmcjXvyz6DunJHXiGOkbWbYhqNXkm4q38UwYifp20Q2LvSh
	xRLM46FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SVI-0000000CrEw-2VMP;
	Tue, 01 Sep 2026 17:42:36 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SVF-0000000CrDP-3SOF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:42:35 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-90cc372d6b2so1424446d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788284552; x=1788889352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSpPsrjUbmiSavh9ORSXd1N82cCUzjhFeagQI6oMt/A=;
        b=lOTpMSV2R8sjes3EwPlYFSfERKmiy2xSQ6eXuCzob89RviOeJDUq9G/C0sycAnvewB
         gDUokE1E8lq0g8ozwNVve8BAvInA4TMD0Xr24R6h2SYZxpbz8G1+lmad7AEeiCkES448
         3PW8hKyHLZ0bg2OkeLKmmzTpeHiVqKoqJEMOesRVK45qHSx4s/kmlcaEznpNx5elO4D9
         xvFljn0C74DSBUvbuWkYUfbiOW7BsPsaiFZUW1grpClPmBefzetdZyYmptLEk+KAbOdx
         VDKEEk+71KizT6hrycSC+N1oUMbk+3trX3sIFtAJ1Be6NF9XcwLDuaF432JhtlnHqZbw
         gbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284552; x=1788889352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSpPsrjUbmiSavh9ORSXd1N82cCUzjhFeagQI6oMt/A=;
        b=Qw0GkQOqnqfhcyipedNKzEIEtfINah8Tu2eeeMZCIQpE5N7VVe3zw+1CGx6m86T9ZX
         RtWhE8WDzO7wZX6Fvgrr/UjmGjf6QKfhzv52A3m6aKmNPQFX+IE2BRp6zqerJBiqA47m
         kRqVnkZjL86ACY2wFB1OeK7fh619djJHqMuFHWStkReV75Eog86Tq1f+MjRA+/OXtCY7
         9qNHQfec6ChpkAhrw+HcFIdB2iES4/1kdeOOwBY6VE6LLouWoUlwWuhgl749kYewTYVd
         9PlMrg02MX42rCFffSTOHCJ9BOWF5qsL7vCS3PHMIbdbOMxDvwmEWOF5tGjHF+tyiFs/
         APGg==
X-Forwarded-Encrypted: i=1; AHgh+Rpk8qc9tOLj+40Xq+PR+5bhjB4IEZmopaqXEnkCvDIoTwuQzoXTlOe+a8dRN7hbAMw0KRjxmT9126Ljg4lJZd82@lists.infradead.org
X-Gm-Message-State: AFuF++lyyePa0Q+aJQnhKW1LXNOHACyIEWFcd53zQQjhvn/3FREGkMW4
	pcFJNTS7NzU4ubmQ/PWkCwTSo6kTmf2VjSna62TgxYPZZCrdKE4U5KUQoOeY4y49DXg=
X-Gm-Gg: AYBFou0fBogW2xHrZv4WyE+sLF1hajlmuIntubO3YQcyQ62QBLYzVKMKSbbTgFB1qmM
	77du/b89PwUUlVivEpOPeaQkaYDfBNUG0yy8I9raQHCC5Tchff2RGhkw7o8dZ5MKundrGbT1dV0
	5wKJzqEQ350PC79XdZDiLGhdN5IlurA1YHT2t0n9QI66kVvQ7OE0d1IsIcNbCkp9tHchTchLhPm
	dKvktVn1I+f83DHDnVUeOGQ6Plz2Yk1jMD57U7ZlH72oY5xXeLuF1eW4S1rq500WJTT/K7sgBM7
	1RXLI6muQppR7TMeq6W/9GsBGAKYClXBwk8lw5a3S46ehdvAHZF2hCJf7B1ZOki27P8L89WMQku
	7K/hlsU1O+aSWRpc4qzUSxESz/GpTKQpeAag1/JJBtXYkETW57it3jcxDA10JhRCzsbOoTsg7/v
	MEkXLcaqotLy2oh6AimcnlzKF+1ZN/r41hRvY8kzrYM7jlWSzsCU3vqH26RlROMouC7JS5hHaWH
	0Dkwdnyg8wnC8/7JufqWiaGSmbneISPeHxp8hGztA9GP634gP2H8b7v
X-Received: by 2002:a05:6214:20a6:b0:908:951f:415 with SMTP id 6a1803df08f44-90ce0c5a74dmr432795226d6.13.1788284551550;
        Tue, 01 Sep 2026 10:42:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4515130sm113625086d6.39.2026.09.01.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:42:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1SVC-0000000C4up-15C8;
	Tue, 01 Sep 2026 14:42:30 -0300
Date: Tue, 1 Sep 2026 14:42:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
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
Message-ID: <20260901174230.GA2847102@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcHoHKGoI7WNFXp@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_104233_877273_4BDA0C64 
X-CRM114-Status: GOOD (  26.60  )
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

On Tue, Sep 01, 2026 at 10:13:04AM -0700, Nicolin Chen wrote:

> +/**
> + * enum iommu_viommu_arm_realm_vsmmuv3_flags - Flags for ARM SMMUv3 Realm
> + * @IOMMU_VIOMMU_ARM_REALM_SMMUV3_FLAGS_VSMMU: Indicates whether the Realm has
> + *                                             a guest-visible VSMMU instance
> + */
> +enum iommu_viommu_arm_realm_vsmmuv3_flags {
> +	IOMMU_VIOMMU_ARM_REALM_SMMUV3_FLAGS_VSMMU = 1 << 0,
> +};
> +
> +/**
> + * struct iommu_viommu_arm_realm_vsmmuv3 - ARM Realm VSMMUv3 parameters
> + *                                         (IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3)
> + * @flags: Combination of enum iommu_viommu_arm_realm_vsmmuv3_flags
> + * @reg_base: MMIO base address of the VSMMU in the guest VM
> + * @reg_top: MMIO top address of the VSMMU in the guest VM
> + * @aidr: AIDR register value of the VSMMU in the guest VM
> + * @idr: IDR register values of the VSMMU in the guest VM
> + */
> +struct iommu_viommu_arm_realm_vsmmuv3 {
> +	__aligned_u64 flags;
> +	__aligned_le64 reg_base;
> +	__aligned_le64 reg_top;
> +	__aligned_le64 aidr;
> +	__aligned_le64 idr[7];
> +};

Yeah, broadly what I would expect. Pass everything needed to execute
RMI_VSMMU_CREATE through this struct.

Is there anything more than RMI_VSMMU_CREATE needed from a RMM
perspective? What about that dpt/ats stuff?

> I think this should work. But I still feel awkward that a non-vsmmu
> case has to allocate a viommu object for a set of RMI commands that
> don't need an Realm Descriptor.

It is for the RMI_VDEV_CREATE which needs the RD:

	case IOMMU_VDEVICE_TSM_BIND:
		rc = tsm_bind(vdev->idev->dev, kvm, vdev->virt_id);
		break;

It has to be tied to a vdevice on a viommu to pick up the kvm and
vSID.

If we don't do that we need a new way to get the virt_id and kvm into
the flow, which doesn't really seem worthwhile to me.

> Things could be cleaner if we allow RMI_PSMMU_ACTIVATE and
> RMI_PSMMU_ST_L2_CREATE to be independent on a viommu; then leave
> IOMMU_VIOMMU_TYPE_ARM_SMMUV3 to vsmmu-visiable case.

This is why I asked in the other message if RMM spec is clear that
PSMMU and STE are not required for anything but VDEV_CREATE. If so,
the PDEV create and SPDM stuff is fuly independent.

Which is why I'm saying the split doesn't make sense. PSMMU,
interrupts, STE, VDEV are all related objects that should be managed
together by the SMMUv3 driver. You need a PDEV to create a STE, and
you need a STE to create a VDEV.

PDEV is the SPDM channel and should be managed by the TSM driver.

So, I think the IOMMU_VDEVICE_TSM_BIND is not justified. "BIND" should
happen when the SMMUv3 realm viommu ops create the vdevice. The same
way the vcmdq sets up the VSID tables when the vdevice is created. Is
there a reason to have it in its own command?

Further the implementation of IOMMU_VDEVICE_TSM_BIND in this series
*requires* a viommu to work. So OK, let's lean into that. (to be clear
I am saying delete tsm_bind)

It means the other arches will have to implement viommu APIs in their
iommu drivers before they have really defined their actual secure
vIOMMU definitions. That seems manageable.

Jason

