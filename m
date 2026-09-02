Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58296C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRLi1FBteYpjMUirky+hyusys6nAANuCHisJ2JsNe8k=; b=BUclsvA7GhSByatNV33IHNS9hC
	95HUz6lx+7cxe3jHxUDCzQo9iN1HSFNMo98MC54M+r9tWnwBp4wS7nIYY/UYZvYZuBHoF9WPH2g2E
	AQfW4htSolUyCfAZdiJgKC/LB3XMFtnuyzWdmXjZqP02gHbdZftrWub21KSF1DpeYaa0aaHe1oV5t
	w6uh5q3CObsjjgARcJM29WnjsU7nBqjJezgACIcb84XKFg7SR6U4xXfNq0wy2D8lV2LFK8ZyoMCqn
	tzqtt8x4vlzj25xgVids27bAZZU7ZOLO1QL/onVbbsOgaW9JuRwja7Fr9gL1Jv5AsUtTpVaXc120B
	SNjuFWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kk9-0000000EluM-07I1;
	Wed, 02 Sep 2026 13:11:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kk8-0000000EluA-2QQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:11:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A2A3600C8;
	Wed,  2 Sep 2026 13:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A611F000E9;
	Wed,  2 Sep 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354667;
	bh=nRLi1FBteYpjMUirky+hyusys6nAANuCHisJ2JsNe8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AjTqpzq4q2LFSPFFt+yF0vXv5UNifGGusVKCrtWydIJ+Ib1DGqMErun1wVgdXn/1H
	 lU1n+rD9Cok863jcdsTklSuT6Y0QSauxCSRV+inADasqrGmuGTun/tsJhEpB2YwUFG
	 JGgxDB4x9N1wpwQ7KOaK5Bw3rrjHVPCEyqlYlZBXcmclfdxz23uEJ4mkQa5KawrX6e
	 PK2eOBHtzGLnlXN1mzewSMnuqCDJhTfczqRGiRuobPLXqqgegsCKBl3Pe/Covj9d2B
	 as4VOU1YWGFO52qoukHRQDiZfSAZU1c5ZnFEeOxWWYguRLa2uD4OVvWGAojYxp6ZYg
	 Dv1XgULDqf4kA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
In-Reply-To: <apcHoHKGoI7WNFXp@nvidia.com>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com> <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org> <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
Date: Wed, 02 Sep 2026 18:40:57 +0530
Message-ID: <yq5ajyp3ztlq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Nicolin Chen <nicolinc@nvidia.com> writes:

> On Tue, Sep 01, 2026 at 11:34:45AM -0300, Jason Gunthorpe wrote:
>> On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
>> 
>> > @@ -463,14 +460,13 @@
>> >  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>> >  
>> >  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
>> > +		if (arm_smmu_is_realm_viommu(viommu))
>> > +			return arm_realm_smmu_v3_init(viommu, user_data);
>> > +
>> 
>> I think the realm vsmmu is going to require a different info struct
>> than the normal psmmu case, isn't it?
>> 
>> If so it needs its own enum value.
>> 
>> It would be nice to see a draft patch showing how the real vsmmu works
>> on top of the RMM spec for it. If we are using a viommu object then
>> non-vsmmu case should be identical just with an option in the info
>> struct to not create the vsmmu object.
>
> Actually, the PSMMU-only viommu object in this series only adds a
> type with no viommu data structure.
>
> I've drafted the vsmmu case on top of the series, so it would add
> a structure reusing the same IOMMU_VIOMMU_TYPE_ARM_SMMUV3 with a
> flag:
>
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
>
> I think this should work. But I still feel awkward that a non-vsmmu
> case has to allocate a viommu object for a set of RMI commands that
> don't need an Realm Descriptor. Things could be cleaner if we allow
> RMI_PSMMU_ACTIVATE and RMI_PSMMU_ST_L2_CREATE to be independent on
> a viommu; then leave IOMMU_VIOMMU_TYPE_ARM_SMMUV3 to vsmmu-visiable
> case.
 
RMI_VSMMU_CREATE requires an RD, RD won't be available during
viomm_alloc right?

-aneesh

