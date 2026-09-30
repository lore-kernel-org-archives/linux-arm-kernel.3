Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC85FCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blz14Kryy333MwsAfcVeWnCS/9nOHGV6aMGIkIjuVtM=; b=1EcytaRAUmygUzKXLP55KRypzk
	zkUN00VxROEU7WWddnEHBo5+JraoKlpJw2KOE4l6Rsjdz7ZdAf2AOwTF72IMYSj7+gvBgNEhSydp+
	xJd7VhLtSKqJVp27sWsZfJJRDjoyW9d/Uvgrmd3YsUSJ4X57m7hkXh1Emg1qaj+GDV1/y3L1R5Q1i
	yD0/68vqZYW8551SIoPZSLzhz2gLZI5VgN+1B2jw1yCm8jh9grUCzmyDjrHAq8zJzBE/rL8y7//Sy
	Z73lMfo9MKPpZngbMmR3zuCJ8E7Tkb1xq66KZTs+mlwUl8nUlx4H5dfeAhMdXCBKBCahZ92JR9+sZ
	4ruyvgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwNk-00000006Y60-114f;
	Wed, 30 Sep 2026 15:38:08 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwNg-00000006Y53-2kDO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:38:06 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e17363b97so162356466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790782683; x=1791387483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=blz14Kryy333MwsAfcVeWnCS/9nOHGV6aMGIkIjuVtM=;
        b=Spp5I9B5oiFCIanvaNjQpkC975FMIC4esGNgFMRbEkuD7/cAdEv6Eon2gUnnWkFGeC
         gn9NVKataJ2klL0ux2Yii0L3g/uX8ZOuSgJXCWaoKGDiGKAbkeDCTCZU1JuU5sztv/pp
         arcelFwkXtwnS5xNWDPQVDq2N8SYCBqvcle3eZ8jdNiH05DWDyek25t/k7rLwfgYWWe1
         0fSW+92hINL9hAlUoKdgTer5+G+HHGGpjAeih0xxzvsioQ+AhVEhbMYqlFZ8UppAggaF
         WBYeu6wCn4lnM6u90Bxg+7x2PpIXSKb6bo8TJIZ6OzRda63WqcbGAJmHNdkYVsavM/g5
         4Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782683; x=1791387483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blz14Kryy333MwsAfcVeWnCS/9nOHGV6aMGIkIjuVtM=;
        b=z6wG900EFXaVaNGbjCVo+Zj3BgDNXtmTckcTjIcH51kygO6JzGC50Bnw8I9V4dI03A
         /XswemEdOvGlx1cTwoh0AmcFAlxS71hVq/FVd5jAnoTD1SfDhsOxod52sK/1Won1VPRz
         AfZogrF/bZSzDiMSZ5udxzJQry/m+4yoXSsy6KEZ4L2+5lZDeSLZU7vaa0CNcGOTE7J4
         krRrFl0yHeCk6EXfoQv0Rsd86T1YmGoxGuLdp47nkarAhn3Tej9hGuKP4fnycld6L/X+
         5LiL6zaN4PeqRidaQ70+kElY3Lpo2+DwziynesmbwN5MuVMLKHMg6WjMwGS3e0PCar/0
         W3FA==
X-Forwarded-Encrypted: i=1; AKwUvBwq82lmEhNs1JHWRZ9j4dEGystl/CmdIrCL48Ov/e1AFo+l9L8DynIa8fVx1poF/64dm7/5jswp81L6cdcVs7xQ@lists.infradead.org
X-Gm-Message-State: AFuF++kSW+1WclP7zEpIErSZZqup0MDoPDxezF6/afcdFN143ALOLt1n
	075gpLyb19GREbsylJma8Cr7A5WirPfoVIqdHkQ3BKhHYWylsverLwHM
X-Gm-Gg: AYBFou1KOfR8tQeWw+SPpM81LBVN6ZqXACg/txiYQNrLOF1hY3MM3hpkfIroO9L8ac4
	4fM7FD+gEbcjrmepFmSz/LyDFgu+dper+y2QkZLlOS/ldBffeMtnCXqr+dgX4J1EcQYJVw3paoo
	rXyuN4Jvr7hPGLS4mW+PHt0v5lyugZmajaV/kPLfI1cV7R4+p6Enqh6KoIeUGZ1YJwU1s67jtsC
	A6/xUPKyYDRuJuVslgBFpFAr3HMBMYcUsu5G6AzotFd6oRvgzHfrhWJHO8n37id7Rs7PesS1WJr
	0XNBBFFGmRcPXSsAoy6r6AlYhFCIxJCVbz9Jlim9Cr2cQ3bgCj/YtvgqJy0QTlSlh1q64NZo8vi
	MAy7kkgDRkmc9CLrxKvlcmueXc1QImS/w2UfrWav0prTBDx6I3qNRO9mC7GuDngdegCqlq1JKzf
	HlpuVps3B8V9yde2KRZFGq97sPrYzGsgrQcjMx
X-Received: by 2002:a17:907:9628:b0:c26:24ed:39e5 with SMTP id a640c23a62f3a-c2e23cd72e3mr159226866b.18.1790782682624;
        Wed, 30 Sep 2026 08:38:02 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3eb32sm30808366b.3.2026.09.30.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:38:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 17:37:59 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v9 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Message-ID: <ar0s14p8KPgmDKmR@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-6-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-6-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083804_708277_11A3EC7E 
X-CRM114-Status: GOOD (  21.55  )
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

On Wed, Sep 23, 2026 at 02:28:27PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.
> 
> For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
> multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
> mapping spans, not HugeTLB hstate sizes.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..4053b1ec1902e 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
>  	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
>  	 * aligned in both virtual and physical space, then we can pte-map the
>  	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> +	 * capped below PMD_SIZE.
>  	 */
>  	if (max_page_shift < CONT_PTE_SHIFT)
>  		return PAGE_SIZE;
> @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
>  
> -	return CONT_PTE_SIZE;
> +	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
>
Capped below PMD_SIZE? It is half of PMD_SIZE. Where is that limitation
comes from? I think the commit message should be improved in that sense.

--
Uladzislau Rezki

