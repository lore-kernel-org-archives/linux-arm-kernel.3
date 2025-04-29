Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DC2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFPfA40pbT05enuGxCOptOcw/bVkd7Xe9u7Il26H1xo=; b=SwTgKFLn+5q9v2pPbo7tb+tC2F
	49aDCW3pT348vESMjs6Dp+8Rxh9fqj51fgPDgLw0wyYkYwn4s5sP5d3c0KUKLeUi2J6HOTW/UFnyy
	VyoMXRGXZ3dskHNMC2kNSAFAQq7+ae/bri7s4X8GuWsVRAmCbPowhbo8xjXyEive03LCd+ILVkNoV
	9LEy++K4tKiQq4QDfdLyyyvok9OKbjHkuLhMYW99vzrcaO45W0iQM82kvh14kG9sQglF5tkI/38/K
	vLAYT/xOQPBo6TtK7q0fia/OxJf4z0+q+5XTTG9dDrneVE/u+iEFluyU7N5NKZ6M1phk8oR/MsMVI
	BRNQtGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kIh-00000009fml-0oOB;
	Tue, 29 Apr 2025 12:43:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kEj-00000009fNL-21Y0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:38:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFAA1515;
	Tue, 29 Apr 2025 05:38:47 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6D213F66E;
	Tue, 29 Apr 2025 05:38:52 -0700 (PDT)
Message-ID: <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
Date: Tue, 29 Apr 2025 13:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250428205619.227835-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_053857_632164_AADCA4C9 
X-CRM114-Status: GOOD (  25.97  )
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

On 28/04/2025 9:54 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping squence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
>   include/linux/io-pgtable.h     |  8 ++++++++
>   2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f27965caf6a1..99523505dac5 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>   		cptep = iopte_deref(pte, data);
>   	} else if (pte) {
>   		/* We require an unmap first */
> -		WARN_ON(!selftest_running);
> +		WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));

If we are going to have this as a general mechanism then the selftests 
should use it as well.

Thanks,
Robin.

>   		return -EEXIST;
>   	}
>   
> @@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>   	ptep += unmap_idx_start;
>   	pte = READ_ONCE(*ptep);
> -	if (WARN_ON(!pte))
> -		return 0;
> +	if (!pte) {
> +		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
> +		return -ENOENT;
> +	}
>   
>   	/* If the size matches this level, we're in the right place */
>   	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> @@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   		/* Find and handle non-leaf entries */
>   		for (i = 0; i < num_entries; i++) {
>   			pte = READ_ONCE(ptep[i]);
> -			if (WARN_ON(!pte))
> +			if (!pte) {
> +				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   				break;
> +			}
>   
>   			if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
> @@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>   			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>   			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> -			    IO_PGTABLE_QUIRK_ARM_HD))
> +			    IO_PGTABLE_QUIRK_ARM_HD |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> @@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   	struct arm_lpae_io_pgtable *data;
>   	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
>   
> -	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> +	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index bba2a51c87d2..639b8f4fb87d 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
>   	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> +	 *
> +	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> +	 *	mappings, but silently return -EEXISTS.  Normally an attempt
> +	 *	to map over an existing mapping would indicate some sort of
> +	 *	kernel bug, which would justify the WARN_ON().  But for GPU
> +	 *	drivers, this could be under control of userspace.  Which
> +	 *	deserves an error return, but not to spam dmesg.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
> @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
>   	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
>   	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
> +	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;

