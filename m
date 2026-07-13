Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NxveP/pyfIFv71kVfPTlg3b5XZeJTUOET5rnvr6kHo=; b=Go/MIRFvEJJlf10vi6jEE6NT01
	U1bM4+XpxzYakVcAr17oTfNO/OD2zt0pfsaiKh7FY1IwkAYFnjuk6xGrXC8S+LGcD8cMERcziON2V
	UK+ft8Ejfh6Z6mOuCJrqC5FEQuHS4zoX/xxVn7tbx3zEgvr7c1RyGMBcYeGr0qlOXw5266KFu8G9C
	bQQVMl3kFuJr0WhittlRsfyBrjJo6qddPo53hKXK5WUCRkXnRkbY0dixx3yhpTFoaE/zAQv2Jmj2g
	zY16Rv4q/PplMwr/+x25HhQnWQ9k69HsYHII1yHAXLP35EQ6JzMnHhfUc7qtS+VY7Cz/JbZrzGTNZ
	Lk9by2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjM4e-0000000AGAa-0Ix0;
	Mon, 13 Jul 2026 19:12:16 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjM4Y-0000000AG9z-1eXr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:12:14 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c16ac21acso1497341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783969929; x=1784574729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/NxveP/pyfIFv71kVfPTlg3b5XZeJTUOET5rnvr6kHo=;
        b=j09mrylCIYkWKNMln0xxJSydJKNX2lUiXeBXzvbfN3PobFxGeoeJlE6/6WilfBZOkQ
         XvrVBjZZBaUlGelmIfJFUwqxqQAWYvy5dG364pHXHNy9SBbuHZT7P1Un8viwkIwmC4Ar
         upjBPcmuhjSeSmB3m12GlO7EaPktZiQctqX6uL+8orj5jMkWHsvGLNMNaf5e1h5vZS++
         zXk5r3vckMpJonTRlYmp2LxLiYLWy86MjepCRTFnIZafm2A4Jfv0KMiV2S5OG4cXRO0e
         LirfWlBCWuXWlnhi151kDK5ZA6RAANKvq6QbfJIMC1Jz/0X+ywzxGFcrXs5tjxp+mGRL
         rABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969929; x=1784574729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NxveP/pyfIFv71kVfPTlg3b5XZeJTUOET5rnvr6kHo=;
        b=EXpiIeT8veq3lFgGM1dANPE6l+1vMAJYUwa6AKTjUv4jn/JhDahGdiPH6NoTymE0sS
         9i9nZXB9eJXBtJFP50za2dkqbGzSFPokJEIgKGiGydSAlDtOL5oLxK25HVL6qgy1hSYo
         moBb/IQS/3A/FZqh4jVDavA2dv4Ckio66CjcrhvDY0HYF+jgkZjKh7qTvvOBoj8CgN1c
         zQknlfMOyh9aOjkI7fF+XJHMLmCE8IcA8dSkH+RHbP2lCM29yaPPNlmaIrTNB0WUhoLW
         NU6B1EQL4fI0yrHN+34OPsD5CMJQyAkVX20D/JpV7RYgs2qyCRpl7Vt1ZC32mBAtDW/U
         E6oA==
X-Forwarded-Encrypted: i=1; AHgh+RqpNbZsn+6Gi9BfqsPVTjDVB2wFveag9OCARoxuQeQnQc6FO8WUN79mq27qxg2+olGUG5gTTQFZRNU5YT3dUrS8@lists.infradead.org
X-Gm-Message-State: AOJu0YzcW/4BYO2q1yRH1cHuJsmP/2uNGKq3AmAC7aIsGS3Oi97qSAOs
	hu10Aws1ijJNfkRPzFVN+fD1jdkn+cLzWiwBWoiYiNPUFqGqekf4BOU5BnPmNVkz+I4=
X-Gm-Gg: AfdE7clCiKwInowe3KBZCTx+rrARgu84mVJISUUra2awGBXN8VCwESsh9/DW1FI9yZY
	+4jPQ5RktrLIjMZ5tfGh9VN43pd4M7REmXTo5UkIKG9kVNKe37J4OIsAMvbQctftwj8xR2DzB3r
	WmAC3KcJhOGnz/K5q6FZrRsy3IyYrNEqTA2LlpxNWgUnf0gs70ttE5g4klKQ2GTTOrcXkKkyRL2
	PfZfTpf949I4i9tI/nsOrhxgxLCe2KTCyaKpskcOz8aQzz8BiCvUQPgnMArITKqIfWL3VqlUcG4
	ejnC3haS/9xjDr14JE5WTzdJpv1Rx1OOjqPDyDi1rIeVssPKDswnykMXK08H2VX88CrRZfiqvZb
	kkdfyfO6xhdkWxnTKMlpeOvgoaNqao2Nafp8o/moZrYKZGCzMIZY73WPoVFzz
X-Received: by 2002:a05:622a:551a:b0:51b:f217:539f with SMTP id d75a77b69052e-51cbf0569bbmr98856591cf.17.1783969928867;
        Mon, 13 Jul 2026 12:12:08 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacad30asm88764001cf.9.2026.07.13.12.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:12:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjM4V-0000000E4Bs-31V7;
	Mon, 13 Jul 2026 16:12:07 -0300
Date: Mon, 13 Jul 2026 16:12:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 07/22] dma-direct: swiotlb: handle swiotlb alloc/free
 outside __dma_direct_alloc_pages
Message-ID: <20260713191207.GO3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-8-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-8-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_121210_443784_9B41044D 
X-CRM114-Status: GOOD (  15.13  )
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

On Wed, Jul 01, 2026 at 11:19:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Move swiotlb allocation out of __dma_direct_alloc_pages() and handle it in
> dma_direct_alloc() / dma_direct_alloc_pages().
> 
> This is needed for follow-up changes that simplify the handling of
> memory encryption/decryption based on the DMA attribute flags.
> 
> swiotlb backing pages are already mapped decrypted by
> swiotlb_update_mem_attributes() and rmem_swiotlb_device_init(), so
> dma-direct should not call dma_set_decrypted() on allocation nor
> dma_set_encrypted() on free for swiotlb-backed memory.
> 
> Update alloc/free paths to detect swiotlb-backed pages and skip
> encrypt/decrypt transitions for those paths. Keep the existing highmem
> rejection in dma_direct_alloc_pages() for swiotlb allocations.
> 
> Only for "restricted-dma-pool", we currently set `for_alloc = true`, while
> rmem_swiotlb_device_init() decrypts the whole pool up front. This pool is
> typically used together with "shared-dma-pool", where the shared region is
> accessed after remap/ioremap and the returned address is suitable for
> decrypted memory access. So existing code paths remain valid.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h |  6 ++++
>  kernel/dma/direct.c     | 71 ++++++++++++++++++++++++++++++-----------
>  kernel/dma/swiotlb.c    |  6 ++++
>  3 files changed, 65 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

