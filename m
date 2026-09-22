Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2AFC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MF5k+yCsNWsAGZ1KhS9rt6SbP8uOUPLPOsvvu94PzUI=; b=vBUW0iudP0d0HTU/W6AHpAzH4v
	bTET/s4NhyeJtIj6n0D6YWkzCqOQc7Mnq8WAiqpaS7Bmd5F4uqIOQqykPWMMU5J2zPiTnSOmdqDTm
	rrJkqfKXNOBGTnUXgcMQ70y+uiAhM8ua4EWYR1JpeEOqkUY23f19Si+x+LBEKx+treYPGAhb0ZTf8
	8YQdZGSMqtytp90OLs1yQcCyYsHnm1Zy0GcacNNhAEq+z9ur2zVyEbYIfAW6Xv2W8yiTvNLlKDGeR
	KzX7MKCuZ0I4/O9eKJFYF5FNjZeO3qmQe0shmq/e+tpD6eY1kAOVyHXOzAUBeZBHFBBVXTNijZ1D7
	2B315M7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93WZ-000000064oF-3JHA;
	Tue, 22 Sep 2026 16:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93WX-000000064nk-0BcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:39:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0461576;
	Tue, 22 Sep 2026 09:39:06 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3D7A3F632;
	Tue, 22 Sep 2026 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790095150; bh=YQf4ZF9UrIZkju53+FMc2/Zw5dM/iafRxTRYEbJms0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYzw/dZBDBEYe9/IfefTSuDA9ATgbB7Dnmm7bUOXpXYL7xrhaOG6WNWM89zKFywgX
	 Hca5ai3qk4fYLZscOfPi0Qh5fdm128r5ziOOA5TBgZtWFVOg+iJJUHDyzqYjkftVAr
	 3sHOOYEiFcjjnuFpaEP+biIIhTBY6lijgPOKAanM=
Date: Tue, 22 Sep 2026 17:39:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 12/13] dma-buf: system_heap: Allocate shared
 buffers using CoCo shared memory allocator
Message-ID: <arKvKME-_wNeW7ea@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-13-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921144847.501151-13-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_093917_299253_E5C7D0EF 
X-CRM114-Status: GOOD (  10.94  )
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

On Mon, Sep 21, 2026 at 08:18:46PM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -405,6 +396,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  {
>  	struct system_heap_buffer *buffer;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct cc_shared_layout layout;
>  	unsigned long size_remaining = len;
>  	unsigned long sg_remaining = len;
>  	unsigned int max_order = orders[0];
> @@ -417,6 +409,14 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	struct page *page, *tmp_page;
>  	int i, ret = -ENOMEM;
>  
> +	if (cc_shared) {
> +		ret = cc_shared_calc_layout(len, &layout);

You should not override 'ret' here, it was set to -ENOMEM for a reason.
cc_shared_calc_layout() succeeds resetting 'ret' and some further down
allocation failure, goto free will return ERR_PTR(0).

-- 
Catalin

