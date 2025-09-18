Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCDBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN/3t4hL6cT5/e9+GaAketYE06VkieyzpyBena7YBAU=; b=TpAL5kIhz9xYi8CsHLtOhWxZRN
	708nTY1tHC07nJhe8jmpx9Y5g+ioLu/B8S/mCNDVSn2pwNWDq5h+LqXFOQZkrEGZcZ97X9WKikIT+
	T9iB+XvH8aCAsda+eAjfB/F8cQgGLJSLjFZVgDVW2PimwpH/dNMBegSiTQB5Ld40yUDKAvcFhr6N9
	kl9wxf/Tq5IEJ2KLQ5lUQ5OZq4HX7YephI0WEzlq/Hbk4VyFDfD2lX7SAVaCLullMBLcKxnV3G2zz
	G35bKoR0hRx0TqnbPALgpXnFofrHQHvhIPmwi9zFnr2YCvaGNKNs+Zp2iJjpfpCviXfva/TZ5eOFL
	uKV4K56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDEU-0000000HHsf-0X7v;
	Thu, 18 Sep 2025 11:55:26 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDEQ-0000000HHph-3Mk7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:55:25 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918115518epoutp011881cb5140722c9eb49199d4d663802c~mXmsZrqjb3273532735epoutp01t
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:55:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918115518epoutp011881cb5140722c9eb49199d4d663802c~mXmsZrqjb3273532735epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758196518;
	bh=DN/3t4hL6cT5/e9+GaAketYE06VkieyzpyBena7YBAU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=S03ItJ3IQdQQwzdY9s7ASFakivQ36sIUWXwLO61w8ftRsN53Tb2NXDysnHj+lNj8J
	 FWT2Q/YHjpqwMVS6gWSFjHJL6VFmuy/LWOi3HZQTEzz3ZvPuzdobYeajaewrFVsycQ
	 AWrqjgDRZ7QVjAYQm7x54iHahcVH9gbU7xDXqUfw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250918115517epcas5p3c7dd05a1fae6fff0ce95db44751deea8~mXmrZwiaW3121231212epcas5p3M;
	Thu, 18 Sep 2025 11:55:17 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cSDbS4F1Hz2SSKb; Thu, 18 Sep
	2025 11:55:16 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918115516epcas5p14397d311bb7c6c1f2c0a60109d298bb7~mXmqAPTm12886628866epcas5p1E;
	Thu, 18 Sep 2025 11:55:16 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918115511epsmtip15cafde6c107dd91d89f11e8293e860e4~mXmmGGj6Y0665806658epsmtip1c;
	Thu, 18 Sep 2025 11:55:11 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 18 Sep 2025 17:25:10 +0530
Message-ID: <007801dc2893$18ed4a20$4ac7de60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcA7fJUJrQHWRvw
Content-Language: en-in
X-CMS-MailID: 20250918115516epcas5p14397d311bb7c6c1f2c0a60109d298bb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_045523_496258_F749A94B 
X-CRM114-Status: GOOD (  16.73  )
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

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 18 September 2025 08:15 AM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 03/09/2025 16:38, Pritam Manohar Sutar wrote:
> > diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > index e906403208c0..8d8114eb5660 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > =40=40 -34,6 +34,7 =40=40 properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usbdrd-phy
> >
> >    clocks:
> >      minItems: 1
> > =40=40 -110,6 +111,15 =40=40 properties:
> >    vddh-usbdp-supply:
> >      description: VDDh power supply for the USB DP phy.
> >
> > +  dvdd-supply:
> > +    description: 0.75V power supply for the USB phy.
>=20
> So this is existing dvdd-usb20-supply.
>=20
> Same for all of the rest.
>=20

Yes, we have already discussed this and convergence was to use the=20
conventions which are mentioned in the Data-book. So, I updated the=20
supply names accordingly.=20

Please see the below communications for the same.=20

https://lore.kernel.org/linux-phy/83dc9435-5850-425d-b345-52e84ef9262c=40ke=
rnel.org/
https://lore.kernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef=40ke=
rnel.org/

> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam


