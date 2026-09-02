Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336AFC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGyhqwpoKTL0G6djLUzdmHXBsAx/+FUeg8O/vusz8V0=; b=Z4TSCfWw/33euLjLYgUZGbLA8X
	VPQjJeh3QzwcCPzAqtLRbI/B645ekHb+iUdZCXVaYFOs11eJ/TsMzgg7G/Uz77tDS3VkF29bn0LOl
	UNuJK0jFyHB/nbZxwXA6whtUB+j4jtW3Yf679onzXdqH+hZTss77XiQQpjeoQ9s87xbysG+mP2rCJ
	jiMvOXjQWK7xi7v59nHNzPwp3+yD+NhqvnGr9k7o2hS20Jmb6/k8WSj+sjmHQfbUfQ9olKtAUu6P3
	N2rXqaP3+GxNuHYOJErAjSypjzvlfN37/aqjD3h+dPl9SubEsgr3KsJ3qjLBeJ5CQ1BBBdm+T8Adl
	3z1RfFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gpI-0000000EAPH-0yeT;
	Wed, 02 Sep 2026 09:00:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gpH-0000000EAP4-02oH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD6BF600C8;
	Wed,  2 Sep 2026 09:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55F01F000E9;
	Wed,  2 Sep 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788339609;
	bh=kGyhqwpoKTL0G6djLUzdmHXBsAx/+FUeg8O/vusz8V0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HT9rw3M2ril3h9HMMccrqUbRw18Y37zhmnmK/bItstsqPU4xvADrVr3rHRziehMDw
	 BOw4h8K19eDGvV5uEW9XBGFwwqKZpgEZHr2FBOCKTGra1KFISWVC2rLqTKmw+zAFta
	 x9RXu3uiPfFMY5S5Q2IO51/Spu0QzQzo0UY+f0A8s4fRaDqS+ZKVlIX5CTCp34qlwg
	 g+bYFUVyqj8wsMbDg7JBmHCuq2uyVf/pgX8yOO8mWpbeeJ/+Q7RFQYvj1lZqsWNWqx
	 PCYywxlsofp9l9u8saVOHj8DrFoOq3Emn4t2HB7mFhKBI+jQ61+t3rTzm/gk0c8+XT
	 RamxAu6k/gU2A==
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
In-Reply-To: <20260901143445.GC56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com> <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org> <20260901143445.GC56830@ziepe.ca>
Date: Wed, 02 Sep 2026 14:30:00 +0530
Message-ID: <yq5a8q5kkoz3.fsf@kernel.org>
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

> On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
>
>> @@ -463,14 +460,13 @@
>>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>>  
>>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
>> +		if (arm_smmu_is_realm_viommu(viommu))
>> +			return arm_realm_smmu_v3_init(viommu, user_data);
>> +
>
> I think the realm vsmmu is going to require a different info struct
> than the normal psmmu case, isn't it?
>
> If so it needs its own enum value.
>
> It would be nice to see a draft patch showing how the real vsmmu works
> on top of the RMM spec for it. If we are using a viommu object then
> non-vsmmu case should be identical just with an option in the info
> struct to not create the vsmmu object.
>

Based on feedback on other emails in this thread, I have now implemented
this without using a vdevice or viommu. This should make the CCA and
non-CCA cases similar.

This ends up adding:

modified   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4324,6 +4324,8 @@ static const struct iommu_ops arm_smmu_ops = {
 	.def_domain_type	= arm_smmu_def_domain_type,
 	.get_viommu_size	= arm_smmu_get_viommu_size,
 	.viommu_init		= arm_vsmmu_init,
+	.tsm_bind		= arm_smmu_realm_tsm_bind,
+	.tsm_unbind		= arm_smmu_realm_tsm_unbind,
 	.user_pasid_table	= 1,
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {


and

+int arm_smmu_realm_tsm_bind(struct device *dev, struct kvm *kvm)
+{
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	int ret;
+
+	if (!kvm_is_realm(kvm))
+		return 0;
+
+	ret = arm_realm_smmu_get(master->smmu);
+	if (ret)
+		return ret;
+
+	ret = arm_realm_smmu_stream_get(master);
+	if (ret)
+		arm_realm_smmu_put(master->smmu);
+	return ret;
+}
+
+void arm_smmu_realm_tsm_unbind(struct device *dev, struct kvm *kvm)
+{
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+
+	if (!kvm_is_realm(kvm))
+		return;
+
+	arm_realm_smmu_stream_put(master);
+	arm_realm_smmu_put(master->smmu);
+}

and tsm op iotcl now becomes

iommufd_device_tsm_op_ioctl()

	switch (cmd->type) {
	case IOMMU_DEVICE_TSM_BIND:
		if (!idev->tsm_iommu_bound && ops->tsm_bind) {
			if (WARN_ON_ONCE(!ops->tsm_unbind)) {
				ret = -EOPNOTSUPP;
				break;
			}
			ret = ops->tsm_bind(idev->dev, kvm);
			if (ret)
				break;
			idev->tsm_iommu_bound = true;
			iommu_bound = true;
		}
		ret = tsm_bind(idev->dev, kvm, cmd->tdi_id);
		if (ret && iommu_bound) {
			ops->tsm_unbind(idev->dev, kvm);
			idev->tsm_iommu_bound = false;
		}
		break;
	case IOMMU_DEVICE_TSM_UNBIND:
		__iommufd_device_tsm_unbind(idev);
		ret = 0;
		break;
	default:
		ret = -EINVAL;
		break;
	}

I am yet to clean up the changes. I just wanted to share that we can
possibly drop the vdevice/viommu requirement.

-aneesh

