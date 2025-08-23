Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00567CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4VL47xU6rx+wQ2n08ewDHtYA71u+fcU72PN1XkjcTs=; b=Di3fEFtvkTeLMSvZdF+nkX/9LC
	gfj3CbmFZod3wTKo4M2ArsvjbX0Cp4CL0Y39Kx4/0oTHPR+aJu2XnwwehvwDMCHsUffErud+1WWWG
	ytXZR+9QOX0wwTO67AxXH8pvqOtCk7xQsB+3/EbWU1p/+LYcU9wam/mozsWDlGl8WA+7GXFgAB/gg
	X4Vz8DIHJgQgk8RqsfjDHwt1ufP8rgTHDiS3v+aRh4qgn/hpXHsqou/Pp9HyHrtCzYjJFvbv80TXJ
	pLKIJwAYg2nBBFoThNL+W8S6TSJ6e8QD/qALSX8NNPOwuf5sIeLA+d3LwSZK/sqhAfY79KSrbr49T
	Na2typ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upoLh-00000004nwv-2OEo;
	Sat, 23 Aug 2025 13:32:01 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upoJ3-00000004nnw-3eCE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 13:29:19 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250823132913epoutp02e4b5eb9093cfd0b8e0c2ec6abe391fe6~eaHQ18OkN1530115301epoutp026
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 13:29:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250823132913epoutp02e4b5eb9093cfd0b8e0c2ec6abe391fe6~eaHQ18OkN1530115301epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755955753;
	bh=K4VL47xU6rx+wQ2n08ewDHtYA71u+fcU72PN1XkjcTs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Zqa+aqgr+imSZZBsT0bru0TYwGa3siMcTSBKFYiQRw1tY0/xf/ttoe/blfrq3zWlS
	 rFNoK07Bixo0dElM8YQBmB1iH4NGBcVOUfGO+eOEqRHKK6HTRMt1KXT5ET0okw+YfN
	 JhbQoLO3BE0Jrl66CtRrSkrusVcz6d+NyuU9b1HY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250823132912epcas5p19b424584ce8c9b39ceccc4844559ed31~eaHP6t6MI2896228962epcas5p1Y;
	Sat, 23 Aug 2025 13:29:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c8Hvq0wd1z3hhT3; Sat, 23 Aug
	2025 13:29:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250823132909epcas5p2b2f12a18b157c75d531c218373385b91~eaHN0izn-1748017480epcas5p2l;
	Sat, 23 Aug 2025 13:29:09 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823132905epsmtip1ffcc6e00eb7cee72387b6cd5521b3ed0~eaHKHyQoL2663526635epsmtip1z;
	Sat, 23 Aug 2025 13:29:05 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Laurent Pinchart'" <laurent.pinchart@ideasonboard.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>, <shawnguo@kernel.org>,
	<cw00.choi@samsung.com>, <rmfrfs@gmail.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20250818093349.GC5862@pendragon.ideasonboard.com>
Subject: RE: [PATCH v2 07/12] media: imx-mipi-csis: Add support to configure
 specific vc
Date: Sat, 23 Aug 2025 18:59:04 +0530
Message-ID: <00e701dc1431$e839d710$b8ad8530$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQFnLuCBAPSEv1UBKchLdbKY9dyw
Content-Language: en-in
X-CMS-MailID: 20250823132909epcas5p2b2f12a18b157c75d531c218373385b91
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f@epcas5p1.samsung.com>
	<20250814140943.22531-8-inbaraj.e@samsung.com>
	<20250818093349.GC5862@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_062918_366558_B532F2B9 
X-CRM114-Status: GOOD (  13.67  )
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


Hi Laurent,

Thanks for the review.

>=20
> Hi Inbaraj,
>=20
> On Thu, Aug 14, 2025 at 07:39:38PM +0530, Inbaraj E wrote:
> > MIPI_CSIS_V3_3 and MIPI_CSIS_V3_6_3 support streaming only on VC0.
>=20
> That doesn't appear to be true, at least for MIPI_CSIS_V3_6_3. I have a p=
atch
> series that adds VC support for v3.6.3 in the i.MX8MP, and it has been
> susccessfully tested.
>=20

Thanks for the patches. I'll add Tesla FSD CSIS support on top of
Your patch.

> >
> > +	csis->vc =3D 0;
> > +
>=20
> Dynamic VC selection belongs to this patch, not patch 09/12. 09/12 does t=
oo
> many different things, it has to be split into one patch per feature.
>=20

I'll break down the patches by feature.=20

Regards,
Inbaraj E


