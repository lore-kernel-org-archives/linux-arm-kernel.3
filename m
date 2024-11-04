Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E988D132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmNiJv6WqsJf0bOgE6V+P+A9hWFzLvThKN+NI4d0xwY=; b=toErhWUrNykouSEsD18GDSA0qz
	Y2McaOOAC1R5yXjAjW5Vd0SxNC3Jhjqw7V4w7u876G45SALw5E/jTxa+8CEcAKTkeJzAqprThC7Zq
	tC5BpjVNn/eGDuQhf1dstzPKe2ttnlaKl/7dOf1nwfKifYo+wnwGFHm+yTD1e0XWfKUs0H2nIEG+m
	U0Qi28UasC9+b+UL7b6vNUfodmK585y2WlbkfA/zmdxqjcvLW8My5w77u/0pwzWfqyqDMpwWNqDMr
	CdRIiD+C+YVf21ZLJMg3tSEH2T1UyzGHqVZ3zbl6hMGRC7qOOmH6q137+PwQGAhsi3iRJc7mTlXVY
	FakJa+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vj9-0000000DcWi-1moi;
	Mon, 04 Nov 2024 11:58:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vYT-0000000DaZy-1PKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EDA4A42E0C;
	Mon,  4 Nov 2024 11:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE59FC4CECE;
	Mon,  4 Nov 2024 11:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730720852;
	bh=YrBkBW416lpDyjoa3v17d3AWN56gLB1Iew1HdUSXMQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6Mb8pBYnu5iaGLA4V3tZYV5eSMnr/XQ2i98fhHzsNVHsgFRUPHP+4iy33vy7otHF
	 SYZm903IjYWYnRn/UsuLTl+EWAski+HVZbIzfthuTDK4GjPn1aRaMC0I85LTkJH/+W
	 rzNlNPEep5itEHFRU586JMeXTp71VoLdm+uvE0YBudRzch1/5/Zogu0W6m7FVSm+yX
	 1IOwOnvitenBXc7Szlsq0+q9775HnLPRaUAept+DZl3u0v5DCmEo664L6yTAnqqFc1
	 f8HXWCYTDWd65Eux6GdM6a+wSdXuEbf57AjXA2IfqFOMQeW8dyA43RH/HyIgJo+Zua
	 9Kk5tpB4z1OjQ==
Date: Mon, 4 Nov 2024 11:47:24 +0000
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
Subject: Re: [PATCH v4 05/12] iommu/arm-smmu-v3: Support IOMMU_GET_HW_INFO
 via struct arm_smmu_hw_info
Message-ID: <20241104114723.GA11511@willie-the-truck>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <5-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_034733_527361_8A0684EA 
X-CRM114-Status: GOOD (  29.59  )
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

On Wed, Oct 30, 2024 at 09:20:49PM -0300, Jason Gunthorpe wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> For virtualization cases the IDR/IIDR/AIDR values of the actual SMMU
> instance need to be available to the VMM so it can construct an
> appropriate vSMMUv3 that reflects the correct HW capabilities.
> 
> For userspace page tables these values are required to constrain the valid
> values within the CD table and the IOPTEs.
> 
> The kernel does not sanitize these values. If building a VMM then
> userspace is required to only forward bits into a VM that it knows it can
> implement. Some bits will also require a VMM to detect if appropriate
> kernel support is available such as for ATS and BTM.
> 
> Start a new file and kconfig for the advanced iommufd support. This lets
> it be compiled out for kernels that are not intended to support
> virtualization, and allows distros to leave it disabled until they are
> shipping a matching qemu too.
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Reviewed-by: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

--->8

> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index e266dfa6a38d9d..b227ac16333fe1 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -488,15 +488,50 @@ struct iommu_hw_info_vtd {
>  	__aligned_u64 ecap_reg;
>  };
>  
> +/**
> + * struct iommu_hw_info_arm_smmuv3 - ARM SMMUv3 hardware information
> + *                                   (IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
> + *
> + * @flags: Must be set to 0
> + * @__reserved: Must be 0
> + * @idr: Implemented features for ARM SMMU Non-secure programming interface
> + * @iidr: Information about the implementation and implementer of ARM SMMU,
> + *        and architecture version supported
> + * @aidr: ARM SMMU architecture version
> + *
> + * For the details of @idr, @iidr and @aidr, please refer to the chapters
> + * from 6.3.1 to 6.3.6 in the SMMUv3 Spec.
> + *
> + * User space should read the underlying ARM SMMUv3 hardware information for
> + * the list of supported features.
> + *
> + * Note that these values reflect the raw HW capability, without any insight if
> + * any required kernel driver support is present. Bits may be set indicating the
> + * HW has functionality that is lacking kernel software support, such as BTM. If
> + * a VMM is using this information to construct emulated copies of these
> + * registers it should only forward bits that it knows it can support.
> + *
> + * In future, presence of required kernel support will be indicated in flags.

What about the case where we _know_ that some functionality is broken in
the hardware? For example, we nobble BTM support on MMU 700 thanks to
erratum #2812531 yet we'll still cheerfully advertise it in IDR0 here.
Similarly, HTTU can be overridden by IORT, so should we update the view
that we advertise for that as well?

Will

