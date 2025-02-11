Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE971C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtfIRgmKdHXBX2jHBR6VNelO+BS8OSJAtJhqy0GIj2w=; b=po8T/fsXrRABYW88TyM5HzpaEs
	FP6yZkHhZkGHsw3IkQkOTnb1zm94B7lGdFWie8RRw/DkIua91Xrvv6FZMh/M6AGCDnzfgcR/90lwG
	weCV1Pdalf0vCJ3P1G/rLH/DgoL7NqC0RRb68HstRcsUq5Dh/6y+5qH854JRpOBhMij6c7qDYCtCs
	fKF0EEozGpkeUTMxJhjwIzZ7oQo1f5FTCVsnVjKa+xvVStXkQ5FjLCWLqyeMCU/xNFz/b48dWZW2U
	sLFYqEphlkAypA2COkJ10D3tF+bc8jaTzk9nySlYwNnwigoM2onvOz1/UDKZAuTgSghUEx/l3HJxg
	UN4ToPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thx4Z-00000005EXF-3i1z;
	Tue, 11 Feb 2025 20:41:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thx0M-00000005Dod-0eGK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 20:37:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAEEF1D14;
	Tue, 11 Feb 2025 12:37:34 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27A223F5A1;
	Tue, 11 Feb 2025 12:37:10 -0800 (PST)
Message-ID: <c4c54243-d25b-45d7-97d5-837d02cfa2dd@arm.com>
Date: Tue, 11 Feb 2025 20:37:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iommu/dart: Set DMA domain for locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-3-5d97fe247f35@rosenzweig.io>
 <1d6b3fe7-9376-422b-a2e6-ebaed7b6cd75@arm.com> <Z6uZhQtPAE8Ck_b0@blossom>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z6uZhQtPAE8Ck_b0@blossom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_123714_249198_C41B403C 
X-CRM114-Status: GOOD (  11.30  )
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

On 2025-02-11 6:40 pm, Alyssa Rosenzweig wrote:
> Hi Robin,
> 
>>> This is required.
>>
>> Now that we can, I'd really rather do this properly and not offer an
>> identity domain in the first place when it's not available.
> 
> I'm reading through iommu.c but I don't see a way to avoid offering an
> identity domain without the DMA override here, just reading through the
> logic of iommu_get_default_domain_type. Could you point me to what you
> have in mind?

Since we finished cleaning up the domain allocation paths, it's finally 
safe to have per-instance ops, so you can mix and match some with an 
identity domain and some without, as s390 will be doing[1].

Cheers,
Robin.

[1] 
https://lore.kernel.org/linux-iommu/20250207205335.473946-5-mjrosato@linux.ibm.com/

> Thanks,
> Alyssa
> 
>>> --- a/drivers/iommu/apple-dart.c
>>> +++ b/drivers/iommu/apple-dart.c
>>> @@ -941,6 +941,8 @@ static int apple_dart_def_domain_type(struct device *dev)
>>>    		return IOMMU_DOMAIN_IDENTITY;
>>>    	if (!cfg->stream_maps[0].dart->supports_bypass)
>>>    		return IOMMU_DOMAIN_DMA;
>>> +	if (cfg->stream_maps[0].dart->locked)
>>> +		return IOMMU_DOMAIN_DMA;
>>>    	return 0;
>>>    }
>>>
>>


