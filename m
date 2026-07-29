Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A7C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+0LXEe7UlZ4qE3eCV8kvgvRPi2NEvsLxrOQzLx6Yvk=; b=ihQ3KOzVO/EmwOOQE1K5uizU9O
	NC6a5M61MgJwx3LVt5Awvh+qH6kxvEGPSEDchhfOOvpfjrKfHb20fVYGR+lvNycuCjyI+2RRcm6XU
	2T41QvZHKALM+eyoSfwNAY1fni1sIn8pnBTLeRGgGXKVYG+eoRjS3vPgupUz7cq34kxX3hR1wDkx/
	ZST2gxTVxRCwKXpsErCzQ+5HzoB9X2hlSRcq2mBcDHs/xeyJkPri7ONLCl/essENTPWt/Y/vuTc1P
	g1puBz89YLctXpWZwEw5pWlWsWSacnNDW5uEFOI75xb1DKePnmXc4n6lCERqcUYnpvMYwd67H2xKH
	pnyyF0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowbJ-00000006umK-36mL;
	Wed, 29 Jul 2026 05:13:05 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowbF-00000006uln-2Una
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:13:04 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260729051255epoutp033d513f9b641b00e91d66a1567c6b4003~Gqq--RZ1J1811818118epoutp03d
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:12:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260729051255epoutp033d513f9b641b00e91d66a1567c6b4003~Gqq--RZ1J1811818118epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785301975;
	bh=v+0LXEe7UlZ4qE3eCV8kvgvRPi2NEvsLxrOQzLx6Yvk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ImEz2bE2DQwyOlD9ImSCB6sD71ilIpBKhuZMl+YqhySZZjNjJTCMiAfKW1pikGDhc
	 XL6eqv4+D9ETaHYa08bBGil3RWwzJf3Uz83sXXPaKBgfZTZwwgyxM0oDmFC7QCpOkc
	 dbcq8TIH/nUzENW8M2/zqBhC5Khqi+yAW+2wsQEY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260729051254epcas5p1dbd4553584214715ce68952415a0e4b4~Gqq-iW52o2997629976epcas5p1c;
	Wed, 29 Jul 2026 05:12:54 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4h90pF5GGYz3hhT9; Wed, 29 Jul
	2026 05:12:53 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260729051253epcas5p13c6aaadd8335f3a07aba4f2e53cc10c5~Gqq_A6A3d1861518615epcas5p1C;
	Wed, 29 Jul 2026 05:12:53 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260729051250epsmtip2c6d7f586025d0da44e0e2bfeaf1ba87d~Gqq7-YRyG0581705817epsmtip2X;
	Wed, 29 Jul 2026 05:12:50 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Alexandru Chimac'" <alex@chimac.ro>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Peter	Griffin'"
	<peter.griffin@linaro.org>, "'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Brian Masney'" <bmasney@redhat.com>,
	"'Rob Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260722-exynos9610-clocks-v3-3-c672a2a30889@chimac.ro>
Subject: RE: [PATCH v3 3/5] clk: samsung: clk-pll: Add support for pll_1061x
Date: Wed, 29 Jul 2026 10:42:49 +0530
Message-ID: <07e101dd1f18$e83ab2a0$b8b017e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHTw+ptVoCYShTtVq94NkBsvgZUugKcCweMAdasPym2cxLvQA==
Content-Language: en-us
X-CMS-MailID: 20260729051253epcas5p13c6aaadd8335f3a07aba4f2e53cc10c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260722204419epcas5p4199c800b0a94ff523f0e9e9c5aaeeaba
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
	<CGME20260722204419epcas5p4199c800b0a94ff523f0e9e9c5aaeeaba@epcas5p4.samsung.com>
	<20260722-exynos9610-clocks-v3-3-c672a2a30889@chimac.ro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_221302_315657_334C73B3 
X-CRM114-Status: GOOD (  16.91  )
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

Hi Alexandru

> -----Original Message-----
> From: Alexandru Chimac <alex=40chimac.ro>
> Sent: Thursday, July 23, 2026 2:14 AM
> To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Peter Griffin <peter.griffin=40linaro.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Brian
> Masney <bmasney=40redhat.com>; Rob Herring <robh=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; Alexandru Chimac <alex=40chimac.ro>;
> Krzysztof Kozlowski <krzk+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: =5BPATCH v3 3/5=5D clk: samsung: clk-pll: Add support for pll_10=
61x
>=20
> These PLLs are found in the Exynos9610 and Exynos9810 SoCs, and are simil=
ar
> to pll_1460x (using CON3 instead of CON1), so the code for that can handl=
e
> this PLL with a few small adaptations.
>=20
It is good to mention that PLL_1061x is a fractional type PLL and used to s=
upply BLK_MMC and AUD, atleast on 9610 SoC

> Signed-off-by: Alexandru Chimac <alex=40chimac.ro>
> ---
>  drivers/clk/samsung/clk-pll.c =7C 29 ++++++++++++++++++++++-------
> drivers/clk/samsung/clk-pll.h =7C  1 +
>  2 files changed, 23 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.=
c index
> e74552846ba3..2cda87235fa2 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> =40=40 -781,15 +781,20 =40=40 static unsigned long
> samsung_pll46xx_recalc_rate(struct clk_hw *hw,
>  	u64 fvco =3D parent_rate;
>=20
>  	pll_con0 =3D readl_relaxed(pll->con_reg);
> -	pll_con1 =3D readl_relaxed(pll->con_reg + 4);
> -	mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & ((pll->type =3D=3D
> pll_1460x) ?
> +	if (pll->type =3D=3D pll_1061x)
> +		pll_con1 =3D readl_relaxed(pll->con_reg + 0xc);
Actually this is PLL_CON3 in UM, not suggesting to use a new variable but a=
 comment here will help.=20
Thanks=21


