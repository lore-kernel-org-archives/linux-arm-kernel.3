Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE648C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG0s7LXs8xpG+zN85TUhl64WxXr/gRibp/pDyto5zv0=; b=jR/ZNJNYvT48hiDgEhRcYypJiy
	3zEGqrcEoXIJF2ogiurnU/E/szjKIhwqXYL0Kx8Lu5nFib/pPSqrAEDfcuFlQofQtYdJ+P90sl83I
	Mv2y2S82HQqSjluYOhqreOezqemGDnS4BRO8SMbWx3mGaGUyciogP58wN6PmqsCnioiqCoFzPUNu/
	LGh/kRGBJpSStNE/sy3hSSH/C9bO5Jk106NxpoEKzaiFPXXavoI5K7lk/w4YAkKuyUn7WPOU2YhpV
	AddoxsR0jfO1yiv+fjolRJXSwKC/qErDWE2e1F/wN5F29rirVt2VUjGqf+U0Z1IAtB/ZtW1Aev0Lr
	+GlNZX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0vq-00000003IeL-0JDi;
	Mon, 16 Jun 2025 03:54:50 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0W3-00000003G5K-279c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044492; x=1781580492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OBHrIbSL+kVLYZcNrGsRVOq3vlVKlEr4ATmlpyHec4g=;
  b=G9VMAHgoSU+lLFWqfHvhHVxDNqc0gjHJQKSqM9JC15Do6PeGPWVDJNL5
   NCeD/2tLz/H24cq9mHe17PjtwWVQmAomTf3Tb1ZqAdgSMvJU35IcEUhcR
   3qI0nPrQYM/8R9OFmpW5Fgf/aMGpx/g98EP69RoNJ62UVsgyqwpnwLtIn
   vvKhVFP86aLmZkXiAkBHMPD5hiWxM98G5mnzMci638nW+JF1RpnoSrdki
   XdIjg2BGmdXXbo9UaFRo0xhOD0leevLJdkYn42Lnsr+Ie+x1sXIaPrIH2
   W6ehERVfTnXG9XS9a3Y5VDlS11DB8NnlsGmVKy27ZRezuNB94roK+CHRg
   g==;
X-CSE-ConnectionGUID: ijqBhiHmR0ult4CamvBLUw==
X-CSE-MsgGUID: s8IOn0J/RO+/DZvXka1Afg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52269826"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52269826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:28:12 -0700
X-CSE-ConnectionGUID: a8uc1QaeSDizUFA//+SP+A==
X-CSE-MsgGUID: 7aN3AdV0RMqe4irRZ+9pzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149262538"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:28:07 -0700
Message-ID: <8df501e1-73e0-4668-8ebb-880d4b70c53f@linux.intel.com>
Date: Mon, 16 Jun 2025 11:27:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] iommufd: Introduce iommufd_object_alloc_ucmd
 helper
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202811_610546_3CC32EF6 
X-CRM114-Status: UNSURE (   6.35  )
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

On 6/14/25 14:35, Nicolin Chen wrote:
> An object allocator needs to call either iommufd_object_finalize() upon a
> success or iommufd_object_abort_and_destroy() upon an error code.
> 
> To reduce duplication, store a new_obj in the struct iommufd_ucmd and call
> iommufd_object_finalize/iommufd_object_abort_and_destroy() accordingly in
> the main function.
> 
> Similar to iommufd_object_alloc() and __iommufd_object_alloc(), add a pair
> of helpers: __iommufd_object_alloc_ucmd() and iommufd_object_alloc_ucmd().
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

