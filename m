Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF45FF4958
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQECHjZYDeo+w0oCxyQjWJgtMtpqK8B8IJ/66Ffxmsw=; b=dAX+0zBTf7GrG1Ahwy3ffQDwEz
	tsryqT4myIE5h2Gvse3WH8yiI6o53m+HbXY6ZCArq5LLxjRFdLJyaDVjdZ5gHjDV5ZqdHDLeXXsqp
	2CtSE7oDd8+kP42YHnh+Zre3+dDJ1oA7t0m2iwlTDD3Fv+nCPjbSV1atMz/3MOQkYXqJfQH8mtD80
	QX+vZ2aYuqC0g6My7+bb3CW7nn+DmbkMDGqgawaY9//g72+XCV3cpmWdmLaNQCPt2r4hZ0uxoIPoN
	eMuifOukmzy6rawHLDTMDBnuZadqDFVgRATzyElXBKhEx6OJ56OxV3j+i78Swe8cVA/m9Y2Uo9kAU
	oYRpxLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Pq-0000000An96-2zaG;
	Mon, 30 Mar 2026 07:52:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Pp-0000000An8i-1EMG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 07:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=UQECHjZYDeo+w0oCxyQjWJgtMtpqK8B8IJ/66Ffxmsw=; b=e34NJyEeGxj9+vhYV3GSUWmyjR
	UgfXNFvfhtzJmxKbNDxLFVpbAlxfbvDBzSf9O89jaScMqNZuQw5D9lJPlMQxlJDUgo6zE5wI1Naj0
	sQ+FaMgc56mrBbbNqMQOd0FLBsTeYsoUHSNDXiLSS4KVMLYOfTKNyzNQN5Gke2dsmVlryC9IAViVv
	BMlcXj7xvKGpgCsPg/iX31uMARR2x2cO0YoPHthDhyGDJqkuoxBXMhqxg8tiyZ9mKhvOmJd7bIojx
	ENajq00/cdoC5WIdQu97fg1ReuukXbk1d1elLXgdf5cra8+Vw+Vu4F0tWmFhnTOIczcDQG+PcvDKC
	+sYXvG+Q==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Pg-0000000DFW5-0o1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:52:02 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260330075150euoutp0213ac245396dea7739cc90da202bf95e7~hjyNZdzd50699506995euoutp02z
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:51:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260330075150euoutp0213ac245396dea7739cc90da202bf95e7~hjyNZdzd50699506995euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774857110;
	bh=UQECHjZYDeo+w0oCxyQjWJgtMtpqK8B8IJ/66Ffxmsw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ALjpHACiV7sTvBQIdeYUxGEXlKt+hA0rN0o7wK20EJSsD+2iFob03KZGKB7/3rEHB
	 2SgtRRtMB+ewKbRXE4iBta05E+/eKKk3rnURg6OiDW5U87YLNo4qljqgXIJwrwfys3
	 GvgNoKPKsZLVDM9hYbBYWywQDSUWI5Ysv0NV7dGU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260330075149eucas1p24e986266fcbfc884498f3d8564c82df7~hjyM-3__V2163321633eucas1p2c;
	Mon, 30 Mar 2026 07:51:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260330075148eusmtip2b83cad2e8b7d79f67c0dd97f94f0cfab~hjyMOQal-0750207502eusmtip2s;
	Mon, 30 Mar 2026 07:51:48 +0000 (GMT)
Message-ID: <1de09a99-bf8b-41c2-9dfa-c280877b99ff@samsung.com>
Date: Mon, 30 Mar 2026 09:51:48 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] drm/exynos/dma: Drop iommu_dma_init_domain() stub
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260326093039.1152770-1-wenst@chromium.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260330075149eucas1p24e986266fcbfc884498f3d8564c82df7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260326093817eucas1p24174d4b0d25c7966172c08e305fa8882
X-EPHeader: CA
X-CMS-RootMailID: 20260326093817eucas1p24174d4b0d25c7966172c08e305fa8882
References: <CGME20260326093817eucas1p24174d4b0d25c7966172c08e305fa8882@eucas1p2.samsung.com>
	<20260326093039.1152770-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_085156_728838_03BC6BDC 
X-CRM114-Status: GOOD (  15.08  )
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

On 26.03.2026 10:30, Chen-Yu Tsai wrote:
> Commit 1feda5eb77fc ("drm/exynos: Use selected dma_dev default iommu
> domain instead of a fake one") removed the code around creating a
> custom IOMMU domain, but forgot to remove the stub.
>
> Remove the iommu_dma_init_domain() stub as the function is no longer
> referenced, and was also made private to the IOMMU DMA code.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 6a6761935224..ccc6b852ee7d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -23,10 +23,6 @@
>  #define to_dma_iommu_mapping(dev) NULL
>  #endif
>  
> -#if !defined(CONFIG_IOMMU_DMA)
> -#define iommu_dma_init_domain(...) ({ -EINVAL; })
> -#endif
> -
>  #define EXYNOS_DEV_ADDR_START	0x20000000
>  #define EXYNOS_DEV_ADDR_SIZE	0x40000000
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


