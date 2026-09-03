Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B19C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVxkLaQT4T/vmJg4DPi96Zlumzz3/QNy4dvXOiGy+xY=; b=m4uFeQj41F0nd45K5gFoupm2Kt
	tAYaijSrgoIDhtpUG/4poWjupacA8E3aEjf+oUMNDiKjslvWPGRDzkUDP/tpSJMxDOO6nnpX93/6n
	bNJRmyaVFDLT+Li+D0NW4lVTgvyT3CeF0TajuEb5P1Ouq6lOGpQh0spGT2ON4cR1Ta23i8FETuhfW
	IAHptmqvzq22Rl6VYi52vVIUbLNyPuxrdqIkqsbAa+caPdNiowwnVcLwSKodYfrNB4Gs97gLbi0qh
	fKGQiH9BPvcXkqI4YfzBVj5iCcXa69nO0yGStLcz6ajEpFzg0AHCm7KenAkvLS5dtYQY9FttjKw/8
	3JyqjeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zzm-0000000GOXw-3962;
	Thu, 03 Sep 2026 05:28:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zzl-0000000GOXp-08PQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90F6E43A86;
	Thu,  3 Sep 2026 05:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F451F000E9;
	Thu,  3 Sep 2026 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788413296;
	bh=JVxkLaQT4T/vmJg4DPi96Zlumzz3/QNy4dvXOiGy+xY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Vn0LIuvybbznKaVVTOU5d9OPD4sBTUuFDC63Qy5Wl+VX0M4oRhgBBnmo53RitRShT
	 c7z03wmwZBrTzJfrXaCtVShWaL8TR6idp1sgjVL9rq0yZxoLMr/T2uEW+YAfzNF9zS
	 5A3PZVxn3sLOHTx1eJ4R5I9xbJxKfHOtJ0DNjpP7UO/vMGVsJcrEez0qHW+/H8ewrX
	 xh0jzW2womVcJB5iUAB2zxIuZhDeocWCLNa0Df3uVTbgTvPssrni2LkhEfBAAS2p1T
	 F1vr7KzeOWS8srrLF8GdvOEj1szbNN90v3hDyCH5/HV1ArwEwQksvNfbsQ2VAkMT8x
	 oCDwwtJGPl0mQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
In-Reply-To: <20260902193014.GF2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com> <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org> <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org> <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org> <20260902193014.GF2890729@ziepe.ca>
Date: Thu, 03 Sep 2026 10:58:06 +0530
Message-ID: <yq5abjaezyxl.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Sep 02, 2026 at 06:45:42PM +0530, Aneesh Kumar K.V wrote:
>
>> To reiterate, for this configuration:
>> 
>> - The viommu will use a stage-1 bypass configuration.
>> - A new IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 type will create the viommu.
>>   The psmmu will be activated at this point to avoid creating psmmu
>>   objects early. We will reference-count it to ensure that the same
>>   psmmu is shared across realm guests.
>> - Creating a vdevice will invoke SMC_RMI_PSMMU_ST_L2_CREATE.
>> 
>> I am unclear about the vdev_create suggestion. Creating a vdevice
>> requires an RD, which is created later in the flow above. How do you
>> suggest linking vdevice_alloc to vdev_create?
>
> I was thinking we'd make sure the KVM is associated with the viommu
> and/or possibly the S2 domain. That was always sort of broadly the
> idea in this space. There are several topics unrelated to CC that
> needed this.
> In any case, when you create the iommufd viommu you should also do
> VSMMU_CREATE which needs the RD. It seems reasonable to assume the RD
> is available during vdevice create.
>
> [There is an aside here I will mention: several other use cases need
> this idea of an "external" domain where the HWPT would be created but
> not controlled by iommufd or the iommu subsystem. Xen and Hyperv for
> example. There is probably some merit in thinking more about exactly
> what the nested parent domain should be for this viommu, but it isn't
> critical.]
>
>> From the RMM's perspective, the sequence is as follows:
>>
>> viommu alloc
>>
>> [   rmm ] SMC_RMI_PSMMU_ACTIVATE            2b400000 8819bb000 > RMI_INCOMPLETE 0 10008
>> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 2 10004
>> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 10004
>> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
>> [   rmm ] L1 StrTab: PA 0x881baa000 VA 0x80003c0000 size 0x2000
>> [   rmm ] CMDQ: PA 0x88066a000 VA 0x80003c2000
>> [   rmm ] EVTQ: PA 0x8815c5000 VA 0x80003c3000
>> [   rmm ] PSMMU 0x2b400000 activated
>> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
>>
>> [   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 300 > RMI_INCOMPLETE 0 10004
>> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
>> [   rmm ] smmu->strtab_base[12] 0x0 @0x80003c0060
>> [   rmm ] L1STD[12] 0x8819bb007 for SID 0x300: L2 table VA 0x80003d0000 PA 0x8819bb000
>> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
>
> What was this one for during viommu alloc?
>
>> vdevice alloc
>> 
>> [   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 200 > RMI_INCOMPLETE 0 10004
>> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 882648098 1 > RMI_INCOMPLETE 1 0
>> [   rmm ] smmu->strtab_base[8] 0x0 @0x80003c0040
>> [   rmm ] L1STD[8] 0x882506007 for SID 0x200: L2 table VA 0x80003cc000 PA 0x882506000
>> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
>> 
>> RD gets allocated here
>> 
>> [   rmm ] SMC_RMI_REALM_CREATE              881b03000 8819a1000 > RMI_INCOMPLETE 0 24
>> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881605098 9 > RMI_INCOMPLETE 9 0
>> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
>
> Why? The VMM needs to create the kvm before starting the iommu stuff.
>
> I would expect that KVM knows it is going to a realm very early on? I
> had assumed the RD would also be created early by KVM?
>
> What triggers RD creation? Why can't the VMM do it earlier?
>
> Your followup said:
>   - The realm is created during viommu allocation, ensuring that the
>     vSMMU can be created here.
>
> Do you mean the SMMUv3 driver triggers RD creation? That feels
> wrong. Did you mean the VMM just does it earlier?
>

Currently, CCA creates the realm lazily as part of another operation.
Realm creation is triggered by kvm_arm_rmi_populate() or
kvm_arch_vcpu_run_pid_change()

The change looks like this:

modified   arch/arm64/include/asm/kvm_rmi.h
@@ -102,6 +102,14 @@ u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
 bool kvm_rmi_supports_sve(void);
 
 int kvm_init_realm(struct kvm *kvm);
+#ifdef CONFIG_KVM
+int kvm_realm_ensure_created(struct kvm *kvm);
+#else
+static inline int kvm_realm_ensure_created(struct kvm *kvm)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
 int kvm_realm_teardown_stage2(struct kvm *kvm);
modified   arch/arm64/kvm/rmi.c
@@ -1120,6 +1120,20 @@ static int realm_ensure_created(struct kvm *kvm)
 	return realm_create_rd(kvm);
 }
 
+int kvm_realm_ensure_created(struct kvm *kvm)
+{
+	int ret;
+
+	if (!kvm_is_realm(kvm))
+		return -EINVAL;
+
+	guard(mutex)(&kvm->arch.config_lock);
+	ret = realm_ensure_created(kvm);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kvm_realm_ensure_created);
+
 int kvm_arm_rmi_init_ripas(struct kvm *kvm,
 			   struct kvm_arm_rmi_init_ripas *args)
 {
modified   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
@@ -253,8 +253,9 @@ int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
 		return -EINVAL;
 
 	kvm = viommu->kvm_file->private_data;
-	if (!kvm_is_realm(kvm))
-		return -EINVAL;
+	ret = kvm_realm_ensure_created(kvm);
+	if (ret)
+		return ret;
 
 	if (!(smmu->features & ARM_SMMU_FEAT_RME))
 		return -EOPNOTSUPP;


>
> The draft in the next message looks promising, did you discover any
> other gotchas when exploring it?
>

Nothing significant. I still have questions about moving TDI flows such
as vdev creation and guest requests into the SMMU driver instead of
keeping them in arm-cca-host.ko, but I will follow up in the other
thread.

>
> When you repost this can you take some care to explain the general
> idea of this modelling in the commit messages so AMD and Intel can
> confirm they can use it for both their non-viommu and viommu cases?
>
> Thanks,
> Jason

-aneesh

