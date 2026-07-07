Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A119FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI4VI2nFCydVadLvdcGF/Adx5vSP/Wj8ppvly4Q/Dkc=; b=rFHvuluQ94bKA/jtNKhaihO+i8
	VSNzFF4PmYD64xN3FcVSX3EJyVgUM6nq+8f2fuPn8rqTKptHTNs5LIDl5B+mYDthxA0NfrrMix6yU
	iRLxzwbWWGXnr9bm3VYEpZtGSmPmnMJ/cU2ZrHnATOJknuRajdMHpw46d4xAcF6LMNCUNyjY2sDot
	sqNz0oXmX8Xu5EIJdzH/87H/x2LQ/SDNtZAVfoaxSElSh28VEjYy6Czp83GVQaXCbd5Rz76h8K3cA
	GTTxcXWSCJ3qbLijAGlD3tzE9X0xyAJMmb5R1w7flqELPM3ArD60WhS34VoI5WvyqmuALoTidqdPa
	umg1TKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3yp-0000000EqrK-49Rp;
	Tue, 07 Jul 2026 11:28:47 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3yl-0000000EqqP-031H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:28:46 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707112836euoutp020248fdcca3b5ee59780df6c3b944c589~--mvniiJD3186231862euoutp02k
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 11:28:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707112836euoutp020248fdcca3b5ee59780df6c3b944c589~--mvniiJD3186231862euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783423716;
	bh=SI4VI2nFCydVadLvdcGF/Adx5vSP/Wj8ppvly4Q/Dkc=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=FYg9tdXDCiYsUYTcfdO64yjzMun/T5O+Gc2slzu1eaZKMDXBS5txKjlTyi8ge5Y1O
	 2snm0m6gvIzfaWsDgB3dIYIjuhZSRAQfKynqKPQREydTXgEa0cYTmAx3Y+am1ICJaY
	 cXzKa9H0uWOQTOeiErlaaY8AKDDk50oEkc+TxkSU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707112836eucas1p10e18d4e73e9e5889a73201689a3d52f9~--mvdo1s72362623626eucas1p1q;
	Tue,  7 Jul 2026 11:28:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707112836eusmtip13d37f5d6a81cd18a61826e901afffc46~--mu4JGGg2687226872eusmtip1K;
	Tue,  7 Jul 2026 11:28:35 +0000 (GMT)
Message-ID: <202b7298-c912-4315-847a-d3380659a438@samsung.com>
Date: Tue, 7 Jul 2026 13:28:35 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] ARM: dma-mapping: Fix wrong free function in
 __iommu_alloc_simple() error path
To: lirongqing <lirongqing@baidu.com>, Russell King <linux@armlinux.org.uk>,
	Leon Romanovsky <leon@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Kees
	Cook <kees@kernel.org>, Douglas Anderson <dianders@chromium.org>, Gregory
	CLEMENT <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260626101151.2185-1-lirongqing@baidu.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260707112836eucas1p10e18d4e73e9e5889a73201689a3d52f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260626101218eucas1p1d36ebd988fbfe3812f588bbd753f4caf
X-EPHeader: CA
X-CMS-RootMailID: 20260626101218eucas1p1d36ebd988fbfe3812f588bbd753f4caf
References: <CGME20260626101218eucas1p1d36ebd988fbfe3812f588bbd753f4caf@eucas1p1.samsung.com>
	<20260626101151.2185-1-lirongqing@baidu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_042844_458113_7CEA3907 
X-CRM114-Status: GOOD (  20.97  )
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

On 26.06.2026 12:11, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>
> In __iommu_alloc_simple(), when IOMMU mapping creation fails, the error
> path unconditionally called __free_from_pool() regardless of the
> allocation path taken.
>
> For the COHERENT case, memory is allocated via __alloc_simple_buffer(),
> which does not use the atomic pool. Calling __free_from_pool() on such
> memory silently returns without freeing, causing a page memory leak.
>
> Fix this by matching the free function to the allocation path:
> - COHERENT: use __dma_free_buffer(virt_to_page(addr), size)
> - non-COHERENT: use __free_from_pool(addr, size)
>
> Fixes: 565068221b905 ("ARM: 8561/4: dma-mapping: Fix the coherent case when iommu is used")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>

Please upload Your patch to https://www.arm.linux.org.uk/developer/patches/


> ---
>  arch/arm/mm/dma-mapping.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index f9bc53b..55d3d3b 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1056,7 +1056,10 @@ static void *__iommu_alloc_simple(struct device *dev, size_t size, gfp_t gfp,
>  	return addr;
>  
>  err_mapping:
> -	__free_from_pool(addr, size);
> +	if (coherent_flag == COHERENT)
> +		__dma_free_buffer(virt_to_page(addr), size);
> +	else
> +		__free_from_pool(addr, size);
>  	return NULL;
>  }
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


