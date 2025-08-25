Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C73CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FzwHF8KuNzlOWaaKrrdM7RTgM5W1jyxUgMxJOzJj4g=; b=Uc9sLAvlSowBh/y/k2QlpbCxQx
	GfArw8OMXDNzdfF/6r6Jm2I56hifi2syl0Or/Voi85Z71TSsJ3ATCk8cidbf6H3pDs36vyYkv5deu
	nxwK/H5ySh27q7TFSKFBaAa8NKmtUZnKG2uEfLiyUzgy1OuomK2RAPBoaWKxMQ8vzWc2dSsaT++Xp
	TeKcMuSqB8vj+KKlxEeizcy6xflFUdyll4lQmiLqLCf574o4ofnGpXEM8LE5zAmWKSb16UiSavzLR
	HdMtKDQo+bft5b8ho99KtqhKnE9r/tfFgIBBKMppBQO0jEUU3nqFXZQi8rLdhHiuVHYbsaVRQ17U7
	/bCH8G1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWiv-00000007zbH-4AVd;
	Mon, 25 Aug 2025 12:54:58 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVtr-00000007rRL-0TYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:02:13 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250825120204epoutp03be07ecc668be684597b6194ac4064589~fANwKt56n0118101181epoutp03P
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:02:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250825120204epoutp03be07ecc668be684597b6194ac4064589~fANwKt56n0118101181epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123324;
	bh=+FzwHF8KuNzlOWaaKrrdM7RTgM5W1jyxUgMxJOzJj4g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=cYziQjLJ2pZX+j8U/8EwOGgqhIx2xStM1PACDs79uontzUR5RP99yKw+VKgpYFIST
	 iZiZ7kYFjO3EFHpwE5NUXlIsjM+DfLCjU4O2fYUXWXFK9eaBufESztX40L1fmjqTQl
	 Kh8kEUycYsqxnrLTktroB9vGuydDz0PqduPadSbo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825120203epcas5p1c6378c60ea36aa87f171b0477956f62a~fANuuWErA2818828188epcas5p1x;
	Mon, 25 Aug 2025 12:02:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9TtL13lDz2SSKZ; Mon, 25 Aug
	2025 12:02:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120201epcas5p2d4daa5629b3552586363349fb30e94e0~fANs7W8Nk0034600346epcas5p2Z;
	Mon, 25 Aug 2025 12:02:01 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825120157epsmtip265a67df65657294b364f9f90edabfe52~fANpJa82N2901829018epsmtip2W;
	Mon, 25 Aug 2025 12:01:57 +0000 (GMT)
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
In-Reply-To: <2eaa1303-79e6-431e-9902-356862357c9f@kernel.org>
Subject: RE: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Mon, 25 Aug 2025 17:31:56 +0530
Message-ID: <015a01dc15b8$1095f0e0$31c1d2a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIMxZSZAiExi2YA0x2iDwJfHwx3AsbuavuyZvR80A==
Content-Language: en-in
X-CMS-MailID: 20250825120201epcas5p2d4daa5629b3552586363349fb30e94e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
	<20250814140943.22531-11-inbaraj.e@samsung.com>
	<c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
	<00e201dc13d7$17d2a750$4777f5f0$@samsung.com>
	<2eaa1303-79e6-431e-9902-356862357c9f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050211_463114_D33BE2A8 
X-CRM114-Status: GOOD (  11.51  )
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

> > According to the HW design of FSD SoC, the control to manage CSIS
> > power is given to a separate CPU where custom firmware runs.
> > Therefore. The Linux side does not control the CSIS power supplies dire=
ctly
> and are hence not included in the device tree.
>=20
> Usually this still means you vote for enabling these resources, at least =
for
> other vendors it is like that. Unless you want to say these are essential=
ly
> always on and CANNOT be disabled ever.

Yes, we want IP to remain enabled permanently, So we are not adding power s=
upply
control in linux.

Regards,
Inbaraj E


