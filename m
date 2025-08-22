Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5221BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3q54JPaEsRJCyuS492x1saEps2lZA8otnLyPxGwJho=; b=P7J69VGPt/CC/YUllz+rmorvFg
	Y1Ikmgw47aDqriK1/4sfxyBbLLhvb5K/KLW+iCffW2xipMqtYNEzx6KWeiDo+BKxzbvJb5PMhIG5Z
	Kp4BL4iCtiX08gznYx30krdjZaNSYURKU9Al5+tnkDpDAbnjnE/843o216GvBLhvJsuThS0zAqLze
	qZ5ZaE+6ADXpmw+nIOk5W1yKl/p6/CCIRrE52TTaof6uTgLku85ZqsecYiEwkDPyUbYqAvztXKIMA
	GlWqqNJqZzbSbT70IriOJBdjGWg4y6Ej7Q01+syDMJD2EKeHEtHf5qNWP5broChbxQkpvFCVJYhi9
	0L7NM7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upke4-00000004SV6-02Cp;
	Sat, 23 Aug 2025 09:34:44 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSJp-00000002hg1-1dwN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:00:38 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822140035epoutp02baaaf8890d8260afe97dd3f2c933ec8a~eG5Xr9p9O0400704007epoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 14:00:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822140035epoutp02baaaf8890d8260afe97dd3f2c933ec8a~eG5Xr9p9O0400704007epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755871235;
	bh=I3q54JPaEsRJCyuS492x1saEps2lZA8otnLyPxGwJho=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=LmWYTT7GwhV60aof6ADr7N8Qd+vuTM1Yx6Yz4T4eUYslzQhwlZ2vY/87kkEaoEP4m
	 27Y3Tc1gAAsTnHRJdKQYUdsCibPG5AmIXryNyn4tZ60K7UQzpbflukgVZ0TmOr92+n
	 0pPd767wl1aL9sOR8ckwStNPa1OG9Y/yg3cm/lJc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822140033epcas5p3fa5e592a3ee6654a259180b9d8f4a8de~eG5WT2gdF1315513155epcas5p3f;
	Fri, 22 Aug 2025 14:00:33 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7hfT0FH1z2SSKY; Fri, 22 Aug
	2025 14:00:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250822140032epcas5p23047c7ce5a1f89ab6a7c5a564c2529db~eG5Ur29Ct0779907799epcas5p23;
	Fri, 22 Aug 2025 14:00:32 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822140028epsmtip251a4acc1d4fb38f8f1054d3e0d6c3567~eG5Q_y8uc3153031530epsmtip25;
	Fri, 22 Aug 2025 14:00:28 +0000 (GMT)
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
In-Reply-To: <7b7f6958-3178-4c6f-8be3-f52ef77464f7@kernel.org>
Subject: RE: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD
 SoC
Date: Fri, 22 Aug 2025 19:30:27 +0530
Message-ID: <00d201dc136d$1fdd6bc0$5f984340$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQF6bLd9AsRKNAMBJ/ZVhAEp+FCyAvdCX9qyZ1l58A==
Content-Language: en-in
X-CMS-MailID: 20250822140032epcas5p23047c7ce5a1f89ab6a7c5a564c2529db
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946@epcas5p4.samsung.com>
	<20250814140943.22531-4-inbaraj.e@samsung.com>
	<ac9769af-9ab6-4b48-9890-ec3bcda3b180@kernel.org>
	<00d001dc136a$36ad7230$a4085690$@samsung.com>
	<7b7f6958-3178-4c6f-8be3-f52ef77464f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_070037_745937_E0979EFF 
X-CRM114-Status: GOOD (  10.65  )
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

> On 22/08/2025 15:39, Inbaraj E wrote:
> >>>
> >>>    power-domains:
> >>>      maxItems: 1
> >>>
> >>> +  samsung,syscon-csis:
> >>
> >> samsung, so not nxp. Even more confusing.
> >>
> >
> > I used samsung,syscon-csis because the system controller on Tesla FSD
> > follows Samsung's sysreg design.
>=20
> OK, this is property for Tesla though, so please use tesla prefix.

Using tesla,syscon-csis results in a =22prefix not found=22 issue when runn=
ing dtbs_check

Regards,
Inbaraj E


