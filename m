Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE56C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmgbtBFnT6AA+Q7NcZmDD+JKMCB8XgSToJV0LU2/5vk=; b=E3Bdz1cu48WUbhnFUkSAd6sgKx
	qmBGZqDQdwrdHBvowog8pLVnpmKQrFh9ocDAUsRe/8PjOQUBYWsRLY98kYQI/L03MXM2ApscBVZxm
	PiJvNO/DMXo0TguujwQ8w5C6GlLTMubNtaTFg09ihOWH5pxe/TeWZHlgcfntIx7vpqLgZTu1qsdiX
	TfS42w2B9V+5ENMLQc2PKGS6uJv5CUmpbI3gj+LNSGp3qG7HeonsZu1uPCantMsCpA/oGyXlr3Qvt
	ggRaaYBdQ458eM+vAssMzjfsui5KlFkpu6cSUo+dKmQU+TqrxOWfwX1ROLfOLMdSi6Wecv3NZN+Yj
	pM43j85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0eR-00000003GzY-1l7O;
	Mon, 16 Jun 2025 03:36:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0TV-00000003FQS-3R6j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044334; x=1781580334;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jZ0hXk7/0POkfoovE7h6rCUu2FvCYd02o4Psw04apZ4=;
  b=TSVRnbLcNinmg0ot++Ccgvga2Mw6W92I7k94wELVD4l9fMz6pefTtWAH
   x8nxhDTAh0EMDJn3+as2Glltwuw71kh1Lclbyq0rLHtTtygZCuJrftIUD
   UYOsWPYxhJpigQFMhtOC3qtWH0ETHYxogUDRrvD2mNhel47edeIZuLWu3
   34VkxlR2AHe2Cex0naLIWIJGf1KAT+qcF3M3eyF9V28VJN352gCRsaV0r
   jOCO1jmXk3hwZ8v1qd850PfmfFE7pyz7x5NfP6I/tgtid0SQJ8fDEoFrS
   7W+KxvJD5JR3g1lT5bKAvuF/p0oeDUkwQKLD1mObtmaSXyKgllJuExMGz
   w==;
X-CSE-ConnectionGUID: zcwqNztuRlqYx2WSx0jAUw==
X-CSE-MsgGUID: wM4hIEP0TBWcK0Vi1BsOQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62449432"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62449432"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:25:33 -0700
X-CSE-ConnectionGUID: uGKXemABSzCHxhRvxLMldQ==
X-CSE-MsgGUID: 2VqEThBvQeukd4nM1Yqg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148205608"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:25:30 -0700
Message-ID: <6e7aa7c7-942a-4600-8496-7b5d1bd259c3@linux.intel.com>
Date: Mon, 16 Jun 2025 11:24:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] iommufd: Use enum iommu_viommu_type for type in
 struct iommufd_viommu
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <6c6ba5c0cd381594f17ae74355872d78d7a022c0.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6c6ba5c0cd381594f17ae74355872d78d7a022c0.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202533_900382_AF7EAE92 
X-CRM114-Status: UNSURE (   5.25  )
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
> Replace unsigned init, to make it clear. No functional changes.
> 
> The viommu_alloc iommu op will be deprecated, so don't change that.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

