Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B175C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbrucRTCdM2HK7qty0OXlUfhe/SdfR5u8q6VURFx+5U=; b=oJDsBceKxd+r8NSyrfZa52lQsj
	AgLk0o8RzHX0GDeiZlzHA3UlUuHCDEjPNjV6Jy9DMMfRsk8sTzk0OXrd/CwBUSxfLFeDwQKzt8bqY
	ByMzy+32iSedPhAGfjHSQ6/WJYvcVBj8RXUT7L7m6yJzf70/xRB8sbDRWfR9t4jiSizaKCIPY0AaJ
	lJjfBha0O9pWEH3KmIIh1505CatTIsChmGXbsQ+9S7uwm1v2nWIxSq3HXoNQTZir9Tm9EOPTSj1nm
	OQxGOhDFHdkbCQx2xsMn6Zv+uo5UEvLJhxRHv2/bfbgWF3QlzwAmP8DbSyKEVwcttb0zUdeeACluf
	SJFVcChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2986-0000000HabF-3FLz;
	Thu, 03 Sep 2026 15:13:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2983-0000000Haa0-1Pob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:13:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4CA1596;
	Thu,  3 Sep 2026 08:13:20 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D3613F7D8;
	Thu,  3 Sep 2026 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788448404; bh=57j47RyZeNUjgjXsnOt5hbGdiXiuODI5u3NMZr+QVkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJGrtaLeOoudxOSt6YMXpLod14VkO5FrCtOCsE2Dn8K58P/B81zn9hbERHErZ3jeR
	 8WjlLFYel7f7Nzl+7B1xo8+I5RRJUOn5yL8rQTfD6QbnGGXlvB2Y6ENK7T4FbjAMSN
	 Itb4FzT/1cl3e5v34OcabChJ7cxRRhnfL/UHKLq8=
Message-ID: <39c8cec6-002f-456e-9e5e-7af2158047fa@arm.com>
Date: Thu, 3 Sep 2026 16:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
To: Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jonathan Cameron <jic23@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Pranjal Shrivastava <praan@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Samuel Ortiz <sameo@rivosinc.com>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
References: <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com> <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org> <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org> <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org> <20260902193014.GF2890729@ziepe.ca>
 <yq5abjaezyxl.fsf@kernel.org> <20260903144729.GJ2890729@ziepe.ca>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260903144729.GJ2890729@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_081327_418225_12A1E17D 
X-CRM114-Status: GOOD (  13.19  )
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

On 03/09/2026 15:47, Jason Gunthorpe wrote:
> On Thu, Sep 03, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
>>> Do you mean the SMMUv3 driver triggers RD creation? That feels
>>> wrong. Did you mean the VMM just does it earlier?
>>
>> Currently, CCA creates the realm lazily as part of another operation.
>> Realm creation is triggered by kvm_arm_rmi_populate() or
>> kvm_arch_vcpu_run_pid_change()
> 
> Okay, that's not what I would have guessed. But critically is there
> some way for userspace to specify any realm creation parameters (like
> rpv, ats_plane and so one) prior to the lazy creation?

There would be, eventually. Based on the feedback from KVM arm64
maintainers, we are trying to keep the ABI as generic as possible as the
normal VMs. Thus, for now we have not included the Realm specific
parameter configuration (which was present in the earlier versions)
in the latest version of the KVM support.

We have some ideas on how to do the configuration step. e.g. for MEC,
see the following thread :

https://lore.kernel.org/all/46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com/


> 
> Why lazy? Why not just have userspace provide the creation parameters
> and create the RD right then?

Cheers
Suzuki

> 
> Jason


