Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F239CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4C5v6Mam7mfoOZt+/Uk2fNaLUuqcHXWmVmMPWM4nmI=; b=lsMY3DPKt+WoxX8EeXa5rzksSC
	tMaHbpTgt1ybbxi9ll3g267CnABlU7PcqKf3bWNEV9DortNm7NHAawZSv3hq3tazyEtt5BWzuvSDw
	4hU2VM+XQCdAKhk1XzZY2sHNYkSfEDr4sQ8+UGQnTleR686r7tbjagpU1n84esQAmhol04JWwbCxr
	4YawyDWaAjaWGwjpSGEwUhilHxGicGMrPkUo2oTMKfT2JGWRtCpMs9j/xFkcraaExKoZ7XgVCStNJ
	0r0v4O4Ge4Shz6IIYDz2vXcEWIJfCRyx4wNh8ynxeHO+7+QI70+jnfh2mbF9geisBFkC6XpquczJs
	6AxSFT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upke3-00000004STs-1LwW;
	Sat, 23 Aug 2025 09:34:43 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSGk-00000002h2J-0k7H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:57:28 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822135716epoutp02ce557a98f8db832cb79f0e35c531888c~eG2e1t-Ec2808328083epoutp02H
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 13:57:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822135716epoutp02ce557a98f8db832cb79f0e35c531888c~eG2e1t-Ec2808328083epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755871037;
	bh=W4C5v6Mam7mfoOZt+/Uk2fNaLUuqcHXWmVmMPWM4nmI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jwvOoxx+0UkR29FGHjt3nZB44roEkqCrPy3UV4AxVKwtIX37Oul0uvkstC1WMv2Jq
	 EVKhVqqQcxDJBxtEAtUas3cMR818eJ/xFBm1R+98ywV0zAFG1JpHKkCARpXGj0ZOLa
	 6w0XRyIrH69pEU8cfi4QLo0K4EXFLxqOhao5xbfs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250822135716epcas5p18bd9dbea2d4c64fddf513df96cf206a8~eG2eIJ28p2289722897epcas5p1m;
	Fri, 22 Aug 2025 13:57:16 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7hZg1tPyz6B9m4; Fri, 22 Aug
	2025 13:57:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822135714epcas5p1061155a3eaf18a8843e73652afbcfe52~eG2ckacBH1755517555epcas5p1I;
	Fri, 22 Aug 2025 13:57:14 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822135710epsmtip1545b9b7689f40f6c2351d8d4952539fc~eG2Y0A9DZ0796007960epsmtip1e;
	Fri, 22 Aug 2025 13:57:10 +0000 (GMT)
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
In-Reply-To: <1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Fri, 22 Aug 2025 19:27:09 +0530
Message-ID: <00d101dc136c$aa037020$fe0a5060$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXx7J94PTA
Content-Language: en-in
X-CMS-MailID: 20250822135714epcas5p1061155a3eaf18a8843e73652afbcfe52
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
	<20250814140943.22531-5-inbaraj.e@samsung.com>
	<1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_065726_535310_02783978 
X-CRM114-Status: GOOD (  15.53  )
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

>=20
> On 14/08/2025 16:09, Inbaraj E wrote:
> > There is a csi dma and csis interface that bundles together to allow
>=20
> CSI DMA?
> What is CSIS?
>=20
> > csi2 capture.
>=20
> CSI2?

CSIS stands for Camera Serial Interface Slave.

Samsung v4.3 CSIS IP bundles both the CSIS link operation and the CSIS
DMA operation. The DMA-related operation are referred to as CSIS DMA and
are handled by the fsd-csis driver. The link related operations are
referred to simply as CSIS and are integrated into imx-mipi-csis driver.

I'll update the commit message and commit description accordingly,
and maintain consistency across the patches.

>=20
> >
> > Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> > ---
> >  arch/arm64/boot/dts/tesla/fsd-evb.dts =7C  96 +++++
> > +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > =40=40 -493,6 +493,558 =40=40 clock_mfc: clock-controller=4012810000 =
=7B
> >  			clock-names =3D =22fin_pll=22;
> >  		=7D;
> >
> > +		mipicsis0: mipi-csis=4012640000 =7B
>=20
> Messed ordering. See DTS coding style.

I'll fix the ordering in next patchset.

>=20
> Node names should be generic. See also an explanation and list of example=
s
> (not exhaustive) in DT specification:
> https://protect2.fireeye.com/v1/url?k=3Da30d23f8-c28636dd-a30ca8b7-
> 74fe485cbff6-ee12f8a711c584c8&q=3D1&e=3Db96506d8-2d5d-4303-b9e8-
> 0e1189db1585&u=3Dhttps%3A%2F%2Fdevicetree-
> specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-
> basics.html%23generic-names-recommendation
>=20

There is no generic name directly related to CSI apart from camera. That's
why I used mipi-csis. If preferred, I can move the name to csis or simply c=
si.
Please let me know which one is more appropriate.

Regards,
Inbaraj E


