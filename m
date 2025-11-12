Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF3BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qn+Cb0gx5gkj2p9agjvyDOCKILiuBM0X9nJUJGpN5Og=; b=HQ1H99/lQsL0hYpPnSJPNsC0U6
	h5LMYe1D/aGdc3KJlojILwq4nYHytWPtm8nLmeAj1yGLeECtE4bvpsMsHEXkt/BhYR5mUO4i41JcB
	8sZ2ToHh0kKlpu2AY/eChHbJ//0Lc4CFzDSL1Z8s0OTOaCKekDkpnrvS/jXyxeDWurxDeH+KSXauf
	OmRGA3zJr/zE4qm16SRrUCqCqJe1wS5eNUXkgsm0wMyEb3+BWsfguQwkpztdxrlZARfEbMY2k61ab
	u8OoJVMpangvuYZrc1y9tTpF09l/Tj+judwaRmVb44OrMSkDCN/lcldtYIkbAqjNIwUvJ9JghG9fd
	PmTAohmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ3NY-000000089mT-3kAR;
	Wed, 12 Nov 2025 05:26:48 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ3NW-000000089m6-3tOG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 05:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762925207; x=1794461207;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J2yCx8gANXEoEptcoVy/jvxBGR0sLdZaZJNtdCJDhDQ=;
  b=GR4sf/i8clilDqWjTYfeDd4ea82vZZHUmjIDI+wgr3f6lal7CpIRJs1O
   FQgTfFkEIWI8u30FqDC6LG1sUkvcnhRL82y3Tt6YJqIUX2hVx1NXeP1Do
   tt2UulGruDSI9RA8MdeYxNooH0QCGAlEA3JyjdJlTW0gvb/JGM/fINTQi
   PVqDG234r1h3qCnRXtPZ7tH1lCM1k1URSgE1gTRWgzUyOeocgfstOUsHt
   U087hPtn1DNTTF1nP1LHmKJwJZEZDTq4h1a2fmp7KgCiRnjTW56hJB6q0
   5iBL/LnCFROqOG4gw7muya2YzAv085agn4sNYaZCWBr+laBZQlYXfvf7v
   w==;
X-CSE-ConnectionGUID: GAbpg6tpQsag9dD06r+qZQ==
X-CSE-MsgGUID: DjEz4SenRoSrGB3kEJcfew==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76331298"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="76331298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:26:45 -0800
X-CSE-ConnectionGUID: 2KuqqVv9TuS5cZ/Ryocc5Q==
X-CSE-MsgGUID: jYiQEfIURoe/1ab0ampM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189381942"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:26:41 -0800
Message-ID: <f6e4ca74-2b76-4662-97eb-a1c5eab62c9a@linux.intel.com>
Date: Wed, 12 Nov 2025 13:22:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] iommu: Tiny domain for iommu_setup_dma_ops()
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, afael@kernel.org,
 bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, lenb@kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev,
 pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org,
 etzhao1900@gmail.com
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <431cccb8279eb84376c641981f57e9ceece8febf.1762835355.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <431cccb8279eb84376c641981f57e9ceece8febf.1762835355.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_212646_980211_BFA3C42A 
X-CRM114-Status: UNSURE (   9.95  )
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

On 11/11/25 13:12, Nicolin Chen wrote:
> This function can only be called on the default_domain. Trivally pass it
> in. In all three existing cases, the default domain was just attached to
> the device.
> 
> This avoids iommu_setup_dma_ops() calling iommu_get_domain_for_dev() the
> that will be used by external callers.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.h | 5 +++--
>   drivers/iommu/dma-iommu.c | 4 +---
>   drivers/iommu/iommu.c     | 6 +++---
>   3 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

