Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7698C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqomI/RQVWJE7L5xC88GLicTh4NgQJkvlde3r53XpvQ=; b=IPQobqPXIMI/nuyeF31rHKLHRN
	YJHNUPmafcUawJywuDfjmbQQre/VUmfzDWjj8SJIVtvbqPBI5JF5ChiNAlG59uphG8nal0bwm6bBC
	nPbCZwCVBKMDKJ9l5w18/IJW1qdafY8y/X76CvJWEu1xIyRs5lNDI6V7i/YB8cMSd0bB0fajzrYS7
	QWhVLtKBjjdkTEogC2l026/EtFiRDp822XU8Nt+ewHFdYd1Q8/Of4CGey7lr9MU5ZMgspwURj5E/8
	m+gqhA+2WlL8E2ce2c/ItpmyQRaJ3fTvRFELrx4ccIWCxvy9om/WN8ZEAqcflHsXADoNlF0pXBctX
	sTUWPMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB7h-00000002ZTq-1IQv;
	Wed, 26 Feb 2025 06:42:25 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB5A-00000002YwY-3j5u;
	Wed, 26 Feb 2025 06:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740551989; x=1772087989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wEZYyMMMYY0p/InDFAWstpwiUT9Y8kIbFfE8GirQgHM=;
  b=Z2J7sN5T+Pm5D4SEJxAaShuQZnjiWtCS6PGYa7AChH4yoUvXJRPwNaMH
   9N2Ft8BKQAZcFMu4kBtG27EubQiev5S2482dex9NmO5PhiS29kxvgEX+a
   +M2xhdAnwomCApiyrOsv6OiG5PqAvTHj/gZORnx2vzOxr2uiosOFyRmGO
   5+omYyfSSt/oh2Qb2V7tWHaHLbwKtyeACE9QFdRM2/4dKVZyNlcSFIynb
   0HSxbXwS91ptyTQQhHivj/7kULrIonsfUVArQBi4d6mbNesmJHMim9DWf
   p0WgMdEAJOKPsiHjmmnZkzmqwh0V3/UnSeU+o0Wvj7+wLPf0nnDUSR1Zs
   Q==;
X-CSE-ConnectionGUID: 5Inct43XSseA1G7mellnPw==
X-CSE-MsgGUID: RHb15ktxRxejt5jO25n1vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41088229"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41088229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:39:48 -0800
X-CSE-ConnectionGUID: gk0tSm0GSMuWy8te+oesQA==
X-CSE-MsgGUID: B4sm4s2nRNO85JsKQGxg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116810017"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:35:53 -0800
Message-ID: <a60cb386-0387-4889-8f9b-88f01cf9408a@linux.intel.com>
Date: Wed, 26 Feb 2025 14:32:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] iommu/pages: Remove the order argument to
 iommu_free_pages()
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
References: <5-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_223949_011720_9F79F7EB 
X-CRM114-Status: UNSURE (   9.65  )
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
> Now that we have a folio under the allocation iommu_free_pages() can know
> the order of the original allocation and do the correct thing to free it.
> 
> The next patch will rename iommu_free_page() to iommu_free_pages() so we
> have naming consistency with iommu_alloc_pages_node().
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

For changes in intel iommu driver,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

