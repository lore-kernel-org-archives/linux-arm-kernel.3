Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3617CE674AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkIdtbm3vg4nodeqjiJwMSQ3Vk9rASnees/QYeheYTs=; b=iMvZ2Po1QgrzSASj6guYPBeDu2
	3fC+xPG1PdOKCtcCdCqW1rhWlN9HO962O+15xvCYZZUzNIIbRXGdOc0VDEmgUyIAPmtLuJ5vNrH2L
	7LzQwuGXK/PRLwUpghe1y/YPbKe9O3bKwhGId5EaAFtVbTexHkvPnaApO43Kpdq8RpIQ7YIP8oxFp
	OWdeOV5UMu8JbZqo4l/6qObTAsvMYoStGKb0e/OrHr6YHodF1HLl8jV1ecK7VZyI727Dnqz4S8slu
	VA/QpouxTkf88vdPcGv/w+3fKYiZlHV32k1T7dySI/YCe5xqQNJGfVvmliKGuR0xPJmc/VM0q4BaP
	D3tbLKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgBn-0000000DpfE-0Xbg;
	Mon, 22 Dec 2025 13:43:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgBi-0000000DpeI-46FS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 13:43:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCC661515
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 05:42:52 -0800 (PST)
Received: from [169.254.77.58] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A21B43F778
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 05:42:59 -0800 (PST)
Date: Mon, 22 Dec 2025 13:41:52 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/panthor: Implement reading shader_present
 from nvmem
Message-ID: <aUlKoHKb084vm_p-@e142607>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
 <20251220-mt8196-shader-present-v2-3-45b1ff1dfab0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251220-mt8196-shader-present-v2-3-45b1ff1dfab0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_054303_968505_8B035812 
X-CRM114-Status: GOOD (  23.33  )
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

On Sat, Dec 20, 2025 at 07:49:54PM +0100, Nicolas Frattaroli wrote:
> On some platforms, notably MediaTek MT8196, the shader_present bitmask
> in the Mali GPU register for it has cores enabled that may be faulty.
> The true shader_present bitmask is found in an efuse instead.
> 
> Implement reading shader_present from an nvmem cell if one is present,
> falling back to the Mali register if it's absent. The error codes are
> trickled up through to the probe function so that probe deferral works.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 87ebb7ae42c4..80c521784cd3 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  /* Copyright 2025 ARM Limited. All rights reserved. */
>  
> +#include <linux/nvmem-consumer.h>
>  #include <drm/drm_print.h>
>  
>  #include "panthor_device.h"
> @@ -109,7 +110,25 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  	return "(Unknown Mali GPU)";
>  }
>  
> -static void panthor_gpu_info_init(struct panthor_device *ptdev)
> +static int overload_shader_present(struct panthor_device *ptdev)
> +{
> +	u64 contents;
> +	int ret;
> +
> +	ret = nvmem_cell_read_variable_le_u64(ptdev->base.dev, "shader-present",
> +					      &contents);
> +	if (!ret)
> +		ptdev->gpu_info.shader_present = contents;
> +	else if (ret == -ENOENT)
> +		return 0;
> +	else
> +		return dev_err_probe(ptdev->base.dev, ret,
> +				     "Failed to read shader-present nvmem cell\n");
> +
> +	return 0;
> +}
> +
> +static int panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
>  
> @@ -143,13 +162,18 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
>  		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
>  	}
> +
> +	return overload_shader_present(ptdev);
>  }
>  
> -static void panthor_hw_info_init(struct panthor_device *ptdev)
> +static int panthor_hw_info_init(struct panthor_device *ptdev)
>  {
>  	u32 major, minor, status;
> +	int ret;
>  
> -	panthor_gpu_info_init(ptdev);
> +	ret = panthor_gpu_info_init(ptdev);
> +	if (ret)
> +		return ret;
>  
>  	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>  	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> @@ -172,6 +196,8 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
>  		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
>  		 ptdev->gpu_info.tiler_present);
> +
> +	return 0;
>  }
>  
>  static int panthor_hw_bind_device(struct panthor_device *ptdev)
> @@ -218,7 +244,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> -	panthor_hw_info_init(ptdev);
> -
> -	return 0;
> +	return panthor_hw_info_init(ptdev);
>  }
> 
> -- 
> 2.52.0
> 

