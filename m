Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429ECC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaQSVSoO7FdZ/KRmR5xRUM1DG4A8RjH7vN64i+7mIjk=; b=QQtF3795uN2Th4gqGSsOgcL+Fb
	XblSRX48dZvAx9bW1x/kWlIhd9fmGZvdBcc0nP6CaUWP3HC0yKC7eK3WDxLRtxNOtOUjuewg+iKZP
	oc1MJV1CacswyNUc5HSrPiYpNtAal7JzdAAU/QVZ6SgOsrB4yHxDoWhs3vrXlutkulgI1rNurfiAC
	PcZQmkV6i/6JziwK5ZeXCnHE48npuRU3rfooiBt97DULF0jj/289W1WlTcEjudM/rF0aitfuu9mLI
	fGGXnEyrqWZ6SlroPdCGDOjGv+6RqVOd+ucQv+ZThvwRJN2iBayCmRWcXbJ/7bbuPkElRefuVqcEV
	rbHB3PDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu53u-00000001bpq-1k8E;
	Mon, 17 Mar 2025 07:39:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu52B-00000001bY3-1LOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:37:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250317073709euoutp02daf9854c41cc75f907c8cef458653ce8~thve1eRh91761017610euoutp02c
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 07:37:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250317073709euoutp02daf9854c41cc75f907c8cef458653ce8~thve1eRh91761017610euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742197029;
	bh=ZaQSVSoO7FdZ/KRmR5xRUM1DG4A8RjH7vN64i+7mIjk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sB6XMZ1a3zCFHqHN2N6WcZG8i0jVhDZcTfhl0Jz5VpF21POpERGjNvWs/678kIFEq
	 p14WY3N80aTlMN7dyIAE7WXWXug01cPsX5SEKc4sHcp3Hdyl1yDCXEdd2smVdkIeK4
	 v/LSbOm+Zssndv8I2JFVHr/fj5scOI94UL4fGh9g=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250317073708eucas1p20eada3facfb94d6fcbe1104a02cc23e3~thvehokGl1243412434eucas1p28;
	Mon, 17 Mar 2025 07:37:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id F6.09.20409.421D7D76; Mon, 17
	Mar 2025 07:37:08 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250317073708eucas1p154688365792efe9f9e0218c7cb1b61ef~thveF8WtG1588615886eucas1p1K;
	Mon, 17 Mar 2025 07:37:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250317073708eusmtrp2874930c163fff0f8144c0f647ac13950~thveFEXaL2757927579eusmtrp2N;
	Mon, 17 Mar 2025 07:37:08 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-bc-67d7d1241ad3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 4E.B3.19654.421D7D76; Mon, 17
	Mar 2025 07:37:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250317073705eusmtip1511ad27da5e39e2b81aad31d6b360a1e~thvbOSoZn3052930529eusmtip1M;
	Mon, 17 Mar 2025 07:37:05 +0000 (GMT)
Message-ID: <cdc333e4-25bb-4171-9f6e-01f1de947db3@samsung.com>
Date: Mon, 17 Mar 2025 08:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Stuart
	Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun
	Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Joerg
	Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Bjorn Helgaas
	<bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Charan Teja Kalla
	<quic_charante@quicinc.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <b63ff6b4-9dc3-42ea-8b87-d4fdead8d0eb@arm.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzv2ftjL7PRy8DjERNqIUV3QRjePXdwXKVXb5eelnmdnWUL3oYX
	G7Q5NfOCBCTevAMhGAxhhJzrkNwYRZuRtOGYgHIiJ3ALQXQVwo0fMkAhXIx3Fv99vp/v9/P9
	fL7PPRQmqSUjqIPKQ6xKKcuQkiK8peNhz0vRvQPyl8c4hOpPpKOJ8mkS6S/3ECj3rJFENmul
	EC16ESqsMgmRt7gbR9ZRD4kMl4oAMt/tJ1DfxTMkulbjJJG97DeA8v7Jw1GFJQ7N3SvHkVGv
	QNXeMgz5Wi1CZJt2E4izL6+sbXJhyNBlwVHe0NZXNzBuW42Ayb+xTDKNNY2A6evvxRir7paQ
	qTVrmLzLHoIxNxSSTFt1o5Bprs9mxporAdM0aREwp1u/YmbNkbuDPxAlp7EZBw+zqviUj0Xp
	pplZkFWw8WjRYgeRAybWcyCIgnQi/KvvqoADIkpC/wBgyXwFyRdeAG87rYHOLIBVjhHBY0n7
	6UsE3zAA6Cw1Ar6YAfDct23APyWmU2DDyWXCj3F6MxzOnSJ5PgR2VrpxP15PR8ERV4XQj0Pp
	PXCSu7O6KIw2E3Ag/+qqBUb/CaDp5uCqGqPDocutX81B0gmQ83CrfBCdBLVLVpyfiYK5P1dh
	fjGkq0Wwbs4n5INvh522JcDjUDju/CnAPw19Vr2AFxQAWLs0EiiKAcz52xVQJMGhnsUVO2rF
	IhYaL8bz9GuQmy3D/DSkg+GgJ4QPEQxLWrQBWgy/OSnhp2OgznnhP1vb9RtYMZDq1jyMbs2Z
	ujXn6P73rQV4AwhnNWqFnFVvUbJH4tQyhVqjlMelZirMYOUTdz9yei3AMD4TZwcCCtgBpDBp
	mBi3DMgl4jTZF8dYVeYBlSaDVdvBRgqXhovr2vLlElouO8R+xrJZrOpxV0AFReQI9jseoZIE
	/YcvXNh3Yh8BnlN1OZR7hraZClVFhuPB5N1kpdJ2e1ir6Jze1PTjg5bYzb3k2/ffTz1Q0b5h
	7/ldmTXHFj9Nei/JxS28kt1T0xom/a68j52w9UuKqocnNa0745uoN7qOurZ93zf2gGpIDC2Z
	IkoPd0eu+1zmSb4lkjSWGrf8Kn6zeW77J8mewd66L6WTqdrradoex7OnBI6Q0XciF16PUmx6
	65f2a74Y1TMdRFFXWBZ4imzO1kz5dqbn7zi+/48nfj91ZCHtPFe/46wxOnVr0E1pypWYdyOE
	soem2K/Hn5Qs0fOJe+9NrGMNu55PEEef+8hpuDI/WuALuVPqdd+X4up0WcKLmEot+xfEUw3r
	MwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsVy+t/xu7oqF6+nG2xZLWmxpCnD4vW0D2wW
	84+cY7VoXryezeLgzpnsFr++WFh0zt7AbvFlwmkWi50P37JZLN/Xz2ix6fE1VovLu+awWZyd
	d5zN4tDUvYwWLX9aWCxm7NCz+PpyGovF+vm5FnO/TGW2+L9nB7vFwQ9PWC26Dv0FGrvxFrPF
	8lM7WCxa7pg6SHo8OTiPyaP10l82jzXz1jB6XL52kdlj56y77B4LNpV6tBx5y+qxaVUnm8f+
	uWvYPTYvqfd4sXkmo8fGdzuYPCbuqfP4vEkugC9Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
	xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PDx8+MBe3SFf2/jrE2ML4W7WLk5JAQMJE4PHEf
	axcjF4eQwFJGiSuTL7BDJGQkTk5rYIWwhSX+XOtigyh6zyjx/PMKZpAEr4CdxKq2v2BFLAKq
	Evea37NBxAUlTs58wgJiiwrIS9y/NQNsqLBAsMS7rkeMIINEBLaxSlybt5MZxGEWeMoo8eX8
	M6g7bjJLXNyxG2wss4C4xK0n85lAbDYBQ4mut11gKzgFrCWm/97JAlFjJtG1tYsRwpaXaN46
	m3kCo9AsJJfMQjJqFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAhMPNuO/dyy
	g3Hlq496hxiZOBgPMUpwMCuJ8LLsuJ4uxJuSWFmVWpQfX1Sak1p8iNEUGBwTmaVEk/OBqS+v
	JN7QzMDU0MTM0sDU0sxYSZyX7cr5NCGB9MSS1OzU1ILUIpg+Jg5OqQamrNcHz8tY7L+6y1/q
	yhefWQ967DalqXfJz28Ru2tU8qG9+OAezgZvoYXzFEM/7ft4THrpHcP4Z66vtTyr9GTMWvce
	mfvyo6yxrNfljxbaZx7rBR2SzVfSaP/tz/Bpf3aSwuP7L65VRTioV+c1+Jvz/W60vmu17d7p
	+h1/Hlw1FZ7RrblXaWN0hWKQ/vvKmIdnlnz2twizzA2MXSWg/v5qj+SXrVsUd7i3mDvZbHl7
	mNHhSdmZu9nLJZk1+RTZGMQjNZ4bmJySi29csXGOAvva2Syz5vgtdHXYn2LvckEzymaHuFmV
	76HGKQKNfxTu3Pv7NVt40kTZHVafY80/1SZWONueWa+xOXOL5PkNVu1KLMUZiYZazEXFiQBz
	uCxsxQMAAA==
X-CMS-MailID: 20250317073708eucas1p154688365792efe9f9e0218c7cb1b61ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250313095633eucas1p29cb55f2504b4bcf67c16b3bd3fa9b8cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250313095633eucas1p29cb55f2504b4bcf67c16b3bd3fa9b8cd
References: <cover.1740753261.git.robin.murphy@arm.com>
	<e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
	<CGME20250313095633eucas1p29cb55f2504b4bcf67c16b3bd3fa9b8cd@eucas1p2.samsung.com>
	<9b358d68-332e-404e-9a75-740297f7b28d@samsung.com>
	<417d6f59-0d78-4e81-ad0b-e06846f786b0@arm.com>
	<bf2adf5d-1432-4bb7-846c-e1bcfa84858b@samsung.com>
	<016bb7ca-f0d3-464e-ac74-46e6f78e90d7@arm.com>
	<b63ff6b4-9dc3-42ea-8b87-d4fdead8d0eb@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_003716_743614_30BCB658 
X-CRM114-Status: GOOD (  20.75  )
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

On 13.03.2025 15:12, Robin Murphy wrote:
> On 2025-03-13 1:06 pm, Robin Murphy wrote:
>> On 2025-03-13 12:23 pm, Marek Szyprowski wrote:
>>> On 13.03.2025 12:01, Robin Murphy wrote:
>>>> On 2025-03-13 9:56 am, Marek Szyprowski wrote:
>>>> [...]
>>>>> This patch landed in yesterday's linux-next as commit bcb81ac6ae3c
>>>>> ("iommu: Get DT/ACPI parsing into the proper probe path"). In my 
>>>>> tests I
>>>>> found it breaks booting of ARM64 RK3568-based Odroid-M1 board
>>>>> (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts). Here is the
>>>>> relevant kernel log:
>>>>
>>>> ...and the bug-flushing-out begins!
>>>>
>>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>>> 00000000000003e8
>>>>> Mem abort info:
>>>>>      ESR = 0x0000000096000004
>>>>>      EC = 0x25: DABT (current EL), IL = 32 bits
>>>>>      SET = 0, FnV = 0
>>>>>      EA = 0, S1PTW = 0
>>>>>      FSC = 0x04: level 0 translation fault
>>>>> Data abort info:
>>>>>      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>>>>>      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>>>>      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>>>> [00000000000003e8] user address but active_mm is swapper
>>>>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>>>>> Modules linked in:
>>>>> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc3+ #15533
>>>>> Hardware name: Hardkernel ODROID-M1 (DT)
>>>>> pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> pc : devm_kmalloc+0x2c/0x114
>>>>> lr : rk_iommu_of_xlate+0x30/0x90
>>>>> ...
>>>>> Call trace:
>>>>>     devm_kmalloc+0x2c/0x114 (P)
>>>>>     rk_iommu_of_xlate+0x30/0x90
>>>>
>>>> Yeah, looks like this is doing something a bit questionable which 
>>>> can't
>>>> work properly. TBH the whole dma_dev thing could probably be 
>>>> cleaned up
>>>> now that we have proper instances, but for now does this work?
>>>
>>> Yes, this patch fixes the problem I've observed.
>>>
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> BTW, this dma_dev idea has been borrowed from my exynos_iommu driver 
>>> and
>>> I doubt it can be cleaned up.
>>
>> On the contrary I suspect they both can - it all dates back to when 
>> we had the single global platform bus iommu_ops and the SoC drivers 
>> were forced to bodge their own notion of multiple instances, but with 
>> the modern core code, ops are always called via a valid IOMMU 
>> instance or domain, so in principle it should always be possible to 
>> get at an appropriate IOMMU device now. IIRC it was mostly about 
>> allocating and DMA-mapping the pagetables in domain_alloc, where the 
>> private notion of instances didn't have enough information, but 
>> domain_alloc_paging solves that.
>
> Bah, in fact I think I am going to have to do that now, since although 
> it doesn't crash, rk_domain_alloc_paging() will also be failing for 
> the same reason. Time to find a PSU for the RK3399 board, I guess...
>
> (Or maybe just move the dma_dev assignment earlier to match Exynos?)

Well I just found that Exynos IOMMU is also broken on some on my test 
boards. It looks that the runtime pm links are somehow not correctly 
established. I will try to analyze this later in the afternoon.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


