Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B88C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV5ZYrj5wE4GOEKRMF/gxoB7LU5gFTUJHkhmU9HyjMA=; b=cdPdvQ7VP4sjCLGEvA9dVgDSCs
	pkgpMSU6E6fxOs95FboSA2Lym01LAd9/AWllT1ADKasFvZSOWnrn0cGpLvQj5hLB7dt2EfJyx97YQ
	IaE6yC+HvVCRkYgxsQz0ZPLn/cUYcmjDrJ5koxnVJ3PVWTdV/txtLWp/HcyMHRMYlWi89ef+KsiSe
	Iu+tviBdbhOzYhS/VjxPUGJWrzWQXYZPCJvG5QHCMyBlRcRh4S0qHWz49Y26uNRQhi1Dhtdgx3a5r
	RN/zsEiN969Vz3V6ggoHN32AMxEpJ0IyWEvC5XNCGxJer9eOypuLQ1RrrxmYBJO4T2VMzDpM0cBic
	hlITXITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOJm-0000000Bdno-0mMJ;
	Mon, 10 Aug 2026 11:37:22 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOJi-0000000Bdlm-3oSG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:37:21 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260810113713euoutp016f3f4b77a2df3bfdc305d031c6984c9a~Kbp97gzYA2148921489euoutp01h;
	Mon, 10 Aug 2026 11:37:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260810113713euoutp016f3f4b77a2df3bfdc305d031c6984c9a~Kbp97gzYA2148921489euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786361833;
	bh=kV5ZYrj5wE4GOEKRMF/gxoB7LU5gFTUJHkhmU9HyjMA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=kN3DxXhiV6A32AfRhNBQCO8Y9H3rbjoYrVAP4Y+RwnGiaH2R4moCILniw2BNmc07i
	 qVDB2xKU0IDVgY36eMntlSkuzEBYinOGgCSE0qA/VEzpbfJWamjWYMHLWeJVGM2Q6c
	 TT41noYxnIJu2mycFyI4SXwKJL3jDjmL5dWuupLA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260810113713eucas1p1b0aa58555e68eca16ad8962462d5afdd~Kbp9wCQhp2359123591eucas1p1b;
	Mon, 10 Aug 2026 11:37:13 +0000 (GMT)
Received: from [106.120.50.46] (unknown [106.120.50.46]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260810113711eusmtip2ac80bb2608e56255c84c347422994fd6~Kbp8OmsY60892908929eusmtip2X;
	Mon, 10 Aug 2026 11:37:11 +0000 (GMT)
Message-ID: <28442500-1d53-4776-bae5-459c3ffc1cc6@samsung.com>
Date: Mon, 10 Aug 2026 13:37:11 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
To: Will Deacon <will@kernel.org>, "Aneesh Kumar K.V"
	<aneesh.kumar@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
	<robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>, Steven Price
	<steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
	Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Petr
	Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>, Dan
	Williams <dan.j.williams@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, Madhavan
	Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <anml6lLRERm1Iv-_@willie-the-truck>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260810113713eucas1p1b0aa58555e68eca16ad8962462d5afdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df
X-EPHeader: CA
X-CMS-RootMailID: 20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df
References: <yq5acxvu2ict.fsf@kernel.org>
	<anXbJ2O4DWgPxCeg@willie-the-truck> <20260807135810.GA200537@ziepe.ca>
	<anX7F7dnKOtAOIIe@google.com> <20260807164734.GE200537@ziepe.ca>
	<anYgXSR4VAi3TpOj@google.com>
	<CGME20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df@eucas1p1.samsung.com>
	<20260807182017.GH200537@ziepe.ca>
	<7d22482f-d5fd-4cf4-9d32-6a54e02f2fbb@samsung.com>
	<yq5av79iiard.fsf@kernel.org> <anml6lLRERm1Iv-_@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_043719_541357_1B0A51CF 
X-CRM114-Status: GOOD (  19.96  )
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

On 10.08.2026 12:20, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 02:59:42PM +0530, Aneesh Kumar K.V wrote:
>> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>>
>>> On 07.08.2026 20:20, Jason Gunthorpe wrote:
>>>> On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:
>>>>> But the whole thing is best effort anyway, the kernel picks
>>>>> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
>>>>> how many devices or how much DMA they do.
>>>>> SWIOTLB memory is wasted if unused so we should be careful around
>>>>> that as it would be the other way around and users would have to
>>>>> decrease it manually.
>>>> Yeah, it is why the arch code shouldn't really be sizing it directly,
>>>> it should be done in common code and, yes, we are probably going to
>>>> have to do something alot smarter to have the common code better
>>>> auto-tune this for the CC case..
>>> What about the $subject patch? I assume that it is still needed to
>>>
>>> restore the behavior that was altered by the "[PATCH v8 00/23]
>>>
>>> dma-mapping: Track shared DMA state through direct, pool and swiotlb
>>>
>>> paths?" patchset?
>>>
>> I would request that we pick this patch to fix the regression described
>> in https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/.
> I really don't think we need it. CCA hardware isn't exactly widespread
> and the KVM host side patches don't appear close to being merged.

Does this mean that the branch for-next/coco [1] won't go to v7.3-rc1?

I've used it as a base for the mentioned DMA-mapping patchset.


[1] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/coco


> We have time to fix this properly, rather than papering over it in the
> arch code.
>
> Please consider this a NAK from the arm64 side on this patch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


