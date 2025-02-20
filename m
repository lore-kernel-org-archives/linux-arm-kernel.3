Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9B2C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1vBCwB7OE+opxKo+nVWLuPz3mqwX64sxUGjPyjQtt8=; b=g2tTHaTU7diAoqgfrgeCZDZy5W
	XYYJrdJ3hp/sDXrR/IJvHrwmLNz361BKGZcmLXGAOxlOiLB/0R9IRMJyC7l8MAK7yrO/KA3jrViA5
	gdwSPVq49dHWAth+o7KJhZ5tgoxjLkAYGOAVf3Ox93zlXX4h+UeXUyIIW+ZTudPIAHOjyMZMPtYo1
	oxBiYUULOH8TflYxJCqXWhv1AUEdpw3SUNjKyB5jstS5fq4fDi7pKLKypM0IerN/M4iCN3kqNPTmk
	603SNFMzr1tDo50FwRm/5eOKTaDnanb0ZlLons/8fbGJait+EqG5Q9QoawOF5E0SDvHzEl2agkxGf
	XQ+I7xDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkw66-0000000GIM0-3wTJ;
	Thu, 20 Feb 2025 02:15:30 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkw4T-0000000GHsr-1KGP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 02:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740017629; x=1771553629;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GBvD2bkSH/pQf3oXkciwQpaE+MUdAMS3a6Cb1EoRnIs=;
  b=RdwIvTo10Io7wls3PVnE8sn1iKWZ4B1csTTpUs9dRsfusIez+FAFeVaA
   i/m1JSJ8sR0Qji7H7HHgq/QpMmxAYZunPXsdupZ1PMVPWwhjNrm8XioP2
   7T/kjjd263lT6YVqxfr4rUnUIXO5vM+v2VrEpxN5eZVjHDWpx32n50KFA
   En3KAkp7UnmfObVwq3P4Dwg/d2Z+CJE8fWCXnwTxNFor6s0cqXAqPlYUR
   ynESh1PKBBsp36eFVrPx9QIzPpPFN29eau9IJ9MoFZLsWEKSr1iUlf2HW
   nOIxRTBcQJQiCLIYY0P/Lx/h58xtckg65I1k6HRHQwyYo7BVh9Are2h9R
   Q==;
X-CSE-ConnectionGUID: Hj8aKTMiTg2exKyyxH7TAg==
X-CSE-MsgGUID: cidT03hERL+zOdHVms3V2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51424641"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="51424641"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:13:47 -0800
X-CSE-ConnectionGUID: dxxRzlLRTLidTKr9odiFmQ==
X-CSE-MsgGUID: 05003GDaRq+1FPxr5vBMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="119995677"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:13:41 -0800
Message-ID: <7027fb3a-dfb4-40ae-ac9c-5ea1dcd57746@linux.intel.com>
Date: Thu, 20 Feb 2025 10:10:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>,
 "acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Joerg Roedel <joro@8bytes.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Len Brown <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Moore, Robert" <robert.moore@intel.com>, Robin Murphy
 <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Donald Dutile <ddutile@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <20241113164316.GL35230@nvidia.com>
 <6ed97a10-853f-429e-8506-94b218050ad3@linux.intel.com>
 <20241115175522.GA35230@nvidia.com> <20250122192622.GA965540@nvidia.com>
 <284dd081-8d53-45ef-ae18-78b0388c98ca@linux.intel.com>
 <f7b6c833-b6c1-4154-9b77-13553e501f2b@linux.intel.com>
 <20250213184317.GB3886819@nvidia.com>
 <bc9f4477-7976-4955-85dc-3e05ebe95ead@linux.intel.com>
 <20250214124150.GF3886819@nvidia.com>
 <58e7fbee-6688-4a49-8b7a-f0e81e6562db@linux.intel.com>
 <20250218130333.GA4099685@nvidia.com>
 <f7e30bd8-ae1f-42fe-a8a6-2b448a474044@linux.intel.com>
 <BN9PR11MB5276EAD07C3B32517D339DF28CC52@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB5276EAD07C3B32517D339DF28CC52@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_181349_368983_39F47092 
X-CRM114-Status: GOOD (  17.80  )
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

On 2/19/25 16:34, Tian, Kevin wrote:
>> From: Baolu Lu <baolu.lu@linux.intel.com>
>> Sent: Wednesday, February 19, 2025 10:10 AM
>>
>> On 2/18/25 21:03, Jason Gunthorpe wrote:
>>> On Sat, Feb 15, 2025 at 05:53:13PM +0800, Baolu Lu wrote:
>>>> On 2/14/25 20:41, Jason Gunthorpe wrote:
>>>>> On Fri, Feb 14, 2025 at 01:39:52PM +0800, Baolu Lu wrote:
>>>>>
>>>>>> When the IOMMU is working in scalable mode, PASID and PRI are
>> supported.
>>>>>> ATS will always be enabled, even if the identity domain is attached to
>>>>>> the device, because the PASID might use PRI, which depends on ATS
>>>>>> functionality. This might not be the best choice, but it is the
>>>>>> simplest and functional.
>>>>> The arm driver keeps track of things and enables ATS when PASIDs are
>>>>> present
>>>> I am not aware of any VT-d hardware implementation that supports
>>>> scalable mode but not PASID. If there were one, it would be worthwhile
>>>> to add an optimization to avoid enabling ATS during probe if PASID is
>>>> not supported.
>>> I mean domains attached to PASIDs that need PRI/ATS/etc
>>
>> Yeah, that's a better solution. The PCI PRI/ATS features are only
>> enabled when a domain that requires them is attached to it. I will
>> consider it in the Intel driver later.
>>
> 
> I didn't get the connection here. ATS can run w/o PASID per PCIe
> spec. Why do we want to add a dependency on PASID here?

It's due to PRI, which depends on ATS. The original topic is: when an
identity domain is attached to the device and the device has no PASID
support, then ATS might be disabled because ATS isn't supposed to
provide much benefit in this case. Otherwise, ATS should be enabled
because:

- It benefits performance when the domain is a paging domain.
- A domain attached to a PASID might use PRI, thus requiring ATS to be
   on.

The proposed solution is to use a reference count for ATS enablement,
similar to how we handle iopf in another series. ATS is enabled as long
as any domain requires it and disabled if no domain requires it.

Hope it explains.

Thanks,
baolu

