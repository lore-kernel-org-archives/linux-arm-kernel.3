Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F66CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TiR7dGLuJ/tq4eQDQdq/rwZsrr+n8wFDc6W+Ckqzuw=; b=klosDx8pVd9AkeC9gY02gNxc25
	9Nsj4zZ7N0FlGqadv8rrR4H2exghHZIPWpqbpnXJsT4GIhwXTxrgYE8gN8GXlgqo2nT+TvXohG/MM
	kaevxeEjDyfM81wRHVAGAzHYvJ0I5Uhlku0zu2zt48voN7NcPhwcgwT7IcBXCTqMVzK0XZ91t3dSO
	c1KEJ6F2xM7F+z1O9PZ6ozcSUdqKBewMXTh/OZJVmCFql/9VeD+G62yz28NLVF+jTuWPwQ/4VsRXl
	XPjBnxluKH2aX/azo/sLajFhWQ5pwcNNaJFV2Xc81x0pw3x5Rlmj/h9Hcf88KV5c3eRMQWFMzEloB
	LIwsGabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37gN-00000001WYa-2GmN;
	Mon, 29 Sep 2025 06:48:23 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37gK-00000001WXP-1XZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:48:21 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250929064815epoutp02133c15a41fd1dcb4ffe38c5e10127225~prgven-kN1062810628epoutp02L
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:48:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250929064815epoutp02133c15a41fd1dcb4ffe38c5e10127225~prgven-kN1062810628epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128495;
	bh=8TiR7dGLuJ/tq4eQDQdq/rwZsrr+n8wFDc6W+Ckqzuw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=f5KJ1xZ7ivX42KIaCUmksBu+e7eEdRFhN8kz9NDTGYTv9R+2QG11YwA/BVqm8H8Ws
	 m/51VvtKHY0LT92U7Ax9e0+6/TGw3baJhRu6qqnw+AIZqTghnPd5YFIdZ78kV5Bg+m
	 FZQtLJDQfMCHMavGX+FjtaEYoW+c8Smqeq5nZxIM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250929064814epcas5p166cba3caff64057f60180a7e870930e1~prgu4RX0f0500005000epcas5p1S;
	Mon, 29 Sep 2025 06:48:14 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cZsG563xDz2SSKg; Mon, 29 Sep
	2025 06:48:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929064813epcas5p4c9eabc364711d3c2948e1d42e986a135~prgtWfP532753627536epcas5p4f;
	Mon, 29 Sep 2025 06:48:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064810epsmtip2ab63fcced95b35cd61b01060a0ddeb0a~prgqdJL-D1104111041epsmtip2H;
	Mon, 29 Sep 2025 06:48:09 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250903073827.3015662-5-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Mon, 29 Sep 2025 12:18:07 +0530
Message-ID: <001601dc310d$069ef990$13dcecb0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgFajeyMAXpI9yS0KRFjsA==
Content-Language: en-us
X-CMS-MailID: 20250929064813epcas5p4c9eabc364711d3c2948e1d42e986a135
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072946epcas5p371f7d0e15d8757f738c08f80a8eefb60
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072946epcas5p371f7d0e15d8757f738c08f80a8eefb60@epcas5p3.samsung.com>
	<20250903073827.3015662-5-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_234820_707753_D51C4C45 
X-CRM114-Status: GOOD (  12.73  )
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

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, September 3, 2025 1:08 PM
> To: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com;
> pritam.sutar@samsung.com
> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: [PATCH v8 4/6] phy: exynos5-usbdrd: support HS combo phy for
> ExynosAutov920
> 
> Support UTMI+ combo phy for this SoC which is somewhat simmilar to what
> the existing Exynos850 support does. The difference is that some register
> offsets and bit fields are defferent from Exynos850.
> 
> Add required change in phy driver to support combo HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Thanks!
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


