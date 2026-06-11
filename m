Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78F2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEJIr+lPP3nXLw5RoJcEfwsXvE/NpV/RD/uYgu3QwbY=; b=axeHClbuBhkcJkwMZjW2hfV5wt
	CDMClXq4WKSaKO7RboaWoSjfsNFFkVn4OOu7Y1yrKbKmfNoLA70PYllGoqZc+PlN5vgTLK+xvDlbm
	xiMOjTtHxdoVCkVU8HRWZXJ1KcGvO18iFQaBVsdjTJYeLDcwqgwlxCeZOmXFbjK4b5Lk1aCYm2SxE
	SRrN8rcJwkaJxbElEsJMxDab2WU03YlsPV1b64auHklrmlVmSF/OAvJGId+Y4encFKU+d85lT/LoB
	+Jg3+dpoEphld9ivoXWlrtDtaeg/gaCP+P8vAZh7pbm8OCgG1egXyc5J0vPd3Rg5+w23ZSgNILE+D
	AqVxwOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYLn-00000008lgR-0LBx;
	Thu, 11 Jun 2026 05:53:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYLl-00000008lgF-402P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:53:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B20E843F5F;
	Thu, 11 Jun 2026 05:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26861F00893;
	Thu, 11 Jun 2026 05:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157189;
	bh=sEJIr+lPP3nXLw5RoJcEfwsXvE/NpV/RD/uYgu3QwbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LZ9uqd0d7apZX5IQP570+CH5enEWdE4i/rnlALBpkVng1ymyhtm8Xo+CXf6k/jI/T
	 PzpwXj8C9y8lPg0EqG2BmAmqvWycVYScBZuIOoexVWPDlJk0h1k2YtyuMWTIEir5xp
	 Ac4imUykBKZf2Ir12ie18URAbLEGxAwTs9dH2Dxho0ZHxwerBlBud5rW5fw3RHgiRq
	 i/QEsYYPYoHhorZg7TrBTtbB0mfEqQbWSxRo0bNMNkbnl1n/CpGi3B/5x9taOYPW/9
	 Jlp+saSSz66Cto6HSo5gt0et9Sna0FPZZpDrNpcs8qWkQ2M2f2JHnCKYHvPpdPdNSY
	 WoypcSrVXBZRg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
In-Reply-To: <aigYbK12D8uKQvJF@arm.com>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
Date: Thu, 11 Jun 2026 11:22:56 +0530
Message-ID: <yq5a7bo5mxmv.fsf@kernel.org>
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

> On Thu, Jun 04, 2026 at 02:09:39PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>> dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>> are handled consistently.
>> 
>> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>> shared/decrypted buffer handling. This series consolidates the
>> force_dma_unencrypted() checks in the top-level functions and ensures
>> that the remaining DMA interfaces use DMA attributes to make the correct
>> decisions.
>
> Please check Sashiko's reports, it has some good points:
>
> https://sashiko.dev/#/patchset/20260604083959.1265923-1-aneesh.kumar@kernel.org
>
> I think the main one is the swiotlb_tbl_map_single() changes which break
> AMD SME host support. There cc_platform_has(CC_ATTR_MEM_ENCRYPT) is true
> but force_dma_unencrypted() is false. Normally you'd not end up on this
> path but you can have swiotlb=force.
>

I would consider the above similar to a trusted device requiring swiotlb
bouncing. At some point, based on real-world use cases, we may need to
add protected io_tlb_mem pools. We have not done that yet because no
such use case has come so far.

-aneesh

