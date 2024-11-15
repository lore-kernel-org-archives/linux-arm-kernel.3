Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E598D6DDC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L47ovZHp47jBSLxGB8ttxTdbF8WZnBuFY8rCnvJ5jk=; b=n/BCUK0WoIEKYkgjfOcqfP9Bn9
	/Y9j4/KWZqt0TdK2TMEXPXgRId22M/DFyfGF4WcTjeWDzMruOieepFY+iTcAF6GlAi6M+JJSx0m3V
	s/9I947INEFuc/DP4XUBdYr8l+8bswYgunRGgYjbqy0i7mAFUyvIemMpOu0SX493R4KPMdCBcV3zV
	fubvV3VeDVIGE49IHXaa67iLJpru4y/oU8/bag9bm3jNI4ZG2ZXyNXOL+93bULaGLuGeU0YCAdLUZ
	vy1bGggncQXc+KR/NC4ceSxOi/YL1zQ7IcMRY5qTQAkR/TD00X4HHyxV2mjhYSq2hjQ1XC50XmXkH
	5u4bpVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmxT-00000001Tlk-1fVZ;
	Fri, 15 Nov 2024 03:25:19 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmwX-00000001Tdu-0tio
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 03:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731641061; x=1763177061;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8QTLKulU08ztsSRY97lKpfpwjYQSjInkq5JQac5Ipcw=;
  b=UeQIt2ICWTMqSujkQF720eLI7L8a/gqkJhULfgz1IF1evfiHNi6YZWRR
   rGn8zSXeKSsP8VMct4Hge4JXWCt3I+wLzSOsMWgTTwILIKJO5IalcO3vF
   925FrNJMPle4cv4tMk1lyMTCbKfEUPaKoXVOOBIBA5wneYPyqgAFzhkvV
   zRaA4WM42nRco+w4ty4HmWNO/47rQe8j+a7XDh3JEartqErGuEzLUWNQO
   wXtRH0pjMZUxbMOPBVfZCWvAH9s7dFBHNseTsvYIKeYf8drfIaHQn++CF
   91LVyeCpFNdIBv9RMmzXBOB+YXr9b/SUod925lTqOf5ADn5pI4s+KMl49
   g==;
X-CSE-ConnectionGUID: Aqk9kIJBTxyeRi8GCK79dA==
X-CSE-MsgGUID: 0SPrNUoqRuCCs/1ZsKkaXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35547985"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="35547985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 19:24:20 -0800
X-CSE-ConnectionGUID: bz14ucyiSAKh7VeVs8wqJA==
X-CSE-MsgGUID: Pp7bmtyYTW64DjWErzO2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="88819369"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 19:23:53 -0800
Message-ID: <e9981960-a7f0-4e0f-991a-0b96e1d57cd5@linux.intel.com>
Date: Fri, 15 Nov 2024 11:22:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu: Rename ops->domain_alloc_user() to
 domain_alloc_paging_flags()
To: Jason Gunthorpe <jgg@nvidia.com>, David Woodhouse <dwmw2@infradead.org>,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>
Cc: patches@lists.linux.dev
References: <2-v1-c252ebdeb57b+329-iommu_paging_flags_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <2-v1-c252ebdeb57b+329-iommu_paging_flags_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_192421_313503_D3AE4672 
X-CRM114-Status: GOOD (  10.34  )
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

On 11/15/24 03:55, Jason Gunthorpe wrote:
> Now that the main domain allocating path is calling this function it
> doesn't make sense to leave it named _user. Change the name to
> alloc_paging_flags() to mirror the new iommu_paging_domain_alloc_flags()
> function.
> 
> A driver should implement only one of ops->domain_alloc_paging() or
> ops->domain_alloc_paging_user(). The former is a simpler interface with

s/user/flags/

I think domain_alloc_paging and domain_alloc_paging_flags will
eventually be merged into a single domain_alloc_paging with flag
support.

> less boiler plate that the majority of drivers use. The latter is for
> drivers with a greater feature set (PASID, multiple page table support,
> advanced iommufd support, nesting, etc). Additional patches will be needed
> to achieve this.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

