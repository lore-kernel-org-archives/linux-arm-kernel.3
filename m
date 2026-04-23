Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5CEF9934F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N/L2+ikZHn4X32rSlSgYSmoz0eB4yyIxZPF6Uv2eqA=; b=SENk1IM9ZwTs46M0h8rEaknZHG
	Iijf4R3EkXMzavOubNq3orTeQKa15qnoqA4RWp7u2rUa37XI8DUsCunot2Hs5jkemu5XIxe8+JRHU
	88csWYC5389lEw5HqlLrG2qCTHJug4851Qsxj31v99EsIT7wiB1iiFFaKz0EEq0JwDk4NPfCX2EGr
	F5t+ay7BWn1bpLc0R01P6asLCcDWlZOdt04YUY58b7z7vJIoLUYDJaw3cil/8fNYUxdWQ6A9b9rFq
	FAQuYizxva0r8iHVd0fsXWow427eqUSdt5yDM+eTfFCR7Pq15eGP9B0s7jNzQQ4SuD697X4NiOBbv
	szePyw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFow3-0000000BC0z-2Mth;
	Thu, 23 Apr 2026 07:57:19 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFow0-0000000BC03-397P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776931037; x=1808467037;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CHTAO9l3j2AN2pRGlpx8AfN1p1NSocg7+Jj7C8dbzU0=;
  b=DloRK+LtSmQ4z7QyacWqP9cmK1WY8kPCpGSiexZAfmHt1r4Ku/mxxhaQ
   DZoXv4cy9J8+Lm2uQiyw7cEGjOxSO12u/Ks12Ex1VY9s7wRu477cj0bix
   x21TAPbRbYkaUTPnS91X3LhZIaQlqKxONYMgO8KEs01SrbjawsS3Qx3qd
   4IA65FZAxdsTtmhtcjqoXn1WCo2O98bF0LHXRvJ6g65uxDP65PPePMJ91
   4Yg1WBGxfAJd43ahi2VZYv6ymfL4tLDsnPKAUJGhS0WvCP6tfAJS2v1rS
   gPv71A16uwj8u8N4QHrTp1XGjxBFsSCIC+rniTc6aWmmNJKtBWRb/1tRE
   A==;
X-CSE-ConnectionGUID: 1M5+WaKqT/KDUONMWbqn1Q==
X-CSE-MsgGUID: mD6A5VfOQ5GZu6Equhba1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88975271"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="88975271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 00:57:13 -0700
X-CSE-ConnectionGUID: iwunEYo2TdexK5dTlOoruQ==
X-CSE-MsgGUID: ojBjABX+T/Olmr4XoENCbA==
X-ExtLoop1: 1
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 00:57:07 -0700
Message-ID: <3570e178-f887-45c9-a251-e089915cfbd9@linux.intel.com>
Date: Thu, 23 Apr 2026 15:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] iommu: Defer __iommu_group_free_device() to be
 outside group->mutex
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <3f5d229267d1f4d918641bc5b896f54b5c4b7782.1776381841.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3f5d229267d1f4d918641bc5b896f54b5c4b7782.1776381841.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_005716_839616_91D38831 
X-CRM114-Status: GOOD (  20.40  )
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

On 4/17/26 07:28, Nicolin Chen wrote:
> __iommu_group_remove_device() holds group->mutex across the entire call to
> __iommu_group_free_device() that performs sysfs removals, tracing, and the
> final kfree_rcu(). But in fact, most of these operations don't really need
> the group->mutex.
> 
> The group_device structure will support a work_struct to quarantine broken
> devices asynchronously. The work function must hold group->mutex to safely
> update group state. cancel_work_sync() must be called, to cancel that work
> before freeing the device. But doing so under group->mutex would deadlock
> if the worker is already running and waiting to acquire the same lock.
> 
> Separate the assertion from __iommu_group_free_device() to another helper
> __iommu_group_empty_assert_owner_cnt().
> 
> Defer the __iommu_group_free_device() until the mutex is released.
> 
> This is a preparatory refactor with no functional change.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 35 +++++++++++++++++++++++------------
>   1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index d1be62a07904a..810e7b94a1ae2 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -627,6 +627,19 @@ static struct iommu_domain *pasid_array_entry_to_domain(void *entry)
>   
>   DEFINE_MUTEX(iommu_probe_device_lock);
>   
> +static void __iommu_group_empty_assert_owner_cnt(struct iommu_group *group)
> +{
> +	lockdep_assert_held(&group->mutex);
> +	/*
> +	 * If the group has become empty then ownership must have been
> +	 * released, and the current domain must be set back to NULL or
> +	 * the default domain.
> +	 */

Nit: this comment doesn't quite match the following code. The code
doesn't check "group->domain != NULL". Or perhaps in that case,
group->default_domain must be NULL?

Furthermore, if a device is currently quarantined, group->domain will be
the blocking_domain. If that quarantined device is then hot-removed and
happens to be the last device in the group, will this WARN_ON trigger
unnecessarily?

> +	if (list_empty(&group->devices))
> +		WARN_ON(group->owner_cnt ||
> +			group->domain != group->default_domain);
> +}
> +
>   static int __iommu_probe_device(struct device *dev, struct list_head *group_list)
>   {
>   	struct iommu_group *group;

Thanks,
baolu

