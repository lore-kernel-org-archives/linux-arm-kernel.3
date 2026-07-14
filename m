Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5612AC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHi1GwCzxxNvjMicFaCHGAYaiV77vS2qpz6P18kV1Z8=; b=sAwtzcIVsJjODgzCFM+jvBdHbF
	CzpmVfbC0qPjvWB+SPff/Fp+p3ijF2U9XOEKOttUGazcdQB9tzJWKn2VxYaBb1kQc/NG3yJSqbURx
	MH9CVJf51HTidV8RAoRcOILUv+RW+rRLdC+uUUSmKKaDOI5RXjZDcOSNTeHu0E3DmGGfjTiYV4jpg
	UIFj7ifpGPKRWJd81f5LQbWqRvR4zrei4vtToJewAqDR1cLEZzxGJrEqrG2ib7/rcykZvfP9rHJ0u
	rjiRZ6Sv9itSwtKVEXytxDK58E0r7z6bteOVx3o9F5G2obQ0YnPGgDuSUmuDdeFO5sRnUdQzeea3Y
	jxSdOMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfVC-0000000CbQp-3fY2;
	Tue, 14 Jul 2026 15:56:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfV9-0000000CbQ8-1a6a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:56:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15AFD339;
	Tue, 14 Jul 2026 08:56:50 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0223F915;
	Tue, 14 Jul 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044614; bh=jlDWHc+QVt9k7HkTB6RbuYA4PZFVH9ssR+9+zo3598c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ab/B3gqkVvxeSWk9m22lT60CDPxipry6LYSeJo0GLLNUbs9fhDIntrVO0Eu6x8Hgb
	 h5xnMvaElwcevH+hvea19kQ3qUVqh4vQ0tItMzcOFYaeLFcnomQj67iUdQiexxoY56
	 jljvdomivta+hgdUgK4J+9LD+PT4oDA5vK/4Rj94=
Message-ID: <0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com>
Date: Tue, 14 Jul 2026 16:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe
 cleanup
To: Pranjal Shrivastava <praan@google.com>, weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <alZCbIIuawpugaQe@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <alZCbIIuawpugaQe@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_085655_470283_9E3AA955 
X-CRM114-Status: GOOD (  19.66  )
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

On 14/07/2026 3:06 pm, Pranjal Shrivastava wrote:
> On Tue, Jul 14, 2026 at 02:09:26PM +0800, weimin xiong wrote:
>> Fix a few IOMMU driver lifetime and error-path issues found while
>> auditing fwnode-based device lookup and probe cleanup paths.
>>
>> The first three patches avoid deriving driver private data after
>> dropping the device reference returned by bus_find_device_by_fwnode().
>> They also make the ARM SMMU v2 and VSI probe paths fail cleanly when the
>> IOMMU lookup fails.
> 
> I'm not sure if that's really needed? All these drivers are doing is
> dropping the "extra" refcount (incremented by calling find_device)  back
> to the state *before* the fwnode function call. If you find that this
> put_device caused the count to drop to 0, I believe that's the real
> problem/bug. These fwnode functions are usually called in probe and the
> refcount shouldn't be 0 inside probe.
> 
> Could you share your observation / failing logs where this fails? Maybe
> something else is wrong with the system?

I don't have any trace of the original patches (thanks, Microsoft...) 
but looking on lore, yes these "lifetime" concerns are spurious; it's 
just a particular situation where due to the API, the drivers are taking 
a slightly roundabout route to look up their own valid device instance.

The IOMMU device must already have at least one held reference from way 
back in its device_initialise(), which will not be released unless and 
until device_unregister() is called (which is probably never for a 
non-hotpluggable platform device once it has been successfully created). 
If someone unregistered a platform device while it still had a driver 
bound, or the IOMMU driver could be unbound without unregistering the 
iommu_device through which its ->of_xlate or ->probe_device could be 
called, so many other things would be blowing up already that this would 
still be irrelevant.

Since 17de3f5fdd35 ("iommu: Retire bus ops") these lookups should also 
never return NULL for the same reasons, so do feel free to clean up 
those redundant checks if it helps make things a bit clearer.

Thanks,
Robin.

