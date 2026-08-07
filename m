Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A08C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gWaXZ9+2O+1F3TFyj+8MDOiIFSD+n/ei0pL8L1uFmE=; b=AgZDenIPBvab5ZIUcyDjz6mZor
	KZxAdJ/sXUJJrn2W6B7Iwa87B+rudsv7CrUm3Pv566t4qp8wzRPvhxKsABaAVf59/SYrWmAUmCWaC
	1TbrOnZv0aRZglKYrQKDUwazNFzJCjHMQMwiQIfdfUym65BPg7VchJWSimqZyA/4tq+GGoMGgmHCI
	vZnWVYH0XIz5OqvCDoHPaUV1cAi5s1lT5Eh0KcCpkD9tMORM5/ay3GRw3iOlCejOsDw4ld9y9npLM
	bBFUHAu/JYEwbo7PQzkgB6Qs0bTVVcuNcImdUZYOXkXi2lsNg6bBjJAYbd7kKqRcb8c09l7yqHcbp
	B7GLkJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNjP-00000008TdJ-1zLt;
	Fri, 07 Aug 2026 16:47:39 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNjM-00000008Tcs-4Ayu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:47:38 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-92edb12cdf2so237111985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786121256; x=1786726056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gWaXZ9+2O+1F3TFyj+8MDOiIFSD+n/ei0pL8L1uFmE=;
        b=RBON489pfCo01qkCqtXyMy5QAOKgfNx4QBayYtB9nkAl12sNFFS7ZI8pGsZnmhip9+
         mZzpMkl61uYg23EfPVLfpQWBd6q5vG4Sp3mPbnd4sNmTFJEUwVtpacFcyQ7UUs/omxe0
         GS5da6yakHNBjx3FPBEWZicUtePcUOYRIfOxyqjMel+Hfhw8lLSnYTDBMnGYTZd4cW4M
         MC+Wv38rJEQlTmPAZ/kDucnJlo7zgywkrEP0HRhR89ThvNGFvfoKqIXAB4netWkIj2Hf
         8CKVLWeeRR/AdDrjczeFFtOO+nnOa+IO74T04XhvOhbR1zJ0jkFOmjp2xsMzkPXrgTPc
         SRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121256; x=1786726056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gWaXZ9+2O+1F3TFyj+8MDOiIFSD+n/ei0pL8L1uFmE=;
        b=P0/1EZwwJf2vl8JbAn7PvbHu7FfJQ5vosiks0eqyxU+eGs8PX9ICNvNB2aVsSv7ZO+
         YbKmlfBO3ZgHrwmwbevuRx6SFBQ6/oMWDzUD3WfSB8otLe4sa69deiay/mfhYcY0bOr7
         DRPFihWIuutDp7+G4r6zUKJJtNFKO8U7umDAmD+AfHltAi12GmaGKr8roIvKwnKvvYX/
         RUCuYkw5RRvUlg5vx1z5pHrhvDlYNuvrvxqFLFGfz5C4iqrrKW05uAIuR919ERJQCF9i
         9g6UO6rKm9/kMNuTDPNwPIJBEN3yi9idLT/FdJS8NgF3ezHVHtSPtBKewdYKevQaj94H
         cdpA==
X-Forwarded-Encrypted: i=1; AHgh+RobTcETdUzJpqMeQ7nQUUcH2cbHkBctVElSS/QpKoCLBl8pBBV5fWQCflLvaNqo5Of1TphxUppm9GnkQ9nQee4e@lists.infradead.org
X-Gm-Message-State: AOJu0YyrEWuTFOF4wJBDHoOjEUpaOptzJpaWjrVmMPxFUZSq0HiwI9nQ
	rgSRNYk62WGOvZzhTpbbpTZwbuR9R7K6RU6LMZBz+18bogJg1aCYODIXMgsj9D+2GAI=
X-Gm-Gg: AR+sD1398FxO7AJwAdkdC7FCZd0ppPDpyV5Kg031SYE5qp14HGz1/HHvQgbKHwo5g8h
	99K8uW5OohmdKOcfV7WUuRxp3kkXsfOt3pPd/eXRfvZmt3NzSMsraUpPuF8dh/6XvCerVuKGHDV
	rc6mBU7YYMfYVCXCxdFcW8LzuO5ZVffHoZxrzG3vSemRHJ60zSAoAhbIiSiUB6ygOCwfjmUv4tK
	a/nkD0rWA7mFU24s7Donu3l5FiBzR3fI8CzKUtGZhcr27/BYhMhe88cqS1TlYqM3nLw+0BGU3t4
	u2xuwwLmB9v+g8Quh8xhHXwD/B7JsQEP8uZXcsSZXfwT6DXvLVslziPocPQxbhtNakdyVPgIlHL
	cQ9979f5DcoIj5kRnjz0J46GDzztEYeW6RybXTByOi7snB5EFbYB5WzbxBfJcnjDVW474XKGPWU
	wilY//AzYvSIyDabp7/DjsNJmh51RPcwCrk7PdvfNaJe2TtkNL
X-Received: by 2002:a05:620a:2849:b0:930:f2c8:d9ea with SMTP id af79cd13be357-93671f33f9fmr432093385a.41.1786121255653;
        Fri, 07 Aug 2026 09:47:35 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03ed23sm187954085a.7.2026.08.07.09.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:47:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wsNjK-000000014w0-1mQB;
	Fri, 07 Aug 2026 13:47:34 -0300
Date: Fri, 7 Aug 2026 13:47:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <20260807164734.GE200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anX7F7dnKOtAOIIe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094737_041435_00C73E6A 
X-CRM114-Status: GOOD (  19.71  )
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

On Fri, Aug 07, 2026 at 03:34:47PM +0000, Mostafa Saleh wrote:
> On Fri, Aug 07, 2026 at 10:58:10AM -0300, Jason Gunthorpe wrote:
> > On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
> > 
> > > > I was under the impression that there is a possibility of using swiotlb
> > > > instead of restricted-dma-pool with pKVM.
> > > 
> > > Yes, that patch enables swiotlb as a possibility for protected guests
> > > but with your patch we avoid shrinking the swiotlb buffer even when
> > > restricted dma pools are being used and that's a waste of memory.
> > 
> > I also thought we switched pkvm to use CC-like swiotlb as part of the
> > alignment in this rework? Mostafa ?
> 
> Yes, now protected VMs can use the SWIOTLB for bouncing. However for
> Android (and kvmtool), use restricted DMA. so SWIOTLB is not used.

Oh? Why?

> However, I do not think we should over engineer this in the code,
> swiotlb can be set from the cmdline and now through Kconfig also.

That's fine for android, but real users buying a cloud VM and sticking
a distro on it shouldn't be expected to have to mess with cmdline just
go get a halfway working system

Jason

