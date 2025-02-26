Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A930C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waVBbulQR+WiFX8tNxs9SJGZUDCVPn/ITJ0eERlwuNA=; b=K9CC9z97YFuz9NkU/AND0u4dzR
	sILmzD5cm+mTmJPKcONabiDqf5FOGwq7I3alOQjLm0eo9dSwuHMWi1nOiw/HTme3+Lbj4lMNsaTe3
	pMMUWtldyKJtpSqXlSOgCNUnRajZHYeM/3BR6rtHQztWWcbP3axk5eaSvD8EvMu0bazqOl4MXzegH
	z3B0ead1TwHb+HciUVm4Crnl95mlBUy+IyGuirMuCmA8ITg5NJqLIuNceb89vbE9kDK85YyozZZ25
	2rEKb2AKRw5AJRw0aM5LmPLIdLeyRSOdhHbvmEY6sNgP6H92fD+jYEmnzX2clV8TKhvexYyqiOs5h
	vluC43iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAxQ-00000002X8k-24AB;
	Wed, 26 Feb 2025 06:31:48 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAul-00000002WsQ-0PbY;
	Wed, 26 Feb 2025 06:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740551343; x=1772087343;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lXhU7sd67KpdS+ygAGbHgQMDj+NU0WLx7YcQjO+y+Dw=;
  b=DFr/5DLeJxygtylYdBlVk/USakt+72UKMkQV6nOF/yrSk9ssVD9MKoVo
   Rf2OfX9Igy1dfngwjtpcsXco9lA9EK1sMzEKfkn6gaquOcPkrAS921uz4
   pJj7lFwunCvI352aUtbKIVdXoQvl+9ZW+Xh4fhmVeCcDWJyJeE6Dg3Wtx
   Mv6ACeG6qO03w+RFJ50RYenwZRDfjsE0i2OKshR3y/Gp0KSyotj9L7BY7
   Suq59YSb3gy9unMocZ3v//zfqj9s7mK8IiJj9ed4ouNZlTg29x3ddKYzP
   t8KloUh88DSJ/JveVLxP2BRHUAB7mAEp8ieCq5NNUZ+JQi8XTyZH/2Nr/
   Q==;
X-CSE-ConnectionGUID: wHOuJyZfQJK36ws1LaHjhQ==
X-CSE-MsgGUID: 7O516dalRcijmHUPN+DJAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41298289"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41298289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:29:02 -0800
X-CSE-ConnectionGUID: 2JLYeRJ8SYy4f0Hre3l56g==
X-CSE-MsgGUID: UbYTX0nDQsG2v0uK0Z0EBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147525482"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:28:55 -0800
Message-ID: <a76deb10-314d-4b49-8dc6-8372564266ae@linux.intel.com>
Date: Wed, 26 Feb 2025 14:25:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] iommu/pages: Remove
 __iommu_alloc_pages()/__iommu_free_pages()
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
References: <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_222903_178504_B99FF3E3 
X-CRM114-Status: UNSURE (   8.60  )
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

On 2/26/25 03:39, Jason Gunthorpe wrote:
> These were only used by tegra-smmu and leaked the struct page out of the
> API. Delete them since tega-smmu has been converted to the other APIs.
> 
> In the process flatten the call tree so we have fewer one line functions
> calling other one line functions.. iommu_alloc_pages_node() is the real
> allocator and everything else can just call it directly.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

