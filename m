Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA37CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KW/opvHx16r3s1Vc5ZpK1xznEfLK8QH9H6s4kzsVEA=; b=hJfQiN7OEu9YzBv8yxZpPPlnnT
	hPP0O21HA1LJbWLwI79D4HmTBe33OKiqB7TL5U25aR4YrnCAWbL82mHTZpf/2CrzNsq5h/cKMD3Lq
	dAwckUw/5PD4LIsNW4k2dZxMfQOA/pMyl681M/a980uKKQNleM/DDX+oCloE5y41Jul7TkwJ5pMtJ
	9c4J/OnIVHGiajMK0RK9W6iBFJsPhQELkgm5H9eRgf1stVtoMApK3ZqKNYPfZlMIS5eblM3/pScLy
	mR1IfJYUUspGIlF91dPUC5wUOiayKqV0s8ETg4xWG7H1Bg10IbzLj+8f7SQhDif7L3joo4tlcQXEX
	6HaMy4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1fbW-00000006LYh-2sOB;
	Thu, 25 Sep 2025 06:37:22 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1fbS-00000006LSI-2duo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 06:37:20 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250925063713euoutp01777707bd29761217e67e02c191a547ca~ocx9taMbi2960229602euoutp01r
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:37:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250925063713euoutp01777707bd29761217e67e02c191a547ca~ocx9taMbi2960229602euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758782233;
	bh=1KW/opvHx16r3s1Vc5ZpK1xznEfLK8QH9H6s4kzsVEA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Jih2lDjBlJNmf5n3R8rFB9UiHzAVNyJGnEEezwa4oL8EJYZXWhXLH0gNeRAhTetw5
	 /iokn0kMt24A6FsC/JMLedoA/pulEj6tl9siUnVmp9dLwptzs47WjfvFGxSfamzGkR
	 Jn3CBQqEjZ6E+ZvB+i8w7nEAl4zYtOqk7wnhrPqo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250925063712eucas1p2af67fe7f4ea8b8af33874bfaba09fb02~ocx9TqQsg2841228412eucas1p2s;
	Thu, 25 Sep 2025 06:37:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250925063711eusmtip1f9c8523f8b0305612b38794be3d45926~ocx8VlJBi1105611056eusmtip1T;
	Thu, 25 Sep 2025 06:37:11 +0000 (GMT)
Message-ID: <5f69200c-0cce-4b7b-85df-8b9d37960269@samsung.com>
Date: Thu, 25 Sep 2025 08:37:11 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: William McVicker <willmcvicker@google.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aNQnszeIfeHjx3GS@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250925063712eucas1p2af67fe7f4ea8b8af33874bfaba09fb02
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-EPHeader: CA
X-CMS-RootMailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
	<20250827102645.1964659-1-m.szyprowski@samsung.com>
	<8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
	<d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
	<6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
	<aNQnszeIfeHjx3GS@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_233719_253649_853820E2 
X-CRM114-Status: GOOD (  17.85  )
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

On 24.09.2025 19:17, William McVicker wrote:
> On 09/24/2025, Daniel Lezcano wrote:
>> On 19/09/2025 23:31, Marek Szyprowski wrote:
>>> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>>>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>>>> For some unknown reasons forcing percpu interrupts for local timers
>>>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>>>>> flag only when driver is compiled for newer ARM64 architecture.
>>>>>
>>>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>>>> I am pretty sure the patch above was not tested on arm32, thus this
>>>> workaround seems reasonable.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Daniel, any chance to get this merged?
>> The patch does not apply. However it is not your fault but a glitch in the
>> previous pull request and the regression found in the Exynos MCT.
>>
>> Apparently, Thomas had to drop the entire pull request while I thought he
>> dropped only Will's changes.
>>
>> A pull request with the previous changes for v6.17-rc1 and with the new
>> changes for v6.18-rc1 is about to be emitted but without the Exynos MCT
>> changes for the modularization. That means your change does not apply
>> correctly anymore on the current changes.
> Is there somewhere I can check to see which changes will be re-sent? I don't
> see them in the timers/drivers/next branch. Will it be patches 2-4 plus the
> fixes for the section mismatch and this new IRQ fix? Once that's all sorted
> out, I'll base the new modularization patches on top of that.

The problematic mct patches are still in linux-next, merged via tip tree 
by commit 9703240ef617 ("Merge branch into tip/master: 
'timers/clocksource'"). What are the plans to resolve this?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


