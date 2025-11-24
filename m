Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEF1CFD340
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAKEXc7Po5ZcQ8NHiJ/6YgIjS+LUifyXpnXyqV/E/2I=; b=vo3aCGDA6s3G5J
	nc0JLvHQdb3NIJ/UHDTxQSF3Ru5sjQeGDN6ffHObEUn48e3x8grseVao3QJUZeSPZmWVNKeu3r/RR
	sYGvZcpzMwrII/jnXmSKmr5wJghywmA4vrrvw4n5O0KZ0QmQHDbIQjNIVBk+4tOjxhMANj4kMZw9A
	yrcMPeqszbFmAPmWRgx1lMwEJlYQ+JTaztMkEkpsaNw9yqwN++wkU+xi1jCEtctbmTvGDaIgd1sav
	Dp77JrKnMa+I8bZ3pwSI7bEapK90EjM6qXLc1u8j5OPDyu86/xXAIyAGPdjeLpTyoxtMD0g10PuFh
	tl12A1RgcRTfvrChQvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbB8-0000000CAf2-3IBr;
	Mon, 24 Nov 2025 18:20:46 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbB4-0000000CAdN-0kPP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:20:45 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251124181116euoutp01077de0d815e55f1a1644a9e2c5c723b7~7A9Evvbfq2393423934euoutp01c
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 18:11:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251124181116euoutp01077de0d815e55f1a1644a9e2c5c723b7~7A9Evvbfq2393423934euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764007876;
	bh=mAKEXc7Po5ZcQ8NHiJ/6YgIjS+LUifyXpnXyqV/E/2I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=MoVOKuxNGqVDeVT0yIHn45anwe5rIfm5oBvd0Acai2JzB0E7TmmbJ5TsMrz6n/mHm
	 mHz0iuvdGe8j28YB5ykYU9GPrewVcVVX1gca64ezZGlspj2oz6wKr6cKC5Q8tbHRM+
	 w/9zfZjRlrVgXWZ1qf32pCj26qfg8HMxviOMO3uo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251124181115eucas1p194eb1fe47ad6b90c5e22bd8ed2e0bfbb~7A9EJtcS63164331643eucas1p1C;
	Mon, 24 Nov 2025 18:11:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251124181113eusmtip137fc2398eb412a7d397c6aee5961bac6~7A9Cu-DoB1470614706eusmtip1-;
	Mon, 24 Nov 2025 18:11:13 +0000 (GMT)
Message-ID: <f8a0b873-b93c-4a91-b47d-2d11bfcf36b4@samsung.com>
Date: Mon, 24 Nov 2025 19:11:13 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [RFC PATCH 5/5] dma-mapping: Allow batched DMA sync operations
 if supported by the arch
To: Barry Song <21cnbao@gmail.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251121232807.40491-1-21cnbao@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251124181115eucas1p194eb1fe47ad6b90c5e22bd8ed2e0bfbb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251121232820eucas1p13f5798a2d8c5049ae7cadc62cce63df7
X-EPHeader: CA
X-CMS-RootMailID: 20251121232820eucas1p13f5798a2d8c5049ae7cadc62cce63df7
References: <253c870f-770b-4102-be47-f8c06e9e6c31@samsung.com>
	<CGME20251121232820eucas1p13f5798a2d8c5049ae7cadc62cce63df7@eucas1p1.samsung.com>
	<20251121232807.40491-1-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_102043_637245_EC120FB8 
X-CRM114-Status: GOOD (  20.69  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 22.11.2025 00:28, Barry Song wrote:
> On Sat, Nov 22, 2025 at 12:09 AM Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> [...]
>> This version looks a bit better to me. Similar batching could be added
>> also to dma_iova_link()/dma_iova_sync() paths.
> Thanks, Marek. I will respin a new version. For dma_iova, I assume you meant
> something like the following?
>
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 7944a3af4545..7bb6ed663236 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1837,7 +1837,7 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
>   	int prot = dma_info_to_prot(dir, coherent, attrs);
>   
>   	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
> -		arch_sync_dma_for_device(phys, size, dir);
> +		arch_sync_dma_for_device_batch_add(phys, size, dir);
>   
>   	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
>   			prot, GFP_ATOMIC);
> @@ -1980,6 +1980,8 @@ int dma_iova_sync(struct device *dev, struct dma_iova_state *state,
>   	dma_addr_t addr = state->addr + offset;
>   	size_t iova_start_pad = iova_offset(iovad, addr);
>   
> +	if (!dev_is_dma_coherent(dev))
> +		arch_sync_dma_batch_flush();
>   	return iommu_sync_map(domain, addr - iova_start_pad,
>   		      iova_align(iovad, size + iova_start_pad));
>   }
>
> If so, I don't really have such hardware to test. I wonder if I can make it as
> patch 6/6 when respinning, and still mark it as RFC v2. Or should I leave it as
> is and expect someone with the hardware to test and send it?

Yes, I meant something like the above diff, also for dma_iova_unlink(). 
It can be an additional, 6th patch with RFC tag, assuming You have no 
way to test it.

Please notice that I've just sent a patch touching the similar code paths:

https://lore.kernel.org/all/20251124170955.3884351-1-m.szyprowski@samsung.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


