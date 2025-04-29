Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 22:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnNdE+HhwllnOl/nQBW5AcYsgv32dfnq2/SzhhfRlf8=; b=5CtXvt2D0odPjh12XthPcuGSgD
	bF5wXhNlv6BjDyDBwce1GixA/DwlHfQPZnivWXm6qm+eG4n/w40PV/Z2KvOdTbarqhOn8+N633zfj
	dg9iFaiYQYGBnJ+81tA1jEVyv/MD7cEDt3CRIw4hgq9XKoq2eGjRPiajOPMEqZI92YMSpX3/FdD9d
	nODacVidcWxdAKbhb8J5llhbCYFvVybY9tIOJVtM/0rZBH+VAwPMdlGyUBH7h6vgixcKMdB8dod/t
	S0zms6k+UXO50M34fAfg0V+42MI0auV4TTs4+vs1dynRbBHpMEdn0emscUck1d7rqGqcgY2aBypK1
	6NoqgBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9tZ9-0000000Azkx-2yWa;
	Tue, 29 Apr 2025 22:36:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9tV9-0000000AzHg-1tJW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 22:32:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2263428c8baso88085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745965951; x=1746570751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AnNdE+HhwllnOl/nQBW5AcYsgv32dfnq2/SzhhfRlf8=;
        b=wEAIIYCJpULKxYpvNRPWtBp67XctexXB0j7MPXl/MSdxEUdbd4DRbQxz8/7qWw3PV5
         5r8TxQBhJss9u9WP2lsEYL6I2qP6V3ZH9E8v8VL9uJDPQMFCjWMV1edjVf6VdtVgPDFv
         pZpV43/ARmzsIFdty2nyuaCRcfLhIup6TKALGPYNdqfpzDwTBS9JnJAedqjGHLKmZgSp
         VuxXemTrsfJBDzGZNP+B5k57GbU8st9OFIFdjql7RzoXza36nUw8/tXxV87NJuyQFTD3
         h6c7Tkf2uOdcNPt1QkWNfoVqI7YAVSiCIMzXCrShCUQkCqQlmuDVe2EW2cWE2iC5RxZZ
         XWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745965951; x=1746570751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnNdE+HhwllnOl/nQBW5AcYsgv32dfnq2/SzhhfRlf8=;
        b=KpoU+qVDHQtFw9tjALPcz5wpVUUIOUjqwUnWu0ObYMcIF4DvkZVezNdin8xTQ5TCYU
         bnzRCeJeESuIIPCfHBVCI+JDgWPffslVQ/NVtmXskHKn4+0+5xlDOlfShrEs/CNbOlxP
         NsdxTINivBCGBj9xGpzqUuf4k1rWLvYpR/ztiySPv77xjJPhX9QGUeAoeFVupI8ILsRU
         XH+GPpskOsHE/zB9g+e/hMOhS0WNH92xrFFGAZpBmQdbxkUImFMEVASAzW+9NCkKV+Ec
         FECpHxoTfBPLKs1JvOlAsZdWc8RorWK4x5ECyz/8do7nfN5BjYXCjUeNNqwBaQKDtPKS
         9O2w==
X-Forwarded-Encrypted: i=1; AJvYcCV5/rAqatdc5cpHYer8msmZqQRSo6cWp55gc7h40Q5lwnJkVpGaPAkxFRA1MfEv54VKRHGfwvuCWaZa6xdAOKWg@lists.infradead.org
X-Gm-Message-State: AOJu0YxOAUXmoYduMOetvlAehR3DQiaHD7U/0wnR8s7V224LvJlxictE
	ObHSks9bgvwG/w736vsprkuq4c0s4UFa7tdj1+itXdPeO1CUWBbzVTmtHXS4Dg==
X-Gm-Gg: ASbGncu3sWM7CYT3s22+yNS3tbWdeQ0/eMb9bXGKAc8aotYTIwPPdOHVVQ+MXyGRUFJ
	98zOQS8XllHiLD8gPa3sBD5Z5bwkiTPanOJXEuFgMzal6CnDWhVGrJdzjAbVuELR9P+Q2nZ1Y+B
	K/hxrvNOP62UcGZkBqfVwtJib1i0CMiFEL+/a8aHkoY/48fbeWjsRGyxfMF0jnxOkqZGhoa6Ws5
	2Mjw9VwIdPvQe2SjaMnB8cx9cEYu4iSClZjWaAJ/qP+CkK9/nLthk40oZzhCVHzFdA7hqB0jIkQ
	LPwkrV5KMJIp+L/KyUCGAA0qHgSOS53jQJMtgkQqGebrMSf6Hqd7DJq5h3msOz50fjsG/pqk
X-Google-Smtp-Source: AGHT+IEjjGwm4LgyP1atx5l0JHqL9FPxuMAodaX4BR9dLcCBJPPs8xL/z9odFgYaKsV2MBnWB05wdw==
X-Received: by 2002:a17:903:1a24:b0:223:4b4f:160c with SMTP id d9443c01a7336-22df5496af5mr477235ad.27.1745965950581;
        Tue, 29 Apr 2025 15:32:30 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7403991f046sm236228b3a.41.2025.04.29.15.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:32:30 -0700 (PDT)
Date: Tue, 29 Apr 2025 22:32:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 20/22] iommu/tegra241-cmdqv: Do not statically map
 LVCMDQs
Message-ID: <aBFTc1Q1r_jrnJ63@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <3981a819a4714b21d11d5c6de561a2d0c6411947.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3981a819a4714b21d11d5c6de561a2d0c6411947.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_153231_502967_BEA71E0F 
X-CRM114-Status: GOOD (  30.06  )
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

On Fri, Apr 25, 2025 at 10:58:15PM -0700, Nicolin Chen wrote:
> To simplify the mappings from global VCMDQs to VINTFs' LVCMDQs, the design
> chose to do static allocations and mappings in the global reset function.
> 
> However, with the user-owned VINTF support, it exposes a security concern:
> if user space VM only wants one LVCMDQ for a VINTF, statically mapping two
> LVCMDQs creates a hidden VCMDQ that user space could DoS attack by writing
> ramdon stuff to overwhelm the kernel with unhandleable IRQs.
> 

Nit: I think it's worth mentioning that the current HW only supports 2
LVCMDQs. Since it's not clear from the driver as it calculates this by:

        regval = readl_relaxed(REG_CMDQV(cmdqv, PARAM));
        cmdqv->num_vintfs = 1 << FIELD_GET(CMDQV_NUM_VINTF_LOG2,regval);
        cmdqv->num_vcmdqs = 1 << FIELD_GET(CMDQV_NUM_VCMDQ_LOG2, regval);
	cmdqv->num_lvcmdqs_per_vintf = cmdqv->num_vcmdqs / cmdqv->num_vintfs;

Or maybe, re-word it to "if user space VM only wants one LVCMDQ for a
VINTF, the current driver statically maps num_lvcmdqs_per_vintf which
creates hidden vCMDQs [..]"

> Thus, to support the user-owned VINTF feature, a LVCMDQ mapping has to be
> done dynamically.
> 
> HW allows pre-assigning global VCMDQs in the CMDQ_ALLOC registers, without
> finalizing the mappings by keeping CMDQV_CMDQ_ALLOCATED=0. So, add a pair
> of map/unmap helper that simply sets/clears that bit.
> 
> Delay the LVCMDQ mappings to tegra241_vintf_hw_init(), and the unmappings
> to tegra241_vintf_hw_deinit().
> 
> However, the dynamic LVCMDQ mapping/unmapping can complicate the timing of
> calling tegra241_vcmdq_hw_init/deinit(), which write LVCMDQ address space,
> i.e. requiring LVCMDQ to be mapped. Highlight that with a note to the top
> of either of them.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 8d418c131b1b..869c90b660c1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -351,6 +351,7 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
>  
>  /* HW Reset Functions */
>  
> +/* This function is for LVCMDQ, so @vcmdq must not be unmapped yet */
>  static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
>  {
>  	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
> @@ -379,6 +380,7 @@ static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
>  	dev_dbg(vcmdq->cmdqv->dev, "%sdeinited\n", h);
>  }
>  
> +/* This function is for LVCMDQ, so @vcmdq must be mapped prior */
>  static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
>  {
>  	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
> @@ -404,16 +406,42 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
>  	return 0;
>  }
>  
> +/* Unmap a global VCMDQ from the pre-assigned LVCMDQ */
> +static void tegra241_vcmdq_unmap_lvcmdq(struct tegra241_vcmdq *vcmdq)
> +{
> +	u32 regval = readl(REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
> +	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
> +
> +	writel(regval & ~CMDQV_CMDQ_ALLOCATED,
> +	       REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
> +	dev_dbg(vcmdq->cmdqv->dev, "%sunmapped\n", h);
> +}
> +
>  static void tegra241_vintf_hw_deinit(struct tegra241_vintf *vintf)
>  {
> -	u16 lidx;
> +	u16 lidx = vintf->cmdqv->num_lvcmdqs_per_vintf;
>  
> -	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
> -		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx])
> +	/* HW requires to unmap LVCMDQs in descending order */
> +	while (lidx--) {
> +		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx]) {
>  			tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
> +			tegra241_vcmdq_unmap_lvcmdq(vintf->lvcmdqs[lidx]);
> +		}
> +	}
>  	vintf_write_config(vintf, 0);
>  }
>  
> +/* Map a global VCMDQ to the pre-assigned LVCMDQ */
> +static void tegra241_vcmdq_map_lvcmdq(struct tegra241_vcmdq *vcmdq)
> +{
> +	u32 regval = readl(REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
> +	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
> +
> +	writel(regval | CMDQV_CMDQ_ALLOCATED,
> +	       REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
> +	dev_dbg(vcmdq->cmdqv->dev, "%smapped\n", h);
> +}
> +
>  static int tegra241_vintf_hw_init(struct tegra241_vintf *vintf, bool hyp_own)
>  {
>  	u32 regval;
> @@ -441,8 +469,10 @@ static int tegra241_vintf_hw_init(struct tegra241_vintf *vintf, bool hyp_own)
>  	 */
>  	vintf->hyp_own = !!(VINTF_HYP_OWN & readl(REG_VINTF(vintf, CONFIG)));
>  
> +	/* HW requires to map LVCMDQs in ascending order */
>  	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++) {
>  		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx]) {
> +			tegra241_vcmdq_map_lvcmdq(vintf->lvcmdqs[lidx]);
>  			ret = tegra241_vcmdq_hw_init(vintf->lvcmdqs[lidx]);
>  			if (ret) {
>  				tegra241_vintf_hw_deinit(vintf);
> @@ -476,7 +506,6 @@ static int tegra241_cmdqv_hw_reset(struct arm_smmu_device *smmu)
>  		for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
>  			regval  = FIELD_PREP(CMDQV_CMDQ_ALLOC_VINTF, idx);
>  			regval |= FIELD_PREP(CMDQV_CMDQ_ALLOC_LVCMDQ, lidx);
> -			regval |= CMDQV_CMDQ_ALLOCATED;
>  			writel_relaxed(regval,
>  				       REG_CMDQV(cmdqv, CMDQ_ALLOC(qidx++)));
>  		}

I can't confirm HW behaviour but the changes make sense to me.

Acked-by: Pranjal Shrivastava <praan@google.com>

Thanks!

> -- 
> 2.43.0
> 

