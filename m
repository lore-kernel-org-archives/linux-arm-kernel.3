Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB4CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkkYyGsmFih3mOMQ8ZhH/aW+cAANlYqSZQRMbHiKPSQ=; b=GpotBX73JVWsDzlUukORwgeC8t
	tYJUyJPtguJzKDGXE+t8dgIBq0U/IKLEBNw3Bo95IXWCiezR+lAwMeRpyJoPQe3nBPhhsLRWTmXW4
	5+dmd+AmWLtrF/Nb+NTgNzrL+sSdZxnwMzUD1xIrDkYp9I3mFZJyGsbAM7kl2FGjRR1mbQY29gC7D
	s4t3enIB69otfV4J3kyMI+59zegDx2gGN1X+ovVHlnPoM5ZUH7nmcxDu80fDv4IuGyW7YtwgPZQbh
	opblNEgjDYk9Edg9Hmq+uMihkJjW9gYDaIcNrymG6kosmvMPcdqSHA9fCMWvxyCcRQtWw17rSZK4H
	nYJFIetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHL3-00000004iAP-1OS9;
	Sat, 16 Aug 2025 13:52:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHIS-00000004hyA-2AzN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 13:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8A0F44D55;
	Sat, 16 Aug 2025 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E59C4CEEF;
	Sat, 16 Aug 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755352210;
	bh=2v4gbRSAawP+if7/L/dsUf2MvnfiteitMG8BYb/Bz4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oEaU8+JXlRqI08A6N51HY37GbMGa0up12bjAi0MjLKIDO0ZMg1milYS+Gu9aiLsw9
	 TP7gK8WtewmroP0V7lHYlp6EEtuOyU4NGvDNvb/3VUhvaA5RSDrxflhBjEaiNvy/CR
	 aFYO4LhU6zy0P90LqeUztBilGfVVvOzP6jRxEqfHxsX3MEgGl/NCUe/NYrKEesc2aB
	 Kh+LXGqpsRIIwiG5TLjwp2JBmOaR8RoUj5PRnPfuAnDbu31mCrA+JCuaB06mgcCsLY
	 BE82JhWOfP/41Bny35ykULGBKy/rm8cRGKD/VGEsLlUWJgEKPNPwvZp4TOEMCUaawP
	 JBvG992Dl0jCg==
Message-ID: <c9440d31-add4-4c0f-ac2a-184e771ab455@kernel.org>
Date: Sat, 16 Aug 2025 15:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] iommu: apple-dart: Add 4-level page table support
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
 <20250814-apple-dart-4levels-v1-3-db2214a78c08@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250814-apple-dart-4levels-v1-3-db2214a78c08@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_065012_605108_548F6AD0 
X-CRM114-Status: GOOD (  23.13  )
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

On 14.08.25 10:40, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> The T8110 variant DART implementation on T602x SoCs indicates an IAS of
> 42, which requires an extra page table level. The extra level is
> optional, but let's implement it.
> 
> Since the driver failed at IO page table creation with 42-bit IAS add
> "apple,t6020-dart" as separate compatible using the T8110 HW data.

Is the commit description outdated? I don't see this change anywhere.

> 
> Later it might be useful to restrict this based on the actual attached
> devices, since most won't need that much address space anyway.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/iommu/apple-dart.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index e72a93e78e26ca61b233c83d439dbdfadf040fc6..bb48e8603d6c84bcf107294d851c2f2fc1273298 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -133,6 +133,7 @@
>   #define DART_T8110_TCR                  0x1000
>   #define DART_T8110_TCR_REMAP            GENMASK(11, 8)
>   #define DART_T8110_TCR_REMAP_EN         BIT(7)
> +#define DART_T8110_TCR_FOUR_LEVEL       BIT(3)
>   #define DART_T8110_TCR_BYPASS_DAPF      BIT(2)
>   #define DART_T8110_TCR_BYPASS_DART      BIT(1)
>   #define DART_T8110_TCR_TRANSLATE_ENABLE BIT(0)
> @@ -177,6 +178,7 @@ struct apple_dart_hw {
>   	u32 tcr_enabled;
>   	u32 tcr_disabled;
>   	u32 tcr_bypass;
> +	u32 tcr_4level;
>   
>   	u32 ttbr;
>   	u32 ttbr_valid;
> @@ -217,6 +219,7 @@ struct apple_dart {
>   	u32 pgsize;
>   	u32 num_streams;
>   	u32 supports_bypass : 1;
> +	u32 four_level : 1;
>   
>   	struct iommu_group *sid2group[DART_MAX_STREAMS];
>   	struct iommu_device iommu;
> @@ -305,13 +308,16 @@ static struct apple_dart_domain *to_dart_domain(struct iommu_domain *dom)
>   }
>   
>   static void
> -apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map)
> +apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map, int levels)
>   {
>   	struct apple_dart *dart = stream_map->dart;
>   	int sid;
>   
> +	WARN_ON(levels != 3 && levels != 4);
> +	WARN_ON(levels == 4 && !dart->four_level);
>   	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
> -		writel(dart->hw->tcr_enabled, dart->regs + DART_TCR(dart, sid));
> +		writel(dart->hw->tcr_enabled | (levels == 4 ? dart->hw->tcr_4level : 0),
> +		       dart->regs + DART_TCR(dart, sid));

This is a bit hard to read, I'd prefer an explicit
if (dart->hw->tcr_4level) here.

>   }
>   
>   static void apple_dart_hw_disable_dma(struct apple_dart_stream_map *stream_map)
> @@ -569,7 +575,8 @@ apple_dart_setup_translation(struct apple_dart_domain *domain,
>   	for (; i < stream_map->dart->hw->ttbr_count; ++i)
>   		apple_dart_hw_clear_ttbr(stream_map, i);
>   
> -	apple_dart_hw_enable_translation(stream_map);
> +	apple_dart_hw_enable_translation(stream_map,
> +					 pgtbl_cfg->apple_dart_cfg.n_levels);
>   	stream_map->dart->hw->invalidate_tlb(stream_map);
>   }
>   
> @@ -614,7 +621,7 @@ static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
>   	dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
>   	dart_domain->domain.geometry.aperture_start = 0;
>   	dart_domain->domain.geometry.aperture_end =
> -		(dma_addr_t)DMA_BIT_MASK(dart->ias);
> +		(dma_addr_t)DMA_BIT_MASK(pgtbl_cfg.ias);
>   	dart_domain->domain.geometry.force_aperture = true;
>   
>   	dart_domain->finalized = true;
> @@ -807,6 +814,8 @@ static int apple_dart_of_xlate(struct device *dev,
>   	if (cfg_dart) {
>   		if (cfg_dart->pgsize != dart->pgsize)
>   			return -EINVAL;
> +		if (cfg_dart->ias != dart->ias)
> +			return -EINVAL;
>   	}
>   
>   	cfg->supports_bypass &= dart->supports_bypass;
> @@ -1137,6 +1146,7 @@ static int apple_dart_probe(struct platform_device *pdev)
>   		dart->ias = FIELD_GET(DART_T8110_PARAMS3_VA_WIDTH, dart_params[2]);
>   		dart->oas = FIELD_GET(DART_T8110_PARAMS3_PA_WIDTH, dart_params[2]);
>   		dart->num_streams = FIELD_GET(DART_T8110_PARAMS4_NUM_SIDS, dart_params[3]);
> +		dart->four_level = dart->ias > 36;
>   		break;
>   	}
>   
> @@ -1169,9 +1179,9 @@ static int apple_dart_probe(struct platform_device *pdev)
>   
>   	dev_info(
>   		&pdev->dev,
> -		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d] initialized\n",
> +		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d, AS %d -> %d] initialized\n",
>   		dart->pgsize, dart->num_streams, dart->supports_bypass,
> -		dart->pgsize > PAGE_SIZE);
> +		dart->pgsize > PAGE_SIZE, dart->ias, dart->oas);
>   	return 0;
>   
>   err_sysfs_remove:
> @@ -1292,6 +1302,7 @@ static const struct apple_dart_hw apple_dart_hw_t8110 = {
>   	.tcr_enabled = DART_T8110_TCR_TRANSLATE_ENABLE,
>   	.tcr_disabled = 0,
>   	.tcr_bypass = DART_T8110_TCR_BYPASS_DAPF | DART_T8110_TCR_BYPASS_DART,
> +	.tcr_4level = DART_T8110_TCR_FOUR_LEVEL,
>   
>   	.ttbr = DART_T8110_TTBR,
>   	.ttbr_valid = DART_T8110_TTBR_VALID,
> 


