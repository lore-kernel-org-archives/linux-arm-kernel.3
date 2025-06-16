Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070DC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVcfn3UF/rYqT8xPNtGs0uC8KV9nnG6u+I9Adx1RxA8=; b=UsoLL14pLXR1aEqkPtkicJibWp
	KFlKWWyxHTqsLpG9uNl7EU/DAcswc4BaB836J8LozrnDx0OdGyYykNwC/Xpv2isg3HJpGX2FyV23n
	dbdt368gY8oqngB468QqqRt+b0vaww2JP+TvEAwCkU/DlzKNES67Tg/Bs7awAmOhDuEu7rSIi/Noc
	b18u/1xLBhm5zMaKFGfL3MQWqgja2cHvQtW4Cis0n/TjDOgsVr4yrXHSEmD7Zit38TFr9c+vnZOky
	i16eOeukfWWhJ2MJDzTj9JtnsCLZW1axJAjRXJuWpfMrJN7FMLDp2H3VX/qrNdeqntv5znlTCCNxU
	6mmsXb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0n6-00000003HeB-2QMH;
	Mon, 16 Jun 2025 03:45:48 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0V0-00000003FgY-3FxS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044427; x=1781580427;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1isUaEkxKU+8NxNIgj+a8p6XetQvHlnDJA/2nRl2Hr0=;
  b=DVZF7ygTYgVcLI9SPesP4S2lA6mnLleoS0dWRC8/hUrA6AxEpfvXRbsQ
   wRrWsy6MzwhpAX9tp43sAvj9PXqilHXwBstpa9e/CCffsCgc5x0VREQ7v
   n8Hhn9nb3I2AR59EsSudcEterSWewnFWfb3ASzCgjPSKfuwRoQ5USTb8O
   F4CKXWNRN0jZypt1OGudFBlWwLmOM6V6dhZHYOapjqk3i3qxnfTm2WQOo
   NAhmgKcCAXhky/Nuxf6pdjiqUFcAUx1tZfOclmlFU6rCM9sgoaW0iNDDG
   cLnkS79w2D07zF0Vrie6o1loxoPlJRAhAy1VKRXkCHbEyCbG6YZVC8tvU
   A==;
X-CSE-ConnectionGUID: sT5F10B9TACqjlVFohEmqQ==
X-CSE-MsgGUID: Dga/9LMeRH2ENOwEDYLXfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51889586"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="51889586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:27:07 -0700
X-CSE-ConnectionGUID: 7R/1QlLuSl2G/90d2tiIow==
X-CSE-MsgGUID: 4y/8BpBJQVO/uJ9JS7qrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149229879"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:27:02 -0700
Message-ID: <8ed1d728-084b-42f7-9c15-8c97f565b555@linux.intel.com>
Date: Mon, 16 Jun 2025 11:26:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] iommufd/viommu: Support get_viommu_size and
 viommu_init ops
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <35c5fa5926be45bda82f5fc87545cd3180ad4c9c.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <35c5fa5926be45bda82f5fc87545cd3180ad4c9c.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202706_905236_2ADAC168 
X-CRM114-Status: UNSURE (   9.77  )
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
> are introduced to replace the viommu_init op.
> 
> Let the new viommu_init pathway coexist with the old viommu_alloc one.
> 
> Since the viommu_alloc op and its pathway will be soon deprecated, try to
> minimize the code difference between them by adding a tentative jump tag.
> 
> Note that this fails a !viommu->ops case from now on with a WARN_ON_ONCE
> since a vIOMMU is expected to support an alloc_domain_nested op for now,
> or some sort of a viommu op in the foreseeable future. This WARN_ON_ONCE
> can be lifted, if some day there is a use case wanting !viommu->ops.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

