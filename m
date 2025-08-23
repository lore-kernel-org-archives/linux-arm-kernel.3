Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6889CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiQTdOzmRl4diLSEyaAVQbrK02Hybw4ffhxcVsTNGiM=; b=m8LxG4wTlbgxztxkzefKr4h53j
	9Jfv+0kF94hXBGdHovz+CLiO7Aq3q7qgx+5si8/NhAGK3hLrLTCh4YfntH0XKvpcnM4nEcFlds8Am
	oBBdzU/q9kQ619K537rofFgZuvVbdmeDoH2HHchGaH3DqlxTwEWDbNJJtZqnKZ7wQ3inOhMd1Nm/o
	CR6M+OgVD9br8Gd3AenMOWayvP5Yv+z1UoLM5aY6xcApE7j8piScA+XJuMb5k7coTNjiMIa4OCjxY
	CLAo7EcZ2/oqlBFOCxOhKmzYAFPPF9DE3LBRywHbs5q5CNEHOaZzLfm96iqwLvM+NnfslQkUOKa3C
	85/jNGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upo4e-00000004nEO-2Y28;
	Sat, 23 Aug 2025 13:14:24 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upo1y-00000004mvj-1oLI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 13:11:41 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823131131epoutp041687e1ed32e5cce6694339872d13b0bb~eZ30WbWyF2404324043epoutp04-
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 13:11:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823131131epoutp041687e1ed32e5cce6694339872d13b0bb~eZ30WbWyF2404324043epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755954691;
	bh=WiQTdOzmRl4diLSEyaAVQbrK02Hybw4ffhxcVsTNGiM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZiMqRRr9uH/lN4Q0d1TmeATkDKmMvkmfWkes2vqRPPQPWuDbIsAjeH+h2NqYGgfeI
	 qoLXZBflMVx3FF0jlGENgEUoGMeA3g1JPmIZOnkN4xx+/NQ1UqCfYTAVIm6fbMR99B
	 dmH6gzHILcfJAwowyIjlUGDKraQBpeKCUmxmrGqY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250823131130epcas5p43f11088842c7f9b7f44340b05f222777~eZ3zBWwHU3181231812epcas5p4i;
	Sat, 23 Aug 2025 13:11:30 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c8HWP28gCz3hhT3; Sat, 23 Aug
	2025 13:11:29 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250823131128epcas5p3d9a44a02d9295f8c614cf2e14d7c5e50~eZ3xYVpFR0066200662epcas5p3g;
	Sat, 23 Aug 2025 13:11:28 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823131124epsmtip2695fc1d2c6e33945577f3e502b3c925b~eZ3tq6noF1099010990epsmtip2h;
	Sat, 23 Aug 2025 13:11:24 +0000 (GMT)
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
In-Reply-To: <20250818092133.GA5862@pendragon.ideasonboard.com>
Subject: RE: [PATCH v2 05/12] media: imx-mipi-csis: Move clk to
 mipi_csis_info structure
Date: Sat, 23 Aug 2025 18:41:23 +0530
Message-ID: <00e501dc142f$6fa00a10$4ee01e30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIYHCmyAlXzoNQBZbmW2rKGel0g
Content-Language: en-in
X-CMS-MailID: 20250823131128epcas5p3d9a44a02d9295f8c614cf2e14d7c5e50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2@epcas5p2.samsung.com>
	<20250814140943.22531-6-inbaraj.e@samsung.com>
	<20250818092133.GA5862@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_061138_799212_9D0181C7 
X-CRM114-Status: GOOD (  15.91  )
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
> On Thu, Aug 14, 2025 at 07:39:36PM +0530, Inbaraj E wrote:
> > clock names in NXP SoC's is different from the FSD SoC. Inorder to
>=20
> s/clock/Clock/
> s/Inorder/In order/
>=20
I'll change in next patchset.

> Is the difference really a matter of SoCs, or is it because the FSD SoC u=
ses a
> different version of the IP ?
>=20

Yes, it is dependent on the version of the IP.  Thanks for pointing it out.=
 I'll update commit
description accordingly.

> I also suspect that the =22phy=22 clock was added by mistake, and isn't n=
eeded in
> NXP SoCs. Could you please check and confirm if the v3.3 and
> v3.6.3 versions of the IP have an input PHY clock ?

I don't have manuals for v3.3 and v3.6.3, So I cannot confirm  this.=20

>=20
> > extend this driver to use for FSD SoC. Move the clock names to
> > mipi_csis_info structure.
> >

Regards,
Inbaraj E


