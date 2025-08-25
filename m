Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D01CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3ggiGG3zGwf6IwROz+KzPW9tQZQRZy1LRUC1d2oO7M=; b=VP15BlmP7DE8l0Rmyxhx64i83H
	hKccE964qE2snEvL+5vaRC1BHPu+bKMoUasctO2Fcbc9r7PaYMlaXbA4I5B0TEWyRQigxY7RE5e4G
	O+mY1XvQ5qU1H4DmDY5nKqJ2skdfYca8HXMsb9q/TH3VB5SHwWHzDdGywzMKgcooT09omLEjRE/KE
	3WBlyUdrFeDoiB3/8IcmQTOn60ScQiXYT8k1558QiqHLTRRnmmGInM6w3Z3/GOkgZVjBTBEACbtOy
	zWtQmkpYvATPzE6+D3YnUoPUYUK2Nuts9TJcrAiFPYVdbLT4bNIPG6x550hvwYU0gyNPqdn9BX+cM
	6DYItriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYey-00000008LCn-1YK8;
	Mon, 25 Aug 2025 14:59:00 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWab-00000007xGN-1Ce0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:46:23 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250825124615epoutp019275e6a8912a40fdd4a29c7fe4a1cc87~fA0VOiVxH0085500855epoutp01K
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:46:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250825124615epoutp019275e6a8912a40fdd4a29c7fe4a1cc87~fA0VOiVxH0085500855epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756125975;
	bh=B3ggiGG3zGwf6IwROz+KzPW9tQZQRZy1LRUC1d2oO7M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bsTLrN2fmBI3qons8febwMl4Kuo6F04Wrr59HZpCwC+XWAHKvlUECmiO5eosy6067
	 L9iKzGVTrP0s2rKPCBIBrOPo8T4CwvYrjbED1UdLZCm6RRw/isyaO9+qLvdggTuOM7
	 AMkoneyn0EQBttsRbgpkDEfgZL3rA/wY+au2vK/Y=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250825124614epcas5p2ae7004efd1bd437a7c96737bb944d2df~fA0T3T3Eb0139601396epcas5p2h;
	Mon, 25 Aug 2025 12:46:14 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c9VsK3Nzhz3hhT4; Mon, 25 Aug
	2025 12:46:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250825124612epcas5p1bd59a975b75029ee366a424379ad6dee~fA0SV3_FU1396413964epcas5p1g;
	Mon, 25 Aug 2025 12:46:12 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825124608epsmtip2bfc35ca4c6d5c979e37d4c4cca04ef7c~fA0Oi-Efs2384823848epsmtip2R;
	Mon, 25 Aug 2025 12:46:08 +0000 (GMT)
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
In-Reply-To: <4af38093-007e-4bfc-8439-0c3dc84012d8@kernel.org>
Subject: RE: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
Date: Mon, 25 Aug 2025 18:16:07 +0530
Message-ID: <016201dc15be$3d032ca0$b70985e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQLOIzgLAmiUCqAC0LEeUQJu3YaUAdjFWtWyVbegcA==
Content-Language: en-in
X-CMS-MailID: 20250825124612epcas5p1bd59a975b75029ee366a424379ad6dee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1@epcas5p1.samsung.com>
	<20250814140943.22531-13-inbaraj.e@samsung.com>
	<b1f59033-12d0-4395-85f1-e296a5dbca5f@kernel.org>
	<00e301dc1424$033ed5a0$09bc80e0$@samsung.com>
	<4af38093-007e-4bfc-8439-0c3dc84012d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_054621_633296_6668776C 
X-CRM114-Status: GOOD (  24.26  )
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

> >> Even more questions why?
> >
> > If CONFIG_PM is enabled, the clocks are enabled manually in the driver
> > through fsd_csis_runtime_resume API.
> >
> > If CONFIG_PM is enabled, the clocks are managed through the PM runtime
> > framework.
> >
> > Can you please help me understand what wrong here?
>=20
> I think I see such code for the first time, so wrong is doing something
> common in completely unusual way.
>=20

Driver should ensure a device can be also used normally when runtime
PM is disabled. So enabling clocks manually in probe, if CONFIG_PM is
disabled.

A Couple of other drivers also doing it in same way
drivers/media/platform/nxp/imx-mipi-csis.c and=20
drivers/media/platform/samsung/exynos4-is/fimc-core.c

> >
> > I'll fix in next patchset.
> >
> >>> +
> >>> +	ret =3D fsd_csis_async_register(csis);
> >>> +	if (ret)
> >>> +		goto err_media_cleanup;
> >>> +
> >>> +	return 0;
> >>> +
> >>> +err_media_cleanup:
> >>> +	fsd_csis_media_cleanup(csis);
> >>
> >> Also this...
> >>
> >
> > if fsd_csis_media_init fails, the cleanup is handled internally.
>=20
> What does it mean internally?

I mean that in case fsd_csis_media_init fails, the cleanup of resources is =
handled
Within the same function itself.

>=20
> > Here, cleanup is used only for fsd_csis_async_register failure.
> >
> > can you please help me understand what is wrong here?
>=20
> Yeah, you leak clock resources.

I'll fix in next patchset

Regards,
Inbaraj E


