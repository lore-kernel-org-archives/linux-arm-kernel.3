Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E7CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZJZJ33xPZN7YhRnDXzj6QYdPa3pESiJ7l6R5mbj/y8=; b=IpBhhXc5Rp4MnM5CHh0ceFe3Ez
	ZQk4T+lzbdOnHwq2EsDzIJI7gwRn76VFeDxv1k68AUQMSqyZz20j+4w09J6sEUnngxG1uRUXUTxwF
	xABqspjcnVIh8XBQyB5Eo4Q1UuryvQWdKalY7c91FbM08nWv6QOnMeqxPkWgAIGo3N0tdTumfJvJZ
	rNBUHL/A5OZQA6DAQIjzHGcXZ3vOro2JyNyRYydIZ+lxOQVc/U7rDvxeom1Ctocfepq7kye6RrCwG
	AiLtlshoFzIk9nYTjJXNL9gzsoDcJUnISYXjo5y3bNoB9IG1buyWv3JHv4+M+Bu1bPMZpUJHKmBB/
	fWkW99ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpU-000000044DQ-3dQC;
	Sat, 23 Aug 2025 06:34:20 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRd8-00000002b69-1eoO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:16:32 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250822131621epoutp04e68a9e1d925953836b992d3b30138e43~eGSwNlGPY1902319023epoutp04-
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 13:16:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250822131621epoutp04e68a9e1d925953836b992d3b30138e43~eGSwNlGPY1902319023epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755868581;
	bh=9ZJZJ33xPZN7YhRnDXzj6QYdPa3pESiJ7l6R5mbj/y8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PxGRN7kvTKdGM7owi9m91ynX2Bv2hG7D+oiG/X22aQy1vO0iPIOLRXdWW4vVdD8K+
	 Sp0y6q8xArHia/7z/DTgpyJpjO3MlWUhPoeXBhZBKzjGB0YYbQogAsX/FwKpKw8oqw
	 UYPrFvT1zq4NpSpj2+YYC6b6Ukjc4lCjH4qetH9I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250822131620epcas5p4fb8e2cb786224a21ccd3128b8c4bf219~eGSu_iGlk1406114061epcas5p4E;
	Fri, 22 Aug 2025 13:16:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c7ggR2zLSz3hhT4; Fri, 22 Aug
	2025 13:16:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822131618epcas5p170f75240f21ff047898bbaab4188142b~eGStIRSuw0944809448epcas5p11;
	Fri, 22 Aug 2025 13:16:18 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822131614epsmtip1b5ad2e345c8486a50a1145d3feb073b6~eGSpYp5xV1475814758epsmtip1L;
	Fri, 22 Aug 2025 13:16:14 +0000 (GMT)
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
In-Reply-To: <05da83dd-2cd2-4f51-8169-e8cf0190d6c1@kernel.org>
Subject: RE: [PATCH v2 00/12] Add FSD CSI support
Date: Fri, 22 Aug 2025 18:46:12 +0530
Message-ID: <00cf01dc1366$f210a000$d631e000$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHSAysb0EL7RTtQtCp/95MWB/0BNwK5oFMDAeOgCum0Xd0h0A==
Content-Language: en-in
X-CMS-MailID: 20250822131618epcas5p170f75240f21ff047898bbaab4188142b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814140956epcas5p480aa24441933523484da5c241a201d3c
References: <CGME20250814140956epcas5p480aa24441933523484da5c241a201d3c@epcas5p4.samsung.com>
	<20250814140943.22531-1-inbaraj.e@samsung.com>
	<05da83dd-2cd2-4f51-8169-e8cf0190d6c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061630_742513_7BA6EF44 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Krzysztof

> >
> > Changes since v1:
> > 1. Addressed review comments from Laurent Pinchart to integrate the
> > with imx-mipi-csis.c to handle the CSIS and expose it as a subdev.
> >
> > Here is the link to v1 patch for reference:
> > https://patchwork.kernel.org/project/linux-media/patch/7e7832c16925386
> > b771ddb7e00e08661115aa0ea.1668963790.git.sathya@samsung.com/
> 
> Use lore links. b4 gives them for free..

I'll use lore links from next patchset.

> 
> >
> > Inbaraj E (12):
> >   dt-bindings: clock: Add CAM_CSI clock macro for FSD
> >   clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
> >   dt-bindings: media: nxp: Add support for FSD SoC
> >   arm64: dts: fsd: Add CSI nodes
> 
> Please split patches targeting different subsystems, since they are
> completely independent. There is little benefit in combining independent
> work into one huge patchset.

I'll spilt into different patchset according to the subsystem

> Best regards,
> Krzysztof

Regards,
Inbaraj E


