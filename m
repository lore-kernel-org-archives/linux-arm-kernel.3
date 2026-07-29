Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C04C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SpSxnvuNGmLHWtJ7jUwkJNoaIB6p9cDPcBNT0kYRN8=; b=49q2PjioF+YyXUdqMxkEak8bn6
	8E4HmR3olnMRW8Wj39j4hzozVhkDMV/lKscdHfRcIcuXjJQannUefzdbFRc2N50tGLKWpm/LuwafC
	yX8EWqXk4HaIcCBTqkyO0cBcmFC+IeoeIws+OCTntuOGQw38wohV5xI9sqXBWloy0eSaTP6ku1Nlo
	xKO9/KRX9qLYZjRMrtnX1N7WfEjhgNJdbBEryEVs7WBFR/D5pyn6XFcIJbFn6rIaXgd7dA37D83+w
	Uog41iHzHduMfjaLqbuzeq4gEiTWXChzUx4GvuunaVSpHDkIjL4QzyyZ3Cv68rGNkFQMitWIzeeUN
	xNs72ICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Hy-00000007KDF-2JnM;
	Wed, 29 Jul 2026 09:09:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Hx-00000007KCs-3A20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 09:09:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4CB960AA1;
	Wed, 29 Jul 2026 09:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD2D1F000E9;
	Wed, 29 Jul 2026 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785316160;
	bh=3SpSxnvuNGmLHWtJ7jUwkJNoaIB6p9cDPcBNT0kYRN8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=A2VcftX+szPrGFM49eBI8rgFYkmukzvFokMsd6WGe+h74xvC6CtdICs0UZ4yjOqvR
	 fdcdUi7fzgpOIuZL4RtiddkR2ScDaD1cM0BLIuDlG5jfNQnWGV0+ncs9XXY9Jex52k
	 tM0VQtKPqoomYgjwCx715PfvDmGSE4Gn1EIUcmgyqaAnRRJQaMVwm6nS/F4mOO27ja
	 qcoSXdaQMlMbY8tkdYIqHfSFfCMxIeoHQkHUsXhWW/I8Fs/VcUew2AFEtR4JR7Y19H
	 PUnnq88/Wgvhkl2D7ezzQNWPFWPputmv9S883P/cocuobYpEolgl3n/xjWk2H65qch
	 z6Y42MpMAW7YQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
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
	Jason Gunthorpe <jgg@nvidia.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 15/23] dma-direct: pass attrs to dma_capable() for
 DMA_ATTR_CC_SHARED checks
In-Reply-To: <ami9CIGanuQX3lxb@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-16-aneesh.kumar@kernel.org>
 <ami9CIGanuQX3lxb@google.com>
Date: Wed, 29 Jul 2026 14:39:08 +0530
Message-ID: <yq5a33x2go23.fsf@kernel.org>
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

Mostafa Saleh <smostafa@google.com> writes:

>>  static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
>> -		bool is_ram)
>> +		bool is_ram, unsigned long attrs)
>>  {
>>  	dma_addr_t end = addr + size - 1;
>>  
>>  	if (addr == DMA_MAPPING_ERROR)
>>  		return false;
>> +	/*
>> +	 * The DMA address was derived from encrypted RAM, but this device
>> +	 * requires unencrypted DMA addresses. Treat it as not DMA-capable
>> +	 * so the caller can fall back to a suitable SWIOTLB pool.
>> +	 */
>> +	if (!(attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
>> +		return false;
>> +
>
> I guess it does not make sense to check the other way? I'd be worried if
> some a confidential device uses shared memory which might leak info.
>

From the perspective of the dma_capable() check, this should be allowed;
that is, a trusted device is permitted to access shared memory.

-aneesh

