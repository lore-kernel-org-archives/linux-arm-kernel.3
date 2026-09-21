Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F556C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AbV6ioiEGOWrXlJd0nFCFw/BQn3PCB4bJsD0M3s6ZI=; b=i8CmXlP0BABEpwdjnJwK0W9L7W
	9lREDb2ZoVE1ro/i+ZYHBMX90XsrqjUx2TkwF4ATRFOc6S/LrLaSOteZLtB3F8OhLqwi2Sc84pdmW
	RF/EnOBgC6shAUjZAV6ur4StvP2nmi3qk+IdTiQPFtxrX7/1V+qwAgUP+NvebfOiDMcoV7EA5aerS
	bqc6KE46c8y6lZbLyNRl/F5F5RZ2HjUCe+i5QPNj+Osn01mKikJkaN1TBHAp6xWt4/E5ag5TKuhlW
	U5DatdAaTd/b+Uba7ueWUTrSEXym3TF8K42nlR5RXQVKjJOAhzt2yGZ24X//LjPFe0SEstjSyhMdt
	+iIPI5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XyD-000000018Ua-3xtI;
	Mon, 21 Sep 2026 06:57:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XyC-000000018U7-2RiH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:57:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 20BF243224;
	Mon, 21 Sep 2026 06:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED401F000FF;
	Mon, 21 Sep 2026 06:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789973864;
	bh=8AbV6ioiEGOWrXlJd0nFCFw/BQn3PCB4bJsD0M3s6ZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CsdfJbqGXWpoA8CDYUjjF6BytwF09mEWBrwRs12h1PFAOuUvpL1ulZBI77Odkr6e3
	 k85k4aDhb3EqzqIyrQITn1tMNskmhogMSS0PWqF5df/fnFQnhjSXEAcLHXdYEgHLgU
	 Px6YjimUVJ3qyf78tMk5kL4sD2CGJlG871MTZFZFVWC+6df4fApeulWSVhtBZK2qYy
	 UI04iL/LNqwWfHfGfIJLa5xde5D/6EIVOKhW8xmYdRqG0hSIoXAPaT69WnW40l/Yz0
	 Vy+anCIK/AnSktEacdFkzptTcGHU5wTjSlNaJrEwEJD9jzO98b0cPJVafPi6VnmUw6
	 xeVMlskKehpPQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian K?nig <christian.koenig@amd.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
In-Reply-To: <aq1V3oeDdvXobt8J@arm.com>
References: <aq1V3oeDdvXobt8J@arm.com>
Date: Mon, 21 Sep 2026 12:27:35 +0530
Message-ID: <yq5afqz33xcw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> First, none of the DMA-BUF maintainers have been cc'ed. It might be fine
> for an RFC but this series got to version 6. We need their feedback.
>
> On Fri, Sep 04, 2026 at 04:04:50PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The system heap can allocate buffers that are decrypted and shared with the

 [ ... 107 lines skipped ... ] 

>
> You need to get a proper base so that Sashiko can review this series. I
> ran it through Claude and the above is wrong to go to free_buffer which
> walks over the pages list that has not been initialised yet.
>

There is a dependency on the file-movement changes in the arm-smccc bus
patch series. This was done because we agreed to move the RSI changes
out of arch/arm64 before considering further CCA-related changes for
merging.

Do you have any suggestions on how to handle this? I could include the
dependent patches when posting the new series so that Sashiko has a base
on which to apply it, and clearly mark those patches as not for merging.

-aneesh

