Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DE3C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaknfrXG6/Un2qMiCSQ6CotrWqsP5SO0MdjrGTY8+88=; b=2+8+z7ikQCArMU+VY1sUPZf1b5
	sc2ZBYkTFhoeVQ8PJgrQbJkSynOz+VIwdEvmNM9hUsdP6shRCbdp2hBjO60lkf/Q+KeQPcuLAPvbw
	pPwIxhETCjZr3WVIDyVqaD3iAsb+kEnwWU8NxmJW9f0rt4fHs072UwxTzZkat5RrM7i6PnNiPyUCp
	BOCOLtNzmeBl3PK8GF/1Wmj6VGR4ibi77MoEGTHJcuZSI8o4Z1cdkBU/LfzIiEElznh63KXAQhADk
	xE/VGPhYRrzBRQ9AX76UAL3luuRJ8UNvzH7QpPLYM4HEB3QTKWEBqKXPDAWEdVu+2oMC0rwfQN5hG
	TodQMynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRR-00000003sks-3oVI;
	Wed, 26 Feb 2025 13:27:13 +0000
Received: from [198.175.65.9] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGQg-00000003f2l-3Ufc;
	Wed, 26 Feb 2025 12:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740572542; x=1772108542;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lFhxRXpv6QTFcMfVUvDqKANeqKNOPbO6YgonBgCYQJI=;
  b=bKxa+tzriX9SBviBJdHIMUH6iCJgBJEvxhkwM1m5hArCp2Sz5MP6G7P3
   /hy5lb/BLJayYYMINt46SKFzoUdQlIt8ko/mrQ5FOGDn4h36gC1uH6JM+
   eggHeaGCT0ohkZmGD5tXr4+vI/+2p7Epp9DEVBlks+pio6OI8KzFthkij
   hf9HMNSJQBQNf/28iWlZijwCKwmGbwwWciUoChVuIaN+IDtZDrBL7HOEQ
   YOmglOS33jEHb+R8XvCyL0FeEhHwfufZQMuB+9GM0KVKT1tDzOFufQSnm
   oQf3V6/jwlZdbTuF7pPnpmG7KhmjHr594ORgAfp9zh/6Z0lSR1bYaZxXq
   Q==;
X-CSE-ConnectionGUID: rcKKt8jdQeKEp0gAnf1R1g==
X-CSE-MsgGUID: eznvDZdUTZGGwVVASX3Nvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63877914"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="63877914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:22:21 -0800
X-CSE-ConnectionGUID: hCu3EQHDT2qlP3dV1KuKQw==
X-CSE-MsgGUID: vpSaOO0DSI+Av8u8OcxQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116691259"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.105]) ([10.124.240.105])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:22:13 -0800
Message-ID: <caff123f-0910-4949-8512-acb77c6f0a8b@linux.intel.com>
Date: Wed, 26 Feb 2025 20:22:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 patches@lists.linux.dev, David Rientjes <rientjes@google.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 16/23] iommu/pages: Allow sub page sizes to be passed
 into the allocator
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
References: <16-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <16-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042222_950736_5BE78C4B 
X-CRM114-Status: GOOD (  12.18  )
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
> Generally drivers have a specific idea what their HW structure size should
> be. In a lot of cases this is related to PAGE_SIZE, but not always. ARM64,
> for example, allows a 4K IO page table size on a 64K CPU page table
> system.
> 
> Currently we don't have any good support for sub page allocations, but
> make the API accommodate this by accepting a sub page size from the caller
> and rounding up internally.
> 
> This is done by moving away from order as the size input and using size:
>    size == 1 << (order + PAGE_SHIFT)
> 
> Following patches convert drivers away from using order and try to specify
> allocation sizes independent of PAGE_SIZE.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

