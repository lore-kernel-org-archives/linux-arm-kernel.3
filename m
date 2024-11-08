Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E105D5C0ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvRjFSA5owH8GxQIP6MCt/gVytpvDybPaXNKcmnYJOA=; b=t+xlnsPazhXeeJEhLU7DL7+Gdf
	IjjrOtZcaRnXutAucxlYWEKY8sPZXn8a97wLJ/NEpnwhoayny2pBcSlS290o7BlmoVS7mferUFHEI
	jM39VXKzsIhGjj7W1F7CzF3k7/oKXfbc9ZIP3x/FN4+oGk8qIFpmkEVRK1Wl6pGXKFOKcBX7ySX/Z
	LIlRShV0Edvp8v20/KSm5phExxfWLbh8p1dvFVbHt3MStfn06ZO1pgX7itB6t8F2XRovwNDFNRb1i
	iLT9HBXqGaj9wcy71n9BTGJlejE6ig739nnHk4b9MsFQ0iqpa4D4avWxDZR824PbqGaVrfH+R+4Eo
	uMLxs+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R4F-0000000B3k0-3pRo;
	Fri, 08 Nov 2024 15:38:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QPP-0000000AvU0-32hi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46D4B5C5BA1;
	Fri,  8 Nov 2024 14:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CD3C4CECD;
	Fri,  8 Nov 2024 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731077782;
	bh=6FAwEz1aNs6pjulAvH3wCg9nOjDsVb0l9FuLjHXGFtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9hZFeNVj8VpGUF0f27FLcnlwN8hRdEybVmw28VptgICFG1V13MnGp3yEMYfBMgLF
	 qX/rFwNSfcv6bGXMcrHN8aqlcZJLH8/ebuueRx4DuApb7umf0a73hsVDq9dTwb3u5+
	 6sLvOCk4DKWF4jlO7DvWI9Agl3/36SYxws1x7QNr/FKjeAnR21CHXWHKToEKVvIyTN
	 IDVZ+ob4t2u0QPax7OJ8MG5Wr8LNPlnwXdoAKe4KRH6mWxcge8Ftmj7JhkBp7kbI86
	 C6EM6SEYAebI18+wacEEL8/H9ag8KIaqO8kbE/S3KvBuIE/bSahpBE4+XVgADcl5FV
	 yBC9lwPvpCnwg==
Date: Fri, 8 Nov 2024 14:56:14 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	kvm@vger.kernel.org, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
Message-ID: <20241108145611.GB17325@willie-the-truck>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <20241101121849.GD8518@willie-the-truck>
 <20241101132503.GU10193@nvidia.com>
 <20241105164829.GA12923@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105164829.GA12923@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_065623_874176_2B990802 
X-CRM114-Status: GOOD (  20.83  )
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

On Tue, Nov 05, 2024 at 04:48:29PM +0000, Will Deacon wrote:
> On Fri, Nov 01, 2024 at 10:25:03AM -0300, Jason Gunthorpe wrote:
> > On Fri, Nov 01, 2024 at 12:18:50PM +0000, Will Deacon wrote:
> > > On Wed, Oct 30, 2024 at 09:20:44PM -0300, Jason Gunthorpe wrote:
> > > > [This is now based on Nicolin's iommufd patches for vIOMMU and will need
> > > > to go through the iommufd tree, please ack]
> > > 
> > > Can't we separate out the SMMUv3 driver changes? They shouldn't depend on
> > > Nicolin's work afaict.
> > 
> > We can put everything before "iommu/arm-smmu-v3: Support
> > IOMMU_VIOMMU_ALLOC" directly on a rc and share a branch with your tree.
> > 
> > That patch and following all depend on Nicolin's work, as they rely on
> > the VIOMMU due to how different ARM is from Intel.
> > 
> > How about you take these patches:
> > 
> >  [PATCH v4 01/12] vfio: Remove VFIO_TYPE1_NESTING_IOMMU
> >  [PATCH v4 02/12] ACPICA: IORT: Update for revision E.f
> >  [PATCH v4 03/12] ACPI/IORT: Support CANWBS memory access flag
> >  [PATCH v4 04/12] iommu/arm-smmu-v3: Report IOMMU_CAP_ENFORCE_CACHE_COHERENCY for CANWBS
> >  [PATCH v4 05/12] iommu/arm-smmu-v3: Support IOMMU_GET_HW_INFO via struct arm_smmu_hw_info
> >  [PATCH v4 06/12] iommu/arm-smmu-v3: Implement IOMMU_HWPT_ALLOC_NEST_PARENT
> >  [PATCH v4 07/12] iommu/arm-smmu-v3: Expose the arm_smmu_attach interface
> > 
> > Onto a branch.
> 
> I've pushed these onto a new branch in the IOMMU tree:
> 
> 	iommufd/arm-smmuv3-nested
> 
> However, please can you give it a day or two to get some exposure in
> -next before you merge that into iommufd? I'll ping back here later in
> the week.

Not seen anything go bang in -next, so I think we can consider this
branch stable now.

Will

