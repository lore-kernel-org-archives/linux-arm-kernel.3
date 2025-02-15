Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74339C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8TDaPI8/r9bSfjUurZCMjxR+MAz6WR1EsizurI9CRY=; b=iewMb96WG04vRj9MDQ5CzK7Hfd
	5mk5eOjEnmfH1Ww96Gk2ucUpX2mWZx8wNGGC2oursJ91vjXyu1AyZWVerXYpVVL2NkWr4c4ZFrPKU
	wHSCzSwQnvc4LALoNEVWQj95S2lCyN1detYfV7B6ols+YhrLVHJh/PxB2AokOkIm6D8Gpk+8kAVbS
	glRrGLkpfV6C3Gd4/SD6+74Ub/9Tn8zzFIpxhsjF325DxIsjaWQUqdzrcvRNt6siC+Zb6Fcp+wVGG
	GShqRLPxFIo8RheDGDxy5dow5EJecX7oSjPrtJrMfc2F+8CbiofDzq8hNh5CzIYCfTsC8e8ooSIjv
	1w7Re3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDwC-0000000HHPt-454B;
	Sat, 15 Feb 2025 08:54:12 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDug-0000000HHAx-0oUI;
	Sat, 15 Feb 2025 08:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739609558; x=1771145558;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7GL2U5SpT2VoHIZNpeGTc6jbEWPVggoPMzS2SMqOKM8=;
  b=M/LsGibKDgjEgsPzsDLXBdkbOrdWYSa7zQpLG3kUan74hVR7Oo54iTlS
   HbWNzBBEEUmb8ExuxPC1Jcfaw2u1l0EqMawfgQeIvoYuIoJPh42y+kCCc
   7sjnH9ysSqkZbNEOTjE5Jv9D78Hdb2wR3GVjiUoSpimDvnAjBICMm2r2q
   vz/tM2W1QOa1EW02TCmUwg1Z1rRg68CUx87CkvZxrgElfeVd7TIV2Y+iT
   Pmhlk4Rbles0F6N/2tsOSnlY125oaHDmaAw3PWlcJ9NVc3GYKjsnuZ20W
   f8wxfWJqR7muR8pQLi8NRmeTZTCyOrn6mTd4jbRUq/5kAzntidJxhK6ie
   Q==;
X-CSE-ConnectionGUID: El0HuaWPSsyKOleeRY0y8Q==
X-CSE-MsgGUID: kXn26A9gTHO9XQ38Ai0NLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57764866"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="57764866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 00:52:37 -0800
X-CSE-ConnectionGUID: vye0sqE8QmCQ4YPGfHOQQg==
X-CSE-MsgGUID: h5vIpSbnRHO9zzjW9Kx4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="114287785"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 00:52:30 -0800
Message-ID: <bd54b742-16c8-4b55-95cb-5cb6847cec07@linux.intel.com>
Date: Sat, 15 Feb 2025 16:49:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/23] iommu/vtd: Use virt_to_phys()
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <8-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_005238_283893_27A6C261 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On 2/15/25 01:07, Jason Gunthorpe wrote:
> If all the inlines are unwound virt_to_dma_pfn() is simply:
>     return page_to_pfn(virt_to_page(p)) << (PAGE_SHIFT - VTD_PAGE_SHIFT);
> 
> Which can be re-arranged to:
>     (page_to_pfn(virt_to_page(p)) << PAGE_SHIFT) >> VTD_PAGE_SHIFT
> 
> The only caller is:
>     ((uint64_t)virt_to_dma_pfn(tmp_page) << VTD_PAGE_SHIFT)
> 
> re-arranged to:
>     ((page_to_pfn(virt_to_page(tmp_page)) << PAGE_SHIFT) >> VTD_PAGE_SHIFT) << VTD_PAGE_SHIFT
> 
> Which simplifies to:
>     page_to_pfn(virt_to_page(tmp_page)) << PAGE_SHIFT
> 
> That is the same as virt_to_phys(tmp_page), so just remove all of this.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

