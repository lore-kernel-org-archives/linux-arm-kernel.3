Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81AFC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mITZlxCGGk5dvksU48UBQe0WaGaTY/+s4dpeJMto630=; b=XsUJTkJicU5EVCW4SNpT5GJ/UX
	6a72rh7MzdZzLVpuFa3hMSHLK7kgdUwTSjlJtd7BJlNpxihIONFqwmRxSRwlzn69uH2Og2T/wQmGo
	XYtBpdgzRXehepdRpohxfMyq81LEqXMhSKzJsn6BgjOedsPXhxuPwHYDuTscABrYwEjT7WMkYjiQ/
	y0MrnWFJLCphQCG7WcV20R6aYJwJBLt9+ag1n/FIpJs1xI8gfZrwxXvP/eOMxhcuYtQrcoyIkqe2l
	jgV7eBr7mcciGHonDz6ztEeUB0Hoqo6C1Rb/uJVlQB4BWYLQsEANaodd96X7BMdFvMPGVtgNyWCW8
	pMj+UdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KcF-0000000BOjq-1TCx;
	Tue, 01 Sep 2026 09:17:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KcD-0000000BOji-3BzQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:17:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D378F601DB;
	Tue,  1 Sep 2026 09:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EB61F000E9;
	Tue,  1 Sep 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788254232;
	bh=mITZlxCGGk5dvksU48UBQe0WaGaTY/+s4dpeJMto630=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XROMNIUmyhA7M/dbxKK8Imo86dz2L5j/zRFqHXNrxib/St5Bz1Wb45NtmhWOw5fJy
	 1u3rgOng700Q/MQ7vgjnccFx73xrQm/I7XQ3n67GRnFhDKxJ/VFmyX48m+SserSxs+
	 Tj82D7pJJMB26AvoXAgxRVqAW3LgHXg+Khq3BxBKr9/K3b1pItu8VaSk4UULn1gG//
	 8C8f2gKAHAI74TDde4b39ZA0HPi0d9Z3mFhPd6KgiQH0aY3Zq0mWuwzTsGSVTSS7ZE
	 jUydPyVjl+1VTyXdmpr4NjgMXIHt/C0EyY7NN9kjEfZOHNqNA5Ed9dbgxa4YiD6AJE
	 VftVrjb3WsNrg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
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
In-Reply-To: <apM6dOHcEI2ztWS0@nvidia.com>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
Date: Tue, 01 Sep 2026 14:47:04 +0530
Message-ID: <yq5a8q5lz5yn.fsf@kernel.org>
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

> On Mon, Apr 27, 2026 at 02:23:31PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> +static const struct iommufd_viommu_ops arm_realm_smmu_v3_ops = {
>> +	.destroy = arm_realm_smmu_v3_destroy,
>> +	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
>> +	.cache_invalidate = arm_vsmmu_cache_invalidate,
>
> I don't think realm vsmmu should include NS nested domain ops. I
> wonder if adding here is for some covert reason that prevents us
> from registering viommu/vdevice objects?
>
>> +static int arm_realm_smmu_v3_vdevice_init(struct iommufd_vdevice *vdev)
>> +{
>> +	struct device *dev = iommufd_vdevice_to_device(vdev);
>> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>> +	// fixme which stream to pick
>> +	/* At this moment, iommufd only supports PCI device that has one SID */
>> +	struct arm_smmu_stream *stream = &master->streams[0];
>> +	struct arm_smmu_device *smmu = master->smmu;
>> +	unsigned long rmi_ret = 0;
>> +	int ret;
>> +
>> +	if (!smmu->realm_initialized)
>> +		return -EINVAL;
>> +
>> +	ret = rmi_psmmu_st_l2_create(smmu->base_phys,
>> +				     ALIGN_DOWN(stream->id, STRTAB_NUM_L2_STES),
>> +				     &rmi_ret);
>
> The "vdevice" is for a PSMMU stream table allocation..
>
>> +int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
>> +			   const struct iommu_user_data *user_data)
>> +{
> [...]
>> +psmmu_activate:
>> +	ret = rmi_psmmu_activate(smmu->base_phys, virt_to_phys(params),
>> +				 &rmi_ret);
>
> .. and the "viommu" is also for PSMMU activation...
>
>> +++ b/include/uapi/linux/iommufd.h
>> @@ -1055,6 +1055,7 @@ enum iommu_viommu_type {
>>  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
>>  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
>>  	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
>> +	IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 = 3,
>
> .. and we demand userspace (VMM) to use IOMMU_VIOMMU_ALLOC ioctl,
> even if VMM does not actually expose a guest-level SMMU instance.
> Thus, no user_data.
>
> I can get the reasoning behind the flow using this viommu/vdevice.
>
> But, on the other hand, I can imagine that a Realm VSMMU would add
> a new flag with a user_data to this VIOMMU. Then, this flow would
> give some troubles to VMM (QEMU for example):
>
>  - For VM with a guest-level SMMU, QEMU creates a realm instance
>    where IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 (with vsmmu) can be
>    allocated.
>  - For VM w/o a guest-level SMMU, QEMU won't create such a realm
>    instance, while still required to invoke the ioctl (w/o vsmmu). 
>
> Taking a step back, I wonder if we really need to use iommufd for
> PSMMU activation and its stream table allocations?
>
> Here are some facts:
>   - An iommufd has a ctx, that's one per VM. Similarly, a Realm
>     has an RD.
>   - For an RMI command that needs an RD, it makes sense to be per
>     iommufd ctx, e.g. RMI_VSMMU_* or RMI_VDEV_* commands.
>   - PSMMU commands are global; they don't need RD. So they don't
>     seem necessary to tie to an iommufd ctx.
>
> Instead, could the PSMMU activation be done after RMI_PSMMU_INFO
> check? Is there any reason not to do that? A safer timing might
> be at the device assignment stage?
>

One of the reasons I added IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 was to
avoid creating a psmmu object when we are not using a PCI passthrough
VM. That is also the reason for all the refcounting around the psmmu
objects.

If we are okay with creating psmmu objects early, then I guess we can go
with the above approach.

>
> Speaking of which, RMI_PSMMU_ST_L2_CREATE doesn't seem necessary
> to be invoked in a vdevice context either. Maybe it should align
> with iommufd idev's lifecycle?
>

-aneesh

