Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D6CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbnO/+sq+8ONZt0KTeFBgfHeWWE3a0C0n2e4rSAYFr8=; b=TLbJkw0Y54MpjiCVR0Nhb0ikbD
	ul/oK6xcwr2xj1Mn0p8hjOkYUolVp/t3/SNwuyQGcICwiYA+lB4HCawmoXlJqg4lNNpumxmghDdu5
	NuL8d0/aVkI5qNX9QHCf+hcfjpis31J8GkpL/TF1fCMgjn0TpsRZmo+pcfHOyQzEZpcfW4H3iO7LP
	sFH2sX4/0T8rXw9XK5os6BBJQlD2Dcf+Pzneizx6wcMLT27gVEDTikKFWAY8ld8+3HzLsJvUxpmqj
	Zh43HzNVrTiVGyexMKlAJ11J/GFCqLqEm+zcOJ4NNdU3gpVW0J5VOn13HwW5CQxyGm086agdLx/Xs
	AI2eVzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploc-00000004fCH-2zIS;
	Sat, 23 Aug 2025 10:49:43 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upddV-00000003nM5-3ods
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 02:05:43 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250823020530epoutp0371f025a1d78779cdb03d2cf9431d400c~eQyTWp1sX2957829578epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 02:05:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250823020530epoutp0371f025a1d78779cdb03d2cf9431d400c~eQyTWp1sX2957829578epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755914730;
	bh=qbnO/+sq+8ONZt0KTeFBgfHeWWE3a0C0n2e4rSAYFr8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=c1Sv7CnjQKX7XbuXu5Cv9J8czEpU4yZeeYXHw40EN0Eu5XvdvZSojdD3I4dYt3+Zu
	 cSlUyM76qwQrRTwr4iwftmmQ+bb+Lk/DmUxhy5yqgFGLAQR4h5ZA9GzF48v7smFb86
	 qOu6NeKL3Tb0MYeg1v+vlLUwJQYDjzTCjCwczAP0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250823020529epcas5p46c5400dbc26564b90f4d6ffdf82d1e66~eQySihPyI0145101451epcas5p4H;
	Sat, 23 Aug 2025 02:05:29 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c80kw2NSbz6B9m7; Sat, 23 Aug
	2025 02:05:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250823020527epcas5p42973efe25536c7b5da0beb16e98e2cd8~eQyQxE8K70145101451epcas5p4E;
	Sat, 23 Aug 2025 02:05:27 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823020523epsmtip1c66b58ee1eac02d62d96b211baa19c19~eQyNFvkoL1748917489epsmtip1s;
	Sat, 23 Aug 2025 02:05:23 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>
Subject: RE: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Sat, 23 Aug 2025 07:35:22 +0530
Message-ID: <00d401dc13d2$65033080$2f099180$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQHrKQRZAj9O8PIBXjI9/7KIHEcQ
Content-Language: en-in
X-CMS-MailID: 20250823020527epcas5p42973efe25536c7b5da0beb16e98e2cd8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141057epcas5p21ca33641e42164886dc1bf404237876d@epcas5p2.samsung.com>
	<20250814140943.22531-12-inbaraj.e@samsung.com>
	<1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_190542_100876_6FB859EB 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

Thanks for the review.

> 
> Tesla FSD
> 
> You are changing defconfig for all platforms, it's not your personal or
> company defconfig.

I noticed that Exynos and NXP driver configs are added in the defconfig.
Could you please clarify why I shouldn't add my driver config in defconfig?

> 
> 

Regards,
Inbaraj E


