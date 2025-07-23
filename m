Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEOfka7o20zIZPmyJjhDlnK3FdIZ1ayZnAmiWFOAY8o=; b=s4u0dw7IyjAk0OQD0sOBB4raWP
	Zh1iXG2yS5v6SvYV9GUzZRvlf2jHxVQn3W/GNSwwk4aqZp4rAADmQmKutbJOW38lPFajcmwx5pTYG
	6hhhtTeOeqth84j2Tu65G+QTwXlzHaR6Ppf+rUpXSDOXDg5w0WMiRsQROGQI8vUqgIvZynoCvy8XS
	XBIUWhgdwZGVccF48UvCkS7VuS6UyGwJjP8bNz2WhsNEIcDRR7sRQGE/CbLKn85Aebsby9eivd7Aa
	4ADFoI9NQEv2vn9JCU55vVZOWtU69qJwZvdXY1xKtuetiqVkLJ+2LXqKRLK3lhMZWjnQdPST24f2h
	GFLmDkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZG4-000000050MP-2wrX;
	Wed, 23 Jul 2025 13:11:45 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYqY-00000004wHQ-1RbV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:45:26 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250723124516epoutp022eccc6b3f3aacb0ba089b1e18366ef5c~U4hC0E6mw1406514065epoutp024
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 12:45:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250723124516epoutp022eccc6b3f3aacb0ba089b1e18366ef5c~U4hC0E6mw1406514065epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753274716;
	bh=PEOfka7o20zIZPmyJjhDlnK3FdIZ1ayZnAmiWFOAY8o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Th3ykaYLsbUr7KCPyz3pnLe7ntpQviosxGR/2/NTX7YjsIa2F6uvGG4/t8bK2qXi6
	 +7KYSWEKgoP+QUS/P1ZtifH1h4YMgmiBvknkZH2QImhHyU2qDjLbf0tW2ADHno+lLk
	 KQa+ncSUwSb50Qbsz0xYXyxOlH4+NZjURykH1CZE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250723124515epcas5p1aaf594fdd1861aef3eb2f4883c0973b8~U4hBuY4AX2230822308epcas5p1z;
	Wed, 23 Jul 2025 12:45:15 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bnDPQ1b3Qz6B9m6; Wed, 23 Jul
	2025 12:45:14 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250723124513epcas5p40a7150ee82c674eb479589288323da54~U4hAQiFXe2820028200epcas5p4a;
	Wed, 23 Jul 2025 12:45:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250723124510epsmtip201e2e3138007aeaccacf564c5214f1c8~U4g9PPG5e2748727487epsmtip2V;
	Wed, 23 Jul 2025 12:45:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Pritam Manohar Sutar'"
	<pritam.sutar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@linaro.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <neil.armstrong@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef@kernel.org>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Wed, 23 Jul 2025 18:15:08 +0530
Message-ID: <2a1901dbfbcf$a21b45e0$e651d1a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAqwCML2yKAWUlSf8CRPacEQIi1iyNAmb2xVkCD/Nw+wC0VRd5AgU5Triy3GiwIA==
X-CMS-MailID: 20250723124513epcas5p40a7150ee82c674eb479589288323da54
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>
	<20250701120706.2219355-2-pritam.sutar@samsung.com>
	<20250706-fresh-meaty-cougar-5af170@krzk-bin>
	<07d301dbf0ae$0658cbe0$130a63a0$@samsung.com>
	<9a2d0ad7-cb1f-473d-a91a-3a1b59b71280@kernel.org>
	<000c01dbf70b$ccdbf630$6693e290$@samsung.com>
	<a43cfe4f-8ff9-4dbd-b7f4-07ccc3d8e01b@kernel.org>
	<00ff01dbfac1$ee528860$caf79920$@samsung.com>
	<9a97cc9e-2221-44d6-83e9-25b1bec10a6f@kernel.org>
	<000901dbfb90$42873060$c7959120$@samsung.com>
	<6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_054524_623056_66E68443 
X-CRM114-Status: GOOD (  20.54  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, July 23, 2025 2:13 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; 'Krzysztof
> Kozlowski' <krzysztof.kozlowski=40linaro.org>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
=5Bsnip=5D
> >>>>> Ok got it. Will change supplies name as below avdd075_usb =3D>
> >>>>> avdd075-usb
> >>>>> avdd18_usb20 =3D> avdd18-usb20
> >>>>> avdd33_usb20 =3D> avdd33-usb20
> >>>>>
> >>>>> Confirm the above change that is meant in terms of DTS style.
> >>>> Yes. I have doubts that actual supplies have suffix usb20. Are
> >>>> there more than one avdd18 for this block?
> >>>>
> >>>
> >>> Yes, there are more than one vdd18 supplies for this block.
> >>
> >> And their names are?
> >>
> >>>
> >>> Re-analysed your comment on adding new supplies.
> >>> Going to re-use existing supplies as mentioned below, rather than
> >>> introducing new supplies
> >>>
> >>>   dvdd-usb20-supply   =3D> for 0.75v
> >>>   vddh-usb20-supply   =3D> for 1.8v
> >>>   vdd33-usb20-supply =3D> for 3.3v
> >>
> >>
> >> You just expect us to guess whether this is correct...
> >
> > Sorry about not being clear so far.
> >
> > V920 needs three supplies, 0.75v, 1.8v and 3.3v for USB PHY The naming
> > convention used in the schematic are avdd075-usb, avdd18_usb20,
> > avdd33_usb20.
> >
> > However, PHY's user manual just mentions DVDD, VDD33 and VDD18.
>=20
>=20
> Then dvdd, vdd33 and vdd18.
>=20
> > Since GS101 binding already using supply names similar to what is
> mentioned in the PHY user manual.
>=20
>=20
> GS101 has USB 2.0 and DP, thus the suffix made some sense. I think you ha=
ve
> only USB 2.0, that's why I question the suffix.
>=20
I cross checked the schematic of v920 SADK, this is a combo PHY which suppo=
rt USB-3.0 as well.=20
=40 Pritam
Schema should capture all the supplies including USB-3.0, similar to GS101 =
(which has USB2.0 and DP combo).
So that would be as below:
dvdd075-usb20-supply
vdd18-usb20-supply
vdd33-usb20-supply
dvdd075-usb30-supply
vdd18-usb30-supply
please cross check the supply at your end and do the needful.=20

>=20
> Best regards,
> Krzysztof


