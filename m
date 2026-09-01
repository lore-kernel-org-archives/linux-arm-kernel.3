Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6634BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4Zqnw9nYqmggP/123C2UohTksZRqjbq5Pi/svIRrO4=; b=zGU/lIP9/3y2cnS+/Q7HDEVFxu
	fDiTFe4GHAAFTskyqiZJsNLLrzuBt5RAWbZ1/kKa/POwbQgPLT8+1IIaH16Q6SjTyEkM4e242qTi8
	CMtsEfkKzMiZTOGWS+inz4SXqfP8hvKpn2EIRRwfSYCiKFFPIlF4bZ7vKYu4l+dFOikJr7mljhIlP
	wiiWrajWlVae+/wx0J/RQHZJCBAVmwFtrj58DGFY3PQl8cDVV4s35H3+7Rtk7vXFXsoDsMDRQvbq+
	5FDqiklSEKAJPZYPUPMUFWU5GVT9q4i4rtt0N+w+66tpejKECuuPCIxem3vyzkY5CuEW1gk3l9ET6
	tSr/qZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LOB-0000000BVFn-16Vx;
	Tue, 01 Sep 2026 10:06:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LOA-0000000BVFb-0B4p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:06:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3D2140BBC;
	Tue,  1 Sep 2026 10:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8F91F000E9;
	Tue,  1 Sep 2026 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257205;
	bh=g4Zqnw9nYqmggP/123C2UohTksZRqjbq5Pi/svIRrO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mNYJBp2z4z1xNkw66RP9nqXNFwiSfNfKXlSpp9u0awP0uGkKeOrIb4w8L+s+7b9La
	 S3PKe9588ssnjN02Yn37J9yHdKcWSFH5H1wGramm5uZhsDE6tz33Fw2bk3Zf3NfWd5
	 naZpdGd5xOTGlxubfX+NIie+dtudVn8TcioAYZtlF7dXP2rgpTRlIoU3ifOxAGHq5Y
	 dHurr+YNPPi0uj/39quzKPYOXcR86AKXsOWW7niVvlto7xqNgL6/hA+21HLr9A6qUm
	 kAjU2Z5IS26IczA4kkG2V1bK7VZ1aIHa437trarhITjQVIYfHWOauLM84VcIWVTOAP
	 VZAtSqGYjKEAw==
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
In-Reply-To: <yq5a8q5lz5yn.fsf@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com> <yq5a8q5lz5yn.fsf@kernel.org>
Date: Tue, 01 Sep 2026 15:36:37 +0530
Message-ID: <yq5aecfdnv4i.fsf@kernel.org>
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

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> Nicolin Chen <nicolinc@nvidia.com> writes:
>
>> On Mon, Apr 27, 2026 at 02:23:31PM +0530, Aneesh Kumar K.V (Arm) wrote:

...

>> .. and we demand userspace (VMM) to use IOMMU_VIOMMU_ALLOC ioctl,
>> even if VMM does not actually expose a guest-level SMMU instance.
>> Thus, no user_data.
>>
>> I can get the reasoning behind the flow using this viommu/vdevice.
>>
>> But, on the other hand, I can imagine that a Realm VSMMU would add
>> a new flag with a user_data to this VIOMMU. Then, this flow would
>> give some troubles to VMM (QEMU for example):
>>
>>  - For VM with a guest-level SMMU, QEMU creates a realm instance
>>    where IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 (with vsmmu) can be
>>    allocated.
>>  - For VM w/o a guest-level SMMU, QEMU won't create such a realm
>>    instance, while still required to invoke the ioctl (w/o vsmmu). 
>>
>> Taking a step back, I wonder if we really need to use iommufd for
>> PSMMU activation and its stream table allocations?
>>
>> Here are some facts:
>>   - An iommufd has a ctx, that's one per VM. Similarly, a Realm
>>     has an RD.
>>   - For an RMI command that needs an RD, it makes sense to be per
>>     iommufd ctx, e.g. RMI_VSMMU_* or RMI_VDEV_* commands.
>>   - PSMMU commands are global; they don't need RD. So they don't
>>     seem necessary to tie to an iommufd ctx.
>>
>> Instead, could the PSMMU activation be done after RMI_PSMMU_INFO
>> check? Is there any reason not to do that? A safer timing might
>> be at the device assignment stage?
>>
>
> One of the reasons I added IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 was to
> avoid creating a psmmu object when we are not using a PCI passthrough
> VM. That is also the reason for all the refcounting around the psmmu
> objects.
>
> If we are okay with creating psmmu objects early, then I guess we can go
> with the above approach.
>

How about?

modified    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -437,9 +437,6 @@
 	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
 		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
 
-	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3)
-		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
-
 	if (!smmu->impl_ops || !smmu->impl_ops->get_viommu_size)
 		return 0;
 	return smmu->impl_ops->get_viommu_size(viommu_type);
@@ -463,14 +460,13 @@
 	vsmmu->vmid = s2_parent->s2_cfg.vmid;
 
 	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
+		if (arm_smmu_is_realm_viommu(viommu))
+			return arm_realm_smmu_v3_init(viommu, user_data);
+
 		viommu->ops = &arm_vsmmu_ops;
 		return 0;
 	}
 
-	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3)
-		return arm_realm_smmu_v3_init(viommu, user_data);
-
-
 	return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
 }
 

modified    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
@@ -239,21 +239,27 @@
 	return 0;
 }
 
+bool arm_smmu_is_realm_viommu(struct iommufd_viommu *viommu)
+{
+	struct kvm *kvm;
+
+	if (!viommu->kvm_file)
+		return false;
+
+	kvm = viommu->kvm_file->private_data;
+	return kvm_is_realm(kvm);
+}
+
 int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
 			   const struct iommu_user_data *user_data)
 {
 	int ret = 0;
-	struct kvm *kvm;
 	struct rmi_psmmu_params *params;
 	struct arm_smmu_device *smmu =
 		container_of(viommu->iommu_dev, struct arm_smmu_device, iommu);
 	unsigned long rmi_ret;
 
-	if (!viommu->kvm_file)
-		return -EINVAL;
-
-	kvm = viommu->kvm_file->private_data;
-	if (!kvm_is_realm(kvm))
+	if (!arm_smmu_is_realm_viommu(viommu))
 		return -EINVAL;
 
 	if (!(smmu->features & ARM_SMMU_FEAT_RME))

modified    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4515,8 +4515,6 @@
 	int ret;
 
 	mutex_init(&smmu->streams_mutex);
-	mutex_init(&smmu->realm.mutex);
-	refcount_set(&smmu->realm.users, 0);
 	smmu->streams = RB_ROOT;
 
 	ret = arm_smmu_init_queues(smmu);
@@ -5578,6 +5576,8 @@
 		return -ENODEV;
 	}
 
+	mutex_init(&smmu->realm.mutex);
+	refcount_set(&smmu->realm.users, 0);
 	smmu->features |= ARM_SMMU_FEAT_RME_IRQ;
 	return 0;
 

modified    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1282,6 +1282,7 @@
 			      const struct iommu_user_data *user_data);
 int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 			       struct iommu_user_data_array *array);
+bool arm_smmu_is_realm_viommu(struct iommufd_viommu *viommu);
 int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
 			   const struct iommu_user_data *user_data);
 #else

modified    include/uapi/linux/iommufd.h
@@ -1068,7 +1068,6 @@
 	 *   VMM must wire the HYP_OWN bit to 0 in guest VINTF_CONFIG register
 	 */
 	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
-	IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 = 3,
 };
 
 /**


