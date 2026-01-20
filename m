Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8471FD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckuKSI0PY7j5Kx+daqp9ZCvmp52mk3NBXwCBfd8ol6E=; b=zAXrxXBXkcD+iFAB6Ga1Iaood4
	fID6sl72Q5Y0bEdPqxWKGu/pcCXdi0lUJtRvViXBBLBsqfYGTz5mPEOoFIOxaeASLzjLgRSIzl2hp
	Hqj8N3mPBUBybwklOfsKWl2P+bt8Ay9nHJKk27gseNKQ8ulRC0qTeH52xuoHBkJcV71BVTpSGOv5d
	XV50pholRbU5xHrfawxYnw4yXweIsSTiTrbHmcnDf0rsGj2lLiUAwHMsvTQVQKxTal9B6H6JTs56b
	ExLEQS9PiJbmH6VKMizRGT4vUXDkZUpQnFQ+98FybwpWLSMdpup9wDxtvr33XatX0q+iqUOCupeGC
	VJ9z4rWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAdH-00000003nkK-3gFl;
	Tue, 20 Jan 2026 12:14:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAdF-00000003nje-2f1w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC6B6403DD;
	Tue, 20 Jan 2026 12:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF6EC19422;
	Tue, 20 Jan 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911288;
	bh=IiflnQDxJs4RPcYs3sxwTdyuyK0ue/FTAVFF6cNAICg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWlHrxNgWqnpPI+Z1vQZLBDmUo9Wlf6vxXq2teccxfLdid4tvBzqGTD3v3/gM1S0b
	 dMOL8fE7uBhRCT7Q8arm/7M9dWP2JUPE2sztXWnIIm/s2m1Ibl0ceuwf3oeKpHeh7L
	 wimFfhq1vH/am8BNvKU+hR3kLHQkgzS7iC968GPLDFcFn+Gb1Ip6nTsYu5ZawYOv/X
	 jsIv5x6Xh6UETvy9QdoVFr5qBWhfQOewc18u7kpYfxQlgnJCk7X1f6izLll+8W4CxR
	 qGxdO5/y7sKhfCVJpTQbtzk0x3JMRoZVUPf6SEHp8kWf8yrUxgCOAsylNvb9KgaqMU
	 qMGgqcqHyiMYQ==
Date: Tue, 20 Jan 2026 12:14:43 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, Dawei Li <dawei.li@linux.dev>,
	joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com, stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <aW9xs1ko3nWq5VbS@willie-the-truck>
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
 <20260105145321.GD125261@ziepe.ca>
 <f253d6aa-1dc2-4b1a-85df-f43b06719c04@arm.com>
 <20260105185423.GI125261@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105185423.GI125261@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_041449_689599_0FFFC1D3 
X-CRM114-Status: GOOD (  26.86  )
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

On Mon, Jan 05, 2026 at 02:54:23PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 05, 2026 at 04:02:34PM +0000, Robin Murphy wrote:
> 
> > > It is reasonable that Linux will set the attributes properly based on
> > > what it is doing. Setting the wrong attributes and expecting the HW to
> > > ignore them seems like a hacky direction.
> > 
> > Oh, I'm not saying that we *shouldn't* set our attributes more exactly -
> > this would still be needed for doing things the "right" way too - I just
> > want to be very clear on the reasons why. 
> 
> At least I know of HW where the SMMU fetches covered by COHACC:
> 
>  * Translation table walks.
>  * Fetches of L1STD, STE, L1CD and CD.
>  * Command queue, Event queue and PRI queue access.
>  * GERROR, CMD_SYNC, Event queue and PRI queue MSIs, if supported.
> 
> Have a mixture of coherency support. The SOC has multiple fabrics, one
> non-coherent one specifically for isochronous traffic.  In HW some
> SMMU sub-units (like the table walk) been wired to the isochronous
> fabric, while others are using the normal coherent fabric.
> 
> So when it comes to this statement:
> 
>  If either the SMMU or system cannot *fully* support IO-coherent
>  access to SMMU structures/queues/translations, this reads as 0.
> 
> The HW is "partially" IO-coherent, so COHACC is 0.
> 
> It has been lucky that so far the incorrect attributes haven't caused a
> problem, but the next spin of this HW may have issue here. I'd like to
> see it fixed.

I'm not against being more careful about the memory attributes used by
the non-coherent walker, but we shouldn't fool ourselves into thinking
that Linux can treat coherent devices as non-coherent and expect things
to work generally. The use of non-cacheable mappings in
dma_alloc_coherent() and cache invalidation in the streaming API when
transferring buffer ownership back to the CPU can both lead to DMA
corruption if the device can snoop the CPU caches.

I think we're all agreed on that, but just wanted to make sure as this
is something that has come up before when talking to hardware folks
who seem to think that the "dma-coherent" property is a hint.

Will

