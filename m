Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F16CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3jKOu9b+P0Ih93AICIcneY/oMkTMn7T+Krlp2E8KKA=; b=hhFiXFTsm3UNuLiGCgq4kpwAiS
	w0yT5yawavFBKzXiPEgIzgJD4Jt3ny4TMg3lsgHJIeRGHzlwagfFSymDO4kS1H51xHuenu0C3sqJb
	gMcbhkVicvXDXN8pcx6qVb00c7dRY4VHbKJQHCPfHF9gBJShJkmdC6cUUT9H1A7Tsisg1FwefV3xE
	JA1Blw5iBFwSv8ESwtWpvyrW5w2+PO5qfMB95w0o/TWwVX1Q/jKRmg4iB+vGAQya19r+S1aCe8l1r
	upsEwyyHKXUag0f87Cpfy/pe4oAfxh0CVJ23trtd6oMuhursqkX9uW9/B3Ta3J6EeYA8gZ+5PrdEi
	1O+llPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5g4w-0000000H9AD-03WE;
	Mon, 06 Oct 2025 07:56:18 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5g4q-0000000H98z-3RXR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 07:56:16 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251006075605epoutp02569268e68ea2f8714d0014e4e518df67~r189tOi9r2906029060epoutp02t
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Oct 2025 07:56:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251006075605epoutp02569268e68ea2f8714d0014e4e518df67~r189tOi9r2906029060epoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759737365;
	bh=y3jKOu9b+P0Ih93AICIcneY/oMkTMn7T+Krlp2E8KKA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=F4D8FWIXj/ijjKU7Fj+GximToN7e4DiY0q0oKVkmyNh3sFfuzgBLg+3Fwv+21A/8g
	 l3QSx0pmM3KxioyAccJ3TErPRfOO98ZbHkYNsdQP+2SSnkZNlnjjfqFwc9jMx9W2b/
	 JWACmnEZu08FxzRSomen6pSfhzB+UlIKrNMSy6as=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251006075604epcas5p2340605e3e9393140844ab163feb26c00~r189NvSTp1431114311epcas5p24;
	Mon,  6 Oct 2025 07:56:04 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cgBR75fF4z3hhT3; Mon,  6 Oct
	2025 07:56:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251006075603epcas5p1b56873cad2f305bcdee52ea7c550529f~r187tLzhK0791807918epcas5p1R;
	Mon,  6 Oct 2025 07:56:03 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251006075600epsmtip20e24c5f8001f5c1fad71053ea9c0d0e8~r1842CSE20799907999epsmtip2K;
	Mon,  6 Oct 2025 07:55:59 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <001301dc310c$b7a78550$26f68ff0$@samsung.com>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Mon, 6 Oct 2025 13:25:58 +0530
Message-ID: <000001dc3696$a97bcf10$fc736d30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcDLshEdrQRTsmg
Content-Language: en-in
X-CMS-MailID: 20251006075603epcas5p1b56873cad2f305bcdee52ea7c550529f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<001301dc310c$b7a78550$26f68ff0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_005615_114228_CD9861EE 
X-CRM114-Status: GOOD (  15.50  )
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


=20
> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: 29 September 2025 12:16 PM
> To: 'Pritam Manohar Sutar' <pritam.sutar=40samsung.com>; vkoul=40kernel.o=
rg;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; andre.draszik=40linaro.org; peter.griffin=40linaro=
.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> igor.belwon=40mentallysanemainliners.org; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: RE: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> Hi Pritam
>=20
> > -----Original Message-----
> > From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > Sent: Wednesday, September 3, 2025 1:08 PM
> > To: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> > andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> > igor.belwon=40mentallysanemainliners.org;
> > m.szyprowski=40samsung.com; s.nawrocki=40samsung.com;
> > pritam.sutar=40samsung.com
> > Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linu=
x-
> > kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux=
-
> > samsung-soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > Subject: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: add
> > ExynosAutov920 HS phy compatible
> >
> > Document support for the USB20 phy found on the ExynosAutov920 SoC.
> > The
> > USB20 phy is functionally identical to that on the Exynos850 SoC, so
> > no driver changes are needed to support this phy. However, add a
> > dedicated compatible string for USB20 phy found in this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Hi Alim,
Thank you for RB tag.

Hi Vinod,=20
Addressed comments on phy drivers those were given in patch-set v5.=20
Can you please check and let me know if any other comments?=20

Hi Krzysztof,=20
Please let me know if you want me send v9 by retaining  your RB on=20
patch1 and patch3? Also do let me know if any other concerns need=20
to be addressed?

Regards,
Pritam


