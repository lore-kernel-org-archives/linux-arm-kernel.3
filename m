Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366EDF34C45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTZmv4hKvATZEtLFq22XyF/LcSuQagnaf3weRPP0x+Y=; b=PI941qP+EQowpMhQn0+3HEgb4X
	p1KmxtPhJCPN/zsXuMB2w/WYamRFtJdWc0tdHp4zxsXmr1kOP9TAjZRt4BTQtclCeuB7nLBIOV6ux
	BDYLmJQVAVKxAuKCWBdU5QV/IneXrqZcMYyb0Vsairs2IViPwlSNjBRAgCOjyuThEmkA1f1nJKcA9
	s2DM3fvYlmcAQ0biCkJxkWkHEFGggXX+M2eZQsRlue8MlDf3Nf7gNJvXVYeRpC8NexPJyXmB6YoEE
	VH71Nwa25BC5wHnbZEsEKBORu6Cy27BWndq2OlWHzVmxprg82Rz2vrl+0fJW/CPrzdim4zxrLZbsD
	bxTZ9+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6i2-0000000CXrs-32C3;
	Fri, 24 Apr 2026 02:56:02 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6hz-0000000CXrG-2av7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776999360; x=1808535360;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pZDuDeaZoj7O1LubWx5vw5Buq2BjiWMeU3DeyutW5QQ=;
  b=ei1IdjMOG3K9HZwsZ4WRAK3a6PKnD3pRkCgjdI/khQhF5uqPnsoLnHsR
   RkuPmGVebjAfHsUSPtvg7fzapsbw30FBgfR9HfEVYV8/cZk4liW5nZgxV
   jW9ZNZEO0FeLY3Z7inYSyvNHWVc/h6iEhr2VD2t36ia3Gg91ptu7KOmVI
   2jNjBWnw751idLyAGcMMwxr0JNAwkMvXb34hDfUoiprBOSKrjAN1BP6AV
   UsSNjmg97WCBmPnWiKXaJKApC2OHqnDz3RS0vnLEO/9TfPXmIXIhi3/eG
   9hMGJtexQFZH13sTx7hVMGRrtxz2dt9ywmvMciiEFVsDmBSHEzZmZQXYs
   A==;
X-CSE-ConnectionGUID: lgW6hdKpTgu04ZaovZRTFg==
X-CSE-MsgGUID: ttrG/bm3QhGd3bL9zVPDKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65511059"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="65511059"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:55:59 -0700
X-CSE-ConnectionGUID: uP9vfrh5TES/laj0y+LAEg==
X-CSE-MsgGUID: 2db0jdZfQsqaiY8zHzQvsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="237184547"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:55:55 -0700
Message-ID: <779dad61-d7e7-4ae0-83a9-8c5920222219@linux.intel.com>
Date: Fri, 24 Apr 2026 10:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] iommu: Change group->devices to RCU-protected
 list
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
 <12a224061de4fff9e0725909fd0ba4e14996ff08.1776381841.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <12a224061de4fff9e0725909fd0ba4e14996ff08.1776381841.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_195559_729479_7E49BFE4 
X-CRM114-Status: GOOD (  13.05  )
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
> To allow lockless iterations of the group->devices list in an ISR context
> that cannot hold the group->mutex, change the list to be RCU protected.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 768ac728b4cc3..d1be62a07904a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -84,18 +84,20 @@ struct group_device {
>   	 */
>   	bool blocked;
>   	unsigned int reset_depth;
> +	struct rcu_head rcu;
>   };
>   
>   /* Iterate over each struct group_device in a struct iommu_group */
>   #define for_each_group_device(group, pos) \
> -	list_for_each_entry(pos, &(group)->devices, list)
> +	list_for_each_entry_rcu(pos, &(group)->devices, list, \
> +				lockdep_is_held(&(group)->mutex))

for_each_group_device() is used in bus_iommu_probe() without holding
either the mutex or the rcu lock:

static int bus_iommu_probe(const struct bus_type *bus)
{
         struct iommu_group *group, *next;
         LIST_HEAD(group_list);
         int ret;

[-- cut for short --]
	    mutex_unlock(&group->mutex);
             /*
              * FIXME: Mis-locked because the ops->probe_finalize() 
call-back
              * of some IOMMU drivers calls arm_iommu_attach_device() which
              * in-turn might call back into IOMMU core code, where it tries
              * to take group->mutex, resulting in a deadlock.
              */
              for_each_group_device(group, gdev)
                         iommu_group_do_probe_finalize(gdev->dev);
         }

         return 0;
}

Will the change above trigger a lockdep splat due to this "mis-locked"
case?"

Thanks,
baolu

