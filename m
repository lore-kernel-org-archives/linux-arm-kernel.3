Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D89C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWX7BHocDQy79xg1nWh2GEbrLAdwjBZsgjhN9hnUanY=; b=OloK7WmNY6oq9aZ0u98MW2Z0x8
	0OrMcGcxKvzQ+JNDR6gOIcKIRUo20ziBy9BlBK8R2nwAxVNPgJxcDFHn96X0IeymylXi49pMA5LLH
	EaHQaryEvnxBTZilScPLQFq3ci6VAQMH4o8cWGhltbkj1t6nrDNHWeDn5gR/FCRrC9NxwspvcT77s
	XqC661a2WLz4uwT+52uFToM2ba//Kpe9OcC9J+5lW+OXTiBOfjUSydRNBe0axC3XN+yv8r8K2++g9
	3ED71qiWO+fiQoWriZI4RmZ+pv6X98sGufM84aTFABX/H5ad3kQ/BNPRcjLMf7qqM84R469JciH1D
	NUaoJX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVJN-0000000AuPl-0DVU;
	Tue, 14 Jul 2026 05:04:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVJM-0000000AuPd-0DgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4C7A41851;
	Tue, 14 Jul 2026 05:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B5E1F000E9;
	Tue, 14 Jul 2026 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784005442;
	bh=GWX7BHocDQy79xg1nWh2GEbrLAdwjBZsgjhN9hnUanY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CKlMkUeoK3O/MtOhbbbjwFwTm02ZhG1JN0IrLP/cep1imp4Q1D4dC+CryFlGQdYf0
	 p9WAKGQzC5wBQM5okRin6feO0hARpilwewRhbaiNNcCKM1j8Jc7MocDpN5cw2tKRK8
	 nj+1LYvvaTzSiKhPl4FiIFz0yQWKY4HCBfMNmOWwUa9RX0yKX9PkcYdXM49sULT1/h
	 UYL/h7YPtNp3dRvfiutw7m+FoTgPWe+acBb+18F1Q4lrBV7r68ZIbrLJjQvU18da7D
	 JyZBOTNljbEhD6ihH8+PmlV84vY3FW+tDDZSgTIf8Zax7ZuCxIIFsxyvwgxavAix6i
	 2U6+oR3PBWaIQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 20/22] dma: swiotlb: free dynamic pools from process
 context
In-Reply-To: <20260713194131.GZ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-21-aneesh.kumar@kernel.org>
 <20260713194131.GZ3133966@ziepe.ca>
Date: Tue, 14 Jul 2026 10:33:49 +0530
Message-ID: <yq5ao6gamabu.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Jul 01, 2026 at 11:19:24AM +0530, Aneesh Kumar K.V (Arm) wrote:
>
>> @@ -840,7 +843,7 @@ static void swiotlb_del_pool(struct device *dev, struct io_tlb_pool *pool)
>>  	list_del_rcu(&pool->node);
>>  	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
>>  
>> -	call_rcu(&pool->rcu, swiotlb_dyn_free);
>> +	swiotlb_schedule_dyn_free(pool);
>
> This knows if the pool has cc_shared memory in it since there is now a
> flag tracking that? So should the work queue version be conditional on
> that flag?
>

We could definitely do that. I was not sure whether it was worth it,
considering that it would add two paths for SWIOTLB dynamic free.

-aneesh

