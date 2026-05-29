Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB8BCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+C7s6vzQaxbGKi6KniUFloe+tWON5edE6gRU7/Ijmw=; b=c3SjLa6WuzfKd51a8NFA2Dtah6
	Z4tZM6q6+T2Sdbsjfjth0SiGMS6Pqtl4hiXN+7A+SlHKrnseGE/WP1jILndxWNX7XYUeWng+Qo1rK
	Sk8aKP9fT9UFS3f/lX5Qk4xDrvfoRiASCoao+XzmYXbTXkL3YWRPKaKi4fYz9l/C440dboyAHtNQ6
	GYyQOTtRYL1lbMslU6d20a33CYCO6YIpAan4/Kes0CCf1hGaZShdB5lpIcok6m1jasa98vosIBeC0
	UouoY0BnqyAyEvlkPp/VcNJ74uKre9DMmu2lT6YbYJhIhGd8kUp4tmDaJkAEVpwX5VXpGbn1nSArD
	+X2aHcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqJr-00000006mpP-0lKs;
	Fri, 29 May 2026 06:03:43 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqJo-00000006mop-1iNO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780034620; x=1811570620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=azyEsUy11K9vnAl2wpTXXwsKzMrJnt5yH0Sb1Ijv/V0=;
  b=ngggiqfxfDHW4dPoYvDLLHSrtEDtOXmazq7T1Oo6p++xqBv6c9/iUoyr
   0JiX/xMcz8ZCZLvzTdMi7vH+VzQ7onU/mq6OI77o7MiusUEt+yqMmqNZl
   lPT8fPI/mQGBovRAyCXva7DiL7Dh/CgLDEolArqsm1BCndsqN38EIN/P7
   M1wurw+gkR1HXR9Wjki1yjC/XHYXch3kENF/iQuC0RbcLq+5EXFoBVSMb
   66NrejcrOIZf/FkYkwzvfOm4tu8VeFs008wDo9fLnSqh7taTcd8C4zrUo
   9rltivuVIjC483NkxTCbTPyPsnDKRlhzQoLoXZGu+H06TctLXVECejBFo
   w==;
X-CSE-ConnectionGUID: sbcfS8R4QZiqMnfWDxrDog==
X-CSE-MsgGUID: fsAAhp7xRVOkXW6vaHWc0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="106333968"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="106333968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:03:40 -0700
X-CSE-ConnectionGUID: 7VA9ccfSQamvHxf8NSJxbg==
X-CSE-MsgGUID: MasJ3534QweKVPiGb6JzFA==
X-ExtLoop1: 1
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:03:35 -0700
Message-ID: <027de4e2-b3a0-4a02-b827-31163388bd6f@linux.intel.com>
Date: Fri, 29 May 2026 14:02:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] PCI/ATS: Ensure pci_ats_supported() is PF-aware
 for VFs
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 David Matlack <dmatlack@google.com>, Samiullah Khawaja
 <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-2-praan@google.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260528202353.3422206-2-praan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_230340_463462_4A4E58CE 
X-CRM114-Status: UNSURE (   9.46  )
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

On 5/29/26 04:23, Pranjal Shrivastava wrote:
> Update pci_ats_supported() to additionally check the associated PF's
> status when called on a VF. This ensures that PF-level quirks and
> untrusted status are correctly propagated to VFs, providing a robust
> support check that aligns with the kernel's PF-centric ATS configuration
> model and is immune to the timing of VF-specific fixups.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Samiullah Khawaja<skhawaja@google.com>
> Reviewed-by: Nicolin Chen<nicolinc@nvidia.com>
> Signed-off-by: Pranjal Shrivastava<praan@google.com>
> ---
>   drivers/pci/ats.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

