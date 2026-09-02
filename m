Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF91C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCXFIVEfFpWL80gfYTZC+cbgqk/qSDZbCErrII4qADs=; b=2d8BausBu84wyKqRBZyyFvwiwz
	mOYz+HLtQf4SZW/HaZzf4lPqrPIO/GjXi0ByU5K2GmTEuTMYYQ57+IMoulKfd5jbzpY8sQXii6dNV
	f9QSFR6qkt6fiU+6Z8p+VaXLL3glMhnM2/65zYTec84DArmhUz6rEYhOQ85ehcVNS33ETpQSimg5A
	aAD/U20VqtzvykAHAOQxCtAFXek764xYFpeoqI/0ytkndmL0TMW2EQnjccaGk0JN+7fTnqqGH4Se1
	ukz/styW5ovIWU4QrFO2QPohiVKienzS/4loHgpIA55hpli3Kw14hOpzQGoOFDhB1NH9Qd/oLjNUg
	1cf3VHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1koj-0000000EmSe-3hxX;
	Wed, 02 Sep 2026 13:15:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1koi-0000000EmSB-3zE4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:15:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D7344177A;
	Wed,  2 Sep 2026 13:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E8F1F000E9;
	Wed,  2 Sep 2026 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354952;
	bh=eCXFIVEfFpWL80gfYTZC+cbgqk/qSDZbCErrII4qADs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=F/Ek6IDs4uKRlRNj/oEoIyp2aOxBrckLRQvS47Cm7GR+NYHrxgWeq7LR1TgW1T16/
	 WXeDLTqkyw7Hy3B6sCL/wU7qw8qLKkh3Dgisd/FXuQeEZqJepq3+I6sJ/sLqVJn8yy
	 NlqqWE+umbZpMsbTknADVZMf0hee3HKNk+oitMCWAWLLi3XUMq3noY0bHVdOiZR7ij
	 h+q6+zLFRDbAKZPEL9yafnhou+tGq4ooE6IYnk7cD+fwcS3OQVEMH04XOvUJ6hNDux
	 f41BVIOOgIQwNx5n3EKagRnzTRB2Dcu10gKXztrg88kWky1wWugyEtClEyPjZO5sUk
	 5xoqMFHEkdT5A==
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
In-Reply-To: <20260902121700.GC2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com> <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org> <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org> <20260902121700.GC2890729@ziepe.ca>
Date: Wed, 02 Sep 2026 18:45:42 +0530
Message-ID: <yq5aik4nztdt.fsf@kernel.org>
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

> On Wed, Sep 02, 2026 at 02:30:00PM +0530, Aneesh Kumar K.V wrote:
>> Jason Gunthorpe <jgg@ziepe.ca> writes:
>> 
>> > On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
>> >
>> >> @@ -463,14 +460,13 @@
>> >>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>> >>  
>> >>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
>> >> +		if (arm_smmu_is_realm_viommu(viommu))
>> >> +			return arm_realm_smmu_v3_init(viommu, user_data);
>> >> +
>> >
>> > I think the realm vsmmu is going to require a different info struct
>> > than the normal psmmu case, isn't it?
>> >
>> > If so it needs its own enum value.
>> >
>> > It would be nice to see a draft patch showing how the real vsmmu works
>> > on top of the RMM spec for it. If we are using a viommu object then
>> > non-vsmmu case should be identical just with an option in the info
>> > struct to not create the vsmmu object.
>> 
>> Based on feedback on other emails in this thread, I have now implemented
>> this without using a vdevice or viommu. This should make the CCA and
>> non-CCA cases similar.
>
> That wasn't the feedback. The feedback was to use the viommu and not
> make a bunch of new stuff..
>

That rework was done before I saw your discussion with Nicolin.

To reiterate, for this configuration:

- The viommu will use a stage-1 bypass configuration.
- A new IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 type will create the viommu.
  The psmmu will be activated at this point to avoid creating psmmu
  objects early. We will reference-count it to ensure that the same
  psmmu is shared across realm guests.
- Creating a vdevice will invoke SMC_RMI_PSMMU_ST_L2_CREATE.

I am unclear about the vdev_create suggestion. Creating a vdevice
requires an RD, which is created later in the flow above. How do you
suggest linking vdevice_alloc to vdev_create?

From the RMM's perspective, the sequence is as follows:

viommu alloc 

[   rmm ] SMC_RMI_PSMMU_ACTIVATE            2b400000 8819bb000 > RMI_INCOMPLETE 0 10008
[   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 2 10004
[   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 10004
[   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
[   rmm ] L1 StrTab: PA 0x881baa000 VA 0x80003c0000 size 0x2000
[   rmm ] CMDQ: PA 0x88066a000 VA 0x80003c2000
[   rmm ] EVTQ: PA 0x8815c5000 VA 0x80003c3000
[   rmm ] PSMMU 0x2b400000 activated
[   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
[   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 300 > RMI_INCOMPLETE 0 10004
[   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
[   rmm ] smmu->strtab_base[12] 0x0 @0x80003c0060
[   rmm ] L1STD[12] 0x8819bb007 for SID 0x300: L2 table VA 0x80003d0000 PA 0x8819bb000
[   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

vdevice alloc

[   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 200 > RMI_INCOMPLETE 0 10004
[   rmm ]       SMC_RMI_OP_MEM_DONATE       0 882648098 1 > RMI_INCOMPLETE 1 0
[   rmm ] smmu->strtab_base[8] 0x0 @0x80003c0040
[   rmm ] L1STD[8] 0x882506007 for SID 0x200: L2 table VA 0x80003cc000 PA 0x882506000
[   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

RD gets allocated here

[   rmm ] SMC_RMI_REALM_CREATE              881b03000 8819a1000 > RMI_INCOMPLETE 0 24
[   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881605098 9 > RMI_INCOMPLETE 9 0
[   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

-aneesh

