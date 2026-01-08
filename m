Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7A9D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOQBKk81S8h1/nSWX5U0qv0qhBq19QitTyPg5HzTKEk=; b=Iu9ttENlndyPLRZb/giFX5yFpf
	14ER2BsKlm4RO9SYoFfNwbZMRBa85S0KXduRxOfsmkyhqPWEl3VfsFihAHn0Fq6M6SvdQ8ZxEj3Uq
	oSa4obq5Z6o5neC2yxv9xwOa0bpA3n+yPNsEMjuU6AhPT/eVfbaf6Jtwh0EHzGv6mLETciBBelZ6J
	yEjoq128+3lhxnUYvg3bJYOd1v1T7K8Yl0SQCWHMYf9nRR4qRZWX2iAG3C/6zap/hbdr65wTjW1bT
	MFYNNWmX1YUoOkq7voKw6/eGP4FYb0sTo39B90b8j6/HQBMV7qEeXlKG1XDghVjI22wPqYs5S3FJD
	bEqK82Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt5A-00000000BR6-3BnY;
	Thu, 08 Jan 2026 16:41:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt58-00000000BOf-1Fyh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:41:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63214497;
	Thu,  8 Jan 2026 08:41:44 -0800 (PST)
Received: from [10.1.29.34] (010265703453.cambridge.arm.com [10.1.29.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 744FC3F5A1;
	Thu,  8 Jan 2026 08:41:49 -0800 (PST)
Message-ID: <a0fd155b-67fc-45a4-8510-01f89681d6fa@arm.com>
Date: Thu, 8 Jan 2026 16:41:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Lucas Wei <lucaswei@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 sjadavani@google.com, kernel test robot <lkp@intel.com>,
 stable@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, smostafa@google.com, jgg@nvidia.com
References: <20251229033621.996546-1-lucaswei@google.com>
 <87o6ndduye.wl-maz@kernel.org> <aV6K7QnUa7jDpKw-@willie-the-truck>
 <7cd7b4f0-7aa5-4ca0-adc6-44d968c1ed48@arm.com>
 <aV_KqiaDf9-2NcxH@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aV_KqiaDf9-2NcxH@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_084154_473029_7886EFA8 
X-CRM114-Status: GOOD (  23.69  )
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

On 2026-01-08 3:18 pm, Will Deacon wrote:
> On Wed, Jan 07, 2026 at 05:55:40PM +0000, Robin Murphy wrote:
>> On 2026-01-07 4:33 pm, Will Deacon wrote:
>>> On Thu, Jan 01, 2026 at 06:55:05PM +0000, Marc Zyngier wrote:
>>>> The other elephant in the room is virtualisation: how does a guest
>>>> performing CMOs deals with this? How does it discover the that the
>>>> host is broken? I also don't see any attempt to make KVM handle the
>>>> erratum on behalf of the guest...
>>>
>>> A guest shouldn't have to worry about the problem, as it only affects
>>> clean to PoC for non-coherent DMA agents that reside downstream of the
>>> SLC in the interconnect. Since VFIO doesn't permit assigning
>>> non-coherent devices to a guest, guests shouldn't ever need to push
>>> writes that far (and FWB would cause bigger problems if that was
>>> something we wanted to support)
>>>
>>> +Mostafa to keep me honest on the VFIO front.
>>
>> I don't think we actually prevent non-coherent devices being assigned, we
>> just rely on the IOMMU supporting IOMMU_CAP_CACHE_COHERENCY. Thus if there's
>> an I/O-coherent SMMU then it could end up being permitted, however I would
>> hope that either the affected devices are not behind such an SMMU, or at
>> least that if the SMMU imposes cacheable attributes then that prevents
>> traffic from taking the back-door path to RAM.
> 
> I think IOMMU_CAP_CACHE_COHERENCY is supposed to indicate whether or not
> the endpoint devices are coherent (i.e. whether IOMMU_CACHE makes sense)
> but it's true that, for the SMMU, we tie this to the coherency of the
> SMMU itself so it is a bit sketchy. There's an interesting thread between
> Mostafa and Jason about it:
> 
> https://lore.kernel.org/all/ZtHhdj6RAKACBCUG@google.com/

The point is that if there's a coherent interconnect downstream of the 
SMMU - which we infer from the SMMU's own coherency - then we should be 
able to make the *output* of SMMU translation coherent, regardless of 
what the incoming attributes from the device are. In the IORT terms, CPM 
is really what matters for IOMMU_CACHE, not DACS.

> But, that aside, FWB throws a pretty big spanner in the works if we want
> to assign non-coherent devices.

If you mean having FWB on the CPU *without* also having it on the SMMU, 
then yes, there are various ways that could be problematic even with 
nominally-coherent devices. S2FWB on the SMMU, however, is *almost* the 
magic bullet that makes things fine for VFIO in general, except for the 
annoying mis-step that it's not guaranteed to override PCIe No Snoop 
(hopefully that might get fixed in future, but we'll still have today's 
implementations that do have the not-particularly-useful behaviour.)

This may be straying a bit far off $SUBJECT though - do we know if the 
affected devices in this case are behind a coherent SMMU, and how things 
work for IWB-OWB-ISh output attributes if so?

Thanks,
Robin.

