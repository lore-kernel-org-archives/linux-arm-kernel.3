Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5B910F92E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGfD5RUo85f+4kW7EBlx3yRh1/KFzFoR81S/pihvcqU=; b=p6TawYUDtdeH4O/txV7U5gImyM
	+kK61JPvdjDtWVt6ZqENcCQ8RbQB75+xDKg88MVWdZHdOA9sl0LyLSf7Eyg2fVHmYqQHXtMhLRNN3
	f8XgYrlwxfcD9ZwLj9Y1oqrj7bqg4eXOJdj7201LIIufxuwT2Ej8AkcTgqmP11vEjvJhtSALccNr+
	J2G0+yckFLnuLe4aF9574CoLBDwJvmnuugbfV3IGUO4OBKOCq8ZmmQ+3ZEdWrNR9SxKSlal6z+PZT
	6RuWt8XD/skf33ryaXXkdm8E4SOZ/tnVeed8TO4VHjJlyPcSfL29NZLiykgz6/S4hNgdEOHNCoSyE
	lBZ7oaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7db0-0000000DP3e-2W77;
	Tue, 31 Mar 2026 18:13:46 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dax-0000000DP2y-3rsU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 18:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1774980821;
 bh=SGfD5RUo85f+4kW7EBlx3yRh1/KFzFoR81S/pihvcqU=;
 b=D4iEN0FCNLvSW0aIbf6ArfNUDd/vqBFfIm/HuK5AlDcLzyI85Es2F1uBgYJ5cYLi8BfLUC7Fx
 e/bgIxzRXtxaynWIabFc8rBCOZbaqUUVTdkbNZvoue0OfDg8cUhrXhHGyKMB41Mrb3jX8NM8diM
 gPkFTZl4CCXa0Fu63BOG5D4B7ENa7BWWeAz/X75+a0rhPypGLXa3JRaupe1I0E8ZAAvFImYpAZP
 tcd2zJlL4F7VZDzD7ajXnx6Jpcl13dDyScigAAR5OGKJR9NTOROC10I1Zil8o7W3SigaIzY2wTW
 jJBvKPQlAD+ot6o5YscrlbPd0VYw6SVrU3d86p7YJPcA==
X-Forward-Email-ID: 69cc0ecb650cf26cfd1ee59c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.64
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3cd63b3d-1c5e-4a11-856e-c4aeb5d97d55@kwiboo.se>
Date: Tue, 31 Mar 2026 20:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/rockchip: fix page table allocation flags for v2
 IOMMU
To: Midgy BALON <midgy971@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>,
 iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260331075010.1463-1-midgy971@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260331075010.1463-1-midgy971@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_111344_285100_99A08467 
X-CRM114-Status: GOOD (  23.88  )
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

Hi Midgy,

On 3/31/2026 9:50 AM, Midgy BALON wrote:
> commit 2a7e6400f72b ("iommu: rockchip: Allocate tables from all
> available memory for IOMMU v2") removed GFP_DMA32 from
> iommu_data_ops_v2, reasoning that RK356x and RK3588 IOMMU v2 hardware
> supports up to 40-bit physical addresses for page tables.  However, the
> RK3568 IOMMU page-table walker uses a 32-bit AXI bus: it cannot access
> physical addresses above 4 GB regardless of the address encoding range.
> 
> On boards with more than 4 GB of RAM (e.g. 8 GB LPDDR4X), removing
> GFP_DMA32 causes two distinct failure modes:
> 
> 1. Direct allocation above 4 GB: iommu_alloc_pages_sz() may return
>    memory above 0x100000000.  The hardware page-table walker issues a
>    bus error trying to dereference those addresses, causing an IOMMU
>    fault on the first DMA transaction.
> 
> 2. SWIOTLB bounce-buffer poisoning: without GFP_DMA32, page tables land
>    above the SWIOTLB window.  dma_map_single() with DMA_BIT_MASK(32)
>    then bounces them into a buffer below 4 GB.  rk_dte_get_page_table()
>    returns phys_to_virt() of the bounce buffer address; PTEs are written
>    there; the next dma_sync_single_for_device(DMA_TO_DEVICE) copies the
>    original (zero) data back over the bounce buffer, silently erasing the
>    freshly written PTEs.  The IOMMU faults because every PTE reads as zero.
> 
> Restore GFP_DMA32 (and DMA_BIT_MASK(32)) for iommu_data_ops_v2, which
> currently only serves "rockchip,rk3568-iommu" in mainline.
> 
> Tested on Radxa ROCK 3B (RK3568, 8 GB LPDDR4X):
>   - MobileNetV1 via RKNN: 5.8 ms/inference (IOMMU mode)
>   - YOLOv5s 640x640 via RKNN: ~57 ms/inference (IOMMU mode)
>   - No IOMMU faults, correct inference results
> 
> Fixes: 2a7e6400f72b ("iommu: rockchip: Allocate tables from all available memory for IOMMU v2")
> Cc: stable@vger.kernel.org
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 85f3667e797..8b45db29471 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1358,8 +1358,8 @@ static struct rk_iommu_ops iommu_data_ops_v2 = {
>  	.pt_address = &rk_dte_pt_address_v2,
>  	.mk_dtentries = &rk_mk_dte_v2,
>  	.mk_ptentries = &rk_mk_pte_v2,
> -	.dma_bit_mask = DMA_BIT_MASK(40),
> -	.gfp_flags = 0,
> +	.dma_bit_mask = DMA_BIT_MASK(32),
> +	.gfp_flags = GFP_DMA32,

This change is wrong because this struct describe the RK IOMMU v2 that
is capable of 40-bit addressing, used with e.g. RK3568 VOP2 MMU and MMUs
in other RK35xx SoCs.

What you have discovered is most likely that some IP blocks, e.g. NPU on
RK3568, is not capable of >32-bit addressing, and/or that such IP blocks
are still using IOMMU v1 blocks, or some variant with 32-bit limitation.

However, the RK IOMMU driver is currently not capable of supporting
different IOMMU revisions, if I recall correctly there may have been a
patch trying to address that already on ML.

Have you seen this issue with a variant of the rockit driver that add
support for RK3568 or a variant of the downstream rknpu driver forward
ported to mainline?

If your findings are correct it is likely that the NPU MMU needs to use
a different compatible, since rockchip,rk3568-iommu describe the IOMMUv2
that is capable of 40-bit addressing and is also used by other RK35xx
SoCs.

Regards,
Jonas

>  };
>  
>  static const struct of_device_id rk_iommu_dt_ids[] = {


