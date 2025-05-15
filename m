Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2234C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipc7m+BQVl6X6vjTg4c6WgA8yzbue2jcMdUfgBBfHzY=; b=ri/juLfY6w0h/cBlCeL/Gju2FU
	FdC3YJENyeau3Tpl+ApnxcZ4Lv6aehZoHT1AtDGyZFuq/mPSVltITY8vz7CMUMU0rsoHBxo7AJiN+
	Mb2RFFpwZf/j6fiZ6lBnvc+17ayCXv3Wi5/UtkDbWClqZYGnnJUoWgf1MtLZtKwqcLv3ljoRYXnSt
	h3R+JZJT3gyyDxOAi9PeCQJZqGgP+dQYOESWokIoxzyIV8FIuIaOar2Ycpp2XAD3ifHIYm0oJRiXJ
	kXm/lea/L2Tx7KbPyiuXX/aV/oLp6eWHJI5ImdlxYKEPteLf/W6eekFeUt6gou+u7MTslJApxscro
	5FUMBM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbYL-00000001HLO-1g4k;
	Thu, 15 May 2025 16:35:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbWK-00000001H1f-14IR;
	Thu, 15 May 2025 16:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41760614BD;
	Thu, 15 May 2025 16:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD5EC4CEE7;
	Thu, 15 May 2025 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326799;
	bh=kKPojMJd9kqH6u8NArAZ+Lui+uo9ndwDNquYyy93G0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESjhprCJouXAhjQr0dZG6SyTXibttfDkEXUZ8Ep+z+gy7A2IEg74Pih3DzIhR92mQ
	 Wg1fRLZ7AahHltL5KOdUISnA+OaOb/NOKa//4TXRGsVv+rtItX6BET9OvhMNCVjW8U
	 De/WmZChNK1Me4d3LxDTawHPD0qDmGXiVYicOpf6dOYdfucJiAUxulmuYxUjdIzoNg
	 rv5OilXcNBVStDgu4CYEBWfv8QrLAI7K0VbMfOL+gk/FQ5MrHdl540MrndCpVvuVnX
	 7099wIC/Jq/PwBwkwpUYCjiluxA04ZhHxA2VwN2NdOyoYvtGtPBJorxsEY9l/w9orN
	 6Z7TkSd+Kro/w==
Date: Thu, 15 May 2025 17:33:07 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 0/7] Remove ops.pgsize_bitmap
Message-ID: <20250515163307.GA12396@willie-the-truck>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Apr 29, 2025 at 11:34:10AM -0300, Jason Gunthorpe wrote:
> Now that all drivers are using domain_alloc_paging() and dev is never
> NULL, we can have all drivers correctly set domain.pgsize_bitmap during
> their allocation function.
> 
> There are a few oddities that have accumulated here over past changes:
> 
>  - Some drivers always set domain.pgsize_bitmap during their
>    domain_alloc_paging() call but still provide a value in ops. This is dead
>    code, delete it.
> 
>  - Some drivers calculate a system global pgsize_bitmap in the ops, but
>    it is now trivial to use the per-instance value instead. In several
>    cases this is dead code, delete it. This also allows
>    constifying the ops in these drivers as a hardening measure
> 
>  - Some drivers have a fixed pgsize_bitmap, put it next to setting up the
>    geometry in their domain_alloc_paging() functions.
> 
>  - Finally a few drivers still use ops because they have a delayed
>    finalize operation. Set the constant pgsize_bitmap in the
>    domain_alloc_paging().
> 
> Then remove ops.pgsize_bitmap.
> 
> This is based on iommu next, and must go after the virtio
> domain_alloc_paging() conversion.
> 
> Jason Gunthorpe (7):
>   iommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
>   iommu/arm-smmu: Remove iommu_ops pgsize_bitmap

These two SMMU changes look correct to me:

Acked-by: Will Deacon <will@kernel.org>

Please yell if you'd like me to pick them up separately from the rest
of the series.

Will

