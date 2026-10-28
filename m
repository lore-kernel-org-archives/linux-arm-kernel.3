Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F7A60A2607
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/Loko77;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=a7d59F50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=535aXf9H9rC26a6zJhJ1r2DGySEkl3W8qtDu8csDPOg=; b=I/Loko77TkNBfw
	2M6EwFvpWQ/Acb4SgBB5ElKDqlNkqkMqw2eQBrbe7+j0KQmXqME5sWlA3MFGH4+rxuwUnXyH/ZvJX
	O8oPEGqfUMWvfEqXFv5ISboIJ3InKLCflo7GPI4Cts7nEiNPFV8j23EygxfDQqgIl2q8kU/BTIPf9
	jFZT8qHMccUIrr54K8HfgWCy1CSS/+gttsDVksWBG+U+PoD9VGC1+yb2Nr5ptaleuEI9EKhNj5t7l
	LeNF9vw0MsxJHZFchOqqySilR2P4GiXgTK/APh3Cd5BhSUSvMBLhi+ANU5vkQA9Mliep1PwVLbiLc
	BP0DeN+QtRmcqQvZ1XvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Bu-00000006gxK-3Xd8;
	Wed, 28 Oct 2026 09:43:30 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Br-00000006gwQ-3kT5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:43:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261028094322euoutp01cf1fbeda63b0f1310ef7ffd4a0d1316a~iqEHc3G2t1401214012euoutp01k
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:43:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261028094322euoutp01cf1fbeda63b0f1310ef7ffd4a0d1316a~iqEHc3G2t1401214012euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793180602;
	bh=535aXf9H9rC26a6zJhJ1r2DGySEkl3W8qtDu8csDPOg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=a7d59F50iU2RybF1FZVJqqGsE3wBZnUx83olzWf9UshxkFtBkMZrd0pWcCFJO28T1
	 y21F90VMdNgopBhMFS6MCvjzrzjfAW/IjeWOlktb3ToXTWBDwdco3WzX9hyNYuYEB9
	 KLBtztKS/jn9c4RuVm5YYsSPQ1xaeQi55awmhSMA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028094322eucas1p290e530066640b90b39ad9d5066c4e273~iqEHDwUBM1968019680eucas1p2Y;
	Wed, 28 Oct 2026 09:43:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261028094321eusmtip243f9cf93d775eb983c0129e973fe4e33~iqEGJK6bi1976119761eusmtip2D;
	Wed, 28 Oct 2026 09:43:21 +0000 (GMT)
Message-ID: <6b89446c-c1a7-42c2-a557-53059cef03a8@samsung.com>
Date: Wed, 28 Oct 2026 10:43:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: exynos4-is: fix DMA memory double free
To: Guangshuo Li <lgs201920130244@gmail.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Hans
	Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261027145313.136305-1-lgs201920130244@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261028094322eucas1p290e530066640b90b39ad9d5066c4e273
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261027145330eucas1p1b07eaac7858482b12d90a342fae36f2f
X-EPHeader: CA
X-CMS-RootMailID: 20261027145330eucas1p1b07eaac7858482b12d90a342fae36f2f
References: <CGME20261027145330eucas1p1b07eaac7858482b12d90a342fae36f2f@eucas1p1.samsung.com>
	<20261027145313.136305-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_024328_494601_C687C0F2 
X-CRM114-Status: GOOD (  20.52  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 15:53, Guangshuo Li wrote:
> fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
> DMA address does not satisfy the firmware alignment requirement,
> but leaves is->memory.vaddr non-NULL.
>
> Because firmware loading is asynchronous, this error path may run
> after probe has returned successfully. A later remove can then
> attempt to free the same DMA allocation again.
>
> Set is->memory.vaddr to NULL after freeing the buffer so the
> existing NULL check in fimc_is_free_cpu_memory() skips the
> already-freed allocation.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

but I would relax a bit the severity of this issue. I'm not sure if it
makes sense to bother stable team with it and I would add 'potential'
word to the subject. In practice this case would not happen.


> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index b7d9bfedd590..9fdc352abfe4 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -346,6 +346,7 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
>  			(u32)is->memory.addr);
>  		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
>  				  is->memory.addr);
> +		is->memory.vaddr = NULL;
>  		return -EIO;
>  	}
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


