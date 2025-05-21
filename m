Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55130C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QJ3cjEqZU1UJFVrEowYgh2HxNDjNRWao651NAg5LJI=; b=0pmfUHXkeTzfE80YulZCbdojbN
	+/5wSSvRlbfHvBNOkhKemXhFq7IdWfjF6HhD3cqXqdr9F6nopNm4UZcPgiv4wuTjtqyeziTJyWaXi
	Jks6H8cnaWoYKfNNC9GaaQWyL7Iybf1EZkk+kJoWrsweRNB3tD+bfVaMCZK7utRLkW+kDfqE/yV5Z
	XXvtXS5vnyXW5JNPK7CBeRRC0gppCRXsJNS2kb70H6by6RAvL+UwgcNJqTIuUT9Hcz/V0HBODA6Tx
	W+xoh/oJ34WCCRos91qvKa8LOKD5SL78AXMLdjkWKR/MEOvn9dhuPJIdtP1PaJl8sYB/lWR3sihP9
	ADejX+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHenc-0000000F9ig-0QLk;
	Wed, 21 May 2025 08:27:40 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHelV-0000000F9Qu-3CCs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:25:33 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250521082523epoutp04e0dbf63c56f8339293308227fa526f4c~BfVJ4W3BF0702807028epoutp04k
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 08:25:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250521082523epoutp04e0dbf63c56f8339293308227fa526f4c~BfVJ4W3BF0702807028epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747815923;
	bh=9QJ3cjEqZU1UJFVrEowYgh2HxNDjNRWao651NAg5LJI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=eADti6EFUzRNBLHchJl8lPOoqwzan2s6w8U8b5kYvcWZPnVkmXa9gylVQIl5LfbuJ
	 BEbOYtAues/ROtSyFi+g3qYLE1azuqbw35RT9Hwe61g359mgHiKXcxvKijtAQlk771
	 Zty7A+zMdNV7ILDbyJn1PfdNWnjBk2E4ezSNNdMs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250521082522epcas5p2310f2570d3b813b7d8e7e2669edb76d3~BfVJOsz2G2172921729epcas5p28;
	Wed, 21 May 2025 08:25:22 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4b2Pcd13nsz3hhTC; Wed, 21 May
	2025 08:25:21 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250521064841epcas5p13a7f360d243dbc3c1ff1a0051303c769~BeAufbUsD2191921919epcas5p1R;
	Wed, 21 May 2025 06:48:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250521064841epsmtrp1fe7b829e1be5c0aa371ff404fd390dca~BeAuebTWp0935509355epsmtrp1b;
	Wed, 21 May 2025 06:48:41 +0000 (GMT)
X-AuditID: b6c32a29-fda1d2400000223e-0b-682d77494455
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	90.AE.08766.9477D286; Wed, 21 May 2025 15:48:41 +0900 (KST)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250521064838epsmtip214b1d33b1b916e5dac6ae4a1f19bdc59~BeArJG0SU2197721977epsmtip25;
	Wed, 21 May 2025 06:48:37 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <0615877e-247a-419b-b4d6-de377cb40914@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add
 dt-schema for ExynosAutov920
Date: Wed, 21 May 2025 12:18:36 +0530
Message-ID: <000001dbca1c$636ca080$2a45e180$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIiRnTfgkV106HBI/lpdza94uXQvgBQmjeRAP0KzpUC9NC6E7MtksEg
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsWy7bCSvK5nuW6GwZNnShYP5m1js9jyajOL
	xZq955gs7u1Yxm4x/8g5VotrNxayW/z5d57N4mjrf2aLl7PusVmcP7+B3WLT42usFpd3zWGz
	mLDqG4vFjPP7mCzWHrnLbnH+RRerxYYZ/1gs/u/ZwW7x5ecDZovDb9pZLY4s/8hksfPOCWYH
	MY+T6zYzeWxa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugStj2u7VbAUv
	ZStWrfrE2sA4V7yLkZNDQsBEouXJApYuRi4OIYHdjBLbjj5ig0jISDyatpEVwhaWWPnvOTtE
	0XNGidP3vgMVcXCwCZhLzF2nDhIXETjPJPFoxiNmEIdZ4DCTxKcps6DGfmeU6OxvBxvFKWAn
	0bygH2yFsECKxOVPy5lAbBYBVYlpp/uYQKbyClhKLJplAxLmFRCUODnzCQuIzSygLfH05lM4
	e9nC18wQ1ylI/Hy6DGy8iICbxM7WZYwQNeISR3/2ME9gFJ6FZNQsJKNmIRk1C0nLAkaWVYyS
	qQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwfGupbmDcfuqD3qHGJk4GA8xSnAwK4nwxq7Q
	yRDiTUmsrEotyo8vKs1JLT7EKM3BoiTOK/6iN0VIID2xJDU7NbUgtQgmy8TBKdXANNHuf5HQ
	o8rb1z+ev724wKt5kvmrdedY50gJzuJxYvmu2t+Z9Ts25vO6ae9NDzFdZ0k/fsZ99o6YuS+0
	NF1ZnxZKvzu74rrxhMDNamy/7/5qmbe/geNTgmroP7V2pvwTvRWGp5zWxuoYfd3dl5z84PHq
	yLVKN8zSv3ilFLDeFEzbf+T0Aa/zGzcd5HmgILtG7mzR58DEDbLcS593P/ZI9J110Zb10XXN
	JLUJ+XMTZLKeJGxIVT/qfHPRGWe/0yxNttwaXnatP4R5V63R7bsXqPCtSOopo5LltXfbN4VK
	p3JGH3spebLl0Kp7x7TaeI0eaXv9TpOau17edk9S45pDYqX6Mw98MDhbseSNq0LeHyWW4oxE
	Qy3mouJEAP03hn1mAwAA
X-CMS-MailID: 20250521064841epcas5p13a7f360d243dbc3c1ff1a0051303c769
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101800epcas5p49fdae57cdf1fbec0427720ee38b0f925
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
	<CGME20250516101800epcas5p49fdae57cdf1fbec0427720ee38b0f925@epcas5p4.samsung.com>
	<20250516102650.2144487-2-pritam.sutar@samsung.com>
	<0615877e-247a-419b-b4d6-de377cb40914@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_012532_037191_BB19970E 
X-CRM114-Status: GOOD (  22.48  )
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

Thank you for the reviewing the patches.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 20 May 2025 01:15 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 1/2=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd dt-
> schema for ExynosAutov920
>=20
> On 16/05/2025 12:26, Pritam Manohar Sutar wrote:
> > Add a dedicated compatible for USB phy found in this SoC
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C 27 +++++++++++++++++=
++
> >  1 file changed, 27 insertions(+)
>=20
> A nit, subject: drop second/last, redundant =22dt-schema for=22. The =22d=
t-bindings=22
> prefix is already stating that these are bindings in dtschema format.
> See also:
> https://protect2.fireeye.com/v1/url?k=3De78ee20f-b815db03-e78f6940-
> 000babff3563-8256a76d4c2ebd67&q=3D1&e=3D1643274a-07fa-4563-af27-
> b2f2eff30417&u=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.7-
> rc8%2Fsource%2FDocumentation%2Fdevicetree%2Fbindings%2Fsubmitting-
> patches.rst%23L18
>=20

Will update the commit title as below
=22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 compatible=22

> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > index fdddddc7d611..c50f4218ded9 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > =40=40 -32,6 +32,7 =40=40 properties:
> >        - samsung,exynos7-usbdrd-phy
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> > +      - samsung,exynosautov920-usb31drd-phy
> >
> >    clocks:
> >      minItems: 2
> > =40=40 -204,6 +205,32 =40=40 allOf:
> >          reg-names:
> >            maxItems: 1
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-usb31drd-phy
> > +    then:
> > +      =24ref: /schemas/usb/usb-switch.yaml=23
> > +
> > +      properties:
> > +        clocks:
> > +          items:
>=20
> Why there is no main PHY clock?

external crystal clk (ext_xtal) is used as main phy clk.

>=20
> > +            - description: ext_xtal clock
> > +            - description: reference clock
>=20
> Both external oscillator and reference clocks? What are these clocks?

ext_xtal is used as PHY clock to access register and reference clock=20
for PHY operations.

Will add more description in patch.

>=20
> > +
> > +        clock-names:
> > +          items:
> > +            - const: ext_xtal
> > +            - const: ref
> > +
> > +        reg:
> > +          minItems: 1
>=20
> No, there is no such syntax. Drop.

Will remove this

>=20
> > +          maxItems: 1
> > +
> > +        reg-names:
> > +          minItems: 1
>=20
> No, look at existing code and do the same.

Will replace =22minItems=22  by =22maxItems=22

>=20
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
>=20
>=20
> Best regards,
> Krzysztof

Thank you.=20


