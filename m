Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A413BC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+oaEmElNSlqPBnECgfUr9b4NLYzpG9sItMKkpA5S6w=; b=Cebom7J7vCkQ0bs39N6rdxytNx
	Z9OCuYs5hIS9Tlld/SH4i0+F+wCRgzNE8eNSsgdoPbkvBqjglj3CObiCXaWFofdd0MRSwtrfv8IAL
	6RafP54/Kjn3kv3kVwxYcraUh7QPKKcoLNxOfrk86OxWdr6qpEZs6Xq4b4em+RTACmYyA2L2/6oke
	+0yfmljyy92WHlXTl3O9qSfuAFGYXCRjocYudm36EYRv8pNWnUz6e4vFdMIs46rzut+NU1KdWqkqp
	YVUXAV2BiM5IzA66o8zrYJ1f1+Pjov6qpVU8PIsDWPzXiTfgKKn/lbsdPfWPTrRiPXAjK35hMVw+p
	QATRy9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSlD-0000000CNFb-3nTo;
	Mon, 10 Aug 2026 16:21:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSlC-0000000CNFB-11VN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF9E14BF;
	Mon, 10 Aug 2026 09:21:52 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 940CD3F86F;
	Mon, 10 Aug 2026 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786378916; bh=u7lDQ5r1fWCV8TfA8aUHo69CydShqVMlVgOaxbleVmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqTh46QerWY1zlFZ0mKKu44uNBAwm5uhv2fyJoPgLQHiR9ozkJg7mTYyHUIwznQ7F
	 guNDtKeUBBY1lv05yMvTR0qMAGhhi60tk7oyfdh9cQQs1v5iFNNQQzXGwC7mzs7w/6
	 vQud/ujNVA4Bg+M33xIYsyHn0bSt/j1WqkiFrAH8=
Date: Mon, 10 Aug 2026 17:21:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Message-ID: <ann6noRzoPLL9kDY@arm.com>
References: <20260807182017.GH200537@ziepe.ca>
 <7d22482f-d5fd-4cf4-9d32-6a54e02f2fbb@samsung.com>
 <yq5av79iiard.fsf@kernel.org>
 <anml6lLRERm1Iv-_@willie-the-truck>
 <28442500-1d53-4776-bae5-459c3ffc1cc6@samsung.com>
 <anm6K2umtx4iKnyZ@willie-the-truck>
 <20260810130818.GN200537@ziepe.ca>
 <annc1ynWUsWQc4JM@willie-the-truck>
 <annx8-HDjTq933vp@arm.com>
 <ann1MnO8bADV9EGe@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ann1MnO8bADV9EGe@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_092158_321266_0B41E45A 
X-CRM114-Status: GOOD (  15.03  )
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

On Mon, Aug 10, 2026 at 04:58:42PM +0100, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 04:44:51PM +0100, Catalin Marinas wrote:
> > I can see x86 in mem_encrypt_setup_arch() adjusting the bounce buffer to
> > 6% of the guest memory. We could make up similar logic for arm64 or we
> > could just rely on CONFIG_SWIOTLB_DYNAMIC (default off currently for
> > arm64 I think).
> 
> As Jason said, this should be done outside the arch code.

I agree, better in the core code. I'd prefer to go for some dynamic
resizing than random percentage of guest memory like x86 (but, in the
absence of dynamic swiotlb, we could pick some default).

I noticed we still have a small change in behaviour regarding dynamic
swiotlb. The increment for new allocations is based on default_nslabs
which is reduced with the new patches. It gets even weirder if one sets
the same IO_TLB_DEFAULT_SIZE on the kernel command line, it will be
overridden by swiotlb_adjust_size() anyway.

I think this core code needs a bit more tidying up.

-- 
Catalin

