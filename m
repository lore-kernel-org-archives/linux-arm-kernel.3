Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD52C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=831bW0ZIu5iMm8ZEx/erB9COclEY/Bg9NMz7u5yRRHA=; b=oQFObZE4axwpf+VShRFfcxwlBE
	6OtWkFRGAGyYPU6MNQON85Tag80eleipoCA0XbbwjK1OH6btNA8NUFURaRnojO24srqbxCPfm6DME
	5Clr1JWBw/P/FvEUBC+7g+Sc7mEd69pzkiVA/al5UzLQA2YkTMBBT6SCIGIuDrVRk2Yg3keqA+mpt
	Nx2ylejUHjorbg/zNDGVAzVoBgbNPTY5tqh6vfMQb27b0jDa+2t3KcQiRfZoPbqs5fq1Mvkog7vHJ
	WexWwc658qRv2/KdEYuWhqAImQ1Kt/wovlOwX6dKE2dnMZ3hZcms2+XE2brYdveYVtaF+BPxdn5OF
	deWhX0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR49h-00000003cdy-3NTP;
	Mon, 16 Jun 2025 07:21:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR41M-00000003bTy-1S8U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750057965; x=1781593965;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xacBKMgmFTMZBZEnYG/hW2BtKPaY7xU5btWyaSE3iwY=;
  b=CDg+dkOhbfqY7TtzNt12dHZ3ELBr6kszN7GmbxTuD/ShEPSHGIo2lsTp
   izH7WJvClOp43UkEspY8dLHCcRmQjyviggnebL7yFCdoBHj+lONWurh85
   2lUydU6xa8Ajida/0gMMAnOsbl+wQHDQYtNfWaNrVz/qrGX8Z9oJIP2hn
   pED3Mrd6MU3JHIblYpddgv5efy1lUFBAs08snjTUuVyIhJ8asJbNsaXxr
   XL6LZSlCTl//e9ilwAnLo1UYYVSb4HCNwRE+XL8VJoKohk3shel8NO9Q3
   /GnE5Ehh7kU5jgd27tDUZpPJS1jJ87pc5Z0pZUdPCkPg6bnimjeEMiVCH
   Q==;
X-CSE-ConnectionGUID: sHBNktQjRbaCMlVc6PEw+w==
X-CSE-MsgGUID: AnMpD0jtR1m27/dXs4qW9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55866592"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="55866592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 00:12:44 -0700
X-CSE-ConnectionGUID: HjGOjZ05Sou9BY7TtQfcPA==
X-CSE-MsgGUID: /QmppINgRhqjZEZzCyDuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148290800"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 00:12:37 -0700
Message-ID: <8b57d3fb-bc0c-4ab6-8a53-22d93718b422@linux.intel.com>
Date: Mon, 16 Jun 2025 15:11:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/25] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
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
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com, dwmw2@infradead.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <7dfb002613f224f57a069d27e7bf2b306b0a5ba0.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7dfb002613f224f57a069d27e7bf2b306b0a5ba0.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_001244_426615_5C7A7648 
X-CRM114-Status: UNSURE (   8.56  )
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

On 6/14/25 15:14, Nicolin Chen wrote:
> Introduce a new IOMMUFD_CMD_HW_QUEUE_ALLOC ioctl for user space to allocate
> a HW QUEUE object for a vIOMMU specific HW-accelerated queue, e.g.:
>   - NVIDIA's Virtual Command Queue
>   - AMD vIOMMU's Command Buffer, Event Log Buffers, and PPR Log Buffers
> 
> Since this is introduced with NVIDIA's VCMDQs that access the guest memory
> in the physical address space, add an iommufd_hw_queue_alloc_phys() helper
> that will create an access object to the queue memory in the IOAS, to avoid
> the mappings of the guest memory from being unmapped, during the life cycle
> of the HW queue object.
> 
> Reviewed-by: Pranjal Shrivastava<praan@google.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

