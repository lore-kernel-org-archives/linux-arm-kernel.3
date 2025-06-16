Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56964C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3+C3aGBDM4ZiCGi3OPRPCrJ99TfIZsadVB6b7jLTpQ=; b=bmttR5kuV0ZhAEphOuZYPJrqmc
	oXpeM0Dz30Dz3iHx2R3dTtbUzlieRs6uPaU4ZjVPjjvYrFFOBGOocVehsvgrUuCagNxPs/PG3j4hC
	cCaWbLwytTZQPWZlWQJeaiNAqe2NGdplUMGICNYz4U6IYld8ONJq2QvfnF+PIamsMcZP/0PCZXHOY
	QahED53I9rFqTIKwDTeS5P4mYFQO1pLFDTHFNX+qXmLQsmaAv2H4phvUzPxAZKKxiX9SkbjQJF+L5
	8yO9qG8G69xox6fxYbdqgy+u1IK4IUOFTBQbCuSrUI0snBEJor/dtu5j8tZ+vBSYckiTbA++v+7XQ
	x5OIjM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0rT-00000003IIB-1nAJ;
	Mon, 16 Jun 2025 03:50:19 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0VR-00000003FmM-2Yza
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044454; x=1781580454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uxMcnxSah9aMa+8ILzcDP7SuWEBEsRK+BQxyFazc45c=;
  b=HTxSnDObrO2b97s2B+tpqDNxzpKWI2bA6LNZDkQX0sdaiMuQM8IOQtG+
   9lG3Tev+J7cSDkKGMc9lkVAQtayE7m4uqIRgsSkj7umy7VmjwkU13MQUl
   Wk29LeQLKEqT6ENPZOwmsjxLubhq/OYtcneiaNtruXf+URQs0MY75Ic3S
   0BBr6gPV71CBaisyab0wCSn/6yKUHON64P42LqzkdtpoqVGDxFTRVekcx
   snko8d3OftpmYfu3IU2WL1opbYE9o4IwU2pRLROXNvyc37Rt6DcSD0GY7
   MQKH5LsOn6raFgGlGeYk484pvZMqaIFdIKsNZNJOlB6/e0cIBLNeUcwKg
   w==;
X-CSE-ConnectionGUID: 9V3oLMRLSjy9QzOqD3tjgQ==
X-CSE-MsgGUID: qmlFmFjkRUCzCXvHEP6T+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52269779"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52269779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:27:34 -0700
X-CSE-ConnectionGUID: JpviFFLOTQCsk9oYDhWIPA==
X-CSE-MsgGUID: keVs2t7JTn6iHxc8oobEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149262496"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:27:30 -0700
Message-ID: <8471eefd-bb69-4734-a1ba-772788d07d96@linux.intel.com>
Date: Mon, 16 Jun 2025 11:26:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] iommu: Deprecate viommu_alloc op
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <5b32d4499d7ed02a63e57a293c11b642d226ef8d.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5b32d4499d7ed02a63e57a293c11b642d226ef8d.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202733_691790_D1D029B3 
X-CRM114-Status: UNSURE (   6.89  )
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
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced. Now, those existing vIOMMU supported drivers implemented
> these two ops, replacing the viommu_alloc one. So, there is no use of it.
> 
> Remove it from the headers and the viommu core.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

