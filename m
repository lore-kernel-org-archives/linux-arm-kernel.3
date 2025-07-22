Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579AEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 04:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHgbp2zI6pWHBoFSpFNJfPfed8jnhU/boVEitqs7EpY=; b=ou/DmJbJDKHizTFuUh2H5sEXuB
	qEMIF4RLBIIn6w8iv9Wm37orBODrf8wNIEilYVKCPlEVWOOyHFRAgz2AS+rC8xJSMC2YPmSeZw300
	tsSu0CWCe+1PXk/+hyHaBDXxGN/Hn08pPwdCEShQvEX02OW6ww7YKFFSDb5UltTy4VzQMXtoREi6r
	R7Qv6oBr01dXJ2ONVGefvitC4ah+Mjbig0mglvD4P9lAv+/UtylRl9P5ZTMQ46gOVU1X9Fv35HN0o
	2GZRtB+j1wBEfRFuWgb8yDclkWtEVvqpR1BY1nKLP4HL+6f9DNTg+URR2DwqWgYsRGz9+88n/tZPt
	Tp/aYYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue56U-00000001IXx-0kPA;
	Tue, 22 Jul 2025 04:59:50 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue50c-00000001HzG-1Vcl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 04:53:49 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250722045337epoutp03c26700ab9155b77396bdf5b8e5110457~Ueb9lhfAK0440004400epoutp03j
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 04:53:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250722045337epoutp03c26700ab9155b77396bdf5b8e5110457~Ueb9lhfAK0440004400epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753160017;
	bh=oHgbp2zI6pWHBoFSpFNJfPfed8jnhU/boVEitqs7EpY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IVT29UPXc/lyldNPJUfmsb2cWuayt7gQHggZuv2uDnSQJjqqhRY+FHKHT9zVWh2/V
	 6GqzvQeKyMt5jXRMnlQ3KqJ2HOK2UXzf9FCQxavd/7o/74jJwVUk36heqq6A9kWZCr
	 MU9b8nNiJRsMC2dFFbq4A4fdNE35OIlQKsNMnRWM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250722045336epcas5p40ecb63ff167b91f84375d516fef00fa5~Ueb8vawWq0587105871epcas5p4T;
	Tue, 22 Jul 2025 04:53:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bmPzg6htyz2SSKk; Tue, 22 Jul
	2025 04:53:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250722043437epcas5p25e73a61921d2d15cae61388fa042de75~UeLXT5Vxm3047830478epcas5p2G;
	Tue, 22 Jul 2025 04:34:37 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250722043434epsmtip131fb92dc6a6a0c2b894d89da91b3a9ab~UeLUTk9r90921009210epsmtip18;
	Tue, 22 Jul 2025 04:34:33 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@linaro.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <a43cfe4f-8ff9-4dbd-b7f4-07ccc3d8e01b@kernel.org>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Tue, 22 Jul 2025 10:04:32 +0530
Message-ID: <00ff01dbfac1$ee528860$caf79920$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAqwCML2yKAWUlSf8CRPacEQIi1iyNsxPSqvA=
Content-Language: en-in
X-CMS-MailID: 20250722043437epcas5p25e73a61921d2d15cae61388fa042de75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_215347_087618_6C7BB076 
X-CRM114-Status: GOOD (  15.87  )
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

Hi Krzysztof,=20

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 17 July 2025 04:59 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; 'Krzysztof Kozlows=
ki'
> <krzysztof.kozlowski=40linaro.org>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; neil.armstrong=40=
linaro.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 17/07/2025 13:13, Pritam Manohar Sutar wrote:
> >>
> >>
> >> Nothing is explained in changelog/cover letter. You claim you only add=
ed Rb
> tag.
> >> This is an entirely silent change while keeping the review.
> >
> > Will add more explanations in cover letter/changelog why this block is =
added.
> >
> >> Combined with not even following DTS style=21
> >
> > Ok got it. Will change supplies name as below avdd075_usb =3D>
> > avdd075-usb
> > avdd18_usb20 =3D> avdd18-usb20
> > avdd33_usb20 =3D> avdd33-usb20
> >
> > Confirm the above change that is meant in terms of DTS style.
> Yes. I have doubts that actual supplies have suffix usb20. Are there more=
 than
> one avdd18 for this block?
>=20

Yes, there are more than one vdd18 supplies for this block.=20

Re-analysed your comment on adding new supplies.=20
Going to re-use existing supplies as mentioned below, rather than=20
introducing new supplies

  dvdd-usb20-supply   =3D> for 0.75v
  vddh-usb20-supply   =3D> for 1.8v
  vdd33-usb20-supply =3D> for 3.3v

> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam


