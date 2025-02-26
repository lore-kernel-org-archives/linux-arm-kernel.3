Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D82C19F38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FoCvezqOLoj6KcS2FNnsDhl/lbDW1btJq5OKC9hdIY=; b=UGWis3i+RKQIIvvYbDlvf4RRm8
	nCK/Vo08DR8pdzdAvGOGqA3qhV2/TPkXPWga17XqLTuKz/vZxOJgf7N77qtq8XcgG59DaNOK+HgJf
	zStqlcBqK+PpQGBHYDIJWJEAt6AcTo/Gj3PX5NGLMrNhQDkBrXAlGGPL9uOzYVmQ8Wml0G3htYJlf
	6mcgDiafPp42z2+9Ha76I9gXY9c5y//eiHkqflTDjb+BUFJUIW2FnVqi7OWQco6kQqK6NJ5DrxU6r
	8Wh9YvDSuWp5TpuExaAQeyvtUfekfwn/yUipmBUGyGuP9rUafTwNb2JYoBgY3u6skiOH8rOfDXLVB
	2SeuIYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY6-000000047mS-2qEj;
	Wed, 26 Feb 2025 14:38:10 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGkE-00000003jKY-3pDT;
	Wed, 26 Feb 2025 12:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740573755; x=1772109755;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WkXc7BocQbpip7ciVHNFAiTeTqJtNYIch4zaYSdoITI=;
  b=GdDlRf/XjPticAJwwgcqbdBEQ5Te2mca7GqASFuXGS1goojPEH0Tl+o4
   MEdviSXqHTj8Tc93z4vC8Xm8swYScjQoGAtX2Mx5xATHkOsotl5i26uGj
   br92FvPj+USmO8e1O1RhLtfm3raFGw6kjYXfbTmp5S6pHPVjZh9ya3wx8
   O8vBaBT70jJN0VOM10JxDV1n/PkXCutmqZsV1DFV17oCGfNk9/swkrrZ1
   VWw8BD5WFVctU1jGxPUVmoKX7vtCfMmvNLRiNkIegC3wXLAbProZRiFRU
   la582XF9fDZ4iE08PGIbO7gOTtuoQfEE8k+3DlyqRv7Zh5LxkYUyDixeM
   A==;
X-CSE-ConnectionGUID: g2P7rt1pQS202zQr5oS10A==
X-CSE-MsgGUID: msFMLmvUTRCqCbKC13i9VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41543465"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41543465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:42:34 -0800
X-CSE-ConnectionGUID: qzXgd/NORXi327/S3f15AA==
X-CSE-MsgGUID: bn1g+MruTuG+TRPKXFaDnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="139911002"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.105]) ([10.124.240.105])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:42:26 -0800
Message-ID: <fafdcc71-b246-4855-a088-24854b124b21@linux.intel.com>
Date: Wed, 26 Feb 2025 20:42:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 patches@lists.linux.dev, David Rientjes <rientjes@google.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 14/23] iommu/pages: Move from struct page to struct
 ioptdesc and folio
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
References: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_044234_984076_EDE4BE21 
X-CRM114-Status: GOOD (  18.04  )
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

On 2025/2/26 3:39, Jason Gunthorpe wrote:
> This brings the iommu page table allocator into the modern world of having
> its own private page descriptor and not re-using fields from struct page
> for its own purpose. It follows the basic pattern of struct ptdesc which
> did this transformation for the CPU page table allocator.
> 
> Currently iommu-pages is pretty basic so this isn't a huge benefit,
> however I see a coming need for features that CPU allocator has, like sub
> PAGE_SIZE allocations, and RCU freeing. This provides the base
> infrastructure to implement those cleanly.

I understand that this is intended as the start point of having private
descriptors for folios allocated to iommu drivers. But I don't believe
this is currently the case after this patch, as the underlying memory
remains a struct folio. This patch merely uses an iommu-pages specific
structure pointer to reference it.

Could you please elaborate a bit on the future plans that would make it
a true implementation of iommu private page descriptors?

> 
> Remove numa_node_id() calls from the inlines and instead use NUMA_NO_NODE
> which will get switched to numa_mem_id(), which seems to be the right ID
> to use for memory allocations.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/iommu-pages.c | 54 ++++++++++++++++++++++++++-----------
>   drivers/iommu/iommu-pages.h | 43 ++++++++++++++++++++++++++---
>   2 files changed, 78 insertions(+), 19 deletions(-)

Thanks,
baolu

