Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BFDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI/EBoCa85mw/Z4MXqSMf+49eT1KYWHHQDL6xNlSVc8=; b=xXfk2gZ8YbYe+asHmkOzUXF4mu
	yD7cm+ajrLUDuKlOu/PFfr9n7p9+YdRlLHSRI2wCkR8SEl0ofKVaUzA24exTiW0AglK6/INPP95cT
	S6uVyOndGaZsGedoBaVtHb2qChUaZae+bqF5NxxHyGLBWXeATc9RTEZyuyUP4OsLthhtFd0ttvv+n
	PKgf+AFHXejuEiqoM4G//Ai+OtPbVO93Pcn4S7caMntDhuXDZ3E1ibI8zRbaTjjo9RANEbS/wDpl7
	A4ZYx13dFK0cm2m2jFGMzHfQYNzJW7I/ysKWqG25Td1M3l4jLJmODj+5RPAXFecNQ5snhdlga79OZ
	Lb/qYe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w25-000000033yo-1vak;
	Sun, 27 Apr 2025 07:02:33 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vgi-000000031Xb-21D1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745736029; x=1777272029;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jHRCYwqkDeGnsoQZjCZlk/VB00dZCE9Xt/gFt3+3Ekg=;
  b=HiEDRoEEJt68T4S/kASoKDSrb3P9E7jpXeLzE7/KWdyArGS6lN+MKLH+
   Rwy1++I15gldIUQZgEaWj3MdyeYZFD96NE3vG88ElOwTL/GmbRgiEo1sK
   FIPKLmndus56uqgPrxip3T2QlhVEw8bPi/zvceGHIQ/v8Sbk6mUyjyM26
   FwP6f2m8CxvNEAlgwWVHjBNG6YNhJAvDIOblEr0YsazxnAYodkw5CJBDM
   d2Ivy3mwVFpYYKNZU+FljIva/8WohXo4ac2FpK0+nqIUuI50wfQOOLuYM
   tbkJ1PAIlOTHLay1mgLpo+FIdvWSuHPlAoMUz8TiEBeg5UfzQ7B/8zzvP
   w==;
X-CSE-ConnectionGUID: dWLHFVNcT5er0ecBJ4zO9Q==
X-CSE-MsgGUID: nRUrleonTCm5NWSbtQZzMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47430750"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47430750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:40:28 -0700
X-CSE-ConnectionGUID: WKkjJoVMRdmCZIfMb9eS0Q==
X-CSE-MsgGUID: wDOai0I1Qz+zMkODB65DXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133731606"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:40:22 -0700
Message-ID: <43a93c81-3e7f-46cc-bf93-5e36cbf04b8f@linux.intel.com>
Date: Sun, 27 Apr 2025 14:36:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/22] iommufd/viommu: Allow driver-specific user data
 for a vIOMMU object
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
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_234028_567338_82919DB9 
X-CRM114-Status: UNSURE (   6.23  )
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

On 4/26/25 13:57, Nicolin Chen wrote:
> The new type of vIOMMU for tegra241-cmdqv driver needs a driver-specific
> user data. So, add data_len/uptr to the iommu_viommu_alloc uAPI and pass
> it in via the viommu_alloc iommu op.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

