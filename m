Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998EFCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Med3hhOfkg/RvIlfsT/fOLVf/1vKUH87rV5RB+twrWw=; b=ytdRgH/5PyFtDOiI4/n9qrpOqA
	TgUD8Ax4yEa1TVK6dJSJWrzQddOFOYpQ9BuPNnWj2tfPNPbS5uwmX5e19iriH+BUyZeJcDwcERaOD
	2lLsVPKWIAxxBmhKYcK6tpxbaATCohSgOM332qNpk4peNIlKet28f2Va/uyYAVDLy5IV3V59JGOTj
	eTGkw9eAybwcVRD0FMo6u/RIA5shfhcuRV+0+s65QC1R9BP7UBKTX7huOeTM+l6+avv9cuZ7pQsro
	EVcaYcTutf+EoV6jRkTZap5ks9J3BLQ19d94VmltSdQ1Bw4hw0dquJK7dJpvVoVj5w3Sw8ifwkCWH
	zH1Vv2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G3C-00000002oTH-3DEW;
	Mon, 29 Sep 2025 15:44:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G39-00000002oSD-2YCy;
	Mon, 29 Sep 2025 15:44:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17EA1150C;
	Mon, 29 Sep 2025 08:44:15 -0700 (PDT)
Received: from [10.57.1.31] (unknown [10.57.1.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9429C3F59E;
	Mon, 29 Sep 2025 08:44:19 -0700 (PDT)
Message-ID: <2432db52-ed83-491c-81d7-f8c3e4b8bf20@arm.com>
Date: Mon, 29 Sep 2025 16:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panthor: add custom ASN_HASH support for
 mt8196
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250913002155.1163908-3-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250913002155.1163908-3-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_084427_718074_FE6F5FCB 
X-CRM114-Status: GOOD (  31.11  )
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

On 13/09/2025 01:21, Chia-I Wu wrote:
> Add panthor_soc_data to control custom ASN_HASH. Add compatible string
> for "mediatek,mt8196-mali" and enable custom ASN_HASH for the soc.
> 
> Without custom ASN_HASH, FW fails to boot
> 
>   panthor 48000000.gpu: [drm] *ERROR* Unhandled Page fault in AS0 at VA 0x0000000000000000
>   panthor 48000000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
>   panthor 48000000.gpu: probe with driver panthor failed with error -110
> 
> With custom ASN_HASH, panthor probes fine and userspace boots to ui just
> fine as well
> 
>   panthor 48000000.gpu: [drm] clock rate = 0
>   panthor 48000000.gpu: EM: created perf domain
>   panthor 48000000.gpu: [drm] Mali-G925-Immortalis id 0xd830 major 0x0 minor 0x1 status 0x5
>   panthor 48000000.gpu: [drm] Features: L2:0x8130306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
>   panthor 48000000.gpu: [drm] shader_present=0xee0077 l2_present=0x1 tiler_present=0x1
>   panthor 48000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
>   panthor 48000000.gpu: [drm] Firmware git sha: 27713280172c742d467a4b7d11180930094092ec
>   panthor 48000000.gpu: [drm] CSF FW using interface v3.13.0, Features 0x10 Instrumentation features 0x71
>   [drm] Initialized panthor 1.5.0 for 48000000.gpu on minor 1
> 
> Note that the clock and the regulator drivers are not upstreamed yet.
> They might as well take a different form when upstreamed.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> ---
> v2:
>  - remove CONFIG_DRM_PANTHOR_SOC_MT8196 and panthor_soc*.[ch]
>  - update commit message
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  2 ++
>  drivers/gpu/drm/panthor/panthor_device.h | 14 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  6 ++++++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 25 +++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_regs.h   |  4 ++++
>  5 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 81df49880bd87..c7033d82cef55 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -172,6 +172,8 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	struct page *p;
>  	int ret;
>  
> +	ptdev->soc_data = of_device_get_match_data(ptdev->base.dev);
> +
>  	init_completion(&ptdev->unplug.done);
>  	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
>  	if (ret)
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4fc7cf2aeed57..9f0649ecfc4fc 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -31,6 +31,17 @@ struct panthor_perfcnt;
>  struct panthor_vm;
>  struct panthor_vm_pool;
>  
> +/**
> + * struct panthor_soc_data - Panthor SoC Data
> + */
> +struct panthor_soc_data {
> +	/** @asn_hash_enable: True if GPU_L2_CONFIG_ASN_HASH_ENABLE must be set. */
> +	bool asn_hash_enable;
> +
> +	/** @asn_hash: ASN_HASH values when asn_hash_enable is true. */
> +	u32 asn_hash[3];
> +};
> +
>  /**
>   * enum panthor_device_pm_state - PM state
>   */
> @@ -93,6 +104,9 @@ struct panthor_device {
>  	/** @base: Base drm_device. */
>  	struct drm_device base;
>  
> +	/** @soc_data: Optional SoC data. */
> +	const struct panthor_soc_data *soc_data;
> +
>  	/** @phys_addr: Physical address of the iomem region. */
>  	phys_addr_t phys_addr;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index be962b1387f03..9dd90754865ac 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1682,7 +1682,13 @@ static struct attribute *panthor_attrs[] = {
>  
>  ATTRIBUTE_GROUPS(panthor);
>  
> +static const struct panthor_soc_data soc_data_mediatek_mt8196 = {
> +	.asn_hash_enable = true,
> +	.asn_hash = { 0xb, 0xe, 0x0, },
> +};
> +
>  static const struct of_device_id dt_match[] = {
> +	{ .compatible = "mediatek,mt8196-mali", .data = &soc_data_mediatek_mt8196, },
>  	{ .compatible = "rockchip,rk3588-mali" },
>  	{ .compatible = "arm,mali-valhall-csf" },
>  	{}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index db69449a5be09..9d98720ce03fd 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -52,6 +52,28 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
>  }
>  
> +static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
> +{
> +	const struct panthor_soc_data *data = ptdev->soc_data;
> +	u32 l2_config;
> +	u32 i;
> +
> +	if (!data || !data->asn_hash_enable)
> +		return;
> +
> +	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
> +		drm_err(&ptdev->base, "Custom ASN hash not supported by the device");
> +		return;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(data->asn_hash); i++)
> +		gpu_write(ptdev, GPU_ASN_HASH(i), data->asn_hash[i]);
> +
> +	l2_config = gpu_read(ptdev, GPU_L2_CONFIG);
> +	l2_config |= GPU_L2_CONFIG_ASN_HASH_ENABLE;
> +	gpu_write(ptdev, GPU_L2_CONFIG, l2_config);
> +}
> +
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	gpu_write(ptdev, GPU_INT_CLEAR, status);
> @@ -241,8 +263,9 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>  			      hweight64(ptdev->gpu_info.shader_present));
>  	}
>  
> -	/* Set the desired coherency mode before the power up of L2 */
> +	/* Set the desired coherency mode and L2 config before the power up of L2 */
>  	panthor_gpu_coherency_set(ptdev);
> +	panthor_gpu_l2_config_set(ptdev);
>  
>  	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 8bee76d01bf83..8fa69f33e911e 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -64,6 +64,8 @@
>  
>  #define GPU_FAULT_STATUS				0x3C
>  #define GPU_FAULT_ADDR					0x40
> +#define GPU_L2_CONFIG					0x48
> +#define   GPU_L2_CONFIG_ASN_HASH_ENABLE			BIT(24)
>  
>  #define GPU_PWR_KEY					0x50
>  #define  GPU_PWR_KEY_UNLOCK				0x2968A819
> @@ -110,6 +112,8 @@
>  
>  #define GPU_REVID					0x280
>  
> +#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
> +
>  #define GPU_COHERENCY_FEATURES				0x300
>  #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
>  


