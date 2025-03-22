Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE49C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QIHF3NjHt3xn4pZK4qJww9kq+qlDqM7MmGL3/fOx8M=; b=0ir4OPsBDKNobcHmps3TQawL/i
	b9CYlyutzKw+YXWT02QLVgAoSUsgrcovnKcVRd7VL5XOQflinNtUVqLYYGiLpLnDy6glhsh7N33uu
	8Rtqf3rdKPdqsmAU4FUDPyMbsiSN0EPIN11gkagxc1ubzfsxLzGDoRShe630gefpbguB3bpY4xWmS
	712k3tJOTxe6S0veV3LVP1TSD9ex5JPN4awRIwnp2nDm1BmR8hs3nRxqwJucImvF4N1el/XztlvPd
	xEj9jQuvKLcz4NB6EJ01cStFO0+POMq8fShWGgSNw9evgANBsToIFzMaQuGEiUs/Z6Ea0ksxNpR1F
	vMl1+qrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw3eC-00000000BGt-2D5L;
	Sat, 22 Mar 2025 18:32:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw3cW-00000000B6n-1dYY;
	Sat, 22 Mar 2025 18:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742668224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JzTCSNHHLPywezjRAd1z0IvAt6354yVhCUSvK6SMMua83Q2ibwz/AcyaQNETiy47Zf0Z989t9hO3u5d5DaGjupRiEWzEfmu8u5qa04knfaq8QGCY1nm28LmP0QSpQjMMRTzN3lkoFUAii6W/popLm1G19v3LF0yvKyPaXcN/Gf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742668224; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7QIHF3NjHt3xn4pZK4qJww9kq+qlDqM7MmGL3/fOx8M=; 
	b=VRDPM/3DQZGeLqXtaJ5RTLrBUxZ5LQhKEycR0nP5bKxHPkxIAyRO1EwtuSGzXJhzsnw8L5/6PoaOejZ3am0YCAd0W7R7At5qlmULsKWhaptE3s7Q0b9SutQmmKWLqF2oAPmymm8DKMEb7LD8gL0F2yWT0hwLg/unifu9bKh+UwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742668224;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=7QIHF3NjHt3xn4pZK4qJww9kq+qlDqM7MmGL3/fOx8M=;
	b=BlTEPn2Q2kfEk9Jw+oEZMH5XEjKGoZBlRkTUy9MftNTykd1tQomiKTHqu6V+0srQ
	xYnnI3feVQ7sh3r0VyvjGsnYmpvuThjcilDzdEX/CrmX1MbpmvDKLGgvZvIZebLTNhx
	mNrpdsPgk5XKxiECWAofPTlKdMarv9ZEbLT01N+U=
Received: by mx.zohomail.com with SMTPS id 1742668222927774.9008803686191;
	Sat, 22 Mar 2025 11:30:22 -0700 (PDT)
Date: Sat, 22 Mar 2025 18:30:13 +0000
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 1/6] drm/panfrost: Set IOMMU_CACHE flag
Message-ID: <7qixyvz7ll7sk53vqys74kncf6advxcuctfymmve7msygekygg@vwxzowjwm5bz>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
 <20250317145245.910566-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317145245.910566-2-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_113056_481388_B8CFA434 
X-CRM114-Status: GOOD (  14.96  )
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

On 17.03.2025 11:52, Ariel D'Alessandro wrote:
> Panfrost does not support uncached mappings, so flag them properly. Also
> flag the pages that are mapped as response to a page fault as cached.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index b91019cd5acb1..9e6f198ef5c1b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -327,7 +327,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>  	struct sg_table *sgt;
> -	int prot = IOMMU_READ | IOMMU_WRITE;
> +	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
>
>  	if (WARN_ON(mapping->active))
>  		return 0;
> @@ -528,7 +528,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  		goto err_map;
>
>  	mmu_map_sg(pfdev, bomapping->mmu, addr,
> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> +		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
>
>  	bomapping->active = true;
>  	bo->heap_rss_size += SZ_2M;
> --
> 2.47.2


Adrian Larumbe

