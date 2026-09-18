Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4CDC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 05:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmlV7xFHRVTdsb3n+oqHHiehmNTVMleq48/Xf23jFaU=; b=Bqwl8dIzh3AlLs7vHXnxPw9lM6
	DyW2kL7qBK+U8/wu1pt/K7phVXa6zKk+ulwMbo7spAm5ItT9pkrjjzs+7zF0xsO7W/jbg5lhG3AdQ
	bgUeaPiYumWPNTeRtTfdz4Kq/qZ0ZlSCE+ixhIy6QMVJm9w51C2NkTPrt9Yy0Om+J36dTixUH/NDC
	eqXu4HJM0oFb4SGM5+1QsLcaoX9t8J9cJpkjomiMFI1FD1D95Agn1BL6LsqxWm6YDMr1Run5iuHvK
	H3L8CvkI5qcmmU1K9t+RDWAMkaV4Pa/xAsuecnoH99lrNyUyS5D0R8xY9mATpQBu70zlRN1+hLU8A
	5E/8DxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RY6-0000000DWIr-3Lts;
	Fri, 18 Sep 2026 05:54:14 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RY4-0000000DWIU-09kY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 05:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789710852; x=1821246852;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lmlV7xFHRVTdsb3n+oqHHiehmNTVMleq48/Xf23jFaU=;
  b=dT2qWyi/C2/dfpPyqRAvrLoTFhsEfilnIzU2WhU3F/QSL52ILY+sReFt
   5S/1zk4YOEQeHTvvE5OrgGVhqSsC97SjcylqJhumYEerrHTLX0La2Vl6x
   nzI3HXXTX7B8iyAJZ63Px7xjaKY72BK97PE9Tlzu50xLNBKikUwFfq/rP
   GJ/YdoS6rMF3OqAHT6Xn5g4rFJe2iynxL5ZEUHc/NFuIXIW86H4/S5oF3
   MI37r5zWA2zkZ0yHzlZ1YW/GPPUXuGd6BUFXo7yi1Sf8mTuyFBdMmPl62
   9NqknRpLE4lgrp+r8MW8mjIHWwTnMlpzE5vjCEpLKVsLWYvY04d+ubWHw
   Q==;
X-CSE-ConnectionGUID: hEI68ttTRS+pebVvuxq/tw==
X-CSE-MsgGUID: uQ2Xr839R+OnjnlNF/R6/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90326550"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90326550"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:54:10 -0700
X-CSE-ConnectionGUID: KgABx0ZsR3iY4fYq/tVq2Q==
X-CSE-MsgGUID: GZcbDF/7SxSIjyTZ91er0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2628589"
Received: from unknown (HELO [10.238.1.188]) ([10.238.1.188])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:54:05 -0700
Message-ID: <2ba47d98-21b5-40de-9df0-be6676ade064@linux.intel.com>
Date: Fri, 18 Sep 2026 13:54:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Nicolin Chen <nicolinc@nvidia.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexey Kardashevskiy <aik@amd.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Ortiz <sameo@rivosinc.com>,
 Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Will Deacon <will@kernel.org>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
To: Jason Gunthorpe <jgg@ziepe.ca>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20260903171704.GK2890729@ziepe.ca> <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca> <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260910124632.GB4083318@ziepe.ca>
 <CO1PR11MB4835FF972283C09D7D683DAE8CBA2@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260915134318.GB3196566@ziepe.ca>
 <CO1PR11MB4835562E7714F368E669D3B48CB92@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260916123954.GC3196566@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260916123954.GC3196566@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_225412_114631_C424DC39 
X-CRM114-Status: GOOD (  16.05  )
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

On 9/16/2026 8:39 PM, Jason Gunthorpe wrote:
> On Wed, Sep 16, 2026 at 05:54:57AM +0000, Tian, Kevin wrote:
>>> At least for ARM there is effectively no entanglement with the actual
>>> host iommu driver. The viommu is entirely provided by software in the
>>> RMM world, so it can have its own dedicated driver. In ARM T=1
>>> transactions are alwayus routed to the RMM's iommu and there is no
>>> relation to the host.
>>>
>>> I am interested how Intel works here, but I thought it was similar.
>> Largely yes. Main difference at Intel side is that TDX still relies on the
>> host to initiate iotlb invalidation (upon notification from KVM on S-EPT
>> change). Currently we put this logic in intel-iommu driver but it's more
>> about wrapping invalidation info and passing it to the firmware. Moving
>> it into the tsm driver should be straightforward.
>>
>> Maybe there'll be other subtle connections to host iommu driver but
>> it doesn't sound a hard problem to solve.
> Okay, so I saw the driver posting for basic iommu support, can we try
> to rework that to be split out like Aneesh is doing so everything
> about TDX calls lives in tsm and intel iommu only provides a small API
> surface to exchange whatever details are needed to bootstrap TDX
> module?

Are you referring to this series?

https://lore.kernel.org/linux-iommu/20260915074235.1219183-1-baolu.lu@linux.intel.com/

It initializes the iommu managed by the secure world (the TDX module).

I’m happy to rework it as you suggested by moving most of the TDX-
related code into the tsm driver and leaving the host iommu driver to
provide only the necessary assistance.

Thanks,
baolu

