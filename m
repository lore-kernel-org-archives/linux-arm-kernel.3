Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8EAC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYmr0H9Ny/ow4oRf+kOxKy/va62yVPIOs3FFYDqPiJE=; b=C4bJzcIH5HmMcfskMS5717yzne
	sZHZpXwCggrBCvHb/Myfwgv/r7Ov0CjsHW32S2/KevfxzOxH9hIWD3x78ceiZga7q4attKKNf83SC
	bJrIqP4fs5oozohJcsIA6GnDWSmra0RF7AYw8vv+D43rc6kdDd3U52IT4GeyG/dxuk3tcmgSmbuXr
	TNn4Kps99185jHUONwEWaSLYWi7rVHkSLjqlSfL8pLelKEUfAbXDKRm2e/M1ODm8smfd8NNGV8iak
	2OTljF8CzL3X908rvbGyYIyvym3MLXBrq8FOdxEW/oBkCkpOjJnZ7prVs0wy3yHM+HHiQcfMeTfnN
	tcG8FWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHRl-00000007a3q-1GW5;
	Fri, 07 Aug 2026 10:05:01 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHRh-00000007a2d-0yoQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:04:59 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260807100453euoutp01e08fd1317b5254e81dfe38ab56a7e318~JfdftXfrq0070000700euoutp018;
	Fri,  7 Aug 2026 10:04:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260807100453euoutp01e08fd1317b5254e81dfe38ab56a7e318~JfdftXfrq0070000700euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786097093;
	bh=tYmr0H9Ny/ow4oRf+kOxKy/va62yVPIOs3FFYDqPiJE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=eSgPaohg3Ovh0J+b1VIFqfeHKkdgmjpLe5hrSy9TY75XNitr28SV92trUU9PslGo3
	 GaTZ+DDtA/CkPLguep0RMyOGadNXne7NZjAO0FCPKMjC/pYLr2u2SAbwA0Yp+g9cnq
	 bhJxJ6mGaKViGjHEGlcRFjpPia7jjmMs+eZr590I=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260807100453eucas1p136aea760b58c932260c5118603636b6a~JfdfRJz5D2159221592eucas1p1t;
	Fri,  7 Aug 2026 10:04:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260807100450eusmtip2cd49a3ac23b36ad2dca8af2eba115dfa~JfdcaVKqS0729607296eusmtip20;
	Fri,  7 Aug 2026 10:04:49 +0000 (GMT)
Message-ID: <04c8b1a8-9194-4e63-9d30-11315ea6c1a9@samsung.com>
Date: Fri, 7 Aug 2026 12:04:49 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, Will Deacon
	<will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
	<steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
	Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
	Gunthorpe <jgg@ziepe.ca>, Petr Tesarik <ptesarik@suse.com>, Alexey
	Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
	Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <anWqq-vjEwwaziaM@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260807100453eucas1p136aea760b58c932260c5118603636b6a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb
X-EPHeader: CA
X-CMS-RootMailID: 20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
	<CGME20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb@eucas1p1.samsung.com>
	<yq5azezfeeax.fsf@kernel.org>
	<85be992d-9567-433e-ae2e-64ae5483964d@samsung.com>
	<anWqq-vjEwwaziaM@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_030457_539275_FF590EEE 
X-CRM114-Status: GOOD (  13.76  )
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

On 07.08.2026 11:51, Mostafa Saleh wrote:
> On Fri, Jul 31, 2026 at 09:33:47AM +0200, Marek Szyprowski wrote:
>> On 25.07.2026 09:09, Aneesh Kumar K.V wrote:
>>> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
>>>> This series tracks confidential-computing shared DMA state through the
>>>> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
>>>> DMA buffers are handled consistently.
>>>>
>>>> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>>>>
> [...]
>>> pKVM topic branch is now available 
>>>
>>> https://lore.kernel.org/all/178467286876.125042.12010461715645610054.b4-ty@kernel.org/
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/coco
>> I've just got back from my holiday's and I see that there is everything ready to give
>> this patchset some tests in linux-next. I hope nothing will break.
>>
>> I've applied this patchset to dma-mapping-for-next, on top of pKVM topic branch with
> I was trying to find this tree and it seems the MAINTAINERS file have
> the wrong address:
> DMA MAPPING HELPERS
> M:      Marek Szyprowski <m.szyprowski@samsung.com>
> R:      Robin Murphy <robin.murphy@arm.com>
> L:      iommu@lists.linux.dev
> S:      Supported
> W:      https://protect2.fireeye.com/v1/url?k=dbfa7485-ba7161ce-dbfbffca-74fe485fb305-800153ec5c55b6a1&q=1&e=ed464763-9bbc-4c24-9629-f9ac5e8f5ef4&u=http%3A%2F%2Fgit.infradead.org%2Fusers%2Fhch%2Fdma-mapping.git
> T:      git git://git.infradead.org/users/hch/dma-mapping.git
>
> I believe the corret one is:
> https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git/

Thanks for pointing this out! It looks that I've forgot to update it.I will send an update soon.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


