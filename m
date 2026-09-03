Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 03:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxQCmTNMct1DRhOL2zkVSmPzrkHNVIa3V+xEsZNmDLo=; b=nktSbYul/ZomwcEv84+5GgPJH9
	qEMrpdHGqemX9KYeu2fNiTuL+5vjt8Pigs+7nmJ/xsngzjaB3sG7ch6pP3raaw+kDU5CAt16ld+tF
	n1IjCeGn5jlZGyVi+lovMPsL3aMdb+TGUjEEqbKiaeqBQNyCMTZ9M+uWDJc7jIiKoeIKqU1G/plIs
	01Ol3ymMDaCGLNJAval18beB0XXdHEQKiEtccGskihsikj1N8q0kTWJxk9g5idOpRg8je79iNNW4B
	VhTa/QDzT43um4xybQC3+pkgTuHbbUW8TojXpeIr/InI7PSMovEDuslAJ7ducBGxvUVBWh2PdvKGN
	8tfaX9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yMa-0000000GI6V-3Igp;
	Thu, 03 Sep 2026 03:43:44 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yMT-0000000GI54-2jn9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 03:43:43 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260903034328epoutp043f7ae32b8853e4c8b441bb5d7094afaf~RsrLtS0K92513625136epoutp04b
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 03:43:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260903034328epoutp043f7ae32b8853e4c8b441bb5d7094afaf~RsrLtS0K92513625136epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788407008;
	bh=hxQCmTNMct1DRhOL2zkVSmPzrkHNVIa3V+xEsZNmDLo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=X55mDB+o3vq/x9sQQI0kgJmccvhvqmrDBVLetGnJ5rysGFps+x9Z5pg7e7DEXHRPL
	 2/0SyS3NM44wZzXZXqvahQaKVflAHUL/zLeWNphMMxl2hTsWm6SPg144C/7xDZOZAj
	 sP9cSdln4Wrv0RDmhF5uwlfamEGNLhGR+3orqEH0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260903034328epcas5p2d368d9a3526cfa324b3ace3ce9cf3757~RsrLRYlZE1311513115epcas5p2y;
	Thu,  3 Sep 2026 03:43:28 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hb56R0c1hz6B9m5; Thu,  3 Sep
	2026 03:43:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45~RsrJ4OnTk0546505465epcas5p3j;
	Thu,  3 Sep 2026 03:43:26 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903034324epsmtip19d32848c86f1eb6807590d3a4e492a0c~RsrHrhGP81548715487epsmtip1D;
	Thu,  3 Sep 2026 03:43:24 +0000 (GMT)
Message-ID: <a258af80-c15c-4adf-84ea-c5b0067e5247@samsung.com>
Date: Thu, 3 Sep 2026 09:13:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
To: =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>
Cc: akash.m5@samsung.com, alim.akhtar@samsung.com, andre.draszik@linaro.org,
	dh10.jung@samsung.com, jh0801.jung@samsung.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	muhammed.ali@samsung.com, neil.armstrong@linaro.org,
	peter.griffin@linaro.org, pritam.sutar@samsung.com, thiagu.r@samsung.com,
	vkoul@kernel.org
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20260902000439.25379-1-kernel@lvkasz.us>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45
References: <20260831070309.158069-1-selvarasu.g@samsung.com>
	<20260902000439.25379-1-kernel@lvkasz.us>
	<CGME20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_204338_341809_1D9A7E39 
X-CRM114-Status: GOOD (  15.57  )
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


On 9/2/2026 5:34 AM, Łukasz Lebiedziński wrote:
> I tested this on my Samsung Galaxy A6 (Exynos7870) with this patch applied
> on top of mainline. I wanted to verify the OOB read first before trusting
> this fix, so I forced the device tree to request PHY index 1
> (phys = <&usbdrd_phy 1>;) - this index does not exist for this SoC,
> because the phy_cfg_exynos7870[] array contains only one entry. I added
> a temporary pr_info() call after assigning phy_cfg in the probe loop to
> display the phy_isol/phy_init values using %pS:
>
>    i=0 phy_isol=exynos7870_usbdrd_phy_isol+0x0/0x60
>        phy_init=exynos7870_usbdrd_utmi_init+0x0/0x260
>    i=1 phy_isol=exynos5_usbdrd_phy_isol+0x0/0x50
>        phy_init=exynos5_usbdrd_utmi_init+0x0/0xc8
>
> For i=1, both function pointers resolve to the exynos5_* variants
> instead of the exynos7870 ones - the OOB read lands right on
> the adjacent phy_cfg_exynos5[] array in .rodata. No crash occurs, since
> these garbage pointers happen to point to valid (though unrelated)
> kernel functions rather than something invalid.
>
> With the patch applied, the same debug print shows the loop correctly
> stopping at n_phy_cfg=1; i=1 is never reached. Boot and USB both work
> fine on the actual PHY index (0).
>
> Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>

Thanks for your testing and update.

Thanks,
Selva
>

