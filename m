Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B4BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 02:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4dOu00QBkrvIlSABtaObxkMy1PBjMvwydaerJNjvtQ=; b=h6SWlCuC/MzBzVy4NH1yaN9F07
	be17luE52wbm6rFoNoxSRNnaIbTwqrCQBhI7GYh2XdS5qr1fyyYzIaDyj7D5rwDxT823Y71Hri1j7
	zcNlD917MkLG6Xm25FfTeiLtuwmBOqpp5CsSyFHOxp3lkHjYmWp3R7za++Ja333wzfzT90oyo+C2p
	wc/SThjyP5s7Ykb+HNOr4ceOAQXENOcw1j4oM7x5a03Ebj2KdCVC8Rvw92GMJBbREzG3kfXy/uu+m
	kUaiTZDN6j8U0vg+WqcdBZN7CTYgHC8wPiXyTgmDu1b+9otDXQXNzrGihagLznJ2uABqHi3XjW8+K
	MvUh2tOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZbR-0000000Acu3-3fC9;
	Wed, 19 Feb 2025 02:14:21 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZZy-0000000AcmA-3Y7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 02:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739931171; x=1771467171;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L4dOu00QBkrvIlSABtaObxkMy1PBjMvwydaerJNjvtQ=;
  b=ao+eK4geGGTaj5mfGpU969GquADRt+nklcWLpve/NGN80jsKiYcrahiZ
   t5ok+bB7o3EI1eM/5Ak8z/mJti/CMyo4LtHIhQEjwrpV/Ye+jMVvHKYbo
   PXinoH5d6aT0n2AmhOPWNi/mAeQH5q7sGpP5vytOr6ZqbOd0ofNf8CwRO
   IkcXT2fi7fGf/B3Z5vkyoMjTBBt8MKfmPgP05RG2SZxBZ+HvynIONE3Mv
   8GigM7113mw4Y8kCEglrU6+OlgCzPhKWpUxoNaIkxWQcGL1bpHPMM0LQj
   io4u5mQY/R9FtdlGj/CyN3WJHu0ph8k/5wKElgGtPbfR6BbSU/zEcVyb9
   Q==;
X-CSE-ConnectionGUID: 2s/R9Q8ZSzSczzrie3Q3Sg==
X-CSE-MsgGUID: Up+JvpTtTreaMEq44SGa5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40780150"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40780150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:12:49 -0800
X-CSE-ConnectionGUID: wdkQ11ldTpOd1cV+PafJ1g==
X-CSE-MsgGUID: LjO0SyJ3SR+0TUso89+tqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="115096578"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:12:42 -0800
Message-ID: <f7e30bd8-ae1f-42fe-a8a6-2b448a474044@linux.intel.com>
Date: Wed, 19 Feb 2025 10:09:39 +0800
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
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250218130333.GA4099685@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_181250_962678_1DC2EB90 
X-CRM114-Status: GOOD (  16.47  )
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

On 2/18/25 21:03, Jason Gunthorpe wrote:
> On Sat, Feb 15, 2025 at 05:53:13PM +0800, Baolu Lu wrote:
>> On 2/14/25 20:41, Jason Gunthorpe wrote:
>>> On Fri, Feb 14, 2025 at 01:39:52PM +0800, Baolu Lu wrote:
>>>
>>>> When the IOMMU is working in scalable mode, PASID and PRI are supported.
>>>> ATS will always be enabled, even if the identity domain is attached to
>>>> the device, because the PASID might use PRI, which depends on ATS
>>>> functionality. This might not be the best choice, but it is the
>>>> simplest and functional.
>>> The arm driver keeps track of things and enables ATS when PASIDs are
>>> present
>> I am not aware of any VT-d hardware implementation that supports
>> scalable mode but not PASID. If there were one, it would be worthwhile
>> to add an optimization to avoid enabling ATS during probe if PASID is
>> not supported.
> I mean domains attached to PASIDs that need PRI/ATS/etc

Yeah, that's a better solution. The PCI PRI/ATS features are only
enabled when a domain that requires them is attached to it. I will
consider it in the Intel driver later.

>>> Although, I'm wondering now, that check should be on the SVA paths as
>>> well as the iommufd path..
>> That appears to be a fix.
> Does SVA have the same issue?

One case I can think of is SVA on SR-IOV VFs. Without the in-progress
iopf refcount patch series, enabling and disabling iopf could be
problematic, because all PRI enablement is switched in the PF, it's
possible that enable and disable operations won't be paired correctly.

Another issue is that a failure or invalid page group response may halt
the PRI interface, which would cause SVA on other VFs to stop working.

So, we should probably disable SVA on VFs for now and re-enable it after
all these issues are resolved.

Thanks,
baolu

