Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E79E68957
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCUVXtHK/IiMB+Oe4BWESMJU8Ob4rgGM97ZCX/sNfKI=; b=WNQY+dNlKuDkI0zSohuGaSlBBM
	m0wR/ZQW5sR8kwez+vvOkp2IGbDNxoLpJCOVsCrJZascPTw3H21S92mByJPMFfOAqqUl38DuzR3zo
	TV1NE8dFDojO/32UV+2TKUzAYGsDlGeAFozFW9aKmb0jw2x2zGxJ28zJ3Yf+Xjoy914f/eMb9PunM
	MZ67Gh9GXMDwHNVfUO8MKVp0OQZhd3DVVuTlm82nQEJ7kMvPT2Efa2FYfmchSuC2yeiIpHXmsu+Dm
	MD2fS5cYkuwmrfgUEXObZJobQyqoxZZINSIBtU7spEKM7Y+kAdihUhd5J2c+cb63wu3oWLXXrbtF+
	rtD31MeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OaJ-00000002g08-3WjA;
	Thu, 31 Oct 2024 06:23:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OYg-00000002fsl-03OI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 06:21:27 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f58c68c5so1018880e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 23:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730355683; x=1730960483; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCUVXtHK/IiMB+Oe4BWESMJU8Ob4rgGM97ZCX/sNfKI=;
        b=Cj0rMWTcv4LnMTxZ0es1xbECNJo/6VPnx6gwN6tAjYRutjur/IOBf6ozchkOzHMHeC
         OTAEWmBI+K8WItZVff1O96158zKW6xAbJduPzHd/1Q5bolnYpccdY/hNxsAc5SadBND3
         16eC3TeEP1+5LKDzCco+d6OaBsOe7+V/9El61I8vnu9UANKSglkmW7t3t/kGYTBu6+ky
         F/Li2WDHvJL9JbQJrUwECq9J82OIMs01Iqc+6E36wxWd4SwQtByXjTx6/Ur3bHQ/LbqK
         pT3n8Q9/TabN2jd1pZct6IxDLqQM/92XdlQd6tPmgkqbp2/M5nuBnOb2AZmOh7tZiUIF
         Xi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355683; x=1730960483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCUVXtHK/IiMB+Oe4BWESMJU8Ob4rgGM97ZCX/sNfKI=;
        b=b77UJQXN544gPZejWEh6vzvVR2RzQ5HA/1/TpmYO1KW2E1VW9iaDEO5169/2M/mgSR
         B2hArYroK0FdFdlWp6EdprIU21D/sF3a0ffScRsy0WIFzr12bZ69slYvd3xn5q8PWnmB
         9B9ZvSztW6vJdbqQVlWsmyhTJ2ppTsSGRfppr/RCVpx0oeeOLb/MViYBkPdTjjKF8cMT
         TYUuKRundRRXPaI5rfX8BXaKl7gYUuAY4+sZ5569ScXfF/4ZVFRcp0mO2OIhrKeErIRp
         ezS4Gz8jT1OqJaqyHlzZzi0iiIEhzJKPBwQReVjhvZ/brdgdniI6071t5MSRHulszHIL
         ZDtw==
X-Forwarded-Encrypted: i=1; AJvYcCXjHSa8GKEqnxY6kJpNYTjP+12dM8YarFq8N0CRJZGIuQi79LvY7LKbvwJXpD/V+NUzGA/fUOuqI759UEuSA35L@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxgg1IXzdkyj2lmeXxOTVrTujKVHYQ9i/DndTePh0RCm4eCbWQ
	3gMW6IGwVUcwGcgn0voYFqB+bXRvj6cD4ygXwevqdtESwGd6vz8MPNtw9Vg09O9OHlG5d6RqdL4
	37yG4ZPYLtPZGnLqCFo79DW1AoG8rHoo+D9NWbQ==
X-Google-Smtp-Source: AGHT+IH0g8oJXVs7VSlsOX60RHCa1G3irMHjbxsPtlD9vjSUFpsj7VgciJ4cq7Us8zzxRnsUwBQyyU+Qscm+a7G3kBw=
X-Received: by 2002:a05:6512:3053:b0:539:a4ef:6765 with SMTP id
 2adb3069b0e04-53b348ba142mr14459958e87.7.1730355683052; Wed, 30 Oct 2024
 23:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com> <9-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
In-Reply-To: <9-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Thu, 31 Oct 2024 14:21:11 +0800
Message-ID: <CABQgh9HoGFGDTEqziQt6WrJ7Bm9d-0c259PYsms3nOVEidn5BA@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Williamson <alex.williamson@redhat.com>, Donald Dutile <ddutile@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_232126_135186_DA133CA1 
X-CRM114-Status: GOOD (  34.80  )
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

On Thu, 31 Oct 2024 at 08:21, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> For SMMUv3 a IOMMU_DOMAIN_NESTED is composed of a S2 iommu_domain acting
> as the parent and a user provided STE fragment that defines the CD table
> and related data with addresses translated by the S2 iommu_domain.
>
> The kernel only permits userspace to control certain allowed bits of the
> STE that are safe for user/guest control.
>
> IOTLB maintenance is a bit subtle here, the S1 implicitly includes the S2
> translation, but there is no way of knowing which S1 entries refer to a
> range of S2.
>
> For the IOTLB we follow ARM's guidance and issue a CMDQ_OP_TLBI_NH_ALL to
> flush all ASIDs from the VMID after flushing the S2 on any change to the
> S2.
>
> The IOMMU_DOMAIN_NESTED can only be created from inside a VIOMMU as the
> invalidation path relies on the VIOMMU to translate virtual stream ID used
> in the invalidation commands for the CD table and ATS.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Reviewed-by: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 157 ++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  17 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  26 +++
>  include/uapi/linux/iommufd.h                  |  20 +++
>  4 files changed, 219 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 60dd9e90759571..0b9fffc5b2f09b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -30,7 +30,164 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
>         return info;
>  }
>
> +static void arm_smmu_make_nested_cd_table_ste(
> +       struct arm_smmu_ste *target, struct arm_smmu_master *master,
> +       struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
> +{
> +       arm_smmu_make_s2_domain_ste(
> +               target, master, nested_domain->vsmmu->s2_parent, ats_enabled);
> +
> +       target->data[0] = cpu_to_le64(STRTAB_STE_0_V |
> +                                     FIELD_PREP(STRTAB_STE_0_CFG,
> +                                                STRTAB_STE_0_CFG_NESTED));
> +       target->data[0] |= nested_domain->ste[0] &
> +                          ~cpu_to_le64(STRTAB_STE_0_CFG);
> +       target->data[1] |= nested_domain->ste[1];
> +}
> +
> +/*
> + * Create a physical STE from the virtual STE that userspace provided when it
> + * created the nested domain. Using the vSTE userspace can request:
> + * - Non-valid STE
> + * - Abort STE
> + * - Bypass STE (install the S2, no CD table)
> + * - CD table STE (install the S2 and the userspace CD table)
> + */
> +static void arm_smmu_make_nested_domain_ste(
> +       struct arm_smmu_ste *target, struct arm_smmu_master *master,
> +       struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
> +{
> +       unsigned int cfg =
> +               FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
> +
> +       /*
> +        * Userspace can request a non-valid STE through the nesting interface.
> +        * We relay that into an abort physical STE with the intention that
> +        * C_BAD_STE for this SID can be generated to userspace.
> +        */
> +       if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +               cfg = STRTAB_STE_0_CFG_ABORT;
> +
> +       switch (cfg) {
> +       case STRTAB_STE_0_CFG_S1_TRANS:
> +               arm_smmu_make_nested_cd_table_ste(target, master, nested_domain,
> +                                                 ats_enabled);
> +               break;
> +       case STRTAB_STE_0_CFG_BYPASS:
> +               arm_smmu_make_s2_domain_ste(target, master,
> +                                           nested_domain->vsmmu->s2_parent,
> +                                           ats_enabled);
> +               break;
> +       case STRTAB_STE_0_CFG_ABORT:
> +       default:
> +               arm_smmu_make_abort_ste(target);
> +               break;
> +       }
> +}
> +
> +static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
> +                                     struct device *dev)
> +{
> +       struct arm_smmu_nested_domain *nested_domain =
> +               to_smmu_nested_domain(domain);
> +       struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +       struct arm_smmu_attach_state state = {
> +               .master = master,
> +               .old_domain = iommu_get_domain_for_dev(dev),
> +               .ssid = IOMMU_NO_PASID,
> +               /* Currently invalidation of ATC is not supported */
> +               .disable_ats = true,
> +       };
> +       struct arm_smmu_ste ste;
> +       int ret;
> +
> +       if (nested_domain->vsmmu->smmu != master->smmu)
> +               return -EINVAL;
> +       if (arm_smmu_ssids_in_use(&master->cd_table))
> +               return -EBUSY;
> +
> +       mutex_lock(&arm_smmu_asid_lock);
> +       ret = arm_smmu_attach_prepare(&state, domain);
> +       if (ret) {
> +               mutex_unlock(&arm_smmu_asid_lock);
> +               return ret;
> +       }
> +
> +       arm_smmu_make_nested_domain_ste(&ste, master, nested_domain,
> +                                       state.ats_enabled);
> +       arm_smmu_install_ste_for_dev(master, &ste);
> +       arm_smmu_attach_commit(&state);
> +       mutex_unlock(&arm_smmu_asid_lock);
> +       return 0;
> +}
> +
> +static void arm_smmu_domain_nested_free(struct iommu_domain *domain)
> +{
> +       kfree(to_smmu_nested_domain(domain));
> +}
> +
> +static const struct iommu_domain_ops arm_smmu_nested_ops = {
> +       .attach_dev = arm_smmu_attach_dev_nested,
> +       .free = arm_smmu_domain_nested_free,
> +};
> +
> +static int arm_smmu_validate_vste(struct iommu_hwpt_arm_smmuv3 *arg)
> +{
> +       unsigned int cfg;
> +
> +       if (!(arg->ste[0] & cpu_to_le64(STRTAB_STE_0_V))) {
> +               memset(arg->ste, 0, sizeof(arg->ste));
> +               return 0;
> +       }
> +
> +       /* EIO is reserved for invalid STE data. */
> +       if ((arg->ste[0] & ~STRTAB_STE_0_NESTING_ALLOWED) ||
> +           (arg->ste[1] & ~STRTAB_STE_1_NESTING_ALLOWED))
> +               return -EIO;
> +
> +       cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(arg->ste[0]));
> +       if (cfg != STRTAB_STE_0_CFG_ABORT && cfg != STRTAB_STE_0_CFG_BYPASS &&
> +           cfg != STRTAB_STE_0_CFG_S1_TRANS)
> +               return -EIO;
> +       return 0;
> +}
> +
> +static struct iommu_domain *
> +arm_vsmmu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
> +                             const struct iommu_user_data *user_data)
> +{
> +       struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
> +       struct arm_smmu_nested_domain *nested_domain;
> +       struct iommu_hwpt_arm_smmuv3 arg;
> +       int ret;
> +
> +       if (flags)
> +               return ERR_PTR(-EOPNOTSUPP);

This check fails when using user page fault, with flags =
IOMMU_HWPT_FAULT_ID_VALID (4)
Strange, the check is not exist in last version?

iommufd_viommu_alloc_hwpt_nested ->
viommu->ops->alloc_domain_nested(viommu, flags, user_data) ->
arm_vsmmu_alloc_domain_nested


Thanks

