Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF7D7495C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6Fn1Bf3LTxjm3Pi7bGgRNx/dCat7AxttwP16Rp3WAQ=; b=1sccGo9wi+3yj6glrcyEhVuNFj
	eBVmLKEP1LCLEVJnyO47u+o90VBPmsqh5yUriTev7U9ogii4PEAvMyaYVVjf139DFy5iHZvcRnCOh
	J+dBtesKFqSoE9Jq3okxaNc9toWQqbpbkQAuKMEWzVEmn9JE2a863z/LrhvhSWdS8lqK0ELrwKtLh
	m+Y7TQm9WqGGtWFdg6RJUOznZc1cXkKqqmb5a5idemGKeW5SOH1l3J8RuPRd4eb4u9KDNavDYD4Pk
	hJ1jdA2Tr0D8KxxIT+Hi6LdIA8F5yWbzZzT2NFTkCwi9XhVJpMT4x+OAd7157iG9xF5eRtvp7bb1e
	2KmeHOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t601i-0000000GeLI-2OAb;
	Wed, 30 Oct 2024 04:09:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6003-0000000Ge7i-3yBG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730261281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6Fn1Bf3LTxjm3Pi7bGgRNx/dCat7AxttwP16Rp3WAQ=;
	b=Cm6aTF1SrB7plQmJSbrSjzaGUNMp4GmU5LP2iHhoxfMQttTOtTCW/nQP00znccl2zKJDU0
	fRipIVWEIIr+qqQM28kYSrP+EGxcR7iP0wJX0AIm25Kjr54xEZ7hJVY1RRdyDhq+jKKuIp
	yF8amAkViMFThNfJChBrFuZiALqIsg8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-JShLLCWkNhmPqdo-lBU6ww-1; Wed, 30 Oct 2024 00:06:27 -0400
X-MC-Unique: JShLLCWkNhmPqdo-lBU6ww-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ac9b08cb77so1267343085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 21:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730261187; x=1730865987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Fn1Bf3LTxjm3Pi7bGgRNx/dCat7AxttwP16Rp3WAQ=;
        b=RkgZ2LNapm889+4QfqSQdxRG2wG2auiSboxD9gjx7ZWu+qZSZmoxX1XDEw2XDBjiju
         KOUx3MXexC2YV2flmA0kQ5zndnuW6siwtYxn/THV9f1ga6k+ZUb7yq/W8lEZ2OsVP8QI
         2BE2nLIndQKBSdTIZVTtbArDEEzVuEiMPaSF6+nbAKNK5vEZvGe0TrHCJexvDpPp+U3d
         1M/Nv/q733kWa5VKQx95CF8KyksiXT+K3zX1MM0yEZZvggWJuZ4vpKp3o9iqCrWEzyw9
         E0bJJ7ngiDsQc91V3XXRqzUv7/gHqebZxZScNCX5QKWbgGRo8Kmi0D5Fkn7Zs1OQjU7W
         lHGg==
X-Forwarded-Encrypted: i=1; AJvYcCUxXVhffvBQFvkOKm8r3v5cgYE64SH3Q+7ZgPWQ7L5r2F68fR01jxwApUrYPpm9zyJRmzqMnt75MM5UuO/8uqFJ@lists.infradead.org
X-Gm-Message-State: AOJu0YznqcFpICGVLgE95T0YUISpsmnauAUAAOj+D0mHaGFHfGEiW/eR
	S+2F1AOaaJbaeaDBJIL0kCcsvgvgg10P8j1c5fTcAylxvpcvdt5rEaZPfR2JJJvCoV6tSEEId4J
	yMaB+4CU8hOb4wOWRIaN8HRf/sYx/b83QhP3u0/z3eZuraB3XS1+vycv1BkC8piPxM9atxCrw
X-Received: by 2002:a05:620a:1a84:b0:7a9:b456:c5e6 with SMTP id af79cd13be357-7b193f35bf3mr1894410085a.42.1730261186705;
        Tue, 29 Oct 2024 21:06:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrx1mmIynIiSGSVPWiqtshULFjxIn2aPt/C14LDu8Kq33y8t5ez+1+bvieZGhRPfYYDYfiJQ==
X-Received: by 2002:a05:620a:1a84:b0:7a9:b456:c5e6 with SMTP id af79cd13be357-7b193f35bf3mr1894405985a.42.1730261186319;
        Tue, 29 Oct 2024 21:06:26 -0700 (PDT)
Received: from [192.168.40.163] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d2ca347sm481562385a.71.2024.10.29.21.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 21:06:25 -0700 (PDT)
Message-ID: <469bcbeb-97e0-4fc4-9c2b-b86c59dbe24a@redhat.com>
Date: Wed, 30 Oct 2024 00:06:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Initial support for SMMUv3 nested translation
To: Jason Gunthorpe <jgg@nvidia.com>, acpica-devel@lists.linux.dev,
 Hanjun Guo <guohanjun@huawei.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>,
 Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_210804_068663_2D64D8D2 
X-CRM114-Status: GOOD (  31.99  )
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



On 10/9/24 12:23 PM, Jason Gunthorpe wrote:
> This brings support for the IOMMFD ioctls:
> 
>   - IOMMU_GET_HW_INFO
>   - IOMMU_HWPT_ALLOC_NEST_PARENT
>   - IOMMU_DOMAIN_NESTED
>   - ops->enforce_cache_coherency()
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
>   https://lore.kernel.org/linux-iommu/20240507061802.20184-1-yan.y.zhao@intel.com/
> 
> Which may someday allow relaxing this further.
> 
> Remove VFIO_TYPE1_NESTING_IOMMU since it was never used and superseded by
> this.
> 
> This is the first series in what will be several to complete nesting
> support. At least:
>   - IOMMU_RESV_SW_MSI related fixups
>      https://lore.kernel.org/linux-iommu/cover.1722644866.git.nicolinc@nvidia.com/
>   - vIOMMU object support to allow ATS and CD invalidations
>      https://lore.kernel.org/linux-iommu/cover.1723061377.git.nicolinc@nvidia.com/
>   - vCMDQ hypervisor support for direct invalidation queue assignment
>      https://lore.kernel.org/linux-iommu/cover.1712978212.git.nicolinc@nvidia.com/
>   - KVM pinned VMID using vIOMMU for vBTM
>      https://lore.kernel.org/linux-iommu/20240208151837.35068-1-shameerali.kolothum.thodi@huawei.com/
>   - Cross instance S2 sharing
>   - Virtual Machine Structure using vIOMMU (for vMPAM?)
>   - Fault forwarding support through IOMMUFD's fault fd for vSVA
> 
> The vIOMMU series is essential to allow the invalidations to be processed
> for the CD as well.
> 
> It is enough to allow qemu work to progress.
> 
> This is on github: https://github.com/jgunthorpe/linux/commits/smmuv3_nesting
> 
> v3:
>   - Rebase on v6.12-rc2
>   - Revise commit messages
>   - Consolidate CANWB checks into arm_smmu_master_canwbs()
>   - Add CONFIG_ARM_SMMU_V3_IOMMUFD to compile out iommufd only features
>     like nesting
>   - Shift code into arm-smmu-v3-iommufd.c
>   - Add missed IS_ERR check
>   - Add S2FWB to arm_smmu_get_ste_used()
>   - Fixup quirks checks
>   - Drop ARM_SMMU_FEAT_COHERENCY checks for S2FWB
>   - Limit S2FWB to S2 Nesting Parent domains "just in case"
> v2: https://patch.msgid.link/r/0-v2-621370057090+91fec-smmuv3_nesting_jgg@nvidia.com
>   - Revise commit messages
>   - Guard S2FWB support with ARM_SMMU_FEAT_COHERENCY, since it doesn't make
>     sense to use S2FWB to enforce coherency on inherently non-coherent hardware.
>   - Add missing IO_PGTABLE_QUIRK_ARM_S2FWB validation
>   - Include formal ACPIA commit for IORT built using
>     generate/linux/gen-patch.sh
>   - Use FEAT_NESTING to block creating a NESTING_PARENT
>   - Use an abort STE instead of non-valid if the user requests a non-valid
>     vSTE
>   - Consistently use 'nest_parent' for naming variables
>   - Use the right domain for arm_smmu_remove_master_domain() when it
>     removes the master
>   - Join bitfields together
>   - Drop arm_smmu_cache_invalidate_user patch, invalidation will
>     exclusively go via viommu
> v1: https://patch.msgid.link/r/0-v1-54e734311a7f+14f72-smmuv3_nesting_jgg@nvidia.com
> 
> Jason Gunthorpe (6):
>    vfio: Remove VFIO_TYPE1_NESTING_IOMMU
>    iommu/arm-smmu-v3: Report IOMMU_CAP_ENFORCE_CACHE_COHERENCY for CANWBS
>    iommu/arm-smmu-v3: Implement IOMMU_HWPT_ALLOC_NEST_PARENT
>    iommu/arm-smmu-v3: Expose the arm_smmu_attach interface
>    iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
>    iommu/arm-smmu-v3: Use S2FWB for NESTED domains
> 
> Nicolin Chen (3):
>    ACPICA: IORT: Update for revision E.f
>    ACPI/IORT: Support CANWBS memory access flag
>    iommu/arm-smmu-v3: Support IOMMU_GET_HW_INFO via struct
>      arm_smmu_hw_info
> 
>   drivers/acpi/arm64/iort.c                     |  13 ++
>   drivers/iommu/Kconfig                         |   9 +
>   drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
>   .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 204 ++++++++++++++++++
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 114 ++++++----
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  83 ++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c         |  16 --
>   drivers/iommu/io-pgtable-arm.c                |  27 ++-
>   drivers/iommu/iommu.c                         |  10 -
>   drivers/iommu/iommufd/vfio_compat.c           |   7 +-
>   drivers/vfio/vfio_iommu_type1.c               |  12 +-
>   include/acpi/actbl2.h                         |   3 +-
>   include/linux/io-pgtable.h                    |   2 +
>   include/linux/iommu.h                         |   5 +-
>   include/uapi/linux/iommufd.h                  |  55 +++++
>   include/uapi/linux/vfio.h                     |   2 +-
>   16 files changed, 465 insertions(+), 98 deletions(-)
>   create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> 
> 
> base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b

Apologies for the delay; quite a few spec bits to lookup, as well as some SMMU refresh-ing on my part.

Reviewed-by: Donald Dutile <ddutile@redhat.com>


