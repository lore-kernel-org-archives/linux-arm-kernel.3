Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A635C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2btTVDYltsgCYavYwVuiOIHeKZyL8Gt5tbLOPUFFJ0=; b=JK3cpTPKWMQA6DR9UcC06srjBX
	Itv/VAw9ZVUtcapv/wOzz6Fjxm0ULf7Psw6gu6L4RVqaFbOQXZRvBbw0nL9zieCKGP6c9K7YDmpd8
	fKDRl1Vr+OZ1pUCRMcO8Ml7BN6QYX9PXuFsrV1aKpe8SDncZu1Rgi2Vb8k5QuQSby+O1hxAWb6mVJ
	Rm7EyQs9iC6LFG3drb96bj7uZTwKMNjKOm1mBZwjATtwR+bFmPfOvyeGY7CKlnwjbwtKO65H26o8W
	kJYwaRI+uaWHDpsdH/zskcBLsKnZTGNJy34KeVp0k7vR4eHl7Fr9qgZjlEmOJC27jqjWn3N6ZFyCZ
	yEF2BILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OdW-00000008doj-3Ing;
	Wed, 23 Sep 2026 15:11:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OdU-00000008doB-1iRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:11:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8C911A32;
	Wed, 23 Sep 2026 08:11:47 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF113F86F;
	Wed, 23 Sep 2026 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176311; bh=0ZF92qlGhBT9ghFKBAdomT/d7B9mUVR6sojJo9EGm84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bOu4yUj0Q/cyKCDPQmnlZSSfBzN2YZFcQ+BYeXIGsn3j2NxCyoWazWfOEchSwBK6z
	 p7crav7v88lmt9BsVnUEIn7iRY066xMU2EuJK+FPQ0L1X2J3RaUrkxZaBNckO20vz+
	 0TW+qGgaK5iTEA87RU/L+SeG35VjqNjOB4ZTOJt0=
Message-ID: <86fb3438-8028-49c5-9b4e-2a0970efb91d@arm.com>
Date: Wed, 23 Sep 2026 16:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Content-Language: en-GB
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
 Marc Zyngier <maz@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Gleixner <tglx@kernel.org>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, Michael Kelley <mhklinux@outlook.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org> <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org> <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org> <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca> <yq5atsng10b2.fsf@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5atsng10b2.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081152_498811_E7FD1B20 
X-CRM114-Status: GOOD (  16.13  )
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

Cc: Michael Kelley
On 23/09/2026 15:58, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
>> On Wed, Sep 23, 2026 at 11:40:36AM +0100, Catalin Marinas wrote:
>>
>>> The simplest is probably to always zero in the backend and ignore
>>> __GFP_ZERO to the allocator. But it's probably only marginally smaller
>>> than passing a CC_SHARED_ZERO flag down. Get codex to try this as well
>>> and compare the diffstat.
>>
>> For patch ordering I would convert to use the allocator first
>>
>> The semantics of the new API should be clear
>>
>> If you pass GFP_ZERO then the resulting allocated memory is zero
>>
>> Otherwise the allocator does Whatever The Arch Needs to not leak
>> private data out.
>>
> 
> ok
> 
>>
>> Once places are converted to the allocator lets go see what is left
>> and ask why it is left and what API it actually needs.
>>
> 
> I'm also considering requiring the address passed to cc_make_shared() to
> be in the linear map. This is currently required by both TDX and CCA,
> while AMD SNP appears to support vmalloc addresses. The only user of
> that vmalloc support is Hyper-V VMBus GPADL setup
> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
> allocator handle this?

This came up in the past and there was a recommendation to alloc shared
pages and vmap them ? I have lost track of it.

Cheers
Suzuki>
> -aneesh


