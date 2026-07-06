Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C028C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcKlOwnSrnU/oFscvKwZVOdP6SI+znawTxOqCfCpP7M=; b=gs9MaHWzt1JWlS3cWgpfCWu6ry
	7NUCuVwgHarSm28btw+ci8jtS9gevF8Y6athF+UpzA6K/TCffXJtxpkRACu58kT0O6houIGpgZYt3
	beWyMB0hB8acjACu5bDauF6mkk7hvv7LK6/mjvmPeAb2PqZpDb7iDRR+4qQRZBjKtvuQGalpEBUqM
	d6XqkCYEuisgtTxd34QFC+XFWCg0CH59sJEruSoyAkNmo9cMXsd6ZXSOSlmmLdD+Gm168EY3bOoVR
	eIj65d6bEP+tdceMz5q1evKgCvZF0H+fUDl7PYlq2puXl2xpufSJuDhCMcb/zab+2TzRjRwIwpuen
	+LWOc/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgncH-0000000DHVJ-0pbF;
	Mon, 06 Jul 2026 18:00:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgncF-0000000DHUS-21Oc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:00:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074C51AED;
	Mon,  6 Jul 2026 11:00:18 -0700 (PDT)
Received: from [10.57.82.104] (unknown [10.57.82.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B128F3F7B4;
	Mon,  6 Jul 2026 11:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783360822; bh=qtDSU5VqrO2YQ6BYD4Wlp4Ajs+FbwG3JDQb1bjgiLDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GI91E1LiIPux5O6odUFhu1WtiDzH712JQz5epv+X3eZxZ5cja6EtsRhh87zdp6UA2
	 p9qb2yNj+03wxh97Q3TbO/+/d13nu4nbKA8o0pObyMkWyLcDx9RgVnMNZYC8YqZtET
	 R1yv91B72mJ/CLVvlwFd0rliojXn8Rdu9IJhJPcc=
Message-ID: <f351b3ce-6488-4b8c-a28a-a3cb0b827750@arm.com>
Date: Mon, 6 Jul 2026 19:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] iommu/arm-smmu-v3: Change how the tlbi describes
 the invalidation
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jean-Philippe Brucker <jpb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>,
 Samiullah Khawaja <skhawaja@google.com>, Mostafa Saleh <smostafa@google.com>
References: <7-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <7-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110023_606945_1666A782 
X-CRM114-Status: GOOD (  20.30  )
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

On 2026-07-06 5:26 pm, Jason Gunthorpe wrote:
[...]
>   /*
> - * Generate a single range TLBI command covering [iova, iova+size). Sets
> + * Compute the TTL hint from leaf/table level bitmaps. 0 ttlt means no hint
> + * invalidate all levels.
> + */
> +static unsigned int arm_smmu_compute_ttl(u8 leaf_bitmap, u8 table_bitmap,
> +					 unsigned int tg)
> +{
> +	int ttl;
> +
> +	if (leaf_bitmap) {
> +		if (is_power_of_2(leaf_bitmap))
> +			ttl = 3 - (int)__ffs(leaf_bitmap);
> +		else
> +			ttl = 0;
> +
> +		if (table_bitmap) {
> +			int table_ttl = 3 - (int)__ffs(table_bitmap) + 1;
> +
> +			/*
> +			 * A RIL invalidation with !leaf_only clears out all
> +			 * table levels above the leaf level ttl only.
> +			 */
> +			if (table_ttl > ttl)
> +				ttl = 0;
> +		}
> +	} else if (table_bitmap) {
> +		ttl = 3 - (int)__ffs(table_bitmap) + 1;

Maybe I'm misunderstanding what table_bitmap represents, but whichever way:
- if this case means purely changes to table (i.e. non-leaf) PTEs 
themselves, then calculating any leaf level is pretty pointless.
- conversely if it means to an invalidate an entire table worth of leaf 
PTEs at once, then L1 tables could contain a mix of both L2 and L3 
leaves, so a single level is not necessarily sufficient.
- at best, if it's the latter but you'd be generating separate 
invalidations for each individual sub-table from the bottom up, such 
that there would only be exactly one table_bitmap level per 
invalidation, isn't that pretty inefficient?

> +	} else {
> +		/* Both bitmaps zero is not allowed */
> +		return 0;
> +	}
> +
> +	/* 16K granule, ARM TTL=1 is reserved (SMMUv3 F.b Section 4.4.1) */
> +	if (tg == 14 && ttl == 1)
> +		return 0;

It's reserved in the absence of LPA2, i.e. when DS=0 (side note, please 
refer to an up-to-date version of the architecture - F.b is pretty old 
by now) because the 16K format can only have L1 block entries when using 
52-bit VA. If between the caller and the code above we can calculate 
that a block entry exists where it cannot, then something is wrong and 
needs fixing properly.

> +	/* ARM levels -1 and 0 cannot be hinted */
> +	if (ttl <= 0 || ttl > 3)
> +		return 0;

Similarly, no format allows blocks at level -1, so again if that check 
ever did anything we'd already have bigger problems. In the remaining 
case, 4KB with 52-bit VA *does* permit blocks at level 0, but it should 
hopefully be obvious why that doesn't need special treatment here either...

Thanks,
Robin.

> +	return ttl;
> +}

