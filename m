Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A40C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kls9Aeh3ft2h2p7XC+gtGs+6aohVBMrr1+4HHRXk/ks=; b=a8u97UZTjimhykgP9mafFZ4iDb
	Y4uDkx8L4sxOjXXj+h16+6eBOmhcHbjYvlpVo3B2aAZrae+RXdfww9QF/GJG8nmTMDTR5SEtoY4LO
	3hDwQap1wutw7PKEyqtgUZ7K8WTqSdu+H70iO7dcZWLJIpZQW+vQ8PRPo2ksYzzvbx8oPdxH8uCCF
	0kfJxx3kUoq5yws5vLQ8b/QOWe5DVjzelfr3Lvnqdqq6SHYoZlznKg7/LDHAl9KlYkKGMr74GxRtT
	mbn7r+eC4xmpZbsK/OMLxWuqS2OlxcfdQBIXqJOPauXiG346SJ8TqsB/YI5SyfofPfFdc2hEdQH1+
	N28t6EvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AvN-00000006nbS-2dql;
	Wed, 23 Sep 2026 00:33:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AvL-00000006nb3-1t6G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 00:33:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 223E51576;
	Tue, 22 Sep 2026 17:33:18 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2AE63F86C;
	Tue, 22 Sep 2026 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790123601; bh=77i3zYEPqhl4Ykq7WhP+J7mIM1DnI3AO6zla9d0ZiPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oRgWkLcQ31WqXE0HZzy2oda8oXCF5KyAJJ1hOCVglmH0esN1QobUgRqjxsKQ0rnUF
	 HcEHi0aN57b3J02f+zBZVVZvI20ki3Y3HdxMh4KN/vl1I33mR4KWfrvwABIFz7re3G
	 vAjp9bLwL/VO4cIRYlc8jfWw+ejPv0v1LHN4Olh4=
Message-ID: <19c4acf0-bc5a-4856-96c7-bf19c2d989e7@arm.com>
Date: Wed, 23 Sep 2026 01:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Content-Language: en-GB
To: Jason Gunthorpe <jgg@ziepe.ca>, Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
 Marc Zyngier <maz@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Gleixner <tglx@kernel.org>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org> <arKsFofudnTYpXj1@arm.com>
 <20260922165147.GD1540250@ziepe.ca>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922165147.GD1540250@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_173323_531110_57A53356 
X-CRM114-Status: GOOD (  10.43  )
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

On 22/09/2026 17:51, Jason Gunthorpe wrote:
> On Tue, Sep 22, 2026 at 05:25:58PM +0100, Catalin Marinas wrote:
>> Does the memset() post sharing logic work for pKVM as well? If nothing
>> clears it, we have a small window where guest data is leaked to the
>> host.
> 
> Same question for RMM? Or did they define that the RMM zeros on these
> transitions?

RMM doesn't "define" what exactly is written when a granule is 
transitioned to "DELEGATED" or "UNDELEGATED". But does guarantee that 
the contents are wiped after the transition. This may be:
  * RMM writing random bytes or 0s
  * Changing the MEC of the location.

See section A2.3.8 Granule wiping DEN0137 2.0-bet3

Cheers

Suzuki

