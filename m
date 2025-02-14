Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 05:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tFDb/PDAcFhkJuMfL/FkFDw5DG3Yhwan5HgE/ZkWKk=; b=L6V4LdMxFtvCg8uuFd5uOXtTxI
	IqEsJaKJD92CAhTdrLX8KBkwLqrqQSyoyP+QiRTryiw94RVQ1W3yzJX/vayW/9hxEIwX3UAfNXTYA
	Rn8oAuVe4bOyN0pGlK17kkOTay+Kwpav4d3Qx9Ljr3dNE6D85cqAV1LVl08fN5oXwa5fra58tMqz5
	+YbdTSlxrc3oetPx2Nazt04sPRhpKilr+r6qvd4WYH1kym9cpcNQEGPBoJja8VIiw51eZyvy1SK7u
	QDRcoBLOEA+DTJRoa4+0Y5wwMhFnj/4vQYbFXQXH3jVr7d6bs0/NH3UWm/ptv7BsE83r6RsqanROb
	nz0RygxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tioV1-0000000DjEV-2xWz;
	Fri, 14 Feb 2025 05:44:27 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tioTa-0000000Dj7H-1oGk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 05:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739511778; x=1771047778;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h6p7Y22j2hIaMSGgYnBcUas0+FeWCyvYHlZZIhCytkM=;
  b=PyEbNUjOQVIpHqqlnGUMmkTap2PZxZXgUU4jw2sWUd5H95DGc5aTzgjP
   wkv3fz93yBvlvKOfgRkPpAySrRIo1p/qiEaaEJ8RD5UbSerNnDpMVWrmz
   nO648rrfiPf/NAm7vfgU2mg5I6BRFBZDjAyPIyPMVWz8mIRS7hzNlBZP0
   ETFgWqmz7Ihr7KdZE7hOJSQBf1Z5piIO1x1Y5VuxozohQAGoTlJceC+W8
   eOZz5GSulPjbVHIuGjR6BfeVPKgqsAZiTq23VpEdJpF9b6ph2Xp9xWLHY
   i5fM8jPusnsf+e3rrevhrRjw/BE/Qt/7j0nf0Q3E9MdogM0UYLYVNoqvo
   w==;
X-CSE-ConnectionGUID: /o4SsQgpRXaHCFg3jRY5lA==
X-CSE-MsgGUID: 78vil2TTQQyVn+rfdlKkow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51680986"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51680986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 21:42:53 -0800
X-CSE-ConnectionGUID: HFEGjSazTHyw5Tz92aIw/w==
X-CSE-MsgGUID: RMkJwxJhQSmPkE76rQWIFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118573799"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 21:42:47 -0800
Message-ID: <bc9f4477-7976-4955-85dc-3e05ebe95ead@linux.intel.com>
Date: Fri, 14 Feb 2025 13:39:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, acpica-devel@lists.linux.dev,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Donald Dutile <ddutile@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
 patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <20241112182938.GA172989@nvidia.com>
 <CABQgh9HOHzeRF7JfrXrRAcGB53o29HkW9rnVTf4JefeVWDvzyQ@mail.gmail.com>
 <20241113012359.GB35230@nvidia.com>
 <9df3dd17-375a-4327-b2a8-e9f7690d81b1@linux.intel.com>
 <20241113164316.GL35230@nvidia.com>
 <6ed97a10-853f-429e-8506-94b218050ad3@linux.intel.com>
 <20241115175522.GA35230@nvidia.com> <20250122192622.GA965540@nvidia.com>
 <284dd081-8d53-45ef-ae18-78b0388c98ca@linux.intel.com>
 <f7b6c833-b6c1-4154-9b77-13553e501f2b@linux.intel.com>
 <20250213184317.GB3886819@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250213184317.GB3886819@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_214258_522326_450D281E 
X-CRM114-Status: GOOD (  25.62  )
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

On 2/14/25 02:43, Jason Gunthorpe wrote:
> On Thu, Feb 13, 2025 at 07:57:51PM +0800, Baolu Lu wrote:
>> On 2025/2/5 11:45, Baolu Lu wrote:
>>> On 2025/1/23 3:26, Jason Gunthorpe wrote:
>>>> On Fri, Nov 15, 2024 at 01:55:22PM -0400, Jason Gunthorpe wrote:
>>>>>>> I need your help to remove IOMMU_DEV_FEAT_IOPF from the intel
>>>>>>> driver. I have a patch series that eliminates it from all the other
>>>>>>> drivers, and I wrote a patch to remove FEAT_SVA from intel..
>>>>>> Yes, sure. Let's make this happen in the next cycle.
>>>>>>
>>>>>> FEAT_IOPF could be removed. IOPF manipulation can be handled in the
>>>>>> domain attachment path. A per-device refcount can be implemented. This
>>>>>> count increments with each iopf-capable domain attachment
>>>>>> and decrements
>>>>>> with each detachment. PCI PRI is enabled for the first iopf-capable
>>>>>> domain and disabled when the last one is removed. Probably we can also
>>>>>> solve the PF/VF sharing PRI issue.
>>>>> Here is what I have so far, if you send me a patch for vt-d to move
>>>>> FEAT_IOPF into attach as you describe above (see what I did to arm for
>>>>> example), then I can send it next cycle
>>>>>
>>>>> https://github.com/jgunthorpe/linux/commits/iommu_no_feat/
>>>> Hey Baolu, a reminder on this, lets try for it next cycle?
>>>
>>> Oh, I forgot this. Thanks for the reminding. Sure, let's try to make it
>>> in the next cycle.
>>
>> Hi Jason,
>>
>> I've worked through the entire series. The patches are available here:
>>
>> https://github.com/LuBaolu/intel-iommu/commits/iommu-no-feat-v6.14-rc2
>>
>> Please check if this is the right direction.
> 
> Looks great, and you did all the cleanup stuff too!
> 
> The vt-d flow is a little more complicated than the ARM logic because
> the driver flow is structed differently.
> 
> Do we really want ATS turned on if the only thing attached is an
> IDENTITY domain? That will unnecessarily slow down ATS capable HW.. It
> is functionally OK though.

It depends. The Intel driver uses a simple approach.

When the IOMMU is working in legacy mode, PASID and PRI are not
supported. In this case, ATS will not be enabled if the identity domain
is attached to the device.

When the IOMMU is working in scalable mode, PASID and PRI are supported.
ATS will always be enabled, even if the identity domain is attached to
the device, because the PASID might use PRI, which depends on ATS
functionality. This might not be the best choice, but it is the
simplest and functional.

If any device does not work with the identity domain and ATS enabled,
then we can add a quirk to the driver, as we already have such a
mechanism.

> 
> Also, are there enough ATC flushes around any domain type change? I
> didn't check..

The VT-d specification defines guidance for software to manage caches,
both the IOTLB in the IOMMU and the ATC on the device (Table 28,
Guidance to Software for Invalidations). The driver was written
according to that guidance.

> I feel like we should leave "iommu: Move PRI enablement for VF to
> iommu driver" out for now, every driver needs this check?  AMD
> supports SVA and PRI so it needs it too.

Yes, agreed.

> 
> Do you want to squash those fixup patches and post it?

Yes, sure. Let me post it for further review.

> Thanks,
> Jason

Thanks,
baolu

