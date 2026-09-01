Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2428FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAsl/XQrs4VLbX74CG0t4ucPsDxZGFB9D3BoVTKBaao=; b=Qw6eugRCSxbmcnFsPdRm4YRCWy
	i4/t3JjrD/6POQRi7QiyChE32lrzFj0tczZqnjmoysGbRuOcIWhHSNvLBtHNj6TvgIV7FYIq9WhDB
	h10O/f2UH98qydMaX1JYwDjrDAyjwO0ArfC0wP2nh0ZvSnOJjrZcvUYROUhxxG5pQIQZfmqZ+PtMS
	w90McZXO4HTcLFqwGXNhtJIvhIIpuqfnDllP53TQLUSfieODGOteiGlUXu8uFP+IWq8RAwpI61qyj
	PVjnNZErxH7UG6mgpQJpSBMzq/ccecpvk+G6yG4wFOYoqu5JFw3RowfXxx/+fbnZJQq53ycEYEo/o
	xwFVTgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PcJ-0000000CMBS-0O1S;
	Tue, 01 Sep 2026 14:37:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PcE-0000000CMAc-1kTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:37:37 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260901143727euoutp0283f9565d48b8bddc335dfe9361d43cfe~ROTnhlRyp0534605346euoutp02t
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Sep 2026 14:37:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260901143727euoutp0283f9565d48b8bddc335dfe9361d43cfe~ROTnhlRyp0534605346euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788273447;
	bh=FAsl/XQrs4VLbX74CG0t4ucPsDxZGFB9D3BoVTKBaao=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sG+pyP5gX3vW7whpHoWG3DUp+gs63BbFNPdCwBhiXaBVaDb158qx2qDyKQC8kEcQH
	 jBJKBW1/MhjcMc4hBRPeppV5zLZ/85/0relSASg00s5VSBDdeYLiOS4bElWHm5AlC8
	 WnVtE8WisOrFH2bjR8psBk/vdjPwOlFlfqThYldI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260901143727eucas1p1a5f14449cb713b428091c1dfedd6fdf0~ROTnTiDnv0625906259eucas1p12;
	Tue,  1 Sep 2026 14:37:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260901143726eusmtip1f872eae2510fdcd32a78e8c61018cf78~ROTmfxHEn0405704057eusmtip1a;
	Tue,  1 Sep 2026 14:37:26 +0000 (GMT)
Message-ID: <1a6d4f12-edef-4faa-b2e0-2ea711fb6ad4@samsung.com>
Date: Tue, 1 Sep 2026 16:37:26 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] iommu/exynos: Initialize lock before requesting IRQ
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
	Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, KyongHo Cho <pullip.cho@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jianhao Xu
	<jianhao.xu@seu.edu.cn>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260901143727eucas1p1a5f14449cb713b428091c1dfedd6fdf0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260901130537eucas1p274a55745ced68a1e157bd43cfd17448f
X-EPHeader: CA
X-CMS-RootMailID: 20260901130537eucas1p274a55745ced68a1e157bd43cfd17448f
References: <CGME20260901130537eucas1p274a55745ced68a1e157bd43cfd17448f@eucas1p2.samsung.com>
	<20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073735_844560_5D659836 
X-CRM114-Status: GOOD (  19.69  )
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

On 01.09.2026 15:05, Runyu Xiao wrote:
> The SysMMU interrupt handler can run as soon as devm_request_irq() is
> called. Initialize the driver lock before registering the handler so an
> early interrupt cannot use an uninitialized lock.
>
> Fixes: 2a96536e77b4 ("iommu/exynos: Add iommu driver for EXYNOS Platforms")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> Assisted-by: Codex:GPT-5


Sorry, but this patch doesn't make much sense. There are other things that have
to be properly initialized before the interrupts can be handled. To ensure that
interrupt doesn't fire before handler has been registered one should enable
clocks and reset the hw:
        writel(CTRL_DISABLE, data->sfrbase + REG_MMU_CTRL);
        writel(0, data->sfrbase + REG_MMU_CFG);

> ---
>  drivers/iommu/exynos-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 874d05f4b..e9feb83b3 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -735,6 +735,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	spin_lock_init(&data->lock);
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	data->sfrbase = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(data->sfrbase))
> @@ -773,7 +775,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>  		return PTR_ERR(data->clk_master);
>  
>  	data->sysmmu = dev;
> -	spin_lock_init(&data->lock);
>  
>  	__sysmmu_get_version(data);
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


