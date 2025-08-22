Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682E5CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1nIEzQAHzexEwe1eBw6VP9QOhuA5DOvKet0k5mUpZU=; b=DcKT5KjxfK7oCGJK26pa0FcyCA
	pkOQ/V7cq5bi0QvUOb9fpq2N1PipKAiUOx4n+X2HGVJT1I32Xr7SD8lUhfWLWHN78wW0rttjN/K5x
	ikjB/NXOenyo4UivjfDBMQv3I1XrQBAYC+IqFj3wHcjzGN6Os/uU5m52mpFw27HTSAR5xJoCx2UmM
	YeFNf33izUXms9AeS+LkmDXve74z5cm2swstg+apCoob6a7Al61oPPywtcOW6tctUm+uO6puEOB0C
	SngqhhgOMplkjbBZrJY1OB+UHuRxaQhpNUWAzg9Nd4DBNuXdNIPr/d9nJ9JJmcgxbIrmFdQZO8C29
	3cnFBeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upke2-00000004SS8-2qtT;
	Sat, 23 Aug 2025 09:34:42 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRzi-00000002eR7-28YY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:39:52 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250822133945epoutp015cbc5046e2679532bb52b826ce3919fb~eGnLIpjHf0583705837epoutp01T
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 13:39:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250822133945epoutp015cbc5046e2679532bb52b826ce3919fb~eGnLIpjHf0583705837epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755869985;
	bh=u1nIEzQAHzexEwe1eBw6VP9QOhuA5DOvKet0k5mUpZU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YpMiv/9zvNnJVVTqDCQFz8ApOBDdjhGp5prNSGmskCpeGTCMbkWiyn3wFR5uZuKXD
	 J8bh6I+edk0r0H1aJ8MTy2GLsjoE3hQcgepGQ+L9bfurpJbtGDWb1soIpc0GV/w/lc
	 dKW1V/MRwVJlxcj/SO9oZASAAVnPikD0WB2KRNNg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822133943epcas5p3db3194b4f778165c369f994cc9fb349f~eGnKIRpRe2325823258epcas5p3h;
	Fri, 22 Aug 2025 13:39:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7hBR05d6z6B9m4; Fri, 22 Aug
	2025 13:39:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250822133942epcas5p37a9e03d4cefed84c9f458f47b648d929~eGnIVLNXg2325823258epcas5p3c;
	Fri, 22 Aug 2025 13:39:42 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822133937epsmtip1fcccb1ff7946a18f9bda033b67ce9139~eGnEmK2i82772327723epsmtip1D;
	Fri, 22 Aug 2025 13:39:37 +0000 (GMT)
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
In-Reply-To: <ac9769af-9ab6-4b48-9890-ec3bcda3b180@kernel.org>
Subject: RE: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD
 SoC
Date: Fri, 22 Aug 2025 19:09:36 +0530
Message-ID: <00d001dc136a$36ad7230$a4085690$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQF6bLd9AsRKNAMBJ/ZVhLKIV+Nw
Content-Language: en-in
X-CMS-MailID: 20250822133942epcas5p37a9e03d4cefed84c9f458f47b648d929
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063950_864393_F68AE8B1 
X-CRM114-Status: GOOD (  23.66  )
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
> Explain the hardware.

I'll explain in the next patchset.

>=20
> >
> > Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> > ---
> >  .../bindings/media/nxp,imx-mipi-csi2.yaml     =7C 88 ++++++++++++++---=
--
> >  1 file changed, 68 insertions(+), 20 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > index 03a23a26c4f3..802fb1bd150d 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > =40=40 -14,7 +14,7 =40=40 description: =7C-
> >    The NXP i.MX7 and i.MX8 families contain SoCs that include a MIPI CS=
I-2
> >    receiver IP core named CSIS. The IP core originates from Samsung, an=
d
> may be
> >    compatible with some of the Exynos4 and S5P SoCs. i.MX7 SoCs use
> > CSIS version
> > -  3.3, and i.MX8 SoCs use CSIS version 3.6.3.
> > +  3.3, i.MX8 SoCs use CSIS version 3.6.3 and FSD SoC uses CSIS version=
 4.3.
> >
> >    While the CSI-2 receiver is separate from the MIPI D-PHY IP core, th=
e PHY
> is
> >    completely wrapped by the CSIS and doesn't expose a control
> > interface of its =40=40 -26,6 +26,7 =40=40 properties:
> >        - enum:
> >            - fsl,imx7-mipi-csi2
> >            - fsl,imx8mm-mipi-csi2
> > +          - tesla,fsd-mipi-csi2
>=20
>=20
> Isn't this Samsung CSI IP?=20

Yes, it is Samsung CSI IP.

Why are you adding it to NXP?

Samsung CSIS IP core present in Exynos(samsung/exynos4-is/mipi-csis.c) seri=
es is
completely different from the one in the Tesla FSD SoC. However, it is comp=
atible
with the samsung CSIS IP used in the NXP SoC. For better code reusability, =
I am
integrating it with the NXP imx-mipi-csis driver.

=20
> Nothing in commit, msg helps me to understand that.

I'll explain the same in commit description as well.

>=20

> >        - items:
> >            - enum:
> >                - fsl,imx8mp-mipi-csi2
> > =40=40 -38,24 +39,21 =40=40 properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    minItems: 3
> > -    items:
> > -      - description: The peripheral clock (a.k.a. APB clock)
> > -      - description: The external clock (optionally used as the pixel =
clock)
> > -      - description: The MIPI D-PHY clock
> > -      - description: The AXI clock
> > +    minItems: 2
> > +    maxItems: 4
> >
> >    clock-names:
> > -    minItems: 3
> > -    items:
> > -      - const: pclk
> > -      - const: wrap
> > -      - const: phy
> > -      - const: axi
> > +    minItems: 2
> > +    maxItems: 4
> >
> >    power-domains:
> >      maxItems: 1
> >
> > +  samsung,syscon-csis:
>=20
> samsung, so not nxp. Even more confusing.
>=20

I used samsung,syscon-csis because the system controller on Tesla FSD
follows Samsung's sysreg design.

>=20
> Best regards,
> Krzysztof

Regards,
Inbaraj E


