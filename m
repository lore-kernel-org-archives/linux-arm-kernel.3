Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1ECC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE96QLeRhE4GJrS9byuaNXqVlFOhjB3CVgTCBn9RZh8=; b=l5tAkkwdh7AnPL6cYWsf7uiJ3w
	ybrlBCe7NYDJV4VKjZpQB1b3dzsCa2sejsFnAadWquTQF5DXKckzJX+pOVB1wki5FId6/3CnNomY4
	hdwH4TStUbOVfpWTGmKSiZqetvY4xKrLuZThkyjqAJAaSTV5hgdt543RjlK4ofj4sdwxo6V7xfp9T
	LC/tk9fOZP0x5yrHx19YDp5Rb8uAgbbx7mFmik91e3NLgY/ajAXMxLoWoD8wxxPlPBW/x4bItYqk9
	wJDWHVkAq4yNKXmddcCrxpZEQIjXT2CXWC/UCEGZt0QrSEZ0b1esP7FSFY0/cAe8n1EJHEHHaFT7Y
	+Lp0KwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRZ-00000003sub-2ZEg;
	Wed, 26 Feb 2025 13:27:21 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGSS-00000003fPv-0yb5;
	Wed, 26 Feb 2025 12:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740572652; x=1772108652;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P9888PT4GlbGGm/Br9DmxmDaQSRLXoZLVYOYGsAgjmY=;
  b=HTNcSLuuCnkjr12kdolK7FvPQ4a6nMG/x28YDZCQYlVv3YWpj55aOEhS
   sJBpaT2AbUk+gn1bKPB8VCa5psW0bQfBrX4ClVT2O7BHRdZI8U/P13AXO
   lmM0FVJ0i+Dngt+kySa8yd1IwFCtpAapStyTWEnuvblHyBUtLABsU78RC
   bujUzrMCkDqC6EnmK79wM7UeO3kvrcbfRwzap5IqJtJmNNe5RUxMXPL3m
   q2vaWXpJoP80O2TqSMFhR1hhG2epFX1mhwr5ki2tBL4/P/qqWfwesqSyc
   G34f20iSWM7caqj7rRgwzG++ZfGZjkTowDRaG+4vkOE4s+vWfM/ILf3L/
   g==;
X-CSE-ConnectionGUID: nAVSCxvIQaqjQKDS3QujMg==
X-CSE-MsgGUID: npN/RhPiRd60onzNTlooEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41541432"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41541432"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:24:11 -0800
X-CSE-ConnectionGUID: wzzbivYHT0KOHQkWAqrFjQ==
X-CSE-MsgGUID: mecjk28SRGKVrI7hEWbiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="139907373"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.105]) ([10.124.240.105])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:24:03 -0800
Message-ID: <e50cf21d-49b1-4c9c-8e85-41d70e6fdb5b@linux.intel.com>
Date: Wed, 26 Feb 2025 20:24:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 patches@lists.linux.dev, David Rientjes <rientjes@google.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 20/23] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
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
References: <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042412_301079_FD2BA50D 
X-CRM114-Status: GOOD (  10.75  )
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
> Convert most of the places calling get_order() as an argument to the
> iommu-pages allocator into order_base_2() or the _sz flavour
> instead. These places already have an exact size, there is no particular
> reason to use order here.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/amd/init.c        | 29 +++++++++++++++--------------
>   drivers/iommu/intel/dmar.c      |  6 +++---
>   drivers/iommu/io-pgtable-arm.c  |  3 +--
>   drivers/iommu/io-pgtable-dart.c | 12 +++---------
>   drivers/iommu/sun50i-iommu.c    |  4 ++--
>   5 files changed, 24 insertions(+), 30 deletions(-)

For changes in intel iommu driver,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

