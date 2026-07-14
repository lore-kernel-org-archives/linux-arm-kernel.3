Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4B1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIRiSHikDbk3Q53e+YjP2I19kY7qxurY8Pb5lmd5nSc=; b=gc5fr4ydARU/ybK5Ce4AXYoUiI
	BvRJwk53t/zqJEreOZik39VP3Xw6eYbWpkjNX9oSKvZPi5NjtFFr20Yx/dz7X0tA77IWjx4U27wB6
	BTwk1R4KlzhhCDLaTu1GL8qm0paJy/8Loj/QDhI7SUqZVwM+ymhfB+Jh3AITBziP4MUtc69IMjBu1
	IK9rbm0hFINKkKKgFjdWEq1Gm8LbbshW7mwter7V4MxQI8nDkOB9lxRdfjjcKHyux19+3sI3Ph9Zb
	4g55YR1VA5dhSoPSFjqR+GZOP5svRvEz6NOGBVmYTi+ToWKxAhIyM6qVrzLxGNgA7CBPzJdUi2xsR
	TuMmWrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWHu-0000000B077-2LxG;
	Tue, 14 Jul 2026 06:06:38 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWHr-0000000B06F-0uDj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:06:37 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260714060628euoutp01cbda150c069210e5715ab2648f4e44a1~CEue2A0331287012870euoutp01N;
	Tue, 14 Jul 2026 06:06:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260714060628euoutp01cbda150c069210e5715ab2648f4e44a1~CEue2A0331287012870euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784009188;
	bh=DIRiSHikDbk3Q53e+YjP2I19kY7qxurY8Pb5lmd5nSc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZmTRfa3dChwOjLkZGeEMSnDLvOnVbXVLWi/yY8oYelFIbUKhjxrUwNtWWyt9jGG57
	 zLrE3UwKmxXKyqmroZgcu+zD6Pbp7nUy338G8F1TCB+JxTfBCdRlT5n+ocrtCDB3hF
	 sBgzrXGbIcPqqW8KQ2dQeq3cV4UO/lgDK3/yDeeA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260714060628eucas1p1de9b3680fe41ab77cb6ab5e0681da787~CEuesp4gf1760517605eucas1p1P;
	Tue, 14 Jul 2026 06:06:28 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260714060627eusmtip1653aae226e9613f0154d29407d6f5622~CEudQw15C0714907149eusmtip1g;
	Tue, 14 Jul 2026 06:06:27 +0000 (GMT)
Message-ID: <cd5d0504-1592-4b48-89ea-1efe8aa57968@samsung.com>
Date: Tue, 14 Jul 2026 08:06:26 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, Will Deacon
	<will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
	<steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
	Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Mostafa
	Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, Alexey
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
In-Reply-To: <20260713194323.GC3133966@ziepe.ca>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260714060628eucas1p1de9b3680fe41ab77cb6ab5e0681da787
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1
X-EPHeader: CA
X-CMS-RootMailID: 20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
	<CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
	<yq5av7argr65.fsf@kernel.org>
	<fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
	<20260713194323.GC3133966@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_230635_841577_BD94738E 
X-CRM114-Status: GOOD (  13.15  )
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

On 13.07.2026 21:43, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 03:03:48PM +0200, Marek Szyprowski wrote:
>> I'm fine with merging on top of the topic branch and I assume that this
>> patchset is mature enough to give it a try in linux-next, but first I
>> would like to get a review or at least acks from others with good CC
>> knowledge or experience.
> I think it is good to go from a CC perspective, there are still some
> more items to fix up (like the MMIO) but I'd rather they be followups
> at this point.

Great. Aneesh, any chance You could send v8 with the remaining items fixed till end of this week? I will be happy to push it to dma-mapping-for-next for testing in linux-next asap.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


