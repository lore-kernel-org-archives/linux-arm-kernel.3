Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F18CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 03:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/10KWZth3f3oJZ9cVmYGyrspKBWGW0LeGuuNx46MWQ=; b=sjfQ911jzh7+mYY8mzOgT9zcuI
	gYOMrb3S0vlT8f++Dh1pmOx164ZWflmJ3O8beDSpLfRwdgCeI6/S/xTyAiW4QZFi6+4uU08lIUywJ
	nHB+taEBjMMRLcapVVCxZxI/oyRjx2MfM12q9JM7Q/uyrHQNjHmE8Vo1ZCnf3NPGTdx1a3n5NIe7g
	IPrKIDVtND3psD7HEBLB2+57t/9xz516gJremfAaFpGMXfyGd0FMx/vh4CseMkzZ1JlPwETYzJrHn
	mFBr0tK1k+e2wXftskTUE1Awf1htY1+L3EGMzsxpUvsRX3X0i5j9W/u1QH91xDj0R7qf/H/PC3v1W
	WxzqnmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPY3z-00000003RAa-2My2;
	Wed, 20 May 2026 03:57:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPY3v-00000003R8l-25LF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 03:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95B7543EA4;
	Wed, 20 May 2026 03:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679B51F000E9;
	Wed, 20 May 2026 03:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779249458;
	bh=2/10KWZth3f3oJZ9cVmYGyrspKBWGW0LeGuuNx46MWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=InlsMQlEZWNdtUwAJ/WfdVY8k13HPRMssotBX7SBIuNa54Jg5vv0DFKV/w2mGAhTl
	 Tzussp1c8bM+KGnneYMWBdGbE4oZul6IPm60d103sHqARcIHtvuJIiVgW9S3QWUNxe
	 GjNuOmh9trmY3E8I6iNu0UCo/Ee4tbvNHH+iz36pcjOMPgbKC1DF7Zdic5DUxAP/5r
	 qFDNlC2UfvXa6u5GW5TK6+7EPafA/L3aUULUJfYDKazwkubhgxm0YcqdzN4vollRka
	 RL31G/X3pgTFzHPzIAgWwh2bzokWqpVVU6U6B2r+w0u77cJDi7s4qVbg0kWegirLl0
	 +27eesvv2tbCg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
In-Reply-To: <20260519161120.GO7702@ziepe.ca>
References: <yq5ah5oaa63h.fsf@kernel.org> <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org> <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org> <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org> <yq5abjebsaid.fsf@kernel.org>
 <20260519152741.GM7702@ziepe.ca> <yq5a8q9fs7ud.fsf@kernel.org>
 <20260519161120.GO7702@ziepe.ca>
Date: Wed, 20 May 2026 09:27:27 +0530
Message-ID: <yq5a5x4ispg8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_205739_574114_A90954A1 
X-CRM114-Status: GOOD (  16.73  )
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Tue, May 19, 2026 at 09:35:30PM +0530, Aneesh Kumar K.V wrote:
>> Yes, that also resulted in simpler and cleaner code.
>> 
>> swiotlb_tbl_map_single
>> 	/*
>> 	 * If the physical address is encrypted but the device requires
>> 	 * decrypted DMA, use a decrypted io_tlb_mem and update the
>> 	 * attributes so the caller knows that a decrypted io_tlb_mem
>> 	 * was used.
>> 	 */
>> 	if (!(*attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
>> 		*attrs |= DMA_ATTR_CC_SHARED;
>> 
>> 	if (mem->unencrypted != !!(*attrs & DMA_ATTR_CC_SHARED))
>> 		return (phys_addr_t)DMA_MAPPING_ERROR;
>
> Yeah, exactly that is so much clearer now that the mem->unecrypted is
> tied directly.
>
> That logic is reversed though, the incoming ATTR_CC doesn't matter for
> swiotlb, that is just the source of the memcpy.
>
> /* swiotlb pool is incorrect for this device */
> if (mem->unencrypted != force_dma_unencrypted(dev))
>     return (phys_addr_t)DMA_MAPPING_ERROR;
>
> /* Force attrs to match the kind of memory in the pool */
> if (mem->unencrypted)
>      *attrs |= DMA_ATTR_CC_SHARED;
> else
>      *attrs &= ~DMA_ATTR_CC_SHARED;
>
>
> Attrs should be forced to whatever memory swiotlb selected.
>

But that will not handle a T=1 device that wants to use swiotlb to
bounce unencrypted memory. That is:

force_dma_unencrypted(dev) == 0  /* T=1 device */
attrs = DMA_ATTR_CC_SHARED;

In that case, it should use an unencrypted io_tlb_mem:
mem->unencrypted == 1

-aneesh

