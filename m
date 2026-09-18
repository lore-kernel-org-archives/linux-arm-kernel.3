Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBC7C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a83TkCy927lFnFzqzJwMkoKLt0LEVtxyFRxTZWy7eag=; b=UjO19nxsOMc8p2Yk8Dy1WQ59ov
	ZKNPYWLsdr0+zwgkSS9FwufpRfGtfUA1IUXPAQPCLua3Mt8Ys/KV5ergNeKb7BvUGfChuD8z06Ro0
	wd9Z9TRFJm5z1CWZ/7ypC9ivjHS5JGBg2iYL0YCsSknfDrjyA8+KJ0E8NJSELV/72psLxX/6aBtSM
	F/oVxqnsT19rzyxea2bYO9jTmu76qI8+yHG7+e6YsOqwWOiNM1CY52q8NEas7IjPXBz+PPxA/Ip7Q
	cBwtB0kfASQFX4ecQiV5bY9ZiWj3quNr7C06ScKf8gNdgJhaZMMZ+bRYdCqtS2GNlDzKwS4AS9NPK
	mXmmS1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7c6G-0000000F9MC-18Eq;
	Fri, 18 Sep 2026 17:10:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7c6C-0000000F9Kb-2yHA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:10:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4209B1476;
	Fri, 18 Sep 2026 10:10:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DACF3F7B4;
	Fri, 18 Sep 2026 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789751405; bh=BgKcsXT68JH7sgpTC8Gm4cYQ/2FLLJZL15J9ATZKhdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+3nHSYFUtf7SaswiArlABvI3b2BtMzdxnuXNvLB87iAQX6Q6HaMpLdSwSayvDuVR
	 gJxPsA6IT7ZWN1hQIzcfuUzSvmwyEfbapuvFZPGEGXQzo6qO0pR9L257MQcNmha+M/
	 EGHJ6ZVdBmJB4loa8mqNP1EmXfTgf3xUNsoRUZOA=
Date: Fri, 18 Sep 2026 18:10:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <aq1wabiHOhLRjHEd@arm.com>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
 <20260918165754.GG11599@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918165754.GG11599@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_101008_790759_83B27365 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, Sep 18, 2026 at 01:57:54PM -0300, Jason Gunthorpe wrote:
> On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:
> 
> > TBH, I'm tempted not to support this configuration at all, just fail
> > gracefully if the realm page size doesn't match the host's. However, if
> > that's a real world configuration, 
> 
> realm != host is going to be fairly common.
> 
> host > realm is probably not that common, I would guess.

It's the latter that's problematic. If we don't think it's common, maybe
not worth solving.

> > I wonder whether could we leverage the swiotlb mechanism but with a
> > separate io_tlb_mem as a shared coco allocator with the right
> > alignment and use this pool when force_dma_unencrypted() instead of
> > specific alloc_pages() with adjusted order.
> 
> I propose we fix the far too low level set memory decrypted apis into
> proper allocators, with APIs that can handle a round up. Then see
> where we end up after that.

I fully agree. As you said, it also solves the double zeroing problem
and we can wire up the granule difference handling.

-- 
Catalin

