Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0D7C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=519A3JPw9xaOANZ7JjUL1VlxgrnLWSEZ9ncEqg3FyTc=; b=D7zF7qsJ7B3Uz6DRJZuLAXeIBy
	MC79FLF8yEO05EF/5U1QvSLWig+prQ/4fubiXwkdw97bUZMn5LYNjjHRP0XnCFosX3XiOaFYxsh9O
	y2X098NA3E3rZQh2lvuRybmuZhA7wa97aBkE3+BzR3C7pJQCQaDXxi7J0bPY8IyVEuDj2KzKq8ltP
	qGCdsHYW832fds8Q8dQtgv4k7zV1GMC5/3DBJ3wVkPHxk6JP7YNxlnJxU4F02EQDcg37Lr5DispnQ
	0IvbpBrdj8LJ5x4qqubOd9A/ZicRRUbK+o0KdXlK44FWxEEsT62ECvcYJtehofVFssHZdTgnSJOoR
	D6HBDp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR92z-00000004Nlm-1iDs;
	Mon, 16 Jun 2025 12:34:45 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR85l-00000004DGy-3LBZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073613; x=1781609613;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TaASRe4qgqRwxxXiP0Y/pcupbVmXyYU7JDAROJSiwPw=;
  b=lmWKhbgNkOsd3QY7M0n7+9pzoWLyaYWRv7YvZPQF90u64OsZ+78YJSy0
   SgP7eBr1nVn0z33tsonOKt36Lick0UP0oBBHCvPmcfXf8ZijH3Yufubaf
   F0uLbo3THkjoE/7grM/obf9wX0S/XEg5B22NUOyjEq+mx4BH9zG3CjKVi
   hlO2J970ZJIFp0K825zb0HLPI+0lj69Xdni3FFZH7n4FuQ/8tFE2eAtd+
   XCWhHkw9wIh/iwqwOLmY+810xId1Ea0TOBracaM7TedIYRw2fGRFpsCSZ
   g81XZAQfg+4XpiP211No0ExK3sC09yxqMlO9vLi7uGtYC3P4CVXhyVVUZ
   Q==;
X-CSE-ConnectionGUID: oN2E+yyPTo6FsBv4ImrHIw==
X-CSE-MsgGUID: YkZLr+ERSlySDF4QwU7hRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56014287"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="56014287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:33:33 -0700
X-CSE-ConnectionGUID: iWMVCjyURKeZAdHUUOXn7g==
X-CSE-MsgGUID: 7yInmTY6T6CqB6tjeGUWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179345988"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.243.252]) ([10.124.243.252])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:33:25 -0700
Message-ID: <a774510d-bc55-4ea5-bc1a-2d31cb5bf589@linux.intel.com>
Date: Mon, 16 Jun 2025 19:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, bagasdotme@gmail.com, robin.murphy@arm.com,
 joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
 jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
 nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
 mshavit@google.com, praan@google.com, zhangzekun11@huawei.com,
 iommu@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
 patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
 vasant.hegde@amd.com, dwmw2@infradead.org
Subject: Re: [PATCH v6 13/25] iommufd: Add mmap interface
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <c9929e0c9ec6f3f6348cd0c399d6fdfa9f35f973.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <c9929e0c9ec6f3f6348cd0c399d6fdfa9f35f973.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043333_852606_7DBD8D7E 
X-CRM114-Status: UNSURE (   8.06  )
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

On 6/14/2025 3:14 PM, Nicolin Chen wrote:
> For vIOMMU passing through HW resources to user space (VMs), allowing a VM
> to control the passed through HW directly by accessing hardware registers,
> add an mmap infrastructure to map the physical MMIO pages to user space.
> 
> Maintain a maple tree per ictx as a translation table managing mmappable
> regions, from an allocated for-user mmap offset to an iommufd_mmap struct,
> where it stores the real PFN range for an io_remap_pfn_range call.
> 
> Keep track of the lifecycle of the mmappable region by taking refcount of
> its owner, so as to enforce user space to unmap the region first before it
> can destroy its owner object.
> 
> To allow an IOMMU driver to add and delete mmappable regions onto/from the
> maple tree, add iommufd_viommu_alloc/destroy_mmap helpers.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

