Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA31AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/MCyiJiJNMb6/+o2NnC2vdD6K6vpED8c7c6Bz4F8vU=; b=0v6M9nNhevTmEgperw3oXtoC+z
	nsk+u98lNFyyB37suS5bsPPe0xkenTyTyUhG/EeTxDpSwNWFmqiKogN5MnJFyx3Sr0FTreF8bpfP1
	/ZoEIiuaBIZxnuuzB/1UMWiXiJZe8X7ngGNZUpbbBuTGok/VCgsUHX7SFrTK20ub43WX49sxI/eKK
	sNTgRT8PXmFTwmIOtOceOVR5kDBrp28s6yVuEyWhSC0EPFXAjfMXpd/awh7hnn9ZA5Fm2wEQsFUlv
	dyfdSWCbwu6PFzJmIH8nJlgbZxJ/FTcyIfZy0JRuf9z6ua2U3ip/XAs6ga17V9ILN0mP3QgxREG9C
	BnOpAeBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHS1-00000003tfg-1LUs;
	Wed, 26 Feb 2025 13:27:49 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGUO-00000003g1p-1lcP;
	Wed, 26 Feb 2025 12:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740572772; x=1772108772;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4swnzxuk3Mp34U728sCFthX69jILu8ATPWa0zFUvrcM=;
  b=UA/zAxUE66fv200DReYCotc3lDV5/zz6WGRAJ6j3+78GYdCIxQ4FTfFe
   uOyBMp2kgFoGTP8vduYIJKRSDe5raaZYF2R5LPV58DHzUFDxf7+8v+dpB
   sRXzK8bdk65vrLzE0LmT+FXF0y0uYw6E6OEwklsIyGa6jjyY97q4HQg9B
   u2K0+jZYhPknGOnZ6cqvZYMzD2oaifD6c5qh9K1m+BJOkE1qoz8K2NANR
   6VzTbT6zLZx/02EGoND/1/kOxvUqDhE5oGSAadCZyFVOXqzRy8AAPOLhq
   NifZT5TSBvw38B0BhLT2Y7nkScl+hXT346mNa1Dp6zwzno9UYN+AW1wiP
   g==;
X-CSE-ConnectionGUID: gguFjKRpS6WCFR7K2w7rzA==
X-CSE-MsgGUID: HkAtwu3iTAe5fcGKNYtF/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45195962"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45195962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:26:11 -0800
X-CSE-ConnectionGUID: 762ere5SQUeDKcp4Fzyz1A==
X-CSE-MsgGUID: aMfDjXFLSPyglZBn67P2Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="117177990"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.105]) ([10.124.240.105])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:26:03 -0800
Message-ID: <44963756-16e6-4a12-b2a8-2901b961342c@linux.intel.com>
Date: Wed, 26 Feb 2025 20:26:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 patches@lists.linux.dev, David Rientjes <rientjes@google.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 22/23] iommu/pages: Remove iommu_alloc_page_node()
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
References: <22-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <22-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042612_494231_BC35CC3F 
X-CRM114-Status: GOOD (  10.58  )
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
> Use iommu_alloc_pages_node_sz() instead.
> 
> AMD and Intel are both using 4K pages for these structures since those
> drivers only work on 4K PAGE_SIZE.
> 
> riscv is also spec'd to use SZ_4K.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/amd/io_pgtable.c    |  8 +++++---
>   drivers/iommu/amd/io_pgtable_v2.c |  4 ++--
>   drivers/iommu/amd/iommu.c         |  2 +-
>   drivers/iommu/intel/iommu.c       | 13 ++++++++-----
>   drivers/iommu/intel/pasid.c       |  3 ++-
>   drivers/iommu/iommu-pages.h       | 13 -------------
>   drivers/iommu/riscv/iommu.c       |  7 ++++---
>   7 files changed, 22 insertions(+), 28 deletions(-)

For change in intel iommu driver,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

