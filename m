Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1929BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzJ4Wg24qzu6pyKtW142sYMQG0HMZpg+d5djsiZ4znE=; b=uw9XyZcZ6gOEXW4iksKkr36wae
	l4P0WyiAhRkxrS0m4NoNI8/nyV0qmKG/smBnojnDTRFnVFTZh/rBx4S/dcdVztuFWFx20wjB2ShFe
	7tGyiRXf27oBaSVHOyZx4m4SyM0xXZmP2Edl4P8bKKu7lOHdN57xIAd12A/II1uUnrR+xzLFo27tt
	0+jiMm7aUxwN3YCd04KwH2lctuj+XH6/Wk7g3LuRiNtiglcuwRGT0phCEH6ouommMmZHMv77z7SAd
	1NC5IMhcMfDfx37ZgcXFzMA44kg7t3gI8RsVIuEedo6DL5NGwuCX5QdWUvvX2Sg7oi2zoHMROkQF/
	SJEo0+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QLJ-0000000DLCL-1sCE;
	Thu, 17 Apr 2025 14:35:53 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBO-0000000DIdQ-0jC2;
	Thu, 17 Apr 2025 14:25:39 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E900D485FD;
	Thu, 17 Apr 2025 16:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744899931;
	bh=/HJPLJW7CBCK1J9D/Tt5sZhelJYUDsDIjSLUZbWv1OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EuElz7+Qx317T37R6Xk86MhTtQwxCkmp7UHTFVuhPJMl9k8WUHkrpkhEHjiIIU05a
	 HAzRnmkgmL+RUvIuZioUKw7Vlp9fZaCDnvU3iA4vVdaEZsHSVM/0fMzv6HIRkOKA1H
	 chS5VzHsAK7xJzIE/CfhOd0QMQq1TCQw4LQUF9XGapf525Y1ufDPhOH9Vvq34bzNc5
	 NoIPQRHmnCzb7eL4G8h21D64hMj6oM4CkSXYLdrD78OqxWTP5I/Jl8OmL36GnsK76B
	 +iNsSxMcEukAqjZx3Ur+ZnLAflFKwuDuR6GXgtRCL8p4ZN1N1sjzsv0I5KMogrNGV2
	 EkNWoKRqfm8Eg==
Date: Thu, 17 Apr 2025 16:25:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Neal Gompa <neal@gompa.dev>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4 00/23] iommu: Further abstract iommu-pages
Message-ID: <aAEPWXaBocqgsvbR@8bytes.org>
References: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072538_438764_B4B212DD 
X-CRM114-Status: GOOD (  11.10  )
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

> Jason Gunthorpe (23):
>   iommu/terga: Do not use struct page as the handle for as->pd memory
>   iommu/tegra: Do not use struct page as the handle for pts
>   iommu/pages: Remove __iommu_alloc_pages()/__iommu_free_pages()
>   iommu/pages: Make iommu_put_pages_list() work with high order
>     allocations
>   iommu/pages: Remove the order argument to iommu_free_pages()
>   iommu/pages: Remove iommu_free_page()
>   iommu/pages: De-inline the substantial functions
>   iommu/pages: Formalize the freelist API
>   iommu/riscv: Convert to use struct iommu_pages_list
>   iommu/amd: Convert to use struct iommu_pages_list
>   iommu: Change iommu_iotlb_gather to use iommu_page_list
>   iommu/pages: Remove iommu_put_pages_list_old and the _Generic
>   iommu/pages: Move from struct page to struct ioptdesc and folio
>   iommu/pages: Move the __GFP_HIGHMEM checks into the common code
>   iommu/pages: Allow sub page sizes to be passed into the allocator
>   iommu/amd: Change rlookup, irq_lookup, and alias to use kvalloc()
>   iommu/amd: Use roundup_pow_two() instead of get_order()
>   iommu/riscv: Update to use iommu_alloc_pages_node_lg2()
>   iommu: Update various drivers to pass in lg2sz instead of order to
>     iommu pages
>   iommu/pages: Remove iommu_alloc_page/pages()
>   iommu/pages: Remove iommu_alloc_page_node()
>   iommu/amd: Use iommu_alloc_pages_node_sz() for the IRT
>   iommu/vtd: Remove iommu_alloc_pages_node()

Applied to the new iommu-pages branch. I think this has the potential to
become a conflict nightmare, let's see how it goes in this cycle.

 	Joerg


