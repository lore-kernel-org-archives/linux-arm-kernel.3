Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AECCC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs5wjiLWp1Vv9wwN6tQ6J5wJNudL5o7nEKHihQ5S7JU=; b=xtv2aBN5KLdNVPM9XR7O5o0C2x
	3l+yqcCaCKGNgjj4twe+Hj19XLgp291Xel6EVuDDqsvELMKjjrQsNDXNWs4y9PxTXt9Z5/IydjJTs
	OLj1UE+/UG9YV3anGnRkckDS0zgXuRyo1y5SnfDr4EbgUVADYz7HP1yChx1FVGfOoYPjJW2pCZGxF
	5b/xY+OtnFF3qn5470rhG000YhC/b43fwDtmi75fbeC3SpbjYcoTi9MXfCm0ZRzqXTaGX3gXwLKRP
	WoaA2iupMl5GBK8bYYLQplDJegNE+KPvul3ItCRO+VwjwilqlMGReMRK0fAXs0agqkkSVsT0E2zR/
	1Yd1Ym7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5UZ-0000000FoSq-3nJT;
	Wed, 15 Jul 2026 19:42:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5UW-0000000FoSM-3UzI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:42:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cab97c86bdso45ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784144519; x=1784749319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs5wjiLWp1Vv9wwN6tQ6J5wJNudL5o7nEKHihQ5S7JU=;
        b=wklt+wPiC/0K48x7Zzb8HjYAUvlZFSCZo0zqC4RpZD24WE4auG/1eMO8A3Z3lGKHZF
         08ncddVDvFgLywjbGvwMjNxTy443EBGkEeAMZ7oWQUPX4MxYon5PtWc8f9PMbKUaurfR
         fLzT7pmzkIUvxfFR9tzKEk/8mn2PMn0pRPlZFxF6ktEk31mmNK/CjLgdILLajgbvN4Vn
         vVnyHIgSv58QaOEczNypFvDjrBA4Dcp3VaV9cJYeprS17GfJVHmi4YmunXbyI0Na2s/f
         zjaszilzCmNWCdXij09rmVyrhkhMXpiwrcGoK9ixPSK+DIo4cx/AMd735QiGClcbyp81
         Qjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144519; x=1784749319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs5wjiLWp1Vv9wwN6tQ6J5wJNudL5o7nEKHihQ5S7JU=;
        b=J0FNcokktty4IV2oPkn43RKv+kwIoYnQDR1uCRrIpsCRDqoVGQ9dulMYIcEaG6W84b
         gHRgerfSbjUhzCDAQyH4k9u9e/rIRso1EuBOggXRQeM4PjYQ9yPcLSLpBXWyvJrCzSPW
         G5WMDyd+AY8NHqhoA0Tbq+XbIsIeA9Sy5Ep/933cj77jqUNE0m3eTmLaUX3YsQMTVcAq
         sqmwvsdrxZVcZr9HxTOT+Mc8ptyhF3R9aRmxtI9wJQOpX99USam5mBca2h6jJK4zgRto
         nC9Lhi3QgIBPTbpboQpfUWwEWjH4sAn5F3g0cu5LD+Q8gGhwzcH8rt5FR/zXEudHiflY
         ++1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrf2HEu/atE3XjL9EScGUc6bDTkbUdw3jEe7lgdqtU81w93zl2A72LOa3Gr1b8w6/q941NnsKuPUqz8LQysgstE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4lZSNdltItpkftLEyFgOeTLwFxs9WItsvwbFnOFHaqsDKko1Q
	IknervjYLvAJWRQo00JTqZZiL1FnjRoPqJlUnRTU4U6pXNDiDsCVwmPyjS/R9Gin3w==
X-Gm-Gg: AfdE7clipH2N1oYmGlmV3IBlnqTDjJVFPnpxAA0appMe//AiWEgyy9XrLc3KYB3yvz+
	shNTrzby4Qwvh7S2jKbF9/FGZtee5yXnPPr23Jc2oV22BOiDNGAOfT/6J5CONyZu8dtE8g3ICC6
	QCu1Atq+GnN8YIasbm65BCwKiuuqUAqjdBE53LoRrzcqYSyFgYM+2l7gSPDYXoHByLQ2ho2b7IP
	PqaJfKKe787D3cWG+4IB8N08n/5sd4fmiLGlicRhjhyomy4zWT5qoC4dzVzVC2YYnw/VrSEU0qy
	ZjTcDlBFdfLjnEkDZHUh+B0K3ODGl0VDp8ol4MjgjAD08F2T9mNXwPhTFJfd3LJAebRteEpd671
	hysIvqypNaoSw2hguNnQpW3OHgXXRpFFjuo6X5lPMUqqa7P8BOSj5Xy4QLbpcSZKND0k6x6otdm
	3Dh+z2lDe75MobVRa5YNkz71jRc+EAQeczEI0V7v2blBd1fqb7muMThbo5UA==
X-Received: by 2002:a17:903:468e:b0:2c6:99be:9dd with SMTP id d9443c01a7336-2cf1a3f3c26mr584525ad.12.1784144518335;
        Wed, 15 Jul 2026 12:41:58 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055f193sm7744695ad.46.2026.07.15.12.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:41:57 -0700 (PDT)
Date: Wed, 15 Jul 2026 19:41:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] iommu/arm-smmu-v3: Support IDR5.DS and widen the
 TLBI SCALE field
Message-ID: <alfifgOM_YwTAP0y@google.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <3f0c3e7b7e9177586d7e545d8089ead4ef7890f0.1784054606.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f0c3e7b7e9177586d7e545d8089ead4ef7890f0.1784054606.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_124200_909487_B43D91AA 
X-CRM114-Status: GOOD (  34.04  )
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

On Tue, Jul 14, 2026 at 11:48:47AM -0700, Nicolin Chen wrote:
> An SMMU implementing SMMU_IDR5.DS extends the range invalidation commands:
> the SCALE field grows a 6th bit, raising its maximum value from 31 to 39,
> and TTL == 0b01 becomes a valid level hint for a 16KB translation granule.
> 
> Add a new ARM_SMMU_FEAT_DS feature detecting the DS bit, and widen the
> CMDQ_TLBI_0_SCALE field to its architectural 6 bits. Mask the scale value
> explicitly in arm_smmu_cmdq_batch_add_range(), so the range invalidation
> path emits the same commands as before, keeping the pre-existing 5-bit
> truncation of a scale above 31.
> 
> Also list DS as a valid IDR5 field in the iommu_hw_info_arm_smmuv3 kdoc:
> iommufd has always reported the raw IDR5 register, so a VMM may conclude
> from that bit alone that it can expose DS to its guest.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Fixes: d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object")
> Cc: stable@vger.kernel.org # needed by the subsequent fix
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 4 +++-
>  include/uapi/linux/iommufd.h                | 4 ++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 +++++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index c909c9a88538b..3c59e62978a13 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -64,6 +64,7 @@ struct arm_vsmmu;
>  
>  #define ARM_SMMU_IDR5			0x14
>  #define IDR5_STALL_MAX			GENMASK(31, 16)
> +#define IDR5_DS				(1 << 7)
>  #define IDR5_GRAN64K			(1 << 6)
>  #define IDR5_GRAN16K			(1 << 5)
>  #define IDR5_GRAN4K			(1 << 4)
> @@ -415,7 +416,7 @@ struct arm_smmu_cmd {
>  
>  #define CMDQ_TLBI_0_NUM			GENMASK_ULL(16, 12)
>  #define CMDQ_TLBI_RANGE_NUM_MAX		31
> -#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(24, 20)
> +#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(25, 20)
>  #define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
>  #define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
>  #define CMDQ_TLBI_1_LEAF		(1UL << 0)
> @@ -921,6 +922,7 @@ struct arm_smmu_device {
>  #define ARM_SMMU_FEAT_HD		(1 << 22)
>  #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
>  #define ARM_SMMU_FEAT_BBML2		(1 << 24)
> +#define ARM_SMMU_FEAT_DS		(1 << 25)
>  	u32				features;
>  
>  #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 0425d452d41ed..72bb0e47dc272 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -594,7 +594,7 @@ struct iommu_hw_info_vtd {
>   * idr[0]: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN , CD2L, ASID16, TTF
>   * idr[1]: SIDSIZE, SSIDSIZE
>   * idr[3]: BBML, RIL
> - * idr[5]: VAX, GRAN64K, GRAN16K, GRAN4K
> + * idr[5]: VAX, GRAN64K, GRAN16K, GRAN4K, DS
>   *
>   * - S1P should be assumed to be true if a NESTED HWPT can be created
>   * - VFIO/iommufd only support platforms with COHACC, it should be assumed to be
> @@ -602,7 +602,7 @@ struct iommu_hw_info_vtd {
>   * - ATS is a per-device property. If the VMM describes any devices as ATS
>   *   capable in ACPI/DT it should set the corresponding idr.
>   *
> - * This list may expand in future (eg E0PD, AIE, PBHA, D128, DS etc). It is
> + * This list may expand in future (eg E0PD, AIE, PBHA, D128 etc). It is
>   * important that VMMs do not read bits outside the list to allow for
>   * compatibility with future kernels. Several features in the SMMUv3
>   * architecture are not currently supported by the kernel for nesting: HTTU,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a10affb483a4f..9f121f9f404ea 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2446,9 +2446,10 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  			/* Determine how many chunks of 2^scale size we have */
>  			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
>  
> +			/* Keep the pre-DS 5-bit truncation when scale > 31 */
>  			cmd->data[0] = orig_data0 |
>  				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
> -				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
> +				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);

Nit: Not sure what the convention is for these things, but this cap for
host is temporary as Jason's iommupt series expands the scale when DS=1.
I'm not sure if we should note a TODO here or just leave it be for now?

This is where Jason adds DS support for Host: 
https://lore.kernel.org/all/8-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com/

>  
>  			/* range is num * 2^scale * pgsize */
>  			inv_range = num << (scale + tg);
> @@ -5098,6 +5099,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	/* Maximum number of outstanding stalls */
>  	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
>  
> +	if (reg & IDR5_DS)
> +		smmu->features |= ARM_SMMU_FEAT_DS;
> +
>  	/* Page sizes */

Apart from that, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

