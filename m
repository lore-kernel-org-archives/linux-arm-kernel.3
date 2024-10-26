Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC337D0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ILgF2ANT9OZDmDrUe3BvutpFI6Z0i+T3Y7sxTWoDZw=; b=PK/3BGeSadTDoMeG2jqYy/bdQx
	K4+uDWXL7mkoyYzNBUmvICrcZWpyQjEAqYimMjM1TBvipx2tk9OtBIfL7c5iWgfLYpJjwhKqoUdtu
	8sL5lV03zFGDy2NC8qXUP0PDIecm/2eZigfS4zeeM0TOedwd27N/633zibS9xbWp+DnGuo6mKVQ/W
	m2UfrSP6QgPug9K8xAierujOc9dzGAGMnp94qybLONqVehA/ZYRLfYwi8XUAn0n5lDTT53WB0hdc8
	LftaqTcEoOezCM0mBYHl/UKnqeoXFraCG+lFFFymhAZorYUoRQiYZIS6X7TeKCYpsCuVoAVk5SGN1
	2L9gJ9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nPi-00000007Bqy-3anV;
	Sat, 26 Oct 2024 20:29:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nO6-00000007Be0-3AEH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729974472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ILgF2ANT9OZDmDrUe3BvutpFI6Z0i+T3Y7sxTWoDZw=;
	b=SSkM8HK2gm6j1vqGhJIa54BEVqWv/qnXV7vJAlLfnVy5kEhqRJSWLuy2KooWuRe0lRWSgi
	7LgaE1fzP4zvfh1EEBOHFTGxSn9HuhZ6iZm+oJDLk2ngh6+sNXU1vCdcunwJTzW5KpRiHN
	muiYxxurT+8JlYJquwvwTiXZSuO6SuM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-NEZ5htamPU6R-FZ8WMjmSw-1; Sat, 26 Oct 2024 16:26:03 -0400
X-MC-Unique: NEZ5htamPU6R-FZ8WMjmSw-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-71e49bad8adso3290366b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974363; x=1730579163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ILgF2ANT9OZDmDrUe3BvutpFI6Z0i+T3Y7sxTWoDZw=;
        b=wEIyt7xgeQZ1GjoKTQwiC3OhTyN+lBnBt5NoWctsdoVgc/lWq0CbV0QRVFsXyjq0WU
         /17oIlOB3ZkblSIt2bQ2br3NZBRTAwy4W4nbJHgrWEz6zmWM2SkYyYQVJ2+ziPl96IQU
         zl/dYb0jKXoSwLKqSsjgg8cXmiTZON0azuT763g0DGUZI4Rltzx1fxwWHrewcfSTyxqm
         1vTlfk25yxmS9Hw1Gn/kw19EVTpCUS4SxqWqiD8FgtEUNWo5rEkQI1qL1q1c7zmb3VOr
         K8vQBnh0rkYV4uONrro/eN85pw80KRdyj+9o9qsZPxidqIT0KD63ZETAPeyP6eYoULBM
         7rRw==
X-Forwarded-Encrypted: i=1; AJvYcCXZHrQ2IJW9GXt5068iNa87v2J8ayPF//8CYq4Pfg7hi2tuw0sTtfwH5Z388+yYiETuzqHMp+DyUtj2mxllu9yS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy2h0VbtfREISPfjL0KLaWCXLQ3cMtfhtWid/ySjoc4wSPiFFd
	geAIbh4SayfxsAvqi6/YXNpYDJMtqDQ1uFee9jSQ7HGSIhybnb9tyKJKOz7cIcXVXf8jpWmS7EM
	UQbI5raNyC1WdYL+3TLkySpOa31YprFY9uhzyS8kMTigUmmMaGDIdPrK9n30lgtQYtIRhYJ58
X-Received: by 2002:a05:6a21:394b:b0:1d9:3acf:8bdd with SMTP id adf61e73a8af0-1d9a767bdfamr5925543637.22.1729974362657;
        Sat, 26 Oct 2024 13:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwP/m05oeFk9b8sbVzI0tK+++7zBHiaxMX3MviGhXhL+kZBBndL9iS5Tpoq327xlI5FsMfmw==
X-Received: by 2002:a05:6a21:394b:b0:1d9:3acf:8bdd with SMTP id adf61e73a8af0-1d9a767bdfamr5925511637.22.1729974362246;
        Sat, 26 Oct 2024 13:26:02 -0700 (PDT)
Received: from localhost (ip98-179-76-110.ph.ph.cox.net. [98.179.76.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791dda2sm3081517b3a.42.2024.10.26.13.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:26:01 -0700 (PDT)
Date: Sat, 26 Oct 2024 13:26:00 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Hanjun Guo <guohanjun@huawei.com>, 
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Williamson <alex.williamson@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Moritz Fischer <mdf@kernel.org>, 
	Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 0/9] Initial support for SMMUv3 nested translation
Message-ID: <7uv6kandebgqyw64im2kfwmiqahsikpsb6yp2tkd6qol3li3r3@fxsra3soryma>
References: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_132754_883239_65DC40E2 
X-CRM114-Status: GOOD (  31.66  )
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

On Wed, Oct 09, 2024 at 01:23:06PM -0300, Jason Gunthorpe wrote:
> This brings support for the IOMMFD ioctls:
> 
>  - IOMMU_GET_HW_INFO
>  - IOMMU_HWPT_ALLOC_NEST_PARENT
>  - IOMMU_DOMAIN_NESTED
>  - ops->enforce_cache_coherency()
> 
> This is quite straightforward as the nested STE can just be built in the
> special NESTED domain op and fed through the generic update machinery.
> 
> The design allows the user provided STE fragment to control several
> aspects of the translation, including putting the STE into a "virtual
> bypass" or a aborting state. This duplicates functionality available by
> other means, but it allows trivially preserving the VMID in the STE as we
> eventually move towards the vIOMMU owning the VMID.
> 
> Nesting support requires the system to either support S2FWB or the
> stronger CANWBS ACPI flag. This is to ensure the VM cannot bypass the
> cache and view incoherent data, currently VFIO lacks any cache flushing
> that would make this safe.
> 
> Yan has a series to add some of the needed infrastructure for VFIO cache
> flushing here:
> 
>  https://lore.kernel.org/linux-iommu/20240507061802.20184-1-yan.y.zhao@intel.com/
> 
> Which may someday allow relaxing this further.
> 
> Remove VFIO_TYPE1_NESTING_IOMMU since it was never used and superseded by
> this.
> 
> This is the first series in what will be several to complete nesting
> support. At least:
>  - IOMMU_RESV_SW_MSI related fixups
>     https://lore.kernel.org/linux-iommu/cover.1722644866.git.nicolinc@nvidia.com/
>  - vIOMMU object support to allow ATS and CD invalidations
>     https://lore.kernel.org/linux-iommu/cover.1723061377.git.nicolinc@nvidia.com/
>  - vCMDQ hypervisor support for direct invalidation queue assignment
>     https://lore.kernel.org/linux-iommu/cover.1712978212.git.nicolinc@nvidia.com/
>  - KVM pinned VMID using vIOMMU for vBTM
>     https://lore.kernel.org/linux-iommu/20240208151837.35068-1-shameerali.kolothum.thodi@huawei.com/
>  - Cross instance S2 sharing
>  - Virtual Machine Structure using vIOMMU (for vMPAM?)
>  - Fault forwarding support through IOMMUFD's fault fd for vSVA
> 
> The vIOMMU series is essential to allow the invalidations to be processed
> for the CD as well.
> 
> It is enough to allow qemu work to progress.
> 
> This is on github: https://github.com/jgunthorpe/linux/commits/smmuv3_nesting
> 
> v3:
>  - Rebase on v6.12-rc2
>  - Revise commit messages
>  - Consolidate CANWB checks into arm_smmu_master_canwbs()
>  - Add CONFIG_ARM_SMMU_V3_IOMMUFD to compile out iommufd only features
>    like nesting
>  - Shift code into arm-smmu-v3-iommufd.c
>  - Add missed IS_ERR check
>  - Add S2FWB to arm_smmu_get_ste_used()
>  - Fixup quirks checks
>  - Drop ARM_SMMU_FEAT_COHERENCY checks for S2FWB
>  - Limit S2FWB to S2 Nesting Parent domains "just in case"
> v2: https://patch.msgid.link/r/0-v2-621370057090+91fec-smmuv3_nesting_jgg@nvidia.com
>  - Revise commit messages
>  - Guard S2FWB support with ARM_SMMU_FEAT_COHERENCY, since it doesn't make
>    sense to use S2FWB to enforce coherency on inherently non-coherent hardware.
>  - Add missing IO_PGTABLE_QUIRK_ARM_S2FWB validation
>  - Include formal ACPIA commit for IORT built using
>    generate/linux/gen-patch.sh
>  - Use FEAT_NESTING to block creating a NESTING_PARENT
>  - Use an abort STE instead of non-valid if the user requests a non-valid
>    vSTE
>  - Consistently use 'nest_parent' for naming variables
>  - Use the right domain for arm_smmu_remove_master_domain() when it
>    removes the master
>  - Join bitfields together
>  - Drop arm_smmu_cache_invalidate_user patch, invalidation will
>    exclusively go via viommu
> v1: https://patch.msgid.link/r/0-v1-54e734311a7f+14f72-smmuv3_nesting_jgg@nvidia.com
> 
> Jason Gunthorpe (6):
>   vfio: Remove VFIO_TYPE1_NESTING_IOMMU
>   iommu/arm-smmu-v3: Report IOMMU_CAP_ENFORCE_CACHE_COHERENCY for CANWBS
>   iommu/arm-smmu-v3: Implement IOMMU_HWPT_ALLOC_NEST_PARENT
>   iommu/arm-smmu-v3: Expose the arm_smmu_attach interface
>   iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
>   iommu/arm-smmu-v3: Use S2FWB for NESTED domains
> 
> Nicolin Chen (3):
>   ACPICA: IORT: Update for revision E.f
>   ACPI/IORT: Support CANWBS memory access flag
>   iommu/arm-smmu-v3: Support IOMMU_GET_HW_INFO via struct
>     arm_smmu_hw_info
> 
>  drivers/acpi/arm64/iort.c                     |  13 ++
>  drivers/iommu/Kconfig                         |   9 +
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 204 ++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 114 ++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  83 ++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         |  16 --
>  drivers/iommu/io-pgtable-arm.c                |  27 ++-
>  drivers/iommu/iommu.c                         |  10 -
>  drivers/iommu/iommufd/vfio_compat.c           |   7 +-
>  drivers/vfio/vfio_iommu_type1.c               |  12 +-
>  include/acpi/actbl2.h                         |   3 +-
>  include/linux/io-pgtable.h                    |   2 +
>  include/linux/iommu.h                         |   5 +-
>  include/uapi/linux/iommufd.h                  |  55 +++++
>  include/uapi/linux/vfio.h                     |   2 +-
>  16 files changed, 465 insertions(+), 98 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> 
> 
> base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
> -- 
> 2.46.2
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


