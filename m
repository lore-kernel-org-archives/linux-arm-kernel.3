Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D215CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 02:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL9N9FZKYsI0IxcENZTVJVJ8WKutQPTMG7isYoCulJA=; b=Vdm5micbZltXTOr8xIc3z1+xwL
	t0lOQslUGxiAZsryz4u5RpauzEhWSqESr5r3Fl9UVsY2ERE/B0jlVWJlRyrF66tv6Iwcg0Pbih8yE
	jA+M45qu0tMwPilv3tkVs+M6FObJUhUfsoZmt2rDIpJVqQlg0zpc2dZ/oDHXdxEbAnsu/57cRJYNy
	z+9+V87d8AuJaPugB1wCcqzBGgkk4LyJ88RgYj43z2OLoqhU+sezpqC6Y5H0x923sl5xSu/S85bSV
	gBOkYwCnqTnUB6fb4RUSRgD20yiBM2r1Zp0qs1M1oDmWYPCXarM4BvAXuIrhI4JH9E1QK/3v8At6Y
	GrM/Rrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUy5j-0000000G3ve-2haP;
	Thu, 04 Jun 2026 02:45:55 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUy5g-0000000G3vE-1UEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 02:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780541152; x=1812077152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zwaEOC72aj4r75+dKErQgCh/I2UYQPGFQIzWi9Bh55Y=;
  b=H6PbYS+2WUXDPHcdkqTQm36F3v+RvICfIwCcMJT01RbHc5RM4ujxnP8n
   lOyQNr/ikOVmHFE5puMG1hdbZFhhnuaVDEXyfe4b88sRqnYHkXKMVLsDP
   bCtgxViwQjf7ZfSmfyMc1PJnDQIxi5nDkEcsDzQpmId19VNBYIqnkrZpR
   fajg/laqSTCm1hosR+NKSw54bK44lH8F6ENx+KILGifnYBRu1LPkrtazI
   DyeblSEv3/yhHNXZNFnD2wRjNF7Nmjeb7n5Lwm6dQwDbYYq7geCmfVbax
   EvsN8PAs6Jv6NnIxxa0e8yIv1uvhSFAXsvVYZYSRhlJUaS8ugkd1Xz1L4
   Q==;
X-CSE-ConnectionGUID: vfmD7wT/Tme84Nv4XmvYMw==
X-CSE-MsgGUID: 654G2OjOS+WrGdAY4UaKsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81394980"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81394980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 19:45:49 -0700
X-CSE-ConnectionGUID: S4I3acvjTca0y7rBk61R5g==
X-CSE-MsgGUID: OCypOtVWTQWlA8M8EeXAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="244260671"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 19:45:43 -0700
Message-ID: <633995b3-f534-49ef-9bb5-2ebebfc2d443@linux.intel.com>
Date: Thu, 4 Jun 2026 10:44:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/32] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>, jgg@ziepe.ca
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
 alikernel-developer@linux.alibaba.com, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, dwmw2@infradead.org, iommu@lists.linux.dev,
 joro@8bytes.org, kevin.tian@intel.com, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 oliver.yang@linux.alibaba.com, robh@kernel.org, robin.murphy@arm.com,
 shiyu.zsq@linux.alibaba.com, steven.price@arm.com,
 suravee.suthikulpanit@amd.com, tzimmermann@suse.de,
 wei.guo.simon@linux.alibaba.com, will@kernel.org, xlpang@linux.alibaba.com
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-2-guanghuifeng@linux.alibaba.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260603151804.1963871-2-guanghuifeng@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_194552_412855_31B82311 
X-CRM114-Status: UNSURE (   8.26  )
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

On 6/3/26 23:17, Guanghui Feng wrote:
> Add iova_to_phys_length callback to struct iommu_domain_ops alongside
> the existing iova_to_phys. The new callback returns both the physical
> address and the PTE mapping page size in a single page table walk.
> 
> Add iommu_iova_to_phys_length() core function that:
> - Checks ops->iova_to_phys_length first (preferred path)
> - Falls back to ops->iova_to_phys for unmigrated drivers
> 
> This enables callers like VFIO to efficiently traverse IOVA space
> by actual mapping granularity instead of fixed PAGE_SIZE steps.
> 
> Signed-off-by: Guanghui Feng<guanghuifeng@linux.alibaba.com>
> Acked-by: Shiqiang Zhang<shiyu.zsq@linux.alibaba.com>
> Acked-by: Simon Guo<wei.guo.simon@linux.alibaba.com>
> ---
>   drivers/iommu/iommu.c | 50 ++++++++++++++++++++++++++++++++++++++-----
>   include/linux/iommu.h |  9 ++++++++
>   2 files changed, 54 insertions(+), 5 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

