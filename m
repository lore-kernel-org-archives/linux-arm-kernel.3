Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B24BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZE6+JgzBiol1myilg5SJlHkf4JeTgJLJ4uApKFU3PQ=; b=rP0UfdYoO/rtNoxaf+aBQdwIZm
	6Tj8T/dPqqFA3cgHRgYRRuVKSQUfn8WZK8A8Y3EspNGfgMS9xXr864aa4W2z+01CMrgtndbxwlFza
	s1o6uOY4pgioLF9zWLQ5KVZKJh/w3e3a0/0aaZ5F/RKS7GS3DkiJbsbFWaqbXugzIdwsdTHaaUzb/
	pmktLbUlFQeNAZXmtiRy+h608A5xqXST3mHc+ZK7bBHXwdj5nJKzAIUk3ejwshgCaPdVCkyKEmGN1
	O80jcg3y+gUtdp0LWxgCGmp6+HzLOeoBOymt9ao/gQ1MWrXA5A3Qm0B/TmQJtb5hJAEMBwASiZKOE
	6HbzisXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eI9-00000008WyI-0hzc;
	Tue, 29 Apr 2025 06:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eGE-00000008WUm-0KBK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 06:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jZE6+JgzBiol1myilg5SJlHkf4JeTgJLJ4uApKFU3PQ=; b=aMxzmBHJPtUUb5wyA71sg1HMD+
	M7+/7Das0ryuO+VSwZE/05fQcTOFhab/RfzyMS3uxHqYbhp+pHC1MN72NO6NjvxUOzAvuSIDFn8f6
	0hw4b3cofySFwn/qC74y79LbFi90rBJBenBZzJPxSv6n69PCbvtSc1S04KnM41/o/wisdeRk+Rbvh
	9AbSix7WbX1E8X4jFr6Jshp6JPblR9/yCJogNbyH2umhRMrwv4R8zAQMKKxIZk2X9TYRt6MAPSTdg
	pDVsjHF78HkgtqaJ7jAqFVLv77mKFKbIwtEvCdYNwfJ48U0L496y0BsyNL5qx2iS3JnucQhs1CNHW
	dJNukbkw==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9eG6-0000000DCxy-3ltq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745907359; x=1777443359;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ntheU5Y/cslp1UNyIwy6sjeZIMak9TTFnECtsJY2pH0=;
  b=Rkf/x7iCsKc1sHRnjvW/Msiz1GE415GJc1OQ4ugOLxkOnu/CzkjoaOy7
   pttXzwCwpkNBPeAfWviJk62WeYXZOO9HkHBhhfb4hzfe5Hru6VE3xkt3R
   OKaXuNshDwzL8xnHiicwg/n8ybJzGe2z4KTij6a6NLr5OSSk8tlXCpjnj
   kzb5dHsFpRYe8Q0nhVsyv7KWvQf2BLXYcBbuE7LBcrdAumrVQmrovYZHI
   oPZm/jELk/aODboXDu0HP2pG1YD6iGHMSB7CvZWOCwGTuBkR+mMxzZ1HG
   Mbqfz5Q30wnT8oPkb36xJ5bL/YWA82JgbXYIfOkolXQiK5CgJPpsyJw1J
   Q==;
X-CSE-ConnectionGUID: 3nE/kBIrQeqAByBHG/oDpA==
X-CSE-MsgGUID: 31BrWFh1SmeGfZeeXo6FJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58888019"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58888019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:15:50 -0700
X-CSE-ConnectionGUID: hL/PpME8Qz2SjoN3Tm+rlQ==
X-CSE-MsgGUID: k0NPyEOXRYmpI9s1uLRPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134687731"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:15:44 -0700
Message-ID: <8af1a3c7-d5e6-46ca-a946-5d349e843ed6@linux.intel.com>
Date: Tue, 29 Apr 2025 14:11:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
 bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <dcfd9bfc-44db-4fd8-a49c-0c96c68f6b88@linux.intel.com>
 <aA/P02wgX27/EjBS@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aA/P02wgX27/EjBS@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_071559_494289_034BFA9B 
X-CRM114-Status: GOOD (  11.29  )
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

On 4/29/25 02:58, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 09:32:04AM +0800, Baolu Lu wrote:
>> On 4/26/25 13:58, Nicolin Chen wrote:
>>> +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
>>> +{
>>> +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
>>> +	struct iommufd_viommu *viommu;
>>> +	struct iommufd_vcmdq *vcmdq;
>>> +	struct page **pages;
>>> +	int max_npages, i;
>>> +	dma_addr_t end;
>>> +	int rc;
>>> +
>>> +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
>> I don't follow the check of 'cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT'
>> here. My understanding is that it states that "other values of type are
>> not supported". If so, shouldn't it be,
>>
>> 	if (cmd->flags || cmd->type != IOMMU_VCMDQ_TYPE_DEFAULT)
>>
>> ?
> No. Only other (new) types will be supported. We have this:
> "* @IOMMU_VCMDQ_TYPE_DEFAULT: Reserved for future use"
> which means driver should define a new type.
> 
> We have the same DEFAULT type in vIOMMU/vEVENTQ allocators by
> the way.

Okay, thanks for the explanation.

The iommu driver's callback will return a failure if the type is not
supported. Then it's fine.

Thanks,
baolu

