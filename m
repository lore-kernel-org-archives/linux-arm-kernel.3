Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B119FDEE5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBHOtpJQHJTe8YoNSAyPy2fdePzUXiELfnJvnoPASMM=; b=WfruETnMZYxMWEz5UlCLNwwEhO
	+0LCOEgzxzIOK1xcs6ASkSORl+wW9VD5NEibK3nZtBSxRes4OKBPMYDjM3DY0LguhnyP0/drz/Fwk
	7U7zR1t/9VETNdGvT8Rgg69U2PLhuJ5nfI7OGRb4X99omqLko1g7awanZ3BztsLxN4DEgoDg4Ybcp
	gwP5uMztTGUmSUGx6SzDb+U/2vNt+kFWQkSnb6w1EUjsnpy5/FGf29XqRxeWxOp8Rwo0CxYzDVDba
	U7TlV+MpzXGe2MFXROENSpmF/sS/WMQxBHOfuBZz9hWSc6Ny49KHHd7BEO+SG13Q8mSmTlAlh3hvF
	gw4LAsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6Vc-0000000CVzY-0iOB;
	Fri, 24 Apr 2026 02:43:12 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6VZ-0000000CVyp-07yE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776998589; x=1808534589;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j2wYXEfdv0dE8/XEklFeV4fc3oP0ONQSD1BC2wLT97g=;
  b=J3gZV6prM5uIQQshpkeXWqMqY4TTVukJFTt0snWtZ+hUV6ApGouTslb0
   8nH6xt93sse75m+2mmuQr7cK+EMg8OeDB9yIC2CJnXvOWCVchgHXLl48G
   JLTiJilB6agjxHyxiuKXjA2FjSOi1JttWPouX5l+td46j7uOkb2BFuojs
   3035i9qXALPVe4CiXnMsFnCF6KZBYUaE75vvW38o9/qAceuHyERhSjhE5
   iktq52q1O3hQtvhzLSGqO/egyaN0QBNKt3lTfARuhnd97S9Qx531Sk5hg
   G/fVXigne16pRi4dY++niF94+KhBcKHWHXU1YLbTNMD0heThjaT4iAa4j
   A==;
X-CSE-ConnectionGUID: FlskqdjvTHC6mqoGjBuuEA==
X-CSE-MsgGUID: wbOs23xVR4WGwKMWm+G+nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77008202"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77008202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:43:08 -0700
X-CSE-ConnectionGUID: MrEiUpgATxusCdSVkTkrKA==
X-CSE-MsgGUID: bntkoq9+RZqPQ6h+r3WxdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="226289922"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:43:04 -0700
Message-ID: <55144f96-35f6-40b5-a29d-b2dd80b37ec7@linux.intel.com>
Date: Fri, 24 Apr 2026 10:40:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] iommu: Add __iommu_group_block_device helper
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <5bf2e259f80696c498cb15f40452862e4b43a295.1776381841.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5bf2e259f80696c498cb15f40452862e4b43a295.1776381841.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_194309_085368_B5589539 
X-CRM114-Status: UNSURE (   8.18  )
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

On 4/17/26 07:28, Nicolin Chen wrote:
> Move the RID/PASID blocking routine into a separate helper, which will be
> reused by a new function to quarantine the device but does not bother the
> gdev->reset_depth counter.
> 
> No functional changes.
> 
> Suggested-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 99 ++++++++++++++++++++++++-------------------
>   1 file changed, 56 insertions(+), 43 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

