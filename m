Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE128C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBgNQNkysdkIvRUIH43WGhbDza2SE7iLOU8HtUhLhmI=; b=ytm0ij9afltwuI05GwRXdwBenK
	b2ZmAmaPnJA0Gmq2BJhUtNZSO9QRWDKgUW4A2GoCmdkweSlSIFiiPYArrgNwTUz0PTnTrgLuOftQA
	uzIwRwBnDTK0NgB/RR2vVyaEcYuYgWXjPLLY83brpDUq9kRSkB3BW8nif9YKt8lWrD/ZF5sCKWLwl
	TCgrrsOqpfEBHx1QRIs8SYlXJnGObwbTEPqPheqci72jXyvvDQNJ41ens2nFHwflbot1ij6iFBH1K
	jqAeDeMbDzY8MzbKDUZ45JY6NlnIOuxgx+OddZ0HWqqQktCzDzDtJIw5U+Qafaq4SF8GXLBgJhkeH
	EH71K+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAAE-00000004abx-3QOe;
	Mon, 16 Jun 2025 13:46:18 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Pe-00000004G0z-0e65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750074846; x=1781610846;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pP5MfHtYu2fbe1zYj4J2fUs/FbilXaL/PP8TBCvNC0M=;
  b=R49KW3ENSsXnNTAqgGB+9AuJqjLhDJfM4z7xAmzdqOkxoyW/KgwA/O5S
   LyL2uPoWQwMPmcWY7zcKDjqo05CeiLGw3owcl67sXpAazuQHbYqeU4vBp
   DgVYE+5dSoE7E/PXn9lHqBlStD8V/R0rGjGdlFBHQ9VFn3ygmz6kuzh/B
   Szw4OtHilGAf+f06IZl9s8Kfy1B3k+vMOoLzyLjjRhfE7dddBwamjqNo7
   Id/Q1wmPt2iDIv+IRtHS2JXfbWGJFBcBeLONfVQY3yiEZI6DjeU/bFP5/
   GG6/MEKud/HBt5ZCvRPDAZczIACFYSf4L2aV7lESMR22AZlviuLkdzx50
   Q==;
X-CSE-ConnectionGUID: d50Z3k+iQc200qAaLQuoIA==
X-CSE-MsgGUID: txT3oBM9ROKDEzKyKwkpFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51323317"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="51323317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:54:04 -0700
X-CSE-ConnectionGUID: 9avOGMS9Tx6HGo/PK5JOTQ==
X-CSE-MsgGUID: ascvokOsSvasnbq8CTB7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148824249"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.243.252]) ([10.124.243.252])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:53:58 -0700
Message-ID: <b60267c2-df8c-4833-a299-62f29004fb6e@linux.intel.com>
Date: Mon, 16 Jun 2025 19:53:55 +0800
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
Subject: Re: [PATCH v6 16/25] iommu: Allow an input type in hw_info op
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <2dc47d6016bf5f6ad6062ad7d84c7220b789b429.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <2dc47d6016bf5f6ad6062ad7d84c7220b789b429.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_045406_217709_F8354C8E 
X-CRM114-Status: UNSURE (   8.99  )
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
> The hw_info uAPI will support a bidirectional data_type field that can be
> used as an input field for user space to request for a specific info data.
> 
> To prepare for the uAPI update, change the iommu layer first:
>   - Add a new IOMMU_HW_INFO_TYPE_DEFAULT as an input, for which driver can
>     output its only (or firstly) supported type
>   - Update the kdoc accordingly
>   - Roll out the type validation in the existing drivers
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

