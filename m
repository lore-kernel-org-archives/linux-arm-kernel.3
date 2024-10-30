Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F554D6B6A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+b8KRc5zmIDoFCouEIsaDpmzreD1wdS/csixNpC9nU=; b=CcEHuZ+/fyzo8n6D+EelsIT/fb
	ia9Q7h5Xxyb+PM8ut6YVoh219+4JtWF05LrDlE5HhvLj90BgpF3YxV84KtLKBvcT+by4jdginytjM
	AkehtwbGmp19zZWHtplNBHfjgz7UN93P4cCBQlZwvAYagrfJ7g178HrMIihl1tMyiJEUczvWc7dxK
	geQZV2mjfqq7Ax1YZI28CkgmkaOL39onk6daqYodJTPRWZq0ZbvPPnbcCXvq0PU4678irAQjwXJnY
	dBs+CcALc5rvAyXmiyrvnGVeRuRtG/dMq2rNBaD+dgdA24sSTE8QMYcPzGzsxlDJ8fuMd9CnJfPhE
	Y2WcjNog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BdD-000000015Qv-2a5Y;
	Wed, 30 Oct 2024 16:33:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BZc-000000014tg-0B51
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:29:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso260065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730305770; x=1730910570; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+b8KRc5zmIDoFCouEIsaDpmzreD1wdS/csixNpC9nU=;
        b=hxg4ireU888d9a0usXMC0rbKbAjaUilAcrrikS6Oj8Kmx7sgTJvXjsWo9vZ6IHaRjG
         jMM9isZ7AX86xYGIyrWWC6V45sOrZ+XDBzgtmA+kUV/ViMtprnSBFVqjNjhsFkYFURur
         QCi4ECq6+DmcU05bKHvKzOOI1dSuSPYe9vmhXljIi5XJwugGDLgg6+SMU4+qZhVO0aE9
         HihO55e0HcgJmVVvucFxNC0sjXaDK9JH2WGdlA88TQd1x+d/mrnYmTH1jRszfJ13L+q1
         Yl62OfbuPRj1MlOLCNfMKJsuIgq3aSozVz56Wit52CizvzOSgwnMyhorYQTMDGrC9/ad
         AqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730305770; x=1730910570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+b8KRc5zmIDoFCouEIsaDpmzreD1wdS/csixNpC9nU=;
        b=WFDG8AsgQ+zoJ7yTdeBAy5ZTQ+qvErbvhNTnq3MY+aRrNt1tXBotJmRvPbIoxPN/BP
         wZKdSCdkNa41g1ZTkF3iAHoDuRqG1j+GHJd1+Qt5HKe9nJjtfHv7wwZahnqzIw0OoZSf
         elYesxdvVWkR9hA8YB2Ns94mCMnFOjWkbPMG0cjBUymgq5LhUQ7CupZdo0b48bT82JDs
         h56eM1gIqM7KzMnlc3mubMasKVGKUkfIAjAI50rejVCVKUtKQEbGpEYEHEev+ELRma7R
         XKjkyh3DsgkLnH9w9ceGAFIEC1dRTi5Gb5GMcpRguW6bjnrjAkI9TF4YzlpReno6cKw6
         E0og==
X-Forwarded-Encrypted: i=1; AJvYcCUeD0e5a1LEk4TuuTiteXvdYFe0Y+x9kTM+27UMYd/7e4AZx+6NdzjSMeZskrQwQaG9uaAZa0w3cHt1QRmb8O6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHR9M0ysDOeiR0bv8VZVcja7HbcE8x28IuZPlnI8uYjuMjmSJ
	lFE0DwBlrvUpwW+p/C0HsiINkhSuI24NrQ2AW6XcIDaNpvOcivajt4gXrwLv2g==
X-Gm-Gg: ASbGncuUNgBcfpq6Fw8E9X0lTH+mr/md880fCAXgsnoHM0bujqm6O57NsxGe/ZkbN2n
	FKqGMPVr3QYYEgp6BWxC7a4uwK5oWU9QJ+Fe261jyHWa3zDSxgbyPWjNX23JFmTgkXcdKc3u8I2
	uE9JImPb8ndxPe0kIQlBRhcuLIpFq5RfMbO3WlmG646h46/hl5KSYb0IIfEt/oFVUNRFp/Rss0P
	KSIeUl33ajcRXPbLVLczpd4ggOvPaHdvReT2XlsnAelmyJ41BHjAxtK4WN9L2o2Yao5PS6CMELX
	Y7e03i3hig==
X-Google-Smtp-Source: AGHT+IGdZE3KcqRXG596l1/z6mb5HgBOV8QBFXKlVU+7il4yIkzpxSGgNuKMW+f0EJ4DryrcypqYxA==
X-Received: by 2002:a05:600c:34d1:b0:426:7018:2e2f with SMTP id 5b1f17b1804b1-431b4a39c00mr10289735e9.5.1730305769736;
        Wed, 30 Oct 2024 09:29:29 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917fa7sm25675115e9.18.2024.10.30.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:29:28 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:29:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Hanjun Guo <guohanjun@huawei.com>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 8/9] iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
Message-ID: <ZyJe5M4_DHl37PTr@google.com>
References: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
 <8-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_092932_135439_A7C5170A 
X-CRM114-Status: GOOD (  41.66  )
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

Hi Jason,

On Wed, Oct 09, 2024 at 01:23:14PM -0300, Jason Gunthorpe wrote:
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
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 172 ++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  25 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  37 ++++
>  include/uapi/linux/iommufd.h                  |  20 ++
>  4 files changed, 250 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 3d2671031c9bb5..a9aa7514e65ce4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -29,3 +29,175 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
>  
>  	return info;
>  }
> +
> +static void arm_smmu_make_nested_cd_table_ste(
> +	struct arm_smmu_ste *target, struct arm_smmu_master *master,
> +	struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
> +{
> +	arm_smmu_make_s2_domain_ste(target, master, nested_domain->s2_parent,
> +				    ats_enabled);
> +
> +	target->data[0] = cpu_to_le64(STRTAB_STE_0_V |
> +				      FIELD_PREP(STRTAB_STE_0_CFG,
> +						 STRTAB_STE_0_CFG_NESTED));
> +	target->data[0] |= nested_domain->ste[0] &
> +			   ~cpu_to_le64(STRTAB_STE_0_CFG);
> +	target->data[1] |= nested_domain->ste[1];
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
> +	struct arm_smmu_ste *target, struct arm_smmu_master *master,
> +	struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
> +{
> +	unsigned int cfg =
> +		FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
> +
> +	/*
> +	 * Userspace can request a non-valid STE through the nesting interface.
> +	 * We relay that into an abort physical STE with the intention that
> +	 * C_BAD_STE for this SID can be generated to userspace.
> +	 */
> +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +		cfg = STRTAB_STE_0_CFG_ABORT;
> +
> +	switch (cfg) {
> +	case STRTAB_STE_0_CFG_S1_TRANS:
> +		arm_smmu_make_nested_cd_table_ste(target, master, nested_domain,
> +						  ats_enabled);
> +		break;
> +	case STRTAB_STE_0_CFG_BYPASS:
> +		arm_smmu_make_s2_domain_ste(
> +			target, master, nested_domain->s2_parent, ats_enabled);
> +		break;
> +	case STRTAB_STE_0_CFG_ABORT:
> +	default:
> +		arm_smmu_make_abort_ste(target);
> +		break;
> +	}
> +}
> +
> +static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
> +				      struct device *dev)
> +{
> +	struct arm_smmu_nested_domain *nested_domain =
> +		to_smmu_nested_domain(domain);
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	struct arm_smmu_attach_state state = {
> +		.master = master,
> +		.old_domain = iommu_get_domain_for_dev(dev),
> +		.ssid = IOMMU_NO_PASID,
> +		/* Currently invalidation of ATC is not supported */
> +		.disable_ats = true,
> +	};
> +	struct arm_smmu_ste ste;
> +	int ret;
> +
> +	if (nested_domain->s2_parent->smmu != master->smmu)
> +		return -EINVAL;
> +	if (arm_smmu_ssids_in_use(&master->cd_table))
> +		return -EBUSY;
> +
> +	mutex_lock(&arm_smmu_asid_lock);
> +	ret = arm_smmu_attach_prepare(&state, domain);
> +	if (ret) {
> +		mutex_unlock(&arm_smmu_asid_lock);
> +		return ret;
> +	}
> +
> +	arm_smmu_make_nested_domain_ste(&ste, master, nested_domain,
> +					state.ats_enabled);
> +	arm_smmu_install_ste_for_dev(master, &ste);
> +	arm_smmu_attach_commit(&state);
> +	mutex_unlock(&arm_smmu_asid_lock);
> +	return 0;
> +}
> +
> +static void arm_smmu_domain_nested_free(struct iommu_domain *domain)
> +{
> +	kfree(to_smmu_nested_domain(domain));
> +}
> +
> +static const struct iommu_domain_ops arm_smmu_nested_ops = {
> +	.attach_dev = arm_smmu_attach_dev_nested,
> +	.free = arm_smmu_domain_nested_free,
> +};
> +
> +static int arm_smmu_validate_vste(struct iommu_hwpt_arm_smmuv3 *arg)
> +{
> +	unsigned int cfg;
> +
> +	if (!(arg->ste[0] & cpu_to_le64(STRTAB_STE_0_V))) {
> +		memset(arg->ste, 0, sizeof(arg->ste));
> +		return 0;
> +	}
> +
> +	/* EIO is reserved for invalid STE data. */
> +	if ((arg->ste[0] & ~STRTAB_STE_0_NESTING_ALLOWED) ||
> +	    (arg->ste[1] & ~STRTAB_STE_1_NESTING_ALLOWED))
> +		return -EIO;
> +
> +	cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(arg->ste[0]));
> +	if (cfg != STRTAB_STE_0_CFG_ABORT && cfg != STRTAB_STE_0_CFG_BYPASS &&
> +	    cfg != STRTAB_STE_0_CFG_S1_TRANS)
> +		return -EIO;
> +	return 0;
> +}
> +
> +struct iommu_domain *
> +arm_smmu_domain_alloc_nesting(struct device *dev, u32 flags,
> +			      struct iommu_domain *parent,
> +			      const struct iommu_user_data *user_data)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	struct arm_smmu_nested_domain *nested_domain;
> +	struct arm_smmu_domain *smmu_parent;
> +	struct iommu_hwpt_arm_smmuv3 arg;
> +	int ret;
> +
> +	if (flags || !(master->smmu->features & ARM_SMMU_FEAT_NESTING))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	/*
> +	 * Must support some way to prevent the VM from bypassing the cache
> +	 * because VFIO currently does not do any cache maintenance.
> +	 */
> +	if (!arm_smmu_master_canwbs(master))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	/*
> +	 * The core code checks that parent was created with
> +	 * IOMMU_HWPT_ALLOC_NEST_PARENT
> +	 */
> +	smmu_parent = to_smmu_domain(parent);
> +	if (smmu_parent->smmu != master->smmu)
> +		return ERR_PTR(-EINVAL);
> +
> +	ret = iommu_copy_struct_from_user(&arg, user_data,
> +					  IOMMU_HWPT_DATA_ARM_SMMUV3, ste);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = arm_smmu_validate_vste(&arg);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	nested_domain = kzalloc(sizeof(*nested_domain), GFP_KERNEL_ACCOUNT);
> +	if (!nested_domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	nested_domain->domain.type = IOMMU_DOMAIN_NESTED;
> +	nested_domain->domain.ops = &arm_smmu_nested_ops;
> +	nested_domain->s2_parent = smmu_parent;
> +	nested_domain->ste[0] = arg.ste[0];
> +	nested_domain->ste[1] = arg.ste[1] & ~cpu_to_le64(STRTAB_STE_1_EATS);
> +
> +	return &nested_domain->domain;
> +}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b4b03206afbf48..eb401a4adfedc8 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -295,6 +295,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  	case CMDQ_OP_TLBI_NH_ASID:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>  		fallthrough;
> +	case CMDQ_OP_TLBI_NH_ALL:
>  	case CMDQ_OP_TLBI_S12_VMALL:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		break;
> @@ -2230,6 +2231,15 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
>  	}
>  	__arm_smmu_tlb_inv_range(&cmd, iova, size, granule, smmu_domain);
>  
> +	if (smmu_domain->nest_parent) {

Do we need a sync between the 2 invalidations to order them?

> +		/*
> +		 * When the S2 domain changes all the nested S1 ASIDs have to be
> +		 * flushed too.
> +		 */
> +		cmd.opcode = CMDQ_OP_TLBI_NH_ALL;
> +		arm_smmu_cmdq_issue_cmd_with_sync(smmu_domain->smmu, &cmd);
> +	}
> +
>  	/*
>  	 * Unfortunately, this can't be leaf-only since we may have
>  	 * zapped an entire table.
> @@ -2614,8 +2624,7 @@ static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>  
>  static struct arm_smmu_master_domain *
>  arm_smmu_find_master_domain(struct arm_smmu_domain *smmu_domain,
> -			    struct arm_smmu_master *master,
> -			    ioasid_t ssid)
> +			    struct arm_smmu_master *master, ioasid_t ssid)
>  {
>  	struct arm_smmu_master_domain *master_domain;
>  
> @@ -2644,6 +2653,8 @@ to_smmu_domain_devices(struct iommu_domain *domain)
>  	if ((domain->type & __IOMMU_DOMAIN_PAGING) ||
>  	    domain->type == IOMMU_DOMAIN_SVA)
>  		return to_smmu_domain(domain);
> +	if (domain->type == IOMMU_DOMAIN_NESTED)
> +		return to_smmu_nested_domain(domain)->s2_parent;
>  	return NULL;
>  }
>  
> @@ -2716,7 +2727,8 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  		 * enabled if we have arm_smmu_domain, those always have page
>  		 * tables.
>  		 */
> -		state->ats_enabled = arm_smmu_ats_supported(master);
> +		state->ats_enabled = !state->disable_ats &&
> +				     arm_smmu_ats_supported(master);
>  	}
>  
>  	if (smmu_domain) {
> @@ -3107,9 +3119,13 @@ arm_smmu_domain_alloc_user(struct device *dev, u32 flags,
>  	struct arm_smmu_domain *smmu_domain;
>  	int ret;
>  
> +	if (parent)
> +		return arm_smmu_domain_alloc_nesting(dev, flags, parent,
> +						     user_data);
> +
>  	if (flags & ~PAGING_FLAGS)
>  		return ERR_PTR(-EOPNOTSUPP);
> -	if (parent || user_data)
> +	if (user_data)
>  		return ERR_PTR(-EOPNOTSUPP);
>  
>  	smmu_domain = arm_smmu_domain_alloc();
> @@ -3122,6 +3138,7 @@ arm_smmu_domain_alloc_user(struct device *dev, u32 flags,
>  			goto err_free;
>  		}
>  		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> +		smmu_domain->nest_parent = true;
>  	}
>  
>  	smmu_domain->domain.type = IOMMU_DOMAIN_UNMANAGED;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index c9e5290e995a64..b5dbf5acbfc4db 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -243,6 +243,7 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
>  #define STRTAB_STE_0_CFG_BYPASS		4
>  #define STRTAB_STE_0_CFG_S1_TRANS	5
>  #define STRTAB_STE_0_CFG_S2_TRANS	6
> +#define STRTAB_STE_0_CFG_NESTED		7
>  
>  #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
>  #define STRTAB_STE_0_S1FMT_LINEAR	0
> @@ -294,6 +295,15 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
>  
>  #define STRTAB_STE_3_S2TTB_MASK		GENMASK_ULL(51, 4)
>  
> +/* These bits can be controlled by userspace for STRTAB_STE_0_CFG_NESTED */
> +#define STRTAB_STE_0_NESTING_ALLOWED                                         \
> +	cpu_to_le64(STRTAB_STE_0_V | STRTAB_STE_0_CFG | STRTAB_STE_0_S1FMT | \
> +		    STRTAB_STE_0_S1CTXPTR_MASK | STRTAB_STE_0_S1CDMAX)
> +#define STRTAB_STE_1_NESTING_ALLOWED                            \
> +	cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |   \
> +		    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |   \
> +		    STRTAB_STE_1_S1STALLD)
> +
>  /*
>   * Context descriptors.
>   *
> @@ -513,6 +523,7 @@ struct arm_smmu_cmdq_ent {
>  			};
>  		} cfgi;
>  
> +		#define CMDQ_OP_TLBI_NH_ALL     0x10
>  		#define CMDQ_OP_TLBI_NH_ASID	0x11
>  		#define CMDQ_OP_TLBI_NH_VA	0x12
>  		#define CMDQ_OP_TLBI_EL2_ALL	0x20
> @@ -814,10 +825,18 @@ struct arm_smmu_domain {
>  	struct list_head		devices;
>  	spinlock_t			devices_lock;
>  	bool				enforce_cache_coherency : 1;
> +	bool				nest_parent : 1;
>  
>  	struct mmu_notifier		mmu_notifier;
>  };
>  
> +struct arm_smmu_nested_domain {
> +	struct iommu_domain domain;
> +	struct arm_smmu_domain *s2_parent;
> +
> +	__le64 ste[2];
> +};
> +
>  /* The following are exposed for testing purposes. */
>  struct arm_smmu_entry_writer_ops;
>  struct arm_smmu_entry_writer {
> @@ -862,6 +881,12 @@ static inline struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>  	return container_of(dom, struct arm_smmu_domain, domain);
>  }
>  
> +static inline struct arm_smmu_nested_domain *
> +to_smmu_nested_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct arm_smmu_nested_domain, domain);
> +}
> +
>  extern struct xarray arm_smmu_asid_xa;
>  extern struct mutex arm_smmu_asid_lock;
>  
> @@ -908,6 +933,7 @@ struct arm_smmu_attach_state {
>  	struct iommu_domain *old_domain;
>  	struct arm_smmu_master *master;
>  	bool cd_needs_ats;
> +	bool disable_ats;
>  	ioasid_t ssid;
>  	/* Resulting state */
>  	bool ats_enabled;
> @@ -978,8 +1004,19 @@ tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
>  
>  #if IS_ENABLED(CONFIG_ARM_SMMU_V3_IOMMUFD)
>  void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type);
> +struct iommu_domain *
> +arm_smmu_domain_alloc_nesting(struct device *dev, u32 flags,
> +			      struct iommu_domain *parent,
> +			      const struct iommu_user_data *user_data);
>  #else
>  #define arm_smmu_hw_info NULL
> +static inline struct iommu_domain *
> +arm_smmu_domain_alloc_nesting(struct device *dev, u32 flags,
> +			      struct iommu_domain *parent,
> +			      const struct iommu_user_data *user_data)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
>  #endif /* CONFIG_ARM_SMMU_V3_IOMMUFD */
>  
>  #endif /* _ARM_SMMU_V3_H */
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index b5c94fecb94ca5..cd4920886ad05e 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -394,14 +394,34 @@ struct iommu_hwpt_vtd_s1 {
>  	__u32 __reserved;
>  };
>  
> +/**
> + * struct iommu_hwpt_arm_smmuv3 - ARM SMMUv3 Context Descriptor Table info
> + *                                (IOMMU_HWPT_DATA_ARM_SMMUV3)
> + *

That’s supposed to be stream table?

Thanks,
Mostafa

> + * @ste: The first two double words of the user space Stream Table Entry for
> + *       a user stage-1 Context Descriptor Table. Must be little-endian.
> + *       Allowed fields: (Refer to "5.2 Stream Table Entry" in SMMUv3 HW Spec)
> + *       - word-0: V, Cfg, S1Fmt, S1ContextPtr, S1CDMax
> + *       - word-1: S1DSS, S1CIR, S1COR, S1CSH, S1STALLD
> + *
> + * -EIO will be returned if @ste is not legal or contains any non-allowed field.
> + * Cfg can be used to select a S1, Bypass or Abort configuration. A Bypass
> + * nested domain will translate the same as the nesting parent.
> + */
> +struct iommu_hwpt_arm_smmuv3 {
> +	__aligned_le64 ste[2];
> +};
> +
>  /**
>   * enum iommu_hwpt_data_type - IOMMU HWPT Data Type
>   * @IOMMU_HWPT_DATA_NONE: no data
>   * @IOMMU_HWPT_DATA_VTD_S1: Intel VT-d stage-1 page table
> + * @IOMMU_HWPT_DATA_ARM_SMMUV3: ARM SMMUv3 Context Descriptor Table
>   */
>  enum iommu_hwpt_data_type {
>  	IOMMU_HWPT_DATA_NONE = 0,
>  	IOMMU_HWPT_DATA_VTD_S1 = 1,
> +	IOMMU_HWPT_DATA_ARM_SMMUV3 = 2,
>  };
>  
>  /**
> -- 
> 2.46.2
> 

