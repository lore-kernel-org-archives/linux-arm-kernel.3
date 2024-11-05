Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A25D31769
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL+qQ555sd3J8Tayj72H5VcXz9UTyPOsS+sx9WBwbPY=; b=0UOiXFD/VCtLKZBFgfu8QfjLFp
	ZRA/SAxRzq4bDsoOpUgoEAapuedH2BCJdkw6/gTTAgwhqdAv72nTONQqvum8nuw2CBNv2A1DiONC2
	yrdPQ8bjXNQR0BBPcwliO2F91C5Jp1LFjRXKxHqssrg0fBR6+pI6aW5s99EovHjdniUv8MlOsdMnQ
	Ak/r/ke7YeZfYfo2gm+Fx6jUZ12pluiDVlRjNiFmo+NvplMXC9mjkzFF9GvnLGE5FjtyXo0fj3ANN
	iS+lRmMwy6qgUBFqLj7ePV0LFnWWCB3IWz+bJaY0kDqfpSTJ0l4x5ShRTZejAieyyZiNKA+IVVklz
	3ZhwFaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NNx-00000000D2X-0ujl;
	Tue, 05 Nov 2024 17:30:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MuD-000000008bK-3cot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:59:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2166AA43645;
	Tue,  5 Nov 2024 16:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00F0C4CECF;
	Tue,  5 Nov 2024 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730825988;
	bh=dXzzyTpKChnv8xjtW59R25y4rKYjWCOZ+MrqN2ID5r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQdyGYYKJ2oarUM+0KYSzq1hEB6aeZPBgZeuW9VVMJzOR/EKO9TxKEzhv5PmyBYNR
	 VgL3g9nq50B150Qs+/DPD4muL4glTnulkDkF5fRtyYGUgbCrgDzzgvwf2M1oQtWqos
	 8XhS/tn0j0FSxbOZTEeukWve9yRXragWtcoKC3jdmZV/d9uPy2wg6EB1ydZz8U1Obe
	 gMOuoqK2XglFhGSdX86oRvYfnjGW+S5O8/5iZWNv9T+GqT2OHi8gXnMgTxKE/qgK8d
	 ffX4Y/+VFvIUiUOWk1L5Ky2G++HqpPdSXTcskbOg8BsY3SJMN2s/fZ1M3r32ugeKfU
	 qqmu4OUKrRZiQ==
Date: Tue, 5 Nov 2024 16:59:43 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Message-ID: <20241105165942.GB12923@willie-the-truck>
References: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <cf17dc41-f72a-4d90-a78d-2d90fa0ac243@arm.com>
 <20241104200951.GE10193@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104200951.GE10193@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_085949_999111_07B61A04 
X-CRM114-Status: GOOD (  12.35  )
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

On Mon, Nov 04, 2024 at 04:09:51PM -0400, Jason Gunthorpe wrote:
> Runs OK now:
> 
> arm-v7s io-pgtable: self test ok
> arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 32
> 
> Jason
> 
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -819,7 +819,7 @@ static int __init arm_v7s_do_selftests(void)
>  		.quirks = IO_PGTABLE_QUIRK_ARM_NS,
>  		.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>  	};
> -	unsigned int iova, size, iova_start;
> +	unsigned int iova, size;
>  	unsigned int i, loopnr = 0;
>  	size_t mapped;
>  
> @@ -871,25 +871,6 @@ static int __init arm_v7s_do_selftests(void)
>  		loopnr++;
>  	}
>  
> -	/* Partial unmap */
> -	i = 1;
> -	size = 1UL << __ffs(cfg.pgsize_bitmap);
> -	while (i < loopnr) {
> -		iova_start = i * SZ_16M;
> -		if (ops->unmap_pages(ops, iova_start + size, size, 1, NULL) != size)
> -			return __FAIL(ops);
> -
> -		/* Remap of partial unmap */
> -		if (ops->map_pages(ops, iova_start + size, size, size, 1,
> -				   IOMMU_READ, GFP_KERNEL, &mapped))
> -			return __FAIL(ops);
> -
> -		if (ops->iova_to_phys(ops, iova_start + size + 42)
> -		    != (size + 42))
> -			return __FAIL(ops);
> -		i++;
> -	}
> -
>  	/* Full unmap */
>  	iova = 0;
>  	for_each_set_bit(i, &cfg.pgsize_bitmap, BITS_PER_LONG) {

Yup, and you can do the same for the other selftest in io-pgtable-arm.c

Will

