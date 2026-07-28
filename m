Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A7EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u18OpmMkdiCW14g1NwN+jnaY5zYme2aVS4kqFmp8n04=; b=vydgnvnrrjSKIVZdB3qdJ32V66
	hle1aqHI3QjyVjHo9aoTKVD9oFVs7gxE2Exn1YydpptP1X2uodwn2/wprYHlv6xqaEn+tDlb53y3y
	Unfn9RwZlRKw7A7ZFPjR417okHtL2M0PA/qFwbu1e1W2j4BGbaUxloFMGN6d6vmqO7OZ7cpsoGDhl
	RD0YL7ECXpc73f11lU/3cFlmpDud9vZbVu/HnTlqL/Pyn91JKdHxWNgG8iDPRJMxTbS2ABWcvO4S0
	geJs0MSutC0CKtb3RFwFM2Zxj/JioLbgpBzYvbu0xiRHRyAkjvqDqs8ZRtPOw3Mk5I0xVFG+Bbw7o
	b2PLAqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogqf-00000005EGl-1jqw;
	Tue, 28 Jul 2026 12:23:53 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogqb-00000005EF8-1Uwh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:23:52 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260728122344epoutp02309756cdac593f1a8e16b9daeb07f451~Gc53fvumD1476914769epoutp02_
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:23:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260728122344epoutp02309756cdac593f1a8e16b9daeb07f451~Gc53fvumD1476914769epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785241424;
	bh=u18OpmMkdiCW14g1NwN+jnaY5zYme2aVS4kqFmp8n04=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lrM4uw/MZPKOtLHZLr/bqAcpm1/GAH3Gk273zuubUIUuS8CSxM+2wHEKJ+2Mtx+qX
	 vqN80lfmnLxJclwHM27Kh1q7PekgnqOaFs0hLcZ7RDsh6GujY2v9737sl5glpBV/8v
	 2/RD5Bk1uHVzrUm8EDoiFm6xf3Pl+YdffYJcmz/I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260728122343epcas5p21644d762ad9601d5d8a2e9893b80774d~Gc52ev98B2625826258epcas5p2c;
	Tue, 28 Jul 2026 12:23:43 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4h8ZPp1Gs5z3hhT7; Tue, 28 Jul
	2026 12:23:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728122341epcas5p2208334e2a1e6bfd9217cb91d356c505e~Gc507Mp3y2212822128epcas5p2r;
	Tue, 28 Jul 2026 12:23:41 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260728122338epsmtip2b0f2f4703e943b619c9d5c67dae1e357~Gc5ye5xAg2311323113epsmtip22;
	Tue, 28 Jul 2026 12:23:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'raghav.s'"
	<raghav.s@samsung.com>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<peter.griffin@linaro.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<bmasney@redhat.com>, <robh@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>
Subject: RE: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
Date: Tue, 28 Jul 2026 17:53:37 +0530
Message-ID: <079201dd1e8b$eca22680$c5e67380$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygMlHcTpAvLC774CITPxw7XZSnaQ
Content-Language: en-us
X-CMS-MailID: 20260728122341epcas5p2208334e2a1e6bfd9217cb91d356c505e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115256epcas5p38cbcfe68218d08301d237705388e6e62
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115256epcas5p38cbcfe68218d08301d237705388e6e62@epcas5p3.samsung.com>
	<20260728121111.2077860-5-raghav.s@samsung.com>
	<8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_052350_099654_08EFD357 
X-CRM114-Status: GOOD (  14.00  )
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

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, July 28, 2026 5:30 PM
> To: raghav.s <raghav.s=40samsung.com>; s.nawrocki=40samsung.com;
> cw00.choi=40samsung.com; peter.griffin=40linaro.org;
> alim.akhtar=40samsung.com; mturquette=40baylibre.com; sboyd=40kernel.org;
> bmasney=40redhat.com; robh=40kernel.org; conor+dt=40kernel.org
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; hajun.sung=40samsung.com;
> is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH 04/13=5D arm64: dts: exynos8855: add cmu_top &
> cmu_peric clock DT nodes
>=20
> On 28/07/2026 14:11, raghav.s wrote:
> > Add required dt node for cmu_top & cmu_peric block
> >
> > Signed-off-by: raghav.s <raghav.s=40samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynos8855.dtsi =7C 24
> > ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
>=20
> Please organize your patches in reasonable order. DTS is never in the mid=
dle,
> see submitting patches (both documents) and maintainer-soc profile.
>=20
The thought was to add clks block wise and hence we see DTS coming in betwe=
en but for the other blocks.=20
e.g. patch-2 and 3 adds binding and driver for TOP and PERIC and this patch=
-4 adds DTS.=20
And patch-5 and 6 adds binding and driver for PERIS and patch-7 adds DTS an=
d so on.

Cover-letter should have explained this.=20

Are you suggesting to re-order all the binding first followed by all blocks=
 driver and then add a single DTS for all clock controller?=20

Does current approach helps in review?=20

> Best regards,
> Krzysztof


