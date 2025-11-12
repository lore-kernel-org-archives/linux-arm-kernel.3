Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A06ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 02:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWZ0E8O3raAG4GU9ztL7P+0ZZdmXPcbV3t4IPw/i5ow=; b=y03TIcb6jXn0Lc6btn9kWGvvGT
	fyjj9eKMnJJsIzJoludF1gai2vTtfbEDhn2TUMV0UOnG3tm6lo6yauLfArcgtiFMi0libiWBCNPVo
	+TNwEvbjsnnlj9WmnYUzIDbZnt6S0g20kd2BtrxZNvdSX/I5gYhjSCk+hYh2Z8nDjbhGHIn6xXG00
	z19O5n3T6k5MaTcny9NwEDg4Oel4hpE+xlLk5FoumZVgmEQUQEo96IsGf8XnUr5Evq9lCmfvzvwif
	mMeUe3Gtb1Dk2iRt9YJp3Z1wRCJ4xnrx756frGyUgMWTeprsfkNybKyo+He19Ttd1E/v+jAw1kcSJ
	5/ojMg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0xb-000000082hX-0i73;
	Wed, 12 Nov 2025 02:51:51 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0xZ-000000082h3-1sb2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 02:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762915910; x=1794451910;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FnjXGdhmi9cjf/H5GCn36qDisNiZcHAbPNAmtaAypr4=;
  b=iA6XY+l9TlZD5zh8ODWzFK2y3hAaomlA5ufP3pbMEp1WZfbE7BkR+SGV
   AwD+UWCF7qbJJ/or7ppxE1jqvCYzr5PDHxAjiCAUGZF+zNFYaZ1hbq7SB
   4SZvZtO8aD3zGRmtRzu4mpKk3xZaFAvyVxy+5WVs98O8VB57yBLQlbJMU
   TBmv0Se9hpoeNPVY/HXuU6Vxhfk8XfsfYF2Sl9KTnv152sGLJlOlRjP0i
   MP3WHGoVyy288AmtKnS7t0Z0Kja7/fICuR4xmPyYZEEX7R/Kd/YO/gVUC
   KhcON1ZZnYQoQP73nIM/GsGIyYJj50lKWTINsnnKCOlS2rERtMP4M717q
   Q==;
X-CSE-ConnectionGUID: h+hAri1OTZKMVQMQsOrWGw==
X-CSE-MsgGUID: EJtVeMR+TXqfb0h/aJUacA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="87605764"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="87605764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 18:51:46 -0800
X-CSE-ConnectionGUID: Z7I0266wRPKqUZSzlavn7g==
X-CSE-MsgGUID: ezqtxvUdTBKU2eF/psZZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189830912"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 18:51:41 -0800
Message-ID: <b556b673-300f-486e-8891-809519b98797@linux.intel.com>
Date: Wed, 12 Nov 2025 10:47:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] iommu: Lock group->mutex in
 iommu_deferred_attach()
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, afael@kernel.org,
 bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, lenb@kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev,
 pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org,
 etzhao1900@gmail.com
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <11b3ab833d717feb41ce23ae6ebdc3af13ea55a7.1762835355.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <11b3ab833d717feb41ce23ae6ebdc3af13ea55a7.1762835355.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_185149_565638_514EC764 
X-CRM114-Status: GOOD (  11.48  )
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
> The iommu_deferred_attach() function invokes __iommu_attach_device(), but
> doesn't hold the group->mutex like other __iommu_attach_device() callers.
> 
> Though there is no pratical bug being triggered so far, it would be better
> to apply the same locking to this __iommu_attach_device(), since the IOMMU
> drivers nowaday are more aware of the group->mutex -- some of them use the
> iommu_group_mutex_assert() function that could be potentially in the path
> of an attach_dev callback function invoked by the __iommu_attach_device().
> 
> Worth mentioning that the iommu_deferred_attach() will soon need to check
> group->resetting_domain that must be locked also.
> 
> Thus, grab the mutex to guard __iommu_attach_device() like other callers.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

