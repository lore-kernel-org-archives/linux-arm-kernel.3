Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D278C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpWtv0pYfxndfeslGolf2QwgOrAZhpu3GPmCVKvsSLo=; b=HSGyhPFu0Mryc4czUMfOdJMZKd
	PT7F4We2R5K8HgYyJ6KwnnFofoWQ1pEh2Q3VHxAlLB6H/OhgYxuETvc/TXREM2Ie5WRBYBakrxHzw
	eOCXQf00hOtKAsy4riMYOlBFAZaqLXgG0OcZdK0tNnE2AuFLqVm1kWgWapVjRBbfbnMnr17YOrmgC
	L4Ob95rGv7LiTK/Ed6KUR4BJxzU9Xq/KfeVpYE9LmnQd4xdXrwGtHFkkFdqzFt3d0AacJ/CW9uJ90
	gXqDD2jmiaZm6U2qglUGwt6qpKfKaQPYk3+1utBWcqIPWiI5m1ZrNlQTEmMSZED7VAUa/vZ+QFBpe
	btCBivQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woil3-00000005TYT-34Nn;
	Tue, 28 Jul 2026 14:26:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woil1-00000005TXr-1p3y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:26:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so62305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785248769; x=1785853569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpWtv0pYfxndfeslGolf2QwgOrAZhpu3GPmCVKvsSLo=;
        b=vozbwFc8PRRRYu26SGM7Vqu1TrxZbFBUXLMDk8dhtDzrA2/VIlKJk29HEwQjUbtaeX
         jX+XICBC94xHvRa8hATskpCtCKXuOywbM0zRepPF+giiSulbtzIpu4frvf5+UTe+JmQd
         DJdUSyKdXMdukS3ew4isEfGBXXMFVko4ZYH5S92A78R1qPx4RONs+lUdhr0MjKVAmPAO
         YLYQyYMHFv88r4/svfRvTaYXOpquv0C2a3G/5GpsGpJbrkUXaGbJbUkys4f2eR28D2LD
         lVZ2/jfEOlzhHCebLxIn38e61HvM5L6VAyQ9oS/Yk9U2wScImzDjGRh7RFCXEd8z+0jB
         soaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248769; x=1785853569;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpWtv0pYfxndfeslGolf2QwgOrAZhpu3GPmCVKvsSLo=;
        b=CK4JPqKuZ5Ban+k7y/dq6CQvjRNg1Cr3s4CSs058rnkmY7HePxbzwUaGKQ0+dwLdyX
         fYMov0B/2GyVuhVBCs7fdd3XaxgVfToeiLVwe/a4exijHLI/6pcal12ZXM5RTFcs2255
         cVQT9ORo3QrMNXax1pnrTgcrV9EpnzTsgfN9/zPKERplFgVhVE0RxepRa96W8aADSSuS
         9fbj7F7zsJApuX76tPggR+93uJVGAut0bD8skaCytzb1d9tXsU5SWgtaoE76mkReXtc/
         JNQ69Q9SEoabpY1wAAsv71pk74r7HMM6hJcsXUbJKJ+l9INhVZK+FAGuxpCbPrMGBbYk
         i3eQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeufpKFN51z31Lg1wPvLOHrJJxGfdFJzufy4mYDVgBgTbaVzGkAINFYVAmeCRpyQHlKqjcX2UWQUMmWp43YAbd@lists.infradead.org
X-Gm-Message-State: AOJu0YxMrxifyUsn0I92wvQ86TwjPudLRZGjpOYKFD6Shd9SetLmwK12
	tMHeLwBC3YXHGay6ZWs9py80FIN3vE6qxyaGBykQ+YL0an1XyczQSacyq3mocpZ8zA==
X-Gm-Gg: AR+sD11BAz06fq+bUq3lIrJPdYoWDfFRcuwX9AV+53syABe7Bk3CxfFyDhqb0KfQJEs
	4NAql+VIJhUOMNmahsN2wwTYH711wzIlFDvGDVzoQ2fIkOe4HkJIN1FJvAiS0Lx11j1ko/GNCfK
	2RJmc6UUKqxE6S+8fggG2lbvXeK1sxIaSEQKND+B+pUwVj8j6Y36CbNKziZqe5DRDxvWCYfTCHm
	WZlqv+VwLGie1cAzaoXSa0n/0hcmE8vkQXZCoPkN4CErHAC24Iuc2IXthUjdft7/5n2v9lIOHse
	fq8nYECbZCfjfxDnmLQ207Dta50z9OoXZuWt1dkfrfpVTf3l7D8LWbBfl2p9MpyFSUU2wwZtNoV
	c5b8YbO/baipMjnJIHmCyfszMEqxHJDjcdJOWnBjGKJnUMZ0x7+sX8vcYSKI/vgRbvgaN025awT
	7VdM/bwHh6yIyYss452DOid2xkbr1cMLcxgc5cBkbfEew=
X-Received: by 2002:a05:600c:4583:b0:493:aca0:32e2 with SMTP id 5b1f17b1804b1-496b4cf6c38mr21115e9.4.1785248768109;
        Tue, 28 Jul 2026 07:26:08 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm60556481f8f.11.2026.07.28.07.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:26:07 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:25:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 09/23] dma-mapping: Add internal shared allocation
 attribute
Message-ID: <ami79lwqbqcaFpqo@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-10-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-10-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_072611_514405_3F54F0E7 
X-CRM114-Status: GOOD (  29.07  )
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

On Fri, Jul 17, 2026 at 11:34:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
> DMA_ATTR_CC_SHARED describes an existing DMA mapping whose backing memory
> is already shared, or decrypted, for confidential computing. It is a
> mapping attribute: callers use it to request a shared DMA address encoding
> for memory that has already been prepared for shared DMA.
> 
> Allocation paths need a related but different state. Once the DMA core
> decides that an allocation must use shared backing pages, the lower-level
> allocation helpers need to select shared pools, decrypt newly allocated
> pages, derive the DMA address with the shared-memory translation and
> restore encryption on free. That state is internal to the DMA-mapping
> implementation and should not be passed by drivers to dma_alloc_attrs().
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  Documentation/core-api/dma-attributes.rst | 29 +++++++++++++++++++++++
>  include/linux/dma-mapping.h               |  8 +++++++
>  include/trace/events/dma.h                |  3 ++-
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
> index 123c8468d58f..eee743184acd 100644
> --- a/Documentation/core-api/dma-attributes.rst
> +++ b/Documentation/core-api/dma-attributes.rst
> @@ -179,3 +179,32 @@ interface when building their uAPIs, when possible.
>  
>  It must never be used in an in-kernel driver that only works with
>  kernel memory.
> +
> +DMA_ATTR_CC_SHARED
> +------------------
> +
> +This attribute indicates that a DMA mapping is shared, or decrypted, for
> +confidential computing guests. For normal system memory, the caller must
> +already have marked the memory decrypted with set_memory_decrypted(). CPU
> +PTEs for the mapping must use pgprot_decrypted(), and the same shared
> +semantic may be passed to a vIOMMU when it sets up the IOPTE.
> +
> +This attribute describes an existing mapping. It does not allocate shared
> +backing pages and must not be passed to dma_alloc_attrs(). For MMIO, use
> +this together with DMA_ATTR_MMIO to indicate shared MMIO. Unless
> +DMA_ATTR_MMIO is provided, the mapping requires a struct page.
> +
> +__DMA_ATTR_ALLOC_CC_SHARED
> +--------------------------
> +
> +This is an internal DMA-mapping attribute for confidential computing guests.
> +It is used by allocation paths after the DMA core has determined that the
> +backing pages must be shared, or decrypted. For example, the direct DMA and
> +SWIOTLB allocation paths use it to select shared DMA pools, decrypt newly
> +allocated pages, derive DMA addresses using the shared-memory translation, and
> +restore encryption on free.
> +
> +__DMA_ATTR_ALLOC_CC_SHARED differs from DMA_ATTR_CC_SHARED in that it is not
> +a caller-visible DMA API attribute. DMA_ATTR_CC_SHARED describes an
> +already-shared mapping and requires the caller to have prepared normal
> +system memory before mapping it.
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index cc0823a99cfd..a3e880649fa4 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -103,6 +103,14 @@
>   */
>  #define DMA_ATTR_CC_SHARED	(1UL << 13)
>  
> +/*
> + * __DMA_ATTR_ALLOC_CC_SHARED: Internal DMA-mapping attribute used by
> + * allocation paths that create shared (decrypted) backing pages for
> + * confidential computing guests. Drivers must not pass this attribute to
> + * dma_alloc_attrs().
> + */
> +#define __DMA_ATTR_ALLOC_CC_SHARED	(1UL << 14)
> +
>  /*
>   * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
>   * be given to a device to use as a DMA source or target.  It is specific to a
> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
> index 31c9ddf72c9d..9df02c1511de 100644
> --- a/include/trace/events/dma.h
> +++ b/include/trace/events/dma.h
> @@ -35,7 +35,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>  		{ DMA_ATTR_MMIO, "MMIO" }, \
>  		{ DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, "CACHELINES_OVERLAP" }, \
>  		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" }, \
> -		{ DMA_ATTR_CC_SHARED, "CC_SHARED" })
> +		{ DMA_ATTR_CC_SHARED, "CC_SHARED" }, \
> +		{ __DMA_ATTR_ALLOC_CC_SHARED, "ALLOC_CC_SHARED" })
>  
>  DECLARE_EVENT_CLASS(dma_map,
>  	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
> -- 
> 2.43.0
> 

