Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9210C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8EQx8IVt3QALvWk+jDMAZ6oPsNWYyeZjphB91jBNdc=; b=elQZZqk5orhksl7lAq+TObqiVD
	g+ZxyYx4KsLtRRWPsUyQqqHBdqOV8MQTtuFMiQkL0vWhfJJapYcTTOrV8pYAg7U+zHASkKy9xdq7x
	woeWrHPY2FMtrHUOc+NbNHvM3+DIsbmFQM/KUVAyTv7a/TArVLDBh2InUxkXKydZw17A1huuszvPc
	cNIuMJ+ziFI8qG5S4ugILucIIMrhFUiEsMwghlLIeRA8mvdQmUojE5scY/RS2jk4fdpbUyZLClmUK
	II18W+Mb+wMVXzr2N2xOzx/oMT6V5wAIaGp9DMBxEtKLIcshH+3jXP2NZ2SSkwKasqLwXcNI9fj/p
	G0qjjpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDAM-00000000CHY-22mZ;
	Mon, 31 Mar 2025 11:18:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzD7b-00000000C3g-2lp2;
	Mon, 31 Mar 2025 11:16:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC741F02;
	Mon, 31 Mar 2025 04:16:06 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C152A3F694;
	Mon, 31 Mar 2025 04:16:00 -0700 (PDT)
Message-ID: <867cca4f-7180-42e6-bb2a-9f73ad09e5e4@arm.com>
Date: Mon, 31 Mar 2025 12:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_041603_789033_11BC1C14 
X-CRM114-Status: GOOD (  15.92  )
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

On 24/03/2025 18:57, Ariel D'Alessandro wrote:
> Hi all,
> 
> This is a new iteration on Panfrost support for AARCH64_4K page table
> format. The main reason behind this patchset is that MediaTek MT8188 SoC
> (ARM Mali-G57 MC3 GPU) constantly faults due to the actual Panfrost cache
> configuration.
> 
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as Bifrost
> calls it) mode, a (modified) version of LPAE "Large Physical Address
> Extension", which in Linux we've called "mali_lpae".
> 
> This patchset adds support for conditionally enabling AARCH64_4K page table
> format. To achieve that, a "GPU optional quirks" field was added to
> `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> The patchset only enables the new format on Mediatek MT8188 and MT8192,
> which have been tested on a Mediatek Genio 700 EVK (MT8390) and Mediatek
> Genio 1200 EVK (MT8395) boards respectively.
> 
> Thanks!
> 
> Changes in v5:
> * Fixed drm_WARN() in panfrost_mmu_cfg_init().
> 
> Changes in v4:
> * Fixed panfrost_mmu_cfg_init() return value on warning.
> 
> Changes in v3:
> * Fixed error handling in panfrost_mmu_ctx_create().
> 
> Changes in v2:
> * Dropped panfrost_mmu_enable/disable unification.
> * Rename gpu_configs as gpu_quirks.
> * Added error handling on page table not properly aligned.
> * Enabled AARCH64_4K format on MediaTek MT8192 as well.
> * Minor fixes.
> 
> Changes in v1:
> * Added "Set IOMMU_CACHE flag" patch.
> * Replaced `panfrost_mmu->enable()` function pointer by `cfg` struct
> prepared during init time.
> * Made mali_lpae/aarch64_4k name more clear.
> * Added GPU_CONFIG_AARCH64_4K flag to enable AARCH64_4K page table
>   format.
> * Enabled AARCH64_4K mode only on mediatek-mt8188.
> 
> Ariel D'Alessandro (6):
>   drm/panfrost: Set IOMMU_CACHE flag
>   drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
>   drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
>     models
>   drm/panfrost: Add support for AARCH64_4K page table format
>   drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
>   drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
> 
>  drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c      |   2 +
>  drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c      | 150 +++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
>  5 files changed, 196 insertions(+), 11 deletions(-)
> 

This looks in good shape now, so unless anyone shouts I'll merge this to
drm-misc-next later today.

Thanks,
Steve


