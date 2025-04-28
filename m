Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9381FC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 02:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVMVMfCvOswp1yCTW7y4D5NmzhH40JlWe2gvUkVxfzI=; b=iSbHWGbAF23rpNd6uLoDq17eBV
	4xTLLx1pY/hLwZu6zkQPZ/ElnSu9v/5fyJ59y/NuW+euKxGv1LyjyswFUY+Rn7DvbDE2mQilLySUI
	c2RTUNdFtX+ClYXqs74u4VfT0YD00pXXgtFWdvAenNXwDwxsnIZ++Vdmbke297qDygfzdoeqGM1qR
	kelOCSInlwjDk/rLlnKMgo3eTkMs/x24TZcWceS7sgSWtHtEh32P7nEPb3bx1MN3vLarR72eSSr9v
	/E51YmR62jc1fepwBKSMMY7e8OvOv89dvdErdjJNiYduRoEBZXR03FE4NvmA+osr+ryRbIHafzfhi
	WDZQk5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EEW-00000004MAR-3N3i;
	Mon, 28 Apr 2025 02:28:36 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ECZ-00000004Lxr-3N3G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 02:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745807195; x=1777343195;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9o6ImY5Xhg/iIM1ggLLapPernE+0oRf+mt/tMBdeno8=;
  b=VyLQX1FNpPfUDP6jI+gF62nGSrluOgXh7RZorGl0miWiuiiC/F/Qjd0v
   3ipphHGT3meKmRmW/0m+Lx83g2x58eJ+vtcW/jqOEDhhBC6R48DmLnPJc
   wr9F5Bfj8mNFOFIxNOvZR8gALkNcc0uWDj/6J9AXokQpexeIwaO7ex5I9
   h+P1LSFqvxSwL3bDuVXmNm7r/E00t2qAUppip8UsdSMH3HqZsD3NQIuVq
   DZ03S+hLd3b1FmcL4PFBQgFCotAYkLQmvJLzfPDyf061wiVpewL59smic
   pbG05Qz7PyGi9ncIq3NC1rTiXKh0SsNlb+0mve/h5OjybNRht+gr+pWqF
   g==;
X-CSE-ConnectionGUID: ipa7oVfBSfWBKSV/1gIqPg==
X-CSE-MsgGUID: ycoBtqYPSg6qAglfJbDqRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="64919033"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="64919033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 19:26:32 -0700
X-CSE-ConnectionGUID: G2C/+PsgREWc8VydJw7YEA==
X-CSE-MsgGUID: tr8P1+CuTbep0lh7HWgq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133362707"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 19:26:20 -0700
Message-ID: <bfb7dd4a-0597-4b6c-ba53-1e4ee3b733b0@linux.intel.com>
Date: Mon, 28 Apr 2025 10:22:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] iommufd: Add for-driver helpers
 iommufd_vcmdq_depend/undepend()
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_192635_889763_AD43110F 
X-CRM114-Status: GOOD (  12.06  )
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

On 4/26/25 13:58, Nicolin Chen wrote:
> NVIDIA Virtual Command Queue is one of the iommufd users exposing vIOMMU
> features to user space VMs. Its hardware has a strict rule when mapping
> and unmapping multiple global CMDQVs to/from a VM-owned VINTF, requiring
> mappings in ascending order and unmappings in descending order.
> 
> The tegra241-cmdqv driver can apply the rule for a mapping in the LVCMDQ
> allocation handler, however it can't do the same for an unmapping since
> the destroy op returns void.

The key point is that unmapping happens during object destroy. These
depend/undepend helpers ensure a vCMDQ is not destroyed (and therefore
unmapped) before any vCMDQs that depend on it. Do I get it right?

> 
> Add iommufd_vcmdq_depend/undepend() for-driver helpers, allowing LVCMDQ
> allocator to refcount_inc() a sibling LVCMDQ object and LVCMDQ destroyer
> to refcount_dec().
> 
> This is a bit of compromise, because a driver might end up with abusing
> the API that deadlocks the objects. So restrict the API to a dependency
> between two driver-allocated objects of the same type, as iommufd would
> unlikely build any core-level dependency in this case.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

... if that's right,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
baolu

