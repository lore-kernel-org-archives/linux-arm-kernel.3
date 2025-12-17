Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD0D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PLCuMWygfjE9L1lzXFWDm0qVBpMn5rh+24N+CXz7TI=; b=2LJV5WuZARVmJxYv+J9oM/wweF
	4sKpJSLMmsSGiU+vB5rxDloWc7x62gxziSJsASTm/812eNtpp0a0iGCUcSJ266c+sBBdkJar4zSAa
	rk7ZSF8m1iAjYodUYRtEFFNXByjM/e6yui2+zTR8z5G4OjSqtL6qtGjDx5bhI6UB3VqrbRdN8Q/1f
	Qs8roQumRAeNWY9YHf0VLqa2jgXcG+cru5O25vSzB5hp2yaJOtTQwU2Ya1tjBRZ1aF9Ol3bL11SuZ
	ki1yyKiFXvnSJ1rJI0EMgPx1tAz02VWzU0VGZfZpfXkXMtzXAFD9jrj56Klzbk+Z5qoXQ/Oo0HLfm
	ME6Kl8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvCl-00000007Auu-28po;
	Wed, 17 Dec 2025 17:20:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvCi-00000007Atx-0qgl;
	Wed, 17 Dec 2025 17:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765992045;
	bh=Y9YEMqCOaRn9nWISRWIOagoTl21UEQ/DY+m2rBZ6YSk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=epK3AyeXUp2FZABNF07bFT7e0KVu4mytFWGi74liuJj6pEM7CDfl6PUxpMrnOZ9u6
	 AcN2YFicfI9kWfplIYbc2wDrzsMcX9XxAhMOlc+w7D8dNz8fhd7GmorSzsPCK52Pp+
	 Fis8zi+LW9j6qj/lQYZ8lJGVFXK2fCWd6zqxNyUCmO0JXHmBfdqsRI6ALj6N0s4jJM
	 lujKnpd7ojXxxE8q45cadWjnpWk92Bw5hUn3Iaqz13e2oEjIUT7R0iFDCMuaaMkuVA
	 ONrOae+/kZatf1hCJD9JV+YFAL1nbV5G/J1y2bkSdKZFxswpEAoEClyoQPKt2wAwRY
	 2/HXroMnpXX2g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C7FA17E127F;
	Wed, 17 Dec 2025 18:20:44 +0100 (CET)
Date: Wed, 17 Dec 2025 18:20:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I
 Wu <olvaffe@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/panthor: Implement reading shader_present from
 nvmem
Message-ID: <20251217182038.6779a191@fedora>
In-Reply-To: <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
	<20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_092048_388965_48CF9EF3 
X-CRM114-Status: GOOD (  24.69  )
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

On Wed, 17 Dec 2025 18:03:29 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> On some platforms, notably MediaTek MT8196, the shader_present bitmask
> in the Mali GPU register for it has cores enabled that may be faulty.
> The true shader_present bitmask is found in an efuse instead.
> 
> Implement reading shader_present from an nvmem cell if one is present,
> falling back to the Mali register if it's absent. The error codes are
> trickled up through to the probe function so that probe deferral works.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c | 63 ++++++++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 87ebb7ae42c4..eb44c8b108aa 100644
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
> @@ -109,7 +110,52 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  	return "(Unknown Mali GPU)";
>  }
>  
> -static void panthor_gpu_info_init(struct panthor_device *ptdev)
> +static int overload_shader_present(struct panthor_device *ptdev)
> +{
> +	struct device *dev = ptdev->base.dev;
> +	struct nvmem_cell *cell = nvmem_cell_get(dev, "shader-present");
> +	ssize_t len;
> +	void *buf;
> +	int ret;
> +
> +	if (IS_ERR(cell)) {
> +		/* On platforms without this cell, use the Mali register */
> +		if (PTR_ERR(cell) == -ENOENT)
> +			return 0;
> +
> +		return dev_err_probe(dev, PTR_ERR(cell),
> +				     "Failed to get shader-present nvmem cell\n");
> +	}
> +
> +	buf = nvmem_cell_read(cell, &len);
> +	if (IS_ERR(buf)) {
> +		ret = dev_err_probe(dev, PTR_ERR(buf),
> +				    "Failed to read shader-present nvmem cell\n");
> +		goto err_put_cell;
> +	}
> +
> +	if (!len || len > 8) {
> +		ret = dev_err_probe(dev, -EINVAL, "shader-present cell can't be length %ld\n",
> +				    len);
> +		goto err_free;
> +	}
> +
> +	memcpy(&ptdev->gpu_info.shader_present, buf, len);
> +
> +	kfree(buf);
> +	nvmem_cell_put(cell);
> +
> +	return 0;
> +
> +err_free:
> +	kfree(buf);
> +err_put_cell:
> +	nvmem_cell_put(cell);
> +
> +	return ret;
> +}
> +
> +static int panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
>  
> @@ -143,13 +189,18 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
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
> @@ -172,6 +223,8 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
>  		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
>  		 ptdev->gpu_info.tiler_present);
> +
> +	return 0;
>  }
>  
>  static int panthor_hw_bind_device(struct panthor_device *ptdev)
> @@ -218,7 +271,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> -	panthor_hw_info_init(ptdev);
> -
> -	return 0;
> +	return panthor_hw_info_init(ptdev);
>  }
> 


