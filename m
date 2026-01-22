Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9213C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yc0a8PWb9mctHhnhvkrqQTqLqxJyQxYacnbEY305YYs=; b=aI+tQii7gFKu4xd5nBOcsfUrjn
	ebMeIW8RMQ1IO8h5eGTkVJx50IPi+G8/ArBtCyXTtGa/ItUYcXOtCAxvpQtK29Q4BylTCv4AM2ny2
	clV2TxYVbtd6feKshO7BJUwZ4LCvppW5k68uL67u+iqEJXdcBnJ7Vj6WoTh9et2rzd2vmKFdsHJ1B
	IdxQKfWC8gqEDFm/OIg3y/aLnKTWFBvprnYqaSFpWV1LII6LRqSD2M4Yz8VBV8NCGNCSH9AtUtVDo
	6GZFyfHJVNS2IykL9kaGSlSAcT5hvnByFtDayhJWPRQxL+di8u/ve0uB3Rb0MJ9OyV04T8/S1rRTM
	2xHRXn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijKU-00000006F84-33Ch;
	Thu, 22 Jan 2026 01:17:48 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijKR-00000006F7Z-33OI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 01:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769044664; x=1800580664;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X/ZqB3F3uxrlq5fnYhJF9YmflnuXgYbIuIyXLKPZrBg=;
  b=G/q5pk2AHxmsFjCEYTrv4lY5ahdfNLm/kwUVxKJDO4fycHAuCf+J4FT9
   uldKSmgyp2FxbZK7Jz9pNEtnYHflRuHAh4ZUpl6R0/lZy2EymqHIQQrt2
   gb51LtSJ5PgGhH9TvQ7/mz1PQ6WzMaNpHnf6n66DoDijXDq2uZZBHAaSq
   LljQZ79LbpgoSsTOhvJyABDIgFxNWhpvaZjPJsmXlNEzNmwzHXUXi91us
   P2EyHvzqHTJwjrM5aYOjy2W+CV1j0speDR+VK6ooyOZRKJgRhzdW4ie2s
   Pa8+KVHA6fy8QNCMzMXMc0GQx4mKiPSgbExcBXUvqA6fCdV9s7/26/hbJ
   w==;
X-CSE-ConnectionGUID: I+0WVbI1SYGypLLNzISwsg==
X-CSE-MsgGUID: 3upN/59OSiGI+gkIxB4+aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69480626"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="69480626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:17:38 -0800
X-CSE-ConnectionGUID: TRMk+zZkTl2jUQY/JKcenQ==
X-CSE-MsgGUID: dNgfp8zFQiqosj5IRWLZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211449798"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:17:34 -0800
Message-ID: <fa3e55e1-3cf4-4b73-8b5e-192a19a18f3b@linux.intel.com>
Date: Thu, 22 Jan 2026 09:17:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
To: Jason Gunthorpe <jgg@nvidia.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "praan@google.com" <praan@google.com>,
 "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 linux-cxl@vger.kernel.org
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <d1768bb6384050a23769f20ca28216f520f77e26.1768624181.git.nicolinc@nvidia.com>
 <BL1PR11MB5271F0BDC68C2D7F172122E98C96A@BL1PR11MB5271.namprd11.prod.outlook.com>
 <20260121100307.00004e60@huawei.com> <20260121130315.GE1134360@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260121130315.GE1134360@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_171743_799109_8231BBE2 
X-CRM114-Status: GOOD (  13.53  )
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

On 1/21/26 21:03, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 10:03:07AM +0000, Jonathan Cameron wrote:
>> On Wed, 21 Jan 2026 08:01:36 +0000
>> "Tian, Kevin"<kevin.tian@intel.com> wrote:
>>
>>> +Dan. I recalled an offline discussion in which he raised concern on
>>> having the kernel blindly enable ATS for cxl.cache device instead of
>>> creating a knob for admin to configure from userspace (in case
>>> security is viewed more important than functionality, upon allowing
>>> DMA to read data out of CPU caches)...
>>>
>> +CC Linux-cxl
> A cxl.cache device supporting ATS will automatically enable ATS today
> if the kernel option to enable translation is set.
> 
> Even if the device is marked untrusted by the PCI layer (eg an
> external port).

I don't follow here. The untrusted check is now in pci_ats_supported():

/**
  * pci_ats_supported - check if the device can use ATS
  * @dev: the PCI device
  *
  * Returns true if the device supports ATS and is allowed to use it, false
  * otherwise.
  */
bool pci_ats_supported(struct pci_dev *dev)
{
         if (!dev->ats_cap)
                 return false;

         return (dev->untrusted == 0);
}
EXPORT_SYMBOL_GPL(pci_ats_supported);

The iommu drivers (intel/amd/arm-smmuv3) all call pci_ats_supported()
before enabling ATS on a device. Anything I missed?

> 
> Yes this is effectively a security issue, but it is not really a CXL
> specific problem.
> 
> We might perfer to not enable ATS for untrusted devices and then fail to
> load drivers for "ats always on" cases.
> 
> Or maybe we can enable one of the ATS security features someday,
> though I wonder if those work for CXL..

Thanks,
baolu

