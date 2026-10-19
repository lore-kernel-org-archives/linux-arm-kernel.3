Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2051606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aj3OjdrC;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sng5j+Zz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDvlbAjqIKYcI5YtOv7UdDRsF0j2wGcohxG2sB0GTBM=; b=Aj3OjdrCzvfYjOQsdzX88a1IAs
	vhV5vk5YYsfids8yHSdzFwtQJgqW3KM48z61+ZgDLXOYk6/DmjwbPWbFY2em1BTsd54Zc5o/YI5Pb
	aa6e+oJZ6TNQ22FHoidZFUu9gSglXimN5HghKyEG/Fvb84UoJ010EMxIIQnJjX9dUbRWr9rk870ww
	XSBccgQJucVhEIsbLP7bs5ELUYH+AWqGGLQMi2af2VBrU9/dk2q6em0WHOEv4zZADqQNZGaolQ4I1
	q0V9xA3T9CYKM82by8vH23zr3osTAP8/NFwLCGpYRTQMYFqxSqf2JoNMfzDxScJR8iC2cAk/TwgBT
	Uf9qptHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqdl-000000082Yp-1oVL;
	Mon, 19 Oct 2026 16:55:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqdi-000000082YP-1UY7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:55:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C869204C;
	Mon, 19 Oct 2026 09:55:04 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD3273F673;
	Mon, 19 Oct 2026 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792428907; bh=g0MCRM90bHOY9xtPWztIDlp+2g+2cg4X+xov3AAv2Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sng5j+ZzFPDKIUj2toxn/TcsqEiuqIvvYLh9Yr5Pwf6ZrnfHiO9wuC1inCAEV3TpQ
	 p7pS065DFJmLupgiAFGyl3YkDf/3uNsTsKqraz3NzjmlCJeBovUBlLUAp/tmllNJd2
	 sXy+3vjJWuLa0jAC8Y7hKQgSL+h1opd/Ug5uqnsI=
Message-ID: <5173dbaa-2a49-420d-bf4e-97c9cc340bd9@arm.com>
Date: Mon, 19 Oct 2026 17:55:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] ARM: dma-mapping: Bypass the legacy path for
 core-owned DMA API domains
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20261016-b4-arm32-iommu-dma-cookie-v2-0-b06842a01938@nvidia.com>
 <20261016-b4-arm32-iommu-dma-cookie-v2-5-b06842a01938@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261016-b4-arm32-iommu-dma-cookie-v2-5-b06842a01938@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_095510_498687_49246018 
X-CRM114-Status: GOOD (  27.67  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 7:46 am, Mikko Perttunen wrote:
> ARM's arch_setup_dma_ops / arm_setup_iommu_dma_ops creates a custom
> IOMMU domain for DMA API usage, and continues to do so when the IOMMU
> driver doesn't explicitly request a DMA default domain type.
> 
> When, however, that DMA default domain is requested and the core owns
> the domain, we need to skip our own domain management. Add checks to
> arm_setup/teardown_iommu_dma_ops for these cases. In such a case IOVAs
> can be allocated from anywhere in the domain's geometry, so also add a
> check to ensure the device's dma-ranges cover it. Presently, this is the
> case for all platforms except some OMAP platforms with a non-zero
> dma-ranges base.

It's probably worth adding some cleverness to arm_iommu_detach_device() 
as well - it might work out benign to attempt to detach from a real 
core-owned default domain, but we'll now want to set dma_ops and 
to_dma_iommu_mapping according to the default domain itself (since we'll 
now have the possibility of switching between an explicit unmanaged 
dma_iommu_mapping and the implicit default one.)

Thanks,
Robin.

> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>   arch/arm/mm/dma-mapping.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index f2d3e8ec3487..d6315baeddb9 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1761,13 +1761,33 @@ EXPORT_SYMBOL_GPL(arm_iommu_detach_device);
>   
>   static void arm_setup_iommu_dma_ops(struct device *dev)
>   {
> -	struct dma_iommu_mapping *mapping;
> +	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
>   	u64 dma_base = 0, size = 1ULL << 32;
>   
>   	if (dev->dma_range_map) {
>   		dma_base = dma_range_map_min(dev->dma_range_map);
>   		size = dma_range_map_max(dev->dma_range_map) - dma_base;
>   	}
> +
> +	/*
> +	 * An existing cookie means the core owns the domain. Only set the
> +	 * per-binding DMA ops. IOVAs are allocated from the whole aperture,
> +	 * so the device's dma-ranges must cover it.
> +	 */
> +	if (mapping) {
> +		const struct iommu_domain_geometry *geo =
> +			&mapping->domain->geometry;
> +
> +		if (dma_base > geo->aperture_start ||
> +		    dma_base + size < geo->aperture_end) {
> +			dev_err(dev, "dma-ranges do not cover the IOMMU aperture\n");
> +			return;
> +		}
> +
> +		set_dma_ops(dev, &iommu_ops);
> +		return;
> +	}
> +
>   	mapping = arm_iommu_create_mapping(dev, dma_base, size);
>   	if (IS_ERR(mapping)) {
>   		pr_warn("Failed to create %llu-byte IOMMU mapping for device %s\n",
> @@ -1792,6 +1812,9 @@ static void arm_teardown_iommu_dma_ops(struct device *dev)
>   	if (!mapping)
>   		return;
>   
> +	if (!mapping->owns_domain)
> +		return;
> +
>   	arm_iommu_detach_device(dev);
>   	arm_iommu_release_mapping(mapping);
>   }
> 


