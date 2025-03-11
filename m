Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvImeUTisUVSvKKE9jbBc2Ri/CCqxNJ0ysQ4aBhcgm0=; b=BxAVY5hclLtLbYm6mdU9OIk0ZN
	lQwIbX0iO+5ztOpIjgEPyoMENvUQq3G12z6ES17SuhXLGAP1f2DVy6LpkwfzHSMrqjiTkCKuahAHT
	nXgiT12mwguMj4mdsxge/VfDQWJ5p89Lg/a0e+XJWXNG0aRKwbzuii1qwVpMSsm4jgqubINLJB/ZF
	YicwgfJyT92byvXuwKmhCrz1dWK4p6ALHSZkb0mNW4FEprgcLFEpn5yowjMS6fHAOK6vDaloY/i3O
	jIlNea7a92hIOx033Dfn0mMvU6JTEyppkLE+4DmnQ6Y0RIiXNaPcPknQwnNjlehz/4AZ/Onq1R25d
	zSj+FqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvmi-000000057p7-2vHq;
	Tue, 11 Mar 2025 09:20:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvcn-0000000567O-2x9V;
	Tue, 11 Mar 2025 09:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741684207;
	bh=vqL8sa49gU9UVaFn8ktWXDVz+26pYZ51n6lmZU+oOAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LEXpl5vV4ZCObZA7y7g0drM+QPwWxBzZ2DejXYihZH7lITw6C8dFkBnRvIK4VRXeY
	 hC82ZQo+i0xxlPi5xpazjZYs9uC++YDiJWKhodiqigqxRwgWdsWTX2X71NFOl8bS7g
	 /7YEU2V/5a3uNSNfc1vRakiQvJwgQYDSR9tIqapChf3FjBb31NNiEfZRrWxqr4CDlP
	 Qd9+T0aeYLK/Ao+3t/kQfwkbT86Fs3Nn8URGPUpC6KEknd5I91PjY3me/FTw/YG3Nu
	 XnRcZqzMMLu9bUZqWyPIDl6vzhIywYhdIwxDaaSMgT1zsxW37bvADvwNyY4EroirDc
	 6Qjmw6LBSP2Lg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 238F217E087E;
	Tue, 11 Mar 2025 10:10:07 +0100 (CET)
Message-ID: <760e3112-0433-41ab-ab39-faaf0463fbe8@collabora.com>
Date: Tue, 11 Mar 2025 10:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-5-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250310195921.157511-5-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_021010_101582_563F6AF0 
X-CRM114-Status: GOOD (  37.76  )
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

Il 10/03/25 20:59, Ariel D'Alessandro ha scritto:
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> Address Extension", which in Linux we've called "mali_lpae".
> 
> This commit adds support for conditionally enabling AARCH64_4K page
> table format. To achieve that, a "GPU optional configurations" field was
> added to `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 132 +++++++++++++++++++--
>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
>   3 files changed, 169 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index cffcb0ac7c111..0385702aa43c7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
>   	GPU_PM_VREG_OFF,
>   };
>   
> +/**
> + * enum panfrost_gpu_config - GPU optional configurations
> + * @GPU_CONFIG_AARCH64_4K: Use AARCH64_4K page table format
> + */
> +enum panfrost_gpu_config {
> +	GPU_CONFIG_AARCH64_4K,
> +};
> +
>   struct panfrost_features {
>   	u16 id;
>   	u16 revision;
> @@ -95,6 +103,9 @@ struct panfrost_compatible {
>   
>   	/* Allowed PM features */
>   	u8 pm_features;
> +
> +	/* GPU features */
> +	u8 gpu_configs;
>   };
>   
>   struct panfrost_device {
> @@ -162,6 +173,11 @@ struct panfrost_mmu {
>   	int as;
>   	atomic_t as_count;
>   	struct list_head list;
> +	struct {
> +		u64 transtab;
> +		u64 memattr;
> +		u64 transcfg;
> +	} cfg;
>   };
>   
>   struct panfrost_engine_usage {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 31df3a96f89bd..4a9b8de2ff987 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -26,6 +26,48 @@
>   #define mmu_write(dev, reg, data) writel(data, dev->iomem + reg)
>   #define mmu_read(dev, reg) readl(dev->iomem + reg)
>   
> +static u64 mair_to_memattr(u64 mair, bool coherent)
> +{
> +	u64 memattr = 0;
> +	u32 i;
> +
> +	for (i = 0; i < 8; i++) {
> +		u8 in_attr = mair >> (8 * i), out_attr;
> +		u8 outer = in_attr >> 4, inner = in_attr & 0xf;
> +
> +		/* For caching to be enabled, inner and outer caching policy
> +		 * have to be both write-back, if one of them is write-through
> +		 * or non-cacheable, we just choose non-cacheable. Device
> +		 * memory is also translated to non-cacheable.
> +		 */
> +		if (!(outer & 3) || !(outer & 4) || !(inner & 4)) {
> +			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_NC |
> +				   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER |
> +				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(false, false);
> +		} else {
> +			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_WB |
> +				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(inner & 1, inner & 2);
> +			/* Use SH_MIDGARD_INNER mode when device isn't coherent,
> +			 * so SH_IS, which is used when IOMMU_CACHE is set, maps
> +			 * to Mali's internal-shareable mode. As per the Mali
> +			 * Spec, inner and outer-shareable modes aren't allowed
> +			 * for WB memory when coherency is disabled.
> +			 * Use SH_CPU_INNER mode when coherency is enabled, so
> +			 * that SH_IS actually maps to the standard definition of
> +			 * inner-shareable.
> +			 */
> +			if (!coherent)
> +				out_attr |= AS_MEMATTR_AARCH64_SH_MIDGARD_INNER;
> +			else
> +				out_attr |= AS_MEMATTR_AARCH64_SH_CPU_INNER;
> +		}
> +
> +		memattr |= (u64)out_attr << (8 * i);
> +	}
> +
> +	return memattr;
> +}
> +
>   static int wait_ready(struct panfrost_device *pfdev, u32 as_nr)
>   {
>   	int ret;
> @@ -121,9 +163,57 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
>   	return ret;
>   }
>   
> +static void mmu_cfg_init_mali_lpae(struct panfrost_mmu *mmu)
> +{
> +	struct io_pgtable_cfg *pgtbl_cfg = &mmu->pgtbl_cfg;
> +
> +	/* TODO: The following fields are duplicated between the MMU and Page
> +	 * Table config structs. Ideally, should be kept in one place.
> +	 */
> +	mmu->cfg.transtab = pgtbl_cfg->arm_mali_lpae_cfg.transtab;
> +	mmu->cfg.memattr = pgtbl_cfg->arm_mali_lpae_cfg.memattr;
> +	mmu->cfg.transcfg = AS_TRANSCFG_ADRMODE_LEGACY;
> +}
> +
> +static void mmu_cfg_init_aarch64_4k(struct panfrost_mmu *mmu)
> +{
> +	struct io_pgtable_cfg *pgtbl_cfg = &mmu->pgtbl_cfg;
> +
> +	mmu->cfg.transtab = pgtbl_cfg->arm_lpae_s1_cfg.ttbr &
> +				AS_TRANSTAB_AARCH64_4K_ADDR_MASK;
> +
> +	mmu->cfg.memattr = mair_to_memattr(pgtbl_cfg->arm_lpae_s1_cfg.mair,
> +					   pgtbl_cfg->coherent_walk);
> +
> +	mmu->cfg.transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
> +			    AS_TRANSCFG_PTW_RA |
> +			    AS_TRANSCFG_ADRMODE_AARCH64_4K |
> +			    AS_TRANSCFG_INA_BITS(55 - pgtbl_cfg->ias);
> +	if (pgtbl_cfg->coherent_walk)
> +		mmu->cfg.transcfg |= AS_TRANSCFG_PTW_SH_OS;
> +}
> +
> +static void panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
> +				  enum io_pgtable_fmt fmt)
> +{
> +	struct panfrost_device *pfdev = mmu->pfdev;
> +
> +	switch (fmt) {
> +	case ARM_64_LPAE_S1:
> +		mmu_cfg_init_aarch64_4k(mmu);
> +		break;
> +	case ARM_MALI_LPAE:
> +		mmu_cfg_init_mali_lpae(mmu);
> +		break;
> +	default:

If you add a
		/* That should never happen */

...it's clear-er why this function doesn't fail (but still raises some eyebrows,
because if the `default` case is not reachable, why does it even have a print?).

> +		dev_WARN_ONCE(pfdev->dev, 1, "Unhandled page table format\n");
> +		break;
> +	}
> +}
> +
>   static void
>   _panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
> -			       u64 transtab, u64 memattr)
> +			       u64 transtab, u64 memattr, u64 transcfg)
>   {
>   	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
>   
> @@ -133,25 +223,28 @@ _panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
>   	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
>   	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>   
> +	mmu_write(pfdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
> +	mmu_write(pfdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
> +
>   	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
> +
> +	dev_dbg(pfdev->dev, "mmu_as_control: as=%d, transtab=0x%016llx, memattr=0x%016llx, transcfg=0x%016llx",
> +		as_nr, transtab, memattr, transcfg);
>   }
>   
>   static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>   {
> -	int as_nr = mmu->as;
> -	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
> -	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
> -	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
> -
>   	/* Need to revisit mem attrs.
>   	 * NC is the default, Mali driver is inner WT.
>   	 */
> -	_panfrost_mmu_as_control_write(pfdev, as_nr, transtab, memattr);
> +	_panfrost_mmu_as_control_write(pfdev, mmu->as, mmu->cfg.transtab,
> +				       mmu->cfg.memattr, mmu->cfg.transcfg);
>   }
>   
>   static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
>   {
> -	_panfrost_mmu_as_control_write(pfdev, as_nr, 0, 0);
> +	_panfrost_mmu_as_control_write(pfdev, as_nr, 0, 0,
> +				       AS_TRANSCFG_ADRMODE_UNMAPPED);
>   }
>   
>   u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
> @@ -616,6 +709,7 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>   {
>   	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
>   	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
> +	enum io_pgtable_fmt fmt = ARM_MALI_LPAE;

Double initialization! :-)

>   	struct panfrost_mmu *mmu;
>   
>   	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
> @@ -641,16 +735,28 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>   		.iommu_dev	= pfdev->dev,
>   	};
>   
> -	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
> -					      mmu);
> -	if (!mmu->pgtbl_ops) {
> -		kfree(mmu);
> -		return ERR_PTR(-EINVAL);
> +	if (pfdev->comp->gpu_configs & BIT(GPU_CONFIG_AARCH64_4K)) {

Why aren't you performing this check before kzalloc?

If you do so, you will be able to avoid having a goto, because this check will
simply return an error (struct not allocated yet, nothing to kfree).
This also means that you won't have to modify anything about the error handling
of the alloc_io_pgtable_ops below....

> +		if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
> +			dev_err_once(pfdev->dev,
> +				     "AARCH64_4K page table not supported\n");
> +			goto err_free_mmu;
> +		}
> +		fmt = ARM_64_LPAE_S1;
>   	}

} else {
	fmt = ARM_MALI_LPAE;
}

>   
> +	mmu->pgtbl_ops = alloc_io_pgtable_ops(fmt, &mmu->pgtbl_cfg, mmu);
> +	if (!mmu->pgtbl_ops)
> +		goto err_free_mmu;
> +
> +	panfrost_mmu_cfg_init(mmu, fmt);
> +
>   	kref_init(&mmu->refcount);
>   
>   	return mmu;
> +
> +err_free_mmu:
> +	kfree(mmu);
> +	return ERR_PTR(-EINVAL);
>   }
>   
>   static const char *access_type_name(struct panfrost_device *pfdev,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index b5f279a19a084..2b8f1617b8369 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -301,6 +301,17 @@
>   #define AS_TRANSTAB_HI(as)		(MMU_AS(as) + 0x04) /* (RW) Translation Table Base Address for address space n, high word */
>   #define AS_MEMATTR_LO(as)		(MMU_AS(as) + 0x08) /* (RW) Memory attributes for address space n, low word. */
>   #define AS_MEMATTR_HI(as)		(MMU_AS(as) + 0x0C) /* (RW) Memory attributes for address space n, high word. */
> +#define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
> +#define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
> +							 ((w) ? BIT(0) : 0) | \
> +							 ((r) ? BIT(1) : 0))
> +#define   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER		(0 << 4)
> +#define   AS_MEMATTR_AARCH64_SH_CPU_INNER		(1 << 4)
> +#define   AS_MEMATTR_AARCH64_SH_CPU_INNER_SHADER_COH	(2 << 4)
> +#define   AS_MEMATTR_AARCH64_SHARED			(0 << 6)
> +#define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
> +#define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
> +#define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
>   #define AS_LOCKADDR_LO(as)		(MMU_AS(as) + 0x10) /* (RW) Lock region address for address space n, low word */
>   #define AS_LOCKADDR_HI(as)		(MMU_AS(as) + 0x14) /* (RW) Lock region address for address space n, high word */
>   #define AS_COMMAND(as)			(MMU_AS(as) + 0x18) /* (WO) MMU command register for address space n */
> @@ -311,6 +322,24 @@
>   /* Additional Bifrost AS registers */
>   #define AS_TRANSCFG_LO(as)		(MMU_AS(as) + 0x30) /* (RW) Translation table configuration for address space n, low word */
>   #define AS_TRANSCFG_HI(as)		(MMU_AS(as) + 0x34) /* (RW) Translation table configuration for address space n, high word */
> +#define   AS_TRANSCFG_ADRMODE_LEGACY			(0 << 0)
> +#define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
> +#define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
> +#define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
> +#define   AS_TRANSCFG_ADRMODE_AARCH64_64K		(8 << 0)

"Anything" shifted in any direction by 0 is equal to the same "anything" :-)

Those are just 0,1,2,6,8

> +#define   AS_TRANSCFG_INA_BITS(x)			((x) << 6)
> +#define   AS_TRANSCFG_OUTA_BITS(x)			((x) << 14)
> +#define   AS_TRANSCFG_SL_CONCAT				BIT(22)
> +#define   AS_TRANSCFG_PTW_MEMATTR_NC			(1 << 24)

BIT(24)

> +#define   AS_TRANSCFG_PTW_MEMATTR_WB			(2 << 24)

BIT(25)

> +#define   AS_TRANSCFG_PTW_SH_NS				(0 << 28)

0

> +#define   AS_TRANSCFG_PTW_SH_OS				(2 << 28)

BIT(29)

> +#define   AS_TRANSCFG_PTW_SH_IS				(3 << 28)

GENMASK(29, 28) or BIT(28) | BIT(29)

(btw, rinse and repeat for the memattrs)

> +#define   AS_TRANSCFG_PTW_RA				BIT(30)
> +#define   AS_TRANSCFG_DISABLE_HIER_AP			BIT(33)
> +#define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
> +#define   AS_TRANSCFG_WXN				BIT(35)
> +#define   AS_TRANSCFG_XREADABLE				BIT(36)
>   #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */
>   #define AS_FAULTEXTRA_HI(as)		(MMU_AS(as) + 0x3C) /* (RO) Secondary fault address for address space n, high word */
>   
> @@ -326,6 +355,11 @@
>   #define AS_TRANSTAB_LPAE_READ_INNER		BIT(2)
>   #define AS_TRANSTAB_LPAE_SHARE_OUTER		BIT(4)
>   
> +/*
> + * Begin AARCH64_4K MMU TRANSTAB register values
> + */
> +#define AS_TRANSTAB_AARCH64_4K_ADDR_MASK	0xfffffffffffffff0
> +
>   #define AS_STATUS_AS_ACTIVE			0x01
>   
>   #define AS_FAULTSTATUS_ACCESS_TYPE_MASK		(0x3 << 8)


Cheers,
Angelo


